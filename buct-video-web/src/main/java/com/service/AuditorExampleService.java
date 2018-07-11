package com.service;

import java.util.List;
import java.util.Map;

import com.model.AuditorExample;

public interface AuditorExampleService {
	List<AuditorExample> auditorLogin(Map<String,Object> map);
	
    int deleteByPrimaryKey(AuditorExample auditor);

    int insertSelective(AuditorExample auditor);

    AuditorExample selectByPrimaryKey(AuditorExample auditor);

    int updateByPrimaryKeySelective(AuditorExample auditor);
}
