package com.example.service;

import com.example.dto.MemberTO;
import com.example.mapper.MapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    private MapperInter mapperInter;

    public List<MemberTO> selectAllMember() {
        List<MemberTO> allMember = mapperInter.selectAllMember();
        return allMember;
    }

}
