package com.clinic.clinic.controller;

import com.clinic.clinic.entity.User;
import com.clinic.clinic.entity.Visit;
import com.clinic.clinic.repository.RoleRepository;
import com.clinic.clinic.repository.UserRepository;
import com.clinic.clinic.repository.VisitRepository;
import com.clinic.clinic.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {
    private final RoleRepository roleRepository;
    private final UserService userService;
    private final UserRepository userRepository;
    private final VisitRepository visitRepository;

    public UserController(RoleRepository roleRepository, UserService userService, UserRepository userRepository, VisitRepository visitRepository) {
        this.roleRepository = roleRepository;
        this.userService = userService;
        this.userRepository = userRepository;
        this.visitRepository = visitRepository;
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
            user.setInsurance(1);
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
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable long id, Model model){
        model.addAttribute("user",userRepository.findUserById(id));
        model.addAttribute("roles",roleRepository.findAll());
        return "user-edit";
    }
    @PostMapping("/edit/{id}")
    public String edit(@ModelAttribute @Validated User user, BindingResult bindingResult){

        if (!bindingResult.hasErrors()) {
            userService.edit(user);
            return "redirect:/user/list";
        }
        return "user-edit";
    }
    @GetMapping("/enable/{id}")
    public String enable(@PathVariable long id){
        User user=userRepository.findUserById(id);
        userService.saveUser(user,0);
        return "redirect:/user/list";

    }
    @GetMapping("/statistics")
    public String statistics(Model model){
       model.addAttribute("userCount",userRepository.findAllUser().size());
        model.addAttribute("patientCount",userRepository.findAll().size()-userRepository.findAllUser().size());
       double salary= userRepository.findAllUser().stream().mapToDouble(User::getSalary).sum();
        model.addAttribute("salary",salary);
        model.addAttribute("allVisits",visitRepository.findAll().size());
        model.addAttribute("allVisitsToComplete",visitRepository.findAllToComplete().size());
        model.addAttribute("allVisitsCompleted",visitRepository.findAllCompleted().size());
        double price= visitRepository.findAll().stream().mapToDouble(Visit::getPrice).sum();
        model.addAttribute("price",price);
        return "user-statistics";
    }

}
