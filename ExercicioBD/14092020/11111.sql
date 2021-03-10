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




