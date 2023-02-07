package com.example.controller;

import com.example.dto.MemberTO;
import com.example.service.ContentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class ContentsController {

    @Autowired
    private ContentsService contentsService;

    @RequestMapping("/myinfo")
    public String showMyinfo() {
        return "(1.4)myPage/(1.4.1)mypage_info";
    }

    @RequestMapping("/myinfo_modify")
    public String modifyMyinfo() {
        return "(1.4)myPage/(1.4.1.1)mypage_info_modify";
    }

    @RequestMapping("/myinfo_modify_ok")
    public String modifyMyinfoOk(MemberTO to, Model model) {

        System.out.println(to.getNickname());
        System.out.println(to.getEmail());
        System.out.println(to.getPassword());
        System.out.println(to.getMemberKey());

        int flag = contentsService.modifyMemberInfo(to);
        model.addAttribute("flag",flag);

        return "okaction/myinfo_modify_ok";
    }

    @RequestMapping("/myinfo_delete_ok")
    public String deleteOkMyinfo(@RequestParam("id") String id, @RequestParam("password") String password, Model model) {

        int flag = contentsService.deleteMemberInfo(id,password);
        model.addAttribute("flag",flag);

        return "okaction/myinfo_delete_ok";
    }

}