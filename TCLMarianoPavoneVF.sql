SELECT * FROM sucursales;

START TRANSACTION;

DELETE FROM sucursales
WHERE id_Sucursal in ('0061', '0063');

-- ROLLBACK;

-- COMMIT;

-- INSERT INTO sucursales VALUES
-- ('0061', 'UNIDADES'),
-- ('0063', 'SERVICIOS');

SELECT * FROM stock ORDER BY cantidad ASC;

START TRANSACTION;

INSERT INTO stock VALUES
(266205, 0, NULL),
(266809, 0, NULL),
(266860, 0, NULL),
(267014, 0, NULL);

SAVEPOINT registro_4;

INSERT INTO stock VALUES
(269935, 0, NULL),
(270327, 0, NULL),
(272344, 0, NULL),
(273091, 0, NULL);

SAVEPOINT registro_8;

-- RELEASE SAVEPOINT registro_4;