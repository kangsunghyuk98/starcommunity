package com.example.security;

import com.example.googleoauth.PrincipalOauth2UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private PrincipalOauth2UserService principalOauth2UserService;

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().antMatchers("/css/**","/font/**","/img/**","/js/**","/smarteditor/**");
    }
    

    
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .formLogin(login -> {
                            try {
                                login
                                        .loginPage("/guest/login")
                                        .usernameParameter("username") // 로그인 시 입력한 id
                                        .passwordParameter("password") // 로그인 시 입력한 pw
                                        .loginProcessingUrl("/guest/login_ok") // 로그인 처리 url (post)
                                        .defaultSuccessUrl("/home/index")
                                        .permitAll()
                                        .and()
                                        .oauth2Login()
                                        .loginPage("/guest/login")
                                        .userInfoEndpoint()
                                        .userService(principalOauth2UserService);
                            } catch (Exception e) {
                                throw new RuntimeException(e);
                            }
                        }
                );

        http
                .authorizeRequests(authorize -> authorize
                        // .antMatchers("/","/guest/**").permitAll() // 인증없이 들어갈 수 있는 주소 설정
                        .antMatchers("/member/**", "/board/**").authenticated()
                        .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
                        .anyRequest().permitAll()
                       // .anyRequest().authenticated() // 그외 나머지 주소는 인증 필요
                );
        http.logout()
                .logoutUrl("/guest/logout")
                .logoutSuccessUrl("/home/index")
                .deleteCookies("JSESSIONID");

       http.csrf().disable();
       http.headers().frameOptions().sameOrigin();
     
        return http.build();
    }
}
