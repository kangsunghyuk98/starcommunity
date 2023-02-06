package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String showBeverageInfo( HttpServletRequest request, Model model) {
    	
    	BeverageTO to = new BeverageTO();
    	to.setName( request.getParameter( "name" ) );
    	
    	to = bs.beverageInfo(to);
    	
    	model.addAttribute("to", to );
    	
        return "(1.6)beverage/(1.6.1.1)BeverageInfo";
    } 
}
