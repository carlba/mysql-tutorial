-- Evaluate the following
SELECT 10 != 10; -- False
SELECT 15 > 14 && 99 - 5 <= 94; -- True
SELECT 1 in (5, 3) || 9 BETWEEN 8 AND 10; -- True

-- Select All Books Written Before 1980 (non inclusive)
SELECT title, released_year
FROM books
WHERE released_year < 1980;

-- Select All Books Written By Eggers Or Chabon
SELECT title, author_lname
FROM books
WHERE author_lname in ('Eggers', 'Chabon');

-- Select All Books Written By Lahiri, Published after 2000
SELECT title, author_lname, released_year
FROM books
WHERE author_lname = 'Lahiri'
  AND released_year > 2000;

-- Select All books with page counts between 100 and 200
SELECT title, pages
FROM books
WHERE pages BETWEEN 100 and 200;

-- Select all books where author_lname  starts with a 'C' or an 'S''
SELECT title, author_lname
FROM books
WHERE author_lname LIKE 'C%'
   OR author_lname LIKE 'S%';
-- OR
SELECT title, author_lname
FROM books
WHERE SUBSTR(author_lname, 1, 1) IN ('C', 'S');


-- http://webdev.slides.com/coltsteele/mysql-99-103#/65
SELECT title,
       author_lname,
       CASE
         WHEN title LIKE '%stories%' THEN 'Short Stories'
         WHEN title IN ('Just Kids', 'A Heartbreaking Work of Staggering Genius') THEN 'Memoir'
         ELSE 'Novel'
         END AS 'type'
FROM books;

-- https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/6942066?start=315
SELECT title,
       author_fname,
       author_lname,
       CASE
         WHEN COUNT(*) = 1 THEN CONCAT('1', ' book')
         ELSE CONCAT(COUNT(*), ' books')
         END
FROM books
GROUP BY author_lname, author_fname;
