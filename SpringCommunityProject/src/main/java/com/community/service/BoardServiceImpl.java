package com.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.domain.Board;
import com.community.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public void create(Board board) throws Exception {
		mapper.create(board);
	}

	@Override
	public Board read(Board board) throws Exception {
		return mapper.read(board);
	}

	@Override
	public void update(Board board) throws Exception {
		mapper.update(board);
	}

	@Override
	public void delete(Board board) throws Exception {
		mapper.delete(board);
	}

	@Override
	public List<Board> list() throws Exception {
		return mapper.list();
	}

	@Override
	public List<Board> search(Board board) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> getListWithPaging(int page) throws Exception {
		int offset = (page - 1) * 10;
		return mapper.getListWithPaging(offset);
	}

	@Override
	public int getTotalCount() throws Exception {
		return mapper.getTotalCount();
	}

	@Override
	public List<Board> getMyListWithPaging(int page, Board board) throws Exception {
		int offset = (page - 1) * 10;
		return mapper.getMyListWithPaging(offset, board);
	}

	@Override
	public int getMyTotalCount() throws Exception {
		return mapper.getMyTotalCount();
	}

	@Override
	public Board userRead(Board board) throws Exception {
		return mapper.userRead(board);
	}

}
