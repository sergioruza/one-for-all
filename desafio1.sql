DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
	planos_id INT PRIMARY KEY AUTO_INCREMENT,
    planos VARCHAR(45),
    valor DECIMAL(5, 2)
);
INSERT INTO planos (planos, valor)
VALUES 
	('gratuito', 00.00),
	('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);


CREATE TABLE usuario(
	usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    planos_id INT,
    assinatura DATE,
    FOREIGN KEY (planos_id) REFERENCES planos (planos_id)
);
INSERT INTO usuario (nome, idade, planos_id, assinatura)
VALUES
('Barbara Liskov', 82, 1, '2019-10-20'),
('Robert Cecil Martin', 58, 1, '2017-01-06'),
('Ada Lovelace', 37, 2, '2017-12-30'),
('Martin Fowler', 46, 2, '2017-01-17'),
('Sandi Metz', 58, 2, '2018-04-29'),
('Paulo Freire', 19, 3, '2018-02-14'),
('Bell Hooks', 26, 3, '2018-01-05'),
('Christopher Alexander', 85, 4, '2019-06-05'),
('Judith Butler', 45, 4, '2020-05-13'),
('Jorge Amado', 58, 4, '2017-02-17');


CREATE TABLE artista(
	artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);
INSERT INTO artista (nome)
VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

CREATE TABLE seguindo_artistas(
	usuario_id INT,
    artista_id INT,
    PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
);
INSERT INTO seguindo_artistas (usuario_id, artista_id)
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

CREATE TABLE album(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(45),
    ano_lancamento INT,
    artista_id INT,
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
);
INSERT INTO album (album, ano_lancamento, artista_id)
VALUES
('Renaissance', 2022, 1),
('Jazz', 1978, 2),
('Hot Space', 1982, 2),
('Falso Brilhante', 1998, 3),
('Vento de Maio', 2001, 3),
('QVVJFA?', 2003, 4),
('Somewhere Far Beyond', 2007, 5),
('I Put A Spell On You', 2012, 6);


CREATE TABLE cancoes(
	cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    duracao INT NOT NULL,
    album_id INT,
    artista_id INT,
    FOREIGN KEY (album_id) REFERENCES album (album_id),
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
);
INSERT INTO cancoes (nome, duracao, artista_id, album_id)
VALUES
('BREAK MY SOUL', 279, 1, 1),
('VIRGO’S GROOVE', 369, 1, 1),
('ALIEN SUPERSTAR', 116, 1, 1),
('Don’t Stop Me Now', 203, 2, 2),
('Under Pressure', 152, 2, 2),
('Como Nossos Pais', 105, 3, 3),
('O Medo de Amar é o Medo de Ser Livre', 207, 3, 3),
('Samba em Paris', 267, 4, 4),
('The Bard’s Song', 244, 5, 5),
('Feeling Good', 100, 6, 6);


CREATE TABLE historico(
    usuario_id INT,
    cancoes_id INT,
    data_hist DATETIME,
    PRIMARY KEY (usuario_id, cancoes_id),
    FOREIGN KEY (cancoes_id) REFERENCES cancoes (cancoes_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id)
);
INSERT INTO historico (usuario_id, cancoes_id, data_hist) 
VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2,  '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');



-- ajuda de Arthur Debiasi