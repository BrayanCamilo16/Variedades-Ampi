-- DROP DATABASE IF EXISTS variedades_ampi;
CREATE DATABASE variedades_ampi;

USE variedades_ampi;

# Creacion de tablas
CREATE TABLE tipo_doc (
    id_tipo_doc INT PRIMARY KEY not NULL AUTO_INCREMENT,
    nombre_tipo_doc VARCHAR(30) NOT NULL
);

CREATE TABLE rol (
    id_rol INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(50) NOT NULL
);

CREATE TABLE usuario (
    id_usuario BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email_usuario VARCHAR(100) UNIQUE NOT NULL,
    pass_usuario VARCHAR(260) NOT NULL,
    nombre_usuario VARCHAR(50) NOT NULL,
    apellido_usuario VARCHAR(50) NOT NULL,
    num_documento_usuario VARCHAR(15) NOT NULL,
    telefono_usuario VARCHAR(15) NOT NULL,
    direccion_usuario VARCHAR(100) NOT NULL,
    sexo_usuario TINYINT NOT NULL,
    estado_usuario BOOLEAN NOT NULL DEFAULT TRUE,
    id_rol_FK INT NOT NULL,
    id_tipo_doc_fk INT NOT NULL
);

CREATE TABLE usuario_pedido(
	id_usuario_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_pedido_fk int not null,
    id_usuario_cliente_FK BIGINT not null,
    id_usuario_vendedor_FK BIGINT not null
);

create table pedido (
    id_pedido int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    fecha_pedido DATETIME NOT NULL,
    fecha_entrega DATETIME NOT NULL,
    destino_pedido VARCHAR(100) NOT NULL,
    estado_pedido VARCHAR(50) NOT NULL,
    id_producto_FK INT NOT NULL
);

create table detalles_pedido (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    precio_unidad DOUBLE NOT NULL,
    cantidad DOUBLE NOT NULL,
    PRIMARY KEY (id_pedido, id_producto)
);

CREATE TABLE producto (
    id_producto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(50) NOT NULL,
    descripcion_producto VARCHAR(100) NOT NULL,
    precio_unitario_producto BIGINT NOT NULL,
    stock_producto DOUBLE NOT NULL,
    unidad_minima_producto DOUBLE NOT NULL DEFAULT 5,
    nombre_img_producto varchar(150) NOT NULL,
    estado_producto VARCHAR(50) NOT NULL,
    id_marca_FK INT NOT NULL,
    id_categoria_FK INT NOT NULL
);

CREATE TABLE marca (
    id_marca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_marca VARCHAR (50) NOT NULL,
    informacion_marca VARCHAR (200) NOT NULL
);

CREATE TABLE categoria (
    id_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion_categoria TEXT NOT NULL,
    nombre_img_categoria varchar(150) NOT NULL
);

-- ============================================================
-- ===================== Alteraciones ========================
-- ============================================================
ALTER TABLE usuario
ADD CONSTRAINT usuario_rol
FOREIGN KEY (id_rol_FK)
REFERENCES rol(id_rol) ON UPDATE CASCADE;

ALTER TABLE usuario
ADD CONSTRAINT usuario_tipo_doc
FOREIGN KEY (id_tipo_doc_fk)
REFERENCES tipo_doc(id_tipo_doc) ON UPDATE CASCADE;

ALTER TABLE Usuario_Pedido
ADD CONSTRAINT usuario_usuario_pedido
FOREIGN KEY (id_usuario_cliente_FK)
REFERENCES usuario(id_usuario) ON UPDATE CASCADE;

-- ALTER TABLE Usuario_Pedido
-- ADD CONSTRAINT usuario_usuario_pedido2
-- FOREIGN KEY (id_usuario_vendedor_FK)
-- REFERENCES usuario(id_usuario) ON UPDATE CASCADE;

ALTER TABLE Usuario_Pedido
ADD CONSTRAINT usuario_usuario_pedido3
FOREIGN KEY (id_pedido_FK)
REFERENCES pedido(id_pedido) ON UPDATE CASCADE;

ALTER TABLE detalles_pedido
ADD CONSTRAINT detalles_pedido_pedido
FOREIGN KEY (id_pedido)
REFERENCES pedido(id_pedido) ON UPDATE CASCADE;

ALTER TABLE detalles_pedido
ADD CONSTRAINT detalles_pedido_producto
FOREIGN KEY (id_producto)
REFERENCES producto(id_producto) ON UPDATE CASCADE;

