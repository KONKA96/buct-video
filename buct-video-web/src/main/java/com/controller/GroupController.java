package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.GroupPojo;
import com.model.Logger;
import com.service.GroupPojoService;
import com.service.SpeakerExampleService;
import com.util.JsonUtils;
import com.util.PageUtil;

@Controller
@RequestMapping("/group")
public class GroupController {
	protected Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private SpeakerExampleService speakerExampleService;
	@Autowired
	private GroupPojoService groupPojoService;
	@Autowired
	private PageUtil pageUtil;
	
	@ResponseBody
	@RequestMapping(value="/showAllGroup",produces = "text/json;charset=UTF-8")
	public String showAllGroup() {
		Map<String,Object> map=new HashMap<>();
		List<GroupPojo> groupList = groupPojoService.selectAllGroup(map);
		return JsonUtils.objectToJson(groupList);
	}
	
	/**
	 * 新增、修改组别
	 * @param group
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateGroup")
	public String updateGroup(GroupPojo group) {
		if(group.getId()!=null) {
			if(groupPojoService.updateByPrimaryKeySelective(group)>0) {
				return "success";
			}
		}else {
			//判断该组是否存在
			Map<String,Object> map=new HashMap<>();
			map.put("groupName", group.getName());
			List<GroupPojo> groupList = groupPojoService.selectAllGroup(map);
			//该组已经存在，创建失败
			if(groupList.size()!=0) {
				return "exist";
			}else {
				if(groupPojoService.insertSelective(group)>0) {
					return "success";
				}
			}
		}
		
		return "";
	}
}
