-- sp para ordenamiento de tabla

DROP PROCEDURE IF EXISTS sp_orden_tabla;
delimiter $$

-- Creo el procedimiento y establezco 3 parametros, para poder variar la tabla a trabajar, el campo y el sentido.

CREATE PROCEDURE sp_orden_tabla (IN tabla VARCHAR(30), IN campo VARCHAR(30), IN sentido VARCHAR (4))
BEGIN
	-- condicional para establecer la tabla a ordenar
	IF tabla = '' THEN
		SELECT 'Debe ingresar una tabla a analizar' AS mensaje;
	ELSE 
		SET @tabla_analizada = tabla;
	END IF;
    -- condicional para establecer el campo de ordenamiento
    IF campo <> '' THEN 
		SET @campo_orden = CONCAT('ORDER BY ', campo);
	ELSE 
		SET @campo_orden = '';
	END IF;
    -- condicional para establecer el sentido del orden
    IF sentido = '' THEN
		SET @sentido_orden = '';
	ELSE
		SET @sentido_orden = sentido;
	END IF;
    -- se establece la sentencia
	SET @sentencia = concat('SELECT * FROM ', @tabla_analizada, ' ', @campo_orden, ' ', @sentido_orden);
    -- se ejecuta la sentencia
    PREPARE ejecutar FROM @sentencia;
    EXECUTE ejecutar;
    DEALLOCATE PREPARE ejecutar;
        
END $$

delimiter $$

CALL sp_orden_tabla ('', '', '');

-- sp para carga de stock o actualizar el actual

DROP PROCEDURE IF EXISTS sp_actualiz_compra_stock;
delimiter $$
-- se crea el sp
CREATE PROCEDURE sp_actualiz_compra_stock (IN articulo INT, IN numero INT)
BEGIN
	-- condicional para establecer la operacion a realizar (INSERT O UPDATE) dependiendo de si el articulo ya esta cargado o no en el listado de stock.
	IF (SELECT COUNT(*) from stock where num_serie = articulo) = 0 THEN 
		SET @accion = CONCAT('INSERT INTO stock VALUES (',articulo, ', ', numero,', NULL)');
	ELSE
		SET @accion = CONCAT('UPDATE stock SET cantidad = (cantidad + ', numero,') WHERE num_Serie = ', articulo);
	END IF;
    -- se ejecuta la sentencia 
    PREPARE ejecutar FROM @accion;
    EXECUTE ejecutar;
    DEALLOCATE PREPARE ejecutar;
        
END $$

delimiter $$

CALL sp_actualiz_compra_stock (68268, 22);