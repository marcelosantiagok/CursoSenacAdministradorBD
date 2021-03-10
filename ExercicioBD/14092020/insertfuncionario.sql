/*ESTRUTURA BANCO DE DADOS FARMACIA*/
create database farmacia;

use farmacia;

create table cliente(
idCliente int not null auto_increment primary key,
nome varchar(45) not null,
telefone varchar(15) not null,
endereco varchar(150) not null,
cpf varchar(15) not null,
 data_nascimento date not null
);

create table funcionario(
idFuncionario int not null auto_increment primary key,
funcao varchar(45) not null,
nome varchar(45) not null,
endereco varchar(150) not null,
data_nascimento date not null,
telefone varchar(15) not null,
rg varchar(15) not null,
cpf varchar(15) not null
);

create table produto(
idProduto int not null auto_increment primary key,
nome varchar(100) not null,
valor_custo double not null,
valor_venda double not null,
fabricante varchar(45) not null,
vencimento date not null
);

create table estoque(
idEstoque int not null auto_increment primary key,
estoque_atual int not null,
estoque_minimo int not null,
idProduto int,
foreign key (idProduto) references produto(idProduto)
);

create table entrega(
idEntrega int not null auto_increment primary key,
tipo_pgt varchar(45) not null,
valor_total double not null,
data date not null,
hora time not null
);

create table cliente_entrega(
idCliente_Entrega int not null auto_increment primary key,
idCliente int,
idEntrega int,
foreign key (idCliente) references cliente(idCliente),
foreign key (idEntrega) references entrega(idEntrega)
);

create table funcionario_entrega(
idFuncionario_Entrega int not null auto_increment primary key,
idFuncionario int,
idEntrega int,
foreign key (idFuncionario) references funcionario(idFuncionario),
foreign key (idEntrega) references entrega(idEntrega)
);

create table pedido(
idPedido int not null auto_increment primary key,
valor_total double not null,
idCliente int,
idFuncionario int,
foreign key (idCliente) references cliente(idCliente),
foreign key (idFuncionario) references funcionario(idFuncionario)
);

create table venda(
idVenda int not null auto_increment primary key,
valor_total double not null,
data date not null,
hora time not null
);

create table pedido_produto(
idPedido_Produto int not null auto_increment primary key,
idPedido int,
idProduto int,
foreign key (idPedido) references pedido(idPedido),
foreign key (idProduto) references produto(idProduto)
);

create table pedido_venda(
idPedido_Venda int not null auto_increment primary key,
idPedido int,
idVenda int,
foreign key (idPedido) references pedido(idPedido),
foreign key (idVenda) references venda(idVenda)
);

create table funcionario_venda(
idFuncionario_Venda int not null auto_increment primary key,
idFuncionario int,
idVenda int,
foreign key (idFuncionario) references funcionario(idFuncionario),
foreign key (idVenda) references venda(idVenda)
);


/*INSERT NO MÍNIMO 15 EM CADA TABELA*/


insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('caixa','ananias de souza','qr 202 cj 05 lote 4 samambaia-df','1992-08-07','99788418','444685','665484412');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('repositor','celia regina','qsc 01 cj 4 lote 10 taguatinga-df','1991-06-01','4545451','98784811','22545412');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('motoboy','douglas santos de souza','qd 20 lote 07 aguas claras','1988-04-08','998888741','6654541','545412541');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('caixa','bruna dos santos','qr 410 cj 05 lote 03 samambaia norte-df','1982-08-07','99788418','444685','6654412');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('gerente','lohayne souza','rua 106 lote 08 aguas claras-df','1990-04-01','88774541','5454841','456456441');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('motoboy','jorge da costa','qsb 11 cj 11 lote 13 taguatinga','1982-04-05','77878454','4566884','555484121');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('perfumista','amauri batista','qsa cj 7 lote 8 taguatinga','1991-03-20','898877441','23565444','454545115');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('repositor','paulo roberto','qr 408 cj 20 lote 43 samambaia norte-df','1990-08-29','64564654','444685','665456462');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('motoboy','paula priscila','qr 404 cj 08 casa 09 samambaia-df','1992-11-04','654564','6454684','54546541');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('atendente','newton dias ','qsd 20 casa 4 taguatinga-df','1980-12-14','878784541','321256461','6332121511');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('atendente','raissa de oliveira','qsf 5 cj 77 casa 12 taguatinga-df','1992-05-20','212616152','5456451','645456411');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('farmaceutico','luiza abreu','qr 412 cj 20 casa 40 samambaia-df','1995-03-02','94545411','99998415','02121651411');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('farmaceutico','gabriel da silva','qsc 4 cj 5 casa 7 taguatinga-df','1993-11-01','9871456','65465448','021261652');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('atendente','flavia alessandra','qsf 5 casa 20 taguatinga-df','1995-10-04','645646581','5545464','12356461');
insert into funcionario (funcao,nome,endereco,data_nascimento,telefone,rg,cpf) values ('atendente','ana paula da silva','qr 510 cj 03 lote 02 samambaia-df','1991-05-04','64646941','65464611','65456161');

insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('marcos dos santos','65456415','R. 25 Sul, 30 - Águas Claras, Brasília - DF, 71927-180','78879874','1992-12-04');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('jose antonio','5465451','Rua 25 Sul, 30 Condomínio Park Style Mall - Águas Claras, Brasília - DF, 71927-180','51516541','1993-04-05');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('andre luiz','65465451','Av. Jacarandá, 41 - Lote 39 - Águas Claras, Brasília - DF, 71927-540','54554621','1994-01-17');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('priscila de alcantara','456464641','Av. Jacarandá, 47 - Águas Claras, Brasília - DF, 71927-540','15151422','1995-0110');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('moises cruz','9999894','Asa Norte CLN 107 BL A LOJA 15 - Asa Norte, Brasília - DF, 70743-510','45465489','1990-08-11');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('alana dos santos','77784545','Asa Norte Comércio Local Norte 206 Bloco A Loja 3 - Asa Norte, Brasília - DF, 70844-510','515165421','1991-07-15');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('mauricio firmino','76454854','Asa Norte Comércio Local Norte 104 loja 26 BL A - Asa Norte, Brasília - DF, 70733-540','51514651','1993-11-17');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('katia cristina','98848485','EQS 102/103, Lojas 24/26, Brasília - DF, 70330-400','54541541','1980-10-30');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('ana clara dos santos','55448754','SGAS II SGAS 604 - Conj C, Brasília - DF, 70200-640','565165124','1982-07-28');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('laura nunes','99878849','SGAS II St. de Grandes Áreas Sul 607 - Asa Sul, Brasília - DF, 70200-670','25654651','1983-07-26');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('rebeca de castro','98798744','St. M QNM 5 conjunto B Lote 03 - Ceilândia, Brasília - DF, 72215-052','21321514','1980-01-10');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('maria de lourdes','989489491','St. M QNJ 45 - Ceilândia, Brasília - DF, 72215-556','564546542','1985-02-11');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('jeniffer amaral','899116445','St. M QNM 9 Lote 20 - Ceilândia, Brasília - DF, 72215-090','56564541','1986-03-13');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('amauri brito da cunha','951651154','Setor SIG Conjunto E Lote 18, Taguatinga Norte, Brasília - DF, 72153-505','56564521','1987-05-17');
insert into cliente (nome,telefone,endereco,cpf,data_nascimento) values('jorge jesus silva','99994944','St. L Norte Qnl 01 - Taguatinga, Brasília - DF, 72150-508','56456541','1988-04-18');


insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('paracetamol',4.00,12.00,'tylenol','2022-07-01');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Dorflex ',3.00,18.00,'Sanofi Aventis','2021-01-31');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Xarelto ',5.00,20.00,'EMS Corp.','2021-05-04');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Selozok ',6.00,17.00,'Takeda','2022-01-01');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Neosaldina ',2.00,14.00,'EMS Corp.','2021-08-09');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Torsilax ',5.00,27.00,'tylenol','2021-11-10');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Aradois ',10.00,24.00,'EMS Corp.','2021-03-03');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Glifage XR',10.00,40.00,'EMS Corp.','2021-04-05');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Addera D3',3.00,25.00,'Takeda','2021-08-07');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Anthelios ',6.00,27.00,'EMS Corp.','2021-02-11');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Buscopan composto',2.00,14.00,'Novartis','2021-02-04');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Amoxicilina',6.00,18.00,'Novartis','2021-01-01');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Ampicilina',3.00,17.00,'Novartis','2021-02-01');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Cefalexina',2.00,6.00,'Novartis','2021-03-01');
insert into produto (nome,valor_custo,valor_venda,fabricante,vencimento) values ('Cefazolina',9.00,21.00,'tylenol','2021-04-01');

insert into estoque (estoque_atual,estoque_minimo,idProduto) values(200,40,1);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(350,100,2);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(500,80,3);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(600,90,4);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(250,50,5);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(330,45,6);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(440,75,7);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(550,60,8);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(700,50,9);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(1000,30,10);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(100,20,11);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(350,80,12);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(150,70,13);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(300,60,14);
insert into estoque (estoque_atual,estoque_minimo,idProduto) values(450,50,15);


insert into pedido(valor_total,idCliente,idFuncionario) values (120.00,1,12);
insert into pedido(valor_total,idCliente,idFuncionario) values (330.00,2,13);
insert into pedido(valor_total,idCliente,idFuncionario) values (76.00,3,16);
insert into pedido(valor_total,idCliente,idFuncionario) values (88.00,4,17);
insert into pedido(valor_total,idCliente,idFuncionario) values (99.00,5,12);
insert into pedido(valor_total,idCliente,idFuncionario) values (20.00,6,13);
insert into pedido(valor_total,idCliente,idFuncionario) values (30.00,7,16);
insert into pedido(valor_total,idCliente,idFuncionario) values (190.00,8,17);
insert into pedido(valor_total,idCliente,idFuncionario) values (130.00,9,17);
insert into pedido(valor_total,idCliente,idFuncionario) values (170.00,10,12);
insert into pedido(valor_total,idCliente,idFuncionario) values (180.00,11,13);
insert into pedido(valor_total,idCliente,idFuncionario) values (190.00,12,17);
insert into pedido(valor_total,idCliente,idFuncionario) values (200.00,13,12);
insert into pedido(valor_total,idCliente,idFuncionario) values (135.00,14,13);
insert into pedido(valor_total,idCliente,idFuncionario) values (235.00,15,17);
insert into pedido(valor_total,idCliente,idFuncionario) values (222.00,16,17);


insert into venda (valor_total,data,hora) values (200.00,'2020-12-10','21:20');
insert into venda (valor_total,data,hora) values (135.00,'2020-12-10','20:30');
insert into venda (valor_total,data,hora) values (260.00,'2020-12-10','21:45');
insert into venda (valor_total,data,hora) values (310.00,'2020-12-10','20:10');
insert into venda (valor_total,data,hora) values (95.00,'2020-12-10','22:30');
insert into venda (valor_total,data,hora) values (70.00,'2020-12-10','19:15');
insert into venda (valor_total,data,hora) values (80.00,'2020-12-10','18:17');
insert into venda (valor_total,data,hora) values (120.00,'2020-12-10','17:30');
insert into venda (valor_total,data,hora) values (135.00,'2020-12-10','16:40');
insert into venda (valor_total,data,hora) values (150.00,'2020-12-10','15:30');
insert into venda (valor_total,data,hora) values (160.00,'2020-12-10','14:30');
insert into venda (valor_total,data,hora) values (210.00,'2020-12-10','16:15');
insert into venda (valor_total,data,hora) values (310.00,'2020-12-10','17:01');
insert into venda (valor_total,data,hora) values (195.00,'2020-12-10','18:18');
insert into venda (valor_total,data,hora) values (185.00,'2020-12-10','21:15');


