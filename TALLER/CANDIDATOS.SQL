CREATE DATABASE sistema_electoral;

use sistema_electoral;

CREATE TABLE votantes(
    Votantes_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    edad INT(3) NOT NULL
);

CREATE TABLE partidos(
    partidos_id INT PRIMARY KEY AUTO_INCREMENT, 
    nombre_P VARCHAR(60) NOT NULL,
    año_fundacion VARCHAR(4) NOT NULL,
    lider VARCHAR(50) NOT NULL
);

CREATE TABLE candidatos(
    candidatos_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_C  VARCHAR (50) NOT NULL,
    partidos_id INT NULL NULL,
    historial VARCHAR(621) NOT NULL,
    FOREIGN KEY (partidos_id) REFERENCES partidos(partidos_id) 
);

CREATE TABLE elecciones(
    elecciones_id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE votos(
    votos_id INT PRIMARY KEY AUTO_INCREMENT,
    Votantes_id INT NOT NULL,
    candidatos_id INT NOT NULL,
    elecciones_id INT NOT NULL,
    FOREIGN KEY (Votantes_id) REFERENCES votantes(Votantes_id),
    FOREIGN KEY (candidatos_id) REFERENCES candidatos(candidatos_id),
    FOREIGN KEY (elecciones_id) REFERENCES elecciones(elecciones_id)
);