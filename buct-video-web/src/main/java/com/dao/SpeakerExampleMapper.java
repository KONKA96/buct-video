package com.dao;

import java.util.List;
import java.util.Map;

import com.model.SpeakerExample;

public interface SpeakerExampleMapper {
	List<SpeakerExample> speakerLogin(Map<String,Object> map);
	
    int deleteByPrimaryKey(String id);

    int insert(SpeakerExample record);

    int insertSelective(SpeakerExample record);

    SpeakerExample selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SpeakerExample record);

    int updateByPrimaryKey(SpeakerExample record);
}