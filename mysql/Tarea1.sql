/*
	CREAR UNA BASE DE DATOS
    - Nos aseguramos que no exista la BD usando IF NOT EXIST
    - Nos aseguramos de utilizar el formáto de codigicación utf8
*/
CREATE DATABASE IF NOT EXISTS `cocina` DEFAULT CHARACTER SET utf8;

/*
	ELIMINAR UNA BASE DE DATOS
*/
DROP DATABASE IF EXISTS `cocina`;

/*
	UTILIZAR LA BASE DE DATOS
*/
USE `cocina`;

/*
	CREAR TABLAS EN LA BASE DE DATOS
    - La base de datos constara de dos tablas que se tienen una relación muchos a muchos, 
      por lo que se agregó la tercera tabla donde podemos construir nuestra bd realcional.
    - Se usa la tabla recetas y la tabla ingredientes, donde una receta puede tener uno o 
      muchos ingredientes.
*/
CREATE TABLE receta (
	id 				INT PRIMARY KEY AUTO_INCREMENT,
    nombre 			VARCHAR (120),
    descripcion 	VARCHAR (255),
    tiempo_prep 	INT,
    dificultad 		VARCHAR (30),
    personas 		INT,
    tipo 			VARCHAR (120),
    autor 			VARCHAR (120)
);

CREATE TABLE ingrediente (
	id 				INT PRIMARY KEY AUTO_INCREMENT,
    nombre			VARCHAR (120),
    tipo			VARCHAR (120)
);

CREATE TABLE receta_ingrediente (
	id_receta		INT,
    id_ingrediente	INT,
    porcion			INT,
    descripcion		VARCHAR (120),
    PRIMARY KEY (id_receta, id_ingrediente),
    FOREIGN KEY (id_receta) REFERENCES receta (id),
    FOREIGN KEY (id_ingrediente) REFERENCES ingrediente (id)
);

/*
	AGREGAR VALORES A LAS TABLAS
*/
INSERT INTO ingrediente (nombre, tipo) VALUES ('Galleta de canela molida', 'Harinas');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Mantequilla fundida', 'Grasas');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Queso crema', 'Lácteos');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Azúcar glass', 'Azúcares');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Crema para batir', 'Lácteos');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Vainilla', 'Especia');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Grenetina hidratada', 'Gelificante');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Ate de guayaba', 'Dulces');

INSERT INTO ingrediente (nombre, tipo) VALUES ('Agua', 'Liquidos');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Sal', 'Sales');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Espagueti', 'Pastas');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Mantequilla', 'Grasas');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Jamón en cubos', 'Carnes');
INSERT INTO ingrediente (nombre, tipo) VALUES ('Crema', 'Lácteos');

INSERT INTO receta (nombre, descripcion, tiempo_prep, dificultad, personas, tipo, autor) 
VALUES (
	'Pay de Queso con Ate de Guayaba',
    'El dulce y particular sabor de la guayaba es completamente asombroso, nunca antes 2 ingredientes habían sido tan amigos como la guayaba y el queso.',
    220,
    'Baja',
    6,
    'Postre',
    'Liliana Pérez'
);

INSERT INTO receta (nombre, descripcion, tiempo_prep, dificultad, personas, tipo, autor) 
VALUES (
	'Espagueti a la Crema con Jamón',
    'Este tradicional espagueti a la crema con jamón volverá locos a tus hijos, lo prepararás en tan sólo 3 pasos y es muy económico y rendidor.',
    50,
    'Media',
    6,
    'Pastas',
    'Nick William'
);

SELECT * FROM ingrediente;
SELECT * FROM receta;

INSERT INTO receta_ingrediente VALUES (1, 1, 2, 'tazas');
INSERT INTO receta_ingrediente VALUES (1, 2, 1, 'taza');
INSERT INTO receta_ingrediente VALUES (1, 3, 4, 'tazas');
INSERT INTO receta_ingrediente VALUES (1, 4, 1, 'taza');
INSERT INTO receta_ingrediente VALUES (1, 5, 2, 'tazas');
INSERT INTO receta_ingrediente VALUES (1, 6, 1, 'cucharada');
INSERT INTO receta_ingrediente VALUES (1, 7, 2, 'sobres de 30g');
INSERT INTO receta_ingrediente VALUES (1, 8, 300, 'gramos');

INSERT INTO receta_ingrediente VALUES (2, 9, 1, 'Litro');
INSERT INTO receta_ingrediente VALUES (2, 10, 1, 'cucharada');
INSERT INTO receta_ingrediente VALUES (2, 11, 1, 'paquete');
INSERT INTO receta_ingrediente VALUES (2, 12, 2, 'cucharadas');
INSERT INTO receta_ingrediente VALUES (2, 13, 200, 'gramos');
INSERT INTO receta_ingrediente VALUES (1, 14, 1, 'taza');

SELECT * FROM receta_ingrediente;

/*
	INNER JOIN
*/

SELECT * FROM receta INNER JOIN receta_ingrediente ON receta.id = receta_ingrediente.id_receta;