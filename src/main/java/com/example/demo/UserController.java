package com.example.demo;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/status")
    public Map<String, Object> getUserStatus(@AuthenticationPrincipal OAuth2User principal) {
        Map<String, Object> response = new HashMap<>();

        // If user is not logged in, return loggedIn: false (no redirect, no error)
        if (principal == null) {
            response.put("loggedIn", false);
            return response;
        }

        String email = principal.getAttribute("email");
        String name = principal.getAttribute("name");

        // Find or create user in database
        User user = userRepository.findByEmail(email).orElseGet(() -> {
            User newUser = new User();
            newUser.setEmail(email);
            newUser.setName(name);
            newUser.setQuizCompleted(true);
            return userRepository.save(newUser);
        });

        response.put("loggedIn", true);
        response.put("name", user.getName());
        response.put("quizCompleted", user.isQuizCompleted());

        return response;
    }
}
