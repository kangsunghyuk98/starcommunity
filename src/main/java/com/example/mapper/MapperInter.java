package com.example.mapper;

import com.example.dto.MemberTO;
import com.example.security.SecurityMember;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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

    @Select("select count(*) as count from member where id = #{id}")
    int isDuplicateId(String id); // 아이디 중복 검사 쿼리

    @Select("select count(*) as count from member where nickname = #{nickname}")
    int isDuplicateNick(String nickname); // 닉네임 중복 검사 쿼리

    @Select("select id from member where name = #{name} and email = #{email}")
    String findId(String name, String email); // 아이디 찾기 쿼리

    @Select("select count(*) from member where id = #{id} and name = #{name} and email = #{email}")
    int findPw(MemberTO to); // 비밀번호 찾기 쿼리

    @Update("update member set password = #{encodeUUIDPassword} where id = #{id} and name = #{name} and email = #{email}")
    int updateRawpasswordToUUID (String encodeUUIDPassword, String id, String name, String email);

}
