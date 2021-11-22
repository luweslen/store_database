drop schema if exists loja_2021;

create schema loja_2021;

use loja_2021;

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- SEMANA 04 | 2021-09-08
create table Countries(
	id int not null auto_increment,
    name varchar(50) not null,
    primary key (id)
);

create table Cities(
	id int not null auto_increment primary key,
    name varchar(50) not null,
    uf char(2),
    country_id int not null,
    foreign key(country_id) references Countries(id)
);

create table Categories(
	id int not null auto_increment primary key,
    name varchar(50) not null
);

-- describe Countries;

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- SEMANA 05 | 2021-09-13

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
-- select * from Countries;
-- select name from Countries;
-- select * from Countries order by name; -- asc(default) ou desc
-- select * from Countries order by name desc;

insert into Countries(name) values 
	("Bolívia"),
	("Suriname"),
	("Guiana Francesa"),
	("Aruba"),
	("Trindade e Tobago"),
	("Guiana"),
	("Paises Baixos Caribenhos");

-- desc Cities;

insert into Cities(name, uf, country_id) values 
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
    
-- select * from Cities;

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- SEMANA 6 - 2021-09-20
-- show tables;

-- select * from Countries;

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

-- select * from Categories;

-- operadores relacionais do MySQL
-- = igualdade
-- <> ou != diferença
-- < || <= || > || >=

-- selecionar o nome de todas as cidades do Paraná
-- select name 
    -- from Cities
    -- where uf = "PR"
    -- order by name;

-- selecionar o nome e uf todas as cidades que não são do Paraná
-- select name, uf
    -- from Cities
    -- where uf != "PR"
    -- order by uf desc;

-- desc Categories;

-- consultas de junção - para usar info de mais de uma tabela
-- selecionar o nome das cidades com o nome dos respectivs paises em ordem alfabetica crescente do nome da cidade

-- select Cities.name, Countries.name 
    -- from Cities, Countries
    -- where Cities.country_id = Countries.id
    -- order by Cities.name;

-- as - renomear nome do atributo
-- select Cities.name as 'Nome da cidade', Countries.name as 'Nome da pais'
    -- from Cities, Countries
    -- where Cities.country_id = Countries.id
    -- order by Cities.name;

-------------------- ATIVIDADES
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

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- SEMANA 7 | 2021-09-29

-- Selecionar todas as cidades com nome de Palmas

-- select * from Cities where name = "Palmas";

-- Operador especial - is null
-- select name from Cities where uf is null;

-- Operadores lógicos - and | or | not
-- Selecionar o nome da cidades com o nome de seus respectivos paises em ordem alfabetica crescente do nome das cidades (apenas cidades do paraná)
-- select Cities.name as 'Nome da cidade', Countries.name as 'Nome da pais'
    -- from Cities, Countries
    -- where Cities.country_id = Countries.id
    -- and Cities.uf = 'PR'
    -- order by Cities.name;

-- Selecionar o nome da cidades com o nome de seus respectivos paises em ordem alfabetica crescente do nome das cidades (apenas cidades do paraná e são paulo)
-- select Cities.name as 'Nome da cidade', Countries.name as 'Nome da pais'
    -- from Cities, Countries
    -- where Cities.country_id = Countries.id
    -- and (uf = 'PR' or uf = 'SP')
    -- order by Cities.name;

-- Selecionar o nome da cidades com o nome de seus respectivos paises em ordem alfabetica crescente do nome das cidades (exceto as cidades do paraná)
-- select Cities.name as 'Nome da cidade', Countries.name as 'Nome da pais', uf
    -- from Cities, Countries
    -- where Cities.country_id = Countries.id
    -- and not(uf = 'PR')
    -- order by Cities.name;

-- select * 
    -- from Cities 
    -- where name = "Palmas";

-- like - utiliza para comparar um padrão de busca %
-- selecionar o nome de todas as cidades que começam com a letra Livros
-- select name 
    -- from Cities
    -- where name like 'L%';

-- selecionar o nome de todas as cidades que tenham "ON" em qualquer parte do nome
-- select name 
    -- from Cities
    -- where name like '%on%';

-- DDL - criação da tabela de produto
create table if not exists Products (
    id int auto_increment primary key auto_increment,
    name varchar(50) not null,
    quantity int not null,
    min_quantity int not null,
    category_id int not null,
    price decimal(6, 2) not null,
    foreign key(category_id) references Categories(id)
);

