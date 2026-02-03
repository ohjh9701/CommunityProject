package com.community.service;

import com.community.domain.ProfileImg;

public interface ProfileImgService {
	
	public int create(ProfileImg profileImg) throws Exception;
	public ProfileImg read(ProfileImg profileImg) throws Exception;
	public int update(ProfileImg profileImg) throws Exception;
	public String getPicture(ProfileImg profileImg) throws Exception;

}
