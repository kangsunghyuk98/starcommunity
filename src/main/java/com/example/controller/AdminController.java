package com.example.controller;

import com.example.dto.MemberTO;
import com.example.dto.Pagination;
import com.example.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/main")
    public String showAdminPage(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

        int allMember = adminService.selectAllMemberCount();

        Pagination pagination = new Pagination(allMember,currentPage);
        List<MemberTO> memberList = adminService.selectAllMemberTen(pagination.getStartIndex());

        model.addAttribute("memberList",memberList);
        model.addAttribute("allMember",allMember);

        model.addAttribute("pagination",pagination);

        return "hyowon/(1.2)_managerPage";
    }

    @RequestMapping("/main_search")
    public String showSearchPage (@RequestParam(value = "selectCondition", defaultValue = "") String selectCondition,
                                  @RequestParam(value = "keyword", defaultValue = "") String keyword, Model model){

        List<MemberTO> memberList = adminService.selectUseCondition(selectCondition,keyword);

        if (selectCondition.equals("") || keyword.equals("")) {
            return "/okaction/adminredirect";
        } else {
            model.addAttribute("memberList",memberList);
            return "hyowon/(1.2)_managerPage";
        }
    }

    @RequestMapping("/member_delete")
    public String memberDelete(@RequestParam("memberkey") int memberKey, Model model) {
        int result = adminService.memberDelete(memberKey);
        model.addAttribute("result",result);
        return "okaction/admin_memberdelete_ok";
    }


}
