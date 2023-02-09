package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.example.dto.BeverageTO;

@Mapper
@Repository
public interface CustomMapperInter {
	
	@Select("select seq, name, category, image from beverage where (category='블렌디드' or category='프라푸치노') and seq not in ('64','65','68','73') order by seq+0 asc")
	List<BeverageTO> allCustomMenu();
	
	@Select("select seq, name, image from beverage where name =#{name}")
	public BeverageTO customInfo(BeverageTO to);
}
