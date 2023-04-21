CREATE DATABASE panaderia;
USE panaderia;

CREATE TABLE Local (
  'codigo' int NOT NULL,
  'tiene_cafeteria' boolean NOT NULL,
  'codigo_postal' int NOT NULL,
  'calle' varchar(30) NOT NULL,
  'numero' int NOT NULL,
  PRIMARY KEY ('codigo')
);

CREATE TABLE Poblacion (
  'codigo' int NOT NULL,
  'nombre' varchar(20) NOT NULL,
  PRIMARY KEY('codigo')
);

CREATE TABLE Provincia (
  'codigo' int NOT NULL,
  'nombre' varchar(30) NOT NULL,
  PRIMARY KEY('codigo')
);

CREATE TABLE Producto (
  'codigo' int NOT NULL,
  'nombre' varchar(30) NOT NULL,
  'descripcion' varchar(100) NOT NULL,
  'precio_base' int NOT NULL,
  PRIMARY KEY('codigo')
);
