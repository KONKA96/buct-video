package com.dao;

import java.util.List;
import java.util.Map;

import com.model.GroupPojo;

public interface GroupPojoMapper {
	List<GroupPojo> selectAllGroup(Map<String,Object> map);
	
    int deleteByPrimaryKey(Integer id);

    int insert(GroupPojo record);

    int insertSelective(GroupPojo record);

    GroupPojo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GroupPojo record);

    int updateByPrimaryKey(GroupPojo record);
}