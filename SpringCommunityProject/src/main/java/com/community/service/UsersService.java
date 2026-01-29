package com.community.service;

import java.util.List;

import com.community.domain.Users;

public interface UsersService {
	
	public void create(Users users) throws Exception;
	public Users read(Users users) throws Exception;
	public Users loginRead(Users users) throws Exception;
	public Users findId(Users users) throws Exception;
	public Users findPw(Users users) throws Exception;
	public void update(Users users) throws Exception;
	public void delete(Users users) throws Exception;
	public List<Users> list() throws Exception;
	public void updatePw(Users users) throws Exception;
}
