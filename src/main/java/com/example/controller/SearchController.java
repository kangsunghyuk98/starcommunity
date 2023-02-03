package com.example.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SearchController {
	
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
	
	@RequestMapping("/searchBoardList")
	public Object searchBoardList(@RequestBody String searchReq, String boardName ) {
		System.out.println(searchReq);
		System.out.println(boardName);
		
		JSONObject obj = new JSONObject();
		obj.put("seq", "2");
		obj.put("subject", "test2");
		
		JSONArray arr = new JSONArray();
		arr.add(obj);		
		
		JSONObject jsonData = new JSONObject();
		jsonData.put("data", arr);
		
		return jsonData;
	}
}
