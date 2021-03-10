create database if not exists clinica;

use clinica;

create table if not exists cliente(
	cod_cliente int not null auto_increment primary key,
    nome varchar(45) not null,
    cpf varchar(20) not null,
    rg varchar(20) not null,
    datanascimento DATE,
    sexo char(1) not null,
    endereco varchar(100) not null,
    telefone varchar(20) not null
);

create table if not exists servico(
	cod_servico int not null auto_increment primary key,
    nomeservico varchar(45) not null,
    tipodeservico varchar(45) not null,
    valorservico double,
    quantidadeservico double
);

create table if not exists medicamento(
	cod_medicamento int not null auto_increment primary key,
    nome varchar(45) not null,
    datafabricacao DATE,
    datavalidade DATE,
    descricao varchar(45)
);

create table if not exists produto(
	cod_produto int not null auto_increment primary key,
    nome varchar(45) not null,
    quantidade int not null,
    valorproduto double,
    marca varchar(45),
    peso double,
    tipoproduto varchar(45)
);


create table if not exists funcionario(
	cod_funcionario int not null auto_increment primary key,
    nome varchar(45) not null,
    cpf varchar(20) not null,
    rg varchar(20) not null,
    datanascimento DATE not null,
    endereco varchar(100) not null,
    telefone varchar(20) not null,
    sexo char(1) not null,
    cargo varchar(45) not null,
    salario double not null
);

create table if not exists consulta(
	cod_consulta int not null auto_increment primary key,
    data DATE not null,
    hora time(6) not null,
    descricao varchar(45) not null,
    cod_servico int,
    foreign key(cod_servico) references servico (cod_servico)
);

create table if not exists venda(
	cod_venda int not null auto_increment primary key,
    data DATE not null,
    hora time(6) not null,
    desconto double,
    valortotal double,
    cod_funcionario int,
    cod_servico int,
    foreign key (cod_funcionario) references funcionario (cod_funcionario),
    foreign key (cod_servico) references servico (cod_servico)
);



create table if not exists animal(
	cod_animal int not null auto_increment primary key,
    nome varchar(45) not null,
    sexo char(1) not null,
    datanascimento DATE,
    cor varchar(45) not null,
    tipoanimal varchar(45),
    raca varchar(45),
    cod_cliente int,
    cod_consulta int,
    cod_servico int,
    foreign key (cod_cliente) references cliente (cod_cliente),
    foreign key (cod_consulta) references consulta(cod_consulta),
    foreign key (cod_servico) references servico (cod_servico)
);



create table if not exists cliente_funcionario(
	cod_cliente_funcionario int not null auto_increment primary key,
    cod_cliente int,
    cod_funcionario int,
    foreign key (cod_cliente) references cliente (cod_cliente),
    foreign key (cod_funcionario) references funcionario(cod_funcionario)
);

create table if not exists servico_funcionario(
	cod_servico_funcionario int not null auto_increment primary key,
    cod_servico int,
    cod_funcionario int,
    foreign key (cod_servico) references servico (cod_servico),
    foreign key (cod_funcionario) references funcionario (cod_funcionario)
);

create table if not exists produto_venda(
	cod_produto_venda int not null auto_increment primary key,
    cod_produto int,
    cod_venda int,
    foreign key (cod_produto) references produto (cod_produto),
    foreign key (cod_venda) references venda (cod_venda)
);

create table if not exists medicamento_produto(
	cod_medicamento_produto int not null auto_increment primary key,
    cod_medicamento int,
    cod_produto int,
    foreign key (cod_medicamento) references medicamento (cod_medicamento),
    foreign key (cod_produto) references produto (cod_produto)
);


insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Gabrielle Lima Oliveira','323.049.332-03','445456461','1980-01-01','F','Rua Santo Ângelo, 323 Alvorada-RS 94855-720','(51) 8336-5638');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Sofia Cavalcanti Cardoso','349.990.518-34','4545151','1970-02-02','F','Rua Rio de Janeiro, 1939 Catanduva-SP 15800-035','(31) 6309-3811');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Mariana Cavalcanti Rodrigues','676.800.364-03','44585161','1960-03-03','F','Rua José Egídio, 1098 Recife-PE 50780-610','(41) 4646-5171');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Rafaela Carvalho Dias','672.746.034-50','5646541','1977-04-04','F','Rua Carima, 1966 Juiz de Fora-MG 36021-430','(19) 9281-9477');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Gabriela Ferreira Lima','220.382.687-89','464564964','1988-05-08','F','Rua Princesa Izabel, 273 Lençóis Paulista-SP 18683-140','(11) 8216-3317');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Isabella Alves Castro','217.838.791-81','45451213','1989-06-07','F','Rua E, 1206 Governador Valadares-MG 35042-400 ','(71) 8370-9166');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Emily Fernandes Rocha','609.450.600-68','87848441','1990-07-13','F','Passagem Pioneiro, 908 Capanema-PA 68702-155 ','(16) 6173-5186');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Julieta Goncalves Oliveira','346.996.198-00','564654651','1991-08-20','F','Rua Cinco, 1425 Suzano-SP 08630-445','(69) 7654-9826');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Lucas Dias Martins','570.202.810-44','4646541','1968-09-22','M','Praça Hugo Viola, 531 Cariacica-ES 29140-440 ','(94) 3862-7807');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Kauã Cardoso Ferreira','435.128.433-10','32131561','1980-10-12','M','Rua 102, 889 Aparecida de Goiânia-GO 74988-500','(67) 2017-5168');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Arthur Cavalcanti Correia','416.268.960-11','3123131','1982-11-01','M','Rua 112, 788 Catalão-GO 75710-020 ','(12) 3340-8993');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Vinícius Costa Souza','412.267.939-75','1231321','1984-12-03','M','Rua Ariosto Vieira Rodrigues, 1431 Porto Alegre-RS 91130-510','(11) 4599-7022');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Kai Souza Melo','986.082.065-10','646546541','1985-01-17','M','Estrada Santa Edwiges, 1015 Itapevi-SP 06695-445','(21) 7811-9360');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Kauan Almeida Castro','884.719.165-33','65465412','1990-02-21','M','Quadra 704 Sul Alameda 14, 1510 Palmas-TO 77022-344','(62) 5059-4673');
insert into cliente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('José Silva Ferreira','977.012.577-64','56465411','1991-03-22','M','Rua Américo, 331 Blo Horizonte-MG 30250-412','(62) 9319-9813');

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Thiago Souza Fernandes','419.665.529-71','12545112','1992-03-05','Rua Manoel Joaquim da Silva, 460 Vrginha-MG 7062-260','(81) 6561-8370','M','motoboy',1600.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Júlio Barros Dias','817.046.180-45','454645641','1993-05-30','Rua Batovi, 1501 Ro Claro-SP 13503-153 ','(81) 5608-4466','M','motoboy',1600.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Tiago Cardoso Oliveira','405.407.271-21','54654110','1994-07-27','Rua Piratininga, 1100 Bauru-SP 17055-290','(19) 3168-3435','M','motoboy',1600.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Danilo Costa Pereira','991.780.069-70','454641454','1980-08-25','Rua Walter de Barros, 158 Vitória de Santo Antão-PE 55610-050','(81) 5735-4335','M','veterinario',4000.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Diogo Lima Carvalho','497.927.329-77','21311123','1981-09-24','Rua Otero Basso, 1871 Chapecó-SC 89804-420','(11) 8681-6846','M','veterinario',4000.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Kauan Ribeiro Santos','416.706.018-38','874848471','1982-10-23','Rua Gonçalves Dias, 1131 Jacareí-SP 12310-480 ','(92) 5175-9469','M','atendente',1300.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Carlos Ferreira Carvalho','826.895.559-72','8787464','1983-11-21','Rua Noemi de Moura Muzel, 686 Itapeva-SP 18407-250 ','(11) 4818-2500','M','atendente',1300.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Pedro Alves Rocha','451.184.440-20','879874','1984-12-20','Quadra 18, 606 Planaltina de Goiás-GO 73756-018','(61) 5379-6134','M','caixa',1400.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Guilherme Ferreira Lima','610.504.842-40','78997984','1985-05-17','Rua Juiz Humberto de Paiva, 1809 Belo Horizonte-MG 31760-090','(11) 7466-5826','M','caixa',1400.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Leonor Fernandes Azevedo','348.386.125-40','6465461','1986-06-08','Rua Acari, 335 Teresina-PI 64017-535','(81) 8717-5879','F','tosador',1500.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Carla Oliveira Cavalcanti','338.712.944-03','6554654561','1987-07-07','Rua Walter Santiago, 908 Aaguari-MG 38444-336 ','(19) 6714-6106','F','tosador',1500.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Sarah Dias Souza','803.046.544-00','564641','1988-08-06','Rua Praia Porto de Pedras, 841 Ponta Grossa-PR 84060-665','(11) 4898-3952','F','tosador',1500.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Evelyn Correia Araujo','718.496.909-01','46546541','1989-10-04','Rua Álvaro Waldemar Colino, 595 Araraquara-SP 14807-022','(28) 6743-8125','F','banhista',1300.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Isabela Sousa Ribeiro','119.860.990-75','46546541','1990-11-03','Rua Juvenal Toledo, 944 Mogi-Mirim-SP 13803-030','(95) 5826-7562','F','banhista',1300.00);
insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Sarah Barbosa Silva','791.132.462-08','56646544','1991-12-01','Rua 2, 45 Anápolis-GO 75114-240 ','(85) 2648-3896','F','motorista',1500.00);


insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('banho pequeno','banho',40.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('banho e tosa pequeno','banho e tosa',60.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('tosa pequeno','banho e tosa',40.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('banho medio','banho',50.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('banho e tosa medio','banho e tosa',70.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('tosa medio','banho e tosa',50.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('banho grande','banho',60.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('banho e tosa grande','banho e tosa',80.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('tosa grande','banho e tosa',60.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('entrega pequena distancia','transporte',10.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('entrega media distancia','transporte',30.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('entrega longa distancia','transporte',50.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('consulta simples','consulta',300.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('castracao macho','cirurgia',700.00,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico) values  ('castracao femea','cirurgia',700.00,1);


insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Chorulon 5000 Ui - Gonadotrofina','2019-04-12','2020-12-01','melhor performance no dia a dia');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Provermin Envelope - Fembendazol - 20 g','2019-03-04','2020-12-01','Remédio pra verme de ave.');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Ocitocina Forte Ucb - 100 ml','2019-04-08','2020-12-01','ação sobre a musculatura lisa do útero');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Mata Bicheira Forte SV','2019-02-03','2020-12-01','larvicida, bernicida, repelente e cicatrizante');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Ocitopec Injetável - Ocitocina','2019-10-11','2021-12-01','auxilia trabalho de parto e mastites.');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Mastizone Vaca Seca 10 ml','2019-07-22','2021-12-01','tratamento de mastite');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Placencal','2019-04-20','2020-12-01','musculatura do útero e glândulas mamárias');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Vermisal Champion','2019-09-13','2021-12-01','para corrigir as carências de microminerais.');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Dectomax Doramectina Zoetis','2019-05-30','2021-12-01','solucao injetavel');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Terramicina La - Oxitetraciclina','2019-03-09','2022-12-01','Poderoso antibiótico');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Hipofen Pasta - 20 g','2019-05-10','2021-12-01','anti-parasitário');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Mastizone Plus Lactação - 10 g','2019-06-10','2022-12-01','tratamento das mastites');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Mata Bicheira Silverbac','2019-12-11','2021-12-01','Silverbac Mata Bicheira Prata! ');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Ivomec Injetável - Ivermectina','2019-03-01','2021-12-01','Combate principais parasitos');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values  ('Monovin A Bravet (Vitamina A)','2019-01-01','2020-12-01','O concentrado de Vitamina A ');

insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Strondal Plus',14,9.22,'indubras',0.1,'Anti-helmíntico');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Natu Verm',16,5.76,'naturrich',0.1,'vermifugo');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Canex Composto',15,6.02,'ceva',0.1,'vermifugo');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Talfon top',20,3.83,'indubras',0.1,'antipulgas');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Ração Caes adultos',15,20.89,'Pro Plan',2,'racao');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Ração Caes adultos',10,25.89,'Royal Canin',1,'racao');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Ração gatos filhotes',20,19.98,'Golden',1,'racao');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Ração Caes filhotes',15,26.30,'Golden',2,'racao');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Ração Caes filhotes',10,16.90,'Dog Chow',1,'racao');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Ração Caes adultos',20,21.20,'max',1,'racao');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Ração Caes adultos',15,23.60,'pedigree',2,'racao');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Ração Caes adultos',15,26.60,'pedigree',1,'racao');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Ração Caes filhotes',14,27.00,'max',2,'racao');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Ossinho',20,23.93,'ceva',1,'brinquedo');
insert into produto (nome,quantidade,valorproduto,marca,peso,tipoproduto) values  ('Bolinha',13,25.50,'nero',1,'brinquedo');


insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-10-11','10:10:10',0,60.00,13,2);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-09-12','09:11:16',0,60.00,14,2);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-09-13','08:13:15',0,60.00,13,2);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-08-14','07:20:18',0,60.00,14,2);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-08-15','08:44:19',0,300.00,4,13);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-07-16','09:50:21',0,700.00,5,14);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-07-17','10:05:23',0,60.00,14,7);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-06-18','11:08:25',0,10.00,1,10);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-06-19','12:09:34',0,300.00,4,13);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-06-20','13:07:33',0,70.00,13,5);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-06-21','14:06:40',0,50.00,14,4);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-05-22','15:05:32',0,50.00,13,4);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-04-23','16:01:31',0,30.00,1,11);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-03-24','17:04:13',0,30.00,2,11);
insert into venda (data,hora,desconto,valortotal,cod_funcionario,cod_servico) values ('2020-02-25','18:03:30',0,50.00,15,12);


insert into consulta (data,hora,descricao,cod_servico) values ('2020-10-11','10:10:10','consulta simples',13);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-09-12','09:11:16','castracao macho',14);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-09-13','08:13:15','castracao femea',15);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-08-14','07:20:18','castracao macho',14);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-08-15','08:44:19','castracao femea',15);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-07-16','09:50:21','consulta simples',13);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-07-17','10:05:23','consulta simples',13);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-06-18','11:08:25','castracao macho',14);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-06-19','12:09:34','castracao femea',15);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-06-20','13:07:33','consulta simples',13);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-06-21','14:06:40','castracao macho',14);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-05-22','15:05:32','castracao femea',15);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-04-23','16:01:31','consulta simples',13);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-03-24','17:04:13','consulta simples',13);
insert into consulta (data,hora,descricao,cod_servico) values ('2020-02-25','18:03:30','consulta simples',13);


insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_consulta,cod_servico) values ('Toto','M','2018-05-13','amarelo','cachorro','pastor-alemao',1,1,13);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_consulta,cod_servico) values ('Belinha','F','2016-04-07','chocolate','gato','persa',2,1,13);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_consulta,cod_servico) values ('Rambo','M','2015-10-17','branco','gato','siames',3,1,13);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_consulta,cod_servico) values ('Juju','F','2016-11-03','preto','cachorro','poodle',4,1,13);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_servico) values ('Billy','M','2015-04-25','cinzento','gato','ragdoll',5,2);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_servico) values ('Pitty','M','2015-09-27','dourado','cachorro','labrador',6,2);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_servico) values ('Lulu','F','2017-03-14','creme','cachorro','chihuahua',7,2);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_servico) values ('Thor','M','2017-01-20','branco','cachorro','corgi',8,2);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_servico) values ('Luke','M','2018-03-05','preto','gato','persa',9,7);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_servico) values ('Mel','F','2018-04-05','chocolate','cachorro','buldogue',10,7);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_servico) values ('Lili','F','2019-12-14','dourado','gato','persa',11,7);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_servico) values ('Luna','F','2019-10-10','creme','gato','ragdoll',12,2);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_servico) values ('Lilica','F','2016-08-23','amarelo','cachorro','buldogue',13,7);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_servico) values ('Boris','M','2016-04-28','cinzento','cachorro','poodle',14,5);
insert into animal (nome,sexo,datanascimento,cor,tipoanimal,raca,cod_cliente,cod_servico) values ('Zeus','M','2015-05-13','branco','gato','persa',15,5);


insert into cliente_funcionario(cod_cliente,cod_funcionario) values (1,6);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (2,6);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (3,6);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (4,8);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (5,9);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (6,8);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (7,9);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (8,8);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (9,7);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (10,6);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (11,7);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (12,7);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (13,6);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (14,8);
insert into cliente_funcionario(cod_cliente,cod_funcionario) values (15,9);




insert into servico_funcionario(cod_servico,cod_funcionario) values (2,10);
insert into servico_funcionario(cod_servico,cod_funcionario) values (2,11);
insert into servico_funcionario(cod_servico,cod_funcionario) values (2,12);
insert into servico_funcionario(cod_servico,cod_funcionario) values (5,13);
insert into servico_funcionario(cod_servico,cod_funcionario) values (5,14);
insert into servico_funcionario(cod_servico,cod_funcionario) values (5,11);
insert into servico_funcionario(cod_servico,cod_funcionario) values (5,13);
insert into servico_funcionario(cod_servico,cod_funcionario) values (12,15);
insert into servico_funcionario(cod_servico,cod_funcionario) values (11,1);
insert into servico_funcionario(cod_servico,cod_funcionario) values (12,2);
insert into servico_funcionario(cod_servico,cod_funcionario) values (11,3);
insert into servico_funcionario(cod_servico,cod_funcionario) values (13,4);
insert into servico_funcionario(cod_servico,cod_funcionario) values (13,5);
insert into servico_funcionario(cod_servico,cod_funcionario) values (14,4);
insert into servico_funcionario(cod_servico,cod_funcionario) values (15,4);


