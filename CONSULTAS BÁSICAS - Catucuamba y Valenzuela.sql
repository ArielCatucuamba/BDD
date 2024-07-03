create database afortunados;
use afortunados;
create table clientes(
id_cliente int primary key auto_increment not null,
nombre varchar(50),
email varchar(50)
);
create table cuentas(
id_cuenta int primary key auto_increment not null,
saldo decimal(8,2),
id_cliente int,
foreign key (id_cliente) references clientes(id_cliente)

);
create table transacciones(
id_transaccion int auto_increment primary key not null,
monto decimal(8,2),
fecha timestamp default current_timestamp,
id_cuenta int,
foreign key (id_cuenta) references cuentas(id_cuenta)
);

insert into clientes(nombre,email) values ('Ariel Catucuamba', 'a@gmail.com'),
('David  Diaz', 'b@gmail.com'),('Carlos Hernández', 'c@gmail.com'),
('Mishell Melba', 'd@gmail.com'),('Luis Martínez', 'e@gmail.com'),
('Jimena Diaz', 'f@gmail.com'),('Juan Perez', 'g@gmail.com'),
('María García', 'h@gmail.com'),('Carlos Hernández', 'i@gmail.com'),
('Fausto Catucuamba', 'j@gmail.com'),('Luis Martínez', 'k@gmail.com'),
('Elena Rodríguez', 'l@gmail.com'),('Juan Perez', 'm@gmail.com'),
('María García', 'n@gmail.com'),('Carlos Hernández', 'o@gmail.com'),
('Ana López', 'p@gmail.com'),('Luis Martínez', 'q@gmail.com'),
('Elena Rodríguez', 'r@gmail.com'),('Sofía Sánchez', 's@gmail.com'),
('Miguel Torres', 't@gmail.com');

insert into Cuentas (saldo, id_cliente) values(1000.00, 1),
(1500.50, 1),(2000.75, 2),(2500.25, 3),(3000.00, 4),(3500.75, 5),(4000.50, 6),(4500.25, 7),(5000.00, 8),
(5500.75, 9),(6000.50, 10),(6500.25, 11),(7000.00, 12),(7500.00, 10),(8000.50, 11),(8500.75, 12),(9000.25, 13),
(9500.00, 14),(10000.75, 15),(10500.50, 16);

insert into Transacciones (monto, id_cuenta) values(100.00, 1),(200.50, 2),(300.75, 3),(400.25, 4),
(500.00, 5),(600.75, 6),(700.50, 7),(800.25, 8),(900.00, 9),(1000.75, 10),
(1100.50, 11),(1200.25, 12),(1300.00, 13),(1400.75, 14),(1500.50, 15),(1600.25, 16),(1700.00, 17),(1800.75, 18),
(1900.50, 19),(2000.25, 20);

select * from transacciones;
-- 	Selecciona el id_cuenta y el saldo de todas las cuentas.
select id_cuenta , saldo from cuentas;
-- 	Filtra las cuentas que tienen un saldo mayor a 4000.
select * from cuentas where saldo>4000;
-- 	Seleccionar las cuentas con saldo menor a 2000
select * from cuentas where saldo<2000;
-- 	Mostrar los nombres de los clientes y la longitud de sus nombres
select nombre, length(nombre) as logintud_de_nombres from clientes;
-- 	Seleccionar las cuentas con saldo entre 1000 y 3000
select * from cuentas where saldo>=1000 and saldo<=3000;

-- otra forma es con between 
select * from cuentas where saldo between 1000 and 3000;
-- 	Obtener una lista de todos los clientes y sus cuentas, mostrando los valores NULL 
select clientes.id_cliente, clientes.nombre, cuentas.saldo
from clientes left join cuentas on clientes.id_cliente = cuentas.id_cliente;

-- 	Concatenar el nombre del cliente y su email con un separador
select concat(nombre," ",email) as nombre_cliente from clientes;

-- 	Extraer los últimos 3 caracteres del email de cada cliente
select  right(email,3) from clientes;

-- 	Convertir el nombre del cliente a minúsculas
select lower(nombre) from clientes;

--  	Convertir el nombre del cliente a mayúsculas
select upper(nombre) from clientes;
-- 	Seleccionar las transacciones ordenadas por monto de mayor a menor, mostrando solo las primeras 10
select * from transacciones order by monto desc limit 10;
-- 	Calcular el saldo de cada cuenta después de aplicar un interés del 5%
select saldo*1.5 as saldo_interes from cuentas;

