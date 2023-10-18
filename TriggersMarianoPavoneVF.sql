DROP TABLE IF EXISTS actualizaciones_Precios;
DROP TABLE IF EXISTS nuevos_Articulos;

CREATE TABLE actualizaciones_Precios (
num_Serie INT NOT NULL,
precio_Anterior DECIMAL (10,2) NOT NULL,
precio_Nuevo DECIMAL (10,2) NOT NULL,
fecha_Actualizacion DATETIME,
usuario VARCHAR (30));

CREATE TABLE nuevos_Articulos (
num_serie INT NOT NULL,
fecha_Carga DATETIME,
usuario_Carga VARCHAR (30));

DROP TRIGGER IF EXISTS `tr_actualizacion_precio`;
-- ESTE TRIGGER REGISTRARA TODAS LAS ACTUALIZACIONES DE PRECIOS QUE SE REALICEN Y GUARDARA TANTO EL PRECIO NUEVO COMO EL ANTERIOR.
DELIMITER $$
CREATE TRIGGER `tr_actualizacion_precio` BEFORE UPDATE ON `articulos` FOR EACH ROW BEGIN

	INSERT INTO actualizaciones_Precios
    SELECT num_Serie, old.precio, new.precio, NOW(), USER()
	FROM articulos
    WHERE (num_Serie) = (new.num_Serie);
    
END$$ 

DELIMITER ;

DROP TRIGGER IF EXISTS `tr_carga_nuevos_articulos`;
-- ESTE REGISTRARA TODOS LOS NUEVOS ARTICULOS INCORPORADOS A LA TABLA ARTICULOS.
DELIMITER $$
CREATE TRIGGER `tr_carga_nuevos_articulos` AFTER INSERT ON `articulos` FOR EACH ROW BEGIN

INSERT INTO nuevos_Articulos VALUES
    (NEW.num_Serie, NOW(), USER());
END$$

DELIMITER ;

DROP TABLE IF EXISTS actualizaciones_Clasificacion_Clientes;
DROP TABLE IF EXISTS nuevos_Clientes;

CREATE TABLE actualizaciones_Clasificacion_Clientes (
id_Cliente INT NOT NULL,
clasificacion_Anterior VARCHAR(2),
nueva_Clasificacion VARCHAR(2),
fecha_Actualizacion DATETIME,
usuario VARCHAR (30));

CREATE TABLE nuevos_Clientes (
id_Cliente INT NOT NULL,
fecha_Carga DATETIME,
usuario_Carga VARCHAR (30));

DROP TRIGGER IF EXISTS `tr_cambios_clasif_cliente`;
-- ESTE TRIGGER GUARDARA TODOS LOS CAMBIOS QUE SE REALICEN EN LA CLASIFICACION CREDITICIA DE CLIENTES.
DELIMITER $$
CREATE TRIGGER `tr_cambios_clasif_clientes` BEFORE UPDATE ON `clientes` FOR EACH ROW BEGIN

	INSERT INTO actualizaciones_Clasificacion_Clientes
    SELECT id_Cliente, new.cod_Clasif, old.cod_Clasif, NOW(), USER()
	FROM clientes
    WHERE (id_Cliente) = (new.id_Cliente);
    
END$$ 

DELIMITER ;

DROP TRIGGER IF EXISTS `tr_registro_clientes_nuevos`;
-- AL IGUAL QUE EN EL CASO DE LOS ARTICULOS, ESTE TRIGGER REGISTRA CUALQUIER ALTA DE CLIENTE QUE SER REALICE.
DELIMITER $$
CREATE TRIGGER `tr_registro_clientes_nuevos` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN

INSERT INTO nuevos_Clientes VALUES
    (NEW.id_Cliente, NOW(), USER());
END$$

DELIMITER ;
