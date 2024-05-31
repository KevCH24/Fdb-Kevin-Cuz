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

CREATE TABLE IF NOT EXISTS Telefono (
    id_telefono INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    almac VARCHAR(10) NOT NULL,
    compania_o_liberado VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Cliente_Telefono (
    idCliente INT,
    idTelefono INT,
    PRIMARY KEY (idCliente, idTelefono),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idTelefono) REFERENCES Telefono(id_telefono)
);

-- Insertar datos de ejemplo
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

SELECT * FROM Cliente;
SELECT * FROM Empleado;
SELECT * FROM Telefono;

SELECT Nombre, Correo FROM Cliente;
SELECT nombre, correo FROM Empleado;

SELECT * FROM Cliente WHERE tel = '5551234567';
SELECT * FROM Empleado WHERE rfc = 'CSP123456HDF';
SELECT * FROM Telefono WHERE precio > 800;

SELECT * FROM Cliente ORDER BY Nombre ASC;
SELECT * FROM Empleado ORDER BY nombre DESC;
SELECT * FROM Telefono ORDER BY precio DESC;

SELECT COUNT(*) FROM Cliente;
SELECT COUNT(*) FROM Empleado;
SELECT COUNT(*) FROM Telefono;

SELECT SUM(precio) FROM Telefono;

SELECT MAX(precio), MIN(precio) FROM Telefono;

SELECT Cliente.Nombre, Telefono.marca
FROM Cliente
INNER JOIN Cliente_Telefono ON Cliente.idCliente = Cliente_Telefono.idCliente
INNER JOIN Telefono ON Cliente_Telefono.idTelefono = Telefono.id_telefono;

SELECT c.Nombre AS cliente, t.marca AS telefono
FROM Cliente c
JOIN Cliente_Telefono ct ON c.idCliente = ct.idCliente
JOIN Telefono t ON ct.idTelefono = t.id_telefono
WHERE t.precio > 800;

SELECT e.nombre AS empleado, e.rfc
FROM Empleado e
WHERE e.id_empleado > (
    SELECT AVG(id_empleado) FROM Empleado WHERE direccion = e.direccion
);

SELECT direccion, AVG(id_empleado) AS promedio_empleados
FROM Empleado
GROUP BY direccion;

SELECT nombre, fecha_contratacion
FROM Empleado
WHERE YEAR(fecha_contratacion) = 2023;

SELECT Nombre AS nombre, 'Cliente' AS tipo
FROM Cliente
UNION
SELECT nombre AS nombre, 'Empleado' AS tipo
FROM Empleado;

SELECT Nombre, Direccion
FROM Cliente
WHERE Direccion LIKE '%Calle%';

SELECT Nombre
FROM Cliente
WHERE EXISTS (
    SELECT 1 FROM Cliente_Telefono WHERE idCliente = Cliente.idCliente
);

SELECT Nombre, Apellidos
FROM Cliente
ORDER BY idCliente DESC
LIMIT 10 OFFSET 10;

CREATE TABLE IF NOT EXISTS Cliente1NF (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    tel VARCHAR(15) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    Pais VARCHAR(50) NOT NULL
);

