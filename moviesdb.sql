-- =====================================================
-- ARDOK Movies Database - Full Setup
-- =====================================================

DROP DATABASE IF EXISTS movie_db;
CREATE DATABASE movie_db;
USE movie_db;

SET SQL_SAFE_UPDATES = 0;

-- =====================================================
-- Create movies table
-- =====================================================
CREATE TABLE IF NOT EXISTS movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    mood VARCHAR(100),
    genre VARCHAR(100),
    description TEXT,
    director VARCHAR(100),
    cast TEXT,
    runtime VARCHAR(50),
    trailer_url VARCHAR(255),
    ott_platforms VARCHAR(255),
    rating DOUBLE
);

-- =====================================================
-- Create users table
-- =====================================================
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE,
    name VARCHAR(255),
    quiz_completed BOOLEAN DEFAULT TRUE
);

-- =====================================================
-- Insert Movies (moods match website buttons exactly)
-- Moods: Happy | Sad | Mind-bending | Epic | Eerie | Thoughtful | Chill | Quirky
-- =====================================================

INSERT INTO movies (title, mood, genre, description, director, cast, runtime, trailer_url, ott_platforms, rating) VALUES

-- ===== HAPPY =====
('The Hangover', 'Happy', 'Comedy',
 'A Las Vegas bachelor party turns into a wild mystery when the groom goes missing. Three hungover friends must retrace their steps to find him in this hilarious rollercoaster of absurd situations and unforgettable characters.',
 'Todd Phillips', 'Bradley Cooper, Ed Helms, Zach Galifianakis', '1h 40m',
 'https://www.youtube.com/embed/tcdUhdOlz9M', 'HBO Max', 7.7),

('Superbad', 'Happy', 'Comedy',
 'Two high school seniors have one goal for their final weeks: attend a party and have the night of their lives. Along with their nerdy friend Fogell, they embark on an epic night of misadventures involving fake IDs and drunken cops.',
 'Greg Mottola', 'Jonah Hill, Michael Cera, Christopher Mintz-Plasse', '1h 53m',
 'https://www.youtube.com/embed/4eaZ_48ZYog', 'Netflix', 7.6),

('Crazy, Stupid, Love', 'Happy', 'Romantic Comedy',
 'A middle-aged man reinvents himself after his wife asks for a divorce. With help from a young Casanova, he navigates dating again — only for their lives to comically intersect in unexpected ways.',
 'Glenn Ficarra, John Requa', 'Steve Carell, Ryan Gosling, Emma Stone', '1h 58m',
 'https://www.youtube.com/embed/flvz5RMRx7E', 'Netflix, Prime Video', 7.4),

('Knives Out', 'Happy', 'Comedy Mystery',
 'When a famous crime novelist is found dead, a brilliant detective investigates his eccentric family. Packed with wit, sharp twists, and a stellar ensemble cast, this is a modern Agatha Christie delight.',
 'Rian Johnson', 'Daniel Craig, Chris Evans, Ana de Armas', '2h 10m',
 'https://www.youtube.com/embed/qGqiHJTsRkQ', 'Prime Video', 7.9),

-- ===== SAD =====
('The Pursuit of Happyness', 'Sad', 'Drama',
 'Based on a true story — Chris Gardner invests his life savings in a bone-density scanner, only to find himself homeless with his young son. Despite overwhelming odds, he fights to build a better life. An emotional journey about determination and the unbreakable bond between father and son.',
 'Gabriele Muccino', 'Will Smith, Jaden Smith, Thandie Newton', '1h 57m',
 'https://www.youtube.com/embed/DMOBlEcRuw8', 'Netflix, Prime Video', 8.0),

('Schindler''s List', 'Sad', 'Historical Drama',
 'The true story of Oskar Schindler, a German businessman who saved over a thousand Jewish refugees during the Holocaust by employing them in his factories. Spielberg''s masterpiece is a devastating and deeply human portrait of war and compassion.',
 'Steven Spielberg', 'Liam Neeson, Ben Kingsley, Ralph Fiennes', '3h 15m',
 'https://www.youtube.com/embed/gG22XNhtnoY', 'Peacock, Prime Video', 9.0),

