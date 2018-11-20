-- https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/6914144?start=447

CREATE DATABASE shirts_db;
USE shirts_db;
CREATE TABLE shirts
  (
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(200),
    color VARCHAR(50),
    shirt_size VARCHAR(1),
    last_worn int,
    PRIMARY KEY (shirt_id)
  );

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
       ('t-shirt', 'green', 'S', 200),
       ('polo shirt', 'black', 'M', 10),
       ('tank top', 'blue', 'S', 50),
       ('t-shirt', 'pink', 'S', 0),
       ('polo shirt', 'red', 'M', 5),
       ('tank top', 'white', 'S', 200),
       ('tank top', 'blue', 'M', 15);

INSERT INTO shirts (color, article, shirt_size, last_worn)
VALUES ('Purple', 'polo shirt', 'M', 50);

SELECT article, color from shirts;
SELECT article, color, shirt_size, last_worn FROM shirts
WHERE shirt_size='M';

UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';
UPDATE shirts SET last_worn=0 WHERE last_worn=15;

DELETE from shirts WHERE article='tank top';
SELECT * from shirts;
DROP TABLE shirts;
