package com.megarata.AIDAH.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@Entity
@Table(name = "user_courses")
@Getter
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserCourse {

    @Id
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;

    @Column(name = "progress_percent")
    private Float progressPercent;
}
