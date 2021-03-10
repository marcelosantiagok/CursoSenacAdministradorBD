/*EXEMPLO DO SITE*/
/*-------------*/
/* EXERCICIO FEITO*/
CREATE DATABASE `aniversarios`;

USE aniversarios;

CREATE TABLE torneios ( 
nome varchar(30), 
vitorias real, 
melhor real, 
tamanho real 
);

INSERT INTO torneios (nome, vitorias, melhor, tamanho) 
VALUES ('Dolly', '7', '245', '8.5'), 
('Etta', '4', '283', '9'), 
('Irma', '9', '266', '7'), 
('Barbara', '2', '197', '7.5'), 
('Gladys', '13', '273', '8');

CREATE TABLE refeicoes ( 
nome varchar(30), 
data_nascimento date, 
entrada varchar(30), 
acompanhamento varchar(30), 
sobremesa varchar(30) 
);

INSERT INTO refeicoes (nome, data_nascimento, entrada, acompanhamento, sobremesa) 
VALUES ('Dolly', '1946-01-19', 'steak', 'salad', 'cake'), 
('Etta', '1938-01-25', 'chicken', 'fries', 'ice cream'), 
('Irma', '1941-02-18', 'tofu', 'fries', 'cake'), 
('Barbara', '1948-12-25', 'tofu', 'salad', 'ice cream'), 
('Gladys', '1944-05-28', 'steak', 'fries', 'ice cream');

/*EXEMPLO DO SITE*/

SELECT coluna_a_selecionar FROM tabela_a_selecionar WHERE certas_condições_a_aplicar;

/*-------------*/
/* EXERCICIO FEITO*/
select nome, data_nascimento from refeicoes where sobremesa = 'ice cream';

/*-------------*/


SELECT nome FROM refeicoes;

SELECT nome, data_nascimento FROM refeicoes;

SELECT * FROM torneios;

SELECT tamanho FROM torneios WHERE nome = 'Irma';

SELECT entrada FROM refeicoes WHERE entrada LIKE 't%';

SELECT nome AS n, data_nascimento AS d, sobremesa AS s FROM refeicoes;

SELECT COUNT(entrada) FROM refeicoes WHERE entrada = 'tofu';

SELECT AVG(melhor) FROM torneios;

SELECT SUM(vitorias) FROM torneios;

SELECT SUM(entrada) FROM refeicoes;

SELECT MIN(vitorias) FROM torneios;

SELECT MAX(vitorias) FROM torneios;

SELECT MIN(nome) FROM refeicoes;

SELECT MAX(nome) FROM refeicoes;

/*EXEMPLO DO SITE*/
SELECT COUNT(nome), entrada FROM refeicoes GROUP BY entrada;
/*-------------*/
/* EXERCICIO FEITO*/
select count(nome),sobremesa from refeicoes group by sobremesa;
/*-------------*/


/*EXEMPLO DO SITE*/
SELECT nome, data_nascimento FROM refeicoes ORDER BY data_nascimento;
/*-------------*/

