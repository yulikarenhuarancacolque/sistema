
CREATE TABLE panaderia (
  id_panaderia int NOT NULL AUTO_INCREMENT,
  nit_panaderia varchar(20) NOT NULL,
  direccion varchar(25) NOT NULL,
  nombre varchar(25) NOT NULL,
  telefono varchar(20) NOT NULL,
  logo varchar(100) NOT NULL,
  pagina_web varchar(25) DEFAULT NULL,
  fec_insercion TIMESTAMP NOT NULL,
  fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_panaderia)
) ENGINE=InnoDB ;


CREATE TABLE clientes (
  id_cliente int NOT NULL AUTO_INCREMENT,
  id_panaderia int NOT NULL,
  direccion varchar(30) NOT NULL,
  nombres varchar(25) NOT NULL,
  apellidos varchar(25) NOT NULL,
  celular varchar(20) NOT NULL,
  nit varchar(20) DEFAULT NULL,
  fec_insercion TIMESTAMP NOT NULL,
 fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario int NOT NULL,
  estado char(1) NOT NULL,
  PRIMARY KEY (id_cliente),
FOREIGN KEY (id_panaderia) REFERENCES panaderia (id_panaderia)
) ENGINE=InnoDB  ;


CREATE TABLE pedidos (
  id_pedido int NOT NULL AUTO_INCREMENT,
  id_cliente int NOT NULL,
  direccion_envio varchar(25) NOT NULL,
  descuento float  DEFAULT NULL,
  fecha_pedido date NOT NULL,
  monto_pedido float NOT NULL,
  fec_insercion TIMESTAMP NOT NULL,
  fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario int NOT NULL,
  estado char(1) NOT NULL,
  PRIMARY KEY (id_pedido),
 FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
) ENGINE=InnoDB  ;


CREATE TABLE detalles_pedidos (
  id_detalle_pedido int NOT NULL AUTO_INCREMENT,
  id_pedido int NOT NULL,
  cantidad int NOT NULL,
  fec_insercion TIMESTAMP NOT NULL,
 fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 usuario int NOT NULL,
 estado char(1) NOT NULL,
  PRIMARY KEY (id_detalle_pedido),
 FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido)
) ENGINE=InnoDB ;


CREATE TABLE ventas (
  id_venta int NOT NULL AUTO_INCREMENT,
  id_cliente int NOT NULL,
  fecha_venta date NOT NULL,
  monto_venta float  NOT NULL,
  descuento float  DEFAULT NULL,
  fec_insercion TIMESTAMP NOT NULL,
fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 usuario int NOT NULL,
estado char(1) NOT NULL,
  PRIMARY KEY (id_venta),
 FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
) ENGINE=InnoDB  ;

CREATE TABLE detalles_ventas(
  id_detalle_venta int NOT NULL AUTO_INCREMENT,
  id_venta int NOT NULL,
  cantidad int NOT NULL,
  fec_insercion TIMESTAMP NOT NULL,
 fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 usuario int NOT NULL,
estado char(1) NOT NULL,
  PRIMARY KEY (id_detalle_venta),
 FOREIGN KEY (id_venta) REFERENCES ventas (id_venta)
) ENGINE=InnoDB ;


CREATE TABLE producto (
  id_producto int NOT NULL AUTO_INCREMENT,
  id_panaderia int NOT NULL,
  nombres varchar(25) NOT NULL,
  descripcion_producto varchar(40) DEFAULT NULL,
  fec_insercion TIMESTAMP NOT NULL,
 fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario int NOT NULL,
  estado char(1) NOT NULL,
  PRIMARY KEY (id_producto),
FOREIGN KEY (id_panaderia) REFERENCES panaderia (id_panaderia)
) ENGINE=InnoDB  ;

CREATE TABLE producto_precio(
  id_producto_precio int NOT NULL AUTO_INCREMENT,
  id_producto int NOT NULL,
  fecha_asignacion date NOT NULL,
  precio float  NOT NULL, 
  fec_insercion TIMESTAMP NOT NULL,
 fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 usuario int NOT NULL,
estado char(1) NOT NULL,
  PRIMARY KEY (id_producto_precio),
 FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
) ENGINE=InnoDB ;

CREATE TABLE ofertas (
  id_ofertas int NOT NULL AUTO_INCREMENT,
  id_producto int NOT NULL,
  descripcion varchar(25) NOT NULL,
  ofertas varchar(30) NOT NULL,
  fecha_inicio date NOT NULL,
  fecha_final date NOT NULL,
  fec_insercion TIMESTAMP NOT NULL,
  fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario int NOT NULL,
  estado char(1) NOT NULL,
  PRIMARY KEY (id_ofertas),
 FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
) ENGINE=InnoDB ;


CREATE TABLE propietario (
  id_propietario int NOT NULL AUTO_INCREMENT,
  id_panaderia int NOT NULL,
  direccion varchar(25) NOT NULL,
  nombres varchar(25) NOT NULL,
  apellidos varchar(25) DEFAULT NULL,
 celular varchar(20) NOT NULL,
 fec_insercion TIMESTAMP NOT NULL,
 fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 usuario int NOT NULL,
 estado char(1) NOT NULL,
  PRIMARY KEY (id_propietario),
FOREIGN KEY (id_panaderia) REFERENCES panaderia (id_panaderia)
) ENGINE=InnoDB  ;


CREATE TABLE proveedores_material (
  id_proveedor int NOT NULL AUTO_INCREMENT,
   id_panaderia int NOT NULL,
  direccion varchar(25) NOT NULL,
  nombres varchar(25) NOT NULL,
  apellidos varchar(25) DEFAULT NULL,
  celular varchar(20) NOT NULL,
  fec_insercion TIMESTAMP NOT NULL,
  fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario int NOT NULL,
  estado char(1) NOT NULL,
  PRIMARY KEY (id_proveedor),
FOREIGN KEY (id_panaderia) REFERENCES panaderia (id_panaderia)
) ENGINE=InnoDB  ;


