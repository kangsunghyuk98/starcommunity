package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.BoardTO;
import com.example.mapper.BoardMapperInter;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapperInter mapper;
	
	// 게시판 List 페이징
    public int selectAllListCount(String boardName) {
        int ListCount = mapper.selectAllListCount(boardName);
        return ListCount;
    }
	 
	public List<BoardTO> selectAllListTen(String boardName, int startNo){
        List<BoardTO> allTenList = mapper.selectAllListTen(boardName, startNo);
        return allTenList;
    }
	
	// 글쓴이 검색
	public int boardSearchWriterCount(String boardName, String searchReq) {
		int ListCount = mapper.boardSearchWriterCount(boardName, searchReq);
		
		return ListCount;
	}
	
	public ArrayList<BoardTO> boardSearchWriterListTen(String boardName, String searchReq, int startNo) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchWriterListTen(boardName, searchReq, startNo);
		
		return boardLists;
	}
	
	// 제목, 내용 검색
	public int boardSearchSub_ConCount(String boardName, String searchReq) {
		int ListCount = mapper.boardSearchSub_ConCount(boardName, searchReq);

		return ListCount;
	}
	
	public ArrayList<BoardTO> boardSearchSub_ConListTen(String boardName, String searchReq, int startNo) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchSub_ConListTen(boardName, searchReq, startNo);

		return boardLists;
	}
	
	//게시판 view
	public BoardTO viewPageContents(String boardName, int seq){
		BoardTO to = new BoardTO();
		mapper.viewPageHitUp(boardName, seq);
		to = mapper.viewPageContents(boardName, seq);
		
		return to;
	}
	
	public int deleteBoardContent(String boardName, int seq) {
		int result = mapper.deleteBoardContent(boardName, seq);
		int flag = 1;
		
		if( result == 1) {
			flag = 0;
		} else {
			flag = 1;
		}
		
		return flag; 
	}
	
	// 게시판 write
	public int boardWriteOk(String boardName, BoardTO to) {
		int result = mapper.boardWriteOk(boardName, to);
		int flag = 1;
		
		if( result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	// 게시판 수정
	public BoardTO viewModifyPage(String boardName, int seq) {
		BoardTO to = new BoardTO();
		to = mapper.viewModifyPage(boardName, seq);
		return to;
	}
	
	public int boardModifyOk(String boardName, BoardTO to, int seq) {
		int result = mapper.boardModifyOk(boardName, to, seq);
		int flag = 1;
		
		if( result == 1) {
			flag = 0;
		}
		
		return flag;
	} 
}
