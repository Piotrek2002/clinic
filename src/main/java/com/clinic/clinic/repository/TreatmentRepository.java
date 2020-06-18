package com.clinic.clinic.repository;

import com.clinic.clinic.entity.Role;
import com.clinic.clinic.entity.Treatment;
import com.clinic.clinic.entity.Visit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TreatmentRepository extends JpaRepository<Treatment, Integer> {
    @Query("select t from Treatment t where t.id=?1")
    Treatment findTreatmentById(int id);
    @Query("select t from Treatment t where t.enable=1")
    List<Treatment> findActiveTreatments();
}
