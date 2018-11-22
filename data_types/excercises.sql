-- http://webdev.slides.com/coltsteele/mysql-99-102?token=gecdDaiA#/31
CREATE TABLE inventory
(
  item_name VARCHAR(100),
  price     DECIMAL(6,2),
  quantity  INTEGER
);

-- What's the difference between DATETIME and TIMESTAMP?

-- They both store a specific point in time but the range allowance for DATETIME is higher. The
-- TIMESTAMP type allows creation time and changed time to be used.

-- Print Out The Current Time
SELECT CURTIME();

-- Print Out The Current Date (but not time)
SELECT CURDATE();

-- Print Out The Current Day Of The Week (As a number)
SELECT DAYOFWEEK();

-- Print Out The Current Day Of The Week (The Day Name)
SELECT DAYNAME();

-- Print out the current day and time using this format: mm/dd/yyyy
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');

-- Print out the current day and time using this format: January 2nd at 3:15
SELECT DATE_FORMAT(NOW(), '%M %D at %H:%i');

-- Create a tweets table that stores:
--
-- The Tweet content
-- A Username
-- Time it was created

CREATE TABLE tweets
(
  content    VARCHAR(280),
  username   VARCHAR(200),
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO tweets (content, username)
VALUES ('Donald Trump Sucks!', 'hippininja');

# Output
# +---------------------+------------+---------------------+
# | content             | username   | created_at          |
# +---------------------+------------+---------------------+
# | Donald Trump Sucks! | hippininja | 2018-11-22 17:38:39 |
# +---------------------+------------+---------------------+
