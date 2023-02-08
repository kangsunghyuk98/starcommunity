package com.example.mapper;

import java.util.List;

import com.example.dto.BeverageCmtTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.dto.BeverageTO;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface BeverageMapperInter {
	
	//음료 전체 메뉴
	 	@Select("select * from beverage order by seq+0 asc")
	    List<BeverageTO> selectAllBeverage();
	    
	//음료 카테고리
	    @Select("select * from beverage where category=#{category} order by seq+0 asc")
	    List<BeverageTO> selectCategory(String category);
	    
	//음료 상세페이지
	    @Select("select category, name, engName, image, productInfo, kcal, sat_fat, protein, sodium, sugars, caffeine, drinkInfo from beverage where name =#{name}")
	    public BeverageTO BeverageInfo(BeverageTO to);

	@Select("select seq, category, name, engName, image, productInfo, kcal, sat_fat, protein, sodium, sugars, caffeine, drinkInfo from beverage where seq =#{seq}")
	public BeverageTO BeverageInfoBySeq(BeverageTO to);
	    
	    
	//------------------------------------------------------------------------음료 정렬  
	    @Select("select * from beverage order by kcal+0 desc")
	    List<BeverageTO> kcalDesc();
	    
	    @Select("select * from beverage order by kcal+0 asc")
	    List<BeverageTO> kcalAsc();
	    
	    @Select("select * from beverage order by caffeine+0 desc")
	    List<BeverageTO> caffeineDesc();
	    
	    @Select("select * from beverage order by caffeine+0 asc")
	    List<BeverageTO> caffeineAsc();
	    
	    @Select("select * from beverage order by sat_fat+0 desc")
	    List<BeverageTO> sat_fatDesc();
	    
	    @Select("select * from beverage order by sat_fat+0 asc")
	    List<BeverageTO> sat_fatAsc();
	    
	    @Select("select * from beverage order by sugars+0 desc")
	    List<BeverageTO> sugarsDesc();
	    
	    @Select("select * from beverage order by sugars+0 asc")
	    List<BeverageTO> sugarsAsc();
	    
// ------------------------------------------------------------------------------------------- 카테고리 포함 정렬
	    
	    @Select("select * from beverage where category=#{category} order by kcal+0 desc")
	    List<BeverageTO> kcalDescCategory(String category);
	    
	    @Select("select * from beverage where category=#{category} order by kcal+0 asc")
	    List<BeverageTO> kcalAscCategory(String category);
	    
	    @Select("select * from beverage where category=#{category} order by caffeine+0 desc")
	    List<BeverageTO> caffeineDescCategory(String category);
	    
	    @Select("select * from beverage where category=#{category} order by caffeine+0 asc")
	    List<BeverageTO> caffeineAscCategory(String category);
	    
	    @Select("select * from beverage where category=#{category} order by sat_fat+0 desc")
	    List<BeverageTO> sat_fatDescCategory(String category);
	    
	    @Select("select * from beverage where category=#{category} order by sat_fat+0 asc")
	    List<BeverageTO> sat_fatAscCategory(String category);
	    
	    @Select("select * from beverage where category=#{category} order by sugars+0 desc")
	    List<BeverageTO> sugarsDescCategory(String category);
	    
	    @Select("select * from beverage where category=#{category} order by sugars+0 asc")
	    List<BeverageTO> sugarsAscCategory(String category);
	    
    //----------------------------------------------------------------------------------------------------음료 검색
	    @Select("select * from beverage where name like CONCAT('%',#{searchReq},'%') order by seq+0 asc")
		public List<BeverageTO> beverageSearch(String searchReq);
	    
    //-----------------------------------------------------------------------------------------------------음료 검색 카테고리 포함
	    @Select("select * from beverage where category=#{category} and name like CONCAT('%',#{searchReq},'%') order by seq+0 asc")
		public List<BeverageTO> beverageSearchCategory(String category,String searchReq);

	// Beverage 댓글 관련 쿼리
	@Insert("insert into beverage_cmt values (0,#{comment},now(),#{memberKey},#{seq})")
	int beverageCmtWrite(BeverageCmtTO to);

	@Select("select beverage_cmt.bevcseq, beverage_cmt.comment, beverage_cmt.cdate, beverage_cmt.memberkey, member.name, member.nickname from beverage_cmt inner join member " +
			"on (beverage_cmt.memberkey = member.memberkey) where beverage_cmt.seq = #{seq}")
	List<BeverageCmtTO> selectAllCmtList(String seq);
	
	@Delete("delete from beverage_cmt where bevcseq = #{bevcseq}")
	int deleteBeverageCmt (String bevcseq);
}
