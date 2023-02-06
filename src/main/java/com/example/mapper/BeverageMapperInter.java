package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.example.dto.BeverageTO;

public interface BeverageMapperInter {
	
	
	 	@Select("select * from beverage order by seq+0 asc")
	    List<BeverageTO> selectAllBeverage();
	    
	 	
	    @Select("select * from beverage where category=#{category} order by seq+0 asc")
	    List<BeverageTO> selectCategory(String category);
	    
	
	    @Select("select category, name, engName, image, productInfo, kcal, sat_fat, protein, sodium, sugars, caffeine, drinkInfo from beverage where name =#{name}")
	    public BeverageTO BeverageInfo(BeverageTO to);
	    
	    
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
}
