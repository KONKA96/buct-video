package com.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import com.model.SpeakerExample;

public interface SpeakerExampleService {
	List<String> selectAllSpeakerId();
	
	List<SpeakerExample> speakerLogin(Map<String,Object> map);
	
    int deleteByPrimaryKey(SpeakerExample speaker);

    int insertSelective(SpeakerExample speaker);

    SpeakerExample selectByPrimaryKey(SpeakerExample speaker);

    int updateByPrimaryKeySelective(SpeakerExample speaker);
}
