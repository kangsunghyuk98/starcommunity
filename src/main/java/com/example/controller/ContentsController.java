package com.example.controller;

import com.example.dto.BoardTO;
import com.example.dto.MemberTO;
import com.example.dto.Pagination;
import com.example.service.ContentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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
    public String deleteOkMyinfo(@RequestParam("id") String id, @RequestParam("password") String password,
                                 @RequestParam("memberKey") String memberKey, Model model) {



        int flag = contentsService.deleteMemberInfo(id, password, memberKey);
        model.addAttribute("flag",flag);

        return "okaction/myinfo_delete_ok";
    }

    @RequestMapping("/myboardlists")
    public String viewMyBoardList (@RequestParam("memberKey") String memberKey,
                                   @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                                   Model model) {

        int allMyBoardListCount = contentsService.selectAllMyBoardList(memberKey).size();

        Pagination pagination = new Pagination(allMyBoardListCount, currentPage);
        List<BoardTO> allMyBoardLists = contentsService.selectAllMyBoardList(memberKey,pagination.getStartIndex());

        model.addAttribute("allMyBoardListCount",allMyBoardListCount);
        model.addAttribute("allMyBoardLists",allMyBoardLists);

        model.addAttribute("pagination", pagination);
        model.addAttribute("memberKey",memberKey);

        return "(1.4)myPage/(1.4.2)mypage_write_list";
    }



}