insert into produto_venda (cod_produto,cod_venda) values (14,4);
insert into produto_venda (cod_produto,cod_venda) values (14,3);
insert into produto_venda (cod_produto,cod_venda) values (15,1);
insert into produto_venda (cod_produto,cod_venda) values (14,2);
insert into produto_venda (cod_produto,cod_venda) values (5,3);
insert into produto_venda (cod_produto,cod_venda) values (6,4);
insert into produto_venda (cod_produto,cod_venda) values (7,5);
insert into produto_venda (cod_produto,cod_venda) values (8,6);
insert into produto_venda (cod_produto,cod_venda) values (9,7);
insert into produto_venda (cod_produto,cod_venda) values (10,8);
insert into produto_venda (cod_produto,cod_venda) values (14,9);
insert into produto_venda (cod_produto,cod_venda) values (15,10);
insert into produto_venda (cod_produto,cod_venda) values (14,11);
insert into produto_venda (cod_produto,cod_venda) values (14,12);
insert into produto_venda (cod_produto,cod_venda) values (15,13);


insert into medicamento_produto(cod_medicamento,cod_produto) values (14,2);
insert into medicamento_produto(cod_medicamento,cod_produto) values (10,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (11,4);
insert into medicamento_produto(cod_medicamento,cod_produto) values (1,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (2,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (3,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (4,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (5,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (6,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (7,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (8,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (9,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (11,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (12,1);
insert into medicamento_produto(cod_medicamento,cod_produto) values (13,1);

/*UPDATES 5*/
update produto
set nome = 'medicamento'
where cod_produto = 1;

update produto
set tipoproduto = 'frasco'
where cod_produto = 1;

update produto
set valorproduto = 0.0
where cod_produto = 1;

update produto
set valorproduto = 0.0
where cod_produto = 1;

update produto
set marca = 'marca'
where cod_produto = 1;

/*DELETES 5*/

delete from consulta
where cod_consulta = 15;

delete from consulta
where cod_consulta = 14;

delete from consulta
where cod_consulta = 13;

delete from servico
where cod_servico = 1;

delete from servico
where cod_servico = 3;

/* VIEWS 3 */

create view vw_select_funcionarios_cargo as 
select nome,cargo from funcionario
where cargo is not null;

create view vw_donoanimais as select c.nome as nome_dono, a.nome as nome_animal from cliente c
join animal a on c.cod_cliente = a.cod_animal;

create view vw_lista_produto as
select * from produto;

/*SELECTS 5, AO MENOS UM COM JOIN*/

select cod_servico, nomeservico, cod_funcionario, cargo from servico
join funcionario
on cod_servico = cod_funcionario;

select * from vw_select_funcionarios_cargo
where cargo = 'motoboy' or cargo = 'motorista';

select * from vw_lista_produto
where tipoproduto = 'racao';

select * from medicamento;

select * from animal;

/* Exercicio dia 10/11/2020*/

/*QUANTOS ANIMAIS SÃO CACHORROS ?*/
select count(tipoanimal) as total_cachorro from animal
where tipoanimal = 'cachorro';

/*QUANTOS ANIMAIS SÃO MACHOS E QUANTOS SÃO FEMEAS?*/
select sexo,count(*) as quantidade from animal
group by sexo;

/*QUANTOS ANIMAIS NÃO SÃO CACHORROS?*/
select count(tipoanimal) as qtd_naosaocachorro from animal
where tipoanimal != 'cachorro';

/*QUANTOS SERVICO ERAM CONSULTAS ?*/
select count(tipodeservico) from servico
where tipodeservico = 'consulta';

/*QUAL O SERVICO MAIS CARO ?*/
SELECT nomeservico, valorservico FROM servico
WHERE valorservico = (SELECT max(valorservico) FROM servico);

/*QUAL O VALOR TOTAL DOS SERVICOS?*/
select sum(valorservico) as valor_total_servicos from servico;

/*QUAL PRODUTO FOI MAIS VENDIDO?*/
select produto.nome, count(produto_venda.cod_produto) from produto
join produto_venda
on produto.cod_produto = produto_venda.cod_produto_venda
group by produto_venda.cod_produto;

/*QUANTOS VETERINARIOS TEM A CLÍNICA?*/
select count(cargo) as qtd_veterinarios from funcionario
where cargo = 'veterinario';

/*QUANTOS VETERINARIOS SÃO HOMENS E QUANTOS SÃO MULHERES?*/
select sexo, count(cargo) as sexo_veterinarios from funcionario
where cargo = 'veterinario'
group by sexo;
