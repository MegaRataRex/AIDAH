package com.megarata.AIDAH.repository;

import com.megarata.AIDAH.model.PostHashtag;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface PostHashtagRepository extends JpaRepository<PostHashtag, UUID> {
    List<PostHashtag> findByPostId(UUID postId);
}
