-- VISTA DE TODAS LAS FACTURAS PENDIENTES DE PAGO Y SUS SALDOS

CREATE OR REPLACE VIEW facturas_saldo AS
SELECT f.id_Sucursal, f.tipo, f.numero, f.fecha, f.id_Cliente, c.razon_Social,f.monto, f.saldo_Pendiente
FROM facturas f INNER JOIN clientes c
ON f.id_Cliente = c.id_Cliente
WHERE f.saldo_pendiente > 0;

-- VISTA DE LA DEUDA TOTAL POR CLIENTE

CREATE OR REPLACE VIEW deuda_clientes AS
SELECT f.id_cliente, c.razon_Social, SUM(f.saldo_Pendiente) AS deuda, cl.limite AS autorizado
FROM facturas f INNER JOIN clientes c
ON f.id_Cliente = c.id_Cliente
INNER JOIN clasif_crediticia cl
ON c.cod_Clasif = cl.cod_Clasif
WHERE f.saldo_Pendiente > 0
GROUP BY f.id_cliente;

-- VISTA DEL TOTAL DE VENTAS REALIZADAS POR VENDEDOR Y EL MONTO QUE REPRESENTAN

CREATE OR REPLACE VIEW ventas_Vendedor AS
SELECT v.nombre AS vendedor, SUM(f.monto) AS total_vendido, COUNT(f.id_Vendedor) as total_ventas
FROM vendedores v INNER JOIN facturas f
ON v.id_Vendedor = f.id_Vendedor
GROUP BY  v.nombre;

-- VISTA DEL ACUMULADO DE VENTAS POR ARTICULO Y SU STOCK ACTUAL - para el analisis de reposiciones de stock

CREATE OR REPLACE VIEW movimientos_Articulo AS
SELECT d.num_Serie, a.desc_Articulo AS descripcion, SUM(d.cantidad) AS total_vendido, s.cantidad
FROM detalle_factura d INNER JOIN articulos a
ON d.num_Serie = a.num_Serie
LEFT JOIN stock s
ON a.num_Serie = s.num_Serie
GROUP BY d.num_Serie;

-- VISTA DE VENTAS TOTALES POR TIPO DE CLIENTE

CREATE OR REPLACE VIEW vta_tipo_cliente AS
SELECT t.desc_Tipo AS tipo_cliente,  SUM(f.monto) AS total_vendido
FROM facturas f INNER JOIN clientes c
ON f.id_Cliente = c.id_Cliente
INNER JOIN tipo_cliente t
ON c.cod_Tipo = t.cod_Tipo
GROUP BY t.desc_Tipo;


select * from facturas_saldo;

