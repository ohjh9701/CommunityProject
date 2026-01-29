package com.community.mapper;

import java.util.List;

import com.community.domain.Users;

public interface UsersMapper {
	
	public void create(Users users) throws Exception;
	public Users read(Integer no) throws Exception;
	public void update(Users users) throws Exception;
	public void delete(Integer no) throws Exception;
	public List<Users> list() throws Exception;
	
}
