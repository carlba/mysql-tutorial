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






