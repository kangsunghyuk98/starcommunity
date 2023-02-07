package com.example.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.example.dto.BoardTO;
import com.example.dto.MemberTO;

@Mapper
@Repository
public interface BoardMapperInter {

	//페이징 쿼리
	@Select("select * from member join ${boardName} on member.memberkey = ${boardName}.memberkey order by seq desc "
			+ "limit #{startNo}, 10")
    List<BoardTO> selectAllListTen(String boardName, int startNo); // 게시글10개씩 페이징 처리
	
    @Select("select count(*) from member join ${boardName} on member.memberkey = ${boardName}.memberkey order by seq desc ")
    int selectAllListCount(String boardName);
	
    
	// 게시판 검색 쿼리
	@Select("select count(*) from member join ${boardName} on member.memberkey = ${boardName}.memberkey where nickname like CONCAT('%',#{searchReq},'%') order by seq desc ")
	int boardSearchWriterCount(String boardName, String searchReq);
	
	@Select("select * from member join ${boardName} on member.memberkey = ${boardName}.memberkey where nickname like CONCAT('%',#{searchReq},'%') order by seq desc "
			+ "limit #{startNo}, 10")
	public ArrayList<BoardTO> boardSearchWriterListTen(String boardName, String searchReq, int startNo);
	
	
	//제목, 내용 검색		
	@Select("select count(*) from member join ${boardName} on member.memberkey = ${boardName}.memberkey "
			+ "where subject like CONCAT('%',#{searchReq},'%') or content like CONCAT('%',#{searchReq},'%') order by seq desc ")
	int boardSearchSub_ConCount(String boardName, String searchReq);
	
	@Select("select * from member join ${boardName} on member.memberkey = ${boardName}.memberkey "
			+ "where subject like CONCAT('%',#{searchReq},'%') or content like CONCAT('%',#{searchReq},'%') order by seq desc " 
			+ "limit #{startNo}, 10")
	public ArrayList<BoardTO> boardSearchSub_ConListTen(String boardName, String searchReq, int startNo);

	// view
	@Select("select * from member join ${boardName} on member.memberkey = ${boardName}.memberkey where seq=#{seq} ")
	public BoardTO viewPageContents(String boardName, int seq);
	
	// 조회수
	@Update("update ${boardName} set hit = hit+1 where seq=#{seq}")
	public void viewPageHitUp(String boardName, int seq);
	
	
}
