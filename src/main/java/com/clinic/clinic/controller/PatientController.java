package com.clinic.clinic.controller;

import com.clinic.clinic.entity.Role;
import com.clinic.clinic.entity.User;
import com.clinic.clinic.repository.RoleRepository;
import com.clinic.clinic.repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/patient")
public class PatientController {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public PatientController(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @GetMapping("/list")
    public String list(Model model){
        Role patientRole=roleRepository.findByName("ROLE_PATIENT");
        List<User> patients=userRepository.findAll().stream().filter(u->u.getRoles().contains(patientRole)).collect(Collectors.toList());
        List<User> approval=userRepository.findAllToApprove().stream().filter(u->u.getRoles().contains(patientRole)).collect(Collectors.toList());

        model.addAttribute("approval",approval);
        model.addAttribute("patients",patients);
        return "patient-list";
    }
}
