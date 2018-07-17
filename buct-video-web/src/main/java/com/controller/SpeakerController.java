package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.json.JSONObject;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.model.Logger;
import com.model.SpeakerExample;
import com.service.SpeakerExampleService;
import com.util.ImportExcelUtil;
import com.util.JsonUtils;
import com.util.PageUtil;

@Controller
@RequestMapping("/speaker")
public class SpeakerController {

	protected Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private SpeakerExampleService speakerExampleService;
	@Autowired
	private PageUtil pageUtil;

	/**
	 * 跳转到演讲者列表页
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/toSpeakerIndex")
	public String toSpeakerIndex(ModelMap modelMap) {
		Subject subject = SecurityUtils.getSubject();
		Map<String, Object> map = new HashMap<>();
		map.put("username", (String) subject.getPrincipal());
		List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);
		modelMap.addAttribute("speaker", speakerList.get(0));
		return "/speaker-list";
	}

	/**
	 * 查询所有演讲者
	 * 
	 * @param speaker
	 * @param modelMap
	 * @param index
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/showAllSpeaker", produces = "text/json;charset=UTF-8")
	public String showAllSpeaker(SpeakerExample speaker, ModelMap modelMap,
			@RequestParam(required = true, defaultValue = "1") Integer index,
			@RequestParam(required = false, defaultValue = "15") Integer pageSize, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		// 查询演讲者角色
		map.put("rolePower", 1);

		JSONObject obj = new JSONObject();
		// 拼接查询条件
		if (speaker.getUsername() != null) {
			map.put("username", speaker.getUsername());
			obj.put("username", speaker.getUsername());
		}
		if (speaker.getGroupId() != null) {
			map.put("groupId", speaker.getGroupId());
			obj.put("groupId", speaker.getGroupId());
		}
		if (speaker.getTruename() != null) {
			map.put("keyword", speaker.getTruename());
			obj.put("keyword", speaker.getTruename());
		}

		// 分页查询
		PageHelper.startPage(index, pageSize);
		Page<SpeakerExample> speakerList = (Page<SpeakerExample>) speakerExampleService.speakerLogin(map);

		pageUtil.setPageInfo(speakerList, index, pageSize, request);

		obj.put("speakerList", speakerList);
		obj.put("index", index);

		return obj.toString();
	}

	/**
	 * 通过id查询演讲者
	 * 
	 * @param speaker
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/showSpeakerInfo", produces = "text/json;charset=UTF-8")
	public String showSpeakerInfo(SpeakerExample speaker) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", speaker.getId());
		List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);

		return JsonUtils.objectToJson(speakerList.get(0));
	}

	/**
	 * 检测输入的旧密码是否和原来匹配（个人）
	 * 
	 * @param password
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/testOldPwd")
	public String testOldPwd(String password) {
		Subject subject = SecurityUtils.getSubject();
		Map<String, Object> map = new HashMap<>();
		map.put("username", (String) subject.getPrincipal());
		List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);
		SpeakerExample speaker = speakerList.get(0);
		if (new Md5Hash(password, speaker.getUsername(), 2).toString().equals(speaker.getPassword())) {
			return "success";
		}
		return "";
	}
	
	/**
	 * 对比输入的密码和旧密码是否一致（用户）
	 * @param password
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/testSpeakerOldPwd")
	public String testSpeakerOldPwd(SpeakerExample speaker) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", speaker.getId());
		List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);
		if(speakerList.size()==0) {
			return "error";
		}else {
			if(new Md5Hash(speaker.getPassword(), speakerList.get(0).getUsername(), 2).toString().equals(speakerList.get(0).getPassword())) {
				return "same";
			}
		}
		return "success";
	}

	/**
	 * 添加、修改演讲者
	 * 
	 * @param speaker
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateSpeaker")
	public String updateSpeaker(SpeakerExample speaker) {
		Subject subject = SecurityUtils.getSubject();
		
		Map<String, Object> map = new HashMap<>();
		List<SpeakerExample> speakerList =new ArrayList<>();
		if(speaker.getUsername()!=null) {
			map.put("username", speaker.getUsername());
			
			if (speaker.getId() != null) {
				speakerList = speakerExampleService.speakerLogin(map);
				if (speakerList.size() != 0) {
					for (SpeakerExample speakerExample : speakerList) {
						if (!speakerExample.getId().equals(speaker.getId())) {
							logger.info(speaker.getId()+"用户已存在，添加失败");
							return "exist";
						}
					}
				}
			} else {
				speakerList = speakerExampleService.speakerLogin(map);
				if (speakerList.size() != 0) {
					logger.info(speaker.getId()+"用户已存在，添加失败");
					return "exist";
				}
			}
		}
		
		if (speaker.getId() != null) {
			if (speakerExampleService.updateByPrimaryKeySelective(speaker) > 0) {
				logger.info(subject.getPrincipal()+"修改用户:"+speaker.getUsername());
				return "success";
			}
		}else {
			if (speakerExampleService.insertSelective(speaker) > 0) {
				logger.info(subject.getPrincipal()+"新增用户:"+speaker.getUsername());
				return "success";
			}
		}

		
		return "";
	}
	
	/**
	 * 修改个人信息
	 * @param file
	 * @param speaker
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateSpeakerInfo")
	public String updateSpeakerInfo(@RequestParam(value = "file") MultipartFile file, SpeakerExample speaker,
			HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		Map<String, Object> map = new HashMap<>();
		map.put("username", speaker.getUsername());

		List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);
		if (speakerList.size() != 0) {
			for (SpeakerExample speakerExample : speakerList) {
				if (!speakerExample.getId().equals(speaker.getId())) {
					logger.info(speaker.getId()+"用户已存在，添加失败");
					return "exist";
				}
			}
		}
		

		String fileName = file.getOriginalFilename();
		String realPath = request.getServletContext().getRealPath("/upload");
		String newFileName = UUID.randomUUID() + fileName.substring(fileName.lastIndexOf("."));
		String filePath = realPath + File.separator + newFileName;
		File uploadFile =new File(filePath);
		try {
			file.transferTo(uploadFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		speaker.setIconImg(newFileName);

		if (speakerExampleService.updateByPrimaryKeySelective(speaker) > 0) {
			logger.info(subject.getPrincipal()+"修改了个人信息");
			return "redirect:/speaker/toSpeakerIndex";
		}
		return "";
	}

	/**
	 * 删除演讲者
	 * 
	 * @param speaker
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteSpeaker")
	public String deleteSpeaker(SpeakerExample speaker) {
		Subject subject = SecurityUtils.getSubject();
		if (speakerExampleService.deleteByPrimaryKey(speaker) > 0) {
			logger.info(subject.getPrincipal()+"删除了用户:"+speaker.getId());
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
		Subject subject = SecurityUtils.getSubject();

		logger.info(subject.getPrincipal()+"批量上传用户");

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
			SpeakerExample speaker = new SpeakerExample();
			speaker.setSnum((String) lo.get(0));
			speaker.setUsername((String) lo.get(1));
			speaker.setPassword((String) lo.get(2));
			speaker.setTruename((String) lo.get(3));
			speaker.setSex(Integer.parseInt((String) lo.get(4)));
			speaker.setPhone((String) lo.get(5));
			speaker.setGroupId(Integer.parseInt((String) lo.get(6)));

			if (speakerExampleService.insertSelective(speaker) > 0) {
				logger.info(subject.getPrincipal()+"新增用户:"+speaker.getUsername());
				count++;
			}
		}

		ServletOutputStream out = null;
		response.setCharacterEncoding("utf-8"); // 防止ajax接受到的中文信息乱码
		out = response.getOutputStream();

		if (count == listob.size()) {
			out.print("success");
			logger.info(subject.getPrincipal()+"成功上传了"+count+"位用户");
		} else if (count == 0) {
			logger.info(subject.getPrincipal()+"上传失败");
			out.print("error");
		} else {
			logger.info(subject.getPrincipal()+"上传了"+count+"位用户，有"+(listob.size()-count)+"位用户上传失败");
		}
		out.flush();
		out.close();
	}

}
