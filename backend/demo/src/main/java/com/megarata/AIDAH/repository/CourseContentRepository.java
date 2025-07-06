package com.megarata.AIDAH.repository;

import com.megarata.AIDAH.model.CourseContent;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface CourseContentRepository extends JpaRepository<CourseContent, UUID> {
    List<CourseContent> findByCourseIdOrderByOrderIndexAsc(UUID courseId);
}
