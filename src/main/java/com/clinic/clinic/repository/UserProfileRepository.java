package com.clinic.clinic.repository;

import com.clinic.clinic.entity.Role;
import com.clinic.clinic.entity.UserProfile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserProfileRepository extends JpaRepository<UserProfile, Integer> {
}
