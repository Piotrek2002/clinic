package com.clinic.clinic.controller;

import com.clinic.clinic.entity.Treatment;
import com.clinic.clinic.repository.TreatmentRepository;
import com.clinic.clinic.services.TreatmentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/treatment")
public class TreatmentController {

    private final TreatmentRepository treatmentRepository;
    private final TreatmentService treatmentService;

    public TreatmentController(TreatmentRepository treatmentRepository, TreatmentService treatmentService) {
        this.treatmentRepository = treatmentRepository;
        this.treatmentService = treatmentService;
    }

    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("treatment",new Treatment());
        return "treatment-add";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute @Validated Treatment treatment, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            treatment.setEnable(1);
            treatmentService.save(treatment);
            return "redirect:/treatment/list";
        }
        return "treatment-add";
    }
    @GetMapping("/list")
    public String list(Model model){
        model.addAttribute("treatments",treatmentRepository.findAll());
        return "treatment-list";
    }
    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable int id){
        model.addAttribute("treatment",treatmentRepository.findTreatmentById(id));
        return "treatment-edit";
    }
    @PostMapping("/edit/{id}")
    public String edit(@ModelAttribute @Validated Treatment treatment, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            treatment.setEnable(1);
            treatmentService.save(treatment);
            return "redirect:/treatment/list";
        }
        return "treatment-edit";
    }
}
