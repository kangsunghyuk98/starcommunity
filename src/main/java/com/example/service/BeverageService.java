package com.example.service;

import java.util.List;

import com.example.dto.BeverageCmtTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.BeverageTO;
import com.example.mapper.BeverageMapperInter;
@Service
public class BeverageService {
	
	@Autowired
	private BeverageMapperInter mapper;
//음료 전체	
	public List<BeverageTO> selectAllBeverage(){
		List<BeverageTO> allBeverage = mapper.selectAllBeverage();
		return allBeverage;		
	}
	
	
//음료 카테고리별	
	public List<BeverageTO> selectCategory(String category){
		List<BeverageTO> selCategory = mapper.selectCategory(category);
		return selCategory;
	}
	
//음료 상세페이지	
	public BeverageTO beverageInfo(BeverageTO to) {
		
		to = mapper.BeverageInfo(to); 
		
		return to;
		
	}

	public BeverageTO beverageInfoBySeq(BeverageTO to) {
		to = mapper.BeverageInfoBySeq(to);
		return to;
	}
	
// -------------------------------------------음료 정렬
	
	public List<BeverageTO> orderKcalDesc(){
		List<BeverageTO> kcalDesc = mapper.kcalDesc();
		
		return kcalDesc;
	}
	
	public List<BeverageTO> orderKcalAsc(){
		List<BeverageTO> kcalAsc = mapper.kcalAsc();
		
		return kcalAsc;
	}
	
	public List<BeverageTO> orderCaffeineDesc(){
		List<BeverageTO> caffeineDesc = mapper.caffeineDesc();
		
		return caffeineDesc;
	}
	
	public List<BeverageTO> orderCaffeineAsc(){
		List<BeverageTO> caffeineAsc = mapper.caffeineAsc();
		
		return caffeineAsc;
	}
	
	public List<BeverageTO> orderSat_fatDesc(){
		List<BeverageTO> sat_fatDesc = mapper.sat_fatDesc();
		
		return sat_fatDesc;
	}
	
	public List<BeverageTO> orderSat_fatAsc(){
		List<BeverageTO> sat_fatAsc = mapper.sat_fatAsc();
		
		return sat_fatAsc;
	}
	
	public List<BeverageTO> orderSugarsDesc(){
		List<BeverageTO> sugarsDesc = mapper.sugarsDesc();
		
		return sugarsDesc;
	}
	
	public List<BeverageTO> orderSugarsAsc(){
		List<BeverageTO> sugarsAsc = mapper.sugarsAsc();
		
		return sugarsAsc;
	}
	
	
//-----------------------------------음료 카테고리별 정렬
	public List<BeverageTO> orderKcalDescCategory(String category){
		List<BeverageTO> kcalDesc = mapper.kcalDescCategory(category);
		
		return kcalDesc;
	}
	
	public List<BeverageTO> orderKcalAscCategory(String category){
		List<BeverageTO> kcalAsc = mapper.kcalAscCategory(category);
		
		return kcalAsc;
	}
	
	public List<BeverageTO> orderCaffeineDescCategory(String category){
		List<BeverageTO> caffeineDesc = mapper.caffeineDescCategory(category);
		
		return caffeineDesc;
	}
	
	public List<BeverageTO> orderCaffeineAscCategory(String category){
		List<BeverageTO> caffeineAsc = mapper.caffeineAscCategory(category);
		
		return caffeineAsc;
	}
	
	public List<BeverageTO> orderSat_fatDescCategory(String category){
		List<BeverageTO> sat_fatDesc = mapper.sat_fatDescCategory(category);
		
		return sat_fatDesc;
	}
	
	public List<BeverageTO> orderSat_fatAscCategory(String category){
		List<BeverageTO> sat_fatAsc = mapper.sat_fatAscCategory(category);
		
		return sat_fatAsc;
	}
	
	public List<BeverageTO> orderSugarsDescCategory(String category){
		List<BeverageTO> sugarsDesc = mapper.sugarsDescCategory(category);
		
		return sugarsDesc;
	}
	
	public List<BeverageTO> orderSugarsAscCategory(String category){
		List<BeverageTO> sugarsAsc = mapper.sugarsAscCategory(category);
		
		return sugarsAsc;
	}
	
// 음료 검색
	public List<BeverageTO> beverageSearch(String searchReq) {
		List<BeverageTO> bSearch = mapper.beverageSearch(searchReq);
		
		return bSearch;
	}
//음료 카테고리별 검색	
	public List<BeverageTO> beverageSearchCategory(String category,String searchReq) {
		List<BeverageTO> bSearch = mapper.beverageSearchCategory(category,searchReq);
		
		return bSearch;
	}

	// Beverage 댓글관련 쿼리
	public int beverageCmtWrite(BeverageCmtTO to) {
		int result = mapper.beverageCmtWrite(to);
		int flag = 1;

		if (result == 1) {
			flag = 0;
		}else {
			flag = 1;
		}
		return flag;
	}

	public List<BeverageCmtTO> selectAllCmtList(String seq) {
		List<BeverageCmtTO> AllCmtList = mapper.selectAllCmtList(seq);
		return AllCmtList;
	}
	
	public int deleteBeverageCmt (String bevcseq) {
		int result = mapper.deleteBeverageCmt(bevcseq);
		int flag = 1;

		if (result == 1) {
			flag = 0;
		} else {
			flag = 1;
		}
		return flag;
	}

}


