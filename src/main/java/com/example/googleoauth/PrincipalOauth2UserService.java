package com.example.googleoauth;

import com.example.dto.MemberTO;
import com.example.mapper.MapperInter;
import com.example.security.SecurityMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private MapperInter mapperInter;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        System.out.println("getClientRegistration : " + userRequest.getClientRegistration()); // registrationId로 어떤 Oauth로 로그인 했는지 알 수 있음
        System.out.println("getAccessToken : " + userRequest.getAccessToken().getTokenValue());

        OAuth2User oAuth2User = super.loadUser(userRequest);

        System.out.println("getAttributes : " + oAuth2User.getAttributes());

        String provider = userRequest.getClientRegistration().getRegistrationId(); // google
        String provideId = oAuth2User.getAttribute("sub");
        String id = provider+"_"+provideId;
        String name = oAuth2User.getAttribute("name");
        String nickname = oAuth2User.getAttribute("name");
        String password = passwordEncoder.encode("구글로그인");
        String email = oAuth2User.getAttribute("email");
        String role = "ROLE_USER";

        MemberTO to = mapperInter.oauthSelectMemberKeyById(id);
        System.out.println(provideId);

        if(to == null) {
            to = new MemberTO(id, role, password, nickname, name, email, provider, provideId);
            mapperInter.oauthSave(to);
        }

        return new SecurityMember(to, oAuth2User.getAttributes());
    } // 구글로 부터 받은 userRequest 데이터에 대한 후처리되는 함수임
}
