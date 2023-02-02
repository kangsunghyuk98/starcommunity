package com.example.googleoauth;

import com.example.dto.MemberTO;
import com.example.googleoauth.userInfo.GoogleUserInfo;
import com.example.googleoauth.userInfo.KakaoUserInfo;
import com.example.googleoauth.userInfo.NaverUserInfo;
import com.example.googleoauth.userInfo.OAuth2UserInfo;
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
        
        // 구글 , 카카오 에 따라 다름
        OAuth2UserInfo oAuth2UserInfo = null;
        
        String provider = userRequest.getClientRegistration().getRegistrationId(); // google, naver
        // provider에 따라 변경
        if(provider.equals("google")){
            oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());
        }
        else if(provider.equals("naver")){
            oAuth2UserInfo = new NaverUserInfo(oAuth2User.getAttributes());
        }
        else if(provider.equals("kakao")){	
            oAuth2UserInfo = new KakaoUserInfo(oAuth2User.getAttributes());
        }
        
        String provideId = oAuth2UserInfo.getProviderId();
        String id = provider+"_"+provideId;
        String name = oAuth2UserInfo.getName();
        String nickname = oAuth2UserInfo.getName();
        String password = passwordEncoder.encode("구글로그인");
        String email = oAuth2UserInfo.getEmail();
        String role = "ROLE_USER";

        MemberTO to = mapperInter.oauthSelectMemberKeyById(id);
        System.out.println(provideId);
 
        if(to == null) {
            to = new MemberTO(id, role, password, nickname, name, email, provider, provideId);
            mapperInter.oauthSave(to);
        }

        return new SecurityMember(to, oAuth2UserInfo);
    } // 구글로 부터 받은 userRequest 데이터에 대한 후처리되는 함수임
}
