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

-- PARTE 3: crear tabla de rompimiento
-- postdata - relación de muchos a muchos
create table libro_autor (
    la_libro_codigo_fk varchar(5) not null,
    la_autor_id_fk int not null,
    anio_publicacion int not null,
    primary key (la_libro_codigo_fk, la_autor_id_fk),
    foreign key (la_libro_codigo_fk) references libros(codigo),
    foreign key (la_autor_id_fk) references autores(id)
);
