package com.example.security;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity
public class SecurityConfig {

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeRequests(authorize -> authorize
                        // .antMatchers("/","/guest/**").permitAll() // 인증없이 들어갈 수 있는 주소 설정
                        .antMatchers("/member/**").authenticated()
                        .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
                        .anyRequest().permitAll()
                       // .anyRequest().authenticated() // 그외 나머지 주소는 인증 필요
                );

        http
                .formLogin(login -> login
                        .loginPage("/guest/logintest")
                        .usernameParameter("id") // 로그인 시 입력한 id
                        .passwordParameter("password") // 로그인 시 입력한 pw
                        .loginProcessingUrl("/guest/logintest_ok") // 로그인 처리 url (post)
                        .defaultSuccessUrl("/")
                        .permitAll()
                );

       http.csrf().disable();

        return http.build();
    }
}
