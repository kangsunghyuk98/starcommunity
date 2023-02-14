package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.example.dto.BeverageTO;
import com.example.dto.CustomRecipeTO;

@Mapper
@Repository
public interface CustomMapperInter {
	
	@Select("select seq, name, category, image from beverage where (category='블렌디드' or category='프라푸치노') and seq not in ('64','65','68','73') order by seq+0 asc")
	List<BeverageTO> allCustomMenu();
	
	@Select("select seq, name, image from beverage where name =#{name}")
	public BeverageTO customInfo(BeverageTO to);
	
	@Insert("insert into custom_recipe values ( 0, now(), #{recipe}, #{memberKey}, #{beverage}, #{seq}) ")
	int insertCustmRecipe(CustomRecipeTO cto);
	
	@Select("select custom_recipe.cusseq, custom_recipe.wdate, custom_recipe.recipe, custom_recipe.memberkey, custom_recipe.beverage, member.name, member.nickname from custom_recipe inner join member " +
	"on (custom_recipe.memberkey = member.memberkey) where custom_recipe.seq = #{seq} order by wdate desc")
	List<CustomRecipeTO> selectCustomList(String seq);
	
	@Delete("delete from custom_recipe where cusseq = ${cusseq} and memberkey = ${memberKey}")
	int deleteCustomRecipe(CustomRecipeTO cto);
	
}
