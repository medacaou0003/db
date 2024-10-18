-- Creación de la base de datos 'foodtrak'
CREATE database foodtrak;

-- Selección de la base de datos 'foodtrak' para las operaciones siguientes
use foodtrak;

-- Creación de la tabla 'Furgoneta' para almacenar información de las furgonetas
CREATE TABLE Furgoneta (
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Identificador único para cada furgoneta
    nombre VARCHAR(100) NOT NULL,       -- Nombre de la furgoneta
    posicion VARCHAR(50),                -- Posición geográfica de la furgoneta
    numero INT,                          -- Número de identificación de la furgoneta
    hora_apertura TIME,                  -- Hora de apertura
    hora_cierre TIME                     -- Hora de cierre
);

-- Creación de la tabla 'Empleado' para almacenar información de los empleados
CREATE TABLE Empleado (
    id INT PRIMARY KEY AUTO_INCREMENT,    -- Identificador único para cada empleado
    nombre VARCHAR(100) NOT NULL,         -- Nombre del empleado
    apellido VARCHAR(100) NOT NULL,       -- Apellido del empleado
    dni VARCHAR(20) UNIQUE,               -- DNI único para cada empleado
    telefono VARCHAR(20),                  -- Número de teléfono
    email VARCHAR(100),                   -- Dirección de correo electrónico
    salario DECIMAL(7,2)                  -- Salario del empleado
);

-- Creación de la tabla 'Producto' para almacenar información de los productos
CREATE TABLE Producto (
    id INT PRIMARY KEY AUTO_INCREMENT,     -- Identificador único para cada producto
    nombre VARCHAR(100) NOT NULL,          -- Nombre del producto
    categoria VARCHAR(50),                 -- Categoría del producto
    precio DECIMAL(5,2) NOT NULL,         -- Precio del producto
    ingredientes TEXT,                     -- Ingredientes del producto
    id_furgoneta INT,                      -- Identificador de la furgoneta asociada
    FOREIGN KEY (id_furgoneta) REFERENCES Furgoneta(id)  -- Clave foránea para vincular a la tabla Furgoneta
);

-- Creación de la tabla 'Pedido' para almacenar información de los pedidos
CREATE TABLE Pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,      -- Identificador único para cada pedido
    numero INT NOT NULL,                    -- Número del pedido
    deporte VARCHAR(50),                    -- Tipo de deporte asociado al pedido
    tipo_pago VARCHAR(50),                  -- Método de pago
    fecha_hora DATETIME NOT NULL,           -- Fecha y hora del pedido
    id_furgoneta INT,                       -- Identificador de la furgoneta asociada
    observaciones TEXT,                     -- Observaciones sobre el pedido
    FOREIGN KEY (id_furgoneta) REFERENCES Furgoneta(id)  -- Clave foránea para vincular a la tabla Furgoneta
);

-- Modificación de la tabla 'Empleado' para agregar una columna 'id_furgoneta'
ALTER TABLE Empleado
ADD COLUMN id_furgoneta INT,                             -- Agregar una columna para vincular el empleado a una furgoneta
ADD FOREIGN KEY (id_furgoneta) REFERENCES Furgoneta(id);  -- Clave foránea para vincular a la tabla Furgoneta

-- Inserción de datos en la tabla Furgoneta
INSERT INTO Furgoneta (nombre, posicion, numero, hora_apertura, hora_cierre) VALUES
('Furgoneta A', 'Plaza Central', 1, '08:00:00', '20:00:00'),
('Furgoneta B', 'Parque Municipal', 2, '09:00:00', '21:00:00'),
('Furgoneta C', 'Calle Principal', 3, '07:30:00', '19:30:00');

-- Inserción de datos en la tabla Empleado
INSERT INTO Empleado (nombre, apellido, dni, telefono, email, salario, id_furgoneta) VALUES
('Juan', 'Pérez', '12345678A', '612345678', 'juan.perez@example.com', 1500.00, 1),
('María', 'García', '87654321B', '623456789', 'maria.garcia@example.com', 1600.00, 2),
('Luis', 'Martínez', '23456789C', '634567890', 'luis.martinez@example.com', 1550.00, 1);

-- Inserción de datos en la tabla Producto
INSERT INTO Producto (nombre, categoria, precio, ingredientes, id_furgoneta) VALUES
('Taco', 'Comida', 5.50, 'Tortilla, carne, cebolla, cilantro', 1),
('Bebida', 'Bebida', 2.00, 'Agua, soda', 2),
('Hamburguesa', 'Comida', 7.00, 'Carne, pan, lechuga, tomate', 1);

-- Inserción de datos en la tabla Pedido
INSERT INTO Pedido (numero, deporte, tipo_pago, fecha_hora, id_furgoneta, observaciones) VALUES
(1, 'Fútbol', 'Efectivo', '2024-10-18 12:00:00', 1, 'Sin observaciones'),
(2, 'Ciclismo', 'Tarjeta', '2024-10-18 14:30:00', 2, 'Entregar rápido'),
(3, 'Correr', 'Efectivo', '2024-10-18 16:00:00', 1, 'Sin gluten');
