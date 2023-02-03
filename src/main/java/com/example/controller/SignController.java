package com.example.controller;

import com.example.dto.MemberTO;
import com.example.security.MemberUser;
import com.example.security.SecurityMember;
import com.example.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/guest")
public class SignController {
    @Autowired
    private MemberService memberService;

    @RequestMapping("/login")
    public String loginTest() {
        return "(1.1)login/(1.1)login_form";
    }

    @RequestMapping("/login_ok")
    public String loginOk() {
        return "redirect:/";
    }

    @RequestMapping("/register")
    public String registerTest() {
        return "(1.1)login/(1.1.1)signup_form";
    } // 회원가입 중복확인 요청 받아야함

    @RequestMapping("/register_ok")
    public String registerTest(MemberTO to, Model model) {
        int flag = memberService.save(to);
        model.addAttribute("flag",flag);
        return "okaction/regist_ok";
    }

    @RequestMapping("/idcheck")
    public String isDuplicateId (@RequestParam("id") String id, Model model) {
        int result = memberService.isDuplicateId(id);
        model.addAttribute("result",result);
        return "okaction/idcheck";
    }

    @RequestMapping("/nickcheck")
    public String isDuplicateNick (@RequestParam("nickname") String nickname, Model model) {
        int result = memberService.isDuplicateNick(nickname);
        model.addAttribute("result",result);
        return "okaction/nickcheck";
    }

    @RequestMapping("/logout")
    public String logoutTest() {
        return "redirect:/home/index";
    }

    @RequestMapping("/findid")
    public String findIdView() {
        return "(1.1)login/(1.1.2)findID_form";
    }

    @RequestMapping("/findid_ok")
    public String findIdOk(@RequestParam("name") String name, @RequestParam("email") String email, Model model) {

        String id = memberService.findId(name,email);
        model.addAttribute("id",id);

        return "okaction/findid_ok";
    } // 아이디 찾기 처리완료

    @RequestMapping("/findpw")
    public String findPwView() {
        return "(1.1)login/(1.1.3)findPW_form";
    }

    @RequestMapping("/findpw_ok")
    public String findPwOk (MemberTO to, Model model) {

        int flag = memberService.findPw(to);
        model.addAttribute("flag",flag);

        return "okaction/findpw_ok";
    }





    // 하위 코드는 소셜 로그인 테스트용

    @RequestMapping("/test/login")
    public @ResponseBody String LoginTest(Authentication authentication, @AuthenticationPrincipal UserDetails userDetails) { // @AuthenticationPrincipal를 통해 세션정보 접근 가능
        MemberUser memberUser = (MemberUser) authentication.getPrincipal();
        System.out.println("authentication : " +memberUser.getId());
        System.out.println(userDetails.getUsername());
        return "일반 로그인 세션 정보 확인";
    }

    @RequestMapping("/test/oauth/login")
    public @ResponseBody String googleOauthLoginTest(Authentication authentication, @AuthenticationPrincipal OAuth2User oAuth2User) { // @AuthenticationPrincipal를 통해 세션정보 접근 가능
        OAuth2User oAuth2Users = (OAuth2User) authentication.getPrincipal();
        System.out.println("authentication : " +oAuth2Users.getAttributes());
        System.out.println("oauth2User :" + oAuth2User.getAttributes());
        return "OAuth 세션 정보 확인";
    }

    @RequestMapping("/test/logininfo")
    public @ResponseBody String showOAuthLoginInfo(@AuthenticationPrincipal SecurityMember securityMember) {
        System.out.println("SecurityMember : " + securityMember.getUsername());
        return "세션방식과 oauth 둘다 성공적으로 뽑아왔습니다";
    }

}
