package com.example.security;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum MemberRole {
    USER("ROLE_USER","회원"),
    ADMIN("ROLE_ADMIN","관리자");
    // 일반사용자와 관리자 권한 분리 USER : 0, ADMIN : 1

    final String role; // 생성자 주입을 통해 나중에 권한이 추가되더라도 노가다 안해도됨
    final String koRole; // 회원 / 관리자
}
