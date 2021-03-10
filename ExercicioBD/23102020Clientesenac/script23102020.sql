create database senac;

use senac;

create table if not exists aluno(
	cod_aluno int not null auto_increment primary key,
    nomealuno varchar(45) not null,
    emailaluno varchar(45) not null,
    matricula varchar(45) not null,
    datanascimento DATE not null,
    cpfresponsavel varchar(15) not null,
    nomepai varchar(45) not null,
    nomemae varchar(45) not null,
    endereco varchar(100) not null,
    sexo char(1) not null,
    telefone varchar(20) not null,
    statusaluno varchar(45) not null
);

create table if not exists curso(
	cod_curso int not null auto_increment primary key,
    cargahoraria int not null,
    nomecurso varchar(100) not null,
    modalidadeensino enum('a distancia','presencial') not null,
    valorcurso double not null,
    descricao varchar(45) not null
);



create table if not exists professor(
	cod_professor int not null auto_increment primary key,
    telefone varchar(20) not null,
    datanascimento DATE not null,
    nomeprofessor varchar(45) not null,
    dataadmissao DATE,
    emailprofessor varchar(45) not null,
    statusprofessor varchar(45) not null,
    formacao varchar(45) not null,
    matriculaprofessor varchar(45) not null,
    endereco varchar(100) not null,
    sexo char(1) not null
);

create table if not exists laboratorio(
	cod_laboratorio int not null auto_increment primary key,
    nomelaboratorio varchar(45) not null,
    locallaboratorio varchar(45) not null,
    qntlaboratorio INT not null
);

create table if not exists turma(
	cod_turma int not null auto_increment primary key,
    nometurma varchar(45) not null,
    turno varchar(45) not null,
    datainicio DATE not null,
    datafinal DATE not null,
    cod_curso int,
    cod_aluno int,
    cod_professor int,
    foreign key (cod_curso) references curso (cod_curso),
    foreign key (cod_aluno) references aluno (cod_aluno),
    foreign key (cod_professor) references professor(cod_professor)
);


create table if not exists aluno_curso(
	cod_aluno_curso int not null auto_increment primary key,
    cod_aluno int,
    cod_curso int,
    foreign key (cod_aluno) references aluno (cod_aluno),
    foreign key (cod_curso) references curso (cod_curso)
);

create table if not exists professor_curso(
	cod_professor_curso int not null auto_increment primary key,
    cod_professor int,
    cod_curso int,
    foreign key (cod_professor) references professor(cod_professor),
    foreign key (cod_curso) references curso (cod_curso)
);

create table if not exists laboratorio_turma(
	cod_laboratorio_turma int not null auto_increment primary key,
    cod_laboratorio int,
    cod_turma int,
    foreign key (cod_laboratorio) references laboratorio(cod_laboratorio),
    foreign key (cod_turma) references turma (cod_turma)
);


insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Eric D. Roberts','EricDRoberts@jourrapide.com','11123464','1973-10-18','239.740.609-87','Paul J. Roberts','Livia Rodrigues Silva','Quadra SMPW Quadra 25 Conjunto 03, 761','M','(31)2492-3611','matriculado');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Eugene L. Boles','eugenel@gmail.com','4545411','1970-19-04','105.257.129-84 ','Corey C. Tatum','Marisa Cunha Martins','Rua Leoclides Pereira de Macedo, 829','M','(21)2070-4301','matriculado');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Louis S. Carson','louiss@gmail.com','12421121','1968-06-06','194.027.617-99 ','Tommy M. Guerrero','Isabelle Pereira Cardoso','Rua das Carnaúbas, 1983','M','(11)3498-8610','matriculado');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Clarence P. Hylton','claurence@gmail.com','2225441','1943-12-09','516.304.958-59 ','Michael S. Ford','Mariana Souza Azevedo','Rua Cícero Fortes Portella, 890','M','(11)6213-7563','inativo');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Joseph K. Diaz','joseph@gmail.com','5544414','1968-08-14','108.287.737-93 ','George D. Smith','Vitoria Correia Rocha','Rua Eudóxia Barros, 1157','M','(17)2490-4156','inativo');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Guilherme Souza Ribeiro','guilheremesouz@gmail.com','4444511','1996-11-13','465.759.162-28 ','David C. Collette','nomemae','Rua Eneias Miranda, 210 São João de Meriti-RJ 25540-000 ','M','(71)4353-2124','inscrito');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Thiago Correia Rocha','thiagocorre@gmail.com','6655544','1997-12-09','510.716.454-47 ','Stephen C. Herndon','Carla Azevedo Barros','Rua 21, 1318 Manaus-AM 69099-090 ','M','(62)8965-4381','inscrito');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Giovanna Lima Dias','giovannalim@gmail.com','5565464','1941-07-17','708.476.216-77 ','Angel B. Seaton','Livia Silva Martins','Rua Dez, 938 Francisco Morato-SP 07945-050 ','F','(27)9555-7769','inativo');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Carolina Melo Oliveira','carolinamel@gmail.com','65464564','1938-07-19','251.596.581-49 ','João Dias Oliveira','Beatriz Cunha Santos','Avenida Magid Simão Trad, 945 Ribeirão Preto-SP 14071-010 ','F','(71)3383-3440','matriculado');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Ana Sousa Pinto','anasousa@gmail.com','777774','1952-11-29','710.844.971-40 ','Vitór Barbosa Goncalves','Anna Silva Gomes','Rua Padre Roque, 459 Mogi-Mirim-SP 13800-033 ','F','(11)2621-3131','matriculado');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Luiza Gomes Lima','luizagomes@gmail.com','3322134','1970-01-12','962.325.885-25 ','Miguel Dias Alves','Anna Goncalves Correia','Travessa Margarida Arosa, 1255 São Paulo-SP 04416-390 ','F','(42) 4885-4911','matriculado');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Melissa Dias Melo','melissadias@gmail.com','5554364','1990-11-05','934.932.417-20 ','Otávio Carvalho Almeida','Julieta Pereira Alves','Rua Paris, 831 Canoas-RS 92130-230 ','F','(11)6077-8278','matriculado');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Rafaela Barros Melo','rafaelbarros@gmail.com','6564641','1965-08-28','162.187.683-76 ','José Cardoso Souza','Fernanda Cunha Barros','Rua Monte Carmelo, 1763 Curitiba-PR 81825-170 ','F','(13)6745-7305','inativo');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Rodrigo Costa Alves','rodrigocosta@gmail.com','6654654','1972-01-01','591.668.705-26 ','Martim Silva Martins','Thaís Pereira Alves','Praça João XXIII, 410 Maceió-AL 57025-310 ','F','(22)6017-5859','inscrito');
insert into aluno (nomealuno,emailaluno,matricula,datanascimento,cpfresponsavel,nomepai,nomemae,endereco,sexo,telefone,statusaluno) values ('Júlio Gomes Fernandes','juliogomes@gmail.com','6546464','1992-06-29','992.993.182-12 ','Luan Lima Almeida','Vitória Cardoso Castro','Rua São Benedito, 1676 Campinas-SP 13060-484 ','F','(19)8387-7158','inscrito');


insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (160,'Assistente Administrativo','a distancia',200.00,'Aprenda a realizar atividades de apoio administrativo ');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (1000,'Técnico em Administração ','presencial',240.00,'aprenda sobre administração');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (800,'Técnico em Secretariado','presencial',330.00,'aprenda a realizar serviços de secretariado');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (60,'Técnicas Avançadas Word Excel e Power Point','presencial',540.00,'aprenda as técnicas de word excel e power point avancado');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (160,'Assistente de Recursos Humanos ','a distancia',330.00,'aprenda a dar assistência ao recursos humanos');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (48,'Análise de Faturamento de Serviços de Saúde ','a distancia',200.00,'aprenda sobre faturamento serviços de saude');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (800,'Técnico em Finanças','presencial',300.00,'aprenda sobre finanças');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (160,'Recepcionista','a distancia',280.00,'torne-se recepcionista');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (180,'Assistente de Secretaria Escolar','a distancia',530.00,'auxilia na secretaria de escolas');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (80,'Estamparia - Design de Superfície','a distancia',550.00,'aprenda sobre estamparia');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (40,'Noções de Interpretação Clínica de Exames Laboratoriais','a distancia',550.00,'aprenda as noções de interpretação de exames laboratoriais');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (40,'Gastronomia para Pessoas com Restrições Alimentares ','presencial',170.00,'aprenda sobre este tipo de gastronomia');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (60,'Administração em Serviços Hospitalares','a distancia',340.00,'administra serviços hospitalares');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (20,'Microsoft Power BI Básico','presencial',200.00,'aprenda o básico de power bi');
insert into curso (cargahoraria,nomecurso,modalidadeensino,valorcurso,descricao) values (36,'Preparo de Alimentos Congelados ','a distancia',400.00,'aprenda como preparar alumentos congelados');



insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de informatica','1º Andar',7);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Administração','1º Andar',2);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Mecanismos e Automação','2º Andar',3);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Recursos Humanos','1º Andar',1);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Robótica Aplicada','2º Andar',4);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Robótica e Acionamentos','1º Andar',2);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Circuitos Elétricos','2º Andar',2);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Enfermagem','1º Andar',1);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Materiais','2º Andar',3);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório Oficina','3º Andar',4);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Contabilidade','1º Andar',1);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Simulação','2º Andar',2);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Culinária','1º Andar',3);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Exames Laboratoriais','3º Andar',3);
insert into laboratorio (nomelaboratorio,locallaboratorio,qntlaboratorio) values ('Laboratório de Estética','3º Andar',4);



insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(31)2492-3611','1968-08-28','Carla Cunha Cavalcanti','2018-07-01','CarlaCunhaCavalcanti@dayrep.com','ativo','superior','45454415','Rua W, 1664 Contagem-MG 32020-040 ','F');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(11)2483-6955','1975-07-24','Gustavo Barbosa Almeida','2018-06-05','GustavoBarbosaAlmeida@jourrapide.com','ativo','superior','5545941','Rua São José de Caiana, 1467 São Paulo-SP 03819-020 ','M');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(42)6838-3315','1975-01-10','Luís Gomes Carvalho','2017-05-01','LuisGomesCarvalho@dayrep.com','ativo','mestre','5545841','Rua General Manoel F. do V. Aranha, 1167 Castro-PR 84178-070 ','M');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(11)5470-3484','1936-05-21','Beatrice Oliveira Araujo','2020-05-20','BeatriceOliveiraAraujo@dayrep.com','ativo','mestre','6464891','Rua Lavapés, 1343 Cotia-SP 06717-172 ','F');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(14)8575-7774','1972-09-12','Manuela Souza Castro','2017-07-19','ManuelaSouzaCastro@dayrep.com','inativo','doutor','54894126','Rua Ademar de Barros, 400 Avaré-SP 18705-220 ','F');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(19)3930-3293','1966-04-26','Carolina Cardoso Melo','2018-04-20','CarolinaCardosoMelo@dayrep.com','ativo','especialista','6545648','Rua Djanira da Maria e Silva, 173 Campinas-SP 13056-325 ','F');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(11)6199-4686','1950-11-22','Yasmin Castro Santos','2015-05-17','YasminCastroSantos@jourrapide.com','ativo','especialista','6546841','Rua Doutor Mário Romeu de Lucca, 1323 São Paulo-SP 02850-060 ','F');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('11)2700-4472','1972-12-01','Luís Almeida Ribeiro','2019-01-20','luisalmeida@gmail.com','ativo','mestre','5445451','Rua 7 B, 1646 Goiânia-GO 74455-542 ','M');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(85)4034-4742','1980-07-13','Davi Oliveira Ribeiro','2020-02-01','DaviOliveiraRibeiro@rhyta.com','inativo','doutor','6654541','Rua Francisco Alves, 814 Chapecó-SC 89805-096 ','M');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(85)5713-5410','1979-06-05','Kai Barros Sousa','2019-05-03','KaiBarrosSousa@armyspy.com','ativo','especialista','5494984','Rua Aurora Guimarães Segolim, 545 São José dos Campos-SP 12239-100 ','M');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(31)3694-8415','1991-04-28','Júlio Dias Pinto','2020-02-05','JulioDiasPinto@armyspy.com','ativo','especialista','46546494','Praça Poá, 249 Belo Horizonte-MG 31140-050 ','M');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(14)7783-6910','1990-07-05','Diego Sousa Santos','2019-04-03','DiegoSousaSantos@armyspy.com','inativo','especialista','646549841','Rua Ângelo Molan, 900 Jaú-SP 17203-061','M');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(12)8064-7943','1982-04-13','Julian Santos Cavalcanti','2019-04-03','JulianSantosCavalcanti@rhyta.com','inativo','doutor','65798411','Rua Gabriel Felfilli, 1475 Várzea Grande-MT 78118-115','M');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(13)3330-8642','1980-03-17','Diogo Carvalho Correia','2019-05-03','DiogoCarvalhoCorreia@rhyta.com','inativo','mestre','54648411','Rua Arquiteto Georg Keller, 374 Joinville-SC 89225-326 ','M');
insert into professor (telefone,datanascimento,nomeprofessor,dataadmissao,emailprofessor,statusprofessor,formacao,matriculaprofessor,endereco,sexo) values ('(11)8267-7324','1979-04-05','Giovanna Ferreira Goncalves','2019-07-03','GiovannaFerreiraGoncalves@jourrapide.com','ativo','especialista','5484151','Rua São José, 1727 Macaé-RJ 27946-265 ','F');


insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('informaticaM','matutino','2020-01-03','2020-05-13',4,1,1);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('infomaticaN','noturno','2020-02-05','2020-07-13',14,2,2);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('informaticaV','vespertino','2020-01-03','2020-03-13',1,3,3);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('informaticaV','vespertino','2020-01-03','2020-03-13',2,4,6);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('informaticaM','matutino','2020-01-03','2020-03-13',3,5,7);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('infomaticaN','noturno','2020-05-13','2020-08-13',4,6,8);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('infomaticaN','noturno','2020-05-13','2020-08-13',5,7,9);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('administracaoM','matutino','2020-05-13','2020-07-13',6,8,10);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('administracaoN','noturno','2020-05-13','2020-08-13',7,9,11);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('administracaoV','vespertino','2020-05-13','2020-07-13',8,10,15);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('gastronomiaM','matutino','2020-05-15','2020-08-13',9,11,1);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('gastronomiaV','vespertino','2020-05-14','2020-09-13',10,12,2);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('gastronomiaN','noturno','2020-05-16','2020-08-13',11,13,15);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('secretariaEscolarN','noturno','2020-04-12','2020-06-13',12,14,4);
insert into turma (nometurma,turno,datainicio,datafinal,cod_curso,cod_aluno,cod_professor) values ('FaturamentoSaudeN','noturno','2020-05-13','2020-08-13',15,15,3);

insert into aluno_curso (cod_aluno,cod_curso) values (1,1);
insert into aluno_curso (cod_aluno,cod_curso) values (2,2);
insert into aluno_curso (cod_aluno,cod_curso) values (3,3);
insert into aluno_curso (cod_aluno,cod_curso) values (4,4);
insert into aluno_curso (cod_aluno,cod_curso) values (5,5);
insert into aluno_curso (cod_aluno,cod_curso) values (6,6);
insert into aluno_curso (cod_aluno,cod_curso) values (7,7);
insert into aluno_curso (cod_aluno,cod_curso) values (8,8);
insert into aluno_curso (cod_aluno,cod_curso) values (9,9);
insert into aluno_curso (cod_aluno,cod_curso) values (10,10);
insert into aluno_curso (cod_aluno,cod_curso) values (11,11);
insert into aluno_curso (cod_aluno,cod_curso) values (12,12);
insert into aluno_curso (cod_aluno,cod_curso) values (13,13);
insert into aluno_curso (cod_aluno,cod_curso) values (14,14);
insert into aluno_curso (cod_aluno,cod_curso) values (15,15);

