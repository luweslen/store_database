drop schema if exists loja_2021;

create schema loja_2021;

use loja_2021;

-- Semana 04 - 2021-09-08
create table Countries(
	id int not null auto_increment,
    name varchar(50) not null,
    primary key (id)
);

create table Cities(
	id int not null auto_increment primary key,
    name varchar(50) not null,
    uf char(2),
    id_country int not null,
    foreign key(id_country) references Countries(id)
);

create table Categories(
	id int not null auto_increment primary key,
    name varchar(50) not null
);

describe Countries;

-- Semana 05 - 2021-09-13

-- DML - inserção de dados
insert into Countries values (1, "Brasil");
insert into Countries values (2, "Argentina");
insert into Countries values (3, "Paraguai");
insert into Countries values (4, "Ururguai");
insert into Countries values (5, "Chile");
insert into Countries values (6, "Colômbia");
insert into Countries values (7, "Peru");
insert into Countries values (8, "Venezuela");
insert into Countries values (9, "Equador");

-- DML - slecionar os dados
select * from Countries;
select name from Countries;
select * from Countries order by name; -- asc(default) ou desc
select * from Countries order by name desc;

insert into Countries(name) values 
	("Bolívia"),
	("Suriname"),
	("Guiana Francesa"),
	("Aruba"),
	("Trindade e Tobago"),
	("Guiana"),
	("Paises Baixos Caribenhos");

desc Cities;

insert into Cities(name, uf, id_country) values 
	("Londrina", "PR", 1),
    ("Cambé", "PR", 1),
    ("Ponta Grossa", "PR", 1),
    ("São Paulo", "SP", 1),
    ("Campinas", "SP", 1),
    ("Buenos Aires", null, 2),
    ("Mendoza", null, 2),
    ("Puerto Iguazú", null, 2),
    ("Salta", null, 2),
    ("Bariloche", null, 2),
    ("Apoera", null, 11),
    ("Bakhuis", null, 11),
    ("Domburg", null, 11),
    ("Goddo", null, 11),
    ("Moengo", null, 11),
    ("Guaiaquil", null, 9),
    ("Quito", null, 9),
    ("Machala", null, 9),
    ("Durán", null, 9),
    ("Quevedo", null, 9);
    
select * from Cities;