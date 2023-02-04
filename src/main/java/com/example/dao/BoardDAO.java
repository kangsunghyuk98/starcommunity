package com.example.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.BoardTO;
import com.example.mapper.BoardMapperInter;

@Repository
@MapperScan("com.exam.mapper")
public class BoardDAO {
	@Autowired
	private BoardMapperInter mapper;
	
	public ArrayList<BoardTO> boardList(){
		ArrayList<BoardTO> boardLists = mapper.boardList();
		return boardLists;
	}
	
	public ArrayList<BoardTO> boardSearchWriter(String searchReq) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchWriter(searchReq);
		
		return boardLists;
	}
	
	public ArrayList<BoardTO> boardSearchSub_Con(String searchReq) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchSub_Con(searchReq);
		
		return boardLists;
	}
	
}
