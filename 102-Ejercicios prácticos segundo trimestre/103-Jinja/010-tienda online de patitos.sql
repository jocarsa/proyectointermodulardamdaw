-- =========================================================
-- Script de instalación: Tienda de patos de goma
-- Esquema orientado a MySQL/MariaDB (InnoDB, utf8mb4)
-- Incluye tablas, claves PK/FK, vistas e inserts de ejemplo
-- =========================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- (Opcional) Borrado previo de tablas si existen
-- DROP TABLE IF EXISTS movimientos_stock;
-- DROP TABLE IF EXISTS lineas_pedido;
-- DROP TABLE IF EXISTS stock_actual;
-- DROP TABLE IF EXISTS pedidos;
-- DROP TABLE IF EXISTS productos_pato;
-- DROP TABLE IF EXISTS clientes;
-- DROP TABLE IF EXISTS categorias_pato;

SET FOREIGN_KEY_CHECKS = 1;

-- ==========================
-- TABLAS MAESTRAS
-- ==========================

-- Categorías de patos
CREATE TABLE categorias_pato (
    id_categoria    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    descripcion     VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Clientes
CREATE TABLE clientes (
    id_cliente      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    apellidos       VARCHAR(150) NOT NULL,
    email           VARCHAR(150) NOT NULL UNIQUE,
    telefono        VARCHAR(30),
    direccion       VARCHAR(200),
    ciudad          VARCHAR(100),
    codigo_postal   VARCHAR(10),
    pais            VARCHAR(100),
    fecha_alta      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Productos (patos de goma)
CREATE TABLE productos_pato (
    id_producto     INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(150) NOT NULL,
    descripcion     TEXT,
    color           VARCHAR(50),
    tamano          VARCHAR(50),
    precio          DECIMAL(10,2) NOT NULL,
    activo          TINYINT(1) NOT NULL DEFAULT 1,
    id_categoria    INT UNSIGNED NOT NULL,
    CONSTRAINT fk_productos_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias_pato(id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Pedidos (cabecera)
CREATE TABLE pedidos (
    id_pedido       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_cliente      INT UNSIGNED NOT NULL,
    fecha_pedido    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado          VARCHAR(20) NOT NULL, -- p.ej.: PENDIENTE, PAGADO, ENVIADO, CANCELADO
    total           DECIMAL(10,2) NOT NULL DEFAULT 0,
    CONSTRAINT fk_pedidos_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Stock actual por producto
CREATE TABLE stock_actual (
    id_stock        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_producto     INT UNSIGNED NOT NULL,
    cantidad        INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_stock_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos_pato(id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT uq_stock_producto UNIQUE (id_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Movimientos de stock
CREATE TABLE movimientos_stock (
    id_movimiento       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_producto         INT UNSIGNED NOT NULL,
    id_pedido           INT UNSIGNED NULL,
    fecha_movimiento    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_movimiento     ENUM('ENTRADA','SALIDA','AJUSTE') NOT NULL,
    cantidad            INT NOT NULL,
    descripcion         VARCHAR(255),
    CONSTRAINT fk_mov_stock_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos_pato(id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_mov_stock_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido)
        ON UPDATE CASCADE
        ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Líneas de pedido (detalle)
CREATE TABLE lineas_pedido (
    id_linea        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_pedido       INT UNSIGNED NOT NULL,
    id_producto     INT UNSIGNED NOT NULL,
    cantidad        INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal        DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_lineas_pedido_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_lineas_pedido_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos_pato(id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==========================
-- VISTAS PARA MOSTRAR FKs
-- ==========================

-- Productos con categoría y stock
CREATE OR REPLACE VIEW vw_productos_pato AS
SELECT 
    p.id_producto,
    p.nombre,
    p.descripcion,
    p.color,
    p.tamano,
    p.precio,
    p.activo,
    c.nombre AS categoria,
    IFNULL(s.cantidad, 0) AS stock_disponible
FROM productos_pato p
JOIN categorias_pato c ON p.id_categoria = c.id_categoria
LEFT JOIN stock_actual s ON p.id_producto = s.id_producto;

-- Pedidos con datos básicos de cliente
CREATE OR REPLACE VIEW vw_pedidos_con_clientes AS
SELECT
    ped.id_pedido,
    ped.fecha_pedido,
    ped.estado,
    ped.total,
    cli.id_cliente,
    cli.nombre,
    cli.apellidos,
    cli.email
FROM pedidos ped
JOIN clientes cli ON ped.id_cliente = cli.id_cliente;

-- Detalle de líneas de pedido con cliente y producto
CREATE OR REPLACE VIEW vw_lineas_pedido_detalle AS
SELECT
    lp.id_linea,
    lp.id_pedido,
    ped.fecha_pedido,
    ped.estado,
    cli.id_cliente,
    cli.nombre AS nombre_cliente,
    cli.apellidos AS apellidos_cliente,
    lp.id_producto,
    prod.nombre AS nombre_producto,
    lp.cantidad,
    lp.precio_unitario,
    lp.subtotal
FROM lineas_pedido lp
JOIN pedidos ped   ON lp.id_pedido   = ped.id_pedido
JOIN clientes cli  ON ped.id_cliente = cli.id_cliente
JOIN productos_pato prod ON lp.id_producto = prod.id_producto;

-- Movimientos de stock con detalle de producto y pedido
CREATE OR REPLACE VIEW vw_movimientos_stock_detalle AS
SELECT
    ms.id_movimiento,
    ms.fecha_movimiento,
    ms.tipo_movimiento,
    ms.cantidad,
    ms.descripcion,
    ms.id_pedido,
    prod.id_producto,
    prod.nombre AS nombre_producto
FROM movimientos_stock ms
JOIN productos_pato prod ON ms.id_producto = prod.id_producto;

-- ==========================
-- DATOS DE EJEMPLO
-- Respeta orden por FKs:
-- 1) Categorías
-- 2) Clientes
-- 3) Productos
-- 4) Pedidos
-- 5) Stock actual
-- 6) Líneas de pedido
-- 7) Movimientos de stock
-- ==========================

-- 1) Categorías de patos
INSERT INTO categorias_pato (id_categoria, nombre, descripcion) VALUES
(1, 'Clásico amarillo',    'Patos de goma amarillos estándar'),
(2, 'Ediciones limitadas', 'Patos especiales de tiradas limitadas'),
(3, 'Profesiones',         'Patos disfrazados de diferentes profesiones'),
(4, 'Temáticos cine',      'Patos inspirados en películas y series');

-- 2) Clientes
INSERT INTO clientes (
    id_cliente, nombre, apellidos, email, telefono,
    direccion, ciudad, codigo_postal, pais, fecha_alta
) VALUES
(1, 'Ana',   'García', 'ana.garcia@example.com',   '600000001',
    'Calle Sol 1',   'Valencia',  '46001', 'España', '2025-01-01 10:00:00'),
(2, 'Carlos','López', 'carlos.lopez@example.com', '600000002',
    'Avenida Luna 5','Madrid',    '28001', 'España', '2025-01-02 11:00:00'),
(3, 'Marta', 'Ruiz',  'marta.ruiz@example.com',   '600000003',
    'Plaza Mar 3',   'Barcelona', '08001', 'España', '2025-01-03 12:00:00');

-- 3) Productos (patos de goma)
-- Precios enteros para cuadrar fácilmente totales de pedido
INSERT INTO productos_pato (
    id_producto, nombre, descripcion, color, tamano, precio, activo, id_categoria
) VALUES
(1, 'Pato clásico pequeño',
    'Pato de goma amarillo clásico tamaño pequeño',
    'amarillo', 'pequeño', 5.00, 1, 1),
(2, 'Pato programador',
    'Pato de goma con gafas y pequeño portátil',
    'negro', 'mediano', 10.00, 1, 3),
(3, 'Pato superhéroe',
    'Pato de goma con capa y antifaz',
    'azul', 'mediano', 8.00, 1, 4),
(4, 'Pato unicornio brillante',
    'Pato de goma con cuerno de unicornio y purpurina',
    'rosa', 'grande', 12.00, 1, 2);

-- 4) Pedidos (cabecera)
-- Totales cuadran con las líneas de pedido que se insertan más abajo
INSERT INTO pedidos (
    id_pedido, id_cliente, fecha_pedido, estado, total
) VALUES
(1, 1, '2025-02-01 09:30:00', 'PAGADO', 28.00),
(2, 2, '2025-02-02 16:15:00', 'ENVIADO', 25.00),
(3, 3, '2025-02-03 18:45:00', 'PAGADO', 25.00);

