/*Los siguientes queries son los necesarios para poder replicar todas las beses de datos de consulta de LAATS, para que este
proceso funcione correctamente es necesario correr lo queries en el orden que aparecen, para tener una mejor comprension ver el 
diagrama de las bases de datos adjunta en esta carpeta.*/

/*QUERY PARA REPLICAR 'operadores'*/
CREATE TABLE operadores (
    id_operador int NOT NULL IDENTITY(1, 1),
    nombre_operador varchar(37),
    CONSTRAINT PK_id_operador PRIMARY KEY (id_operador)
);

/*QUERY PARA REPLICAR 'aeronaves'*/
CREATE TABLE aeronaves (
    id_aeronave int not null IDENTITY(1, 1),
    tipo_aeronave varchar(13),
    operador int, 
    FOREIGN KEY (operador) REFERENCES operadores(id_operador)
);

/*QUERY PARA REPLICAR 'matriculas'*/
CREATE TABLE matriculas (
    id_matricula int not null IDENTITY(1, 1),
    matricula varchar(11),
    operador int, 
    FOREIGN KEY (operador) REFERENCES operadores(id_operador)
);

/*QUERY PARA REPLICAR 'vuelos'*/
CREATE TABLE vuelos (
    id_vuelo int not null IDENTITY(1, 1),
    no_vuelo varchar(11),
    operador int, 
    FOREIGN KEY (operador) REFERENCES operadores(id_operador)
);

/*QUERY PARA REPLICAR 'tipos_equipos'*/
CREATE TABLE tipos_equipos (
    id_tipos_equipos int not null IDENTITY(0, 1),
    descripcion varchar(35)
    CONSTRAINT PK_id_tipos_equipos PRIMARY KEY (id_tipos_equipos)
);

/*QUERY PARA REPLICAR 'tipos_combustibles'*/
CREATE TABLE tipos_combustibles (
    id_tipos_combustibles int not null IDENTITY(0, 1),
    descripcion varchar(11)
    CONSTRAINT PK_id_tipos_combustibles PRIMARY KEY (id_tipos_combustibles)
);

/*QUERY PARA REPLICAR 'equipos'*/
CREATE TABLE equipos (
    id_equipos int not null IDENTITY(1, 1),
    codigo_unidad varchar(8),
    tipo_unidad int,
    motorizado BIT default 'false',
    tipo_combustible int,
    departamento varchar(8),
    no_activo varchar(15)
    FOREIGN KEY (tipo_unidad) REFERENCES tipos_equipos(id_tipos_equipos)
    FOREIGN KEY (tipo_combustible) REFERENCES tipos_combustibles(id_tipos_combustibles)
);

/*QUERY PARA REPLICAR 'Personal_General'*/
CREATE TABLE Personal_General (
    codigo_empleado int,
    nombre varchar(35),
    /*apellido varchar(15),*/
    dpi varchar(14),
    puesto varchar(40),
    fecha_inicio DATE,
    fecha_nacimiento DATE,
    departamento varchar(10),
    tipo_personal varchar(17)
    CONSTRAINT PK_codigo_empleado PRIMARY KEY (codigo_empleado)
);

/*QUERY PARA REPLICAR 'usuarios'*/
CREATE TABLE usuarios (
    id_usuario int,
    usuario varchar(38),
    pin int,
    permisos_administrador BIT default 'false',
    FOREIGN KEY (id_usuario) REFERENCES Personal_General(codigo_empleado)
);
