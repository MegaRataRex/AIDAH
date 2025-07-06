package com.megarata.AIDAH.repository;

import com.megarata.AIDAH.model.SpecialistProfile;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface SpecialistProfileRepository extends JpaRepository<SpecialistProfile, UUID> {
    Optional<SpecialistProfile> findByUserId(UUID userId);
}