('Manchester by the Sea', 'Sad', 'Drama',
 'A Boston janitor returns to his hometown after his brother dies, and must become the guardian of his teenage nephew. The film tenderly explores grief, guilt, and the possibility — or impossibility — of redemption.',
 'Kenneth Lonergan', 'Casey Affleck, Michelle Williams, Kyle Chandler', '2h 17m',
 'https://www.youtube.com/embed/gsVoD0pTge0', 'Prime Video', 7.8),

('A Beautiful Mind', 'Sad', 'Drama',
 'The story of the brilliant but troubled mathematician John Nash, who made a discovery that changed the course of math and economics — and his harrowing battle with paranoid schizophrenia that nearly destroyed him.',
 'Ron Howard', 'Russell Crowe, Jennifer Connelly, Ed Harris', '2h 15m',
 'https://www.youtube.com/embed/9wZM7CQY130', 'Netflix', 8.2),

-- ===== MIND-BENDING =====
('The Matrix', 'Mind-bending', 'Sci-Fi Action',
 'A computer hacker discovers that reality is a simulated construct created by machines, and is drawn into a rebellion to free humanity. Groundbreaking in its philosophy and action sequences, The Matrix is a pop-culture milestone.',
 'Lana Wachowski, Lilly Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', '2h 16m',
 'https://www.youtube.com/embed/vKQi3bBA1y8', 'HBO Max', 8.7),

('Inception', 'Mind-bending', 'Sci-Fi Thriller',
 'A skilled thief who enters the dreams of others to steal secrets is given the inverse task: planting an idea. Nolan''s labyrinthine thriller layers dreams within dreams, blurring the line between reality and imagination.',
 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt, Elliot Page', '2h 28m',
 'https://www.youtube.com/embed/YoHD9XEInc0', 'Netflix, Prime Video', 8.8),

('Shutter Island', 'Mind-bending', 'Psychological Thriller',
 'In 1954, U.S. Marshal Teddy Daniels investigates a disappearance at a remote psychiatric facility for the criminally insane. As he digs deeper, reality itself begins to unravel in Scorsese''s beautifully crafted psychological trap.',
 'Martin Scorsese', 'Leonardo DiCaprio, Mark Ruffalo, Ben Kingsley', '2h 18m',
 'https://www.youtube.com/embed/5iaYLCiq5RM', 'Paramount+, Netflix', 8.1),

('Memento', 'Mind-bending', 'Psychological Thriller',
 'A man with short-term memory loss uses tattoos and Polaroid notes to track down his wife''s murderer. Told in reverse chronological order, this neo-noir mystery is a puzzle that rewards careful attention.',
 'Christopher Nolan', 'Guy Pearce, Carrie-Anne Moss, Joe Pantoliano', '1h 53m',
 'https://www.youtube.com/embed/0vS0E9bBSL0', 'Prime Video, Peacock', 8.4),

-- ===== EPIC =====
('Dune: Part Two', 'Epic', 'Sci-Fi Adventure',
 'Paul Atreides unites with the Fremen people of Arrakis to wage war against the House Harkonnen. As he embraces his destiny, he must balance love, revenge, and immense power. A breathtaking continuation filled with grand-scale battles and political intrigue.',
 'Denis Villeneuve', 'Timothée Chalamet, Zendaya, Rebecca Ferguson', '2h 46m',
 'https://www.youtube.com/embed/U2Qp5pL3ovA', 'Max', 8.5),

('The Dark Knight', 'Epic', 'Action Thriller',
 'Batman faces his greatest test when the Joker, a terrorist of pure chaos, threatens to tear Gotham apart. Nolan''s superhero epic transcends the genre with stunning performances, moral complexity, and relentless tension.',
 'Christopher Nolan', 'Christian Bale, Heath Ledger, Aaron Eckhart', '2h 32m',
 'https://www.youtube.com/embed/EXeTwQWrcwY', 'HBO Max', 9.0),

('Gladiator', 'Epic', 'Action Drama',
 'A betrayed Roman general is reduced to slavery and becomes a gladiator, fighting his way back to power to avenge his murdered family and emperor. Scott''s sweeping epic is a visceral and emotional triumph.',
 'Ridley Scott', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen', '2h 35m',
 'https://www.youtube.com/embed/owK1qxDselE', 'Peacock, Prime Video', 8.5),

