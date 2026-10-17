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

-- insertar registros en libros
insert into libros (codigo, titulo, pagina)
values
('L001', 'Cien años de soledad', 417),
('L002', 'La casa de los espíritus', 368),
('L003', 'Ficciones', 215),
('L004', 'El amor en los tiempos del cólera', 348),
('L005', 'Revolución en la Red', 280),
('L006', 'El Futuro de la IA', 310);

-- insertar registros en autores
insert into autores (id, nombre, pais)
values
(1, 'Gabriel García Márquez', 'Colombia'),
(2, 'Isabel Allende', 'Chile'),
(3, 'Jorge Luis Borges', 'Argentina'),
(4, 'Mariana Enríquez', 'Argentina');

-- insertar registros en libro_autor
insert into libro_autor (la_libro_codigo_fk, la_autor_id_fk, anio_publicacion)
values 
('L001', 1, 1967), -- 1
('L002', 2, 1982), -- 2
('L003', 3, 1944), -- 3
('L004', 1, 1985), -- 4
('L001', 3, 1950), -- 5
('L005', 4, 2021), -- 6
('L006', 4, 2023); -- 7

-- PARTE 5: consultas SQL

-- consulta 1: mostrar título del libro, nombre del autor, país y año de publicación usando inner join
select l.titulo as titulo_libro, a.nombre as nombre_autor, a.pais, la.anio_publicacion
from libro_autor la
inner join libros l on la.la_libro_codigo_fk = l.codigo
inner join autores a on la.la_autor_id_fk = a.id;

-- consulta 2: mostrar únicamente libros publicados después del año 2020
select l.titulo, la.anio_publicacion
from libro_autor la
inner join libros l on la.la_libro_codigo_fk = l.codigo
where la.anio_publicacion > 2020;

-- consulta 3: mostrar únicamente autores de un país específico usando where
select * 
from autores 
where pais = 'Colombia';

-- consulta 4: ordenar los libros por año de publicación descendente
select l.titulo, la.anio_publicacion
from libro_autor la
inner join libros l on la.la_libro_codigo_fk = l.codigo
order by la.anio_publicacion desc;

-- consulta 5: contar cuántos libros tiene cada autor utilizando count() y group by
select a.nombre as autor, count(la.la_libro_codigo_fk) as total_libros
from autores a
left join libro_autor la on a.id = la.la_autor_id_fk
group by a.id, a.nombre;

-- PARTE 6: modificación de la tabla

-- agregar una nueva columna llamada precio a la tabla libros
alter table libros add column precio double precision;

-- actualizar mínimo 3 precios de los libros existentes
update libros set precio = 25.50 where codigo = 'L001';
update libros set precio = 18.90 where codigo = 'L002';
update libros set precio = 30.00 where codigo = 'L003';

-- realizar un select mostrando el título y el precio
select titulo, precio 
from libros 
where precio is not null;