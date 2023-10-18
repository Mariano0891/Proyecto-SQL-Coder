drop function if exists clien_x_prov;

delimiter $$

CREATE FUNCTION clien_x_prov (Prov VARCHAR(3))
RETURNS int
reads sql data
BEGIN
   DECLARE cantidad int;
   select count(cod_Prov)
   into cantidad
   from clientes
   where cod_Prov = Prov;
   
RETURN cantidad;
END
$$
delimiter ; 

select clien_x_prov('CBA') as CantidadClientes;

drop function if exists vent_x_vendedor_periodo;

delimiter $$
CREATE FUNCTION vent_x_vendedor_periodo ( Vendedor VARCHAR(02), fechaInicio DATE, fechaCierre DATE)
returns float
reads sql data
BEGIN
	DECLARE totalVentas float;
    select SUM(monto)
    into totalVentas
    from facturas
    where id_Vendedor = Vendedor and fecha between fechaInicio and fechaCierre;
RETURN totalVentas;
END
$$
delimiter ;

select vent_x_vendedor_periodo('29', 20230116, 20230131) as total_Vendido;