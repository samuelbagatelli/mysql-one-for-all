DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE plans(
	plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  plan VARCHAR(13) NOT NULL,
  plan_value DOUBLE NOT NULL
) ENGINE = InnoDB;

CREATE TABLE users(
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  user_age INT NOT NULL,
  sign_date DATE NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
) ENGINE = InnoDB;

CREATE TABLE artists(
	artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  artist VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE albuns(
	album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  album VARCHAR(100) NOT NULL,
  artist_id INT NOT NULL,
  release_date YEAR NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) ENGINE = InnoDB;

CREATE TABLE songs(
	song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  song_name VARCHAR(100) NOT NULL,
  album_id INT NOT NULL,
  duration_time INT NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
  FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) ENGINE = InnoDB;

CREATE TABLE historys(
  song_id INT NOT NULL,
  user_id INT NOT NULL,
  history_date DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY (song_id, user_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE = InnoDB;

CREATE TABLE follow(
  user_id INT NOT NULL,
  artist_id INT,
  CONSTRAINT PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) ENGINE = InnoDB;

INSERT INTO plans (plan, plan_value)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitario', 5.99),
  ('pessoal', 6.99);

INSERT INTO users (username, user_age, sign_date, plan_id)
VALUES
  ('Barbara Liskov', 82, "2019-10-20", 1),
  ('Robert Cecil Martin', 58, "2017-01-06", 1),
  ('Ada Lovelace', 37, "2017-12-30", 2),
  ('Martin Fowler', 46, "2017-01-17", 2),
  ('Sandi Metz', 58, "2018-04-29", 2),
  ('Paulo Freire', 19, "2018-02-14", 3),
  ('Bell Hooks', 26, "2018-01-05", 3),
  ('Christopher Alexander', 85, "2019-06-05", 4),
  ('Judith Butler', 45, "2020-05-13", 4),
  ('Jorge Amado', 58, "2017-02-17", 4);

INSERT INTO artists (artist)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO albuns (album, artist_id, release_date)
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);

INSERT INTO songs (song_name, album_id, duration_time, artist_id)
VALUES
  ('Break My Soul', 1, 279, 1),
  ("Virgo's Groove", 1, 369, 1),
  ('Alien Superstar', 1, 116, 1),
  ("Don\'t Stop Me Now", 2, 203, 2),
  ('Under Pressure', 3, 152, 2),
  ('Como Nossos Pais', 4, 105, 3),
  ('O Medo de Amar é o Medo de Ser Livre', 5, 207, 3),
  ('Samba em Paris', 6, 267, 4),
  ("The Bard\'s Song", 7, 244, 5),
  ('Feeling Good', 8, 100, 6);

INSERT INTO historys (song_id, user_id, history_date)
VALUES
  (8, 1, "2022-02-28 10:45:55"),
  (2, 1, "2020-05-02 05:30:35"),
  (10, 1, "2020-03-06 11:22:33"),
  (10,2, "2022-08-05 08:05:17"),
  (7, 2, "2020-01-02 07:40:33"),
  (10, 3, "2020-11-13 16:55:13"),
  (2, 3, "2020-12-05 18:38:30"),
  (8, 4, "2021-08-15 17:10:10"),
  (8, 5, "2022-01-09 01:44:33"),
  (5, 5, "2020-08-06 15:23:43"),
  (7, 6, "2017-01-24 00:31:17"),
  (1, 6, "2017-10-12 12:35:20"),
  (4, 7, "2011-12-15 22:30:49"),
  (4, 8, "2012-03-17 14:56:41"),
  (9, 9, "2022-02-24 21:14:22"),
  (3, 10, "2015-12-13 08:30:22");

INSERT INTO follow (user_id, artist_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);