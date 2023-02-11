package com.example.service;

import com.example.dto.BoardTO;
import com.example.dto.MemberTO;
import com.example.mapper.MapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ContentsService {

    @Autowired
    private MapperInter mapperInter;

    @Autowired
    private PasswordEncoder passwordEncoder;


    public int modifyMemberInfo(MemberTO to) {
        to.setPassword(passwordEncoder.encode(to.getPassword()));

        int result = mapperInter.modifyMemberInfo(to);
        int flag = 1;

        if (result == 1) {
            flag = 0;
        } else {
            flag = 1;
        }
        return flag;
    }

    public int deleteMemberInfo(String id, String password, String memberKey) {

        String encPassword = mapperInter.selectPasswordById(id);
        boolean matchPass = passwordEncoder.matches(password,encPassword);

        int result = 0;
        int flag = 1;

        if (matchPass) {

            mapperInter.deleteMyDlifeBoard(memberKey);
            mapperInter.deleteMyMdBoard(memberKey);
            mapperInter.deleteMyReviewBoard(memberKey);
            mapperInter.deleteMyBeverageBoard(memberKey);
            mapperInter.deleteMyFrequencyBoard(memberKey);
            mapperInter.deleteMyDlifeCmt(memberKey);
            mapperInter.deleteMyMdCmt(memberKey);
            mapperInter.deleteMyBeverageBoradCmt(memberKey);
            mapperInter.deleteMyFrequencyCmt(memberKey);
            mapperInter.deleteMyReviewCmt(memberKey);
            mapperInter.deleteMyBeverageCmt(memberKey);
            mapperInter.deleteMyLikecheck(memberKey);

            result = mapperInter.deleteMemberInfo(id, encPassword);

            if (result == 1) {
                flag = 0;
            }else {
                flag = 1;
            }

        }else {
           flag = 1;
        }

        return flag;
    }

    public List<BoardTO> selectAllMyBoardList (String memberKey) {
        List<BoardTO> allMyBoardList = new ArrayList<>();

        allMyBoardList.addAll(mapperInter.selectAllMyDlifeBoards(memberKey));
        allMyBoardList.addAll(mapperInter.selectAllMyMdBoards(memberKey));
        allMyBoardList.addAll(mapperInter.selectAllMyFrequencyBoards(memberKey));
        allMyBoardList.addAll(mapperInter.selectAllMyReviewBoards(memberKey));
        allMyBoardList.addAll(mapperInter.selectAllMyBeverageBoards(memberKey));

        return allMyBoardList;
    }

    public List<BoardTO> selectAllMyBoardList (String memberKey, int startNo) {
        List<BoardTO> allMyBoardList = new ArrayList<>();

        allMyBoardList.addAll(mapperInter.selectAllMyDlifeBoards(memberKey));
        allMyBoardList.addAll(mapperInter.selectAllMyMdBoards(memberKey));
        allMyBoardList.addAll(mapperInter.selectAllMyFrequencyBoards(memberKey));
        allMyBoardList.addAll(mapperInter.selectAllMyReviewBoards(memberKey));
        allMyBoardList.addAll(mapperInter.selectAllMyBeverageBoards(memberKey));

        List<BoardTO> tempList = new ArrayList<>();

        if (allMyBoardList.size() == 0) {
            return tempList;
        } else {
            try {
                for (int i = startNo; i < startNo+10; i++) {
                    BoardTO to = allMyBoardList.get(i);
                    tempList.add(to);
                }
            } catch (IndexOutOfBoundsException e) {
                BoardTO to = new BoardTO();
                tempList.add(to);
            }
            return tempList;
        }
    }

    public int countAllMembers() {
        return mapperInter.countAllMember();
    }

    public int countAllBoard() {
       int allBoardCount = mapperInter.countAllBeverageBoard() + mapperInter.countAllDlifeBoard() + mapperInter.countAllMdBoard() +
               mapperInter.countAllFrequencyBoard() + mapperInter.countAllReviewBoard();

       return allBoardCount;
    }

    //메인페이지 실시간 추천수 로직
    public List<BoardTO> selectRecommendRanking() {
        List<BoardTO> boardList = mapperInter.selectRecommendRanking();

        for(BoardTO to:boardList) {
            if (to.getBoardname().equals("beverage_board")) {
                to.setCategory("BeverageBoardList");
            } else if (to.getBoardname().equals("dlife_board")) {
                to.setCategory("DlifeBoardList");
            } else if (to.getBoardname().equals("frequency_board")) {
                to.setCategory("FrequencyBoardList");
            } else if (to.getBoardname().equals("md_board")) {
                to.setCategory("MDBoardList");
            } else if (to.getBoardname().equals("review_board")) {
                to.setCategory("ReviewBoardList");
            }
        }

        return boardList;
    }


}
