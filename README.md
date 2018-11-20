# mysql-tutorial
https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert

## Installation

```bash
docker-compose up -d
```

## Databases

### Listing, Creating and Updating Databases

```sql
SHOW DATABASES;
```

```sql
CREATE DATABASE hello_world_db;
```

```sql
DROP DATABASE hello_world_db;
```

### Select Activate Database

```sql
USE hello_world_db
```

### Show Activate Database
```sql
SELECT database();
```

### Disable Strict Mode
This amongst other things truncates data that are two long for a VARCHAR field with a warning 
instead of giving an error. It requires the user to login again.

```sql
SET @@global.sql_mode=''
``` 

enable it again, like so;
```sql
SET @@sql_mode='STRICT_TRANS_TABLES';
``` 

## Tables
A database is a a collection of tables this is true for relational databases. 

### Data types
```sql
VARCHAR(<maximum characters>)
```

### Creating Databases
```sql
CREATE TABLE cats 
( 
    name VARCHAR(50), 
    age INT 
);
```

### Listing Table Properties

```sql
DESCRIBE cats;
```

```sql
SHOW COLUMNS FROM cats;
```

### Delete Tables
```sql
DROP TABLE cats;
```

### Inserting Data into Table
```sql
INSERT INTO cats(name, age)
VALUES('Blue', 1);
```

and verify it, like so:

```sql
SELECT * from cats;
```

### Bulk Insertion
https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7019440?start=0
```sql
INSERT INTO cats(name, age)
VALUES ('Peanut', 2),
       ('Butter', 4),
       ('Jelly', 7);
```

### Warnings
If a warning is shown when a command is executed you can show it, like so:

```sql
SHOW WARNINGS;
```

Examples of warnings are inserting strings that are above the maximum limit for a VARCHAR

### NULL and NOT NULL
https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7019712?start=0

If not specified otherwise a column in a table is allays nullable meaning that the column value
doesn't have to be specified on insertion. To override this behaviour add NOT NULL to the column
declaration in the `CREATE TABLE` statement.

```sql
CREATE TABLE cats 
( 
    name VARCHAR(50) NOT NULL, 
    age INT NOT NULL 
);
```

This will result in a warning about the column not having a default value and MySQL will actually
pick one anyway. The default for an INT is 0.

### Settings Default Values
https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7019744?start=0

```sql
CREATE TABLE cats3( name VARCHAR(100) DEFAULT 'unnamed', age INT DEFAULT 99);
INSERT INTO cats3(age) VALUES(13);
```

This results in a table like:

```
+---------+-----+
| name    | age |
+---------+-----+
| unnamed |  13 |
+---------+-----+
```

You still might want to specify `NOT NULL` to prevent the operator to explicitly provide a `NULL`
value for a column, like so:

```sql
CREATE TABLE cats4( name VARCHAR(100) NOT NULL DEFAULT 'unnamed', age INT NOT NULL DEFAULT 99);
INSERT INTO cats4(age) VALUES(13);
```

Leading to this:
```
ERROR: 1048 (23000): Column 'age' cannot be null
```

### A Primer in Primary keys
https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7019750?start=0
A unique identifier for a row and thereby a unique entity of a collection.

```sql
CREATE TABLE unique_cats( 
  cat_id INT NOT NULL, 
  name VARCHAR(100), 
  age INT, 
  PRIMARY KEY (cat_id)
);
```

Results in this:
```
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| cat_id | int(11)      | NO   | PRI | NULL    |       |
| name   | varchar(100) | YES  |     | NULL    |       |
| age    | int(11)      | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
```

A Primary Key must be Unique so the this will lead to an error:

```sql
INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Fred', 23);
INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'James', 3);
```
```
ERROR: 1062 (23000): Duplicate entry '1' for key 'PRIMARY'
```
It is common to use the username as the Primary Key


It is redundant to have to specify the id of the row manually for each insertion. The 
`AUTO_INCREMENT` column property solves this, like so:

```sql
CREATE TABLE unique_cats2( 
  cat_id INT NOT NULL AUTO_INCREMENT, 
  name VARCHAR(100), 
  age INT, 
  PRIMARY KEY (cat_id)
);
```

It is now possible to insert multiple entities, like so:
```sql
INSERT INTO unique_cats2 (name, age) VALUES('Skippy', 4) ;
INSERT INTO unique_cats2 (name, age) VALUES('Jiff', 3) ;
INSERT INTO unique_cats2 (name, age) VALUES('Jiff', 3) ;
```

And each of the inserts will be treated as a separate entity.


## CRUD

### Sample data
https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7019756?start=0

```sql
-- Let's drop the existing cats table:
DROP TABLE cats;
-- Recreate a new cats table
CREATE TABLE cats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  ); 

-- Show the created cats table
DESCRIBE cats;

-- Insert data
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
```

## C(R)UD
https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7019758?start=0

```sql
SELECT * FROM cats;
```
The star means retrieve all columns from table cats.

## Select specific column(s) from table

```sql
SELECT name, age FROM cats;
```
