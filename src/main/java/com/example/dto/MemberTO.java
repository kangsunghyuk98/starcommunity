package com.example.dto;

import com.example.security.MemberRole;
import lombok.Data;

import java.util.HashSet;
import java.util.Set;

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
