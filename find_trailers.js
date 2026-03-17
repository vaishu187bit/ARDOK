const movies = [
    "Chef 2014 movie trailer clip",
    "Julie and Julia trailer 2009",
    "About Time movie trailer clip",
    "Scott Pilgrim vs the world trailer clip",
    "Crazy Stupid Love trailer edit",
    "A beautiful mind 2001 trailer"
];

async function checkEmbed(videoId) {
    try {
        const url = `https://www.youtube.com/embed/${videoId}`;
        const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0' } });
        const text = await res.text();
        if (text.includes('name="robots" content="noindex"') || text.includes('UNPLAYABLE') || text.includes('Video unavailable')) {
            return false;
        }
        return url;
    } catch (e) {
        return false;
    }
}

async function searchYoutube() {
    for (const movie of movies) {
        console.log(`\nSearching for: ${movie}`);
        const searchUrl = `https://www.youtube.com/results?search_query=${encodeURIComponent(movie)}`;
        
        try {
            const res = await fetch(searchUrl, { headers: { 'User-Agent': 'Mozilla/5.0' } });
            const text = await res.text();
            
            // Extract video IDs
            const matches = [...text.matchAll(/"videoId":"([^"]{11})"/g)];
            const uniqueIds = [...new Set(matches.map(m => m[1]))];
            
            let found = false;
            for (const vid of uniqueIds.slice(0, 10)) { // Check top 10 results
                const workingUrl = await checkEmbed(vid);
                if (workingUrl) {
                    console.log(`✅ FOUND: ${workingUrl}`);
                    found = true;
                    break;
                }
            }
            if (!found) console.log(`❌ FAILED for ${movie}`);
            
        } catch (e) {
            console.log(`Error: ${e.message}`);
        }
    }
}

searchYoutube();
