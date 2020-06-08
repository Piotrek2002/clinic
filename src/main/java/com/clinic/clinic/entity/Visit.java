package com.clinic.clinic.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
public class Visit {
    @Id
//    MySQL
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    Oracle
//    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "visit_Sequence")
//    @SequenceGenerator(name = "visit_Sequence", sequenceName = "ROLE_SEQ")
    private int id;


    @ManyToOne
    private Treatment treatment;

//    @ManyToMany(mappedBy = "visits")
//    private List<UserProfile> userProfile;

    @ManyToOne
    private User patientProfile;


    private Long userId;

    private int status;
    private double price;
    private LocalDateTime date;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Treatment getTreatment() {
        return treatment;
    }

    public void setTreatment(Treatment treatment) {
        this.treatment = treatment;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public User getPatientProfile() {
        return patientProfile;
    }

    public void setPatientProfile(User patientProfile) {
        this.patientProfile = patientProfile;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
