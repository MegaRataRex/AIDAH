package com.megarata.AIDAH.model;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Timestamp;
import java.util.UUID;

@Entity
@Table(name = "courses")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Course {

    @Id
    private UUID id;

    private String title;

    private String description;

    @Column(name = "created_at")
    private Timestamp createdAt;
}
