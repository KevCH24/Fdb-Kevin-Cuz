create database phones;
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR NOT NULL,
    apellido VARCHAR NOT NULL,
    direccion VARCHAR,
    telefono VARCHAR,
    email VARCHAR
);
CREATE TABLE Telefono (
    idTelefono INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR NOT NULL,
    modelo VARCHAR NOT NULL,
    precio DECIMAL NOT NULL,
    cantidad INT NOT NULL,
);
CREATE TABLE Trabajador (
    idTrabajador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR NOT NULL,
    apellido VARCHAR NOT NULL,
    cargo VARCHAR NOT NULL,
    salario DECIMAL NOT NULL
);
CREATE TABLE Cliente_Telefono (
    idCliente INT,
    idTelefono INT,
    PRIMARY KEY (idCliente, idTelefono),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idTelefono) REFERENCES Telefono(idTelefono)
);
INSERT INTO Cliente (nombre, apellido, direccion, telefono, email) VALUES
    ('Juan', 'Pérez', 'Calle 123', '123-456-7890', 'juan@example.com');

INSERT INTO Telefono (marca, modelo, precio, cantidad) VALUES
    ('Samsung', 'Galaxy S20', 999.99, 10),
    ('Apple', 'iPhone 12', 1099.99, 5);

INSERT INTO Trabajador (nombre, apellido, cargo, salario) VALUES
    ('María', 'López', 'Vendedor', 2000),
    ('Pedro', 'González', 'Gerente', 3000);
