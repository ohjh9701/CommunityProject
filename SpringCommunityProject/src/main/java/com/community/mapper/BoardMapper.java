package com.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.domain.Board;

public interface BoardMapper {

	public void create(Board board) throws Exception;

	public Board read(Board board) throws Exception;

	public void update(Board board) throws Exception;

	public void delete(Board board) throws Exception;

	public List<Board> list() throws Exception;

	public List<Board> search(Board board) throws Exception;

	// 10개씩 끊어서 가져오기
	public List<Board> getListWithPaging(int offset) throws Exception;

	// 전체 게시글 개수 가져오기 (페이징 계산기용)
	public int getTotalCount() throws Exception;
	
	public List<Board> getMyListWithPaging(@Param("offset") int page, Board board) throws Exception;
	public int getMyTotalCount() throws Exception;
	public Board userRead(Board board) throws Exception;

}
