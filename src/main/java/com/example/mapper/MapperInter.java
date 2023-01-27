package com.example.mapper;

import com.example.dto.MemberTO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MapperInter {

    @Select("select now() as now")
    String selectNow();

    @Insert("insert into member values (0, #{id}, 'USER',#{password}, #{nickname}, #{name}, #{email})")
    int save(MemberTO to);
}
