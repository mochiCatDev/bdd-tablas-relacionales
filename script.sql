-- PARTE 1: crear la base de datos
create database biblioteca_db;

-- PARTE 2: crear tablas

-- crear la tabla libros
create table libros (
    codigo varchar(5) primary key,
    titulo varchar(50) not null,
    pagina int not null
);

-- crear la tabla autores
create table autores (
    id int primary key,
    nombre varchar(50) not null,
    pais varchar(30) not null
);