/* EXERCICIO FEITO*/
select nome,entrada,data_nascimento from refeicoes order by nome;
/*-------------*/
********************
/*EXEMPLO DO SITE*/
SELECT nome, data_nascimento FROM refeicoes ORDER BY data_nascimento DESC;
/*-------------*/
/* EXERCICIO FEITO*/
select nome, acompanhamento from refeicoes order by nome desc;
/*-------------*/
/*EXEMPLO DO SITE*/
SELECT COUNT(nome), acompanhamento FROM refeicoes GROUP BY acompanhamento HAVING COUNT(nome) >= 3;
/*-------------*/
/* EXERCICIO FEITO*/
select count(nome), sobremesa from refeicoes group by sobremesa having count(nome) <=3;
/*-------------*/
/*EXEMPLO DO SITE*/
SELECT tabela1.coluna1, tabela2.coluna2
FROM tabela1
JOIN tabela2 ON tabela1.coluna_relacionada=tabela2.coluna_relacionada;
/*-------------*/
/* EXERCICIO FEITO*/
select refeicoes.nome, torneios.tamanho
from refeicoes
join torneios on refeicoes.nome=torneios.nome;
/*-------------*/
/*EXEMPLO DO SITE*/
SELECT torneios.nome, torneios.tamanho, refeicoes.data_nascimento 
FROM torneios 
JOIN refeicoes ON torneios.nome=refeicoes.nome;
/*-------------*/
/*EXEMPLO DO SITE*/
SELECT refeicoes.nome, refeicoes.data_nascimento, torneios.tamanho 
FROM refeicoes 
JOIN torneios ON refeicoes.nome=torneios.nome;
/*-------------*/
/* EXERCICIO FEITO*/
/*-------------*/
/*EXEMPLO DO SITE*/
INSERT INTO torneios (nome, vitorias, melhor, tamanho) 
VALUES ('Bettye', '0', '193', '9');
/*-------------*/
/* EXERCICIO FEITO*/
/*-------------*/
/*EXEMPLO DO SITE*/
INSERT INTO refeicoes (nome, data_nascimento, entrada, acompanhamento, sobremesa) 
VALUES ('Lesley', '1946-05-02', 'steak', 'salad', 'ice cream');
/*-------------*/
/* EXERCICIO FEITO*/
/*-------------*/
/*EXEMPLO DO SITE*/
SELECT torneios.nome, torneios.tamanho, refeicoes.data_nascimento 
FROM torneios 
JOIN refeicoes ON torneios.nome=refeicoes.nome;
/*-------------*/
/* EXERCICIO FEITO*/
SELECT refeicoes.nome, refeicoes.sobremesa, refeicoes.entrada 
FROM refeicoes 
JOIN torneios ON torneios.nome=refeicoes.nome;
/*-------------*/
***************
/*EXEMPLO DO SITE*/
SELECT torneios.nome, torneios.tamanho, refeicoes.data_nascimento 
FROM torneios 
LEFT JOIN refeicoes ON torneios.nome=refeicoes.nome;
/*-------------*/
/* EXERCICIO FEITO*/
/*-------------*/
/*EXEMPLO DO SITE*/
SELECT torneios.nome, torneios.tamanho, refeicoes.data_nascimento 
FROM torneios 
RIGHT JOIN refeicoes ON torneios.nome=refeicoes.nome;
/*-------------*/
/* EXERCICIO FEITO*/
SELECT refeicoes.nome, refeicoes.sobremesa, refeicoes.data_nascimento 
FROM refeicoes 
RIGHT JOIN torneios ON refeicoes.nome=torneios.nome;
/*-------------*/
/*EXEMPLO DO SITE*/
SELECT nome FROM torneios UNION SELECT nome FROM refeicoes;
/*-------------*/
/* EXERCICIO FEITO*/
SELECT nome FROM refeicoes UNION SELECT vitorias FROM torneios;
/*-------------*/
/*EXEMPLO DO SITE*/
SELECT nome FROM torneios UNION ALL SELECT nome FROM refeicoes;
/*-------------*/
/* EXERCICIO FEITO*/
SELECT nome FROM torneios UNION ALL SELECT data_nascimento FROM refeicoes;
/*-------------*/
/*EXEMPLO DO SITE*/
SELECT nome, vitorias FROM torneios 
WHERE vitorias > (
SELECT vitorias FROM torneios WHERE nome = 'Barbara'
);
/*-------------*/
/* EXERCICIO FEITO*/
SELECT nome, melhor FROM torneios 
WHERE melhor <= (
SELECT melhor FROM torneios WHERE nome = 'Irma'
);
/*-------------*/
/*EXEMPLO DO SITE*/
SELECT nome, tamanho FROM torneios AS t 
WHERE vitorias > (
SELECT AVG(vitorias) FROM torneios WHERE tamanho = t.tamanho
);
/*-------------*/
/* EXERCICIO FEITO*/
SELECT nome, vitorias FROM torneios AS t
WHERE vitorias < (
SELECT AVG(vitorias) FROM torneios WHERE tamanho = t.tamanho
);
/*-------------*/
/*EXEMPLO DO SITE*/
SELECT nome, entrada, acompanhamento, sobremesa 
FROM refeicoes 
WHERE nome = (SELECT nome FROM torneios 
WHERE vitorias = (SELECT MAX(vitorias) FROM torneios));
/*-------------*/
/* EXERCICIO FEITO*/
SELECT nome, entrada, sobremesa, data_nascimento 
FROM refeicoes 
WHERE nome > (SELECT nome FROM torneios 
WHERE vitorias >= (SELECT MAX(vitorias) FROM torneios));
/*-------------*/