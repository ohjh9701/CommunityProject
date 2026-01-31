package com.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.community.domain.Board;
import com.community.domain.Reply;
import com.community.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;

	@Override
	@Transactional
	public void create(Reply reply) throws Exception {
		mapper.create(reply);
	}
	
	@Override
	@Transactional
	public void update(Reply reply) throws Exception {
		mapper.update(reply);
	}

	@Override
	@Transactional
	public void delete(Reply reply) throws Exception {
		mapper.delete(reply);
	}
	
	@Override
	public List<Reply> list(Board board) throws Exception {
		return mapper.list(board);
	}



	

}
