CREATE DATABASE panaderia;
USE panaderia;
CREATE TABLE Local (
  `codigo` int NOT NULL,
  `tiene_cafeteria` boolean NOT NULL,
  `codigo_postal` int NOT NULL,
  `calle` varchar(30) NOT NULL,
  `numero` int NOT NULL,
  PRIMARY KEY (`codigo`)
);
CREATE TABLE Poblacion (
  `codigo` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY(`codigo`)
);
CREATE TABLE Provincia (
  `codigo` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY(`codigo`)
);
CREATE TABLE Producto (
  `codigo` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio_base` int NOT NULL,
  PRIMARY KEY(`codigo`)
);
CREATE TABLE Categoria (
  `codigo` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tipo_producto` varchar(20) NOT NULL,
  PRIMARY KEY(`codigo`)
);
CREATE TABLE Modo_Cocinado (
  `codigo` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY(`codigo`)
);
CREATE TABLE Ingrediente (
  `codigo` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY(`codigo`)
);
CREATE TABLE Empleado (
  `codigo` int NOT NULL,
  `telefono_contact` int NOT NULL,
  `nss` int NOT NULL,
  `dni` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellido` varchar(20) NOT NULL,
  PRIMARY KEY(`codigo`)
);
CREATE TABLE Tarea (
  `codigo` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `coste` int NOT NULL,
  `prerrequisitos` varchar(1000) NOT NULL,
  PRIMARY KEY(`codigo`)
);
CREATE TABLE Estar (
`codigo` int NOT NULL,
`codigo` int NOT NULL,
PRIMARY KEY (`codigo`,`codigo`),
FOREIGN KEY (`codigo`) REFERENCES Poblacion (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`codigo`) REFERENCES Provincia (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Estar (
`codigo` int NOT NULL,
`codigo` int NOT NULL,
PRIMARY KEY (`codigo`,`codigo`),
FOREIGN KEY (`codigo`) REFERENCES Poblacion (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`codigo`) REFERENCES Local (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Vender (
`codigo` int NOT NULL,
`codigo` int NOT NULL,
PRIMARY KEY (`codigo`,`codigo`),
FOREIGN KEY (`codigo`) REFERENCES Producto (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`codigo`) REFERENCES Local (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Trabajar (
`fecha_inicio` DATE NOT NULL,
`fecha_fin` DATE NOT NULL,
`codigo` int NOT NULL,
`codigo` int NOT NULL,
PRIMARY KEY (`codigo`,`codigo`,`fecha_inicio`),
FOREIGN KEY (`codigo`) REFERENCES Empleado (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`codigo`) REFERENCES Local (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Realizar_turno (
`fecha_inicio` DATE NOT NULL,
`horas` TIME NOT NULL,
`horas_inicio`TIME NOT NULL,
`codigo` int NOT NULL,
`codigo` int NOT NULL,
PRIMARY KEY (`codigo`,`codigo`,`fecha_inicio`),
FOREIGN KEY (`codigo`) REFERENCES Empleado (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`codigo`) REFERENCES Local (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`codigo`) REFERENCES Tarea (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Supervisa (
`codigo` int NOT NULL,
`codigo` int NOT NULL,
PRIMARY KEY (`codigo`,`codigo`),
FOREIGN KEY (`codigo`) REFERENCES Empleado (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`codigo`) REFERENCES Empleado (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Pertenecer (
`codigo` int NOT NULL,
`codigo` int NOT NULL,
PRIMARY KEY (`codigo`,`codigo`),
FOREIGN KEY (`codigo`) REFERENCES Producto (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`codigo`) REFERENCES Categoria (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Contener (
`cantidad` int NOT NULL,
`codigo` int NOT NULL,
`codigo` int NOT NULL,
`codigo` int NOT NULL,
PRIMARY KEY (`codigo`,`codigo`,`codigo`),
FOREIGN KEY (`codigo`) REFERENCES Ingrediente (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`codigo`) REFERENCES Producto (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`codigo`) REFERENCES Modo_Cocinado (`codigo`) 
	ON DELETE CASCADE ON UPDATE CASCADE
);