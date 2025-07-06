package com.megarata.AIDAH.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@Entity
@Table(name = "post_hashtags")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostHashtag {

    @Id
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "post_id", nullable = false)
    private Post post;

    private String tag;
}