ALTER TABLE producto
ADD CONSTRAINT marca_producto
FOREIGN KEY (id_marca_FK)
REFERENCES marca(id_marca) ON UPDATE CASCADE;

ALTER TABLE producto
ADD CONSTRAINT categoria_producto
FOREIGN KEY (id_categoria_FK)
REFERENCES categoria(id_categoria) ON UPDATE CASCADE;

-- FOREIGN KEY (id_rol_FK) REFERENCES rol(id_rol)


-- ============================================================
-- ===================== Inserciones ========================
-- ============================================================

-- ===================== Tabla tipo doc ========================
INSERT INTO tipo_doc(nombre_tipo_doc) VALUES ('Cedula de ciudadania'),
('Cedula de extranjeria'),
('Tarjeta de identidad'),
('Pasaporte'),
('Nit');

-- ===================== Tabla tipo doc ========================
INSERT INTO rol(nombre_rol) VALUES ('Administrador'),
('Empleado'),
('Cliente');

-- ===================== Tabla categoria ========================
INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `nombre_img_categoria`) VALUES
(null, 'Frutas', 'Frutos comestibles obtenidos de plantas cultivadas', '656134546verduras.png'),
(null, 'Carnes', 'Producto comestible obtenidos de animales', '237629324proteina.png'),
(null, 'Condimentos', 'Ingredientes que se usa para dar sabor a la comida', '699604481condimento.png'),
(null, 'Aseo personal', 'producto de limpieza para uso personal', '901681685productos-aseo.jpg'),
(null, 'Lacteos', 'Producto comestible obtenido de vacas', '572598419productos-lacteos.png'),
(null, 'Bebidas', 'Productos de consumo liquido', '189102910reciclar.png'),
(null, 'Repostería', 'Productos comestibles hechos de harina', '381212549panaderia.png'),
(null, 'Verduras', 'Alimentos obtenidos de plantas cultivadas', '42023901verduras.png'),
(null, 'Enlatados', 'Productos enlatados para el consumo', '487498711botellas-de-vino.png'),
(null, 'Limpieza', 'Productos químicos para la limpieza y desinfección ', '584603072productos-aseo.jpg'),
(null, 'Papelería ', 'Productos de papeleria', '114674905papeleria.png'),
(null, 'Ferretería', 'Productos de ferretería', '135645900ferreteria.png'),
(null, 'Panadería ', 'Productos hechos en harina', '962646797panaderia.png');


-- ===================== Tabla usuario ========================

-- ===== Usuario administrador ======
INSERT INTO usuario VALUES (null, "juan@gmail.com", "1234567890", "Juan Camilo" ,"Rincon", "1010101101", "3100000000", "Calle 82 #25-49m", 1, TRUE, 1, 1),
(null, "camilagonza@gmail.com", "102030", "Camila", "Gonzales", "1032159620", "3112305610", "Calle 72 #10a-57", 2, TRUE, 1, 1),
(null, "brayancami@gmail.com", "456789", "Brayan", "Palomino", "1016944629", "3134377435", "Carrera 100 #96-10", 1, TRUE, 1, 3),
(null, "jhonalex@gmail.com", "213045", "Jhon", "Camargo", "1000350620", "3142000000", "Calle 1 #10c-04", 1, TRUE, 1, 1),
(null, "kevindiaz@gmail.com", "987123", "Kevin", "Alexis", "1020897410", "3502611023", "Calle 200 #15a-20", 1, TRUE, 1, 2),
(null, "josemier@gmail.com", "159874", "Jose", "Mier", "1011230158", "3214568974", "Calle 74#65b-20", 1, TRUE, 1, 1);

