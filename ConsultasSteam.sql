--1. Lista todas las columnas de la tabla
select *
from juegos
go

--2. Lista todos los diferentes géneros, eliminando duplicados.
select distinct Genre
from juegos
go

--3. Lista únicamente aquellos juegos que puedan ser jugados únicamente en Linux
select Nombre
from juegos
where PlatformLinux = 'true'
go

--4 Lista todos los juegos de rol, ordenador por nota.
select Nombre, Metacritic, Genre
from juegos
where Genre like '%RPG%'
order by Metacritic desc
go

--5. Lista todos aquellos juegos que puedan ser jugados en Español pero no en Frances
select Nombre, SupportedLanguages
from juegos
where SupportedLanguages like '%spanish%' and SupportedLanguages not like'%french%' 
go

--6. Lista el nombre del juego, su precio inicial, su precio final y la diferencia entre ambos en una nueva columna.

select Nombre, (convert(varchar,PriceInitial) + ' -- ' + (convert(varchar,PriceFinal))) as 'Diferencia(PrecioInicial -- PrecioFinal'
from juegos

--7 ¿Cuántos juegos hay del siglo pasado?

select count(Nombre) as 'Juegos', cast(ReleaseDate as int) as 'Año'
from juegos
where ReleaseDate < 2000
group by ReleaseDate
order by ReleaseDate desc

--8 Devuelve todos los juegos que terminen o en N o en O.
select Nombre
from juegos
where Nombre like '%_N' or Nombre like '%_O' 

--9 Devuelve todos los juegos que empiecen por A y que se puedan jugar con mando.
select Nombre, ControllerSupport
from juegos
where Nombre like 'A_%' and ControllerSupport = 'true'


--10 Devuelve todos aquellos juegos que est'2O17én entre el 2000 y el 2010.
select Nombre, cast(ReleaseDate as int)
from juegos
where ReleaseDate between 2000 and 2010
order by ReleaseDate desc
