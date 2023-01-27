package com.example.dto;

import com.example.security.MemberRole;
import lombok.Data;

@Data
public class MemberTO {
    private int memberKey;
    private String id;
    private String role;
    private String password;
    private String nickname;
    private String name;
    private String email;


}
