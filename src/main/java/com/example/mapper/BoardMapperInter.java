package com.example.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.example.dto.BoardTO;
import com.example.dto.MemberTO;

@Mapper
@Repository
public interface BoardMapperInter {
	@Select("select * from member join dlife_board on member.memberkey = dlife_board.memberkey")
	public ArrayList<BoardTO> boardList();
	
	//페이징 쿼리
	@Select("select * from member join dlife_board on member.memberkey = dlife_board.memberkey "
			+ "limit #{startNo}, 10")
    List<BoardTO> selectAllListTen(int startNo); // 게시글10개씩 페이징 처리
	
    @Select("select count(*) from member join dlife_board on member.memberkey = dlife_board.memberkey ")
    int selectAllListCount();
	
    
	// 게시판 검색 쿼리
	// 글쓴이 검색
	@Select("select * from member join dlife_board on member.memberkey = dlife_board.memberkey where nickname like CONCAT('%',#{searchReq},'%')")
	public ArrayList<BoardTO> boardSearchWriter(String searchReq);
	
	@Select("select count(*) from member join dlife_board on member.memberkey = dlife_board.memberkey where nickname like CONCAT('%',#{searchReq},'%')")
	int boardSearchWriterCount(String searchReq);
	
	@Select("select * from member join dlife_board on member.memberkey = dlife_board.memberkey where nickname like CONCAT('%',#{searchReq},'%')"
			+ "limit #{startNo}, 10")
	public ArrayList<BoardTO> boardSearchWriterListTen(String searchReq, int startNo);
	
	
	//제목, 내용 검색	
	@Select("select * from member join dlife_board on member.memberkey = dlife_board.memberkey "
			+ "where subject like CONCAT('%',#{searchReq},'%') or content like CONCAT('%',#{searchReq},'%')")
	public ArrayList<BoardTO> boardSearchSub_Con(String searchReq);
	
	@Select("select count(*) from member join dlife_board on member.memberkey = dlife_board.memberkey "
			+ "where subject like CONCAT('%',#{searchReq},'%') or content like CONCAT('%',#{searchReq},'%')")
	int boardSearchSub_ConCount(String searchReq);
	
	@Select("select * from member join dlife_board on member.memberkey = dlife_board.memberkey "
			+ "where subject like CONCAT('%',#{searchReq},'%') or content like CONCAT('%',#{searchReq},'%')" 
			+ "limit #{startNo}, 10")
	public ArrayList<BoardTO> boardSearchSub_ConListTen(String searchReq, int startNo);

	
}
