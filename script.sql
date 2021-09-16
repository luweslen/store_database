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

-- DML - inserção de dados
insert into Countries values (1, "Brasil");
insert into Countries values (2, "Argentina");
insert into Countries values (3, "Paraguai");
insert into Countries values (4, "Ururguai");
insert into Countries values (5, "Chile");

-- DML - slecionar os dados
select * from Countries order by name;