-- show tables;

-- DDL - renomear as tabelas
-- rename table <nome_original> to <novo_nome>;
-- alter table <nome_original> rename <novo_nome>;
-- rename table <nome_original1> to <novo_nome1>, <nome_original2> to <novo_nome2>;

-------------------- ATIVIDADES

-- Selecione o nome de todos os paises que iniciam com a letra "E". Ordene em ordem decrescente de nome: 
-- select name from Countries where name like "E%" order by name desc;

-- Selecione o nome de todas as cidades, bem como o nome de seus respectivos paises para as cidades que iniciam com a letra letra "C". Ordene em ordem crescente de nome da cidade:
-- select Cities.name as 'Nome da cidade', Countries.name as 'Nome da pais'
    -- from Cities, Countries
    -- where Cities.country_id = Countries.id
    -- and Cities.name like "C%"
    -- order by Cities.name;

-- Selecione o nome de todas as categorias que iniciam com a letra letra "E". Ordene em ordem decrescente de nome da categoria:
-- select name from Categories where name like "E%" order by name desc;

-- Selecione o nome de todas as categorias que contenham a string "ri" em qualquer parte do nome. Ordene em ordem crescente de nome da categoria:
-- select name from Categories where name like "%ri%" order by name;

-- Qual é o comando que permite a criação do banco de dados Loja_2021.
-- create schema loja_2021;

-- Cite as três formas de visualização das colunas de uma tabela. 
-- describe Categories;
-- desc Categories;
-- show columns from Categories;

-- Explique o que o seguinte comando faz: drop schema if exists loja_2021;
-- Apaga o esquema(banco de dados) caso ele já exista.

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- SEMANA 8 | 2021-09-06

-- DDL - alteração de tabela
--     - ADD  - adicionar coluna
--     - DROP - apagar coluna
alter table Products add obersevation varchar(50) not null;

-- desc Products;

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

-- select * from Products;

-- Selecionar o nome o valor dos produtos que custam mais do R$ 150,00. Ordene em ordem decrescente de valor

-- select name, price from Products where price > 150.0 order by price desc;

-- Selecionar o nome o valor dos produtos que custam R$ 150,00 ou menos. Ordene em ordem decrescente de valor
-- select name, price from Products where price >= 150.0 order by price desc;

-- Selecionar o nome o valor dos produtos que custam entre R$ 50,00 e R$ 500,00. Ordene em ordem decrescente de valor
-- select name, price from Products where (price <= 500.0) and (price >= 50.0) order by price desc;
-- select name, price from Products where price between 50.0 and 500.0 order by price desc;

-- Atividade
insert into Products (name, quantity, min_quantity, category_id, price) values 
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

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- SEMANA 9 | 2021-10-13

-- Selecionar o nome e o valor dos produtos que custam menos de R$100,00 e mais de R$1000,00
-- select name, price from Products where (price <= 100.0) or (price >= 1000.0);

-- Selecionar o nome e o valor dos produtos, exceto aqueles que custam R$28,50
-- select name, price from Products where not(price = 28.50);

-- Funções agregadas
-- count() - para fazer contagem de um conjunto de valores
-- min() - retorna o menor valor de um conjunto de registros
-- min() - retorna o maior valor de um conjunto de registros
-- sum() - retorna asoma de um conjunto de valores
-- avg() - retorna a média de um conjunto de valores

-- apresente o total de produtos cadastrados
-- select count(name) from Products;

-- apresente o valor do produto mais barato
-- select min(price) from Products;

-- apresente o valor do produto mais caro
-- select max(price) from Products;

-- apresente a soma da variedade de produtos
-- select sum(price) from Products;

-- apresente a média da variedade de produtos
-- select avg(price) from Products;

-- criação da tabela Pessoas

create table Peoples (
    id int not null auto_increment primary key,
    name varchar(150) not null,
    street varchar(50) not null,
    city_id int not null,
    zip_code varchar(10),
    phone varchar(20),
    email varchar(80),
    foreign key (city_id) references Cities (id)
);

-- incluir o atributo number
alter table Peoples add number varchar(15) not null;

-- incluir o atributo complement e observation
alter table Peoples add complement varchar(20), add observation varchar(80);

-- desc Peoples;

-- remover o atributo observation
alter table Peoples drop observation;