-- ===== Usuario cliente ======
INSERT INTO usuario VALUES (null, "david@gmail.com", "11474", "David" ,"Figueroa", "1002314567", "3108125475", "Transversal 115b #22-49", 1, TRUE, 3, 1),
(null, "miller@gmail.com", "185649", "Miller", "Torres", "1015694410", "4444444444", "Calle 40sur #13-50", 1, TRUE, 3, 1),
(null, "andrea@gmail.com", "002314", "Andrea", "Paez", "1020365189", "3008001230", "Carrera 105a #20-80", 2, TRUE, 3, 3),
(null, "lorena@gmail.com", "524163", "Lorena", "Cetina", "1015620325", "3502222145", "Calle 85a #112-15", 2, TRUE, 3, 3),
(null, "jhonatan10@gmail.com", "356214", "Jhonatan", "Martinez", "1021459871", "3132589784", "Carrera 40sur #18g-14", 1, TRUE, 3, 4),
(null, "danivela@gmail.com", "153246", "Daniela", "Velasquez", "1016945897", "3156427894", "Calle 77#10-23", 2, FALSE, 3, 2),
(null, "saraji@gmail.com", "9876543210", "Sara" ,"Jimenes", "1020202020", "3500000000", "Calle 79 #82l-03", 2, TRUE, 3, 4),
(null, "paulo@gmail.com", "654123987", "Paulo", "Londra", "10172653218", "3124561029", "Tranversal 190j #14-10", 1, TRUE, 3, 2),
(null, "dariogo@gmail.com", "27895416", "Dario", "Gomez", "89652102", "3198542160", "Carrera 91 #80a-15", 1, TRUE, 3, 1),
(null, "hector@gmail.com", "4269875", "Hector", "Lavoe", "48235142", "3152000000", "Calle 43 #116b-30", 1, TRUE, 3, 2),
(null, "diomedes@gmail.com", "639512478", "Diomedes", "Diaz", "57894213", "3218412039", "Calle 14sur #150-19", 1, FALSE, 3, 1),
(null, "selena@gmail.com", "2569874", "Selena", "Gomez", "96320145", "3012015894", "Calle 77#50-15", 2, TRUE, 3, 5);

-- ===== Usuario empleado ======
INSERT INTO usuario VALUES (null, "luzmary@gmail.com", "0126598", "Luz Mary" ,"Rivera", "1023695478", "3210505050", "Transversal 32b #14-02", 2, TRUE, 2, 1),
(null, "angelica@gmail.com", "984851", "Anegelica", "Suarez", "1080569120", "3206626541", "Calle 50 #16-25", 2, TRUE, 2, 3),
(null, "laura@gmail.com", "54165416", "Laura", "Oviedo", "1014568974", "32150505056", "Carrera 85 #25j-15", 2, TRUE, 2, 4),
(null, "sebastian@gmail.com", "564165", "Sebastian", "Perez", "1111023158", "6666666666", "Avenida Suba #56-07", 1, TRUE, 2, 1),
(null, "luisra@gmail.com", "564165", "Luis", "Paramo", "1030256987", "8888888888", "Carrera 1sur #45-12", 1, TRUE, 2, 2),
(null, "nicolca@gmail.com", "987481", "Nikol", "Sanchez", "1070459682", "3185625210", "Calle 30#54-19", 2, FALSE, 2, 1),
(null, "marianaga@gmail.com", "632915", "Mariana" ,"Garcia", "1120320695", "3102569874", "Av Villavicencio #120b-32", 2, TRUE, 2, 3),
(null, "segio@gmail.com", "415114", "Sergio", "Ramos", "1115236987", "2222222222", "Tranversal 57f #19-12", 1, TRUE, 2, 5);


-- ===================== Tabla marca ========================
INSERT INTO marca VALUES (null, "Crerry", "Comercializadora de frutas y verduras"),
(null, "Frubis", "Comercializadora de frutas"),
(null, "Macpollo", "Comercializadora de frutas y enbutidos"),
(null, "Zenu", "Comercializadora de carnes para el hogar"),
(null, "Rey", "Comercializadora de condimentos para la comida"),
(null, "Dove", "Empresa distribuidora de jabones para baño"),
(null, "Dersa", "Empresa distribuidora de jabones para la ropa"),
(null, "3D", "Empresa distribuidora de jabones para la ropa"),
(null, "Scott", "Comercializadora de papel higiénico"),
(null, "Familia", "Comercializadora de papel higiénico"),
(null, "Colgate", "Comercializadora de productos para el aseo dental"),
(null, "Klim", "Comercializadora de lacteos"),
(null, "Parmalat", "Comercializadora de lacteos"),
(null, "Alpina", "Comercializadora de lacteos"),
(null, "Alqueria", "Comercializadora de lacteos"),
(null, "Yogo Yogo", "Comercializadora de yogures"),
(null, "Cielo", "Comercializadora de agua"),
(null, "Coca cola", "Comercializadora de gaseosas"),
(null, "Paramo", "Empresa distribuidora de agua"),
(null, "Van Camp`s", "Comercializadora de enlatados"),
(null, "Calvo", "Comercializadora de enlatados"),
(null, "Toys", "Comercializadora de productos de ferreteria"),
(null, "Bic", "Comercializadora de productos de papeleria"),
(null, "Casio", "Comercializadora de productos de papeleria"),
(null, "Sharpie", "Comercializadora de productos de papeleria"),
(null, "Scribe", "Comercializadora de productos de papeleria"),
(null, "Pepsi", "Comercializadora de Gaseosas");


