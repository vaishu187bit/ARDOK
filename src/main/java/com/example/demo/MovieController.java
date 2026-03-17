package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MovieController {

    @Autowired
    private MovieRepository movieRepository;

    @GetMapping("/api/movies/{mood}")
    public List<Movie> getMoviesByMood(@PathVariable("mood") String mood) {
        System.out.println("Fetching movies for mood: " + mood);
        return movieRepository.findByMood(mood);
    }
}
