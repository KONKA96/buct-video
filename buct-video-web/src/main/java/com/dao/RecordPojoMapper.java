package com.dao;

import java.util.List;
import java.util.Map;

import com.model.RecordPojo;

public interface RecordPojoMapper {
	Integer selectEchartsData(Map<String,Object> map);
	
    int deleteByPrimaryKey(Integer id);

    int insert(RecordPojo record);

    int insertSelective(RecordPojo record);

    RecordPojo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RecordPojo record);

    int updateByPrimaryKey(RecordPojo record);
}