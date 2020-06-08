package com.clinic.clinic.controller;

import com.clinic.clinic.entity.User;
import com.clinic.clinic.repository.RoleRepository;
import com.clinic.clinic.repository.UserRepository;
import com.clinic.clinic.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    private final RoleRepository roleRepository;
    private final UserService userService;
    private final UserRepository userRepository;

    public UserController(RoleRepository roleRepository, UserService userService, UserRepository userRepository) {
        this.roleRepository = roleRepository;
        this.userService = userService;
        this.userRepository = userRepository;
    }

    @GetMapping("/add")
    public String createUser(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("roles",roleRepository.findAll());
        return "user-add";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute @Validated User user, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            userService.saveUser(user,1);
            return "redirect:/user/list";
        }
        return "user-add";
    }
    @GetMapping("/list")
    public String list(Model model) {


        model.addAttribute("users", userRepository.findAll());
        return "user-list";
    }
}
