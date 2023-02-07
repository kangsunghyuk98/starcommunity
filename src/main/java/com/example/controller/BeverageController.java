package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.example.dto.BeverageCmtTO;
import com.example.security.SecurityMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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

}