('Avengers: Endgame', 'Epic', 'Superhero Action',
 'The surviving Avengers assemble one final time to undo the catastrophic damage caused by Thanos. A decade in the making, this emotionally charged conclusion to Marvel''s Infinity Saga is cinematic history.',
 'Anthony Russo, Joe Russo', 'Robert Downey Jr., Chris Evans, Scarlett Johansson', '3h 1m',
 'https://www.youtube.com/embed/TcMBFSGVi1c', 'Disney+', 8.4),

-- ===== EERIE =====
('Donnie Darko', 'Eerie', 'Sci-Fi Psychological',
 'A troubled teenager is plagued by visions of a menacing rabbit figure that manipulates him toward dark acts, all while a catastrophic temporal anomaly looms. A haunting cult classic that blends philosophical mystery with teen drama.',
 'Richard Kelly', 'Jake Gyllenhaal, Jena Malone, Drew Barrymore', '1h 53m',
 'https://www.youtube.com/embed/ZZyBaFYFySk', 'Prime Video, Hulu', 8.0),

('Get Out', 'Eerie', 'Horror Thriller',
 'A Black man visits his white girlfriend''s family estate and gradually uncovers a terrifying conspiracy. Peele''s Oscar-winning debut is a sharp, slow-burn horror that works on multiple levels as social commentary.',
 'Jordan Peele', 'Daniel Kaluuya, Allison Williams, Bradley Whitford', '1h 44m',
 'https://www.youtube.com/embed/DzfpyUB60YY', 'Peacock, Prime Video', 7.7),

('Hereditary', 'Eerie', 'Horror Drama',
 'After the death of her secretive mother, a woman''s family begins unraveling as dark, terrifying secrets emerge. Ari Aster''s feature debut is a slow-burn nightmare that redefines grief-as-horror.',
 'Ari Aster', 'Toni Collette, Alex Wolff, Milly Shapiro', '2h 7m',
 'https://www.youtube.com/embed/V6wWKNij_1M', 'Prime Video', 7.3),

('The Lighthouse', 'Eerie', 'Psychological Horror',
 'Two lighthouse keepers on a remote island slowly descend into madness, isolation, and obsession. Shot in black-and-white with a square frame, Eggers'' hallucinatory film is a claustrophobic descent into myth and madness.',
 'Robert Eggers', 'Willem Dafoe, Robert Pattinson', '1h 49m',
 'https://www.youtube.com/embed/Hyag7lR8CPA', 'HBO Max', 7.5),

-- ===== THOUGHTFUL =====
('Interstellar', 'Thoughtful', 'Sci-Fi Drama',
 'In a dying future, explorers travel through a wormhole near Saturn in search of a new home for humanity. Blending hard science with emotional depth, Nolan''s masterpiece explores love, time dilation, and humanity''s place in the cosmos.',
 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway, Jessica Chastain', '2h 49m',
 'https://www.youtube.com/embed/zSWdZVtXT7E', 'Prime Video, Paramount+', 8.7),

('The Truman Show', 'Thoughtful', 'Drama Comedy',
 'Truman Burbank discovers his entire life has been a live television show — every person he knows, an actor. His journey to escape is both funny and deeply moving, a prescient commentary on surveillance, media, and identity.',
 'Peter Weir', 'Jim Carrey, Laura Linney, Ed Harris', '1h 43m',
 'https://www.youtube.com/embed/dlnmQbPGuls', 'Prime Video', 8.1),

('Blade Runner 2049', 'Thoughtful', 'Sci-Fi Noir',
 'A new blade runner uncovers a long-buried secret that could upend society. Villeneuve''s stunningly beautiful sequel explores memory, identity, and what it truly means to be human.',
 'Denis Villeneuve', 'Ryan Gosling, Harrison Ford, Ana de Armas', '2h 44m',
 'https://www.youtube.com/embed/gCcx85zbxz4', 'HBO Max', 8.0),

('Eternal Sunshine of the Spotless Mind', 'Thoughtful', 'Sci-Fi Romance',
 'A heartbroken man undergoes a procedure to erase memories of his ex-girlfriend — only to realize he doesn''t want to forget. Kaufman''s non-linear masterpiece is an achingly beautiful meditation on love and loss.',
 'Michel Gondry', 'Jim Carrey, Kate Winslet, Kirsten Dunst', '1h 48m',
 'https://www.youtube.com/embed/07-QBnEkgXU', 'Hulu, Netflix', 8.3),

