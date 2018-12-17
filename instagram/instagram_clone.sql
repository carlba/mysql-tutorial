DROP DATABASE instagram;
CREATE DATABASE instagram;
USE instagram;

CREATE TABLE users
(
  id         INT AUTO_INCREMENT PRIMARY KEY,
  username   VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users (username)
VALUES ('BlueTheCat'),
       ('CharlieBrown'),
       ('CarlBackstrom');

SELECT *
FROM users;

CREATE TABLE photos
(
  id         INT AUTO_INCREMENT PRIMARY KEY,
  image_url  varchar(255) NOT NULL,
  user_id    INT          NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO photos (image_url, user_id)
VALUES ('/asdfaff1', 1),
       ('/asdfaff2', 2),
       ('/asdfaff3', 3);

CREATE TABLE comments
(
  id           INT AUTO_INCREMENT PRIMARY KEY,
  comment_text VARCHAR(1000),
  user_id      INT NOT NULL,
  photo_id     INT NOT NULL,
  created_at   TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (photo_id) REFERENCES photos (id)
);


INSERT INTO comments (comment_text, user_id, photo_id)
VALUES ('Meow!', 1, 2),
       ('Amazing Shot!', 3, 2),
       ('I love this', 2, 1);


SELECT *
from comments;

# An id is not needed since we will not reference a like from anywhere
CREATE TABLE likes
(
  user_id    INT NOT NULL,
  photo_id   INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (photo_id) REFERENCES photos (id),
  PRIMARY KEY (user_id, photo_id)
);

# Can't insert multiple times due to PRIMARY KEY constraint
INSERT INTO likes (user_id, photo_id)
VALUES (1, 1),
       (2, 1),
       (1, 2),
       (1, 3),
       (3, 3)

CREATE TABLE follows
(
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  created_at  TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (follower_id) REFERENCES users (id),
  FOREIGN KEY (followee_id) REFERENCES users (id),
  PRIMARY KEY (follower_id, followee_id)
);

INSERT INTO follows (follower_id, followee_id)
VALUES (1, 2),
       (1, 3),
       (3, 1),
       (2, 3);

# Can't insert multiple times due to PRIMARY KEY constraint
INSERT INTO follows(follower_id, followee_id)
VALUES (1, 3);

CREATE TABLE tags
(
  id         INT AUTO_INCREMENT PRIMARY KEY,
  tag_name   VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE taggins
(
  photo_id INT NOT NULL,
  tag_id   INT NOT NULL,
  FOREIGN KEY (photo_id) REFERENCES photos (id),
  FOREIGN KEY (tag_id) REFERENCES tags (id),
  PRIMARY KEY (photo_id, tag_id)
);

INSERT INTO tags (tag_name)
VALUES ('adorable'),
       ('cute'),
       ('sunrise');

INSERT INTO taggins (photo_id, tag_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (3, 2);

# SELECT photos.image_url, users.username
# FROM photos
# JOIN users
#     ON photos.user_id = users.id
