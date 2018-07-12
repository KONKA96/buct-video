package com.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AuditorExampleMapper;
import com.model.AuditorExample;
import com.service.AuditorExampleService;

@Service
public class AuditorExampleServiceImpl implements AuditorExampleService {

	@Autowired
	private AuditorExampleMapper auditorExampleMapper;
	
	@Override
	public List<AuditorExample> auditorLogin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return auditorExampleMapper.auditorLogin(map);
	}

	@Override
	public int deleteByPrimaryKey(AuditorExample auditor) {
		// TODO Auto-generated method stub
		return auditorExampleMapper.deleteByPrimaryKey(auditor.getId());
	}

	@Override
	public int insertSelective(AuditorExample auditor) {
		// TODO Auto-generated method stub
		return auditorExampleMapper.insertSelective(auditor);
	}

	@Override
	public AuditorExample selectByPrimaryKey(AuditorExample auditor) {
		// TODO Auto-generated method stub
		return auditorExampleMapper.selectByPrimaryKey(auditor.getId());
	}

	@Override
	public int updateByPrimaryKeySelective(AuditorExample auditor) {
		// TODO Auto-generated method stub
		return auditorExampleMapper.updateByPrimaryKeySelective(auditor);
	}

}
