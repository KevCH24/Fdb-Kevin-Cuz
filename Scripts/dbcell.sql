-- Active: 1717002306986@@127.0.0.1@3306@cellstore

CREATE TABLE IF NOT EXISTS Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    tel VARCHAR(15) NOT NULL,
    Correo VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Empleado (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido_mat VARCHAR(50) NOT NULL,
    apellido_pat VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    rfc VARCHAR(13) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Cliente_Telefono (
    idCliente INT,
    idTelefono INT,
    PRIMARY KEY (idCliente, idTelefono),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idTelefono) REFERENCES Telefono(idTelefono)
);

INSERT INTO Cliente (Nombre, Apellidos, Direccion, tel, Correo) VALUES
    ('Juan', 'Pérez', 'Calle 123', '1234567890', 'juan@example.com'),
    ('Gibran', 'Vásquez', 'El Vergel', '9876543210', 'elproximocoordi@gmail.com'),
    ('María', 'López', 'Avenida Siempre Viva 742', '5551234567', 'maria.lopez@example.com'),
    ('Carlos', 'García', 'Calle Falsa 123', '5557654321', 'carlos.garcia@example.com'),
    ('Ana', 'Martínez', 'Avenida del Sol 456', '5552345678', 'ana.martinez@example.com'),
    ('Luis', 'Hernández', 'Calle Luna 789', '5558765432', 'luis.hernandez@example.com'),
    ('José', 'Fernández', 'Boulevard del Río 101', '5553456789', 'jose.fernandez@example.com'),
    ('Laura', 'Gómez', 'Plaza Central 202', '5556543210', 'laura.gomez@example.com'),
    ('Miguel', 'Sánchez', 'Calle del Parque 303', '5554567890', 'miguel.sanchez@example.com'),
    ('Sofía', 'Rodríguez', 'Avenida de la Paz 404', '5555678901', 'sofia.rodriguez@example.com');

CREATE TABLE IF NOT EXISTS Telefono (
    id_telefono INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    almac VARCHAR(10) NOT NULL,
    compania_o_liberado VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

INSERT INTO Telefono (marca, modelo, almac, compania_o_liberado, precio) VALUES
    ('Samsung', 'Galaxy S20', '128GB', 'Liberado', 999.99),
    ('Apple', 'iPhone 12', '64GB', 'AT&T', 1099.99),
    ('Google', 'Pixel 5', '128GB', 'Liberado', 699.99),
    ('OnePlus', '8T', '256GB', 'T-Mobile', 749.99),
    ('Sony', 'Xperia 5 II', '128GB', 'Verizon', 949.99),
    ('Huawei', 'P40 Pro', '256GB', 'Liberado', 899.99),
    ('Xiaomi', 'Mi 10', '128GB', 'Liberado', 799.99),
    ('Oppo', 'Find X2', '256GB', 'Liberado', 999.99),
    ('Nokia', '8.3 5G', '128GB', 'Liberado', 649.99),
    ('Motorola', 'Edge+', '256GB', 'Verizon', 999.99);


INSERT INTO Empleado (nombre, apellido_mat, apellido_pat, correo, rfc, direccion) VALUES
    ('Carlos', 'Sánchez', 'Pérez', 'carlos.sanchez@example.com', 'CSP123456HDF', 'Calle Falsa 123'),
    ('María', 'López', 'García', 'maria.lopez@example.com', 'MLG234567JDF', 'Avenida Siempre Viva 742'),
    ('Juan', 'Rodríguez', 'Hernández', 'juan.rodriguez@example.com', 'JRH345678KDF', 'Boulevard del Río 101'),
    ('Ana', 'Martínez', 'López', 'ana.martinez@example.com', 'AML456789LDF', 'Avenida del Sol 456'),
    ('Luis', 'Gómez', 'Fernández', 'luis.gomez@example.com', 'LGF567890MDF', 'Calle Luna 789');
