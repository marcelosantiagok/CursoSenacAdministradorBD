create database if not exists exerciciosql;

use exerciciosql;

create table if not exists funcionarios(
	cod_funcionarios int not null auto_increment primary key,
    nome varchar(20) not null,
    segundonome varchar(20) not null,
    ultimonome varchar(20) not null,
    datanasci DATE not null,
    cpf varchar(15) not null,
    rg varchar(15) not null,
    endereco varchar(100) not null,
    cep varchar(15) not null,
    cidade varchar(30) not null,
    fone varchar(20) not null,
    funcao varchar(30),
    salario double
);
select * from funcionarios;

select * from departamentos;

/*cod_departamento int,*/

create table if not exists departamentos(
	cod_departamentos int not null auto_increment primary key,
    nome varchar(45) not null,
    localizacao varchar(40) not null
);
   /*cod_funcionario_gerente int*/
   
select * from funcionarios;

alter table funcionarios
add column cod_departamento int;

alter table departamentos
add column cod_func_ger int;

select * from funcionarios;

select * from departamentos;

alter table funcionarios
add foreign key(cod_departamento) references departamentos (cod_departamentos);

alter table departamentos
add foreign key (cod_func_ger) references funcionarios (cod_funcionarios);


select nome, ultimonome from funcionarios
order by ultimonome;

select * from funcionarios
order by cidade;

select nome,segundonome,ultimonome from funcionarios
where salario > 1000
order by nome,segundonome,ultimonome;


select datanasci, nome from funcionarios
order by datanasci DESC;

select nome, fone from funcionarios;

select nome, sum(salario) as total_folha_pagamento from funcionarios;

select funcionarios.nome, departamentos.nome from funcionarios
join departamentos on funcionarios.cod_funcionarios = departamentos.cod_departamentos;


create table if not exists departamentos_funcionarios(
	cod_departamentos_funcionarios int not null auto_increment primary key,
    cod_departamentos int,
    cod_funcionarios int,
    foreign key (cod_departamentos) references departamentos (cod_departamentos),
    foreign key (cod_funcionarios) references funcionarios (cod_funcionarios)
);


insert into departamentos_funcionarios (cod_departamentos,cod_funcionarios) values (1,1);
insert into departamentos_funcionarios (cod_departamentos,cod_funcionarios) values (1,2);
insert into departamentos_funcionarios (cod_departamentos,cod_funcionarios) values (2,3);

select funcionarios.nome, funcionarios.funcao, departamentos.nome from funcionarios
join departamentos on funcionarios.cod_funcionarios = departamentos.cod_departamentos
where funcionarios.funcao like '%gerente%';