-- 	Reemplazar el dominio del email de los clientes: email, '@example.com', '@newdomain.com'
update clientes set email = replace(email, '@gmail.com', '@newdomain.com')
where email like '%@gmail.com';
select * from clientes;
-- quitar modo seugro 0 y aplicar el modo seguro 1 
set SQL_SAFE_UPDATES=0;
-- 	Selecciona el nombre de cada cliente.
select nombre from clientes;
-- 	Añade una columna que muestre el email del cliente en el formato Correo: [email].
select nombre,email from clientes;
-- 	Mostrar los emails de los clientes en minúsculas
select lower(email) from clientes;
-- 	Mostrar el nombre del cliente en mayúsculas
select upper(email) from clientes;
-- 	Selecciona el id_cuenta.
select id_cuenta from cuentas;
-- 	Calcula el total de las transacciones realizadas en cada cuenta.
select  c.id_cuenta, COUNT(t.id_transaccion) as total_transacciones,SUM(t.monto) as monto_total
from cuentas c left join transacciones t on c.id_cuenta = t.id_cuenta
group by  c.id_cuenta;

-- 	Calcular el saldo total de todas las cuentas
select sum(saldo) as total_saldo from cuentas;

-- 	Calcular el monto total de todas las transacciones
select sum(monto) as monto_transacciones from transacciones;

-- 	Calcular el monto promedio de las transacciones
select avg(monto) as promedio_transacciones from transacciones;

-- 	Selecciona el id_transaccion y la fecha de todas las transacciones.
select id_transaccion,fecha from transacciones;

-- 	Extraer el año de la fecha de cada transacción
select fecha, year(fecha) as solo_año from transacciones;

-- 	Extraer el mes de la fecha de cada transacción
select fecha, month(fecha) as mes_fecha from transacciones;

-- 	Extraer el día de la semana de la fecha de cada transacción
select fecha,day(fecha) as dia_fecha from transacciones;

-- 	Filtra las transacciones que se realizaron en el año 2024.
select * from transacciones where year(fecha)=2024;
-- 	Seleccionar las transacciones realizadas en 2023.
alter table transacciones add column fecha2 date;
select * from transacciones;
insert into Transacciones (monto, id_cuenta,fecha2) values(100.00, 1,"2023-12-11");
select * from transacciones where year(fecha2)=2023;

-- 	Seleccionar las transacciones realizadas en el mes de junio de cualquier año
insert into Transacciones (monto, id_cuenta,fecha2) values(100.00, 1,"2023-6-11");
select * from transacciones where month(fecha2)=6;
-- 	Seleccionar las transacciones realizadas el 15 de cada mes
insert into Transacciones (monto, id_cuenta,fecha2) values(100.00, 1,"2023-6-15");
select fecha2 from transacciones where day(fecha2)=15;

-- 	Selecciona el id_cuenta.
select id_cuenta from cuentas;

-- 	Cuenta el número de transacciones realizadas en cada cuenta.
select id_cuenta,COUNT(*) AS numero_transacciones
from transacciones
group by id_cuenta;

-- 	Calcular el saldo promedio de todas las cuentas.
select avg(saldo) from cuentas;

-- 	Seleccionar las transacciones con un monto negativo
select * from transacciones where monto<0;

-- 	Seleccionar las transacciones con un monto positivo
select * from transacciones where monto>=0;
alter table transacciones drop column fecha2;

-- Seleccionar todas las cuentas ordenadas por saldo de mayor a menor:
select * from cuentas order by saldo desc;

-- 	Seleccionar todos los clientes ordenados alfabéticamente por nombre
select * from clientes order by nombre asc;

-- 	Seleccionar las transacciones realizadas en 2023
select * from transacciones where year(fecha2)=2023;

-- 	Seleccionar las cuentas ordenadas por saldo de menor a mayor, mostrando solo las primeras 5
select * from cuentas order by saldo asc limit 5; 

-- 	Contar el número total de clientes
select count(*) as total_clientes from clientes;

-- 	Contar el número total de cuentas
select count(*) from cuentas;

-- 	Contar el número total de transacciones
select count(*) from transacciones;

-- 	Redondear el saldo de cada cuenta a dos decimales
select round(saldo,2) from cuentas;

-- 	Encontrar la cuenta con el saldo más alto
select max(saldo) from cuentas;

-- 	Encontrar la cuenta con el saldo más bajo
select min(saldo) from cuentas;

-- 	Encontrar la transacción con el monto más alto
select max(monto) as montoMaximo from transacciones;

-- 	Encontrar la transacción con el monto más bajo
select min(monto) from transacciones;
-- Verificamos que sean el monto minimo y maximo
select monto from transacciones order by monto asc;










