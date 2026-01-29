package com.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.domain.Users;
import com.community.mapper.UsersMapper;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersMapper mapper;

	@Override
	public void create(Users users) throws Exception {
		mapper.create(users);
	}

	@Override
	public Users read(Users users) throws Exception {
		return mapper.read(users.getNo());
	}

	@Override
	public void update(Users users) throws Exception {
		mapper.update(users);
	}

	@Override
	public void delete(Users users) throws Exception {
		mapper.delete(users.getNo());
	}

	@Override
	public List<Users> list() throws Exception {
		return mapper.list();
	}

	@Override
	public Users loginRead(Users users) throws Exception {
		return mapper.loginRead(users);
	}

	@Override
	public Users findId(Users users) throws Exception {
		return mapper.findId(users);
	}

	@Override
	public Users findPw(Users users) throws Exception {
		return mapper.findPw(users);
	}

	@Override
	public void updatePw(Users users) throws Exception {
		mapper.updatePw(users);
	}
	
	
	
}
