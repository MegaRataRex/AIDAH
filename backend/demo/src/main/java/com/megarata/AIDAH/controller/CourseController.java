package com.megarata.AIDAH.controller;

import com.megarata.AIDAH.model.Course;
import com.megarata.AIDAH.model.CourseContent;
import com.megarata.AIDAH.model.UserCourse;
import com.megarata.AIDAH.repository.CourseContentRepository;
import com.megarata.AIDAH.repository.CourseRepository;
import com.megarata.AIDAH.repository.UserCourseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
    @RequestMapping("/courses")
    @RequiredArgsConstructor
    public class CourseController {

        private final CourseRepository courseRepository;
        private final CourseContentRepository contentRepository;
        private final UserCourseRepository userCourseRepository;

        @GetMapping
        public ResponseEntity<List<Course>> getAllCourses() {
            List<Course> courses = courseRepository.findAll();
            return ResponseEntity.ok(courses);
        }

        @GetMapping("/{id}/contents")
        public ResponseEntity<List<CourseContent>> getCourseContents(@PathVariable UUID id) {
            List<CourseContent> contents = contentRepository.findByCourseIdOrderByOrderIndexAsc(id);
            return ResponseEntity.ok(contents);
        }

    @GetMapping("/{id}/progress/{userId}")
    public ResponseEntity<Float> getCourseProgress(
            @PathVariable UUID id,
            @PathVariable UUID userId) {

        Optional<UserCourse> progress = userCourseRepository
                .findByUserId(userId)
                .stream()
                .filter(uc -> uc.getCourse().getId().equals(id))
                .findFirst();

        return progress
                .map(userCourse -> ResponseEntity.ok(userCourse.getProgressPercent()))
                .orElse(ResponseEntity.ok(0.0f)); // Default to 0% if not found
    }



}
