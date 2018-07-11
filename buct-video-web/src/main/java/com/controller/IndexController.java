package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Logger;
import com.model.SpeakerExample;
import com.service.SpeakerExampleService;

@Controller
@RequestMapping("/login")
public class IndexController {
	
	protected Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private SpeakerExampleService speakerExampleService;
	
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "/login";
	}
	
	/**
	 * 用户登录
	 * @param speaker
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/userLogin")
	public String userLogin(SpeakerExample speaker) {
		UsernamePasswordToken token = new UsernamePasswordToken(speaker.getUsername(),
				new Md5Hash(speaker.getPassword(), speaker.getUsername() ,2).toString());
		Subject subject = SecurityUtils.getSubject();
		try {
			subject.login(token);
			
			/*Map<String,Object> map=new HashMap<>();
			map.put("username", speaker.getUsername());
			List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);
			if(speakerList.size()==0) {
				return "noExist";
			}*/
			
			logger.info(speaker.getUsername()+"登录系统");
			return "success";
		} catch (AuthenticationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 跳转到个人编辑页面
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/toSpeakerInfo")
	public String toSpeakerInfo(ModelMap modelMap) {
		Subject subject = SecurityUtils.getSubject();
		Map<String,Object> map=new HashMap<>();
		map.put("username", (String) subject.getPrincipal());
		List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);
		modelMap.addAttribute("speaker", speakerList.get(0));
		
		return "/speaker-info";
	}
	
	/**
	 * 用户登出
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/userLogout")
	public String userLogout() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "success";
	}
	
	@RequestMapping("/toIndex")
	public String toIndex() {
		return "/index";
	}
	
	@RequestMapping("/toSignUp")
	public String toSignUp() {
		return "/signup";
	}
	
}