-- inserrir dados na tabela peoples de
insert into Peoples values (1, "João Lucas Freitas", "Rua das Flores", 1, "86031858", "43996969696", "jl_freitas@email.com", 1500, "Casa");
insert into Peoples values (2, "Juliana Pires", "Rua Alagoas", 1, "86111222", "43936363636", "j_pires@email.com", 2, "Ap. 704");

-- select * from Peoples;

-------------------- ATIVIDADES
insert into Peoples values
(3, "Betina Nunes", "Avenida JK", 1, "86987121", "554333865567",
"b_nunes@email.com", "987", "casa");
insert into Peoples values
(4, "Antonio Gonzaga", "Calle de Mejico", 19, "27813", "34922849410",
"antonio_gonzaga@email.com", "34", "ap 102");
insert into Peoples values
(5, "Marina Freitas", "Avenida JK", 1, "86987121", "554333797576",
"m_freitas@empresa.com", "1256", "ap 1004");
insert into Peoples values
(6, "Juan Gomes", "Av. Corrientes", 9, "C1193 CABA", "548002222299",
"m_gomes@email.com", "2321", null);
insert into Peoples values
(7, "João Paulo Gonçalves", "Rua João XXIII", 1, "86060050", "554333788765",
"jp_goncalves@email.com", "200", null);
insert into Peoples values
(8, "Rita Farias", "Rua Lina Nazatto", 1, "86088400", "554338016419",
"r_farias@email.com", "352", "casa");
insert into Peoples values
(9, "Camila Rodrigues", "Rua Belo Horizonte", 1, "86055120", "55433870-8471",
"c_rodrigues@email.com", "395", "ap 1001");
insert into Peoples values
(10, "Paulo Souza", "Rua Antonio Rasteiro", 2, "86192189", "554399789-8989",
"p_souza@email.com", "575", null);

insert into Peoples (name, street, city_id, zip_code, phone, email, number, complement) values 
    ("Carlos Eduardo Pereira", "Rua Amapa", 1, "86000222", "5543936363636", "c_pereira@email.com", "123", "Ap 1200"),
    ("Rodrigo Gnomo", "Av. Rio de Janeiro", 2, "86000222", "5543946464646", "r_gnomo@email.com", "456", "Casa"),
    ("Carla Pena", "Rua Santos Brunet", 3, "86000222", "5543926568989", "c_pena@email.com", "789", "Ap 1200"),
    ("Magda Eduarda Santos", "Av. São Paulo", 4, "86000222", "5511926568989", "m_santos@email.com", "56", "Casa"),
    ("Joana da Silva", "Rua Cambé", 5, "86000222", "5511936363636", "j_silva@email.com", "23", "Ap 1200"),
    ("Mariana Patrcia Ferreira", "Av. Victoria Aguirre", 8, "00601", "543757454315", "m_ferreira@email.com", "53", null),
    ("Maraisa Sula", "Rua Macapa", 5, "86000222", "5511936363636", "m_silva@email.com", "91", null),
    ("Natalia Gabriela Pena", "Av. Curitiba", 4, "86333332", "5511996565854", "n_pena@email.com", "89", "Casa"),
    ("Henrique Gabriel Santos", "Rua Itajai", 3, "86222222", "5543936363636", "h_santos@email.com", "56", "Ap 500"),
    ("Bruna da Silva", "Av. Santa Catarina", 2, "86111111", "5543936363636", "b_silva@email.com", "1", null);

-- Selecionar o nome da pessoa e o nome da cidade. Ordene em ordem crescente de nome da pessoa
-- select Peoples.name as 'Nome da Pessoa', Cities.name as 'Nome da cidade' 
    -- from Peoples, Cities 
    -- where Peoples.city_id = Cities.id
    -- order by Peoples.name;

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- SEMANA 10 | 2021-10-20

-- Selecionar o nome da pessoa, o nome da cidade e o nome do pais. Ordene em ordem crescente de nome da pessoa
-- select Peoples.name as 'Nome da Pessoa', Cities.name as 'Nome da cidade', Countries.name as 'Nome do país' 
--     from Peoples, Cities, Countries
--     where (Peoples.city_id = Cities.id) and (Cities.country_id = Countries.id)
--     order by Peoples.name;

-- Apresente o total de categorias que iniciam coma aletra Eduarda
-- select count(name) as 'Toal de categorias que iniciam coma aletra E' from Categories where name like 'E%';

