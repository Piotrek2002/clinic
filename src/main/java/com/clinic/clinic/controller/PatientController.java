package com.clinic.clinic.controller;

import com.clinic.clinic.entity.Role;
import com.clinic.clinic.entity.User;
import com.clinic.clinic.repository.RoleRepository;
import com.clinic.clinic.repository.UserRepository;
import com.clinic.clinic.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/patient")
public class PatientController {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final UserService userService;

    public PatientController(UserRepository userRepository, RoleRepository roleRepository, UserService userService) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.userService = userService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        Role patientRole = roleRepository.findByName("ROLE_PATIENT");
        List<User> patients = userRepository.findAll().stream().filter(u -> u.getRoles().contains(patientRole)).collect(Collectors.toList());
        List<User> approval = userRepository.findAllToApprove().stream().filter(u -> u.getRoles().contains(patientRole)).collect(Collectors.toList());

        model.addAttribute("approval", approval);
        model.addAttribute("patients", patients);
        return "patient-list";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("patient", new User());
        return "patient-add";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute @Validated User user, BindingResult bindingResult){
        if (!bindingResult.hasErrors()) {
            user.setSalary(0.0);
            Set<Role> roles=new HashSet<>();
            roles.add(roleRepository.findByName("ROLE_PATIENT"));
            user.setRoles(roles);
            userService.saveUser(user,1);
            return "redirect:/patient/list";
        }
        return "patient-add";
    }
    @GetMapping("/details/{id}")
    public String details(@PathVariable long id, Model model){
        model.addAttribute("patient",userRepository.findUserById(id));
        return "patient-details";
    }
    @GetMapping("/activate/{id}")
    public String activate(@PathVariable long id){
        User user=userRepository.findUserById(id);
        userService.saveUser(user,1);
        return "redirect:/patient/details/"+id;
    }
    @GetMapping("/deactivate/{id}")
    public String deactivate(@PathVariable long id){
        User user=userRepository.findUserById(id);
        userService.saveUser(user,0);
        return "redirect:/patient/details/"+id;
    }

}
