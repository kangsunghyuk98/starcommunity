package com.example.security;

import lombok.Getter;
import org.springframework.security.core.userdetails.User;

@Getter // 인증정보 활용하기 위해서 사용
public class MemberUser extends User {

    private String nickname;
    private String id;

    public MemberUser(SecurityMember securityMember) {
        super(securityMember.getId(), securityMember.getPassword(), securityMember.getAuthorities());

        nickname = securityMember.getNickname();
        id = securityMember.getId();
    }
} // MemberUserDetailsService의 loadUserByUsername에서 요구하는 타입을 맞추기 위해 생성한 클래스