CREATE TABLE trabajadores (
  id_trabajador int NOT NULL AUTO_INCREMENT,
  id_panaderia int NOT NULL,
  direccion varchar(30) NOT NULL,
  nombres varchar(25) NOT NULL,
  apellidos varchar(25) DEFAULT NULL,
  celular varchar(20) NOT NULL,
  cargo varchar(25) NOT NULL,
  fecha_inicio date NOT NULL,
  fecha_final date NOT NULL,
  fec_insercion TIMESTAMP NOT NULL,
  fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario int NOT NULL,
  estado char(1) NOT NULL,
  PRIMARY KEY (id_trabajador),
FOREIGN KEY (id_panaderia) REFERENCES panaderia (id_panaderia)
) ENGINE=InnoDB  ;

CREATE TABLE cargos (
  id_cargo int NOT NULL AUTO_INCREMENT,
  id_trabajador int NOT NULL,
  cargo varchar(25) NOT NULL,
  fec_insercion TIMESTAMP NOT NULL,
 fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 usuario int NOT NULL,
 estado char(1) NOT NULL,
  PRIMARY KEY (id_cargo),
FOREIGN KEY (id_trabajador) REFERENCES trabajadores (id_trabajador)
) ENGINE=InnoDB ;


CREATE TABLE obras(
id_obra INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(25)NOT NULL,
cod VARCHAR(10)NOT NULL,
monto FLOAT NOT NULL,
f_inicio DATE NOT NULL,
f_fin DATE NOT NULL,
descripcion VARCHAR(150),
direccion VARCHAR(25),
PRIMARY KEY(id_obra)
)ENGINE=INNODB;


CREATE TABLE herramientas(
id_herramienta INT NOT NULL AUTO_INCREMENT,
id_obra INT NOT NULL,
nombre VARCHAR(25)NOT NULL,
cantidad INT NOT NULL,
PRIMARY KEY(id_herramienta),
FOREIGN KEY(id_obra) REFERENCES obras(id_obra)
)ENGINE=INNODB;




/**/

CREATE TABLE personas (
  id_persona int NOT NULL AUTO_INCREMENT,
  id_panaderia int NOT NULL,
  ci varchar(20) NOT NULL,
  nombres varchar(25) NOT NULL,
   ap varchar(25) NOT NULL,
  am varchar(25) NOT NULL,
 direccion varchar(30) NOT NULL,
  telefono varchar(20) NOT NULL,
   genero char(1) NOT NULL ,
   fec_insercion TIMESTAMP NOT NULL,
fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 usuario int NOT NULL,
estado char(1) NOT NULL,
  PRIMARY KEY (id_persona),
FOREIGN KEY (id_panaderia ) REFERENCES panaderia (id_panaderia)
) ENGINE=InnoDB ;


CREATE TABLE usuarios(
  id_usuario INT AUTO_INCREMENT NOT NULL,
  id_persona INT NOT NULL,
  usuarios VARCHAR(20),
  clave VARCHAR(100),
  fec_insercion TIMESTAMP NOT NULL,
  fec_modif TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY(id_usuario),
  FOREIGN KEY(id_persona) REFERENCES personas(id_persona)
)ENGINE=INNODB;

CREATE TABLE roles(
  id_rol INT AUTO_INCREMENT NOT NULL,
  rol VARCHAR(20),
  fec_insercion TIMESTAMP NOT NULL,
  fec_modif TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY(id_rol)
  
)ENGINE=INNODB;

CREATE TABLE usuarios_roles(
  id_usuario_rol INT AUTO_INCREMENT NOT NULL,
  id_usuario INT NOT NULL,
  id_rol INT NOT NULL,
  fec_insercion TIMESTAMP NOT NULL,
  fec_modif TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY(id_usuario_rol),
  FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario),
  FOREIGN KEY(id_rol) REFERENCES roles(id_rol)
)ENGINE=INNODB;



CREATE TABLE bancos(
  id_banco INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(40) NOT NULL,
  direccion VARCHAR(50) NOT NULL,
  telefono VARCHAR(20),
  url VARCHAR(40),
  PRIMARY KEY(id_banco)
)ENGINE=INNODB;

CREATE TABLE sucursales(
  id_sucursal INT NOT NULL AUTO_INCREMENT,
  id_banco INT NOT NULL,
  sucursal VARCHAR(25) NOT NULL,
  direccion VARCHAR(50) NOT NULL,
  telefono VARCHAR(20),
  PRIMARY KEY(id_sucursal),
  FOREIGN KEY(id_banco) REFERENCES bancos (id_banco)
)ENGINE=INNODB;


CREATE TABLE grupos(
  id_grupo INT AUTO_INCREMENT NOT NULL,
  grupo VARCHAR(50),
  fec_insercion TIMESTAMP NOT NULL,
  fec_modif TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY(id_grupo)

)ENGINE=INNODB;

CREATE TABLE opciones(
  id_opcion INT AUTO_INCREMENT NOT NULL,
  id_grupo INT NOT NULL,
  opcion VARCHAR(100),
  contenido VARCHAR(100),
  orden VARCHAR(100),
  fec_insercion TIMESTAMP NOT NULL,
  fec_modif TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY(id_opcion),
  FOREIGN KEY(id_grupo) REFERENCES grupos(id_grupo)

)ENGINE=INNODB;
CREATE TABLE accesos(
  id_acceso INT AUTO_INCREMENT NOT NULL,
  id_opcion INT NOT NULL,
  id_rol INT NOT NULL,
  fec_insercion TIMESTAMP NOT NULL,
  fec_modif TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY(id_acceso),
  FOREIGN KEY(id_rol) REFERENCES roles(id_rol),
  FOREIGN KEY(id_opcion) REFERENCES opciones(id_opcion)
  )ENGINE=INNODB;




