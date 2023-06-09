
CREATE DATABASE PELUQUERIA;

USE PELUQUERIA;

CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE Empleado (
    empleado_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(50),
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);

CREATE TABLE Servicio (
    servicio_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(200),
    duracion INT,
    precio DECIMAL(10, 2)
);

CREATE TABLE Cita (
    cita_id INT PRIMARY KEY,
    fecha_hora DATETIME,
    duracion INT,
    empleado_id INT,
    cliente_id INT,
    servicio_id INT,
    FOREIGN KEY (empleado_id) REFERENCES Empleado(empleado_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (servicio_id) REFERENCES Servicio(servicio_id)
);

CREATE TABLE Producto (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(200),
    precio DECIMAL(10, 2),
    stock INT
);

CREATE TABLE Cita_Producto (
    cita_id INT,
    producto_id INT,
    PRIMARY KEY (cita_id, producto_id),
    FOREIGN KEY (cita_id) REFERENCES Cita(cita_id),
    FOREIGN KEY (producto_id) REFERENCES Producto(producto_id)
);



-- Insertar datos de ejemplo
INSERT INTO Cliente (cliente_id, nombre, direccion, telefono, email)
VALUES (1, 'Juan Pérez', 'Calle Principal 123', '555-1234', 'juan@example.com'),
       (2, 'María Gómez', 'Avenida Central 456', '555-5678', 'maria@example.com');

INSERT INTO Empleado (empleado_id, nombre, direccion, telefono, email, salario, fecha_contratacion)
VALUES (1, 'Carlos López', 'Avenida Principal 789', '555-9876', 'carlos@example.com', 2000, '2022-01-15'),
       (2, 'Laura Martínez', 'Calle Secundaria 321', '555-4321', 'laura@example.com', 1800, '2022-03-10');

INSERT INTO Servicio (servicio_id, nombre, descripcion, duracion, precio)
VALUES (1, 'Corte de Pelo', 'Corte de pelo para hombres y mujeres', 30, 50),
       (2, 'Peinado', 'Peinado para ocasiones especiales', 60, 80),
       (3, 'Tintura', 'Tintura de cabello en varios tonos', 90, 120);

INSERT INTO Cita (cita_id, fecha_hora, duracion, empleado_id, cliente_id, servicio_id)
VALUES (1, '2023-06-10 10:00:00', 60, 1, 1, 1),
       (2, '2023-06-12 15:30:00', 90, 2, 2, 3);

INSERT INTO Producto (producto_id, nombre, descripcion, precio, stock)
VALUES (1, 'Champú', 'Champú nutritivo para todo tipo de cabello', 15, 50),
       (2, 'Acondicionador', 'Acondicionador suavizante para cabello seco', 18, 30);

INSERT INTO Cita_Producto (cita_id, producto_id)
VALUES (1, 1),
       (1, 2),
       (2, 2);
