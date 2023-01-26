package com.example.starcom;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(value = "com.example.mapper")
public class StarcomApplication {

    public static void main(String[] args) {
        SpringApplication.run(StarcomApplication.class, args);
    }

}
