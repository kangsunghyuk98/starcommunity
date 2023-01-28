package com.example.service;

import com.example.dto.MemberTO;
import com.example.mapper.MapperInter;
import com.example.security.MemberUser;
import com.example.security.SecurityMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;

@Service
public class MemberUserDetailsService implements UserDetailsService {
    @Autowired
    private MapperInter mapperInter;
    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {

        SecurityMember securityMember = mapperInter.selectMemberKeyById(id); // DB에 회원이 존재하는지 검증
        if (securityMember == null) throw new UsernameNotFoundException("해당하는 유저가 없습니다.");

        securityMember.setAuthorities(Arrays.asList(new SimpleGrantedAuthority(securityMember.getRole())));

        return new MemberUser(securityMember);
    }
}
