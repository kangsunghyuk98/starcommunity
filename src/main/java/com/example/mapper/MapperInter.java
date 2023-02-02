package com.example.mapper;

import com.example.dto.MemberTO;
import com.example.security.SecurityMember;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MapperInter {
    
    // 여기서 부터 회원가입과 로그인에 관련된 쿼리임

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

    @Update("update member set password = #{encodeUUIDPassword} where id = #{id} and name = #{name} and email = #{email}")
    int updateRawpasswordToUUID (String encodeUUIDPassword, String id, String name, String email); // 임시비밀번호 발급을 위한 쿼리



    // 여기서 부터는 관리자가 회원을 관리하기 위한 쿼리임
    @Select("select * from member where role = 'ROLE_USER'")
    List<MemberTO> selectAllMember(); // 관리자 페이지에서 모든 멤버를 뽑아오는 쿼리

    @Select("select count(*) from member where role = 'ROLE_USER'")
    int selectAllMemberCount(); // 모든 유저권한 가진 멤버를 select하는 쿼리

    @Select("select * from member where role = 'ROLE_USER' limit #{startNo},10")
    List<MemberTO> selectAllMemberTen(int startNo); // 관리자 페이지에서 10명씩 페이징 처리 쿼리

    @Select("select * from member where id like #{keyword}")
    List<MemberTO> selectUseConditionId(String keyword);

    @Select("select * from member where nickname like #{keyword}")
    List<MemberTO> selectUseConditionNickname(String keyword);

    @Select("select * from member where name like #{keyword}")
    List<MemberTO> selectUseConditionName(String keyword);

}
