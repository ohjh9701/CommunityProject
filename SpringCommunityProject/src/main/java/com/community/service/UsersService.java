package com.community.service;

import java.util.List;

import com.community.domain.Users;

public interface UsersService {
	
	public void create(Users users) throws Exception;
	public Users read(Users users) throws Exception;
	public void update(Users users) throws Exception;
	public void delete(Users users) throws Exception;
	public List<Users> list() throws Exception;
}
