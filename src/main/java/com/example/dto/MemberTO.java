package com.example.dto;

import lombok.*;

@Data
@Getter
@Setter
public class MemberTO {

    public MemberTO(String id, String role, String password, String nickname, String name, String email, String provider, String providerId) {
        this.id = id;
        this.role = role;
        this.password = password;
        this.nickname = nickname;
        this.name = name;
        this.email = email;
        this.provider = provider;
        this.providerId = providerId;
    }

    private int memberKey;
    private String id;
    private String role;
    private String password;
    private String nickname;
    private String name;
    private String email;
    private String provider;
    private String providerId;

}
