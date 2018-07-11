package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.BaseTest;
import com.model.Logger;
import com.model.SpeakerExample;
import com.service.SpeakerExampleService;

public class testController extends BaseTest{
	
	protected Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private SpeakerExampleService speakerExampleServiceImpl;
	
	@Test
	public void testLogin() {
		String password = "kj966111";
		String username = "konka2";
		Map<String,Object> map=new HashMap<>();
		map.put("username", "konka2");
		map.put("password", new Md5Hash(password, username ,2).toString());
		List<SpeakerExample> speakerList = speakerExampleServiceImpl.speakerLogin(map);
		System.out.println(speakerList.get(0));
	}
	
	/*@Test
	public void frontLogin(HttpServletResponse response,HttpServletRequest request) throws IOException {
		Teacher teacher=new Teacher();
		teacher.setUsername("2");
		teacher.setPassword("2");
		QianduanController q=new QianduanController();
		q.UserLogin("2",response,request);
	}*/
	
	/**
	 * 密码加密算法
	 */
	@Test
	public void testMD5() {
		String password = "kj966111";
		String username = "konka2";
		String md5 = new Md5Hash(password, username ,2).toString();
		System.out.println("-----------------"+md5);
	}
	
}