INSERT INTO panaderia VALUES(1,'12121','av. la paz','SAN ANDRES','67392352','logofinal.jpg','Pana80@.com.bo',now(), now(),1,1);
INSERT INTO panaderia VALUES(2,'12121','av. la paz','SAN ANDRES','67392352','logofinal.jpg','Pana80@.com.bo',now(), now(),1,1);
INSERT INTO panaderia VALUES(3,'12121','av. la paz','SAN ANDRES','67392352','logofinal.jpg','Pana80@.com.bo',now(), now(),1,1);
INSERT INTO panaderia VALUES(4,'12121','av. la paz','SAN ANDRES','67392352','logofinal.jpg','Pana80@.com.bo',now(), now(),1,1);
INSERT INTO panaderia VALUES(5,'12121','av. la paz','SAN ANDRES','67392352','logofinal.jpg','Pana80@.com.bo',now(), now(),1,1);
INSERT INTO panaderia VALUES(6,'12121','av. la paz','SAN ANDRES','67392352','logofinal.jpg','Pana80@.com.bo',now(), now(),1,1);
INSERT INTO panaderia VALUES(7,'12121','av. la paz','SAN ANDRES','67392352','logofinal.jpg','Pana80@.com.bo',now(), now(),1,1);
INSERT INTO panaderia VALUES(8,'12121','av. la paz','SAN ANDRES','67392352','logofinal.jpg','Pana80@.com.bo',now(), now(),1,1);
INSERT INTO panaderia VALUES(9,'12121','av. la paz','SAN ANDRES','67392352','logofinal.jpg','Pana80@.com.bo',now(), now(),1,1);
INSERT INTO panaderia VALUES(10,'12121','av. la paz','SAN ANDRES','67392352','logofinal.jpg','Pana80@.com.bo',now(), now(),1,1);


INSERT INTO clientes VALUES (1,1,'aAV,MONTES ','JUAN','RUEDA','79775756','123432',now(), now(), 1, 1);
INSERT INTO clientes VALUES (2,2,'AV. LA PAZ','PEDRO','INCA','68345634','324324',now(), now(), 1, 1);
INSERT INTO clientes VALUES (3,3,'SAN MARTIN ','ELIANA','FLORES','69123784','3455',now(), now(), 1, 1);
INSERT INTO clientes VALUES (4,4,'JUAN  ','DANIELA','POMA','61234232','434343',now(), now(), 1, 1);
INSERT INTO clientes VALUES (5,5,'SAN BERNARDO','JUANA','DUARTE','6448365','',now(), now(), 1, 1);
INSERT INTO clientes VALUES (6,6,'15 DE ABRIL','MARCOS','MARTINEZ','61948573','',now(), now(), 1, 1);
INSERT INTO clientes VALUES (7,7,'PEDRO ANTONIO','RAMIRO','JURADO','63246384','',now(), now(), 1, 1);
INSERT INTO clientes VALUES (8,8,'2 DE MAYO ','KAREN','VALDEZ','72342397','3244432',now(), now(), 1, 1);
INSERT INTO clientes VALUES (9,9,'LOURDES ','JHONY','CAMACHO','75372645','5665443',now(), now(), 1, 1);
INSERT INTO clientes VALUES (10,10,'ZAMORA','LUNA','MAMANI','72746253','4325543',now(), now(), 1, 1);


INSERT INTO pedidos VALUES (1,1,'JUAN PEPE','5', '2022-11-03' ,'23',now(), now(), 1, 1);
INSERT INTO pedidos VALUES (2,2,'JUAN PABLO','10','2022-11-02','11',now(), now(), 1, 1);
INSERT INTO pedidos VALUES (3,3,'AVAROA','12','2022-11-04' ,'13',now(), now(), 1, 1);
INSERT INTO pedidos VALUES (4,4,'MEJILLONES','13','2022-11-05' ,'24',now(), now(), 1, 1);
INSERT INTO pedidos VALUES (5,5,'LOURDES','14','2022-11-06' ,'25',now(), now(), 1, 1);
INSERT INTO pedidos VALUES (6,6,'AMERICA','15','2022-11-07' ,'27',now(), now(), 1, 1);
INSERT INTO pedidos VALUES (7,7,'FROILAN','16','2022-11-08' ,'28',now(), now(), 1, 1);
INSERT INTO pedidos VALUES (8,8,'CAMPESINO','17','2022-10-09' ,'29',now(), now(), 1, 1);
INSERT INTO pedidos VALUES (9,9,'JUAN 23','18','2022-08-10' ,'18',now(), now(), 1, 1);
INSERT INTO pedidos VALUES (10,10,'COLON','21','2022-12-13' ,'17',now(), now(), 1, 1);

INSERT INTO detalles_pedidos VALUES(1,1,'10',now(),now(),1,1);
INSERT INTO detalles_pedidos VALUES(2,2,'20',now(),now(),1,1);
INSERT INTO detalles_pedidos VALUES(3,3,'30',now(),now(),1,1);
INSERT INTO detalles_pedidos VALUES(4,4,'40',now(),now(),1,1);
INSERT INTO detalles_pedidos VALUES(5,5,'50',now(),now(),1,1);
INSERT INTO detalles_pedidos VALUES(6,6,'30',now(),now(),1,1);
INSERT INTO detalles_pedidos VALUES(7,7,'20',now(),now(),1,1);
INSERT INTO detalles_pedidos VALUES(8,8,'100',now(),now(),1,1);
INSERT INTO detalles_pedidos VALUES(9,9,'50',now(),now(),1,1);
INSERT INTO detalles_pedidos VALUES(10,10,'20',now(),now(),1,1);

