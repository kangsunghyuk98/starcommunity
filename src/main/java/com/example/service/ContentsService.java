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

    public int deleteMemberInfo(String id, String password) {

        String encPassword = mapperInter.selectPasswordById(id);
        boolean matchPass = passwordEncoder.matches(password,encPassword);

        int result = 0;
        int flag = 1;

        if (matchPass) {

            result = mapperInter.deleteMemberInfo(id, encPassword);

            if (result == 1) {
                flag = 0;
            }else {
                flag = 1;
            }

        }else {
            flag = 1;
        }

        return flag;
    }

}