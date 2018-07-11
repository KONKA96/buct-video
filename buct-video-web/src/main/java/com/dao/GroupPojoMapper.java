package com.dao;

import com.model.GroupPojo;

public interface GroupPojoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GroupPojo record);

    int insertSelective(GroupPojo record);

    GroupPojo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GroupPojo record);

    int updateByPrimaryKey(GroupPojo record);
}