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

CREATE TABLE Categoria (
  'codigo' int NOT NULL,
  'descripcion' varchar(100) NOT NULL,
  'tipo_producto' varchar(20) NOT NULL,
  PRIMARY KEY('codigo')
);

CREATE TABLE Modo_Cocinado (
  'codigo' int NOT NULL,
  'descripcion' varchar(100) NOT NULL,
  PRIMARY KEY('codigo')
);

CREATE TABLE Ingrediente (
  'codigo' int NOT NULL,
  'descripcion' varchar(100) NOT NULL,
  'nombre' varchar(30) NOT NULL,
  PRIMARY KEY('codigo')
);

CREATE TABLE Empleado (
  'codigo' int NOT NULL,
  'telefono_contact' int NOT NULL,
  'nss' int NOT NULL,
  'dni' int NOT NULL,
  'nombre' varchar(20) NOT NULL,
  'primer_apellido' varchar(20) NOT NULL,
  'segundo_apellido' varchar(20) NOT NULL,
  PRIMARY KEY('codigo')
);

CREATE TABLE Tarea (
  'codigo' int NOT NULL,
  'descripcion' varchar(100) NOT NULL,
  'coste' int NOT NULL,
  'prerrequisitos' varchar(1000) NOT NULL,
  PRIMARY KEY('codigo')
);
