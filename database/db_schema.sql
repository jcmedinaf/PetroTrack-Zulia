-- =====================================================================
-- SISTEMA: PetroTrack Zulia (SPA)
-- BASE DE DATOS: bd_petrotrack_zulia
-- =====================================================================

CREATE DATABASE IF NOT EXISTS bd_petrotrack_zulia DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE bd_petrotrack_zulia;

-- 1. TABLA DE USUARIOS (Ingenieros y Operadores)
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    clave VARCHAR(255) NOT NULL,
    rol ENUM('ADMINISTRADOR', 'INGENIERO_OPERACIONES', 'OPERADOR_CAMPO') DEFAULT 'OPERADOR_CAMPO',
    status ENUM('ACTIVO', 'INACTIVO') DEFAULT 'ACTIVO',
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. TABLA DE CAMPOS PETROLEROS
CREATE TABLE IF NOT EXISTS campos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    ubicacion VARCHAR(150) NOT NULL,
    descripcion TEXT,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. TABLA DE ACTIVOS (Balancines, Pozos y Tanques)
CREATE TABLE IF NOT EXISTS activos_petroleros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    campo_id INT NOT NULL,
    codigo_activo VARCHAR(50) NOT NULL UNIQUE,
    tipo_activo ENUM('BALANCIN', 'POZO_FLUYENTE', 'TANQUE_ALMACENAMIENTO') NOT NULL,
    latitud DECIMAL(10, 8) NOT NULL,
    longitud DECIMAL(11, 8) NOT NULL,
    capacidad_barriles DECIMAL(12, 2) DEFAULT 0.00,
    estado_operativo ENUM('OPERATIVO', 'EN_MANTENIMIENTO', 'FUERA_DE_SERVICIO') DEFAULT 'OPERATIVO',
    CONSTRAINT fk_activo_campo FOREIGN KEY (campo_id) REFERENCES campos(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. TABLA DE LECTURAS PSI Y NIVELES (Auditoría de Operaciones)
CREATE TABLE IF NOT EXISTS lecturas_psi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    activo_id INT NOT NULL,
    usuario_id INT NOT NULL,
    presion_psi DECIMAL(10, 2) NOT NULL,
    temperatura_celsius DECIMAL(5, 2) DEFAULT NULL,
    nivel_llenado_porcentaje DECIMAL(5, 2) DEFAULT NULL,
    observaciones TEXT,
    fecha_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_lectura_activo FOREIGN KEY (activo_id) REFERENCES activos_petroleros(id) ON DELETE CASCADE,
    CONSTRAINT fk_lectura_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DATOS INICIALES DE PRUEBA
INSERT INTO campos (nombre, ubicacion, descripcion) VALUES 
('Campo Tía Juana', 'Costa Oriental del Lago', 'Sector de extracción pesada y balancines activos.'),
('Campo Bachaquero Sur', 'Costa Oriental del Lago', 'Área de almacenamiento principal y parques de tanques.');

INSERT INTO usuarios (cedula, nombre, usuario, clave, rol) VALUES 
('V-12345678', 'Ing. Juan Medina', 'jmedina', '123456', 'INGENIERO_OPERACIONES'),
('V-87654321', 'Carlos Pérez', 'cperez', '123456', 'OPERADOR_CAMPO');

INSERT INTO activos_petroleros (campo_id, codigo_activo, tipo_activo, latitud, longitud, capacidad_barriles, estado_operativo) VALUES 
(1, 'BL-TJ-101', 'BALANCIN', 10.15840000, -71.36520000, 0.00, 'OPERATIVO'),
(1, 'TK-TJ-201', 'TANQUE_ALMACENAMIENTO', 10.16100000, -71.36100000, 50000.00, 'OPERATIVO'),
(2, 'PZ-BS-305', 'POZO_FLUYENTE', 9.96500000, -71.14200000, 0.00, 'EN_MANTENIMIENTO');