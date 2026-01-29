package com.community.mapper;

import java.util.List;

import com.community.domain.Users;

public interface UsersMapper {
	
	public void create(Users users) throws Exception;
	public Users read(Integer no) throws Exception;
	public Users loginRead(Users users) throws Exception;
	public Users findId(Users users) throws Exception;
	public Users findPw(Users users) throws Exception;
	public void update(Users users) throws Exception;
	public void delete(Integer no) throws Exception;
	public List<Users> list() throws Exception;
	
}
