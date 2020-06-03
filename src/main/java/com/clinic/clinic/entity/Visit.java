package com.clinic.clinic.entity;

import javax.persistence.*;

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
    private UserProfile userProfile;

    @ManyToOne
    private Treatment treatment;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public UserProfile getUserProfile() {
        return userProfile;
    }

    public void setUserProfile(UserProfile userProfile) {
        this.userProfile = userProfile;
    }

    public Treatment getTreatment() {
        return treatment;
    }

    public void setTreatment(Treatment treatment) {
        this.treatment = treatment;
    }
}
