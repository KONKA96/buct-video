package com.dao;

import java.util.List;
import java.util.Map;

import com.model.AuditorExample;

public interface AuditorExampleMapper {
	List<String> selectAllAuditorId();
	
	List<AuditorExample> auditorLogin(Map<String,Object> map);
	
    int deleteByPrimaryKey(String id);

    int insert(AuditorExample record);

    int insertSelective(AuditorExample record);

    AuditorExample selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AuditorExample record);

    int updateByPrimaryKey(AuditorExample record);
}