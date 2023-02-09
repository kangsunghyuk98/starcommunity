package com.example.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardCmtTO {

    private String cseq;
    private String comment;
    private String cdate;
    private int crecommend;
    private String seq;
    private String memberKey;
    private String boardname;
    private String nickname;
    private String category;
}