INSERT INTO ventas VALUES (1,1,'2022-11-13','20','2',now(), now(), 1, 1);
INSERT INTO ventas VALUES (2,2,'2022-08-12','30','3',now(), now(), 1, 1);
INSERT INTO ventas VALUES (3,3,'2022-11-15','40','4',now(), now(), 1, 1);
INSERT INTO ventas VALUES (4,4,'2022-07-13','250','5',now(), now(), 1, 1);
INSERT INTO ventas VALUES (5,5,'2022-11-15','50','6',now(), now(), 1, 1);
INSERT INTO ventas VALUES (6,6,'2022-11-12','230','7',now(), now(), 1, 1);
INSERT INTO ventas VALUES (7,7,'2022-10-22','210','8',now(), now(), 1, 1);
INSERT INTO ventas VALUES (8,8,'2022-12-24','30','9',now(), now(), 1, 1);
INSERT INTO ventas VALUES (9,9,'2022-11-27','40','10',now(), now(), 1, 1);
INSERT INTO ventas VALUES (10,10,'2022-11-26','60','12',now(), now(), 1, 1);
 
INSERT INTO detalles_ventas VALUES(1,1,'10',now(),now(),1,1);
INSERT INTO detalles_ventas VALUES(2,2,'5',now(),now(),1,1);
INSERT INTO detalles_ventas VALUES(3,3,'100',now(),now(),1,1);
INSERT INTO detalles_ventas VALUES(4,4,'7',now(),now(),1,1);
INSERT INTO detalles_ventas VALUES(5,5,'5',now(),now(),1,1);
INSERT INTO detalles_ventas VALUES(6,6,'10',now(),now(),1,1);
INSERT INTO detalles_ventas VALUES(7,7,'60',now(),now(),1,1);
INSERT INTO detalles_ventas VALUES(8,8,'40',now(),now(),1,1);
INSERT INTO detalles_ventas VALUES(9,9,'100',now(),now(),1,1);
INSERT INTO detalles_ventas VALUES(10,10,'10',now(),now(),1,1);

INSERT INTO producto VALUES(1,1,'PAN REDONDO','',now(),now(),1,1);
INSERT INTO producto VALUES(2,2,'PAN FRANCES','',now(),now(),1,1);
INSERT INTO producto VALUES(3,3,'PAN COLIZA','',now(),now(),1,1);
INSERT INTO producto VALUES(4,4,'PAN GALLETA','',now(),now(),1,1);
INSERT INTO producto VALUES(5,5,'PAN CARACOL','',now(),now(),1,1);
INSERT INTO producto VALUES(6,6,'PAN HAMBURGUEZA','',now(),now(),1,1);
INSERT INTO producto VALUES(7,7,'PAN REDONDO','',now(),now(),1,1);
INSERT INTO producto VALUES(8,8,'PAN COLIZA','',now(),now(),1,1);
INSERT INTO producto VALUES(9,9,'PAN CAUCA','',now(),now(),1,1);
INSERT INTO producto VALUES(10,10,'PAN GALLETA','',now(),now(),1,1);

INSERT INTO producto_precio VALUES (1,1,'2022-04-10','1.00',now(), now(), 1, 1);
INSERT INTO producto_precio VALUES (2,2,'2022-04-10','1.00',now(), now(), 1, 1);
INSERT INTO producto_precio VALUES (3,3,'2022-04-10','2.00',now(), now(), 1, 1);
INSERT INTO producto_precio VALUES (4,4,'2022-04-10','1.00',now(), now(), 1, 1);
INSERT INTO producto_precio VALUES (5,5,'2022-04-10','1.00',now(), now(), 1, 1);
INSERT INTO producto_precio VALUES (6,6,'2022-04-10','1.00',now(), now(), 1, 1);
INSERT INTO producto_precio VALUES (7,7,'2022-04-10','1.00',now(), now(), 1, 1);
INSERT INTO producto_precio VALUES (8,8,'2022-04-10','1.00',now(), now(), 1, 1);
INSERT INTO producto_precio VALUES (9,9,'2022-04-10','1.00',now(), now(), 1, 1);
INSERT INTO producto_precio VALUES (10,10,'2022-04-10','1.0',now(), now(), 1, 1);

INSERT INTO ofertas VALUES (1,1,'2x1','oferta dia padre','2022-03-31','2022-04-30',now(), now(), 1, 1);
INSERT INTO ofertas VALUES (2,1,'2x3','oferta','2022-03-01','2022-04-24',now(), now(), 1, 1);
INSERT INTO ofertas VALUES (3,1,'','oferta del dia','2022-03-11','2022-04-26',now(), now(), 1, 1);
INSERT INTO ofertas VALUES (4,1,'2x3','oferta mes','2022-03-13','2022-04-23',now(), now(), 1, 1);
INSERT INTO ofertas VALUES (5,1,'2x1','oferta dia madre','2022-03-15','2022-04-28',now(), now(), 1, 1);
INSERT INTO ofertas VALUES (6,1,'2x1','oferta padre','2022-03-17','2022-04-16',now(), now(), 1, 1);
INSERT INTO ofertas VALUES (7,1,'3x2','oferta','2022-03-18','2022-04-18',now(), now(), 1, 1);
INSERT INTO ofertas VALUES (8,1,'','oferta','2022-03-22','2022-04-22',now(), now(), 1, 1);
INSERT INTO ofertas VALUES (9,1,'2x1','oferta dia madre','2022-03-26','2022-04-18',now(), now(), 1, 1);
INSERT INTO ofertas VALUES (10,1,'2x1','oferta','2022-03-23','2022-04-29',now(), now(), 1, 1);