-- 5) Stock actual (después de ventas de ejemplo)
INSERT INTO stock_actual (id_stock, id_producto, cantidad) VALUES
(1, 1, 94),  -- partiendo de 100 y restando ventas
(2, 2, 48),  -- partiendo de 50
(3, 3, 28),  -- partiendo de 30
(4, 4, 19);  -- partiendo de 20

-- 6) Líneas de pedido (detalle)
-- Pedido 1 (Ana): 2x clásico, 1x programador, 1x superhéroe -> total 28
-- Pedido 2 (Carlos): 1x unicornio, 1x clásico, 1x superhéroe -> total 25
-- Pedido 3 (Marta): 3x clásico, 1x programador -> total 25
INSERT INTO lineas_pedido (
    id_linea, id_pedido, id_producto, cantidad, precio_unitario, subtotal
) VALUES
(1, 1, 1, 2,  5.00, 10.00),
(2, 1, 2, 1, 10.00, 10.00),
(3, 1, 3, 1,  8.00,  8.00),

(4, 2, 4, 1, 12.00, 12.00),
(5, 2, 1, 1,  5.00,  5.00),
(6, 2, 3, 1,  8.00,  8.00),

(7, 3, 1, 3,  5.00, 15.00),
(8, 3, 2, 1, 10.00, 10.00);

