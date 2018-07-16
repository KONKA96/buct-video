package com.service.Impl;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SpeakerExampleMapper;
import com.model.SpeakerExample;
import com.service.SpeakerExampleService;
import com.util.ProduceId;

@Service
public class SpeakerExampleServiceImpl implements SpeakerExampleService {

	@Autowired
	private SpeakerExampleMapper speakerExampleMapper;
	
	@Override
	public List<SpeakerExample> speakerLogin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return speakerExampleMapper.speakerLogin(map);
	}

	@Override
	public int deleteByPrimaryKey(SpeakerExample speaker) {
		// TODO Auto-generated method stub
		return speakerExampleMapper.deleteByPrimaryKey(speaker.getId());
	}

	@Override
	public int insertSelective(SpeakerExample speaker) {
		// TODO Auto-generated method stub
		if(speaker.getId()==null) {
			List<String> idList = speakerExampleMapper.selectAllSpeakerId();
			String userId = ProduceId.produceUserId(idList);
			speaker.setId(userId);
		}
		if(speaker.getSnum()==null) {
			speaker.setSnum(speaker.getId());
		}
		if(speaker.getPassword()!=null) {
			speaker.setPassword(new Md5Hash(speaker.getPassword(), speaker.getUsername() ,2).toString());
		}
		
		speaker.setUserNum(0);
		speaker.setUseDuration("00:00:00");
		speaker.setRolePower(1);
		return speakerExampleMapper.insertSelective(speaker);
	}

	@Override
	public SpeakerExample selectByPrimaryKey(SpeakerExample speaker) {
		// TODO Auto-generated method stub
		return speakerExampleMapper.selectByPrimaryKey(speaker.getId());
	}

	@Override
	public int updateByPrimaryKeySelective(SpeakerExample speaker) {
		// TODO Auto-generated method stub
		if(speaker.getPassword()!=null) {
			SpeakerExample selectByPrimaryKey = speakerExampleMapper.selectByPrimaryKey(speaker.getId());
			speaker.setPassword(new Md5Hash(speaker.getPassword(), selectByPrimaryKey.getUsername() ,2).toString());
		}
		return speakerExampleMapper.updateByPrimaryKeySelective(speaker);
	}

	@Override
	public List<String> selectAllSpeakerId() {
		// TODO Auto-generated method stub
		return speakerExampleMapper.selectAllSpeakerId();
	}
	
}
