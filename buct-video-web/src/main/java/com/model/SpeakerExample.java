package com.model;

public class SpeakerExample {
    private String id;

    private String snum;

    private String username;

    private String password;

    private String truename;

    private Integer sex;

    private String phone;

    private Integer groupId;

    private Integer userNum;

    private String useDuration;

    private Integer rolePower;

    private String iconImg;

    private String remake;
    
    private GroupPojo group;
    
    
    public SpeakerExample() {
		super();
	}

	public SpeakerExample(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public GroupPojo getGroup() {
		return group;
	}

	public void setGroup(GroupPojo group) {
		this.group = group;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSnum() {
        return snum;
    }

    public void setSnum(String snum) {
        this.snum = snum == null ? null : snum.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename == null ? null : truename.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getUserNum() {
        return userNum;
    }

    public void setUserNum(Integer userNum) {
        this.userNum = userNum;
    }

    public String getUseDuration() {
        return useDuration;
    }

    public void setUseDuration(String useDuration) {
        this.useDuration = useDuration == null ? null : useDuration.trim();
    }

    public Integer getRolePower() {
        return rolePower;
    }

    public void setRolePower(Integer rolePower) {
        this.rolePower = rolePower;
    }

    public String getIconImg() {
        return iconImg;
    }

    public void setIconImg(String iconImg) {
        this.iconImg = iconImg == null ? null : iconImg.trim();
    }

    public String getRemake() {
        return remake;
    }

    public void setRemake(String remake) {
        this.remake = remake == null ? null : remake.trim();
    }

	@Override
	public String toString() {
		return "SpeakerExample [id=" + id + ", snum=" + snum + ", username=" + username + ", password=" + password
				+ ", truename=" + truename + ", sex=" + sex + ", phone=" + phone + ", groupId=" + groupId + ", userNum="
				+ userNum + ", useDuration=" + useDuration + ", rolePower=" + rolePower + ", iconImg=" + iconImg
				+ ", remake=" + remake + ", group=" + group + "]";
	}
    
}