-- ===================== Tabla producto ========================
INSERT INTO producto VALUES (null, 'Manzana', 'Manzana verde', 1500, 50, 20, 'producto.png', 'Activo', 1, 1),
(null, 'Manzana', 'Manzana Roja', 1400, 60, 20, 'producto.png', 'Activo', 1, 1),
(null, 'Carne de cerdo', 'Kl de carne de cerdo', 22000.00, 30, 15, 'producto.png', 'Activo', 3, 2),
(null, 'Carne de res', 'Kl de carne de res', 22500.00, 32, 16, 'producto.png', 'Activo', 4, 2),
(null, 'Alas de pollo', 'Kl de alas con contillal', 4200.00, 32, 16, 'producto.png', 'Activo', 3, 2),
(null, 'Costilla', 'Kl de costilla de res', 7500.00, 27, 10, 'producto.png', 'Activo', 4, 2),
(null, 'Color rey', 'Papeleta color rey', 450, 100, 25, 'producto.png', 'Activo', 5, 3),
(null, 'Salsina rey', 'Papeleta salsina rey', 450, 98, 21, 'producto.png', 'Activo', 5, 3),
(null, 'Comino rey', 'Papeleta comino rey', 450, 98, 21, 'producto.png', 'Activo', 5, 3),
(null, 'Ricostilla', 'Papeleta de ricostilla', 400, 73, 29, 'producto.png', 'Activo', 5, 3),
(null, 'Jobón dove liquido', 'Tarro 100 ml', 12350, 54, 7, 'producto.png', 'Activo', 6, 4),
(null, 'Jobón protex barra', 'Barra de 90g', 2950, 82, 15, 'producto.png', 'Activo', 6, 4),
(null, 'Papel Scott', 'Papel por 27m', 1800, 190, 41, 'producto.png', 'Activo', 7, 4),
(null, 'Papel Familia', 'Papel por 32m', 2100, 150, 30, 'producto.png', 'Activo', 8, 4),
(null, 'Leche parmalat', 'leche por 500ml', 1800, 42, 17, 'producto.png', 'Activo', 13, 5),
(null, 'Leche parmalat', 'leche por 1000ml', 2200, 39, 15, 'producto.png', 'Activo', 13, 5),
(null, 'Leche klim', 'leche en polvo por 25g', 1200, 32, 12, 'producto.png', 'Activo', 12, 5),
(null, 'Leche klim', 'leche en polvo por 300g', 20500, 20, 3, 'producto.png', 'Activo', 12, 5),
(null, 'Leche alpina', 'leche por 1000ml', 2600, 54, 15, 'producto.png', 'Activo', 14, 5),
(null, 'Leche alqueria', 'leche por 1000ml', 2900, 23, 16, 'producto.png', 'Activo', 15, 5),
(null, 'Yogourt Yogo Yogo', 'Yogo Yogo 15ml', 2300, 25, 5, 'producto.png', 'Activo', 16, 5),
(null, 'Agua cielo', 'Agua por 1 litro', 1100, 50, 12, 'producto.png', 'Activo', 17, 6),
(null, 'Gaseosa Coca Cola', 'Coca cola por 2.5 litros', 5000, 60, 12, 'producto.png', 'Activo', 18, 6),
(null, 'Agua paramo', 'Agua por 1 litro', 1100, 60, 12, 'producto.png', 'Activo', 19, 6),
(null, 'Sardina', 'Sardina en salsa por 450g', 6200, 25, 3, 'producto.png', 'Activo', 20, 9),
(null, 'Atun', 'Atun en salsa por 250g', 4400, 25, 5, 'producto.png', 'Activo', 21, 9),
(null, 'Sardina', 'Sardina en salsa por 250g', 5200, 24, 3, 'producto.png', 'Activo', 21, 9),
(null, 'Esfero big', 'Esfero color negro', 800, 24, 5, 'producto.png', 'Activo', 23, 11),
(null, 'Codo', 'Codo de pulga y media', 500, 50, 20, 'producto.png', 'Activo', 22, 12);


