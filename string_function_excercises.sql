-- https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7019812?start=0

SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

SELECT REPLACE(title, ' ', '->') as 'title'
from books;

SELECT author_lname as 'forwards', REVERSE(author_lname) as backwards
from books;

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) as 'Full Name'
from books;

SELECT CONCAT(title, ' was released in ',)

SELECT CONCAT(title, ' was released in ', released_year) as 'blurb'
from books;

SELECT title, CHAR_LENGTH(title) as 'character count'
from books;

SELECT CONCAT(SUBSTR(title, 1, 10), '...')     as 'Short Title',
       CONCAT(author_lname, ',', author_fname) as 'Author',
       CONCAT(stock_quantity, ' in stock')     as 'Quantity'
from books;
