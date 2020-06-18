package com.clinic.clinic.services.Impl;

import com.clinic.clinic.entity.Treatment;
import com.clinic.clinic.repository.TreatmentRepository;
import com.clinic.clinic.services.TreatmentService;
import org.springframework.stereotype.Service;

@Service
public class TreatmentServiceImpl implements TreatmentService {
    private final TreatmentRepository treatmentRepository;

    public TreatmentServiceImpl(TreatmentRepository treatmentRepository) {
        this.treatmentRepository = treatmentRepository;
    }

    @Override
    public void save(Treatment treatment) {
treatmentRepository.save(treatment);
    }
}
