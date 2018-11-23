# https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7031170?start=0

CREATE DATABASE student_registry;
USE student_registry;
-- Write this schema http://webdev.slides.com/coltsteele/mysql-99-104#/29
CREATE TABLE students
(
  id         INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100)
);

CREATE TABLE papers
(
  id         INT AUTO_INCREMENT PRIMARY KEY,
  title      VARCHAR(200),
  grade      INT,
  student_id INT,
  FOREIGN KEY (student_id)
    REFERENCES students (id)
    ON DELETE CASCADE
);

-- Insert Data
INSERT INTO students (first_name)
VALUES
  ('Caleb'),
  ('Samantha'),
  ('Raj'),
  ('Carlos'),
  ('Lisa');

INSERT INTO papers (student_id, title, grade)
VALUES
  (1, 'My First Book Report', 60),
  (1, 'My Second Book Report', 75),
  (2, 'Russian Lit Through The Ages', 94),
  (2, 'De Montaigne and The Art of The Essay', 98),
  (4, 'Borges and Magical Realism', 89);

-- Print This http://webdev.slides.com/coltsteele/mysql-99-104#/31
SELECT students.first_name, papers.title, papers.grade
FROM students
       JOIN papers ON students.id = papers.student_id
ORDER BY papers.grade DESC;

-- Print This http://webdev.slides.com/coltsteele/mysql-99-104#/32
SELECT students.first_name, papers.title, papers.grade
FROM studentss
       LEFT JOIN papers ON students.id = papers.student_id;

-- Print This http://webdev.slides.com/coltsteele/mysql-99-104#/33
SELECT students.first_name, IFNULL(papers.title, 'MISSING'), IFNULL(papers.grade, 0)
FROM students
       LEFT JOIN papers ON students.id = papers.student_id;

-- Print This http://webdev.slides.com/coltsteele/mysql-99-104#/34
-- Note that Size comparision with `NULL` equals `NULL` no matter the requirement.
-- Thus the extra `CASE WHEN`
SELECT students.first_name,
       IFNULL(AVG(papers.grade), 0) AS 'average',
       CASE
         WHEN AVG(papers.grade) IS NULL THEN 'FAILING'
         WHEN AVG(papers.grade) >= 75 THEN 'PASSING'
         ELSE 'FAILING'
         END                        AS 'passing_status'
FROM students
       LEFT JOIN papers ON students.id = papers.student_id
GROUP BY students.id;
