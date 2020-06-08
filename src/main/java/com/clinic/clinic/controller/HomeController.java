package com.clinic.clinic.controller;

import com.clinic.clinic.entity.Role;
import com.clinic.clinic.entity.User;
import com.clinic.clinic.entity.Visit;
import com.clinic.clinic.repository.RoleRepository;
import com.clinic.clinic.repository.UserRepository;
import com.clinic.clinic.repository.VisitRepository;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class HomeController {
    private final VisitRepository visitRepository;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public HomeController(VisitRepository visitRepository, UserRepository userRepository, RoleRepository roleRepository) {
        this.visitRepository = visitRepository;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @GetMapping("/home")
    public String about(Model model,@AuthenticationPrincipal UserDetails customUser){

        String username=customUser.getUsername();
        User user=userRepository.findByUsername(username);
        Set<Role> roles=userRepository.findByUsername(username).getRoles();

        Role adminRole=roleRepository.findByName("ROLE_ADMIN");
        Role userRole=roleRepository.findByName("ROLE_USER");
        Role patientRole=roleRepository.findByName("ROLE_PATIENT");



        if (roles.contains(adminRole)){
            model.addAttribute("visitsToComplete",visitRepository.findAllToComplete());
            model.addAttribute("visitsCompleted",visitRepository.findAllCompleted());
        }else if (roles.contains(userRole)){
            model.addAttribute("visitsToComplete",visitRepository.findAllToCompleteByUser(user.getId()));
            model.addAttribute("visitsCompleted",visitRepository.findAllCompletedByUser(user.getId()));
        }else if (roles.contains(patientRole)){
            model.addAttribute("visitsToComplete",visitRepository.findAllToCompleteByPatient(user.getId()));
            model.addAttribute("visitsCompleted",visitRepository.findAllCompletedByPatient(user.getId()));
        }

        return "home";
    }
    @GetMapping("/")
    public String start(){
        return "start";
    }
}
