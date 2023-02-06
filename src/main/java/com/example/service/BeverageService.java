package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.BeverageTO;
import com.example.mapper.BeverageMapperInter;
@Service
public class BeverageService {
	@Autowired
	private BeverageMapperInter mapper;
	
	public List<BeverageTO> selectAllBeverage(){
		List<BeverageTO> allBeverage = mapper.selectAllBeverage();
		return allBeverage;		
	}
	
	public List<BeverageTO> selectCategory(String category){
		List<BeverageTO> selCategory = mapper.selectCategory(category);
		return selCategory;
	}
	
	public BeverageTO beverageInfo(BeverageTO to) {
		
		to = mapper.BeverageInfo(to); 
		
		return to;
		
	}
	
// ----------
	
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
}


