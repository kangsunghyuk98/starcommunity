package com.example.webconfig;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 프로젝트 외부 파일을 가져오는 기능. 

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private String uploadPath = "/imgPath/**";
    private String resourcePath = "file:///C:/Users/zxzz9/Documents/files/"; // 서버에 파일 업로드 경로가 정해지면 property에 입력할 예정

    // Resource Handler란 이미지, javascript, css, html 등의 정적인 리소스에 대한 요청을 처리하는 것.
    // ResourceHandlerRegistry : 리소스를 등록, 핸들러를 관리하는 객체
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(uploadPath)	// 리소스와 연결될 URL path를 지정
                .addResourceLocations(resourcePath);	// 실제 리소스가 존재하는 외부 경로를 지정
    }
    
    // http://localhost:8080/imgPath/daum.png => 이런 식으로 브라우저에서 열면 이미지 확인 가능
}