-- 7) Movimientos de stock
-- Entradas iniciales y salidas asociadas a los pedidos
INSERT INTO movimientos_stock (
    id_movimiento, id_producto, id_pedido, fecha_movimiento,
    tipo_movimiento, cantidad, descripcion
) VALUES
-- Entradas iniciales
(1, 1, NULL, '2025-01-31 08:00:00', 'ENTRADA', 100, 'Stock inicial producto 1'),
(2, 2, NULL, '2025-01-31 08:00:00', 'ENTRADA',  50, 'Stock inicial producto 2'),
(3, 3, NULL, '2025-01-31 08:00:00', 'ENTRADA',  30, 'Stock inicial producto 3'),
(4, 4, NULL, '2025-01-31 08:00:00', 'ENTRADA',  20, 'Stock inicial producto 4'),

-- Salidas por Pedido 1 (id_pedido = 1)
(5, 1, 1, '2025-02-01 10:00:00', 'SALIDA', 2, 'Venta pedido 1 - Pato clásico pequeño'),
(6, 2, 1, '2025-02-01 10:00:00', 'SALIDA', 1, 'Venta pedido 1 - Pato programador'),
(7, 3, 1, '2025-02-01 10:00:00', 'SALIDA', 1, 'Venta pedido 1 - Pato superhéroe'),

-- Salidas por Pedido 2 (id_pedido = 2)
(8, 4, 2, '2025-02-02 17:00:00', 'SALIDA', 1, 'Venta pedido 2 - Pato unicornio brillante'),
(9, 1, 2, '2025-02-02 17:00:00', 'SALIDA', 1, 'Venta pedido 2 - Pato clásico pequeño'),
(10,3, 2, '2025-02-02 17:00:00', 'SALIDA', 1, 'Venta pedido 2 - Pato superhéroe'),

-- Salidas por Pedido 3 (id_pedido = 3)
(11,1, 3, '2025-02-03 19:00:00', 'SALIDA', 3, 'Venta pedido 3 - Pato clásico pequeño'),
(12,2, 3, '2025-02-03 19:00:00', 'SALIDA', 1, 'Venta pedido 3 - Pato programador');

-- =========================================================
-- Fin del script de instalación
-- =========================================================

