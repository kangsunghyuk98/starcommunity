package com.example.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.dto.BoardTO;

@Mapper
public interface BoardMapperInter {
	@Select("select dlifeseq, subject, content, wdate, hit, imgname, imgformat, recommend, memberkey from dlife_board")
	public ArrayList<BoardTO> boardList();
	
	// 게시판 검색 쿼리
	@Select("select * from dlife_board where dlifeseq like #{searchReq}")
	public ArrayList<BoardTO> boardSearchWriter(String searchReq);
	
	@Select("select * from dlife_board where subject like CONCAT('%',#{searchReq},'%')")
	public ArrayList<BoardTO> boardSearchSub_Con(String searchReq);
}
