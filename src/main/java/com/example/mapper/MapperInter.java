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

    @Insert("insert into member values (0, #{id}, #{role},#{password}, #{nickname}, #{name}, #{email},'','')")
    int save(MemberTO to);

    @Insert("insert into member values (0, #{id}, #{role},#{password}, #{nickname}, #{name}, #{email},#{provider},#{providerId})")
    int oauthSave(MemberTO to);

    @Select("select id, role, password, nickname, name, email, provider, providerid from member where id = #{username}")
    MemberTO selectMemberKeyById(String username); // MemberUserDetailsService에서 회원정보 가져오기 위한 메서드

    @Select("select id, role, password, nickname, name, email, provider, providerid from member where id = #{username}")
    MemberTO oauthSelectMemberKeyById(String username); // PrincipalOauth2UserService에서 회원정보 가져오기 위한 메서드

    @Select("select id from member where name = #{name} and email = #{email}")
    String findId(String name, String email); // 아이디 찾기 쿼리
}
