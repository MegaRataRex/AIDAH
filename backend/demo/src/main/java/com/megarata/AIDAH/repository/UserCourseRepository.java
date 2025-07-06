package com.megarata.AIDAH.repository;

import com.megarata.AIDAH.model.UserCourse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface UserCourseRepository extends JpaRepository<UserCourse, UUID> {
    List<UserCourse> findByUserId(UUID userId);
}
