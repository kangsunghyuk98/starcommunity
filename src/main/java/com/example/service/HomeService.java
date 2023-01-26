package com.example.service;

import com.example.mapper.MapperInter;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeService {

    @Autowired
    private MapperInter mapperInter;

    public String selectNow() {
        return mapperInter.selectNow();
    }
}
