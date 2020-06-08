package com.clinic.clinic.repository;

import com.clinic.clinic.entity.Role;
import com.clinic.clinic.entity.Treatment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TreatmentRepository extends JpaRepository<Treatment, Integer> {
}
