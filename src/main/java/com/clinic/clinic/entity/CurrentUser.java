package com.clinic.clinic.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CurrentUser extends User {
    private final com.clinic.clinic.entity.User user;
    public CurrentUser(String username, String password,
                       Collection<? extends GrantedAuthority> authorities,
                       com.clinic.clinic.entity.User user) {
        super(username, password, authorities);
        this.user = user;
    }
    public com.clinic.clinic.entity.User getUser() {return user;}
}
