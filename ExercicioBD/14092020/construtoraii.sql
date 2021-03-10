create database if not exists construtoraii;

use construtoraii;


create table if not exists departamento(
	cod_departamento int not null auto_increment primary key,
	nome varchar(45) not null,
	setor varchar(45) not null
);

create table if not exists projeto(
cod_projeto int not null auto_increment primary key,
    nome varchar(45) not null,
    cod_departamento int,
    foreign key (cod_departamento) references departamento (cod_departamento)
);

create table if not exists empregado(
	cod_empregado int not null auto_increment primary key,
    nome varchar(45) not null,
    cpf varchar(15) not null,
	uf char(2) not null,
	sexo char(1) not null,
    cod_empregado_fk int,
    cod_departamento int,
    foreign key (cod_empregado_fk) references empregado(cod_empregado),
    foreign key (cod_departamento) references departamento (cod_departamento)
    
);


create table if not exists empregado_projeto(
	cod_empregado_projeto int not null auto_increment primary key,
    cod_empregado int,
    cod_projeto int,
    foreign key (cod_empregado) references empregado (cod_empregado),
    foreign key (cod_projeto) references projeto(cod_projeto)
);



use construtoraii;

select * from empregado;

insert into departamento (nome,setor) values ('rh','departamento pessoal');

insert into empregado (nome,cpf,uf,sexo,cod_departamento) values ('Ananias','25454684','sp','m',1);
insert into empregado (nome,cpf,uf,sexo,cod_departamento) values ('Valter','15645641','df','m',1);
insert into empregado (nome,cpf,uf,sexo,cod_departamento) values ('Elias','878454561','rj','m',1);
insert into empregado (nome,cpf,uf,sexo,cod_departamento) values ('Diego','44546461','sp','m',1);
insert into empregado (nome,cpf,uf,sexo,cod_departamento) values ('Roberto','32124541','df','m',1);
insert into empregado (nome,cpf,uf,sexo,cod_departamento) values ('Barbara','444551541','rj','f',1);
insert into empregado (nome,cpf,uf,sexo,cod_departamento) values ('Ana Clara','222545412','sp','f',1);
insert into empregado (nome,cpf,uf,sexo,cod_departamento) values ('Priscila','88456664','df','f',1);
insert into empregado (nome,cpf,uf,sexo,cod_departamento) values ('Lohayne','4451335541','sp','f',1);
insert into projeto (nome,cod_departamento) values ('selecao de pessoas',1);

select * from empregado;

delete from empregado
where cod_empregado = 23;

UPDATE empregado SET salario = 4000 WHERE cod_empregado = 1;
UPDATE empregado SET salario = 4000 WHERE cod_empregado = 1;
UPDATE empregado SET salario = 4000 WHERE cod_empregado = 1;
UPDATE empregado SET salario = 4000 WHERE cod_empregado = 1;
UPDATE empregado SET salario = 4000 WHERE cod_empregado = 1;
UPDATE empregado SET salario = 4000 WHERE cod_empregado = 1;
UPDATE empregado SET salario = 4000 WHERE cod_empregado = 1;
UPDATE empregado SET salario = 4000 WHERE cod_empregado = 1;
UPDATE empregado SET salario = 4000 WHERE cod_empregado = 1;

alter table empregado
add column salario double;

insert into empregado_projeto(cod_empregado,cod_projeto) values (4,1);
insert into empregado_projeto(cod_empregado,cod_projeto) values (5,1);
insert into empregado_projeto(cod_empregado,cod_projeto) values (6,1);
insert into empregado_projeto(cod_empregado,cod_projeto) values (7,1);
insert into empregado_projeto(cod_empregado,cod_projeto) values (8,1);
insert into empregado_projeto(cod_empregado,cod_projeto) values (9,1);
insert into empregado_projeto(cod_empregado,cod_projeto) values (10,1);
insert into empregado_projeto(cod_empregado,cod_projeto) values (11,1);


/*OPERADOR*/

select * from empregado where sexo = 'f' and uf = 'sp';

select * from empregado where sexo = 'f' and not uf = 'df';

select * from empregado where uf = 'm' or uf = 'sp';

select * from empregado where uf = 'sp' and not sexo = 'm';

select * from empregado where uf = 'sp' and not sexo = 'f';

select * from empregado where uf = 'df' or sexo = 'm';

select * from empregado where uf = 'rj' or sexo = 'f';

select * from empregado where uf = 'rj' and sexo = 'm';

select * from empregado where uf = 'rj' and not sexo = 'm';

select * from empregado where uf = 'rj' or uf = 'df';

select * from empregado where uf = 'sp' and not uf = 'rj';

select * from empregado where uf = 'rj' or uf = 'df';

select * from empregado where uf = 'rj' and not uf = 'df';

select * from empregado where uf = 'df' and not sexo = 'm';

select * from empregado where uf = 'rj' and sexo = 'm';

select * from empregado where uf = 'rj' and sexo = 'f';

/*AGREGACAO*/

select count(*) as totalempregados from empregado;

select count(distinct salario) from empregado;

select max(salario) from empregado;

select min(salario) from empregado;

select avg(salario) from empregado;

select sum(salario) from empregado;

select count(*) as total_projeto from projeto;

select max(valorprojeto) from projeto;

select min(valorprojeto) from projeto;

select avg(valorprojeto) from projeto;

select sum(valorprojeto) from projeto;

select count(*) as total_departamento from departamento;

select count(distinct valorprojeto) from projeto;

select count(*) as total_empregado_projeto from empregado_projeto;