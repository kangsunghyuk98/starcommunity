package com.example.controller;

import com.example.dto.BoardTO;
import com.example.service.ContentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private ContentsService contentsService;

    @RequestMapping("/")
    public String showMain() {
        return "index";
    }

    @RequestMapping("/index")
    public String showIndex(Model model) {

        int allMemberCount = contentsService.countAllMembers();
        int allBoardCounts = contentsService.countAllBoard();

        List<BoardTO> boardLists = contentsService.selectRecommendRanking();

        model.addAttribute("allMemberCount",allMemberCount);
        model.addAttribute("allBoardCounts",allBoardCounts);
        model.addAttribute("boardLists", boardLists);

        return "(1)mainpage/(1)main";
    }

    @RequestMapping("/about")
    public String showAbout() {
        return "(1.5)about/(1.5)About";
    }

    @RequestMapping("/recommend")
    public String showRecommendPage () {
        return "(1.7)recommend/(1.7)_recommend";
    }
}
