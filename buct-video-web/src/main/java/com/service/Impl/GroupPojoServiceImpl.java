package com.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GroupPojoMapper;
import com.model.GroupPojo;
import com.service.GroupPojoService;

@Service
public class GroupPojoServiceImpl implements GroupPojoService {

	@Autowired
	private GroupPojoMapper groupPojoMapper;
	
	@Override
	public List<GroupPojo> selectAllGroup(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return groupPojoMapper.selectAllGroup(map);
	}

	@Override
	public int deleteByPrimaryKey(GroupPojo groupPojo) {
		// TODO Auto-generated method stub
		return groupPojoMapper.deleteByPrimaryKey(groupPojo.getId());
	}

	@Override
	public int insertSelective(GroupPojo groupPojo) {
		// TODO Auto-generated method stub
		return groupPojoMapper.insertSelective(groupPojo);
	}

	@Override
	public GroupPojo selectByPrimaryKey(GroupPojo groupPojo) {
		// TODO Auto-generated method stub
		return groupPojoMapper.selectByPrimaryKey(groupPojo.getId());
	}

	@Override
	public int updateByPrimaryKeySelective(GroupPojo groupPojo) {
		// TODO Auto-generated method stub
		return groupPojoMapper.updateByPrimaryKeySelective(groupPojo);
	}

}
