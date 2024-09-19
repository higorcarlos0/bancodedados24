CREATE DATABASE dbcinema;
USE dbcinema;

CREATE TABLE cinema (
	cod_cinema INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_cinema VARCHAR(100) NOT NULL UNIQUE 
	);
	
CREATE TABLE filme (
	cod_filme INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_filme VARCHAR(100) NOT NULL UNIQUE,
	duração_filme TINYINT  NOT NULL,
	ano_lancamento DATE NOT NULL,
	classificacao_filme VARCHAR(50) NOT NULL
	);
	
CREATE TABLE genero (
	cod_genero INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_genero VARCHAR (100) NOT NULL UNIQUE 
	);
	
CREATE TABLE ator (
	cod_ator INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_ator VARCHAR (50) NOT NULL UNIQUE 
	);
	
CREATE TABLE diretor (
	cod_diretor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_diretor VARCHAR(100) NOT NULL UNIQUE
	);
	
CREATE TABLE sala (
	cod_sala INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	numero_sala INT NOT null
	);
	
CREATE TABLE sessao (
	cod_sessao INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
	data_sessao DATE NOT NULL ,
	horario_sessao TIME NOT NULL ,
	tipo VARCHAR(50)
	);
	
CREATE TABLE cinemafilme (
	cod_cinema INT NOT NULL,
	cod_filme INT NOT NULL,
	PRIMARY KEY (cod_cinema, cod_filme),
	FOREIGN KEY (cod_cinema) REFERENCES cinema (cod_cinema),
	FOREIGN KEY (cod_filme) REFERENCES filme (cod_filme)
	);
	

DESCRIBE sala;