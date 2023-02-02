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

    public int selectAllMemberCount() {
        int memberCount = mapperInter.selectAllMemberCount();
        return memberCount;
    }

    public List<MemberTO> selectAllMemberTen(int startNo) {
        List<MemberTO> allTenMember = mapperInter.selectAllMemberTen(startNo);
        return allTenMember;
    }

}
