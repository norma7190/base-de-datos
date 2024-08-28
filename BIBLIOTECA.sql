create database db_biblioteca;
use db_biblioteca;
create table autor (
    id_autor int primary key auto_increment not null,
    nombre varchar(50) not null,
    primer_nombre varchar(50) null,
    apellido varchar(50) null,
    correo varchar(50) null,
    telefono varchar(11) null,
    creado_en datetime default current_timestamp,
    actualizado_en datetime default current_timestamp on update current_timestamp
);
create table libros (
    id_libro int primary key auto_increment not null,
    id_autor int not null,
    codigo_libro varchar(10) not null,
    nombre varchar(50) not null,
    titulo varchar(100) not null,
    editorial date not null,
    isbn char(13) null,
    foreign key (id_autor) references autor(id_autor),
    creado_en datetime default current_timestamp,
    actualizado_en datetime default current_timestamp on update current_timestamp
);

create table usuario (
    id_usuario int primary key auto_increment not null,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni varchar(8) not null unique,
    direccion varchar(100) null,
    telefono varchar(11) null,
    email varchar(50) null,
    creado_en datetime default current_timestamp,
    actualizado_en datetime default current_timestamp on update current_timestamp
);

create table prestamo (
    id_prestamo int primary key auto_increment not null,
    id_libro int not null,
    id_usuario int not null,
    fecha_prestamo date not null,
    fecha_devolucion date null,
    estado enum('prestado', 'devuelto') not null default 'prestado',
    foreign key (id_libro) references libros(id_libro) on delete cascade on update cascade,
    foreign key (id_usuario) references usuario(id_usuario) on delete cascade on update cascade,
    creado_en datetime default current_timestamp,
    actualizado_en datetime default current_timestamp on update current_timestamp
);