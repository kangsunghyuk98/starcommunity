package com.example.service;

import com.example.dto.MemberTO;
import com.example.mapper.MapperInter;
import com.example.security.MemberRole;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.UUID;

@Service
public class MemberService {

    @Autowired
    private MapperInter mapperInter;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JavaMailSender mailSender;

    public int save(MemberTO to) {

        String encodePassword = passwordEncoder.encode(to.getPassword());
        to.setPassword(encodePassword); // 암호화한 비밀번호로 set

        to.setRole(MemberRole.USER.getRole()); // 일반 유저 적용

        int result = mapperInter.save(to);

        int flag = 1;

        if (result == 1) {
            flag = 0;
        } else {
            flag = 1;
        }
        return flag;
    }

    public int isDuplicateId(String id) {
        int result = mapperInter.isDuplicateId(id);
        return result;
    } // 아이디 중복 검사 메서드 로직

    public int isDuplicateNick(String nickname) {
        int result = mapperInter.isDuplicateNick(nickname);
        return result;
    } // 아이디 중복 검사 메서드 로직


    public String findId(String name, String email) {
        // System.out.println(name + email);
        String id = mapperInter.findId(name, email);
        return id;
    } // 아이디 찾는 메서드 로직

    public int findPw(MemberTO to) {
        int flag = sendPasswordToEmail(to);
        return flag; // 정상적으로 돌아갔으면 0 리턴
    } // 임시 비밀번호를 보내주기 위한 전처리 작업


    public int sendPasswordToEmail (MemberTO to) {
        MimeMessage message = mailSender.createMimeMessage();

        String uuidPassword = UUID.randomUUID().toString();
        String encodeUUIDPassword = passwordEncoder.encode(uuidPassword);

        int result = mapperInter.updateRawpasswordToUUID(encodeUUIDPassword,to.getId(), to.getName(),to.getEmail());
        int flag = 1;

        if (result == 1) {
            flag = 0;

            MimeMessageHelper messageHelper = null;
            try {
                messageHelper = new MimeMessageHelper(message,true,"UTF-8");

                messageHelper.setTo(to.getEmail());
                messageHelper.setSubject("별다방 커뮤니티 비밀번호 재설정 메일입니다.");

                String content = "임시 비밀번호 : "+ uuidPassword + "<br><br><b>* 절대 외부에 노출하지 마세요.</b><br>" +
                        "* 임시 비밀번호는 마이페이지에서 꼭 변경해주셔야 합니다.";
                messageHelper.setText(content,true);

                mailSender.send(message);

            } catch (MessagingException e) {
                throw new RuntimeException(e); // 에러처리
            }
        } else {
            flag = 1;
        }
        return flag;
    }

}