insert into entrega (tipo_pgt,valor_total,data,hora) values ('cartao debito',240.00,'2020-12-10','18:20');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('cartao credito',150.00,'2020-12-10','17:40');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('dinheiro',135.00,'2020-12-10','19:21');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('cartao credito',140.00,'2020-12-10','21:50');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('cartao debito',185.00,'2020-12-10','19:18');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('cartao debito',195.00,'2020-12-10','17:50');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('cartao credito',182.00,'2020-12-10','16:15');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('cartao debito',140.00,'2020-12-10','15:01');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('dinheiro',132.00,'2020-12-10','14:19');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('dinheiro',144.00,'2020-12-10','15:30');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('dinheiro',155.00,'2020-12-10','16:20');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('cartao debito',120.00,'2020-12-10','17:10');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('cartao debito',136.00,'2020-12-10','19:16');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('cartao credito',128.00,'2020-12-10','17:17');
insert into entrega (tipo_pgt,valor_total,data,hora) values ('cartao debito',112.00,'2020-12-10','19:19');


insert into cliente_entrega (idCliente, idEntrega) values (1,1);
insert into cliente_entrega (idCliente, idEntrega) values (2,2);
insert into cliente_entrega (idCliente, idEntrega) values (3,3);
insert into cliente_entrega (idCliente, idEntrega) values (4,4);
insert into cliente_entrega (idCliente, idEntrega) values (5,5);
insert into cliente_entrega (idCliente, idEntrega) values (6,6);
insert into cliente_entrega (idCliente, idEntrega) values (7,7);
insert into cliente_entrega (idCliente, idEntrega) values (8,8);
insert into cliente_entrega (idCliente, idEntrega) values (9,9);
insert into cliente_entrega (idCliente, idEntrega) values (10,10);
insert into cliente_entrega (idCliente, idEntrega) values (11,11);
insert into cliente_entrega (idCliente, idEntrega) values (12,12);
insert into cliente_entrega (idCliente, idEntrega) values (13,13);
insert into cliente_entrega (idCliente, idEntrega) values (14,14);
insert into cliente_entrega (idCliente, idEntrega) values (15,15);



insert into funcionario_entrega (idFuncionario,idEntrega) values (5,1);
insert into funcionario_entrega (idFuncionario,idEntrega) values (8,2);
insert into funcionario_entrega (idFuncionario,idEntrega) values (11,3);
insert into funcionario_entrega (idFuncionario,idEntrega) values (5,4);
insert into funcionario_entrega (idFuncionario,idEntrega) values (8,5);
insert into funcionario_entrega (idFuncionario,idEntrega) values (11,6);
insert into funcionario_entrega (idFuncionario,idEntrega) values (11,7);
insert into funcionario_entrega (idFuncionario,idEntrega) values (5,8);
insert into funcionario_entrega (idFuncionario,idEntrega) values (8,9);
insert into funcionario_entrega (idFuncionario,idEntrega) values (5,10);
insert into funcionario_entrega (idFuncionario,idEntrega) values (5,11);
insert into funcionario_entrega (idFuncionario,idEntrega) values (8,12);
insert into funcionario_entrega (idFuncionario,idEntrega) values (8,13);
insert into funcionario_entrega (idFuncionario,idEntrega) values (11,14);
insert into funcionario_entrega (idFuncionario,idEntrega) values (11,15);


insert into funcionario_venda (idFuncionario,idVenda) values (1,1);
insert into funcionario_venda (idFuncionario,idVenda) values (2,2);
insert into funcionario_venda (idFuncionario,idVenda) values (3,3);
insert into funcionario_venda (idFuncionario,idVenda) values (6,4);
insert into funcionario_venda (idFuncionario,idVenda) values (6,5);
insert into funcionario_venda (idFuncionario,idVenda) values (1,4);
insert into funcionario_venda (idFuncionario,idVenda) values (2,4);
insert into funcionario_venda (idFuncionario,idVenda) values (3,4);
insert into funcionario_venda (idFuncionario,idVenda) values (6,4);
insert into funcionario_venda (idFuncionario,idVenda) values (6,4);
insert into funcionario_venda (idFuncionario,idVenda) values (6,4);
insert into funcionario_venda (idFuncionario,idVenda) values (3,4);
insert into funcionario_venda (idFuncionario,idVenda) values (2,4);
insert into funcionario_venda (idFuncionario,idVenda) values (1,4);
insert into funcionario_venda (idFuncionario,idVenda) values (1,4);

