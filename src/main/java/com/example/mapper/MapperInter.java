package com.example.mapper;

import com.example.dto.BoardTO;
import com.example.dto.MemberTO;
import com.example.security.SecurityMember;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MapperInter {
    
    // 여기서 부터 회원가입과 로그인에 관련된 쿼리임

    @Insert("insert into member values (0, #{id}, #{role},#{password}, #{nickname}, #{name}, #{email},'','')")
    int save(MemberTO to);

    @Select("select memberkey, id, role, password, nickname, name, email, provider, providerid from member where id = #{username}")
    MemberTO selectAllInfo(String username);

    @Insert("insert into member values (0, #{id}, #{role},#{password}, #{nickname}, #{name}, #{email},#{provider},#{providerId})")
    int oauthSave(MemberTO to);

    @Select("select memberkey, id, role, password, nickname, name, email, provider, providerid from member where id = #{username}")
    MemberTO selectMemberKeyById(String username); // MemberUserDetailsService에서 회원정보 가져오기 위한 메서드

    @Select("select memberkey, id, role, password, nickname, name, email, provider, providerid from member where id = #{username}")
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

    @Delete("delete from member where memberkey = #{memberKey}")
    int memberDelete(int memberKey);




    //여기서 부터는 멤버의 컨텐츠 관련 쿼리임
    @Update("update member set nickname = #{nickname}, email = #{email}, password = #{password} where memberkey = #{memberKey}")
    int modifyMemberInfo(MemberTO to); // 내정보 수정 쿼리

    // 회원 탈퇴 전 모든 memberKey랑 연관된 부분 삭제 처리 시작
    @Delete("delete from dlife_board where memberkey = #{memberKey}")
    int deleteMyDlifeBoard(String memberKey);

    @Delete("delete from md_board where memberkey = #{memberKey}")
    int deleteMyMdBoard(String memberKey);

    @Delete("delete from review_board where memberkey = #{memberKey}")
    int deleteMyReviewBoard(String memberKey);

    @Delete("delete from frequency_board where memberkey = #{memberKey}")
    int deleteMyFrequencyBoard(String memberKey);

    @Delete("delete from beverage_board where memberkey = #{memberKey}")
    int deleteMyBeverageBoard(String memberKey);

    @Delete("delete from dlife_cmt where memberkey = #{memberKey}")
    int deleteMyDlifeCmt(String memberKey);

    @Delete("delete from md_cmt where memberkey = #{memberKey}")
    int deleteMyMdCmt(String memberKey);

    @Delete("delete from beverage_board_cmt where memberkey = #{memberKey}")
    int deleteMyBeverageBoradCmt(String memberKey);

    @Delete("delete from frequency_cmt where memberkey = #{memberKey}")
    int deleteMyFrequencyCmt(String memberKey);

    @Delete("delete from review_cmt where memberkey = #{memberKey}")
    int deleteMyReviewCmt(String memberKey);

    @Delete("delete from beverage_cmt where memberkey = #{memberKey}")
    int deleteMyBeverageCmt(String memberKey);

    @Delete("delete from likecheck where memberkey = #{memberKey}")
    int deleteMyLikecheck(String memberKey);

    @Delete("delete from member where id = #{id} and password = #{password}")
    int deleteMemberInfo(String id, String password);

    @Select("select password from member where id = #{id}")
    String selectPasswordById(String id); // 비밀번호를 비교하기 위해 인코딩된 비번 뽑아오기



    // 내가 쓴글 조회에서 사용되는 쿼리
    @Select("select seq, subject, wdate, (select table_name from information_schema.tables where table_schema = schema() and table_name = 'dlife_board') as boardname " +
            "from dlife_board where memberkey = #{memberKey}")
    List<BoardTO> selectAllMyDlifeBoards(String memberKey); // dlife_board select

    @Select("select seq, subject, wdate, (select table_name from information_schema.tables where table_schema = schema() and table_name = 'md_board') as boardname " +
            "from md_board where memberkey = #{memberKey}")
    List<BoardTO> selectAllMyMdBoards(String memberKey); // md_board select

    @Select("select seq, subject, wdate, (select table_name from information_schema.tables where table_schema = schema() and table_name = 'review_board') as boardname " +
            "from review_board where memberkey = #{memberKey}")
    List<BoardTO> selectAllMyReviewBoards(String memberKey); // review_board select

    @Select("select seq, subject, wdate, (select table_name from information_schema.tables where table_schema = schema() and table_name = 'frequency_board') as boardname " +
            "from frequency_board where memberkey = #{memberKey}")
    List<BoardTO> selectAllMyFrequencyBoards(String memberKey); // frequency_board select

    @Select("select seq, subject, wdate, (select table_name from information_schema.tables where table_schema = schema() and table_name = 'beverage_board') as boardname " +
            "from beverage_board where memberkey = #{memberKey}")
    List<BoardTO> selectAllMyBeverageBoards(String memberKey); // frequency_board select



    // 메인에서 사용될 전체 사용자와 게시글 조회쿼리
    @Select("select count(*) from member where role = 'ROLE_USER'")
    int countAllMember();

    @Select("select count(*) from dlife_board")
    int countAllDlifeBoard();

    @Select("select count(*) from beverage_board")
    int countAllBeverageBoard();

    @Select("select count(*) from md_board")
    int countAllMdBoard();

    @Select("select count(*) from frequency_board")
    int countAllFrequencyBoard();

    @Select("select count(*) from review_board")
    int countAllReviewBoard();

    // 메인에서 사용될 실시간 추천글 순위 가져오는 쿼리
    @Select("select * from beverage_board" +
            " inner join member on (beverage_board.memberkey = member.memberkey)" +
            " union all" +
            " select * from dlife_board" +
            " inner join member on (dlife_board.memberkey = member.memberkey)" +
            " union all" +
            " select * from frequency_board" +
            " inner join member on (frequency_board.memberkey = member.memberkey)" +
            " union all" +
            " select * from md_board" +
            " inner join member on (md_board.memberkey = member.memberkey)" +
            " union all" +
            " select * from review_board" +
            " inner join member on (review_board.memberkey = member.memberkey)" +
            " order by recommend desc" +
            " limit 5")
    List<BoardTO> selectRecommendRanking();

}
