package com.service.Impl;

import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AuditorExampleMapper;
import com.model.AuditorExample;
import com.model.SpeakerExample;
import com.service.AuditorExampleService;
import com.util.ProduceId;

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

		// TODO Auto-generated method stub
		if (auditor.getId() == null) {
			List<String> idList = auditorExampleMapper.selectAllAuditorId();
			String userId = ProduceId.produceUserId(idList);
			auditor.setId(userId);
		}
		if (auditor.getSnum() == null) {
			auditor.setSnum(auditor.getId());
		}
		if (auditor.getPassword() != null) {
			auditor.setPassword(new Md5Hash(auditor.getPassword(), auditor.getUsername(), 2).toString());
		}

		auditor.setUseNum(0);
		auditor.setUseDuration("00:00:00");
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
		if (auditor.getPassword() != null) {
			AuditorExample selectByPrimaryKey = auditorExampleMapper.selectByPrimaryKey(auditor.getId());
			auditor.setPassword(new Md5Hash(auditor.getPassword(), selectByPrimaryKey.getUsername(), 2).toString());
		}
		return auditorExampleMapper.updateByPrimaryKeySelective(auditor);
	}

}
