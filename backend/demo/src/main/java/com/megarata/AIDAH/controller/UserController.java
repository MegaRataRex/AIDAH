package com.megarata.AIDAH.controller;

import com.megarata.AIDAH.model.*;
import com.megarata.AIDAH.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserRepository userRepo;
    private final SpecialistProfileRepository specialistRepo;

    @GetMapping("/users/{id}")
    public ResponseEntity<User> getUser(@PathVariable UUID id) {
        return userRepo.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/specialists")
    public ResponseEntity<List<SpecialistProfile>> getAllSpecialists() {
        return ResponseEntity.ok(specialistRepo.findAll());
    }
}
