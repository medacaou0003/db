
CREATE database foodtrak;
use foodtrak

CREATE TABLE Forgoneta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    posicion VARCHAR(50),
    numero INT,
    hora_apertura TIME,
    hora_cierre TIME
);
CREATE TABLE Empleado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE,
    telefono VARCHAR(20),
    email VARCHAR(100),
    salario DECIMAL(7,2)
);
CREATE TABLE Producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(5,2) NOT NULL,
    ingredientes TEXT,
    id_forgoneta INT,
    FOREIGN KEY (id_forgoneta) REFERENCES Forgoneta(id)
);
CREATE TABLE Pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    deporte VARCHAR(50),
    tipo_pago VARCHAR(50),
    fecha_hora DATETIME NOT NULL,
    id_forgoneta INT,
    observaciones TEXT,
    FOREIGN KEY (id_forgoneta) REFERENCES Forgoneta(id)
);


ALTER TABLE Empleado
ADD COLUMN id_forgoneta INT,
ADD FOREIGN KEY (id_forgoneta) REFERENCES Forgoneta(id);
