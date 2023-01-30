package com.example.security;

import com.example.dto.MemberTO;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.Collection;
import java.util.Map;

@Getter
public class SecurityMember implements UserDetails, OAuth2User {

    private MemberTO to;

    private Collection<? extends GrantedAuthority> authorities;
    private Map<String,Object> attributes;

    public SecurityMember(MemberTO to) {
        this.to = to;
    }

    public SecurityMember(MemberTO to, Map<String,Object> attributes) {
        this.to = to;
        this.attributes = attributes;
    } // oauth login

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }

    @Override
    public String getName() {
        return null;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.authorities;
    }

    @Override
    public String getPassword() {
        return to.getPassword();
    }

    @Override
    public String getUsername() {
        return to.getId();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }


}
