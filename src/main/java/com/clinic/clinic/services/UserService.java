package com.clinic.clinic.services;


import com.clinic.clinic.entity.User;

import java.util.List;

public interface UserService {

    User findByUserName(String name);

    void saveUser(User user, int enable);

    void deleteUserById(Long id);
    void edit(User user);


}