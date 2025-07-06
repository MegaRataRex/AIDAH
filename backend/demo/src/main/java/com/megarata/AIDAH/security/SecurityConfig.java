package com.megarata.AIDAH.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable()) // Allow POST from frontend
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/ask-ai").permitAll() // ← allow public AI access
                        .anyRequest().authenticated()           // protect everything else
                );

        return http.build();
    }
}
