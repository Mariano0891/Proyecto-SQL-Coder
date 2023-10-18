DROP TABLE IF EXISTS facturas;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS provincias;
DROP TABLE IF EXISTS condicion_Fiscal;
DROP TABLE IF EXISTS alicuota_IVA;
DROP TABLE IF EXISTS clasif_Crediticia;
DROP TABLE IF EXISTS plazo_Venta;
DROP TABLE IF EXISTS tipo_Cliente;
DROP TABLE IF EXISTS tipo_Factura;
DROP TABLE IF EXISTS sucursales;
DROP TABLE IF EXISTS vendedores;
DROP TABLE IF EXISTS franquicia;
DROP TABLE IF EXISTS categorias_Margen;
DROP TABLE IF EXISTS articulos;
DROP TABLE IF EXISTS detalle_Factura;
DROP TABLE IF EXISTS stock;


CREATE TABLE provincias (
cod_Prov VARCHAR (3) PRIMARY KEY NOT NULL,
Prov VARCHAR (40) NOT NULL);

CREATE TABLE condicion_Fiscal (
cod_Cond VARCHAR (2) NOT NULL PRIMARY KEY,
desc_Cond VARCHAR (30) NOT NULL);

CREATE TABLE alicuota_IVA (
cod_Alic INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
desc_Alic VARCHAR (30) NOT NULL,
alicuota FLOAT NOT NULL);

CREATE TABLE clasif_Crediticia (
cod_Clasif VARCHAR (02) NOT NULL PRIMARY KEY,
desc_Clasif VARCHAR (50) NOT NULL,
limite INT NOT NULL);

CREATE TABLE plazo_Venta (
cod_Plazo VARCHAR (2) NOT NULL PRIMARY KEY,
desc_Plazo VARCHAR (20) NOT NULL,
plazo INT NOT NULL);

CREATE TABLE tipo_Cliente (
cod_Tipo VARCHAR (02) NOT NULL PRIMARY KEY,
desc_Tipo VARCHAR (30) NOT NULL,
descuento_Max FLOAT NOT NULL);

CREATE TABLE clientes (
id_Cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
razon_Social VARCHAR (60) NOT NULL,
direccion VARCHAR (60) NOT NULL,
localidad VARCHAR (60) NOT NULL,
cod_Prov VARCHAR (3) NOT NULL,
telefono VARCHAR (80) NOT NULL,
mail VARCHAR (80),
cod_Tipo varchar (02),
cod_Clasif VARCHAR (02),
cod_Plazo VARCHAR (02),
cod_Cond VARCHAR (02) NOT NULL,
CUIT_CUIL VARCHAR (20),
ing_Brutos VARCHAR (20),

FOREIGN KEY (cod_Prov) REFERENCES provincias (cod_Prov),
FOREIGN KEY (cod_Tipo) REFERENCES tipo_Cliente (cod_Tipo),
FOREIGN KEY (cod_Clasif) REFERENCES clasif_Crediticia (cod_Clasif),
FOREIGN KEY (cod_Plazo) REFERENCES plazo_Venta (cod_Plazo),
FOREIGN KEY (cod_Cond) REFERENCES condicion_Fiscal (cod_Cond));

CREATE TABLE tipo_Factura (
cod_Factura VARCHAR (2) NOT NULL PRIMARY KEY,
desc_Factura VARCHAR (20) NOT NULL);

CREATE TABLE sucursales (
id_Sucursal VARCHAR (4) NOT NULL PRIMARY KEY,
desc_Sucursal VARCHAR (20) NOT NULL);

CREATE TABLE vendedores (
id_Vendedor VARCHAR (2) NOT NULL PRIMARY KEY,
nombre VARCHAR (30) NOT NULL);

CREATE TABLE facturas (
id_Factura INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cod_Factura VARCHAR (2) NOT NULL,
id_Sucursal VARCHAR (4) NOT NULL,
tipo VARCHAR (1) NOT NULL,
numero INT NOT NULL,
fecha DATETIME NOT NULL,
id_Cliente INT NOT NULL,
id_Vendedor VARCHAR (2) NOT NULL,
monto DECIMAL (10,2) NOT NULL,
saldo_Pendiente DECIMAL (10,2) NOT NULL,
CAE INT NOT NULL,
fecha_Venc DATE NOT NULL,

FOREIGN KEY (cod_Factura) REFERENCES tipo_Factura (cod_Factura),
FOREIGN KEY (id_Sucursal) REFERENCES sucursales (id_Sucursal),
FOREIGN KEY (id_Cliente) REFERENCES clientes (id_Cliente),
FOREIGN KEY (id_Vendedor) REFERENCES vendedores (id_Vendedor));

ALTER TABLE facturas MODIFY CAE BIGINT;
ALTER TABLE facturas MODIFY fecha DATE;

CREATE TABLE franquicia (
cod_Franquicia VARCHAR (1) NOT NULL PRIMARY KEY,
desc_Franquicia VARCHAR (20) NOT NULL);

CREATE TABLE categorias_Margen (
cod_Margen INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
desc_Margen VARCHAR (20) NOT NULL,
margen FLOAT NOT NULL);

CREATE TABLE articulos (
num_Serie INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
desc_Articulo VARCHAR (40) NOT NULL,
cod_Franquicia VARCHAR (1) NOT NULL,
cod_Original VARCHAR (40) NOT NULL,
cod_Alic INT NOT NULL,
cod_Margen INT NOT NULL,
unidad_Empaque INT,
precio DECIMAL (10,2) NOT NULL,

FOREIGN KEY (cod_Franquicia) REFERENCES franquicia (cod_Franquicia),
FOREIGN KEY (cod_Alic) REFERENCES alicuota_IVA (cod_Alic),
FOREIGN KEY (cod_Margen) REFERENCES categorias_Margen (cod_Margen));

CREATE TABLE detalle_Factura (
nro_Registro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_Factura INT NOT NULL,
num_Serie INT NOT NULL,
cantidad INT NOT NULL,
precio_Neto DECIMAL (10,2),
descu_Aplicado FLOAT,

FOREIGN KEY (id_Factura) REFERENCES facturas (id_Factura),
FOREIGN KEY (num_Serie) REFERENCES articulos (num_Serie));

CREATE TABLE stock (
num_Serie INT NOT NULL PRIMARY KEY,
cantidad INT NOT NULL,
ubicacion VARCHAR (5),

FOREIGN KEY (num_Serie) REFERENCES articulos (num_Serie));



