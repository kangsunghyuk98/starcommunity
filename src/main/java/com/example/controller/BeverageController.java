package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.example.dto.BeverageCmtTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.BeverageTO;
import com.example.service.BeverageService;

@Controller
public class BeverageController {
	
	@Autowired
	private BeverageService bs;

    // 베버리지 탭 mapping-----------------------------------------------------------
	
	@RequestMapping("/BeverageList")
    public String showBeverageList(HttpServletRequest request, Model model) {
		StringBuffer url = request.getRequestURL();
		String urlNow = url.toString();
		System.out.println(url);
		String category = request.getParameter("category");
		
		//음료 목록별 이름 설정
		BeverageTO to = new BeverageTO();
		if( category !=null) {
		to.setCategory(request.getParameter("category"));
		}else {
			to.setCategory("음료 전체");
		}
		model.addAttribute("to", to );
		
		 
		List<BeverageTO> beverageLists;
		
		if(category != null) {
			
			beverageLists = bs.selectCategory(category); 

		}else {
			beverageLists = bs.selectAllBeverage(); 
		}
		model.addAttribute("beverageLists", beverageLists); 
		
        
		return "(1.6)beverage/(1.6.1)BeverageList";
		
    }



	@RequestMapping("/BeverageInfo")
	public String showBeverageInfo(HttpServletRequest request, Model model) {

		BeverageTO to = new BeverageTO();
		to.setName( request.getParameter( "name" ) );
		to.setSeq(request.getParameter("seq"));
		to = bs.beverageInfoBySeq(to);

		List<BeverageCmtTO> allCmtList = bs.selectAllCmtList(to.getSeq());

		model.addAttribute("to", to );
		model.addAttribute("allCmtList", allCmtList);

		return "(1.6)beverage/(1.6.1.1)BeverageInfo";
	}

	@RequestMapping("/Beverage_cmtok")
	public String beverageCmtOk (BeverageCmtTO to, Model model) {

		int flag = bs.beverageCmtWrite(to);
		model.addAttribute("flag",flag);
		model.addAttribute("seq",to.getSeq());

		return "okaction/beverage_cmt_ok";
	}
	
	@RequestMapping("/Beverage_cmt_delete")
	public String beverageCmtDelete (@RequestParam("bevcseq") String bevcseq, Model model) {

		int flag = bs.deleteBeverageCmt(bevcseq);
		model.addAttribute("flag",flag);

		return "okaction/beverage_cmt_delete";
	}
	