-- ===== CHILL =====
('The Big Lebowski', 'Chill', 'Comedy Crime',
 'Jeff "The Dude" Lebowski, a laid-back slacker, is mistaken for a millionaire and gets entangled in a bizarre kidnapping plot. The Coen brothers'' cult classic is endlessly quotable, filled with eccentric characters, and achingly cool.',
 'Joel Coen, Ethan Coen', 'Jeff Bridges, John Goodman, Julianne Moore', '1h 57m',
 'https://www.youtube.com/embed/ngV0RBhGZmE', 'Netflix, Peacock', 8.1),

('Chef', 'Chill', 'Drama Comedy',
 'A head chef quits his restaurant job to start a food truck, rediscovering his passion for food and reconnecting with his son along the way. A warm, feel-good film that will make you hungry and happy.',
 'Jon Favreau', 'Jon Favreau, John Leguizamo, Sofía Vergara', '1h 54m',
 'https://www.youtube.com/embed/qK-ZUFX5fnk', 'Netflix, Prime Video', 7.3),

('Julie & Julia', 'Chill', 'Drama Comedy',
 'Two parallel stories: Julia Child''s discovery of cooking in 1950s Paris, and Julie Powell''s 2002 project to cook all 524 of Child''s recipes in one year. A warm, cozy film perfect for a lazy evening.',
 'Nora Ephron', 'Meryl Streep, Amy Adams, Stanley Tucci', '2h 3m',
 'https://www.youtube.com/embed/ozRK7VXQl-k', 'Netflix, Hulu', 6.9),

('About Time', 'Chill', 'Romantic Drama',
 'A young man discovers he can time travel and uses this ability to find love and live a better life. This warm, gentle film by Richard Curtis is ultimately about slowing down to appreciate the ordinary moments of life.',
 'Richard Curtis', 'Domhnall Gleeson, Rachel McAdams, Bill Nighy', '2h 3m',
 'https://www.youtube.com/embed/7OIFdWk83no', 'Netflix, Peacock', 7.8),

-- ===== QUIRKY =====
('The Grand Budapest Hotel', 'Quirky', 'Comedy Drama',
 'The adventures of a legendary concierge and his protégé, embroiled in a battle over a priceless painting and family fortune. Told in Wes Anderson''s unmistakable style — meticulous, witty, and visually stunning.',
 'Wes Anderson', 'Ralph Fiennes, F. Murray Abraham, Tony Revolori', '1h 39m',
 'https://www.youtube.com/embed/1Fg5iWmQjwk', 'Hulu, Disney+', 8.1),

('Scott Pilgrim vs. the World', 'Quirky', 'Action Comedy',
 'A 22-year-old slacker must defeat his new girlfriend''s seven evil exes in order to win her heart. Edgar Wright''s pop-culture explosion is a love letter to video games, comics, and heartbreak all at once.',
 'Edgar Wright', 'Michael Cera, Mary Elizabeth Winstead, Kieran Culkin', '1h 52m',
 'https://www.youtube.com/embed/7wd5KEaOtm4', 'Netflix', 7.5),

('Juno', 'Quirky', 'Comedy Drama',
 'A sharp-tongued teenager navigates an unplanned pregnancy with wit and heart, deciding to give the baby up for adoption. Filled with quirky charm, a fantastic soundtrack, and a breakout performance by Ellen Page.',
 'Jason Reitman', 'Elliot Page, Michael Cera, Jennifer Garner', '1h 36m',
 'https://www.youtube.com/embed/K0SKf0K3bxg', 'Hulu, Disney+', 7.4),

('Little Miss Sunshine', 'Quirky', 'Comedy Drama',
 'A dysfunctional family piles into a rusty VW bus to drive their little daughter to a beauty pageant. Through mishaps and mayhem, they learn to embrace their flaws and love each other unconditionally.',
 'Jonathan Dayton, Valerie Faris', 'Abigail Breslin, Steve Carell, Toni Collette', '1h 41m',
 'https://www.youtube.com/embed/wvwVkllXT80', 'Netflix, Hulu', 7.8);

SET SQL_SAFE_UPDATES = 1;

-- Verify
SELECT mood, COUNT(*) as count FROM movies GROUP BY mood ORDER BY mood;