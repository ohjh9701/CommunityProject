package com.community.mapper;

import java.util.List;

import com.community.domain.Board;
import com.community.domain.Reply;


public interface ReplyMapper {

	public void create(Reply reply) throws Exception;

	public Reply read(Reply reply) throws Exception;

	public void update(Reply reply) throws Exception;

	public void delete(Reply reply) throws Exception;

	public List<Reply> list(Board board) throws Exception;

}