-- DDL - Criação da tabela de clientes
create table Clients (
    id int not null auto_increment primary key,
    people_id int not null,
    cpf varchar(14) not null,
    family_income decimal(10, 2) not null,
    rg varchar(20),
    birth_date date not null,
    marita_status varchar(30),
    foreign key (people_id) references Peoples (id)
);

alter table Clients drop marita_status;

insert into Clients (people_id, cpf, family_income, rg, birth_date) values 
    (1, "07506858998", 3500.10, null, "1989/01/31"),
    (2, "12345678978", 2500.35, "1025869858", "2000/03/25"),
    (3, "12141546545", 9825.25, null, "1998/05/04"),
    (4, "78454515155", 15115.58, "1234567891", "1958/07/04"),
    (5, "15145115151", 15161.20, null, "1999/06/14"),
    (6, "15151511512", 1000.15, "98765432115", "1998/08/06"),
    (7, "15484515111", 22155.15, null, "1978/12/14"),
    (8, "15156151561", 82165.45, "2583691478", "1956/10/08"),
    (9, "15611561661", 9820.95, null, "1974/06/13"),
    (10, "15615616151", 3250.35, "2589631478", "1982/07/15");

-- select * from Clients;

-- Selecionar o nome do cliente, a data de nascimento, o nome da cidade e o nome do pais
-- select Peoples.name as "Nome do cliente",
--     Clients.birth_date as "Data de nascimento",
--     Cities.name as "Nome da cidade",
--     Countries.name as "Nome do pais"
-- from Peoples, Clients, Countries, Cities
-- where (Clients.people_id = Peoples.id) and
--     (Peoples.city_id = Cities.id) and 
--     (Cities.country_id = Countries.id)
-- order by Peoples.name;

insert into Clients (people_id, cpf, family_income, rg, birth_date) values 
    (11, "12123132121", 7021.10, null, "1968/01/31"),
    (12, "78464112131", 6589.35, "7898765445", "2001/12/23"),
    (13, "87951315456", 1251.25, null, "1991/10/06"),
    (14, "36521488652", 123123.58, "1235698745", "1989/08/04"),
    (15, "78456154568", 144656.20, null, "1994/01/05");

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- SEMANA 11 | 2021-10-27

-- selecione a data de nascimento do cliente mais idoso
-- select min(birth_date) from Clients;

-- Selecione a data de nascimento do cliente mais jovem
-- select max(birth_date) from Clients;

-- Selecione o nome e a data de nascimento de todos os clientes que possuam "ar" no nome em qualquer parte para
-- select name as "Nome do cliente", birth_date as "Data de nascimento"
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id) and (name like "%ar%");

-- Liste a maior renda familiar da tabela de clientes
-- Renomeie para "Maior renda familiar"
-- select max(family_income) as "Maior renda familiar" from Clients;

-- Apresente o número total de clientes e renomeie para "Quantidade total de clientes"
-- select count(cpf) as "Quantidade total de clientes" from Clients;

-- Operações com datas
-- day() - retorna o dia de uma datas
-- month() - retorna o mês de uma data
-- year() - retorna o ano de uma data

-- Selecione o nome e data de nascimento dos clientes que nasceram no mês 10
-- select name as "Nome do cliente", birth_date as "Data de nascimento"
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id) 
--     and (month(birth_date) = 10);

-- Selecione o nome e data de nascimento dos clientes que nascseram antes de 1990
-- select name as "Nome do cliente", birth_date as "Data de nascimento"
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id) 
--     and (year(birth_date) < 1990);

-- Selecione o nome e data de nascimento dos clientes que fazem aniversário na data de hoje
-- select name as "Nome do cliente", birth_date as "Data de nascimento"
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id) 
--     and (month(birth_date) = 10)
--     and (day(birth_date) = 20);

-- Cláusula limit = define o número máximo de registros que retorna
-- select name from Cities limit 5;

-- Cláusula offset = define o ínicio da leitura
-- select name from Cities limit 10 offset 3;

-- Funções de manipulação de texto 
-- left - retorna os primeiros caracteres de
-- right - retorna os últimos caracteres de
-- mid - substring - retorna caracteres do meio da string

-- select left(name, 3) from Cities;
-- select name as "Clienetes de M a Z" 
--     from Clients, Peoples 
--     where (Peoples.id = Clients.people_id)
--     and left(name, 1) >= "J"
--     order by name;

-- select right(name, 3) from Cities;
-- select mid(name, 2, 3) from Cities;

-- Criação tabela de fornecedores

