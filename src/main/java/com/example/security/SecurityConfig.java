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
                        .antMatchers("/").permitAll() // 인증없이 들어갈 수 있는 주소 설정
                        .anyRequest().authenticated() // 그외 나머지 주소는 인증 필요
                );

        http
                .formLogin(login ->
                        login
                                .loginPage("/logintest")
                                .permitAll()
                );
        //.formLogin(withDefaults())
        //.httpBasic(withDefaults());
        return http.build();
    }
}
