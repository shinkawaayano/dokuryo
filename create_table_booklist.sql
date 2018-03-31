CREATE TABLE booklist.books (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  book_title VARCHAR(100),
  start_day_month INT,
  start_day_days INT,
  end_day_month INT,
  end_day_days INT,
  memo VARCHAR(200),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);