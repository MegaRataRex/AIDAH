package com.megarata.AIDAH.model;

import jakarta.persistence.*;
import lombok.*;
import java.util.UUID;
import java.sql.Timestamp;

@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

    @Id
    private UUID id;

    private String name;

    @Column(unique = true, nullable = false)
    private String email;

    private UserRole role;

    @Column(name = "profile_image")
    private String profileImage;

    @Column(name = "created_at")
    private Timestamp createdAt;


    public enum UserRole {
        PADRE,
        MAESTRO,
        ESPECIALISTA
    }
}
