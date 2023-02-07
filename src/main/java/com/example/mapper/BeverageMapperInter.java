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
	
	
	 	@Select("select * from beverage order by seq+0 asc")
	    List<BeverageTO> selectAllBeverage();
	    
	 	
	    @Select("select * from beverage where category=#{category} order by seq+0 asc")
	    List<BeverageTO> selectCategory(String category);
	    
	
	    @Select("select seq, category, name, engName, image, productInfo, kcal, sat_fat, protein, sodium, sugars, caffeine, drinkInfo from beverage where name =#{name}")
	    public BeverageTO BeverageInfo(BeverageTO to);

	@Select("select seq, category, name, engName, image, productInfo, kcal, sat_fat, protein, sodium, sugars, caffeine, drinkInfo from beverage where seq =#{seq}")
	public BeverageTO BeverageInfoBySeq(BeverageTO to);
	    
	    
//      w
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
	    
	    @Select("select * from beverage order by sugars+0 desc")
	    List<BeverageTO> sugarsAsc();

	//음료 검색
	@Select("select * from beverage where name like CONCAT('%',#{searchReq},'%')")
	public List<BeverageTO> beverageSearch(String searchReq);


	// Beverage 댓글 관련 쿼리
	@Insert("insert into beverage_cmt values (0,#{comment},now(),#{memberKey},#{seq})")
	int beverageCmtWrite(BeverageCmtTO to);

	@Select("select beverage_cmt.bevcseq, beverage_cmt.comment, beverage_cmt.cdate, beverage_cmt.memberkey, member.name, member.nickname" +
			" from beverage_cmt inner join member " +
			"on (beverage_cmt.memberkey = member.memberkey) where beverage_cmt.seq = #{seq}")
	List<BeverageCmtTO> selectAllCmtList(String seq);

	@Delete("delete from beverage_cmt where bevcseq = #{bevcseq}")
	int deleteBeverageCmt (String bevcseq);

}
