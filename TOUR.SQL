CREATE DATABASE TOUR;

USE TOUR;


CREATE TABLE Ciclistas (
  Id_ciclista INT PRIMARY KEY,
  Nombre_ciclista VARCHAR(50),
  Nacionalidad_ciclista VARCHAR(50),
  Experiencia_ciclista INT,
  Equipo_ciclista INT,
  Entrenador INT,
  FOREIGN KEY (Equipo_ciclista) REFERENCES Equipos(Id_equipo),
  FOREIGN KEY (Entrenador) REFERENCES Entrenadores(Id_entrenador)
);

CREATE TABLE Equipos(
  Id_equipo INT PRIMARY KEY,
  Nombre_equipo VARCHAR(50)
);


CREATE TABLE Etapas (
  ID_etapa INT PRIMARY KEY,
  Numero_etapa INT,
  Fecha_etapa DATE,
  Ciudad_partida VARCHAR(50),
  Ciudad_llegada VARCHAR(50),
  Distancia_etapa DECIMAL(10, 2)
);


CREATE TABLE Entrenadores (
  Id_entrenador INT PRIMARY KEY,
  Nombre_entrenador VARCHAR(50),
  Telefono_entrenador VARCHAR(20)
);


CREATE TABLE Resultados (
  Id_resultado INT PRIMARY KEY,
  Id_etapa INT,
  Id_ciclista INT,
  Tiempo_llegada TIME,
  FOREIGN KEY (Id_etapa) REFERENCES Etapas(ID_etapa),
  FOREIGN KEY (Id_ciclista) REFERENCES Ciclistas(Id_ciclista)
);


CREATE TABLE Clasificacion (
  Id_clasificacion INT PRIMARY KEY,
  Id_etapa INT,
  Id_ciclista INT,
  Posicion_etapa INT,
  Posicion_general INT,
  FOREIGN KEY (Id_etapa) REFERENCES Etapas(ID_etapa),
  FOREIGN KEY (Id_ciclista) REFERENCES Ciclistas(Id_ciclista)
);
