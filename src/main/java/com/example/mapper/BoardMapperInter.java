package com.example.mapper;

import java.util.ArrayList;
import java.util.List;

import com.example.dto.BeverageCmtTO;
import com.example.dto.BoardCmtTO;
import com.example.dto.BoardLikeTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.example.dto.BoardTO;

@Mapper
@Repository
public interface BoardMapperInter {

	//페이징 쿼리
	@Select("select * from member join ${boardName} on member.memberkey = ${boardName}.memberkey order by seq desc "
			+ "limit #{startNo}, 10")
    List<BoardTO> selectAllListTen(String boardName, int startNo); // 게시글10개씩 페이징 처리
	
    @Select("select count(*) from member join ${boardName} on member.memberkey = ${boardName}.memberkey order by seq desc ")
    int selectAllListCount(String boardName);
	
    
	// 게시판 검색 쿼리
	@Select("select count(*) from member join ${boardName} on member.memberkey = ${boardName}.memberkey where nickname like CONCAT('%',#{searchReq},'%') order by seq desc ")
	int boardSearchWriterCount(String boardName, String searchReq);
	
	@Select("select * from member join ${boardName} on member.memberkey = ${boardName}.memberkey where nickname like CONCAT('%',#{searchReq},'%') order by seq desc "
			+ "limit #{startNo}, 10")
	public ArrayList<BoardTO> boardSearchWriterListTen(String boardName, String searchReq, int startNo);
	
	
	//제목, 내용 검색		
	@Select("select count(*) from member join ${boardName} on member.memberkey = ${boardName}.memberkey "
			+ "where subject like CONCAT('%',#{searchReq},'%') or content like CONCAT('%',#{searchReq},'%') order by seq desc ")
	int boardSearchSub_ConCount(String boardName, String searchReq);
	
	@Select("select * from member join ${boardName} on member.memberkey = ${boardName}.memberkey "
			+ "where subject like CONCAT('%',#{searchReq},'%') or content like CONCAT('%',#{searchReq},'%') order by seq desc " 
			+ "limit #{startNo}, 10")
	public ArrayList<BoardTO> boardSearchSub_ConListTen(String boardName, String searchReq, int startNo);

	
	// view
	@Select("select * from member join ${boardName} on member.memberkey = ${boardName}.memberkey where seq=#{seq} ")
	public BoardTO viewPageContents(String boardName, int seq);
	
	// 조회수
	@Update("update ${boardName} set hit = hit+1 where seq=#{seq}")
	public void viewPageHitUp(String boardName, int seq);
	
	// delete (글삭제)
	@Delete("delete from likecheck where boardname=#{boardname} and seq=#{seq}")
	public int deleteBoardLike(String boardname, int seq);
	
	@Delete("delete from ${cmtTablename} where seq=#{seq}")
	public int deleteBoardCmt(String cmtTablename, int seq);
	
	@Delete("delete from ${boardname} where seq=#{seq}")
	public int deleteBoardContent(String boardname, int seq);
	
	
	// write_ok (글쓰기)
	@Insert( "insert into ${boardname} values ( 0, #{to.subject}, #{to.content}, now(), 0, #{to.imgname}, #{to.imgformat}, 0, #{to.memberkey}, #{to.filesize})" )
	int boardWriteOk(String boardname, BoardTO to);
	
	// modify (글수정)
	@Select( "select * from ${boardname} where seq=#{seq}" )
	public BoardTO boardModify(String boardname, int seq);
	
	// modify_ok 
	@Select( "select imgname from ${boardname} where seq=#{seq}")
	String getOldFileName(String boardname, int seq);
	
	@Insert( "update ${boardname} set subject = #{to.subject}, content = #{to.content}, imgname = #{to.imgname}, imgformat = #{to.imgformat}, filesize = #{to.filesize} where seq=#{seq}" )
	int modifyOkUseNewfile(String boardname, BoardTO to, int seq);
	
	@Insert( "update ${boardname} set subject = #{to.subject}, content = #{to.content} where seq=#{seq}" )
	int modifyOkUseOldfile(String boardname, BoardTO to, int seq);
	
	
	// 여기서 부터 댓글 작성과 관련한 쿼리입니다.
	@Insert("insert into dlife_cmt values (0, #{comment}, now(), 0, #{seq}, #{memberKey})")
	int writeDlifeCmt(BoardCmtTO bto);

	@Insert("insert into md_cmt values (0, #{comment}, now(), 0, #{seq}, #{memberKey})")
	int writeMdCmt(BoardCmtTO bto);

	@Insert("insert into beverage_board_cmt values (0, #{comment}, now(), 0, #{seq}, #{memberKey})")
	int writeBeverageBoardCmt(BoardCmtTO bto);

	@Insert("insert into frequency_cmt values (0, #{comment}, now(), 0, #{seq}, #{memberKey})")
	int writeFrequencyCmt(BoardCmtTO bto);

	@Insert("insert into review_cmt values (0, #{comment}, now(), 0, #{seq}, #{memberKey})")
	int writeReviewCmt(BoardCmtTO bto);

	@Select("select member.memberkey, member.nickname, ${cmtName}.cseq, ${cmtName}.cdate, ${cmtName}.comment from ${cmtName} inner join member " +
			"on (${cmtName}.memberkey = member.memberkey) where ${cmtName}.seq = #{seq} order by cdate desc")
	List<BoardCmtTO> selectCmtList(String cmtName, int seq);

	@Select("select member.memberkey, member.nickname, ${cmtName}.cseq, ${cmtName}.cdate, ${cmtName}.comment from ${cmtName} inner join member " +
			"on (${cmtName}.memberkey = member.memberkey) where ${cmtName}.seq = #{seq} order by cdate desc limit ${addNum}, 3")
	List<BoardCmtTO> selectAddCmtList(String cmtName, int seq, int addNum);
	
	@Delete("delete from ${cmtName} where cseq = #{cseq}")
	int deleteCmt(String cseq, String cmtName);

	
	
	// 좋아요 기능 쿼리

	@Insert("insert into likecheck values (0, #{memberKey}, #{seq}, #{boardname})")
	int insertLikeMember(BoardLikeTO boardLikeTO);

	@Delete("delete from likecheck where memberkey = #{memberKey} and seq = #{seq} and boardname = #{boardname}")
	int deleteLikeMember(BoardLikeTO boardLikeTO);

	@Select("select count(*) from likecheck where memberkey = #{memberKey} and seq = #{seq} and boardname = #{boardname}")
	int checkLikeMember(BoardLikeTO boardLikeTO);

	@Update("update ${boardname} set recommend = recommend + 1 where seq = #{seq}")
	int clickLike(String boardname, String seq);

	@Update("update ${boardname} set recommend = recommend - 1 where seq = #{seq}")
	int cancleLike(String boardname, String seq);

}
