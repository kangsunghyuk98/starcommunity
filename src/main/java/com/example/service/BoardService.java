package com.example.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.BoardTO;
import com.example.mapper.BoardMapperInter;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapperInter mapper;
	
	public ArrayList<BoardTO> boardList(){
		ArrayList<BoardTO> boardLists = mapper.boardList();
		return boardLists;
	}
	
	// 게시판 검색 
	public ArrayList<BoardTO> boardSearchWriter(String searchReq) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchWriter(searchReq);
		
		return boardLists;
	}
	
	public ArrayList<BoardTO> boardSearchSub_Con(String searchReq) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchSub_Con(searchReq);
		
		return boardLists;
	}
}
