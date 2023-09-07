-- select * from provincias;
insert into provincias values 
(null , 'Buenos Aires'),
(null, 'Catamarca'),
(null, 'Chaco'),
(null, 'Chubut'),
(null, 'Cordoba'),
(null, 'Corrientes'),
(null, 'Entre Rios'),
(null, 'Formosa'),
(null, 'Jujuy'),
(null, 'La Pampa'),
(null, 'La Rioja'),
(null, 'Mendoza'),
(null, 'Misiones'),
(null, 'Neuquen'),
(null, 'Rio Negro'),
(null, 'Salta'),
(null, 'San Juan'),
(null, 'San Luis'),
(null, 'Santa Cruz'),
(null, 'Santa Fe'),
(null, 'Santiago del Estero'),
(null, 'Tierra del Fuego'),
(null, 'Tucuman');

-- select * from condicion_iva;

insert into condicion_iva (cod_IVA, Descripcion) values
(null, 'Responsable Inscripto'),
(null, 'Responsable Monotributo'),
(null, 'Exento'),
(null, 'Consumidor Final');

-- select * from clasif_credit;

insert into clasif_credit (cod_Clasif, aclaracion, credit_limit) values 
('A1', 'Cuenta autorizada hasta $ 1.000.000', 1000000),
('A2', 'Cuenta autorizada hasta $ 500.000', 500000),
('A3', 'Cuenta autorizada hasta $ 300.000', 300000),
('A4', 'Cuenta autorizada hasta $ 100.000', 100000),
('D1', 'Plazo autorizadado con documento hasta $ 1.000.000', 1000000),
('D2', 'Plazo autorizadado con documento hasta $ 500.000', 500000),
('D3', 'Plazo autorizadado con documento hasta $ 300.000', 300000),
('D4', 'Plazo autorizadado con documento hasta $ 100.000', 100000);

-- select * from condicion_venta;

insert into condicion_venta values 
('P1', 'Hasta 60 días', 60),
('P2', 'Hasta 30 días', 30),
('P3', 'Hasta 15 días', 15),
('P4', 'Hasta 7 días', 7),
('P5', 'Sin plazo', 1);

-- select * from tipo_cliente;

insert into tipo_cliente (cod_tipo, descripcion) values 
('01', 'Casa de repuestos'),
('02', 'Tallerista'),
('03', 'Flota'),
('04', 'Aseguradora');

-- select * from datos_cliente;

insert into datos_cliente values 
(null, 'For-Vol S.A.', 'BV. Los alemanes 1580', 'San Miguel de Tucuman', 23, '384-2584741', null, '01', 'A2', 'P2', '01', '30-5485532-2', null),
(null, 'Repuestos Romano', 'Fulvio Pagani 25', 'Arroyito', 5, '351-21341564', null, '01', 'A3', 'P1', '01', '30-6487531-2', null),
(null, 'Transporte Parisi', 'Ambrosio Olmos 784', 'Cordoba', 5, '351-54845711', null, '01', 'D2', 'P3', '03', '30-2875496-2', null),
(null, 'Transportadora de Caudales J SRL', 'Azcuenaga 1254', 'Ciudad Autonoma de Buenos Aires', 1, '11-24535597', null, '01', 'A1', 'P1', '03', '45-8795424-2', null),
(null, 'Enria Claudio', 'Del Ruiseñor 287', 'Colonia Caroya', 5, '351-7548721', null, '02', null, 'P5', '01', '22-2315271-1', null),
(null, 'Mino Transporte', 'Libertad 45', 'Cordoba', 5, '351-698450214', null, '01', 'A3', 'P2', '03', '25-2875465-2', null);