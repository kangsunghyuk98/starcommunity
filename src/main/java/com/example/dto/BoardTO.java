package com.example.dto;

import org.springframework.stereotype.Repository;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Repository
public class BoardTO {
	private int dlifeseq;
	private String subject;
	private String content;
	private String wdate;
	private int hit;
	private String imgname;
	private String imgformat;
	private int recommend;
	private int memberkey;
}
