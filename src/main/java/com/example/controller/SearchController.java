package com.example.controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.dto.BoardTO;
import com.example.service.BoardService;

@RestController
public class SearchController {
	@Autowired
	private BoardService service;
	@Autowired
	private BoardTO to;
	
	@RequestMapping("/searchBoardList")
	public Object searchBoardList(String searchReq, String searchOption) {
		System.out.println(searchReq);
		System.out.println(searchOption);
		
		String option1 = "nickname";
		String option2 = "subject_content";
		
		JSONArray arr = new JSONArray();
		JSONObject jsonData = new JSONObject();
		
		if( searchOption.equals(option1) ) {
			ArrayList<BoardTO> boardLists = service.boardSearchWriter(searchReq); 

			for( BoardTO to : boardLists) {
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
			
		} else if( searchOption.equals(option2) ) {
			ArrayList<BoardTO> boardLists = service.boardSearchSub_Con(searchReq);

			for( BoardTO to : boardLists) {
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
			
		} else {
			System.out.println("error : 검색 조건이 맞지 않음");
		}
		
		return jsonData;
	}
}
