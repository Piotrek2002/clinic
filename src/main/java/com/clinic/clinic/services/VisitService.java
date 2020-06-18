package com.clinic.clinic.services;

import com.clinic.clinic.entity.Visit;

public interface VisitService {
    void save(Visit visit, int status);
    void edit(Visit visit);
}
