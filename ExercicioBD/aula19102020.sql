create database if not exists loja;

use loja;

create table if not exists cliente(

);

create table if not exists historico_preco_produto(
id_preco_produto int not null auto_increment primary key,
data datetime,
produtoID int,
preco_anterior double,
preco_novo double,
foreign key (produtoID) references produto(produtoID)
);

create table if not exists produto(
produtoID int not null auto_increment primary key,
nome varchar(45),
preco double
);

select * from produto;

select * from historico_preco_produto;


delimiter $$

create trigger `loja`.`produto_AFTER_UPDATE` after update on `produto`
for each row
begin
if new.preco <> old.preco then
insert into historico_preco_produto
values (null, now(),new.produtoID,old.preco,new.preco);
end if;
end$$

delimiter $$



create trigger produto_after_update after update on produto
for each row
begin
if new.preco <> old.preco then
insert into historico_preco_produto
values (null,now(),new.idproduto,old.preco,new.preco);
end if;
end $$

delimiter ;

select * from loja.historico_preco_produto;

select * from produto;


