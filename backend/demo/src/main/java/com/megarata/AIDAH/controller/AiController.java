package com.megarata.AIDAH.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@RestController
@RequestMapping("/ask-ai")
@RequiredArgsConstructor
public class AiController {

    @Value("${openai.api.key}")
    private String apiKey;

    @Value("${openai.api.url}")
    private String apiUrl;

    private final RestTemplate restTemplate = new RestTemplate();

    @PostMapping
    public ResponseEntity<Map<String, String>> askAi(@RequestBody Map<String, String> body) {
        String userInput = body.get("message");

        String adjustedPrompt = "Recuerda: responde únicamente con información útil relacionada con TDAH. " + userInput;

        List<Map<String, String>> messages = List.of(
                Map.of("role", "system", "content", """
        Instrucciones estrictas:

        1. Solo responde preguntas relacionadas con el TDAH.
        2. Las respuestas deben estar dirigidas a personas con TDAH, o a sus padres o tutores.
        3. Mantén las respuestas concisas. No te extiendas innecesariamente.
        4. Puedes explicar brevemente si es útil, pero nunca divagues.
        5. Evita respuestas genéricas, innecesarias o repetitivas.

        Ahora responde a la siguiente pregunta:
        """),
                Map.of("role", "user", "content", adjustedPrompt)
        );


        // Build OpenAI chat request
        Map<String, Object> request = new HashMap<>();
        request.put("model", "gpt-3.5-turbo");
        request.put("temperature", 0.2);
        request.put("messages", messages);
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(apiKey);
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(request, headers);

        try {
            ResponseEntity<Map> response = restTemplate.postForEntity(apiUrl, entity, Map.class);
            Map responseBody = (Map) response.getBody();
            List choices = (List) responseBody.get("choices");
            Map firstChoice = (Map) choices.get(0);
            Map message = (Map) firstChoice.get("message");

            String content = (String) message.get("content");
            return ResponseEntity.ok(Map.of("response", content));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("error", "AI service unavailable", "details", e.getMessage()));
        }
    }
}
