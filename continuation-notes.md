# Continuation Notes: How to Fix YouTube Trailers

Hey! When you come back to the AI, just say:
> **"Read continuation-notes.md and let's finish fixing the YouTube trailers."**

## What remains to be done:
Some movies (like Chef, Julie & Julia, About Time, etc.) are still showing "Video Unavailable", even after replacing the links in the database.

This is because YouTube uses **Strict iframe embedding restrictions (DRM)** on videos uploaded by huge studios (like Sony Pictures, Universal). Even if you find a working video on youtube.com, it will refuse to load inside `localhost:8080`'s iframe player.

## The proposed solution for next time:
We need to run a Node.js scraper script (we started writing one called `find_trailers.js`) to find specifically **"Embeddable" versions** of these trailers on YouTube.
Alternatively, we might need to use the YouTube Data API to explicitly filter for `videoEmbeddable: true` or manually find non-copyright uploads.

**Affected Movies:**
- The Big Lebowski
- Chef
- Julie & Julia
- About Time
- Scott Pilgrim vs the World
- Crazy Stupid Love
- A Beautiful Mind
- Juno
- The Pursuit of Happyness

## What works so far:
- Server API 500 error is completely fixed (`@PathVariable` named correctly, `` `cast` `` escaped).
- Google OAuth is perfectly separated from the `/api/movies` REST API (`SecurityConfig` now has 2 chains, returning 401 correctly).
- Movie button click logic in JavaScript is fully fixed (array index-based lookup instead of raw strings).
- Database connection works.

Just save this file to Git using:
`git add .`
`git commit -m "Save progress before fixing DRM trailers"`
`git push`
