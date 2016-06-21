CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE questions_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Colin', 'Fruit'), ('Rodrigo', 'Cardenas');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ("my_blog", "Here I talk", 1),("q2", "Where am i?", 2),("q3", "What?", 2);

INSERT INTO
  questions_follows(question_id, user_id)
VALUES
  (1, 1), (2, 2), (3, 2), (1, 2);

INSERT INTO
  replies(question_id, user_id, body)
VALUES
  (1, 2, "This post lacks originality and substance!");

INSERT INTO
  replies(question_id, parent_id, user_id, body)
VALUES
  (1, 1, 1, "You just don't get me.");

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1, 1);
