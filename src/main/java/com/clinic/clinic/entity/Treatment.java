package com.clinic.clinic.entity;

import javax.persistence.*;

@Entity
public class Treatment {
    @Id
//    MySQL
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    Oracle
//    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "treatment_Sequence")
//    @SequenceGenerator(name = "treatment_Sequence", sequenceName = "TREATMENT_SEQ")
    private int id;
    private String name;
    private double price;

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
}