insert into pedido_produto (idPedido,idProduto) values (1,1);
insert into pedido_produto (idPedido,idProduto) values (2,2);
insert into pedido_produto (idPedido,idProduto) values (3,3);
insert into pedido_produto (idPedido,idProduto) values (4,4);
insert into pedido_produto (idPedido,idProduto) values (5,5);
insert into pedido_produto (idPedido,idProduto) values (6,6);
insert into pedido_produto (idPedido,idProduto) values (7,7);
insert into pedido_produto (idPedido,idProduto) values (8,8);
insert into pedido_produto (idPedido,idProduto) values (9,9);
insert into pedido_produto (idPedido,idProduto) values (10,10);
insert into pedido_produto (idPedido,idProduto) values (11,11);
insert into pedido_produto (idPedido,idProduto) values (12,12);
insert into pedido_produto (idPedido,idProduto) values (13,13);
insert into pedido_produto (idPedido,idProduto) values (14,14);
insert into pedido_produto (idPedido,idProduto) values (15,15);


insert into pedido_venda (idPedido,idVenda) values (1,1);
insert into pedido_venda (idPedido,idVenda) values (2,2);
insert into pedido_venda (idPedido,idVenda) values (3,3);
insert into pedido_venda (idPedido,idVenda) values (4,4);
insert into pedido_venda (idPedido,idVenda) values (5,5);
insert into pedido_venda (idPedido,idVenda) values (6,6);
insert into pedido_venda (idPedido,idVenda) values (7,7);
insert into pedido_venda (idPedido,idVenda) values (8,8);
insert into pedido_venda (idPedido,idVenda) values (9,9);
insert into pedido_venda (idPedido,idVenda) values (10,10);
insert into pedido_venda (idPedido,idVenda) values (11,11);
insert into pedido_venda (idPedido,idVenda) values (12,12);
insert into pedido_venda (idPedido,idVenda) values (13,13);
insert into pedido_venda (idPedido,idVenda) values (14,14);
insert into pedido_venda (idPedido,idVenda) values (15,15);



/*UPDATE 5*/
UPDATE funcionario
SET nome = "marcelo da silva souza"
WHERE idFuncionario = 2;

UPDATE funcionario
SET endereco = "QN 406 - Samambaia Sul, Brasília - DF, 72318-560"
WHERE idFuncionario = 2;

UPDATE funcionario
SET data_nascimento = "1993-04-05"
WHERE idFuncionario =1;

UPDATE funcionario
SET telefone = "999977841"
WHERE idFuncionario = 2;

UPDATE funcionario
SET rg = "55461151"
WHERE idFuncionario = 2;

UPDATE funcionario
SET cpf = "48778741"
WHERE idFuncionario = 2;

/*DELETE 5*/

DELETE FROM funcionario
where idFuncionario = 9;

DELETE FROM funcionario
where idFuncionario = 14;

DELETE FROM funcionario
where idFuncionario = 10;

DELETE FROM funcionario
where idFuncionario = 4;

DELETE FROM funcionario
where idFuncionario = 15;

/*VIEWS 3*/

create view vw_selectFuncionarios as select * from funcionario;

create view vw_selectClientes as select * from cliente;

create view vw_vendas as select * from venda;

/*SELECTS PERTINENTES AO RAMO 5, PELO MENOS 1 COM JOIN*/

select cliente.nome, cliente.telefone, cliente.endereco, pedido.idPedido, pedido.valor_total  from cliente
join pedido on cliente.idCliente = pedido.idPedido;

/**/