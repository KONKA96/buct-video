package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.model.AuditorExample;
import com.model.Logger;
import com.model.SpeakerExample;
import com.service.AuditorExampleService;
import com.service.SpeakerExampleService;
import com.util.ImportExcelUtil;
import com.util.JsonUtils;
import com.util.PageUtil;

@Controller
@RequestMapping("/auditor")
public class AuditorController {
	
	protected Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private PageUtil pageUtil;
	@Autowired
	private AuditorExampleService auditorExampleService;
	@Autowired
	private SpeakerExampleService speakerExampleService;
	
	
	/**
	 * 跳转到听讲者首页
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/toAuditorIndex")
	public String toAuditorIndex(ModelMap modelMap) {
		Subject subject = SecurityUtils.getSubject();
		Map<String,Object> map=new HashMap<>();
		map.put("username", (String) subject.getPrincipal());
		List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);
		modelMap.addAttribute("speaker", speakerList.get(0));
		return "/auditor-list";
	}
	/**
	 * 查询所有听讲者
	 * @param speaker
	 * @param modelMap
	 * @param index
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/showAllAuditor",produces = "text/json;charset=UTF-8")
	public String showAllAuditor(AuditorExample auditor,ModelMap modelMap,@RequestParam(required=true,defaultValue="1") Integer index,
            @RequestParam(required=false,defaultValue="15") Integer pageSize,HttpServletRequest request) {
		Map<String,Object> map=new HashMap<>();
		//查询演讲者角色
		map.put("rolePower", 1);
		
		JSONObject obj = new JSONObject();
		//拼接查询条件
		if(auditor.getUsername()!=null) {
			map.put("username", auditor.getUsername());
			obj.put("username", auditor.getUsername());
		}
		if(auditor.getGroupId()!=null) {
			map.put("groupId", auditor.getGroupId());
			obj.put("groupId", auditor.getGroupId());
		}
		if(auditor.getTruename()!=null) {
			map.put("keyword", auditor.getTruename());
			obj.put("keyword", auditor.getTruename());
		}
		
		//分页查询
		PageHelper.startPage(index, pageSize);
		Page<AuditorExample> auditorList = (Page<AuditorExample>) auditorExampleService.auditorLogin(map);
		
		pageUtil.setPageInfo(auditorList, index, pageSize,request);
		
		
		obj.put("auditorList", auditorList);
		obj.put("index", index);
		
		return obj.toString();
	}
	
	/**
	 * 通过id查询听讲者
	 * 
	 * @param speaker
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/showAuditorInfo", produces = "text/json;charset=UTF-8")
	public String showAuditorInfo(AuditorExample auditor) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", auditor.getId());
		List<AuditorExample> auditorList = auditorExampleService.auditorLogin(map);

		return JsonUtils.objectToJson(auditorList.get(0));
	}

	/**
	 * 对比输入的密码和旧密码是否一致（用户）
	 * @param password
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/testAuditorOldPwd")
	public String testAuditorOldPwd(AuditorExample auditor) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", auditor.getId());
		List<AuditorExample> auditorList = auditorExampleService.auditorLogin(map);
		if(auditorList.size()==0) {
			return "error";
		}else {
			if(new Md5Hash(auditor.getPassword(), auditorList.get(0).getUsername(), 2).toString().equals(auditorList.get(0).getPassword())) {
				return "same";
			}
		}
		return "success";
	}

	/**
	 * 添加、修改听讲者
	 * 
	 * @param auditor
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateAuditor")
	public String updateAuditor(AuditorExample auditor) {
		Map<String, Object> map = new HashMap<>();
		List<AuditorExample> auditorList =new ArrayList<>();
		if(auditor.getUsername()!=null) {
			map.put("username", auditor.getUsername());
			
			if (auditor.getId() != null) {
				auditorList = auditorExampleService.auditorLogin(map);
				if (auditorList.size() != 0) {
					for (AuditorExample auditorExample : auditorList) {
						if (!auditorExample.getId().equals(auditor.getId())) {
							return "exist";
						}
					}
				}
			} else {
				auditorList = auditorExampleService.auditorLogin(map);
				if (auditorList.size() != 0) {
					return "exist";
				}
			}
		}
		
		if (auditor.getId() != null) {
			if (auditorExampleService.updateByPrimaryKeySelective(auditor) > 0) {
				return "success";
			}
		}else {
			if (auditorExampleService.insertSelective(auditor) > 0) {
				return "success";
			}
		}

		
		return "";
	}
	
	/**
	 * 删除听讲者
	 * 
	 * @param auditor
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteAuditor")
	public String deleteAuditor(AuditorExample auditor) {
		if (auditorExampleService.deleteByPrimaryKey(auditor) > 0) {
			return "success";
		}
		return "";
	}

	/**
	 * excel批量上传用户
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "ajaxUploadExcel")
	public void ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		System.out.println("通过 jquery.form.js 提供的ajax方式上传文件！");

		InputStream in = null;
		List<List<Object>> listob = null;
		MultipartFile file = multipartRequest.getFile("file");
		if (file.isEmpty()) {
			throw new Exception("文件不存在！");
		}

		in = file.getInputStream();
		listob = new ImportExcelUtil().getBankListByExcel(in, file.getOriginalFilename());

		int count = 0;
		// 该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
		for (int i = 0; i < listob.size(); i++) {
			List<Object> lo = listob.get(i);
			AuditorExample auditor = new AuditorExample();
			auditor.setSnum((String) lo.get(0));
			auditor.setUsername((String) lo.get(1));
			auditor.setPassword((String) lo.get(2));
			auditor.setTruename((String) lo.get(3));
			auditor.setSex(Integer.parseInt((String) lo.get(4)));
			auditor.setPhone((String) lo.get(5));
			auditor.setGroupId(Integer.parseInt((String) lo.get(6)));

			if (auditorExampleService.insertSelective(auditor) > 0) {
				count++;
			}
		}

		ServletOutputStream out = null;
		response.setCharacterEncoding("utf-8"); // 防止ajax接受到的中文信息乱码
		out = response.getOutputStream();

		if (count == listob.size()) {
			out.print("success");
		} else if (count == 0) {
			out.print("error");
		} else {

		}
		out.flush();
		out.close();
	}

}
