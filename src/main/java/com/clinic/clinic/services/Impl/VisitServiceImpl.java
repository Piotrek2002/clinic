package com.clinic.clinic.services.Impl;

import com.clinic.clinic.entity.Visit;
import com.clinic.clinic.repository.VisitRepository;
import com.clinic.clinic.services.VisitService;
import org.springframework.stereotype.Service;

@Service
public class VisitServiceImpl implements VisitService {
    private final VisitRepository visitRepository;

    public VisitServiceImpl(VisitRepository visitRepository) {
        this.visitRepository = visitRepository;
    }

    @Override
    public void save(Visit visit,int status) {
        visit.setStatus(status);
        visitRepository.save(visit);
    }

    @Override
    public void edit(Visit visit) {
        visitRepository.save(visit);
    }
}