INSERT INTO propietario VALUES (1,1,'AV.MONTES ','JUAN','RUEDA','79775756',now(), now(), 1, 1);
INSERT INTO propietario VALUES (2,2,'AV.MONTES ','MAITE','MAMANI','74535756',now(), now(), 1, 1);
INSERT INTO propietario VALUES (3,3,'AV.MONTES ','JUAN','COLQUE','73677756',now(), now(), 1, 1);
INSERT INTO propietario VALUES (4,4,'AV.MONTES ','ANA','PANTOJA','79433336',now(), now(), 1, 1);
INSERT INTO propietario VALUES (5,5,'AV.MONTES ','RAMIRO','AVIS','79755466',now(), now(), 1, 1);
INSERT INTO propietario VALUES (6,6,'AV.MONTES ','ANDRES','RODRIGUES','79775756',now(), now(), 1, 1);
INSERT INTO propietario VALUES (7,7,'AV.MONTES ','JUANA','RUEDA','79775756',now(), now(), 1, 1);
INSERT INTO propietario VALUES (8,8,'AV.MONTES ','MIKAELA','RUEDA','79775756',now(), now(), 1, 1);
INSERT INTO propietario VALUES (9,9,'AV.MONTES ','DALIA','FLORES','79775756',now(), now(), 1, 1);
INSERT INTO propietario VALUES (10,10,'AV.MONTES ','DANIELA','HUARANCA','79775756',now(), now(), 1, 1);

INSERT INTO proveedores_material VALUES (1,1,'AV.LAZ PAZ ','JUAN','RUEDA','79775756',now(), now(), 1, 1);
INSERT INTO proveedores_material VALUES (2,2,'LAS PASCUAS ','MARIA','SANCHEZ','633775756',now(), now(), 1, 1);
INSERT INTO proveedores_material VALUES (3,3,'AV. CIRCUNVALACION','JUANITA','PERALES','63487756',now(), now(), 1, 1);
INSERT INTO proveedores_material VALUES (4,4,'AV.AMERICAS ','PAOLA','RUEDA','63445756',now(), now(), 1, 1);
INSERT INTO proveedores_material VALUES (5,5,'AV.RICADO ','BENITO','MAMANI','79352355',now(), now(), 1, 1);
INSERT INTO proveedores_material VALUES (6,6,'AV.RICADO ','EDUARDO','COLQUE','79732532',now(), now(), 1, 1);
INSERT INTO proveedores_material VALUES (7,7,'AV.RICADO ','PEDRO','MAMANI','64234434',now(), now(), 1, 1);
INSERT INTO proveedores_material VALUES (8,8,'AV.RICADO ','JUALIAN','JUAREZ','79734432',now(), now(), 1, 1);
INSERT INTO proveedores_material VALUES (9,9,'AV.RICADO ','PEDRO','MAMANI','79432555',now(), now(), 1, 1);
INSERT INTO proveedores_material VALUES (10,10,'AV.RICADO ','JUAN','ORCO','74532664',now(), now(), 1, 1);

INSERT INTO trabajadores VALUES (1,1,'B. 1 DE MAYO','MARIA','MONTERO','79775756','ADMINISTRADOR','2021-11-12','2022-09-10',now(), now(), 1, 1);
INSERT INTO trabajadores VALUES (2,2,'B. 16 JULIO','JOSE','JURADO','79775756','SECRETARIA','2021-01-12','2022-08-14',now(), now(), 1, 1);
INSERT INTO trabajadores VALUES (3,3,'B. 2 DE MAYO','JULIA','HUANCA','79775756','AYUDANTE','2021-11-15','2022-09-17',now(), now(), 1, 1);
INSERT INTO trabajadores VALUES (4,4,'B. LAS PAZCUAS','MIKAELA','CONDORI','79775756','AYUDANTE','2021-12-16','2022-11-10',now(), now(), 1, 1);
INSERT INTO trabajadores VALUES (5,5,'B. HUERTA','MARIA','MARTINEZ','79775756','AYUDANTE','2022-11-19','2022-10-13',now(), now(), 1, 1);
INSERT INTO trabajadores VALUES (6,6,'B. 1 DE MAYO','MARIA','MONTERO','79775756','ADMINISTRADOR','2021-11-12','2022-09-10',now(), now(), 1, 1);
INSERT INTO trabajadores VALUES (7,7,'B. 16 JULIO','JOSE','JURADO','79775756','SECRETARIA','2021-01-12','2022-08-14',now(), now(), 1, 1);
INSERT INTO trabajadores VALUES (8,8,'B. 2 DE MAYO','JULIA','HUANCA','79775756','AYUDANTE','2021-11-15','2022-09-17',now(), now(), 1, 1);
INSERT INTO trabajadores VALUES (9,9,'B. LAS PAZCUAS','MIKAELA','CONDORI','79775756','AYUDANTE','2021-12-16','2022-11-10',now(), now(), 1, 1);
INSERT INTO trabajadores VALUES (10,10,'B. HUERTA','MARIA','MARTINEZ','79775756','AYUDANTE','2022-11-19','2022-10-13',now(), now(), 1, 1);


