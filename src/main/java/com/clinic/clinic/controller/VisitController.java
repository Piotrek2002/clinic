package com.clinic.clinic.controller;

import com.clinic.clinic.entity.User;
import com.clinic.clinic.entity.Visit;
import com.clinic.clinic.repository.TreatmentRepository;
import com.clinic.clinic.repository.UserRepository;
import com.clinic.clinic.repository.VisitRepository;
import com.clinic.clinic.services.VisitService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@Controller
@RequestMapping("/visit")
public class VisitController {

    private final VisitRepository visitRepository;
    private final TreatmentRepository treatmentRepository;
    private final VisitService visitService;
    private final UserRepository userRepository;

    public VisitController(VisitRepository visitRepository, TreatmentRepository treatmentRepository, VisitService visitService, UserRepository userRepository) {
        this.visitRepository = visitRepository;
        this.treatmentRepository = treatmentRepository;
        this.visitService = visitService;
        this.userRepository = userRepository;
    }

    @GetMapping("/list")
    public String list(Model model) {

        model.addAttribute("visits", visitRepository.findAll());
        return "visit-list";
    }

    @GetMapping("/listToComplete")
    public String listToComplete(Model model) {
        model.addAttribute("visits", visitRepository.findAllToComplete());
        return "visit-list";
    }

    @GetMapping("/listCompleted")
    public String listCompleted(Model model) {
        model.addAttribute("visits", visitRepository.findAllCompleted());
        return "visit-list";
    }

    @GetMapping("/add/{userId}")
    public String add(Model model) {
        model.addAttribute("treatments", treatmentRepository.findAll());
        model.addAttribute("visit", new Visit());
        return "visit-add";
    }

    @PostMapping("/add/{userId}")
    public String add(@ModelAttribute @Validated Visit visit, BindingResult bindingResult, @RequestParam("localDate")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime localDateTime,
                      @AuthenticationPrincipal UserDetails customUser, @PathVariable long userId) {
        if (!bindingResult.hasErrors()) {
            visit.setDate(localDateTime);
            User user=userRepository.findByUsername(customUser.getUsername());
            visit.setPatientProfile(userRepository.findUserById(userId));
            visit.setUserId(user.getId());
            if (visit.getPatientProfile().getInsurance()==0){
                visit.setPrice(visit.getTreatment().getPrice());
            }else {
                visit.setPrice(0);
            }
            visitService.save(visit,0);

            return "redirect:/patient/details/"+visit.getPatientProfile().getId();
        }
        return "visit-add";

    }
    @GetMapping("/details/{id}")
    public String details(@PathVariable int id,Model model){

        Visit visit=visitRepository.findVisitById(id);
        model.addAttribute("visit",visit);
        model.addAttribute("user",userRepository.findUserById(visit.getUserId()));
        return "visit-details";
    }
    @GetMapping("/edit/{id}")
    public String edit(Model model,@PathVariable int id){
        model.addAttribute("treatments", treatmentRepository.findAll());
        model.addAttribute("visit",visitRepository.findVisitById(id));
        return "visit-edit";
    }
    @PostMapping("/edit/{id}")
    public String edit(@ModelAttribute @Validated Visit visit, BindingResult bindingResult, @RequestParam("localDate")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime localDateTime,
                        @PathVariable long id){

        if (!bindingResult.hasErrors()) {
            if (visit.getPatientProfile().getInsurance()==0){
                visit.setPrice(visit.getTreatment().getPrice());
            }else {
                visit.setPrice(0);
            }
            visit.setDate(localDateTime);
            visitService.edit(visit);

            return "redirect:/patient/details/"+visit.getPatientProfile().getId();
        }

        return "visit-edit";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id){
        Visit visit=visitRepository.findVisitById(id);
        visitRepository.delete(visit);
        return "redirect:/patient/details/"+visit.getPatientProfile().getId();
    }
    @GetMapping("/completed/{id}")
    public String completed(@PathVariable int id){
        visitService.save(visitRepository.findVisitById(id),1);
        return "redirect:/visit/details/"+id;
    }
    @GetMapping("/details/home/{id}")
    public String detailsHome(@PathVariable int id,Model model){

        Visit visit=visitRepository.findVisitById(id);
        model.addAttribute("visit",visit);
        model.addAttribute("user",userRepository.findUserById(visit.getUserId()));
        return "visit-details-home";
    }
}
