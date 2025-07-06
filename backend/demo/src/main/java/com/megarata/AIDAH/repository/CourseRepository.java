package com.megarata.AIDAH.repository;

import com.megarata.AIDAH.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface CourseRepository extends JpaRepository<Course, UUID> {
}
