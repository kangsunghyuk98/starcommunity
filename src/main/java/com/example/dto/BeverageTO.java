package com.example.dto;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Repository
public class BeverageTO {   
	private String seq;
    private String category;
    private String name;
    private String engName;
    private String image;
    private String productInfo;
    private String kcal;
    private String sat_fat;
    private String protein;
    private String sodium;
    private String sugars;
    private String caffeine;
    private String drinkInfo;


}


