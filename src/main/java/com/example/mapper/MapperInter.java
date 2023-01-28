package com.example.mapper;

import com.example.dto.MemberTO;
import com.example.security.SecurityMember;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MapperInter {

    @Select("select now() as now")
    String selectNow();

    @Insert("insert into member values (0, #{id}, #{role},#{password}, #{nickname}, #{name}, #{email})")
    int save(MemberTO to);

    @Select("select id, password, role, nickname from member where id = #{id}")
    SecurityMember selectMemberKeyById(String id); // MemberUserDetailsService에서 회원정보 가져오기 위한 메서드
}
