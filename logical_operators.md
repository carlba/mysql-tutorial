# Logical Operators


## Not Equal

Get all titles released in the year 2017 
```sql
SELECT title, released_year FROM books WHERE released_year = 2017;
```

Get all titles released any other year than 2017 
```sql
SELECT title, released_year FROM books WHERE released_year != 2017;
```

## Not Like

Get all titles starting with 'W'
```sql
SELECT title FROM books WHERE title LIKE 'W%';
```

Get all titles not starting with 'W'
```sql
SELECT title FROM books WHERE title NOT LIKE 'W%';
```

## Greater Then 


Get all titles with `released_year` released after 2000 
```sql
SELECT title, released_year FROM books WHERE released_year > 2000 ORDER BY released_year;
```

Get all titles with `released_year` released in 2000 or later
```sql
SELECT title, released_year FROM books WHERE released_year >= 2000 ORDER BY released_year;
```

## Boolean Algebra in MySQL

```sql
SELECT 99>1;
```

Results in:
```
+------+
| 99>1 |
+------+
|    1 |
+------+
```

Samples:
```sql
SELECT 100 > 5;
-- true
SELECT -15 > 15;
-- false
SELECT 9 > -10;
-- true
SELECT 1 > 1;
-- false
SELECT 'a' > 'b';
-- false
SELECT 'A' > 'a';
-- false
SELECT 'A' >=  'a';
-- true
```

## Less Then 

Samples:
```sql
SELECT 3 < -10;
-- false
 
SELECT -10 < -9;
-- true
 
SELECT 42 <= 42;
-- true
 
SELECT 'h' < 'p';
-- true
 
SELECT 'Q' <= 'q';
-- true
```

## Logical AND or && 

Get all books from the table `books` authored by 'Eggers' and released after 2010 
```sql
SELECT * FROM books
WHERE author_lname='Eggers'
AND released_year > 2010;
```
This same query can also be written as:
```sql
SELECT * FROM books
WHERE author_lname='Eggers'
&& released_year > 2010;
```

## Logical OR or ||
Get all books from the table `books` authored by 'Eggers' or released after 2010
```sql
SELECT * FROM books
WHERE author_lname='Eggers'
OR released_year > 2010;
```

## BETWEEN

Get `title` and `released_year` from table `books` where released year is between 2004 and 2015
```sql
SELECT title, released_year FROM books 
WHERE released_year >= 2004 && released_year <= 2015
ORDER BY released_year;
```

Get `title` and `released_year` from table `books` where released year is between 2004 and 2015
```sql
SELECT title, released_year FROM books 
WHERE released_year >= 2004 && released_year <= 2015
ORDER BY released_year;
```

Same as the above but using `BETWEEN`
```sql
SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2015
ORDER BY released_year;
```

Get `title` and `released_year` from table `books` where released year is not between 2004 and 2015
```sql
SELECT title, released_year FROM books 
WHERE released_year NOT BETWEEN 2004 AND 2015
ORDER BY released_year;
```

The MySQL Reference Manual recommends casting strings to datetime when doing date comparision:

```sql
SELECT name, birthdt FROM people
WHERE 
      birthdt BETWEEN CAST('1980-01-01' AS DATETIME) 
      AND CAST('2000-01-01' AS DATETIME);
```

## IN

Select all books written by 'Carver' or 'Lahiri' or 'Smith'
```sql
SELECT title, author_lname FROM books
WHERE author_lname='Carver' OR
      author_lname='Lahiri' OR
      author_lname='Smith';
```

Shorter version of above query:
```sql
SELECT title, author_lname FROM books
WHERE author_lname in ('Carver', 'Lahiri', 'Smith')
```

There is also the `NOT IN` that does the opposite.

Use modulo operator to get books from odd years:
```sql
SELECT title, released_year FROM books 
WHERE released_year >= 2000 AND released_year % 2 != 0
ORDER BY released_year;
```

Use modulo operator to get books from even years:
```sql
SELECT title, released_year FROM books 
WHERE released_year >= 2000 AND released_year % 2 = 0
ORDER BY released_year;
```

## CASE

Add a Column Genre that is equal to 'Modern Lit' if `released_year` is is equal to or after 2000 
else it should be equal to '20th Century Lit'
```sql
SELECT title, released_year, 
       CASE WHEN released_year >= 2000 
         THEN 'Modern Lit' 
         ELSE '20th Century Lit' 
       END AS GENRE 
FROM books;
```

Scoring system:
```sql
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
```