-- ===================== Tabla pedido ========================
INSERT INTO pedido (fecha_pedido, fecha_entrega, destino_pedido, estado_pedido, id_producto_FK) VALUES
("2022-08-02 09:52:00", "2022-08-02 00:00:00", "Cl 82 #12-18", "Entregado", 12),
("2022-08-04 11:02:00", "2022-08-04 00:00:00", "Cl 95 #16-14", "Entregado", 4),
("2022-08-08 11:07:00", "2022-08-08 00:00:00", "Cr 105B #143-21", "Entregado", 4),
("2022-08-10 19:00:00", "2022-08-00 00:00:00", "Cl 125 #19-89", "Entregado", 6),
("2022-08-11 20:57:00", "2022-08-11 00:00:00", "Cr 37 #133A-46", "Entregado", 7),
("2022-08-13 12:18:00", "2022-08-13 00:00:00", "Cr 60 #5C-60", "Entregado", 8),
("2022-08-18 11:22:00", "2022-08-18 00:00:00", "Cr 3A #22-45", "Entregado", 10),
("2022-08-19 12:18:00", "2022-08-19 00:00:00", "Cl 57A #40-67", "Entregado", 24),
("2022-08-22 09:46:00", "2022-08-22 00:00:00", "Cr 21 #82-82", "Entregado", 9),
("2022-08-24 09:21:00", "2022-08-24 00:00:00", "Cr 13 #63-39", "Entregado", 20);


-- ===================== Tabla detalles de pedido ========================
INSERT INTO detalles_pedido(id_pedido,id_producto, precio_unidad, cantidad) VALUES
(1,3,22000,1),
(1,4,22500,1),
(2,4,22500,1),
(3,6,7500,2),
(4,7,450,5),
(4,8,450,5),
(4,10,450,10),
(4,9,450,5),
(5,23,5000,2),
(5,20,2900,2),
(6,22,1100,1),
(6,11,12350,1),
(6,4,22500,1),
(7,5,4200,2),
(8,2,1400,6),
(8,14,2100,5),
(8,12,2950,10),
(9,23,5000,1),
(10,25,6200,2),
(10,5,4200,2);


-- ===================== Tabla detalles de pedido ========================
INSERT INTO `usuario_pedido` (`id_usuario_pedido`, `id_pedido_fk`, `id_usuario_cliente_FK`, `id_usuario_vendedor_FK`) VALUES
(1, 2, 15, 23),
(2, 5, 9, 19),
(3, 1, 10, 25),
(4, 10, 13, 20),
(5, 3, 18, 22),
(6, 5, 7, 26),
(7, 9, 16, 21),
(8, 6, 8, 24),
(9, 1, 11, 23),
(10, 8, 15, 20),
(11, 4, 9, 21),
(12, 3, 7, 26),
(13, 8, 18, 22),
(14, 10, 12, 22),
(15, 6, 18, 19),
(16, 9, 13, 25),
(17, 10, 15, 21),
(18, 7, 10, 24),
(19, 1, 9, 26),
(20, 1, 14, 26),
(21, 7, 14, 22),
(22, 6, 17, 19),
(23, 10, 11, 19),
(24, 3, 16, 21),
(25, 5, 16, 25),
(26, 10, 18, 24),
(27, 1, 7, 26),
(28, 1, 13, 22),
(29, 5, 9, 19),
(30, 5, 9, 19),
(31, 5, 7, 19),
(32, 4, 7, 25),
(33, 5, 18, 19),
(34, 10, 14, 23),
(35, 4, 10, 20),
(36, 4, 13, 23),
(37, 5, 11, 24),
(38, 8, 17, 26),
(39, 1, 17, 26),
(40, 10, 17, 22);


-- ============================================================
-- ===================== Funciones ========================
-- ============================================================

-- ===================== Obtener el precio total de un producto ========================

DELIMITER $$
CREATE FUNCTION precio_total_producto(precio double, cantidad double)
    RETURNS double
BEGIN
    RETURN (precio * cantidad);
END ;
$$

-- ===================== Sumar todos los pedidos de un cliente ========================

DELIMITER $$
CREATE FUNCTION SentenciaUsuario(codigo int) 
    RETURNS float 
BEGIN 
    RETURN(SELECT SUM(uspe.id_pedido_fk) FROM usuario_pedido as uspe INNER JOIN pedido as pedi ON uspe.id_pedido_fk=pedi.id_pedido WHERE uspe.id_usuario_cliente_FK=codigo); 
END;
$$


-- ===================== Calcula el total de un producto vendido ========================

delimiter $$
create function calcular_total_vendido(num1 int) 
    returns varchar(20)
begin
	return (select sum(cantidad) from detalles_pedido where id_producto = num1);
end ;
$$
select calctotprop(9) as totpro;


-- ===================== Cuenta cuantos productos tiene una categoria ========================

delimiter //
create function cantidadproductos()
	RETURNS int
BEGIN
RETURN(SELECT nombre_producto, COUNT(id_producto) FROM producto WHERE id_categoria_FK=codigo);
END;
//

-- Quitar la doble relación y agregar un check