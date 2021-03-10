use escola;

create table if not exists aluno(
	cod int not null auto_increment,
    nome varchar(50) not null,
    curso int not null,
    status int not null,
    primary key (cod)
);

create table if not exists curso(
	cod int not null auto_increment,
    descricao varchar(200) not null,
    primary key (cod)
);

create table if not exists matricula (
	cod int not null auto_increment,
    aluno_cod int not null,
    curso_cod int not null,
    primary key (cod)
);


DELIMITER $$

CREATE TRIGGER tg_matricula
after insert on aluno
for each row
begin
	insert into matricula values ("", new.cod, new.curso);
end;
$$

delimiter ;

show triggers;

select * from matricula;

select * from aluno;


select * from matricula;

insert into curso values ("", "RADIOLOGIA");
insert into curso values ("", "ENGENHARIA");
insert into curso values ("", "ENGENHARIA DA TI");
insert into curso values ("", "ADMINISTRACAO");

select * from aluno;