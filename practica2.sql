CREATE DATABASE panaderia;
USE panaderia;

CREATE TABLE Local (
  'codigo' int NOT NULL,
  'tiene_cafeteria' boolean NOT NULL,
  'codigo_postal' int NOT NULL,
  'calle' char(30) NOT NULL,
  'numero' int NOT NULL,
  PRIMARY KEY ('codigo');
);