INSERT INTO cargos VALUES(1,1,'ADMINISTRADOR',now(),now(),1,1);
INSERT INTO cargos VALUES(2,2,'SECRETARIA',now(),now(),1,1);
INSERT INTO cargos VALUES(3,3,'AYUDANTE',now(),now(),1,1);
INSERT INTO cargos VALUES(4,4,'AYUDANTE',now(),now(),1,1);
INSERT INTO cargos VALUES(5,5,'AYUDANTE',now(),now(),1,1);
INSERT INTO cargos VALUES(6,6,'ADMINISTRADOR',now(),now(),1,1);
INSERT INTO cargos VALUES(7,7,'SECRETARIA',now(),now(),1,1);
INSERT INTO cargos VALUES(8,8,'AYUDANTE',now(),now(),1,1);
INSERT INTO cargos VALUES(9,9,'AYUDANTE',now(),now(),1,1);
INSERT INTO cargos VALUES(10,10,'AYUDANTE',now(),now(),1,1);

INSERT INTO obras VALUES(1, 'CASA FAMILIAR','COD-1','10.000','2019-01-12','2023-01-23','REMODELACION','AV/CIRCUNVALACION');
INSERT INTO obras VALUES(2, 'OFICINA','COD-2','34.000','2019-01-13','2023-01-24','REFACCION','CALLE SUIPACHA');
INSERT INTO obras VALUES(3, 'EDIFICIO','COD-3','10.000','2019-01-14','2023-01-25','PINTURA','CALLE COLON');
INSERT INTO obras VALUES(4, 'ESTACIONAMIENTO','COD-4','10.000','2019-01-15','2023-01-26','TODO DE 0','CALLE MEXICO');
INSERT INTO obras VALUES(5, 'RESIDENCIA','COD-5','10.000','2019-01-16','2023-01-27','DE INICIO','C/ AVAROA');
INSERT INTO obras VALUES(6, 'COLEGIO','COD-6','10.000','2019-01-17','2023-01-28','COMPLETO','C/DELFIN');
INSERT INTO obras VALUES(7, 'INSTITUTO','COD-7','10.000','2019-01-18','2023-01-29','TECHADO','C/ AVAROA');
INSERT INTO obras VALUES(8, 'REMODELACION','COD-8','10.000','2019-01-19','2023-01-30','SOLO PISO','C/ BARRIAL');
INSERT INTO obras VALUES(9, 'ALMACEN','COD-9','10.000','2019-01-20','2023-01-31','GRADAS','C/ LINO');
INSERT INTO obras VALUES(10,'UNIVERSIDAD','COD-10','10.000','2019-01-21','2023-02-01','CASADE 2 PISOS','C/POSTUGAL');

INSERT INTO herramientas VALUES(1,1, 'pala','2');
INSERT INTO herramientas VALUES(2,2, 'pico','3');
INSERT INTO herramientas VALUES(3,3, 'martillo','4');
INSERT INTO herramientas VALUES(4,4, 'tenaza','6');
INSERT INTO herramientas VALUES(5,5, 'frotacho','33');
INSERT INTO herramientas VALUES(6,6, 'valdes','54');
INSERT INTO herramientas VALUES(7,7, 'combo','35');
INSERT INTO herramientas VALUES(8,8, 'plancha','33');
INSERT INTO herramientas VALUES(9,9, 'vibradora','2');
INSERT INTO herramientas VALUES(10,10, 'sierra','22');




/**/


INSERT INTO personas VALUES(1, 1, '10657288', 'YULI KAREN', 'HUARANCA', 'COLQUE', '69334597', 'B.1 DE MAYO' , 'F' , now(), now(), 1,1);
INSERT INTO personas VALUES(2, 2, '10654348', ' KAREN', 'HUARACHI', 'COLQUE', '69334597', 'B.2 DE MAYO' , 'F', now(), now(), 1,1);
INSERT INTO personas VALUES(3, 3, '10621338', ' KARINA', 'MOLLO', 'HUARANI', '69332297', 'B.3 DE MAYO' , 'F', now(), now(), 1,1);
INSERT INTO personas VALUES(4, 4, '10652126', ' KAREN', 'SEGOVIA', 'MAMANI', '69336797', 'B.6 DE MAYO' , 'F', now(), now(), 1,1);
INSERT INTO personas VALUES(5, 5, '10656565', 'RAMIRO', 'MENDEZ', 'CONDORI', '69346697', 'B.7 DE MAYO', 'M' , now(), now(), 1,1);
INSERT INTO personas VALUES(6, 6, '10657645', 'BENITO', 'ARCE', 'COLQUE', '69334454', 'B.8DE MAYO', 'M' , now(), now(), 1,1);
INSERT INTO personas VALUES(7, 7, '10657667', 'MARTHA', 'HUARANCA', 'SUARES', '69654597', 'B.4 DE MAYO' , 'F', now(), now(), 1,1);
INSERT INTO personas VALUES(8, 8, '10657276', 'ELIANA', 'ARCO', 'COLQUE', '69334677', 'B.6 DE MAYO', 'F' , now(), now(), 1,1);
INSERT INTO personas VALUES(9, 9, '10657256', 'DALIA', 'JAURES', 'COLQUE', '69332397', 'B.7 DE MAYO' , 'F', now(), now(), 1,1);
INSERT INTO personas VALUES(10, 10, '10657265', 'JUAN', 'CRUZ', 'COLQUE', '69334532', 'B.2 DE MAYO', 'M' , now(), now(), 1,1);

