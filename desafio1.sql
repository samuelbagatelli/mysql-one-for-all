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
  FOREIGN KEY (album_id) REFERENCES albuns(album_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
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
  ('Feeling Good', 8, 1000, 6);