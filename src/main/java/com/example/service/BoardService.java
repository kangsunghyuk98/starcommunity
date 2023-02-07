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
	
	// 게시판 list 
	public ArrayList<BoardTO> boardList(){
		ArrayList<BoardTO> boardLists = mapper.boardList();
		return boardLists;
		
	}
	
	// 게시판 List 페이징

    public int selectAllListCount() {
        int ListCount = mapper.selectAllListCount();
        return ListCount;
    }
	 
	public List<BoardTO> selectAllListTen(int startNo){
        List<BoardTO> allTenList = mapper.selectAllListTen(startNo);
        return allTenList;
    }
	
	// 게시판 검색
	//글쓴이 검색
	
	public ArrayList<BoardTO> boardSearchWriter(String searchReq) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchWriter(searchReq);
		
		return boardLists;
	}
	
	public int boardSearchWriterCount(String searchReq) {
		int ListCount = mapper.boardSearchWriterCount(searchReq);
		
		return ListCount;
	}
	
	public ArrayList<BoardTO> boardSearchWriterListTen(String searchReq, int startNo) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchWriterListTen(searchReq, startNo);
		
		return boardLists;
	}
	
	//제목, 내용 검색
	public ArrayList<BoardTO> boardSearchSub_Con(String searchReq) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchSub_Con(searchReq);

		return boardLists;
	}
	
	public int boardSearchSub_ConCount(String searchReq) {
		int ListCount = mapper.boardSearchSub_ConCount(searchReq);

		return ListCount;
	}
	
	public ArrayList<BoardTO> boardSearchSub_ConListTen(String searchReq, int startNo) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchSub_ConListTen(searchReq, startNo);

		return boardLists;
	}
	
}
