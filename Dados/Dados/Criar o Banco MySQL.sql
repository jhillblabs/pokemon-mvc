CREATE DATABASE IF NOT EXISTS Pokedex;
USE Pokedex;

CREATE TABLE IF NOT EXISTS Tipo (
	Id	  INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome  VARCHAR(30) NOT NULL UNIQUE,
    Cor   VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS Genero (
	Id	   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome   VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS Regiao (
	Id	  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome  VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS Pokemon (
	Numero 		    INT UNSIGNED NOT NULL,
    RegiaoId        INT UNSIGNED NOT NULL,
    GeneroId        INT UNSIGNED NOT NULL,
    Nome 		    VARCHAR(30) NOT NULL UNIQUE,
    Descricao       VARCHAR(1000),
    Altura 		    DOUBLE(5,2) NOT NULL DEFAULT 0, -- 999,99
    Peso	        DOUBLE(7,3) NOT NULL DEFAULT 0, -- 9999,999
    Imagem 		    VARCHAR(200),
    Animacao	    VARCHAR(400),
    PRIMARY KEY (Numero)
);
 
ALTER TABLE Pokemon ADD CONSTRAINT FK_Pokemon_Regiao
  FOREIGN KEY (RegiaoId) REFERENCES Regiao(Id);
  
ALTER TABLE Pokemon ADD CONSTRAINT FK_Pokemon_Genero
  FOREIGN KEY (GeneroId) REFERENCES Genero(Id);


CREATE TABLE IF NOT EXISTS PokemonTipo (
	PokemonNumero	INT UNSIGNED NOT NULL,
    TipoId			INT UNSIGNED NOT NULL,
    PRIMARY KEY(PokemonNumero, TipoId)
);

ALTER TABLE PokemonTipo ADD CONSTRAINT FK_PokemonTipo_Pokemon
  FOREIGN KEY(PokemonNumero) REFERENCES Pokemon(Numero);

ALTER TABLE PokemonTipo ADD CONSTRAINT FK_PokemonTipo_Tipo
  FOREIGN KEY(TipoId) REFERENCES Tipo(Id);

