create database if not exists projetointegrador;

use projetointegrador;

create table if not exists cliente(
	cod_cliente int not null auto_increment primary key,
    nome varchar(45) not null,
    cpf varchar(15) not null,
    rg varchar(20) not null,
    endereco varchar(45) not null,
    data_nascimento DATE,
    telefone varchar(20)
);

create table if not exists entrega(
	cod_entrega int not null auto_increment primary key,
    forma_pagamento varchar(45),
    valortotal double,
    data DATE,
    hora TIME(6)
);

create table if not exists venda(
	cod_venda int not null auto_increment primary key,
    valortotal double,
    data DATE,
    hora time(6)
);


create table if not exists funcionario(
	cod_funcionario int not null auto_increment primary key,
    nome varchar(45) not null,
    endereco varchar(45) not null,
    data_nascimento DATE,
    funcao varchar(45) not null,
    telefone varchar(20) not null,
    rg varchar(20) not null,
    cpf varchar(15) not null
);

create table if not exists estoque(
	cod_estoque int not null auto_increment primary key,
    secao varchar(45),
    tipo varchar(45),
    quantidadeproduto INT
);

create table if not exists pedido(
	cod_pedido int not null auto_increment primary key,
    valortotalpedido double,
    cod_cliente int,
    cod_funcionario int,
    foreign key (cod_cliente) references cliente (cod_cliente),
    foreign key (cod_funcionario) references funcionario (cod_funcionario)
);

create table if not exists produto(
	cod_produto int not null auto_increment primary key,
    nome varchar(45),
    datafabricacao DATE,
    datavalidade DATE,
    marca varchar(45),
    valorproduto double,
    cod_estoque int,
    foreign key (cod_estoque) references estoque (cod_estoque)
);


create table if not exists entrega_cliente(
	cod_entrega_cliente int not null auto_increment primary key,
    cod_entrega int,
    cod_cliente int,
    foreign key (cod_entrega) references entrega (cod_entrega),
    foreign key (cod_cliente) references cliente (cod_cliente)
);

create table if not exists entrega_funcionario(
	cod_entrega_funcionario int not null auto_increment primary key,
    cod_entrega int,
    cod_funcionario int,
    foreign key (cod_entrega) references entrega (cod_entrega),
    foreign key (cod_funcionario) references funcionario (cod_funcionario)
);

create table if not exists funcionario_venda(
	cod_funcionario_venda int not null auto_increment primary key,
    cod_funcionario int,
    cod_venda int,
    foreign key (cod_funcionario) references funcionario (cod_funcionario),
    foreign key (cod_venda) references venda (cod_venda)
);

create table if not exists pedido_venda(
	cod_pedido_venda int not null auto_increment primary key,
    cod_pedido int,
    cod_venda int,
    foreign key (cod_pedido) references pedido (cod_pedido),
    foreign key (cod_venda) references venda (cod_venda)
);

create table if not exists pedido_produto(
	cod_pedido_produto int not null auto_increment primary key,
    cod_pedido int,
    cod_produto int,
    foreign key (cod_pedido) references pedido (cod_pedido),
    foreign key (cod_produto) references produto (cod_produto)
);
