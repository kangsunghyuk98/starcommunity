package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.dto.BoardTO;

@Mapper
public interface BoardMapperInter {
	@Select("select dlifeseq, subject, content, wdate, hit, imgname, imgformat, recommend, memberkey from dlife_board")
	public List<BoardTO> boardList();
}
