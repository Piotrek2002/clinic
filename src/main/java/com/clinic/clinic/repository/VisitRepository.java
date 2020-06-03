package com.clinic.clinic.repository;

import com.clinic.clinic.entity.Role;
import com.clinic.clinic.entity.Visit;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VisitRepository extends JpaRepository<Visit, Integer> {
}