INSERT INTO usuarios VALUES(1, 1, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', now(), now(), 1, 1);
INSERT INTO usuarios VALUES(2, 2, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', now(), now(), 1, 1);
INSERT INTO usuarios VALUES(3, 3, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', now(), now(), 1, 1);
INSERT INTO usuarios VALUES(4, 4, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', now(), now(), 1, 1);
INSERT INTO usuarios VALUES(5, 5, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', now(), now(), 1, 1);
INSERT INTO usuarios VALUES(6, 6, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', now(), now(), 1, 1);
INSERT INTO usuarios VALUES(7, 7, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', now(), now(), 1, 1);
INSERT INTO usuarios VALUES(8, 8, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', now(), now(), 1, 1);
INSERT INTO usuarios VALUES(9, 9, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', now(), now(), 1, 1);
INSERT INTO usuarios VALUES(10, 10, 'admin', '$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK', now(), now(), 1, 1);

INSERT INTO roles VALUES (1, 'ADMINISTRADOR', now(), now(), 1, 1);

INSERT INTO usuarios_roles VALUES (1, 1, 1, now(), now(), 1, 1);




INSERT INTO bancos VALUES (1, 'BANCO UNION', 'CALLE LA MADRID', '66-98904', 'www.banco_union.com');
INSERT INTO bancos VALUES (2, 'BANCO MERCANTIL SANTA CRUZ', 'CALLE SUCRE', '66-30989', 'www.banco_mercantil_sta.com');
INSERT INTO bancos VALUES (3, 'BANCO DE CREDITO', 'CALLE GRAL TRIGO', '66-49800', 'www.banco_credito.com');
INSERT INTO bancos VALUES (4, 'BANCO BISA', 'CALLE GRAL TRIGO', '66-47896', 'www.banco_bisa.com');
INSERT INTO bancos VALUES (5, 'BANCO NACIONAL DE BOLIVIA', 'CALLE SUCRE', '66-34567', 'www.banco_bnb.com');
INSERT INTO bancos VALUES (6, 'BANCO UNION', 'CALLE LA MADRID', '66-98904', 'www.banco_union.com');
INSERT INTO bancos VALUES (7, 'BANCO MERCANTIL SANTA CRUZ', 'CALLE SUCRE', '66-30989', 'www.banco_mercantil_sta.com');
INSERT INTO bancos VALUES (8, 'BANCO DE CREDITO', 'CALLE GRAL TRIGO', '66-49800', 'www.banco_credito.com');
INSERT INTO bancos VALUES (9, 'BANCO BISA', 'CALLE GRAL TRIGO', '66-47896', 'www.banco_bisa.com');
INSERT INTO bancos VALUES (10, 'BANCO NACIONAL DE BOLIVIA', 'CALLE SUCRE', '66-34567', 'www.banco_bnb.com');

INSERT INTO sucursales VALUES (1, 1, 'CENTRAL', 'C. GENERAL TRIGO', '423424');
INSERT INTO sucursales VALUES (2, 1, 'B. JUAN XXIII', 'B. JUAN XXIII', '546463');
INSERT INTO sucursales VALUES (3, 1, 'B. PALMARCITO', 'B. PALMARCITO', '5688222');
INSERT INTO sucursales VALUES (4, 2, 'CENTRAL', 'C. SUCRE', '423424');
INSERT INTO sucursales VALUES (5, 2, 'M. CAMPESIONO', 'M. CAMPESINO', '547577');
INSERT INTO sucursales VALUES (6, 3, 'CENTRAL', 'C. SUCRE', '4388221');
INSERT INTO sucursales VALUES (7, 4, 'CENTRAL', 'C. GENERAL TRIGO', '575675');
INSERT INTO sucursales VALUES (8, 4, 'B. AEROPUERTO', 'AV. LAS AMERICAS', '6436447');
INSERT INTO sucursales VALUES (9, 5, 'CENTRAL', 'C. SUCRE', '345353');
INSERT INTO sucursales VALUES (10, 5, 'B.SENAC', 'AV. PRINCIPAL', '45756475');  



INSERT INTO grupos VALUES (1, 'HERRAMIENTAS',now(), now(), 1, 1);
INSERT INTO grupos VALUES (2, 'PARAMENTRO', now(), now(), 1, 1);
INSERT INTO grupos VALUES (3, 'PANADERIA',now(), now(), 1, 1);
INSERT INTO grupos VALUES (4, 'REPORTES',now(), now(), 1, 1);
INSERT INTO grupos VALUES (5, 'EVA_TERCER_BIMESTRE',now(), now(), 1, 1);


INSERT INTO opciones VALUES(1, 1, 'PERSONAS', '../privada/personas/personas.php',10, now(), now(), 1, 1);
INSERT INTO opciones VALUES (2, 1, 'USUARIOS', '../privada/usuarios/usuarios.php',20, now(), now(), 1, 1);
INSERT INTO opciones VALUES (3, 1, 'GRUPOS', '../privada/grupos/grupos.php',30, now(), now(), 1, 1);
INSERT INTO opciones VALUES (4, 1, 'ROLES', '../privada/roles/roles.php',40,now(), now(), 1, 1);
INSERT INTO opciones VALUES (5, 1, 'USUARIOS ', '../privada/usuarios_roles/usuarios_roles.php',50, now(), now(), 1, 1);
INSERT INTO opciones VALUES (6, 1, 'OPCIONES', '../privada/opciones/opciones.php',60, now(), now(), 1, 1);
INSERT INTO opciones VALUES (7, 1, 'ACCESOS', '../privada/accesos/accesos.php',70,now(), now(), 1, 1);

INSERT INTO opciones VALUES (8, 2, 'PRODUCTO', '../privada/producto/producto.php', 10, now(), now(), 1, 1); 
INSERT INTO opciones VALUES (9, 2, 'OFERTAS', '../privada/ofertas/ofertas.php', 20, now(), now(), 1, 1);
INSERT INTO opciones VALUES (10, 2, 'PRODUCTO_PRECIO', '../privada/producto_precio/producto_precio.php', 30, now(), now(), 1, 1);
INSERT INTO opciones VALUES (11, 2, ' PROPIETARIO', '../privada/propietario/propietario.php',40, now(), now(), 1, 1); 
INSERT INTO opciones VALUES (12, 2, ' PROVEEDORES_MATERIAL', '../privada/proveedores_material/proveedores_material.php', 50, now(), now(), 1, 1);
INSERT INTO opciones VALUES (13, 2, 'CLIENTES', '../privada/clientes/clientes.php', 60, now(), now(), 1, 1);

INSERT INTO opciones VALUES (14, 3, 'PANADERIA', '../privada/panaderia/panaderia.php', 10, now(), now(), 1, 1);
INSERT INTO opciones VALUES (15, 3, 'VENTAS', '../privada/ventas/ventas.php', 20, now(), now(), 1, 1);
INSERT INTO opciones VALUES (16, 3, 'PEDIDOS', '../privada/pedidos/pedidos.php', 30, now(), now(), 1, 1);
INSERT INTO opciones VALUES (17, 3, 'TRABAJADORES', '../privada/trabajadores/trabajadores.php', 40, now(), now(), 1, 1);
INSERT INTO opciones VALUES (18, 3, 'CARGOS', '../privada/cargos/cargos.php', 50, now(), now(), 1, 1);

INSERT INTO opciones VALUES (19, 4, 'PERSONAS_USUARIOS', '../privada/reportes/personas_usuarios.php', 10, now(), now(), 1, 1);
INSERT INTO opciones VALUES(20, 4, 'REPORTES DE PERSONAS CON FECHAS DE INSERCION', '../privada/reportes/personas_fechas.php',20, now(), now(), 1, 1);
INSERT INTO opciones VALUES(21, 4, 'TRABAJADORES_CARGOS', '../privada/reportes/trabajadores_cargos.php', 30, now(), now(), 1, 1);
INSERT INTO opciones VALUES(22, 4, 'REPORTES DE TRABJADORES CON FECHAS DE INSERCION', '../privada/reportes/trabajadores_fechas.php',40, now(), now(), 1, 1);
INSERT INTO opciones VALUES(23, 4, 'PERSONAS--GENERO', '../privada/reportes/rpt_personas_genero.php', 50, now(), now(), 1, 1);
INSERT INTO opciones VALUES(24, 4, 'TRABAJADORES--CARGO', '../privada/reportes/rpt_trabajadores_cargos.php', 60, now(), now(), 1, 1);
INSERT INTO opciones VALUES(25, 4, 'FICHA_TECNICA_PERSONAS', '../privada/reportes/ficha_tec_personas.php', 70, now(), now(), 1, 1);
INSERT INTO opciones VALUES(26, 4, 'FICHA_TECNICA_PRODUCTO', '../privada/reportes/ficha_tec_producto.php', 80, now(), now(), 1, 1);


INSERT INTO opciones VALUES (27, 5, 'Ficha Técnica Herramientas', '../privada/herramientas/ficha_tec_herramientas.php', 10, now(), now(), 1, 1);
INSERT INTO opciones VALUES(28, 5, 'Rpt x Herramientas', '../privada/obras/rpt_obras.php',20, now(), now(), 1, 1);
INSERT INTO opciones VALUES (29, 5, 'SEGUROS', '../privada/seguros/seguros.php', 30, now(), now(), 1, 1);
INSERT INTO opciones VALUES(30, 5, 'CLIENTES1', '../privada/clientes1/clientes1.php',40, now(), now(), 1, 1);



INSERT INTO accesos VALUES(1,1,1,now(),now(),1,1);
INSERT INTO accesos VALUES(2,2,1,now(),now(),1,1);
INSERT INTO accesos VALUES(3,3,1,now(),now(),1,1);
INSERT INTO accesos VALUES(4,4,1,now(),now(),1,1);
INSERT INTO accesos VALUES(5,5,1,now(),now(),1,1);
INSERT INTO accesos VALUES(6,6,1,now(),now(),1,1);
INSERT INTO accesos VALUES(7,7,1,now(),now(),1,1);
INSERT INTO accesos VALUES(8,8,1,now(),now(),1,1);
INSERT INTO accesos VALUES(9,9,1,now(),now(),1,1);
INSERT INTO accesos VALUES(10,10,1,now(),now(),1,1);
INSERT INTO accesos VALUES(11,11,1,now(),now(),1,1);
INSERT INTO accesos VALUES(12,12,1,now(),now(),1,1);
INSERT INTO accesos VALUES(13,13,1,now(),now(),1,1);
INSERT INTO accesos VALUES(14,14,1,now(),now(),1,1);
INSERT INTO accesos VALUES(15,15,1,now(),now(),1,1);
INSERT INTO accesos VALUES(16,16,1,now(),now(),1,1);
INSERT INTO accesos VALUES(17,17,1,now(),now(),1,1);
INSERT INTO accesos VALUES(18,18,1,now(),now(),1,1);
INSERT INTO accesos VALUES(19,19,1,now(),now(),1,1);
INSERT INTO accesos VALUES(20,20,1,now(),now(),1,1);
INSERT INTO accesos VALUES(21,21,1,now(),now(),1,1);
INSERT INTO accesos VALUES(22,22,1,now(),now(),1,1);
INSERT INTO accesos VALUES(23,23,1,now(),now(),1,1);
INSERT INTO accesos VALUES(24,24,1,now(),now(),1,1);
INSERT INTO accesos VALUES(25,25,1,now(),now(),1,1);
INSERT INTO accesos VALUES(26,26,1,now(),now(),1,1);
INSERT INTO accesos VALUES(27,27,1,now(),now(),1,1);
INSERT INTO accesos VALUES(28,28,1,now(),now(),1,1);
INSERT INTO accesos VALUES(29,29,1,now(),now(),1,1);
INSERT INTO accesos VALUES(30,30,1,now(),now(),1,1);