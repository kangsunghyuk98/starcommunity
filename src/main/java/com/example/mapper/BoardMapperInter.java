package com.example.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.example.dto.BoardTO;

@Mapper
@Repository
public interface BoardMapperInter {
	@Select("select * from member join dlife_board on member.memberkey = dlife_board.memberkey")
	public ArrayList<BoardTO> boardList();
	
	// 게시판 검색 쿼리
	@Select("select * from member join dlife_board on member.memberkey = dlife_board.memberkey where nickname like CONCAT('%',#{searchReq},'%')")
	public ArrayList<BoardTO> boardSearchWriter(String searchReq);
	
	@Select("select * from member join dlife_board on member.memberkey = dlife_board.memberkey "
			+ "where subject like CONCAT('%',#{searchReq},'%') or content like CONCAT('%',#{searchReq},'%')")
	public ArrayList<BoardTO> boardSearchSub_Con(String searchReq);	
}
