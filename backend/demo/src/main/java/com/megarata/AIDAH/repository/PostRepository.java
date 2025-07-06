package com.megarata.AIDAH.repository;

import com.megarata.AIDAH.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface PostRepository extends JpaRepository<Post, UUID> {
}
