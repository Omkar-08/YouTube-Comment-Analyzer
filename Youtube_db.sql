# Create databased to store all comments
CREATE DATABASE youtube_data;
USE youtube_data;

CREATE TABLE youtube_comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    genre VARCHAR(255) NOT NULL,
    keyword VARCHAR(255) NOT NULL,
    comment TEXT NOT NULL,
    likes INT NOT NULL
);

ALTER TABLE youtube_comments 
ADD COLUMN video_id VARCHAR(255) NOT NULL AFTER id,
ADD COLUMN category_id INT NOT NULL AFTER video_id;

TRUNCATE TABLE youtube_comments;

# Retrieve comments from the database
SELECT id, genre, category_id, keyword, video_id, comment
FROM youtube_comments
GROUP BY category_id, id, genre, keyword, video_id;

# Checking number of comments per video
SELECT video_id, COUNT(*) AS comment_count
FROM youtube_comments
GROUP BY video_id;

# Counting total number of comments
SELECT COUNT(*) AS total_comments
FROM youtube_comments;

# Retrieve comments in chunks
SELECT * FROM (
    SELECT * FROM youtube_comments
    ORDER BY id
    LIMIT 20000 OFFSET 0 
) AS chunk1
UNION ALL
SELECT * FROM (
    SELECT * FROM youtube_comments
    ORDER BY id
    LIMIT 20000 OFFSET 20000
) AS chunk2;








