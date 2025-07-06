package com.megarata.AIDAH.model;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Timestamp;
import java.util.UUID;

@Entity
@Table(name = "course_contents")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CourseContent {

    @Id
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;

    private String title;

    @Column(name = "video_url", nullable = false)
    private String videoUrl;

    @Column(name = "order_index")
    private Integer orderIndex;

    @Column(name = "created_at")
    private Timestamp createdAt;
}
