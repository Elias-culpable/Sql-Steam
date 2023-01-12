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

--5 Lista todos aquellos juegos que puedan ser jugados en Español pero no en Frances
select Nombre, SupportedLanguages
from juegos
where SupportedLanguages like '%spanish%' and SupportedLanguages not like'%french%' 
go

