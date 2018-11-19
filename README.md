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
    name VARCHAR(100), 
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
