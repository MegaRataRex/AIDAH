package com.megarata.AIDAH.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@Entity
@Table(name = "specialist_profiles")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SpecialistProfile {

    @Id
    private UUID id;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    private String phone;

    private String email;

    @Column(name = "location")
    private String location;

    @Column(columnDefinition = "TEXT")
    private String description;
}
