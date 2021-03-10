create database if not exists exerciciosqlbasico;

use exerciciosqlbasico;


create table if not exists maquina (
	idMaquina int not null auto_increment primary key,
    tipo varchar(45),
    velocidade double,
    hard_disk double,
    placa_rede varchar(45),
    memoria_ram double
);

create table if not exists software(
	idSoftware int not null auto_increment primary key,
    produto varchar(45),
    hard_disk double,
    memoria_ram double
);

create table if not exists usuario(
	idUsuario int not null auto_increment primary key,
    password varchar(45),
    nomeusuario varchar(45),
    ramal varchar(45),
    especialidade varchar(45)
);

create table if not exists maquina_usuario(
	idMaquina_usuario int not null auto_increment primary key,
    idMaquina int,
    idUsuario int,
    foreign key (idMaquina) references maquina (idMaquina),
    foreign key (idUsuario) references usuario (idUsuario)
);


create table if not exists software_maquina(
	idSoftware_maquina int not null auto_increment primary key,
    idSoftware int,
    idMaquina int,
    foreign key (idSoftware) references software (idSoftware),
    foreign key (idMaquina) references maquina (idMaquina)
);


select * from usuario;

select * from maquina;

select tipo, velocidade from maquina;

select tipo, velocidade from maquina
where tipo like '%core ii%' or tipo like '%pentium%';

select idMaquina, tipo, placa_rede from maquina
where placa_rede < 10;

select count(*) from maquina
where velocidade > 2.4;

select * from maquina;

select * from software;

select count(maquina.hard_disk) as quantidade_discorigido from maquina
join software on maquina.idMaquina = software.idSoftware
where maquina.hard_disk >= software.hard_disk;

select idMaquina, tipo;

select * from software;

select avg(hard_disk) as media from software;

select count(*) as total_maquinas from maquina
group by tipo;

select count(software.produto) as quantidade_produto from software
where hard_disk between 90 and 250;


select * from usuario;

select idUsuario, nomeusuario from usuario
order by nomeusuario;


create table if not exists possuem (
	idPossuem int not null auto_increment primary key,
    idUsuario int,
    idMaquina int,
    foreign key (idUsuario) references usuario (idUsuario),
    foreign key (idMaquina) references maquina (idMaquina)
);

select * from software
where hard_disk > 200;

DELETE FROM software
WHERE hard_disk < 200;

select * from software;

insert into software (idSoftware,produto,hard_disk,memoria_ram) values (202,'Video Light',300000,2000);

select * from maquina;

UPDATE maquina
SET memoria_ram = (memoria_ram * )
WHERE tipo = 'Ultra New';

select (hard_disk + (hard_disk * 20 /100)) as porcentagem_20porcento from maquina
where tipo like '%Ultra New%';

select * from maquina;


