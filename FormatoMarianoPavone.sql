drop function if exists clien_x_prov;

delimiter $$

CREATE FUNCTION clien_x_prov (Prov int)
RETURNS int
reads sql data
BEGIN
   DECLARE cantidad int;
   select count(cod_Prov)
   into cantidad
   from datos_cliente
   where cod_Prov = Prov;
   
RETURN cantidad;
END
$$
delimiter ; 

select clien_x_prov(5) as CantidadClientes;

drop function if exists vent_x_vendedor_periodo;

delimiter $$
CREATE FUNCTION vent_x_vendedor_periodo ( Vendedor varchar(02), fechaInicio datetime, fechaCierre datetime )
returns float
reads sql data
BEGIN
	DECLARE totalVentas float;
    select sum(monto)
    into totalVentas
    from facturas
    where ID_Vendedor = Vendedor and fecha between fechaInicio and fechaCierre;
RETURN totalVentas;
END
$$
delimiter ;

