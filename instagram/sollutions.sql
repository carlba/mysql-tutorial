-- We want to reward our users who have been around the longest
SELECT *
FROM users
ORDER BY created_at ASC
LIMIT 5;

-- What day of the week do most users register on?
SELECT DAYNAME(created_at) AS day_of_week,
       COUNT(*)            AS created_per_day
FROM users
GROUP BY day_of_week
ORDER BY created_per_day DESC
LIMIT 2;

-- We want to target our inactive users with an email campaign.
-- Find the users who have never posted a photo
SELECT users.username
FROM users
       LEFT JOIN photos
                 ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- We're running a new contest to see who can get the most likes on a single photo. WHO WON??!!
SELECT users.username, photos.image_url, COUNT(*) AS total
FROM photos
       JOIN likes ON photos.id = likes.photo_id
       JOIN users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC;


-- Our Investors want to know...
-- How many times does the average user post?
-- total number of photos / total number of users
SELECT ((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users)) as average;

-- A brand wants to know which hashtags to use in a post
-- What are the top 5 most commonly used hashtags?

SELECT tags.tag_name, COUNT(*) AS total
FROM photo_tags
       JOIN tags ON photo_tags.tag_id = tags.id
       JOIN photos ON photo_tags.photo_id = photos.id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- We have a small problem with bots on our site...
-- Find users who have liked every single photo on the site

SELECT users.username, COUNT(*) as number_of_likes
FROM users
       JOIN likes
            ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING number_of_likes = (SELECT COUNT(*) FROM photos);






