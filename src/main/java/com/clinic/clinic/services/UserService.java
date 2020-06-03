package com.clinic.clinic.services;


import com.clinic.clinic.entity.User;

public interface UserService {

    User findByUserName(String name);

    void saveUser(User user);

    void deleteUserById(Long id);
}