insert into laboratorio_turma (cod_laboratorio,cod_turma) values (1,1);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (2,8);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (2,9);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (2,10);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (1,2);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (1,3);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (1,4);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (1,5);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (1,6);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (13,11);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (13,12);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (13,13);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (2,14);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (14,15);
insert into laboratorio_turma (cod_laboratorio,cod_turma) values (1,7);


insert into professor_curso (cod_professor,cod_curso) values (1,1);
insert into professor_curso (cod_professor,cod_curso) values (2,2);
insert into professor_curso (cod_professor,cod_curso) values (3,3);
insert into professor_curso (cod_professor,cod_curso) values (6,4);
insert into professor_curso (cod_professor,cod_curso) values (2,5);
insert into professor_curso (cod_professor,cod_curso) values (7,6);
insert into professor_curso (cod_professor,cod_curso) values (8,7);
insert into professor_curso (cod_professor,cod_curso) values (9,8);
insert into professor_curso (cod_professor,cod_curso) values (1,9);
insert into professor_curso (cod_professor,cod_curso) values (2,10);
insert into professor_curso (cod_professor,cod_curso) values (3,11);
insert into professor_curso (cod_professor,cod_curso) values (6,12);
insert into professor_curso (cod_professor,cod_curso) values (7,13);
insert into professor_curso (cod_professor,cod_curso) values (8,14);
insert into professor_curso (cod_professor,cod_curso) values (9,15);

/*5 selects*/

select nomealuno, nomecurso from aluno
join curso
on cod_aluno = cod_curso;

select * from professor;

select * from aluno;

select nomealuno, emailaluno, matricula, telefone, statusaluno from aluno
where statusaluno = 'matriculado';

select nomeprofessor, statusprofessor, formacao from professor
where statusprofessor = 'ativo';

/*5 update*/

update aluno
set matricula = '84874154'
where cod_aluno = 1;

update curso
set valorcurso = 800.00
where cod_curso = 2;

update professor
set telefone = '(61)9999-9999'
where cod_professor = 1;

update turma
set turno = 'vespertino'
where cod_turma = 8;

update laboratorio
set nomelaboratorio = 'Laboratório de Informática'
where cod_laboratorio = 1;

/*5 delete*/

delete from professor_curso
where cod_professor_curso = 14;

delete from aluno_curso
where cod_aluno_curso = 14;

delete from laboratorio_turma
where cod_laboratorio_turma = 4;

delete from professor
where cod_professor = 14;

delete from laboratorio
where cod_laboratorio = 15;

/*3 views*/

create view vw_selprofcurso as select * from professor
join curso
on cod_professor = cod_curso;

create view vw_cursos as 
select * from curso;

create view vw_alunos as 
select * from aluno;


/* Quantos alunos são do sexo masculino e quantos são do sexo feminino*/

select sexo, count(nomealuno) as qnt_aluno from aluno
group by sexo;

/**Quantas alunas do sexo feminino pagaram pelos cursos no total*/

select nomealuno from aluno
where sexo = 'F' and statusaluno = 'matriculado';

/*Quantos Cursos foram vendidos*/

select count(cod_curso) as qnt_cursovendidos from aluno_curso;

/*Valor total de cursos vendidos*/

select sum(valorcurso) as valor_total_cursos from curso;

/*Quantos cursos foram vendidos para homens e quantos foram vendidos para mulheres*/

select sexo,count(nomealuno) as qntcursovendidos from aluno
where statusaluno = 'matriculado'
group by sexo;