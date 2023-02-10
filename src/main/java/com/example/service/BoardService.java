package com.example.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.example.dto.BoardCmtTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.dto.BoardTO;
import com.example.mapper.BoardMapperInter;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapperInter mapper;
	
	// application.properties에서 multipart.location 값 가져오기
	@Value("${spring.servlet.multipart.location}")
	private String multipartLocation;
	
	// 게시판 List 페이징
    public int selectAllListCount(String boardName) {
        int ListCount = mapper.selectAllListCount(boardName);
        return ListCount;
    }
	 
	public List<BoardTO> selectAllListTen(String boardName, int startNo){
        List<BoardTO> allTenList = mapper.selectAllListTen(boardName, startNo);
        return allTenList;
    }
	
	// 글쓴이 검색
	public int boardSearchWriterCount(String boardName, String searchReq) {
		int ListCount = mapper.boardSearchWriterCount(boardName, searchReq);
		
		return ListCount;
	}
	
	public ArrayList<BoardTO> boardSearchWriterListTen(String boardName, String searchReq, int startNo) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchWriterListTen(boardName, searchReq, startNo);
		
		return boardLists;
	}
	
	// 제목, 내용 검색
	public int boardSearchSub_ConCount(String boardName, String searchReq) {
		int ListCount = mapper.boardSearchSub_ConCount(boardName, searchReq);

		return ListCount;
	}
	
	public ArrayList<BoardTO> boardSearchSub_ConListTen(String boardName, String searchReq, int startNo) {
		ArrayList<BoardTO> boardLists = mapper.boardSearchSub_ConListTen(boardName, searchReq, startNo);

		return boardLists;
	}
	
	//게시판 view
	public BoardTO viewPageContents(String boardName, int seq){
		BoardTO to = new BoardTO();
		mapper.viewPageHitUp(boardName, seq);
		to = mapper.viewPageContents(boardName, seq);
		
		return to;
	}
	
	public int deleteBoardContent(String boardName, int seq) {
		int result = mapper.deleteBoardContent(boardName, seq);
		int flag = 1;
		
		if( result == 1) {
			flag = 0;
		} else {
			flag = 1;
		}
		
		return flag; 
	}
	
	// 게시판 write
	public int boardWriteOk( String boardname, MultipartFile upload, BoardTO to ) {
		int result = mapper.boardWriteOk( boardname, to );
		
		int flag = 1;	// 비정상
		if( result == 1) {
			flag = 0;	// 정상
		} else if( to.getImgformat() != "png" || to.getImgformat() != "jpg" || to.getImgformat() != "gif" ) {
			flag = 2;	// 첨부파일이 이미지 파일이 아닐 때
		}
		
		// DB에 정상 반영 되면 파일도 업로드해 줌
    	if( flag == 0 && to.getFilesize() > 0 ) {
    		try {
    			upload.transferTo( new File( to.getImgname() ) );
    		} catch (IllegalStateException e) {
    			System.out.println( e.getMessage() );
    		} catch( IOException e ) {
    			System.out.println( e.getMessage() );
    		}
    	}		
		return flag;
	}
	
	// 게시판 modify
	public BoardTO boardModify( String boardname, int seq, BoardTO to ) {
		to = mapper.boardModify( boardname, seq );
		return to;
	}
	
	public int boardModifyOk( String boardname, int seq, MultipartFile upload, BoardTO to ) {
		String oldFilename = mapper.getOldFileName( boardname, seq );
		
		int result = 0;
		if( to.getImgname() != null ) {
			result = mapper.modifyOkUseNewfile( boardname, to, seq );
		} else {
			result = mapper.modifyOkUseOldfile( boardname, to, seq );
		} 
				
		int flag = 1;
		if( result == 1 ) {
			flag = 0;	// 정상
			
			// DB에 정상 반영 되면 파일도 업로드해 줌
			if( to.getFilesize() > 0 ) {
	    		try {
	    			upload.transferTo( new File( to.getImgname() ) );
	    		} catch (IllegalStateException e) {
	    			System.out.println( e.getMessage() );
	    		} catch( IOException e ) {
	    			System.out.println( e.getMessage() );
	    		}
	    	}	
			
			if( to.getImgname() != null && oldFilename != null ) {
				File file = new File( multipartLocation, oldFilename );
				file.delete();
			}
		} else if( result == 0 ) {
			flag = 1;	// 비정상
			
			/*if( to.getImgname() != null ) {
				File file = new File( multipartLocation, to.getImgname() );
				file.delete();
			}*/
		} else if( to.getImgformat() != "png" || to.getImgformat() != "jpg" || to.getImgformat() != "gif" ) {
			flag = 2;	// 첨부파일이 이미지 파일이 아닐 때
		}
		
		return flag;
	} 
	
	// 댓글 관련 로직 시작
	public int writeCmt(BoardCmtTO bto) {

		int result = 0;
		int flag = 0;

		if (bto.getBoardname().equals("dlife_board")) {
			 result = mapper.writeDlifeCmt(bto);
		} else if (bto.getBoardname().equals("md_board")) {
			result = mapper.writeMdCmt(bto);
		} else if (bto.getBoardname().equals("beverage_board")) {
			result = mapper.writeBeverageBoardCmt(bto);
		} else if (bto.getBoardname().equals("frequency_board")) {
			result = mapper.writeFrequencyCmt(bto);
		} else if (bto.getBoardname().equals("review_board")) {
			result = mapper.writeReviewCmt(bto);
		}

		if (result == 1) {
			flag = 0;
		}else {
			flag = 1;
		}

		return flag;
	}

	public List<BoardCmtTO> selectAllCmtList (String boardName, int seq) {
		List<BoardCmtTO> allCmtList = new ArrayList<>();

		if (boardName.equals("dlife_board")){
			allCmtList = mapper.selectCmtList("dlife_cmt", seq);
		} else if (boardName.equals("beverage_board")) {
			allCmtList = mapper.selectCmtList("beverage_board_cmt", seq);
		} else if (boardName.equals("md_board")) {
			allCmtList = mapper.selectCmtList("md_cmt", seq);
		} else if (boardName.equals("frequency_board")) {
			allCmtList = mapper.selectCmtList("frequency_cmt", seq);
		} else if (boardName.equals("review_board")) {
			allCmtList = mapper.selectCmtList("review_cmt", seq);
		}
		return allCmtList;
	}

	public int deleteCmt (BoardCmtTO bto) {
		int result = 0;
		int flag = 1;

		if (bto.getBoardname().equals("dlife_board")) {
			result = mapper.deleteCmt(bto.getCseq(), "dlife_cmt");
		} else if (bto.getBoardname().equals("beverage_board")) {
			result = mapper.deleteCmt(bto.getCseq(), "beverage_board_cmt");
		} else if (bto.getBoardname().equals("md_board")) {
			result = mapper.deleteCmt(bto.getCseq(), "md_cmt");
		} else if (bto.getBoardname().equals("frequency_board")) {
			result = mapper.deleteCmt(bto.getCseq(), "frequency_cmt");
		} else if (bto.getBoardname().equals("review_board")) {
			result = mapper.deleteCmt(bto.getCseq(), "review_cmt");
		}

		if (result == 1) {
			flag = 0;
		} else {
			flag = 1;
		}
		return flag;
	}
}
