package com.clinic.clinic.entity;

import javax.persistence.*;

@Entity
public class Role {
    @Id
//    MySQL
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    Oracle
//    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "role_Sequence")
//    @SequenceGenerator(name = "role_Sequence", sequenceName = "ROLE_SEQ")
    private int id;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
