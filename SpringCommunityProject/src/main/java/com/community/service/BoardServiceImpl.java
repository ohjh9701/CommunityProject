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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Board board) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Board board) throws Exception {
		// TODO Auto-generated method stub

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
        // 페이지 번호를 오프셋(시작 위치)으로 변환
        // 1페이지 -> 0부터 시작, 2페이지 -> 10부터 시작...
        int offset = (page - 1) * 10;
        return mapper.getListWithPaging(offset);
    }

    @Override
    public int getTotalCount() throws Exception {
        return mapper.getTotalCount();
    }

}
