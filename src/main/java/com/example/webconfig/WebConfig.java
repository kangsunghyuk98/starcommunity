package com.example.webconfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 프로젝트 외부 파일을 가져오는 기능. 

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Value("${spring.servlet.multipart.location}")
	String multipartLocation;
	
    private String uploadPath = "/imgPath/**"; 
    String resourcePath = "file:///"; 
    
    // Resource Handler란 이미지, javascript, css, html 등의 정적인 리소스에 대한 요청을 처리하는 것.
    // ResourceHandlerRegistry : 리소스를 등록, 핸들러를 관리하는 객체
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(uploadPath)	// 리소스와 연결될 URL path를 지정
                .addResourceLocations(resourcePath + multipartLocation);	// 실제 리소스가 존재하는 외부 경로를 지정
    }
    
    // http://localhost:8080/imgPath/daum.png => 이런 식으로 브라우저에서 열면 이미지 확인 가능
}
