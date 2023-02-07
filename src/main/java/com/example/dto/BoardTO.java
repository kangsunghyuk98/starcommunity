package com.example.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardTO {
	// dlife_board
	private int dlifeseq;
	private String subject;
	private String content;
	private String wdate;
	private int hit;
	private String imgname;
	private String imgformat;
	private int recommend;
	private int memberkey;
	
	// member
    private String id;
    private String role;
    private String password;
    private String nickname;
    private String name;
    private String email;
    private String provider;
    private String providerId;
}
