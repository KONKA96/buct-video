package com.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SpeakerExampleMapper;
import com.model.SpeakerExample;
import com.service.SpeakerExampleService;

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
		return speakerExampleMapper.updateByPrimaryKeySelective(speaker);
	}

}
