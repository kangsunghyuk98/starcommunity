package com.example.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.BoardTO;
import com.example.mapper.BoardMapperInter;

@Repository
@MapperScan("com.exam.mapper")
public class BoardDAO {
	@Autowired
	private BoardMapperInter mapper;
	
	public List<BoardTO> boardList(){
		List<BoardTO> boardLists = mapper.boardList();
		return boardLists;
	}
	
}
