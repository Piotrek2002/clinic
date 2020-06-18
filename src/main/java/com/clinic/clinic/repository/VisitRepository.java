package com.clinic.clinic.repository;

import com.clinic.clinic.entity.Role;
import com.clinic.clinic.entity.Visit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VisitRepository extends JpaRepository<Visit, Integer> {
    List<Visit> findAll();
    @Query("select v from Visit v where v.status=0")
    List<Visit> findAllToComplete();
    @Query("select v from Visit v where v.status=1")
    List<Visit> findAllCompleted();
    @Query("select v from Visit v where v.status=0 and v.patientProfile.id=?1")
    List<Visit> findAllToCompleteByPatient(Long id);
    @Query("select v from Visit v where v.status=1 and v.patientProfile.id=?1")
    List<Visit> findAllCompletedByPatient(Long id);
    @Query("select v from Visit v where v.status=0 and v.userId=?1")
    List<Visit> findAllToCompleteByUser(Long id);
    @Query("select v from Visit v where v.status=1 and v.userId=?1")
    List<Visit> findAllCompletedByUser(Long id);

    @Query("select v from Visit v where v.id=?1")
    Visit findVisitById(int id);

}
