package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.BeverageTO;
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
}
