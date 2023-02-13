package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.BeverageTO;
import com.example.dto.CustomRecipeTO;
import com.example.mapper.CustomMapperInter;

@Service
public class CustomService {

	@Autowired
	private CustomMapperInter mapper;
	
	public List<BeverageTO> customSelect(){
		List<BeverageTO> custom1 = mapper.allCustomMenu();
		return custom1;
	}
	public BeverageTO customInfo(BeverageTO to){
		to = mapper.customInfo(to); 
		return to;	
	}
	
	public List<CustomRecipeTO> selectCustomList(String seq){
		List<CustomRecipeTO> allCustom = mapper.selectCustomList(seq);
		return allCustom;
	}
	
	public int insertCustom(CustomRecipeTO cto) {
		
		int result = mapper.insertCustmRecipe(cto);
		
		int flag = 1;
		
		if (result == 1) {
			flag = 0;
		}else if(result == 0){
			flag = 1;
		}

		return flag;
	}
}
