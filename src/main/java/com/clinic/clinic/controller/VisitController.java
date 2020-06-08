package com.clinic.clinic.controller;

import com.clinic.clinic.repository.VisitRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/visit")
public class VisitController {

    private final VisitRepository visitRepository;

    public VisitController(VisitRepository visitRepository) {
        this.visitRepository = visitRepository;
    }

    @GetMapping("/list")
    public String list(Model model){

        model.addAttribute("visits", visitRepository.findAll());
        return "visit-list";
    }

}
