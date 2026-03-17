package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class MovieController {

    @Autowired
    private MovieRepository movieRepository;

    @GetMapping("/api/movies/{mood}")
    public List<Movie> getMoviesByMood(@PathVariable String mood) {
        System.out.println("Fetching movies for mood: " + mood);
        return movieRepository.findByMood(mood);
    }

    @GetMapping("/api/user")
    public Map<String, Object> getUser(@AuthenticationPrincipal OAuth2User principal) {
        if (principal == null) return Map.of("name", "");
        return Map.of("name", principal.getAttribute("name"));
    }
}
