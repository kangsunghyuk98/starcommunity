package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.BeverageTO;
import com.example.dto.BoardTO;
import com.example.dto.CustomRecipeTO;
import com.example.mapper.BoardMapperInter;
import com.example.service.CustomService;

@Controller
public class CustomController {
	
	@Autowired
	private CustomService cs;
	
    // 커스텀 레시피 탭 mapping-----------------------------------------------------------
	@RequestMapping("/Custom1")
    public String showCustom1(HttpServletRequest request, Model model) {
        List<BeverageTO> customLists = cs.customSelect();
        
        model.addAttribute("customLists",customLists);
    	
    	return "(1.8)customRecipe/(1.8)custom1";
    }
    @RequestMapping("/Custom2")
    public String showCustom2(HttpServletRequest request, Model model) {
    	String name = request.getParameter("name");
        System.out.println(name);

        BeverageTO to = new BeverageTO();
        to.setSeq(request.getParameter("seq"));
        to.setName(request.getParameter("name") );
        to.setImage(request.getParameter("image") );
        to = cs.customInfo(to);
        
        List<CustomRecipeTO> allCustom = cs.selectCustomList(to.getSeq());
        
        model.addAttribute("to",to);
        model.addAttribute("allCustom",allCustom);
        
        return "(1.8)customRecipe/(1.8.1)custom2";
    }
    
    @RequestMapping("/CustomInsert")
    public String insertCustomRecipe(CustomRecipeTO cto, Model model) {
    	
    	int flag = cs.insertCustom(cto);
    	model.addAttribute("flag",flag);
		model.addAttribute("seq",cto.getSeq());

    
    	
    	return "okaction/custom_ok";
    }
    
    @RequestMapping("/CustomDelete")
    public String deleteCustomRecipe(CustomRecipeTO cto, Model model) {
    	
    	String memberkey = cto.getMemberKey();
    	
    	int flag = cs.deleteCustom(cto);
    	model.addAttribute("flag", flag);
    	model.addAttribute("memberkey", memberkey);
    	
    	return "okaction/custom_delete_ok";
    }
}
