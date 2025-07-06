package com.megarata.AIDAH.controller;

import com.megarata.AIDAH.model.*;
import com.megarata.AIDAH.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.*;

@RestController
@RequestMapping("/posts")
@RequiredArgsConstructor
public class PostController {

    private final PostRepository postRepo;
    private final CommentRepository commentRepo;
    private final UserRepository userRepo;
    private final PostHashtagRepository tagRepo;

    @GetMapping
    public ResponseEntity<List<Post>> getAllPosts() {
        return ResponseEntity.ok(postRepo.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Post> getPostById(@PathVariable UUID id) {
        return postRepo.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<Post> createPost(@RequestBody Map<String, String> body) {
        UUID authorId = UUID.fromString(body.get("authorId"));
        String title = body.get("title");
        String text = body.get("body");

        Optional<User> author = userRepo.findById(authorId);
        if (author.isEmpty()) return ResponseEntity.badRequest().build();

        Post post = Post.builder()
                .id(UUID.randomUUID())
                .author(author.get())
                .title(title)
                .body(text)
                .createdAt(new Timestamp(System.currentTimeMillis()))
                .build();

        return ResponseEntity.ok(postRepo.save(post));
    }

    @GetMapping("/{id}/comments")
    public ResponseEntity<List<Comment>> getComments(@PathVariable UUID id) {
        return ResponseEntity.ok(commentRepo.findByPostId(id));
    }

    @PostMapping("/{id}/comments")
    public ResponseEntity<Comment> addComment(@PathVariable UUID id, @RequestBody Map<String, String> body) {
        UUID authorId = UUID.fromString(body.get("authorId"));
        String text = body.get("body");

        Optional<User> author = userRepo.findById(authorId);
        Optional<Post> post = postRepo.findById(id);

        if (author.isEmpty() || post.isEmpty()) return ResponseEntity.badRequest().build();

        Comment comment = Comment.builder()
                .id(UUID.randomUUID())
                .author(author.get())
                .post(post.get())
                .body(text)
                .createdAt(new Timestamp(System.currentTimeMillis()))
                .build();

        return ResponseEntity.ok(commentRepo.save(comment));
    }
}
