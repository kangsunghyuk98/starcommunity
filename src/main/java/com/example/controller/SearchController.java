package com.example.controller;

import java.awt.List;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.BoardDAO;
import com.example.dto.BoardTO;

@RestController
public class SearchController {
	@Autowired
	private BoardDAO dao;
	@Autowired
	private BoardTO to;
	
	/*
	@RequestMapping("/showBoardList")
	public Object showBoardList() {
		System.out.println("search 컨트롤러 호출");
		
		JSONObject obj = new JSONObject();
		obj.put("seq", "1");
		obj.put("subject", "test1");
		
		JSONArray arr = new JSONArray();
		arr.add(obj);		
		
		JSONObject jsonData = new JSONObject();
		jsonData.put("data", arr);
		
		return jsonData;
	}
	*/
	
	@RequestMapping("/searchBoardList")
	public Object searchBoardList(String searchReq, String searchOption) {
		System.out.println(searchReq);
		System.out.println(searchOption);
		
		String option1 = "nickname";
		String option2 = "subject_content";
		
		JSONObject obj = new JSONObject();
		JSONArray arr = new JSONArray();
		JSONObject jsonData = new JSONObject();
		
		if( searchOption.equals(option1) ) {
			ArrayList<BoardTO> boardLists = dao.boardSearchWriter(searchReq);
			
			for(BoardTO to : boardLists) {
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
				
				System.out.println( to.getSubject() );
				arr.add(obj);
				System.out.println(arr);
				
			}
			jsonData.put("data", arr);
			
			System.out.println(jsonData);
			
		} else if( searchOption.equals(option2) ) {
			ArrayList<BoardTO> boardLists = dao.boardSearchSub_Con(searchReq);
			
			for(BoardTO to : boardLists) {
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
				
				System.out.println( to.getSubject() );
				arr.add(obj);
				System.out.println(arr);

			}
			jsonData.put("data", arr);
			
			System.out.println(jsonData);
		} else {
			System.out.println("데이터 없음");
		}
		
		return jsonData;
	}
}
