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
    id_category int not null,
    price decimal(6, 2) not null,
    foreign key(id_category) references Categories(id)
);

show tables;

-- DDL - renomear as tabelas
-- rename table <nome_original> to <novo_nome>;
-- alter table <nome_original> rename <novo_nome>;
-- rename table <nome_original1> to <novo_nome1>, <nome_original2> to <novo_nome2>;

-- atividade
-- Selecione o nome de todos os paises que iniciam com a letra "E". Ordene em ordem decrescente de nome: 
select name from Countries where name like "E%" order by name desc;

-- Selecione o nome de todas as cidades, bem como o nome de seus respectivos paises para as cidades que iniciam com a letra letra "C". Ordene em ordem crescente de nome da cidade:
select Cities.name as 'Nome da cidade', Countries.name as 'Nome da pais'
    from Cities, Countries
    where Cities.id_country = Countries.id
    and Cities.name like "C%"
    order by Cities.name;

-- Selecione o nome de todas as categorias que iniciam com a letra letra "E". Ordene em ordem decrescente de nome da categoria:
select name from Categories where name like "E%" order by name desc;

-- Selecione o nome de todas as categorias que contenham a string "ri" em qualquer parte do nome. Ordene em ordem crescente de nome da categoria:
select name from Categories where name like "%ri%" order by name;

-- Qual é o comando que permite a criação do banco de dados Loja_2021.
-- create schema loja_2021;

-- Cite as três formas de visualização das colunas de uma tabela. 
describe Categories;
desc Categories;
show columns from Categories;

-- Explique o que o seguinte comando faz: drop schema if exists loja_2021;
-- Apaga o esquema(banco de dados) caso ele já exista.

-- Semana 8 - 2021-09-06
-- DDL - alteração de tabela
--     - ADD  - adicionar coluna
--     - DROP - apagar coluna
alter table Products add obersevation varchar(50) not null;

desc Products;

alter table Products drop obersevation;

alter table Products drop price;

alter table Products add price decimal(10, 2) not null;

insert into Products 
    values (1, "Harry Potter e a Pedra Filosofal", 50, 10, 9, 28.50);
insert into Products 
    values (2, "A culpa é das estrelas", 40, 15, 9, 28.79);
insert into Products 
    values (3, "FIFA 2021", 100, 30, 10, 130.90);
insert into Products 
    values (4, "iPhone 12", 20, 5, 1, 6898.50);
insert into Products 
    values (5, "A menina que roubava livros", 40, 10, 9, 17.50);

insert into Products 
    values (6, "Introdução a sistemas de banco de dados", 20, 5, 9, 200.50);
insert into Products 
    values (7, "Bola de futebol", 100, 30, 4, 117.79);
insert into Products 
    values (8, "PS5", 20, 5, 1, 6582.90);
insert into Products 
    values (9, "Fortnite", 88, 40, 9, 249.50);
insert into Products 
    values (10, "Samsung Galaxy S20", 200, 50, 1, 3250.50);

select * from Products;

-- Selecionar o nome o valor dos produtos que custam mais do R$ 150,00. Ordene em ordem decrescente de valor

select name, price from Products where price > 150.0 order by price desc;

-- Selecionar o nome o valor dos produtos que custam R$ 150,00 ou menos. Ordene em ordem decrescente de valor
select name, price from Products where price >= 150.0 order by price desc;

-- Selecionar o nome o valor dos produtos que custam entre R$ 50,00 e R$ 500,00. Ordene em ordem decrescente de valor
select name, price from Products where (price <= 500.0) and (price >= 50.0) order by price desc;
select name, price from Products where price between 50.0 and 500.0 order by price desc;

-- Atividade
insert into Products (name, quantity, min_quantity, id_category, price) values 
    ("Apple MacBook Air 13.3", 100, 40, 11, 7293.23),
    ("Notebook Lenovo Ultrafino", 1000, 100, 11, 2939.89),
    ("Samsung BookIntel", 356, 36, 11, 2699.30),
    ("Jogo Pula Macaco, Estrela ", 123, 23, 18, 39.90),
    ("Boneca Baby Alive que Bebe e Faz Xixi", 158, 38, 18, 119.20),
    ("Boneco Homem de Ferro", 125, 22, 18, 215.17),
    ("Magic: The Gathering", 125, 25, 18, 49.00),
    ("BAW WAW AREIA SANITÁRIA PERFUMADA  ", 326, 32, 17, 6.29),
    ("Biscoito Pedigree Biscrok", 458, 128, 17, 27.89),
    ("Coleira Antiparasitária Scalibor ", 785, 72, 17, 65.99);
