package com.clinic.clinic.services.Impl;

import com.clinic.clinic.entity.User;
import com.clinic.clinic.repository.RoleRepository;
import com.clinic.clinic.repository.UserRepository;
import com.clinic.clinic.services.UserService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository,
                           BCryptPasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public User findByUserName(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public void saveUser(User user , int enable) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(enable);
        userRepository.save(user);
    }

    @Override
    public void deleteUserById(Long id) {

        userRepository.delete(userRepository.findUserById(id));
    }

    @Override
    public void edit(User user) {
        userRepository.save(user);
    }

}
