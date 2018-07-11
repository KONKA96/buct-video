package com.dao;

import com.model.RecordPojo;

public interface RecordPojoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RecordPojo record);

    int insertSelective(RecordPojo record);

    RecordPojo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RecordPojo record);

    int updateByPrimaryKey(RecordPojo record);
}