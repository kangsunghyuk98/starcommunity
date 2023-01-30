package com.example.controller;

import com.example.dto.MemberTO;
import com.example.security.MemberUser;
import com.example.security.SecurityMember;
import com.example.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/guest")
public class MemberController {
    @Autowired
    private TestService testService;

    @RequestMapping("/login")
    public String loginTest() {
        return "login";
    } // 로그인 테스트

    @RequestMapping("/login_ok")
    public String loginTestOk() {
        return "redirect:/";
    } // 로그인 테스트

    @RequestMapping("/register")
    public String registerTest() {
        return "register";
    } // 회원가입 테스트

    @RequestMapping("/register_ok")
    public String registerTest(MemberTO to) {
        testService.save(to);
        return "login";
    }

    @RequestMapping("/logout")
    public String logoutTest() {
        return "redirect:/";
    }

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
