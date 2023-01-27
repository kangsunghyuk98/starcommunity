package com.example.service;

import com.example.dto.MemberTO;
import com.example.mapper.MapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {

    @Autowired
    private MapperInter mapperInter;

    public int save(MemberTO to) {

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
