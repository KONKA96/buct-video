package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.json.JSONObject;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.model.Logger;
import com.model.SpeakerExample;
import com.service.SpeakerExampleService;
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
	
	
	@RequestMapping("/toSpeakerIndex")
	public String toSpeakerIndex(ModelMap modelMap) {
		Subject subject = SecurityUtils.getSubject();
		Map<String,Object> map=new HashMap<>();
		map.put("username", (String) subject.getPrincipal());
		List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);
		modelMap.addAttribute("speaker", speakerList.get(0));
		return "/speaker-list";
	}
	/**
	 * 查询所有演讲者
	 * @param speaker
	 * @param modelMap
	 * @param index
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/showAllSpeaker",produces = "text/json;charset=UTF-8")
	public String showAllSpeaker(SpeakerExample speaker,ModelMap modelMap,@RequestParam(required=true,defaultValue="1") Integer index,
            @RequestParam(required=false,defaultValue="15") Integer pageSize,HttpServletRequest request) {
		Map<String,Object> map=new HashMap<>();
		//查询演讲者角色
		map.put("rolePower", 1);
		
		JSONObject obj = new JSONObject();
		//拼接查询条件
		if(speaker.getUsername()!=null) {
			map.put("username", speaker.getUsername());
			obj.put("username", speaker.getUsername());
		}
		if(speaker.getGroupId()!=null) {
			map.put("groupId", speaker.getGroupId());
			obj.put("groupId", speaker.getGroupId());
		}
		if(speaker.getTruename()!=null) {
			map.put("keyword", speaker.getTruename());
			obj.put("keyword", speaker.getTruename());
		}
		
		//分页查询
		PageHelper.startPage(index, pageSize);
		Page<SpeakerExample> speakerList = (Page<SpeakerExample>) speakerExampleService.speakerLogin(map);
		
		pageUtil.setPageInfo(speakerList, index, pageSize,request);
		
		
		obj.put("speakerList", speakerList);
		obj.put("index", index);
		
		return obj.toString();
	}
	
	/**
	 * 通过id查询演讲者
	 * @param speaker
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/showSpeakerInfo")
	public String showSpeakerInfo(SpeakerExample speaker) {
		Map<String,Object> map=new HashMap<>();
		map.put("id", speaker.getId());
		List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);
		
		return JsonUtils.objectToJson(speakerList.get(0));
	}
	
	/**
	 * 检测输入的旧密码是否和原来匹配
	 * @param password
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/testOldPwd")
	public String testOldPwd(String password) {
		Subject subject = SecurityUtils.getSubject();
		Map<String,Object> map=new HashMap<>();
		map.put("username", (String) subject.getPrincipal());
		List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);
		SpeakerExample speaker = speakerList.get(0);
		if(new Md5Hash(password, speaker.getUsername() ,2).toString().equals(speaker.getPassword())) {
			return "success";
		}
		return "";
	}
}