create table Providers (
    id int not null auto_increment primary key,
    people_id int not null,
    cnpj varchar(18) not null,
    responsible varchar(30) not null,
    foreign key(people_id) references Peoples(id)
);

insert into Peoples values
    (21, "Fatima Mendes","Conjunto Vivi Xavier", 1, "86230-085",
    "(41) 3824-2914","f_mendes@email.com", "830", null);
insert into Peoples values
    (22, "Pietro Gráfica","Estrada Brasílio de Lima", 3, "09822-020",
    "(44)3221-5678","p_grafica@email.com", "784", "Parque Botujuru");
insert into Peoples values
    (23, "Natália e Kevin Pizzaria Ltda", "Rua Said Mansur", 3,
    "09822-020", "(11) 3668-2621", "nk_pizzaria@email.com", "2345", null);
insert into Peoples values
    (24, "Marli e Paulo Buffet ME", "Rua das Araucárias", 5,
    "80304-320", "(41) 3791-7057", "mp_buffet@email.com", "34", null);
insert into Peoples values
    (25, "Thomas e Anthony Adega ME", "Jardinete Dom Krause", 5,
    "82640-182", "(41) 3610-4786", "ta_adega@empresa.com", "303", "Santa Cândida");
insert into Peoples values
    (26, "Vinicius e Levi Telas Ltda", "Rua Anita Ribeiro Fontes", 5,
    "83215-550", "(41) 2557-376", "vl_telas@email.com", "833", null);
insert into Peoples values
    (27, "Giovanna e Rafael Ferragens ME", "Rua Nhambu", 6,
    "83123-432", "(44) 2877-6724", "gr_ferragens@email.com", "309", null);
insert into Peoples values
    (28, "Pedro e Lara Doces & Salgados ME", "Avenida Colombo", 6,
    "83077-403", "(44) 3948-2074", "pl_docesesalgados@email.com", "124", null);
insert into Peoples values
    (29, "Corretores Associados", "Rua Paranaguá", 1,
    "86234-834", "(43)3361-1690", "c_associados@email.com", "547", "sala 5");
insert into Peoples values
    (30, "Editora Arqueiro", "Rua Albert Leimer", 3,
    "07140-020", "(11)2538-4100", "e_arqueiro@email.com", "300", null);

-- Liste todos os campos da tabela de pessoas ordenados por ordem alfabética de nome
-- select * from Peoples order by name;

-- Liste o nome e data de nascimento de todos os clientes ordenados por data de nascimento
-- select name, birth_date from Peoples, Clients where (Peoples.id = Clients.people_id) order by birth_date;

-- Liste a menor renda familiar da tabela de Clientes. Renomeie o campo para “Menor renda familiar”.
-- select min(family_income) as “Menor renda familiar” from Clients;

-- Mostre a média das rendas familiares dos clientes. Renomeie o campo para “Média das rendas familiares”.
-- select avg(family_income) as “Média das rendas familiares” from Clients;

-- Selecione o nome e a data de nascimento dos clientes nascidos antes de 1980
-- select name, birth_date
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id) 
--     and (year(birth_date) < 1980);

-- Selecione o nome e a data de nascimento dos clientes que nasceram no mês de julho
-- select name, birth_date
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id) 
--     and (month(birth_date) = 7);

-- Selecionar o nome e a renda familiar dos clientes que recebem entre R$ 5000,00 e R$ 8000,00
-- select name, family_income
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id) 
--     and (family_income >= 5000) 
--     and (family_income <= 8000);

-- Selecionar o nome e a renda familiar dos clientes que recebem menos de R$ 5000,00 e mais de R$ 8000,00
-- select name, family_income
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id) 
--     and ((family_income >= 8000) or (family_income <= 5000));

-- Gere 5 consultas diferentes para o banco de dados Loja_2021, com o respectivo enunciado
-- Selecione o nome e CPF os clientes que o CPF possui "123" e ordene por ordem crescente do CPF.
-- select name, cpf
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id) 
--     and (cpf like "%123%")
--     order by cpf;

-- Selecione o nome e o cpf dos clientes que moram em cambé e orderne por ordem decrescente do nome
-- select Peoples.name, cpf
--     from Clients, Peoples, Cities
--     where (Peoples.id = Clients.people_id) 
--     and (Peoples.city_id = Cities.id) 
--     and (Cities.name = "Cambé")
--     order by Peoples.name desc;

