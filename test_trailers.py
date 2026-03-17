import urllib.request
import re
import json

movies = [
    "Chef 2014 trailer",
    "Julie and Julia 2009 trailer",
    "About Time 2013 trailer",
    "Scott Pilgrim vs the world trailer",
    "Crazy Stupid Love trailer",
    "A beautiful mind 2001 trailer"
]

for query in movies:
    print(f"\nSearching for: {query}")
    url = "https://www.youtube.com/results?search_query=" + urllib.parse.quote(query)
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    
    try:
        html = urllib.request.urlopen(req).read().decode('utf-8')
        video_ids = re.findall(r'"videoId":"([^"]{11})"', html)
        
        # Deduplicate while preserving order
        seen = set()
        unique_ids = [x for x in video_ids if not (x in seen or seen.add(x))]
        
        found = False
        for vid in unique_ids[:5]:
            embed_url = f"https://www.youtube.com/embed/{vid}"
            req2 = urllib.request.Request(embed_url, headers={'User-Agent': 'Mozilla/5.0'})
            try:
                html2 = urllib.request.urlopen(req2).read().decode('utf-8')
                if 'name="robots" content="noindex"' not in html2 and 'UNPLAYABLE' not in html2 and 'Video unavailable' not in html2:
                    print(f"  [SUCCESS] {embed_url}")
                    found = True
                    break
            except Exception as e:
                pass
        
        if not found:
            print("  [FAILED] All top 5 videos were unembeddable.")
            
    except Exception as e:
        print(f"  Error: {e}")
