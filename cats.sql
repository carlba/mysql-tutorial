USE cat_app;
DROP TABLE cats;
CREATE TABLE cats
  (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
  );
