package com.service;

import java.util.List;
import java.util.Map;

import com.model.GroupPojo;

public interface GroupPojoService {

	List<GroupPojo> selectAllGroup(Map<String,Object> map);
	
    int deleteByPrimaryKey(GroupPojo groupPojo);

    int insertSelective(GroupPojo groupPojo);

    GroupPojo selectByPrimaryKey(GroupPojo groupPojo);

    int updateByPrimaryKeySelective(GroupPojo groupPojo);
}
