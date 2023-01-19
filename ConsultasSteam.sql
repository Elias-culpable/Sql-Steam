use steam

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

--11 Devuelve todos los juegos que sean de la saga Final Fantasy.

select Nombre
from juegos
where Nombre like 'Final Fantasy_%'

--12 Devuelve todos los juegos que sean de deportes y haya trabajado más de 3 desarrolladores.
select Nombre, Genre, DeveloperCount
from juegos
where Genre like '%sports%' and DeveloperCount > 3

--13 ¿Cuántos juegos hay asociados a cada categoría?
select count(nombre) as juegos, Category
from juegos
group by Category
order by 'juegos' asc

--14 ¿Cuántos juegos se han sacado en cada año?
select count(nombre) as juegos, ReleaseDate
from juegos
group by ReleaseDate
order by 'juegos' asc

--15 En base a la consulta anterior, devuelve aquellos años en los que la media de puntuación esté entre un 60 y un 80

select avg(Metacritic) as media ,ReleaseDate
from juegos
group by ReleaseDate, Metacritic
having avg(metacritic) between 60 and 80
order by ReleaseDate asc

--16 ¿Cuál es la máxima, mínima y puntuación mínima por género?

select max(Metacritic) as 'máxima puntuación', min(Metacritic) as 'mínima puntuación', Genre
from juegos
group by Genre

--17 Usando LIMIT, devuelve el top 10 de juegos con mayor puntuación del 2012.

select top 10 Nombre, Metacritic
from juegos
where ReleaseDate = 2012
order by Metacritic desc

--18 Usando LIMIT, devuelve el top 10 de juegos más nuevos de género single player.

select top 10 Nombre,Category,ReleaseDate 
from juegos
where Category like '%single player%'
order by ReleaseDate desc

--19 Devuelve la media de nota de todos aquellos juegos que sean para mayores de 18 años.

select nombre, RequiredAge, avg(Metacritic) as 'Nota media'
from juegos
where RequiredAge = 18
group by RequiredAge, Nombre

--20 ¿Cuántos juegos hay asociados a cada tipo (mayor de 18, de 17…)?

select count(Nombre) as 'Número de juegos', RequiredAge
from juegos
group by RequiredAge
order by RequiredAge asc