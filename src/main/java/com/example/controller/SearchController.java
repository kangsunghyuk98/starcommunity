package com.example.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.BoardTO;
import com.example.dto.Pagination;
import com.example.service.BoardService;

@RestController
public class SearchController {
	@Autowired
	private BoardService service;
	
	@RequestMapping("/searchBoardList")
	public Object searchBoardList(String searchReq, String searchOption, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		System.out.println(searchReq);
		System.out.println(searchOption);
		System.out.println(currentPage);
		
		int boardListSub_ConCount = service.boardSearchSub_ConCount(searchReq);
		Pagination paginationSC = new Pagination(boardListSub_ConCount, currentPage);
		List<BoardTO> boardListsSC = service.boardSearchSub_ConListTen(searchReq, paginationSC.getStartIndex());
		//List<BoardTO> boardListsSC = service.boardSearchSub_Con(searchReq);
		
		int boardListWriterCount = service.boardSearchWriterCount(searchReq);
		Pagination paginationW = new Pagination(boardListWriterCount, currentPage);
		List<BoardTO> boardListsW = service.boardSearchWriterListTen(searchReq, paginationW.getStartIndex());
		//List<BoardTO> boardListsW = service.boardSearchWriter(searchReq);
		
		String option1 = "nickname";
		String option2 = "subject_content";
		
		JSONArray arr = new JSONArray();
		JSONObject jsonData = new JSONObject();
		
		if( searchOption.equals(option1) ) {
			// ArrayList<BoardTO> boardLists = service.boardSearchWriter(searchReq); 

			for( BoardTO to : boardListsW) {
				JSONObject obj = new JSONObject();
				
				obj.put("dlifeseq", to.getDlifeseq() );
				obj.put("subject", to.getSubject() );
				obj.put("content", to.getContent() );
				obj.put("wdate", to.getWdate() );
				obj.put("hit", to.getHit() );
				obj.put("imgname", to.getImgname() );
				obj.put("imgformat", to.getImgformat() );
				obj.put("recommend", to.getRecommend() );
				obj.put("memberkey", to.getMemberkey() );
				obj.put("nickname", to.getNickname() );
				
				arr.add(obj);	
				
			}
			
			jsonData.put("data", arr);
			jsonData.put("boardListCount", boardListWriterCount);
			jsonData.put("pagination", paginationW);
			jsonData.put("boardList", boardListsW);
			
		} else if( searchOption.equals(option2) ) {
			// ArrayList<BoardTO> boardLists = service.boardSearchSub_Con(searchReq);

			for( BoardTO to : boardListsSC) {
				JSONObject obj = new JSONObject();
				
				obj.put("dlifeseq", to.getDlifeseq() );
				obj.put("subject", to.getSubject() );
				obj.put("content", to.getContent() );
				obj.put("wdate", to.getWdate() );
				obj.put("hit", to.getHit() );
				obj.put("imgname", to.getImgname() );
				obj.put("imgformat", to.getImgformat() );
				obj.put("recommend", to.getRecommend() );
				obj.put("memberkey", to.getMemberkey() );
				obj.put("nickname", to.getNickname() );
				
				arr.add(obj);

			}
			
			jsonData.put("data", arr);
			jsonData.put("boardListCount", boardListSub_ConCount);
			jsonData.put("pagination", paginationSC);
			jsonData.put("boardList", boardListsSC);
						
			
		} else {
			System.out.println("error : 검색 조건이 맞지 않음");
			
		}

		return jsonData;
	}
}