	@RequestMapping("/Beverage_add_cmt")
	@ResponseBody
	public List<BeverageCmtTO> beverageAddCmt(@RequestParam("seq")String seq, @RequestParam("addNum")int addNum) {
		
		List<BeverageCmtTO> addCmtList = bs.selectAddCmtList(seq, addNum);
		return addCmtList;
	}
	
//---------------------------------------------------------------------------음료 정렬
    
    
    @RequestMapping("/BeverageSort")  
    @ResponseBody
    public Object BeverageSort(String selOpt, String category, HttpServletRequest request) {
    	String category1 = request.getParameter("category");
    	String selAll = "음료 전체";
    	System.out.println(category1);
    	System.out.println(category);
    	System.out.println(selOpt);
    	System.out.println("실행되었음");
    	System.out.println("실행되었음2");
    	String option1 ="kcal_desc";
    	String option2 ="kcal_asc";
    	String option3 ="caffeine_desc";
    	String option4 ="caffeine_asc";
    	String option5 ="sat_fat_desc";
    	String option6 ="sat_fat_asc";
    	String option7 ="sugars_desc";
    	String option8 ="sugars_asc";
    	
    	List<BeverageTO> beverageLists;
    	
    	//카테고리가 "음료 전체"가 아닌지 구별
    	if(!category1.equals(selAll)) {
    		if(selOpt.equals(option1)) {
        		System.out.println("categoryOption 선택 : " + option1);
        		beverageLists = bs.orderKcalDescCategory(category1);     		
        	}else if( selOpt.equals(option2) ) {
        		System.out.println("categoryOption 선택 : " + option2);
        		beverageLists = bs.orderKcalAscCategory(category1);
        	}else if( selOpt.equals(option3) ) {
        		System.out.println("categoryOption 선택 : " + option3);
        		beverageLists = bs.orderCaffeineDescCategory(category1);
        	}else if( selOpt.equals(option4) ) {
        		System.out.println("categoryOption 선택 : " + option4);
        		beverageLists = bs.orderCaffeineAscCategory(category1);
        	}else if( selOpt.equals(option5) ) {
        		System.out.println("categoryOption 선택 : " + option5);
        		beverageLists = bs.orderSat_fatDescCategory(category1);
        	}else if( selOpt.equals(option6) ) {
        		System.out.println("categoryOption 선택 : " + option6);
        		beverageLists = bs.orderSat_fatAscCategory(category1);
        	}else if( selOpt.equals(option7) ) {
        		System.out.println("categoryOption 선택 : " + option7);
        		beverageLists = bs.orderSugarsDescCategory(category1);
        	}else if( selOpt.equals(option8) ) {
        		System.out.println("categoryOption 선택 : " + option8);
        		beverageLists = bs.orderSugarsAscCategory(category1);
        	}else {
        		beverageLists = bs.selectCategory(category1);
        	}
    	}else {
    	
    	 if(selOpt.equals(option1)) {
    		System.out.println("option 선택 : " + option1);
    		beverageLists = bs.orderKcalDesc();     		
    	}else if( selOpt.equals(option2) ) {
    		System.out.println("option 선택 : " + option2);
    		beverageLists = bs.orderKcalAsc();
    	}else if( selOpt.equals(option3) ) {
    		System.out.println("option 선택 : " + option3);
    		beverageLists = bs.orderCaffeineDesc();
    	}else if( selOpt.equals(option4) ) {
    		System.out.println("option 선택 : " + option4);
    		beverageLists = bs.orderCaffeineAsc();
    	}else if( selOpt.equals(option5) ) {
    		System.out.println("option 선택 : " + option5);
    		beverageLists = bs.orderSat_fatDesc();
    	}else if( selOpt.equals(option6) ) {
    		System.out.println("option 선택 : " + option6);
    		beverageLists = bs.orderSat_fatAsc();
    	}else if( selOpt.equals(option7) ) {
    		System.out.println("option 선택 : " + option7);
    		beverageLists = bs.orderSugarsDesc();
    	}else if( selOpt.equals(option8) ) {
    		System.out.println("option 선택 : " + option8);
    		beverageLists = bs.orderSugarsAsc();
    	}else {
    		beverageLists = bs.selectAllBeverage(); 
    	}
	}
    	
    	JSONArray arr = new JSONArray();
    	JSONObject jsonObject = new JSONObject();
    	
    	System.out.println( "현재 선택된 옵션 : " + selOpt);
    	
    	for( BeverageTO to : beverageLists) {
			JSONObject obj = new JSONObject();
			
			obj.put("seq", to.getSeq());
			obj.put("category", to.getCategory());
			obj.put("name", to.getName() );
			obj.put("engName", to.getEngName() );
			obj.put("image", to.getImage() );
			obj.put("productInfo", to.getProductInfo() );
			obj.put("kcal", to.getKcal() );
			obj.put("sat_fat", to.getSat_fat() );
			obj.put("protein", to.getProtein() );
			obj.put("sodium", to.getSodium() );
			obj.put("sugars", to.getSugars() );
			obj.put("caffeine", to.getCaffeine() );
			obj.put("allergyCause", to.getAllergyCause() );
			obj.put("drinkInfo", to.getDrinkInfo() );
			
			arr.add(obj);
			
		}
    	System.out.println("json 성공");
    	jsonObject.put("data", arr );   
    	
    	return jsonObject; 
    	
    }
    
//---------------------------------------------------------------------------음료 검색
    
    @RequestMapping("/BeverageSearch")
    @ResponseBody
	public Object BeverageSearch(String searchReq,HttpServletRequest request,String category) {
    	String selAll = "음료 전체";
    	System.out.println(searchReq);	
		String category1 = request.getParameter("category");
		System.out.println(category1);
		
		List<BeverageTO> beverageSearch; 
		
		//카테고리가 "음료 전체"인지 아닌지 구별
		if(!category1.equals(selAll)) {
			beverageSearch= bs.beverageSearchCategory(category,searchReq);
		}else {
			beverageSearch= bs.beverageSearch(searchReq);
		}
		JSONArray arr = new JSONArray();
    	JSONObject jsonData = new JSONObject();    	
    	
    	for( BeverageTO to : beverageSearch) {
			JSONObject obj = new JSONObject();
			
			obj.put("seq", to.getSeq());
			obj.put("category", to.getCategory());
			obj.put("name", to.getName() );
			obj.put("engName", to.getEngName() );
			obj.put("image", to.getImage() );
			obj.put("productInfo", to.getProductInfo() );
			obj.put("kcal", to.getKcal() );
			obj.put("sat_fat", to.getSat_fat() );
			obj.put("protein", to.getProtein() );
			obj.put("sodium", to.getSodium() );
			obj.put("sugars", to.getSugars() );
			obj.put("caffeine", to.getCaffeine() );
			obj.put("allergyCause", to.getAllergyCause() );
			obj.put("drinkInfo", to.getDrinkInfo() );
			
			arr.add(obj);
			
		}
    	System.out.println("json 성공");
    	jsonData.put("data", arr );   
    	
    	return jsonData; 
    	
    }
    
}
