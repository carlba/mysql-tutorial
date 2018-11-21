-- https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7019826?start=0

-- Find titles containing 'stories'
SELECT title FROM books WHERE title LIKE '%stories%';

-- Find the book with the highest page count
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- Print a summary containing the title and year, for the 3 most recent books
SELECT CONCAT(title,' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

-- Find all books with an author_lname that contains a space(" ")
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %' ;

-- Find The 3 Books With The Lowest Stock
-- Select title, year, and stock
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

-- Print title and author_lname, sorted first by author_lname and then by title
SELECT title, author_lname FROM books ORDER BY author_lname, title;

-- Print title and author_lname, sorted first by author_lname and then by title
-- Sorted Alphabetically By Last Name
SELECT UPPER(CONCAT_WS(' ', 'my favorite author is', author_fname, author_lname, '!')) AS 'yell'
FROM books ORDER BY author_lname;
