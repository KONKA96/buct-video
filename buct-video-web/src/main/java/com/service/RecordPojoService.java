package com.service;

import java.util.List;
import java.util.Map;

import com.model.RecordPojo;

public interface RecordPojoService {
	public Map<String,Integer> selectRecord(Map<String, Object> map);
	
	Integer selectEchartsData(Map<String,Object> map);
	
    int deleteByPrimaryKey(RecordPojo record);

    int insertSelective(RecordPojo record);

    RecordPojo selectByPrimaryKey(RecordPojo record);

    int updateByPrimaryKeySelective(RecordPojo record);
}
