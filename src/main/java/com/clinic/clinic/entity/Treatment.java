package com.clinic.clinic.entity;

import javax.persistence.*;
import javax.validation.constraints.Max;
import java.util.List;

@Entity
public class Treatment {
    @Id
//    MySQL
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    Oracle
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "treatment_Sequence")
    @SequenceGenerator(name = "treatment_Sequence", sequenceName = "TREATMENT_SEQ")
    private int id;
    private String name;
    private double price;
    @OneToMany(mappedBy = "treatment",cascade = CascadeType.REMOVE)
    private List<Visit> visit;
    @Column(length = 1000)
    private String description;
    private int enable;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Visit> getVisit() {
        return visit;
    }

    public void setVisit(List<Visit> visit) {
        this.visit = visit;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getEnable() {
        return enable;
    }

    public void setEnable(int enable) {
        this.enable = enable;
    }
}