-- Liste quantos clientes moram em Londrina e renomei para "Quantidade de clientes que moram em Londrina"
-- select count(Peoples.name) as "Quantidade de clientes que moram em Londrina"
--     from Clients, Peoples, Cities 
--     where (Peoples.id = Clients.people_id) 
--     and (Peoples.city_id = Cities.id)
--     and (Cities.name = "Londrina");

-- Selecione o nome, o CPF e a cidade dos clientes que moram em Cambé, Londrina ou Ibiporã e que o CPF começa com 1. Orderne pelo nome da cidade.
-- select Peoples.name as "Nome do cliente", Clients.cpf, Cities.name as "Nome da cidade"
--     from Clients, Peoples, Cities 
--     where (Peoples.id = Clients.people_id) 
--     and (Peoples.city_id = Cities.id)
--     and (Clients.cpf like "1%")
--     and ((Cities.name = "Londrina") or (Cities.name = "Cambé") or (Cities.name = "Ibiporã"))
--     order by (Cities.name);

-- Selecione o nome, data de nascmento e o cpf dos clientes que nasceram depois do ano 2000. Ordene pela data de nascimento.
-- select Peoples.name as "Nome do cliente", Clients.birth_date as "Data de nascimento", Clients.cpf
--     from Clients, Peoples 
--     where (Peoples.id = Clients.people_id) 
--     and (year(Clients.birth_date) > 2000)
--     order by (Clients.birth_date);

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- SEMANA 12 | 2021-11-03
-- Inserção de registros na tabela de Fornecedores para
insert into Providers (people_id, cnpj, responsible) values 
    (16, "13851585000103", "Fátima M. Santos"),
    (17, "12141654151516", "Tatiane M. Souza"),
    (18, "44851116515156", "Luiza Costa"),
    (19, "56145641210212", "Lorenzo Dumond"),
    (20, "15656151116516", "Carlos Gabriel Macedo");

-- select * from Providers;

-- Funções para manipulação de textos
-- length - retorna o tamanho de um texto
-- select length(name) from Peoples;

-- lower - retorna um texto tudo em minúsculo
-- select lower(name) from Peoples;

-- upper - retorna um texto tudo em maiúsculo
-- select upper(name) from Peoples;

-- replace - substitui parte do texto
-- select replace(responsible, "M.", "Maria") from Providers;

-- locate - mretorna uma posição dentro de um determinado texto
-- select locate("b", "Ana Paula");
-- select locate("p", name) from Peoples;
-- select name 
--     from Peoples 
--     where locate("ri", name);

-- concat - concatenar dois textos
-- select concat(Peoples.name, " - R$ ", Clients.family_income)
--     from Peoples, Clients
--     where Peoples.id = Clients.people_id;

-- trim - remove espaços em brancos de
-- select trim('                 tec       .            ');

-- Funções para manipulação de números
-- round - arredaondar um determinado números
-- select round(10.82);

-- select name, round(family_income)
--     from Peoples, Clients
--     where Peoples.id = Clients.people_id;

-- truncate - trunca um determinado número
-- select truncate(10.82, 1);

-- select name, truncate(family_income, 2)
--     from Peoples, Clients
--     where Peoples.id = Clients.people_id;

-------------------- ATIVIDADES
-- Inclua os seguintes registros na tabela de Fornecedores:
insert into Providers values (6, 21, "56097339000102", "Cecília M. Portela");
insert into Providers values (7, 22, "05861190000155", "Emanuel Goulart");
insert into Providers values (8, 23, "18863728000102", "Daniel Amaral");
insert into Providers values (9, 24, "05210453000166", "Augusto Golveia");
insert into Providers values (10, 25, "37536517000100", "Carlos Eduardo Lopes");

-- Insira mais cinco registros na tabela de Fornecedores:
insert into Providers (people_id, cnpj, responsible) values 
    (16, "13212313213213", "Rodrigo S. Pavão"),
    (17, "31245412435612", "Joana C. Alves"),
    (18, "76454543446436", "Joaquim Moreira"),
    (19, "64823446524117", "Breno Dumond"),
    (20, "97898778417748", "Witoria Brenda Paredes");

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- SEMANA 13 | 2021-11-10
-- Funções de manipulação de números de
-- sqrt() - retorna raiz quadrada
-- select sqrt(9);

-- sign() - retorna 1: maior valor primeiro, 0: valores iguais,  -1: segundo valor maior valor
-- select sign(2, 0);

