package com.example.service;

import com.example.dto.MemberTO;
import com.example.mapper.MapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class ContentsService {

    @Autowired
    private MapperInter mapperInter;

    @Autowired
    private PasswordEncoder passwordEncoder;


    public int modifyMemberInfo(MemberTO to) {
        to.setPassword(passwordEncoder.encode(to.getPassword()));

        int result = mapperInter.modifyMemberInfo(to);
        int flag = 1;

        if (result == 1) {
            flag = 0;
        } else {
            flag = 1;
        }
        return flag;
    }
}
