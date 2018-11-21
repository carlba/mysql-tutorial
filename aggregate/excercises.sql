-- https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/6915134?start=268
-- http://webdev.slides.com/coltsteele/mysql-99-101?token=m9SUlUmt#/128

-- Print the number of books in the database
SELECT COUNT(*) FROM books;

-- Print out how many books were released in each year
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

-- Print out the total number of books in stock
SELECT SUM(stock_quantity) from books;

-- Find the average released_year for each author
SELECT author_fname, author_lname, AVG(released_year)
FROM books
GROUP BY author_lname, author_fname;

-- Find the full name of the author who wrote the longest book
SELECT CONCAT_WS(' ',author_fname, author_lname) as 'Long Writer', pages
FROM books
ORDER BY pages DESC LIMIT 1;

-- http://webdev.slides.com/coltsteele/mysql-99-101?token=m9SUlUmt#/134
SELECT released_year as 'year', COUNT(*) as '# books', AVG(pages) as 'avg pages'
FROM books
GROUP BY released_year;