-- abs() - retorna o valor absoluto
-- select abs(7.555);

-- mod() - resto de uma divisão inteira
-- select mod(8, 2);

create table Orders (
    id int not null auto_increment primary key,
    provider_id int not null,
    created_at date not null,
    receipt_date date,
    foreign key(provider_id) references Providers(id)
);

insert into Orders values (1, 1, "2021-09-08", "2021-09-10");
insert into Orders values (2, 1, "2021-09-13", "2021-09-14");

create table Order_Items (
    id int not null auto_increment primary key,
    order_id int not null,
    product_id int not null,
    quantity int not null,
    price decimal(10, 2),
    foreign key(order_id) references Orders(id),
    foreign key(product_id) references Products(id)
);

insert into Order_Items values (1, 2, 1, 10, 28.50 );
insert into Order_Items values (2, 2, 2, 20, 28.79 );
insert into Order_Items values (3, 2, 5, 15, 28.79 );
insert into Order_Items values (4, 2, 6, 5, 208.79 );
insert into Order_Items values (5, 2, 7, 50, 117.79 );
insert into Order_Items values (6, 1, 4, 2, 2890.79 );

-- operações com data
-- select curdate();
-- select current_date(), current_date() + 10;
-- select sysdate(), now();
-- select dayname(curdate());
-- select dayname("2000-12-31");
-- select monthname("2000-12-31");

-------------------- ATIVIDADES
-- Inclua os seguintes registros na tabela de Pedidos:
insert into Orders values (3,  2, "2021-10-11", "2021-10-18");
insert into Orders values (4,  2, "2021-10-13", "2021-10-20");
insert into Orders values (5,  3, "2021-10-13", "2021-10-16");
insert into Orders values (6,  3, "2021-10-20", "2021-10-22");
insert into Orders values (7,  4, "2021-11-01", "2021-10-04");
insert into Orders values (8,  4, "2021-11-03", "2021-10-06");
insert into Orders values (9,  6, "2021-11-10", null);
insert into Orders values (10, 6, "2021-11-10", null);

-- Insira mais dez registros na tabela de Pedidos
insert into Orders values (11, 4, "2021-11-11", "2021-11-15");
insert into Orders values (12, 5, "2021-12-13", "2021-12-13");
insert into Orders values (13, 2, "2021-01-01", "2021-01-15");
insert into Orders values (14, 1, "2021-02-20", "2021-02-24");
insert into Orders values (15, 7, "2021-03-01", "2021-03-15");
insert into Orders values (16, 8, "2021-04-03", "2021-04-16");
insert into Orders values (17, 9, "2021-05-10", null);
insert into Orders values (18, 6, "2021-06-10", null);
insert into Orders values (19, 5, "2021-07-10", null);
insert into Orders values (20, 5, "2021-08-10", null);

-- Inclua os seguintes registros na tabela de Itens_Pedidos
insert into Order_Items values ( 7, 1, 10,  5, 3250.50);
insert into Order_Items values ( 8, 4,  3, 50,  130.90);
insert into Order_Items values ( 9, 5,  8, 50,   28.50);
insert into Order_Items values (10, 6,  9, 15,  249.99);
insert into Order_Items values (11, 2,  1, 25,   28.50);
insert into Order_Items values (12, 2,  2, 35,   20.79);

-- Insira mais dez registros na tabela de Itens_Pedidos
insert into Order_Items values (13, 1,  1, 10,   28.50);
insert into Order_Items values (14, 1,  2, 15,   28.79);
insert into Order_Items values (15, 2,  3, 25,  130.90);
insert into Order_Items values (16, 2,  4, 35, 6898.50);
insert into Order_Items values (17, 3,  5, 54,   17.50);
insert into Order_Items values (18, 3,  6, 15,  200.50);
insert into Order_Items values (19, 4,  7, 14,  117.79);
insert into Order_Items values (20, 4,  8, 78, 6582.90);
insert into Order_Items values (21, 5,  9, 12,  249.50);
insert into Order_Items values (22, 5, 10, 23, 3250.50);


/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- SEMANA 14 | 2021-11-17

create table Sales(
    id int not null auto_increment primary key,
    client_id int not null,
    date date not null,
    foreign key(client_id) references Clients(id)
);

create table Sales_Items(
    id int not null auto_increment primary key,
    sale_id int not null,
    product_id int not null,
    quantity int not null,
    price decimal(10, 2),
    foreign key(sale_id) references Sales(id),
    foreign key(product_id) references Products(id)
);

