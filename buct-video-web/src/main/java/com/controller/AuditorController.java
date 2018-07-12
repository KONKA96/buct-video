package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.model.AuditorExample;
import com.model.Logger;
import com.model.SpeakerExample;
import com.service.AuditorExampleService;
import com.service.SpeakerExampleService;
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

}
