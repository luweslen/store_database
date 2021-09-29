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

-- semana 6 - 2021-09-20
show tables;

select * from Countries;

-- DML - update - ataualiza um registro

update Countries 
    set name = "Puerto Iguazu" 
    where id = 12;

-- DML - insert - inserção de registros

insert into Categories (name) values 
    ("Eletrônicos"),
    ("Alimentos e bebidas"),
    ("Cama, mesa e banho"),
    ("Esporte e lazer"),
    ("Embalagens"),
    ("Materiais de Limpeza"),
    ("Bebês e crianças"),
    ("Brinquedos"),
    ("Livros"),
    ("Games");

select * from Categories;

-- operadores relacionais do MySQL
-- = igualdade
-- <> ou != diferença
-- < || <= || > || >=

-- selecionar o nome de todas as cidades do Paraná
select name 
    from Cities
    where uf = "PR"
    order by name;

-- selecionar o nome e uf todas as cidades que não são do Paraná
select name, uf
    from Cities
    where uf != "PR"
    order by uf desc;

desc Categories;

-- consultas de junção - para usar info de mais de uma tabela
-- selecionar o nome das cidades com o nome dos respectivs paises em ordem alfabetica crescente do nome da cidade

select Cities.name, Countries.name 
    from Cities, Countries
    where Cities.id_country = Countries.id
    order by Cities.name;

-- as - renomear nome do atributo
select Cities.name as 'Nome da cidade', Countries.name as 'Nome da pais'
    from Cities, Countries
    where Cities.id_country = Countries.id
    order by Cities.name;

-- Atividade
update Categories 
    set name = "Jogos" 
    where id = 10;
    
insert into Categories (name) values 
    ("Computadores"),
    ("Bolsas, malas e mochilas"),
    ("CD e Vinil"),
    ("Roupas"),
    ("Calçados"),
    ("Joias"),
    ("Petshop"),
    ("Brinquedos"),
    ("Jardim e piscina"),
    ("Móveis");

-- Semana 7 - 2021-09-29

-- Selecionar todas as cidades com nome de Palmas

select * from Cities where name = "Palmas";

-- Operador especial - is null
select name from Cities where uf is null;

-- Operadores lógicos - and | or | not
-- Selecionar o nome da cidades com o nome de seus respectivos paises em ordem alfabetica crescente do nome das cidades (apenas cidades do paraná)
select Cities.name as 'Nome da cidade', Countries.name as 'Nome da pais'
    from Cities, Countries
    where Cities.id_country = Countries.id
    and Cities.uf = 'PR'
    order by Cities.name;

-- Selecionar o nome da cidades com o nome de seus respectivos paises em ordem alfabetica crescente do nome das cidades (apenas cidades do paraná e são paulo)
select Cities.name as 'Nome da cidade', Countries.name as 'Nome da pais'
    from Cities, Countries
    where Cities.id_country = Countries.id
    and (uf = 'PR' or uf = 'SP')
    order by Cities.name;

-- Selecionar o nome da cidades com o nome de seus respectivos paises em ordem alfabetica crescente do nome das cidades (exceto as cidades do paraná)
select Cities.name as 'Nome da cidade', Countries.name as 'Nome da pais', uf
    from Cities, Countries
    where Cities.id_country = Countries.id
    and not(uf = 'PR')
    order by Cities.name;

select * 
    from Cities 
    where name = "Palmas";

-- like - utiliza para comparar um padrão de busca %
-- selecionar o nome de todas as cidades que começam com a letra Livros
select name 
    from Cities
    where name like 'L%';

-- selecionar o nome de todas as cidades que tenham "ON" em qualquer parte do nome
select name 
    from Cities
    where name like '%on%';

-- DDL - criação da tabela de produto
create table if not exists Products (
    id int auto_increment primary key auto_increment,
    name varchar(50) not null,
    quantity int not null,
    min_quantity int not null,
    price decimal(6, 2) not null,
    id_category int not null,
    foreign key(id_category) references Categories(id)
);

show tables;

-- DDL - renomear as tabelas
-- rename table <nome_original> to <novo_nome>;
-- alter table <nome_original> rename <novo_nome>;
-- rename table <nome_original1> to <novo_nome1>, <nome_original2> to <novo_nome2>;
