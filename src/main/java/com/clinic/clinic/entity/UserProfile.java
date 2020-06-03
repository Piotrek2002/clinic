package com.clinic.clinic.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
public class UserProfile {
    @Id
//    MySQL
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    Oracle
//    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "user_profile_Sequence")
//    @SequenceGenerator(name = "user_profile_Sequence", sequenceName = "USERPROFILE_SEQ")
    private Long id;
    private String name;
    private String surname;
    private long pesel;
    private int insurance;
    private int salary;
    @OneToMany(mappedBy = "userProfile")
    private List<Visit> visit;
    @OneToOne
    private User user;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public long getPesel() {
        return pesel;
    }

    public void setPesel(long pesel) {
        this.pesel = pesel;
    }

    public int getInsurance() {
        return insurance;
    }

    public void setInsurance(int insurance) {
        this.insurance = insurance;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public List<Visit> getVisit() {
        return visit;
    }

    public void setVisit(List<Visit> visit) {
        this.visit = visit;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
