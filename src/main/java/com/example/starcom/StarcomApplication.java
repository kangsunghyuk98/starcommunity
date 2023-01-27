package com.example.starcom;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
@MapperScan(value = "com.example.mapper")
@ComponentScan(basePackages = {"com.example"})
public class StarcomApplication {

    public static void main(String[] args) {
        SpringApplication.run(StarcomApplication.class, args);
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(); // encoding 디폴트 10
    } // Bean 순환성 때문에 메인메서드에서 Bean 등록해놨음
    
}
