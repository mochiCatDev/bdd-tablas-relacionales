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

-- PARTE 4: insertar datos iniciales

-- insertar registros en libros (mínimo 4)
insert into libros (codigo, titulo, pagina)
values
('L001', 'Cien años de soledad', 417),
('L002', 'La casa de los espíritus', 368),
('L003', 'Ficciones', 215),
('L004', 'El amor en los tiempos del cólera', 348);

-- insertar registros en autores (mínimo 3)
insert into autores (id, nombre, pais)
values
(1, 'Gabriel García Márquez', 'Colombia'),
(2, 'Isabel Allende', 'Chile'),
(3, 'Jorge Luis Borges', 'Argentina');

-- insertar registros en libro_autor (mínimo 5 relaciones)
insert into libro_autor (la_libro_codigo_fk, la_autor_id_fk, anio_publicacion)
values 
('L001', 1, 1967), -- 1
('L002', 2, 1982), -- 2
('L003', 3, 1944), -- 3
('L004', 1, 1985), -- 4
('L001', 3, 1950); -- 5