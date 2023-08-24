DROP TABLE IF EXISTS datos_cliente;
DROP TABLE IF EXISTS provincias;
DROP TABLE IF EXISTS condicion_iva;
DROP TABLE IF EXISTS clasif_credit;
DROP TABLE IF EXISTS condicion_venta;
DROP TABLE IF EXISTS tipo_cliente;
DROP TABLE IF EXISTS articulos;
DROP TABLE IF EXISTS tipo_factura;
DROP TABLE IF EXISTS tipo_recibo;
DROP TABLE IF EXISTS sucursal;
DROP TABLE IF EXISTS vendedores;
DROP TABLE IF EXISTS facturas;
DROP TABLE IF EXISTS detalle_factura;

CREATE TABLE provincias (
cod_Prov INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Prov VARCHAR (30) NOT NULL);

CREATE TABLE condicion_iva (
cod_IVA INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Descripcion VARCHAR (30) NOT NULL,
IVA FLOAT (05) NOT NULL
);

CREATE TABLE clasif_credit (
cod_Clasif VARCHAR (02) NOT NULL PRIMARY KEY,
aclaracion VARCHAR (20) NOT NULL,
credit_limit INT NOT NULL
);

CREATE TABLE condicion_venta (
cod_Condic VARCHAR (02) NOT NULL PRIMARY KEY,
descripcion VARCHAR (30) NOT NULL,
plazo_venc INT NULL
);

CREATE TABLE tipo_cliente (
cod_tipo VARCHAR (02) NOT NULL PRIMARY KEY,
descripcion VARCHAR (30) NOT NULL,
plazo_venc INT NULL
);

CREATE TABLE datos_cliente (
id_cliente INT NOT NULL AUTO_INCREMENT,
razon_social VARCHAR (60) NOT NULL,
direccion VARCHAR (60) NOT NULL,
localidad VARCHAR (60) NOT NULL,
cod_Prov INT NOT NULL,
tel VARCHAR (80) NOT NULL,
mail VARCHAR (80) NULL,
cod_tipo varchar (02) NULL,
cod_Clasif VARCHAR (02) NULL,
cod_condic VARCHAR (02) NOT NULL,
cod_IVA INT NOT NULL,
CUIT_CUIL VARCHAR (12) NULL,
ing_brutos VARCHAR (12) NULL,

PRIMARY KEY (id_cliente),
FOREIGN KEY (cod_Prov) REFERENCES provincias (cod_Prov),
FOREIGN KEY (cod_IVA) REFERENCES condicion_iva (cod_IVA),
FOREIGN KEY (cod_Clasif) REFERENCES clasif_credit (cod_Clasif),
FOREIGN KEY (cod_condic) REFERENCES condicion_venta (cod_condic),
FOREIGN KEY (cod_tipo) REFERENCES tipo_cliente (cod_tipo)
);

CREATE TABLE articulos (
serie INT NOT NULL PRIMARY KEY,
desc_Arti VARCHAR (40) NOT NULL,
cod_original VARCHAR (40) NOT NULL,
IVA DECIMAL NOT NULL,
margen DECIMAL NOT NULL,
unidades INT NULL,
precio DECIMAL NOT NULL
);

CREATE TABLE tipo_factura (
cod_Factura VARCHAR (02) NOT NULL PRIMARY KEY,
descripcion VARCHAR (20)
);

CREATE TABLE tipo_recibo (
cod_Recibo VARCHAR (02) NOT NULL PRIMARY KEY,
descripcion VARCHAR (20) NOT NULL
);

CREATE TABLE sucursal (
ID_Sucursal VARCHAR (04) NOT NULL PRIMARY KEY,
descripcion VARCHAR (20) NOT NULL
);

CREATE TABLE vendedores (
ID_Vendedor VARCHAR (02) NOT NULL PRIMARY KEY,
nombre VARCHAR (30) NOT NULL
);

CREATE TABLE facturas (
ID_Factura INT NOT NULL PRIMARY KEY,
cod_Factura VARCHAR (02) NOT NULL,
ID_Sucursal VARCHAR (04) NOT NULL,
tipo TEXT NOT NULL,
numero INT NOT NULL,
fecha DATETIME NOT NULL,
id_cliente INT NOT NULL,
ID_Vendedor VARCHAR (02) NOT NULL,
monto DECIMAL NOT NULL,
saldo DECIMAL NOT NULL,
CAE VARCHAR (20) NOT NULL,
fecha_Venc DATE NOT NULL,

FOREIGN KEY (cod_Factura) REFERENCES tipo_factura (cod_factura),
FOREIGN KEY (ID_Sucursal) REFERENCES sucursal (ID_Sucursal),
FOREIGN KEY (id_cliente) REFERENCES datos_cliente (id_cliente),
FOREIGN KEY (ID_Vendedor) REFERENCES vendedores (ID_Vendedor)
);

CREATE TABLE detalle_factura (
Nro_Registro INT NOT NULL PRIMARY KEY,
serie INT NOT NULL,
cantidad INT NOT NULL,
precio DECIMAL NOT NULL,
Desc_Aplicado DECIMAL NULL,
ID_Factura INT NOT NULL,
FOREIGN KEY (serie) REFERENCES articulos (serie),
FOREIGN KEY (ID_Factura) REFERENCES facturas (ID_Factura)
);

