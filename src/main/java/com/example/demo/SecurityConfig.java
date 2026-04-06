package com.example.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.HttpStatusEntryPoint;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    // ── Chain 1: Movie API only (stateless, returns 401 not redirect) ──
    // Narrowed to /api/movies/** ONLY — user endpoints need OAuth2 session
    @Bean
    @Order(1)
    public SecurityFilterChain apiFilterChain(HttpSecurity http) throws Exception {
        http
            .securityMatcher("/api/movies/**")
            .csrf(csrf -> csrf.disable())
            .sessionManagement(session ->
                session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
            .authorizeHttpRequests(auth -> auth
                .anyRequest().permitAll()
            )
            .exceptionHandling(ex -> ex
                .authenticationEntryPoint(new HttpStatusEntryPoint(HttpStatus.UNAUTHORIZED))
            );
        return http.build();
    }

    // ── Chain 2: All other routes — stateful, OAuth2 session available ──
    // /api/user/** lands here so @AuthenticationPrincipal works correctly
    @Bean
    @Order(2)
    public SecurityFilterChain webFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                    "/", "/index.html", "/quiz.html",
                    "/static/**", "/css/**", "/image.png",
                    "/lighthouse-poster.jpg", "/about-time-poster.jpg",
                    "/api/user/status", "/api/user/complete-quiz"
                ).permitAll()
                .anyRequest().authenticated()
            )
            .oauth2Login(oauth2 -> oauth2
                .defaultSuccessUrl("/", true)
                .failureUrl("/?error=auth_failed")
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .deleteCookies("JSESSIONID")
                .invalidateHttpSession(true)
                .permitAll()
            );
        return http.build();
    }
}
