CREATE TABLE blogs(
  id SERIAL PRIMARY KEY,
  author text,
  url text NOT NULL,
  title text NOT NULL,
  likes integer default 0
);

INSERT INTO blogs (author, url, title) VALUES (
  'Jens Gustedt',
  'https://www.manning.com/books/modern-c',
  'Modern C'
);

INSERT INTO blogs (author, url, title) VALUES (
  'Paul Deitel',
  'https://deitel.com/java-how-to-program-11-e-early-objects-version/',
  'Java How to Program, 11/e, Early Objects'
);

