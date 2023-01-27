package com.example.service;

import com.example.dto.MemberTO;
import com.example.mapper.MapperInter;
import com.example.security.MemberRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class TestService {

    @Autowired
    private MapperInter mapperInter;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public int save(MemberTO to) {

        String encodePassword = passwordEncoder.encode(to.getPassword());
        to.setPassword(encodePassword); // 암호화한 비밀번호로 set

        to.setRole(MemberRole.USER.getKoRole()); // 일반 유저 적용

        int result = mapperInter.save(to);
        int flag = 1;

        if (result == 1) {
            flag = 0;
        } else {
            flag = 1;
        }
        return flag;
    }



}
