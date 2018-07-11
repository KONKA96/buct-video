package com.dao;

import com.model.AuditorExample;

public interface AuditorExampleMapper {
    int deleteByPrimaryKey(String id);

    int insert(AuditorExample record);

    int insertSelective(AuditorExample record);

    AuditorExample selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AuditorExample record);

    int updateByPrimaryKey(AuditorExample record);
}