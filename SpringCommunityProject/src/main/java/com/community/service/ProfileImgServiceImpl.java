package com.community.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.domain.ProfileImg;
import com.community.mapper.ProfileImgMapper;

@Service
public class ProfileImgServiceImpl implements ProfileImgService {
	
	@Autowired
	private ProfileImgMapper mapper;

	@Override
	public int create(ProfileImg profileImg) throws Exception {
		return mapper.create(profileImg);
	}

	@Override
	public String getPicture(ProfileImg profileImg) throws Exception {
		String url = mapper.getPicture(profileImg);
		return url;
	}

	@Override
	public ProfileImg read(ProfileImg profileImg) throws Exception {
		return mapper.read(profileImg);
	}

	@Override
	public int update(ProfileImg profileImg) throws Exception {
		return mapper.update(profileImg);
	}

}
