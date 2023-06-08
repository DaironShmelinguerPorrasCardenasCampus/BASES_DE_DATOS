CREATE DATABASE TOUR;

USE TOUR;

CREATE TABLE Ciclistas (
  Id_ciclista INT PRIMARY KEY,
  Nombre_ciclista VARCHAR(50),
  Nacionalidad_ciclista VARCHAR(50),
  Experiencia_ciclista INT,
  Equipo_ciclista INT,
  FOREIGN KEY (Equipo_ciclista) REFERENCES Equipos(Id_equipo)
);

CREATE TABLE Equipos(
  Id_equipo INT PRIMARY KEY,
  Nombre_equipo VARCHAR(50),
  Entrenador INT,
  FOREIGN KEY (Entrenador) REFERENCES Entrenadores(Id_entrenador)
  );


CREATE TABLE Etapas (
  ID_etapa INT PRIMARY KEY,
  Tipo_etapa VARCHAR(60),
  Fecha_etapa DATE,
  Ciudad_partida VARCHAR(50),
  Ciudad_llegada VARCHAR(50),
  Puntos INT,
  Distancia_etapa DECIMAL(10, 2),
  Tiempo_llegada TIME,
  Detalle_etapa INT,
  FOREIGN KEY (Detalle_etapa) REFERENCES Detalles(Id_detalle)
);

CREATE TABLE Detalles(
  Id_detalle INT PRIMARY KEY,
  Id_etapa INT,
  Perfil_etapa VARCHAR(250),
  Honorario TIME,
  Itirenario VARCHAR(60)

);


CREATE TABLE Entrenadores (
  Id_entrenador INT PRIMARY KEY,
  Nombre_entrenador VARCHAR(50),
  Telefono_entrenador VARCHAR(20)
);


CREATE TABLE Premiaciones(
  Id_premiacion INT PRIMARY KEY,
  Id_clasificacion INT,
  Id_ciclistas INT,
  Id_equipo INT,
  Id_etapa INT,
  Diferencia INT,
  Remuneración TIME,
  FOREIGN KEY (Id_etapa) REFERENCES Etapas(ID_etapa),
  FOREIGN KEY (Id_clasificacion) REFERENCES Clasificacion(Id_clasificacion),
  FOREIGN KEY (Id_ciclistas) REFERENCES Ciclistas(Id_ciclista),
  FOREIGN KEY (Id_equipo) REFERENCES Equipos(Id_equipo),
  FOREIGN KEY (Id_etapa) REFERENCES Etapas(ID_etapa)
);


CREATE TABLE Clasificacion (
  Id_clasificacion INT PRIMARY KEY,
  Id_etapa INT,
  Id_ciclista INT,
  Tipo_clasificación VARCHAR(60),
  Posicion_etapa INT,
  Posicion_general INT,
  FOREIGN KEY (Id_etapa) REFERENCES Etapas(ID_etapa),
  FOREIGN KEY (Id_ciclista) REFERENCES Ciclistas(Id_ciclista)
);
