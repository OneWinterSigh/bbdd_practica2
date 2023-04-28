CREATE DATABASE panaderia;
USE panaderia;
CREATE TABLE Local (
  `codigo` int NOT NULL,
  `tiene_cafeteria` boolean NOT NULL,
  `codigo_postal` int NOT NULL,
  `calle` varchar(30) NOT NULL,
  `numero` int NOT NULL,
  `codigo_poblacion` int NOT NULL,
  PRIMARY KEY (`codigo`),
  FOREIGN KEY('codigo_poblacion') REFERENCES Poblacion('codigo') ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Poblacion (
  `codigo` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo_provincia` int NOT NULL,
  PRIMARY KEY(`codigo`),
  FOREIGN KEY(`codigo_provincia`) REFERENCES Provincia(`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `codigo_categoria` int NOT NULL,
  PRIMARY KEY(`codigo`),
  FOREIGN KEY(`codigo_categoria`) REFERENCES Categoria(`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `codigo_empleado` int NOT NULL,
  PRIMARY KEY(`codigo`) FOREIGN KEY(`codigo_empleado`) REFERENCES Empleado(`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Tarea (
  `codigo` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `coste` int NOT NULL,
  `prerrequisitos` varchar(1000) NOT NULL,
  PRIMARY KEY(`codigo`)
);
CREATE TABLE local_producto (
  `codigo_producto` int NOT NULL,
  `codigo_local` int NOT NULL,
  PRIMARY KEY (`codigo`, `codigo`),
  FOREIGN KEY (`codigo_producot`) REFERENCES Producto (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`codigo_local`) REFERENCES Local (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE local_empleado (
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `codigo_empleado` int NOT NULL,
  `codigo_local` int NOT NULL,
  PRIMARY KEY (`codigo`, `codigo`, `fecha_inicio`),
  FOREIGN KEY (`codigo_empleado`) REFERENCES Empleado (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`codigo_local`) REFERENCES Local (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE local_empleado_tarea (
  `fecha_inicio` DATE NOT NULL,
  `horas` TIME NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `codigo_empleado` int NOT NULL,
  `codigo_local` int NOT NULL,
  `codigo_tarea` int NOT NULL,
  PRIMARY KEY (
    `codigo_empleado`,
    `cocodigo_localdigo`,
    `fecha_inicio`
  ),
  FOREIGN KEY (`codigo_empleado`) REFERENCES Empleado (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`codigo_local`) REFERENCES Local (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`codigo_tarea`) REFERENCES Tarea (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE producto_ingrediente_modo_cocinado (
  `cantidad` int NOT NULL,
  `codigo_producto` int NOT NULL,
  `codigo_ingrediente` int NOT NULL,
  `codigo_modo_cocinado` int NOT NULL,
  PRIMARY KEY (
    `codigo_producto`,
    `codigo_ingrediente`,
    `codigo_modo_cocinado`
  ),
  FOREIGN KEY (`codigo_ingrediente`) REFERENCES Ingrediente (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`codigo_producto`) REFERENCES Producto (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`codigo_modo_cocinado`) REFERENCES Modo_Cocinado (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
);