package com.model;

import java.util.List;

public class GroupPojo {
    private Integer id;

    private String name;

    private String groupDesc;
    
    private SpeakerExample speaker;
    
    private List<AuditorExample> auditorList;

    public SpeakerExample getSpeaker() {
		return speaker;
	}

	public void setSpeaker(SpeakerExample speaker) {
		this.speaker = speaker;
	}

	public List<AuditorExample> getAuditorList() {
		return auditorList;
	}

	public void setAuditorList(List<AuditorExample> auditorList) {
		this.auditorList = auditorList;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getGroupDesc() {
        return groupDesc;
    }

    public void setGroupDesc(String groupDesc) {
        this.groupDesc = groupDesc == null ? null : groupDesc.trim();
    }
}