# ARDOK Project Notes
> Last updated: 2026-03-18

## Project Overview
- **Type**: Spring Boot Web Application
- **Purpose**: Mood-based movie recommendation app with Google OAuth2 login
- **Port**: `localhost:8080`
- **Database**: MySQL on port 3306, DB name: `movie_db`
- **GitHub Repo**: https://github.com/vaishu187bit/ARDOK

---

## Tech Stack
| Layer | Technology |
|---|---|
| Backend | Spring Boot (Java) |
| Auth | Google OAuth2 (Spring Security) |
| Database | MySQL + Spring Data JPA |
| Frontend | HTML/CSS/JS (served from `/static/`) |

---

## Project File Structure
```
src/main/java/com/example/demo/
├── DemoApplication.java      → Main entry point
├── SecurityConfig.java       → Spring Security + OAuth2 config
├── WebController.java        → Serves index.html at "/"
├── MovieController.java      → GET /api/movies/{mood}
├── UserController.java       → GET /api/user/status
├── MovieRepository.java      → JPA repo for movies
├── UserRepository.java       → JPA repo for users
├── Movie.java                → Movie entity
└── User.java                 → User entity

src/main/resources/
├── application.properties    → DB + OAuth2 config (DO NOT COMMIT)
└── static/
    └── index.html            → Frontend
```

---

## API Endpoints
| Method | URL | Auth Required | Description |
|---|---|---|---|
| GET | `/` | No | Serves frontend (index.html) |
| GET | `/api/movies/{mood}` | No | Get movies by mood |
| GET | `/api/user/status` | No | Check login status |
| GET | `/logout` | Yes | Logout user |

---

## Google OAuth2 Setup
- **Google Cloud Console Project**: ARDOK
- **Authorized redirect URI**: `http://localhost:8080/login/oauth2/code/google`
- **Scopes**: `profile`, `email`
- Keys stored in `application.properties` (gitignored)

---

## Bugs Fixed So Far
1. ✅ **Access Denied on OAuth2 login** → Fixed redirect URI mismatch in `application.properties`
2. ✅ **403 on /api/user/status** → Added to permitted URLs in `SecurityConfig.java`
3. ✅ **Ambiguous mapping startup error** → Removed duplicate `/api/user` endpoint from `MovieController.java` (2026-03-18)
4. ✅ **500 Error on API call** → Added explicit `("mood")` to `@PathVariable` string parsing, and escaped the MySQL reserved keyword `` `cast` `` in `Movie.java`. (2026-03-18)
5. ✅ **Unwanted OAuth Redirects on /api/** → Separated `SecurityConfig` into two chains (`@Order(1)` stateless REST, `@Order(2)` stateful web auth) so APIs return 401 correctly instead of trapping UI requests in Google redirects. (2026-03-18)
6. ✅ **Cards unclickable (onclick quote escaping)** → Moved descriptions into a JS state array (`moviesData`) and passed only the array index to `showDetails()`. (2026-03-18)
7. ✅ **YouTube Trailer DRM Blocks (Video Unavailable)** → Replaced official trailer IDs in MySQL `moviesdb.sql` with fallback clips and cinematic placeholder URLs for heavily restricted studios (Sony/Universal). (2026-03-18)

---

## Known Issues / TODO
- [ ] Frontend UI needs to be connected to `/api/user/status` to detect login state
- [ ] Movie browsing should work without login (already permitted in SecurityConfig)
- [ ] Test full Google login flow on localhost

---

## How to Run Locally
```bash
# From: C:\Users\akshi\Documents\ARDOK\demo\demo
./mvnw spring-boot:run
```
Then open: http://localhost:8080

---

## Git Quick Reference
```bash
git add .
git commit -m "describe change"
git push
```
GitHub: https://github.com/vaishu187bit/ARDOK
