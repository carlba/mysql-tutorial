# Datatypes

## Storing text
https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/6942086?start=0
* [MySQL Reference Manual - CHAR and VARCHAR](https://dev.mysql.com/doc/refman/8.0/en/char.html)

### VARCHAR


### CHAR
Has a fixed length

```
The length of a CHAR column is fixed to the 
length that you declare when you create the table. 
The length can be any value from 0 to 255. 
When CHAR values are stored, they are right-padded 
with spaces to the specified length. When CHAR 
values are retrieved, trailing spaces are removed 
unless the PAD_CHAR_TO_FULL_LENGTH SQL mode is enabled.
```

* If you try to add a value that is less then the specified MySQL will pad it with spaces.
* Use it for fixed length columns.

## Storing numbers

### DECIMAL

```
DECIMAL(<numbers before decimal point>,<numbers after decimal point>)
```

```sql
CREATE TABLE items(price DECIMAL(5,2));
INSERT INTO items(price) VALUES(7);
INSERT INTO items(price) VALUES(7987654);
INSERT INTO items(price) VALUES(34.88);
INSERT INTO items(price) VALUES(298.9999);
INSERT INTO items(price) VALUES(1.9999);
SELECT * FROM items;
```

Results in:
```
+--------+
| price  |
+--------+
|   7.00 |
| 999.99 |
|  34.88 |
| 299.00 |
|   2.00 |
+--------+
```

### FLOAT and DOUBLE
* [The Ultimate MySQL bootcamp - FLOAT and Double](https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7019852?start=0)

Decimal values that are only precise to a specific point. 

* FLOAT is precise to 7 numbers
* DOUBLE is precise to 15 numbers

Values are rounded of after these precision points.


```sql
CREATE TABLE thingies (price FLOAT);
INSERT INTO thingies(price) VALUES (88.45);
INSERT INTO thingies(price) VALUES (8877.45);
INSERT INTO thingies(price) VALUES (8877665544.45);
 SELECT * FROM thingies;
```

Results in:

```
+------------+
| price      |
+------------+
|      88.45 |
|    8877.45 |
| 8877670000 |
+------------+
```

## Storing dates

[MySQL Reference Manual - Date and Time Functions](https://dev.mysql.com/doc/refman/en/date-and-time-functions.html)

### DATE

Values with a date without time in the format `YYYY-MM-DD`

### TIME

Values with a time without a date in the format `HH:MM:SS`

### DATETIME

Values with a date and a time in the format `YYYY-MM-DD HH:MM:SS`

```sql
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
 
SELECT * FROM people;
```

Results in:
```
+-------+------------+-----------+---------------------+
| name  | birthdate  | birthtime | birthdt             |
+-------+------------+-----------+---------------------+
| Padma | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
| Larry | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
+-------+------------+-----------+---------------------+
```

### Get Current Date and Time

```sql
-- Get current date
SELECT CURDATE();
-- Get current time
SELECT CURTIME();
-- Get current datetime
SELECT NOW();
```

### Insert different forms of current time information into table
```sql
INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ('Microwave', CURDATE(), CURTIME(), NOW());
```

### Extracting various date related info

* These works on both `DATE` and `DATETIME` columns.

```sql
SELECT 
       name, DAY(birthdate), 
       DAYNAME(birthdate), 
       DAYOFWEEK(birthdate), 
       DAYOFYEAR(birthdate), 
       MONTH(birthdate), 
       MONTHNAME(birthdate) 
FROM people;
```

Results in:
```
+---------+----------------+--------------------+----------------------+----------------------+------------------+----------------------+
| name    | DAY(birthdate) | DAYNAME(birthdate) | DAYOFWEEK(birthdate) | DAYOFYEAR(birthdate) | MONTH(birthdate) | MONTHNAME(birthdate) |
+---------+----------------+--------------------+----------------------+----------------------+------------------+----------------------+
| Padma   |             11 | Friday             |                    6 |                  315 |               11 | November             |
| Larry   |             25 | Saturday           |                    7 |                  359 |               12 | December             |
| Toaster |             22 | Thursday           |                    5 |                  326 |               11 | November             |
+---------+----------------+--------------------+----------------------+----------------------+------------------+----------------------+
```

### DATE_FORMAT
[MySQL Reference Manual - DATE_FORMAT](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format)

```sql
-- Show the week day in a sentence
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;

-- Stupid american date format 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;

-- Stupid american date format with time
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;
```

### DATE_DIFF

Get amount of days from a date in column to now
```sql
SELECT name, birthdate , DATEDIFF(NOW(), birthdate) FROM people;
```


### DATE_ADD
https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7019868?start=0

Add 1 month to the value of a `DATETIME` or `DATE` column
```sql
-- Long version
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
-- Short version
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
```

Samples:
```sql
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people; 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people; 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;
```

### TIMESTAMP

Like `DATETIME` but with a limited range, 
1970-01-01 00:00:01.000000' to '2038-01-19 03:14:07.999999'.

* Primarily useful for created_at fields where they can be defaulted to `NOW()`,
* A `changed_at` column can also be created by adding the `ON UPDATE CURRENT_TIMESTAMP` to the
  column declaration.


Samples:
```sql
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO comments (content) VALUES('lol what a funny article');
INSERT INTO comments (content) VALUES('I found this offensive');
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
 
SELECT * FROM comments ORDER BY created_at DESC;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
 
INSERT INTO comments2 (content) VALUES('dasdasdasd');
INSERT INTO comments2 (content) VALUES('lololololo');
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
 
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments2;
SELECT * FROM comments2 ORDER BY changed_at;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);

```