-- Funções de manipulação de datas
-- dayofmonth
-- select dayofmonth('2021-11-17');

-- dayofweek
-- select dayofweek('2021-11-17');

-- Apresente o nome e o dia da semana que o cliente nasceu
-- select Peoples.name as "Nome do cliente",
--     dayofweek(birth_date) as "Dia da semana que o cliente nasceu" 
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id
-- );
-- select Peoples.name as "Nome do cliente",
--     dayofmonth(birth_date) as "Dia do mês que o cliente nasceu" 
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id
-- );

-- date_format
-- select date_format(now(), "%d/%m/%Y");

-- @@lc_time_names - verificar o idioma padrão
-- select @@lc_time_names;
-- set @@lc_time_names = 'pt_BR';

-- extract - extração de dia, mês e ano de uma data
-- select extract(day from noew());

-- adddate - adicionar a uma data um determinado intervalo
-- select adddate(now(), 20);
-- select adddate(now(), interval 20 day);

-------------------- ATIVIDADES

-- Insira dez registros na tabela de Vendas
insert into Sales values ( 1,  1, "2021-11-11");
insert into Sales values ( 2,  2, "2021-12-13");
insert into Sales values ( 3,  3, "2021-01-01");
insert into Sales values ( 4,  4, "2021-02-20");
insert into Sales values ( 5,  5, "2021-03-01");
insert into Sales values ( 6,  6, "2021-04-03");
insert into Sales values ( 7,  7, "2021-05-10");
insert into Sales values ( 8,  8, "2021-06-10");
insert into Sales values ( 9,  9, "2021-07-10");
insert into Sales values (10, 10, "2021-08-10");

-- Insira quinze registros na tabela de Itens_Vendas
insert into Sales_Items values ( 1,  1,  1, 10,   28.50);
insert into Sales_Items values ( 2,  2,  2, 15,   28.79);
insert into Sales_Items values ( 3,  3,  3, 25,  130.90);
insert into Sales_Items values ( 4,  4,  4, 35, 6898.50);
insert into Sales_Items values ( 5,  5,  5, 54,   17.50);
insert into Sales_Items values ( 6,  6,  6, 15,  200.50);
insert into Sales_Items values ( 7,  7,  7, 14,  117.79);
insert into Sales_Items values ( 8,  8,  8, 78, 6582.90);
insert into Sales_Items values ( 9,  9,  9, 12,  249.50);
insert into Sales_Items values (10, 10, 10, 23, 3250.50);

-- Apresente o nome dos Clientes em maiúsculo.
-- select upper(Peoples.name)
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id);

-- Concatenar o nome e a data de nascimento de cada cliente.
-- select concat(Peoples.name, " ", Clients.birth_date)
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id);

-- Concatenar o nome e a renda familiar arredondada de cada cliente. Ordene por renda familiar.
-- select concat(Peoples.name, " ", Clients.family_income)
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id)
--     order by Clients.family_income;

-- Obter uma relação de nomes de clientes cujos nomes começam com A, B, ..., E ou F, ordem alfabética.
select Peoples.name
    from Clients, Peoples
    where (Peoples.id = Clients.people_id)
    and Peoples.name between 'a' and 'f'
    order by Peoples.name;

-- Selecione os 10 PRIMEIROS caracteres à esquerda do nome dos clientes.
-- select left(Peoples.name, 10)
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id);

-- X Apresentar o nome e a idade de cada um dos clientes.
select Peoples.name, year(now()) - year(Clients.birth_date) as 'Age'
    from Clients, Peoples
    where (Peoples.id = Clients.people_id)
    and Peoples.name between 'a' and 'f';
    
-- Apresente o nome, o dia da semana e o nome do mês em que cada cliente nasceu.
-- select Peoples.name, dayname(Clients.birth_date), month(Clients.birth_date)
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id);

-- Selecione o nome dos Clientes que nasceram entre 1980-01-01 e 1990-01-01.
-- select Peoples.name
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id)
--     and (Clients.birth_date >= '1980-01-01')
--     and (Clients.birth_date <= '1990-01-01');

-- Selecione os nomes e datas de nascimento dos clientes que fazem aniversário no mês de Outubro.
-- select Peoples.name, Clients.birth_date
--     from Clients, Peoples
--     where (Peoples.id = Clients.people_id)
--     and (month(Clients.birth_date) = 10);