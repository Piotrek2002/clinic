package com.clinic.clinic.controller;

import com.clinic.clinic.entity.Role;
import com.clinic.clinic.entity.User;
import com.clinic.clinic.repository.RoleRepository;
import com.clinic.clinic.repository.TreatmentRepository;
import com.clinic.clinic.repository.UserRepository;
import com.clinic.clinic.repository.VisitRepository;
import com.clinic.clinic.services.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import java.util.HashSet;
import java.util.Set;

@Controller
public class HomeController {
    private final VisitRepository visitRepository;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final UserService userService;
    private final TreatmentRepository treatmentRepository;

    public HomeController(VisitRepository visitRepository, UserRepository userRepository, RoleRepository roleRepository, UserService userService, TreatmentRepository treatmentRepository) {
        this.visitRepository = visitRepository;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.userService = userService;
        this.treatmentRepository = treatmentRepository;
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
    @GetMapping("/registration")
    public String registration(Model model){
        model.addAttribute("patient",new User());
        return "patient-registration";
    }
    @PostMapping("/registration")
    public String registration(@ModelAttribute @Validated User user, BindingResult bindingResult){
        if (!bindingResult.hasErrors()) {
            user.setSalary(0.0);
            Set<Role> roles=new HashSet<>();
            roles.add(roleRepository.findByName("ROLE_PATIENT"));
            user.setRoles(roles);
            userService.saveUser(user,0);
            return "redirect:/";
        }
        return "patient-registration";
    }
    @GetMapping("/treatments")
    public String treatments(Model model){

        model.addAttribute("treatmets",treatmentRepository.findActiveTreatments());
        return "treatments";
    }
}
