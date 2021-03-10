create database if not exists hospital;

use hospital;

create table if not exists paciente(
    cod_paciente int not null auto_increment primary key,
    nome varchar(45) not null,
    cpf varchar(20) not null,
    rg varchar(20) not null,
    datanascimento DATE,
    sexo char(1) not null,
    endereco varchar(100) not null,
    telefone varchar(20) not null
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
    especialidade varchar(45),
    salario double not null
);

create table if not exists setor(
cod_setor int not null auto_increment primary key,
nomedosetor varchar(45) not null,
tiposetor varchar(45) not null,
localsetor varchar(45) not null
);

create table if not exists medicamento(
    cod_medicamento int not null auto_increment primary key,
    nome varchar(45) not null,
    datafabricacao DATE,
    datavalidade DATE,
    descricao varchar(100)
);




create table if not exists exame(
cod_exame int not null auto_increment primary key,
nomeexame varchar(50) not null,
tipoexame varchar(50) not null,
data DATE not null,
hora time(6) not null,
jejum tinyint(1) not null,
observacoes varchar(150)
);


create table if not exists consulta(
    cod_consulta int not null auto_increment primary key,
    data DATE not null,
    hora time(6) not null,
    descricao varchar(45) not null,
    fumante tinyint(1) not null,
	bebe tinyint(1) not null,
	tomamedicamento tinyint(1) not null,
	nomemedicamento varchar(100),
	alergia varchar(100),
	observacoes varchar(100) not null
);


create table if not exists prontuario(
cod_prontuario int not null auto_increment primary key,
data DATE not null,
hora TIME(6) not null,
sintomas varchar(150),
gravidade varchar(45),
observacoes varchar(150),
cod_paciente int,
cod_funcionario int,
foreign key (cod_paciente) references paciente(cod_paciente),
foreign key (cod_funcionario) references funcionario(cod_funcionario)
);


create table if not exists servico(
    cod_servico int not null auto_increment primary key,
    nomeservico varchar(45) not null,
    tipodeservico varchar(45) not null,
    valorservico double,
    quantidadeservico double,
    cod_prontuario int,
    cod_exame int,
    cod_consulta int,
    foreign key (cod_prontuario) references prontuario(cod_prontuario),
    foreign key (cod_exame) references exame (cod_exame),
    foreign key (cod_consulta) references consulta (cod_consulta)
);


create table if not exists almoxarifado(
cod_almoxarifado int not null auto_increment primary key,
nomeproduto varchar(50) not null,
tipoproduto varchar(50) not null,
quantidadeproduto INT not null,
valorproduto double not null,
descricaoproduto varchar(150),
datavalidade DATE ,
datafabricacao DATE,
cod_setor int,
foreign key (cod_setor) references setor(cod_setor)
);


create table if not exists diagnostico(
cod_diagnostico int not null auto_increment primary key,
nomedoenca varchar(100),
codigodoenca double,
data DATE not null,
hora TIME(6) not null,
descricao varchar(150) not null,
cod_paciente int,
cod_funcionario int,
foreign key(cod_paciente) references paciente (cod_paciente),
foreign key (cod_funcionario) references funcionario(cod_funcionario)
);



create table if not exists servico_setor(
	cod_servico_setor int not null auto_increment primary key,
    cod_servico int,
    cod_setor int,
    foreign key (cod_servico) references servico (cod_servico),
    foreign key (cod_setor) references setor (cod_setor)
);

create table if not exists paciente_funcionario(
	cod_paciente_funcionario int not null auto_increment primary key,
    cod_paciente int,
    cod_funcionario int,
    foreign key (cod_paciente) references paciente (cod_paciente),
    foreign key (cod_funcionario) references funcionario (cod_funcionario)
);

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Gabrielle Lima Oliveira','323.049.332-03','445456461','1980-01-01','F','Rua Santo Ângelo, 323 Alvorada-RS 94855-720','(51) 8336-5638');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Sofia Cavalcanti Cardoso','349.990.518-34','4545151','1970-02-02','F','Rua Rio de Janeiro, 1939 Catanduva-SP 15800-035','(31) 6309-3811');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Mariana Cavalcanti Rodrigues','676.800.364-03','44585161','1960-03-03','F','Rua José Egídio, 1098 Recife-PE 50780-610','(41) 4646-5171');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Rafaela Carvalho Dias','672.746.034-50','5646541','1977-04-04','F','Rua Carima, 1966 Juiz de Fora-MG 36021-430','(19) 9281-9477');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Gabriela Ferreira Lima','220.382.687-89','464564964','1988-05-08','F','Rua Princesa Izabel, 273 Lençóis Paulista-SP 18683-140','(11) 8216-3317');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Isabella Alves Castro','217.838.791-81','45451213','1989-06-07','F','Rua E, 1206 Governador Valadares-MG 35042-400 ','(71) 8370-9166');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Emily Fernandes Rocha','609.450.600-68','87848441','1990-07-13','F','Passagem Pioneiro, 908 Capanema-PA 68702-155 ','(16) 6173-5186');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Julieta Goncalves Oliveira','346.996.198-00','564654651','1991-08-20','F','Rua Cinco, 1425 Suzano-SP 08630-445','(69) 7654-9826');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Lucas Dias Martins','570.202.810-44','4646541','1968-09-22','M','Praça Hugo Viola, 531 Cariacica-ES 29140-440 ','(94) 3862-7807');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Kauã Cardoso Ferreira','435.128.433-10','32131561','1980-10-12','M','Rua 102, 889 Aparecida de Goiânia-GO 74988-500','(67) 2017-5168');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Arthur Cavalcanti Correia','416.268.960-11','3123131','1982-11-01','M','Rua 112, 788 Catalão-GO 75710-020 ','(12) 3340-8993');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Vinícius Costa Souza','412.267.939-75','1231321','1984-12-03','M','Rua Ariosto Vieira Rodrigues, 1431 Porto Alegre-RS 91130-510','(11) 4599-7022');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Kai Souza Melo','986.082.065-10','646546541','1985-01-17','M','Estrada Santa Edwiges, 1015 Itapevi-SP 06695-445','(21) 7811-9360');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('Kauan Almeida Castro','884.719.165-33','65465412','1990-02-21','M','Quadra 704 Sul Alameda 14, 1510 Palmas-TO 77022-344','(62) 5059-4673');

insert into paciente (nome,cpf,rg,datanascimento,sexo,endereco,telefone) values ('José Silva Ferreira','977.012.577-64','56465411','1991-03-22','M','Rua Américo, 331 Blo Horizonte-MG 30250-412','(62) 9319-9813');


insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Thiago Souza Fernandes','419.665.529-71','12545112','1992-03-05','Rua Manoel Joaquim da Silva, 460 Vrginha-MG 7062-260','(81) 6561-8370','M','Medico','Pediatra',7823.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Júlio Barros Dias','817.046.180-45','454645641','1993-05-30','Rua Batovi, 1501 Ro Claro-SP 13503-153 ','(81) 5608-4466','M','Medico','Pediatra',7823.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Tiago Cardoso Oliveira','405.407.271-21','54654110','1994-07-27','Rua Piratininga, 1100 Bauru-SP 17055-290','(19) 3168-3435','M','Medico','Radiologista',9043.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Danilo Costa Pereira','991.780.069-70','454641454','1980-08-25','Rua Walter de Barros, 158 Vitória de Santo Antão-PE 55610-050','(81) 5735-4335','M','Medico','Oftamologista',4000.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Diogo Lima Carvalho','497.927.329-77','21311123','1981-09-24','Rua Otero Basso, 1871 Chapecó-SC 89804-420','(11) 8681-6846','M','Medico','Dermatologista',5000.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Kauan Ribeiro Santos','416.706.018-38','874848471','1982-10-23','Rua Gonçalves Dias, 1131 Jacareí-SP 12310-480 ','(92) 5175-9469','M','Medico','Gastroenterologista',3960.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Carlos Ferreira Carvalho','826.895.559-72','8787464','1983-11-21','Rua Noemi de Moura Muzel, 686 Itapeva-SP 18407-250 ','(11) 4818-2500','M','Atendente',1324.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Pedro Alves Rocha','451.184.440-20','879874','1984-12-20','Quadra 18, 606 Planaltina de Goiás-GO 73756-018','(61) 5379-6134','M','Tecnico','Enfermagem',1782.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Guilherme Ferreira Lima','610.504.842-40','78997984','1985-05-17','Rua Juiz Humberto de Paiva, 1809 Belo Horizonte-MG 31760-090','(11) 7466-5826','M','Tecnico','Enfermagem',1782.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Leonor Fernandes Azevedo','348.386.125-40','6465461','1986-06-08','Rua Acari, 335 Teresina-PI 64017-535','(81) 8717-5879','F','Atendente',1324.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,salario) values ('Carla Oliveira Cavalcanti','338.712.944-03','6554654561','1987-07-07','Rua Walter Santiago, 908 Aaguari-MG 38444-336 ','(19) 6714-6106','F','Atendente',1324.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Sarah Dias Souza','803.046.544-00','564641','1988-08-06','Rua Praia Porto de Pedras, 841 Ponta Grossa-PR 84060-665','(11) 4898-3952','F','Tecnico','Enfermagem',1782.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Evelyn Correia Araujo','718.496.909-01','46546541','1989-10-04','Rua Álvaro Waldemar Colino, 595 Araraquara-SP 14807-022','(28) 6743-8125','F','Tecnico','Enfermagem',1782.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Isabela Sousa Ribeiro','119.860.990-75','46546541','1990-11-03','Rua Juvenal Toledo, 944 Mogi-Mirim-SP 13803-030','(95) 5826-7562','F','Medico','Clinico Geral',6617.00);

insert into funcionario(nome,cpf,rg,datanascimento,endereco,telefone,sexo,cargo,especialidade,salario) values ('Sarah Barbosa Silva','791.132.462-08','56646544','1991-12-01','Rua 2, 45 Anápolis-GO 75114-240 ','(85) 2648-3896','F','Medico','Clinico Geral',6617.00); 


insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Clinico Geral','1 Andar');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Pediatria','1 Andar');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Ortopedia','2 Andar');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Ginecologia','2 Andar');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Gastroenterologia','Terreo');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Almoraife','Almoxarifado','Terreo');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Radioterapia','1 Andar');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Psiquiatria','1 Andar');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Pneumologia','Terreo');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Oftamologia','1 Andar');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Hematologia','1 Andar');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Homeopatia','2 Andar');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Dermatologia','2 Andar');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Infectologia','2 Andar');
insert into setor (nomedosetor,tiposetor,localsetor) values ('Ambulatorio','Clinica Medica','Terreo');


insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Neosoro','2020-01-01','2022-01-01','É um descongestionante nasal que alivia sintomas de congestão nasal');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Dorflex','2020-01-01','2022-01-01','É um medicamento que possui ação analgésica e relaxante muscular');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Losartana','2020-01-01','2022-01-01','utilizada no tratamento da insuficiência cardíaca');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Sinvastatina','2020-01-01','2022-01-01','Este medicamento reduz os níveis do mau colesterol');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Neosaldina','2020-01-01','2022-01-01','É um medicamento com atividade analgésica (diminui a dor)');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Rivotril','2020-01-01','2022-01-01','É um ansiolítico. Ou seja, um tranquilizante do grupo dos benzodiazepínicos ');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Puran T4','2020-01-01','2022-01-01','É indicado para: Reposição ou suplementação hormonal em pacientes com hipotireoidismo');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Xarelto','2020-01-01','2022-01-01','O medicamento, aliado à uma rotina saudável, pode ajudar o paciente a evitar a formação de coágulos');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Saxenda','2020-01-01','2022-01-01','Acelera o metabolismo do paciente, o que ajuda o organismo a queimar mais calorias');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Glifage','2020-01-01','2022-01-01','É utilizado para o tratamento do diabetes tipo 2');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Torsilax','2020-01-01','2022-01-01','É um medicamento indicado para o tratamento de reumatismo');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Victoza','2020-01-01','2022-01-01','É uma das medicações indicadas para o tratamento do Diabetes tipo 2');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Acebutolol','2020-01-01','2022-01-01','É usado para tratar a hipertensão (pressão alta) e distúrbios do ritmo cardíaco.');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Paracetamol','2020-01-01','2022-01-01','É indicado para aliviar dores moderadas e leves, como dores de cabeça, torções e dente.');
insert into medicamento (nome,datafabricacao,datavalidade,descricao) values ('Acetazolamida','2020-01-01','2022-01-01','É um diurético que atua inibindo a enzima anidrase carbônica presente no túbulo proximal do nefro.');

insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Seringa Descartável sem Agulha','seringas',200,0.26,'Seringa Descartável sem Agulha','2021-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Soro fisiologico','medicamentos',150,4.08,'Soro fisiologico','2021-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Disp infusao intravenosa','scalps',200,0.61,'Disp infusao intravenosa','2021-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Micro com bureta 150ml','Equipos',300,1.89,'Micro com bureta 150ml','2021-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Sonda Endotraqueal','sondas',100,11.60,'Sonda Endotraqueal','2021-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Intravenoso(Jelco)','catetar',200,1.70,'Intravenoso(Jelco)','2021-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Gaze não esteril','compressa',500,17.90,'Gaze não esteril','2021-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Pressao Adulto','aparelhos',70,51.00,'Pressao Adulto','2021-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Cirurgica estéril','luvas',400,3.90,'Cirurgica estéril','2022-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Descartavel Labor','agulhas',100,15.90,'Descartavel Labor','2022-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Impermeável','esparadrapos',50,3.20,'Impermeável','2022-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Bisturi Desartável','laminas',100,2.96,'Bisturi Desartável','2022-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Crepe com 1.2 metros','ataduras',500,12.68,'Crepe com 1.2 metros','2022-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Geriatrica','fraldas',200,17.80,'Geriatrica','2022-01-01','2020-01-01',7);
insert into almoxarifado (nomeproduto,tipoproduto,quantidadeproduto,valorproduto,descricaoproduto,datavalidade,datafabricacao,cod_setor) values ('Cleorexidina','saneantes',200,2.94,'Cleorexidina','2022-01-01','2020-01-01',7);

insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',0,0,0,'NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',0,0,0,'NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',1,1,0,'NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',1,1,0,'NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',0,0,0,'NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',0,0,0,'NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,nomemedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',1,1,1,'diazepan','NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,nomemedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',1,1,1,'diazepan','NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,nomemedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',1,0,1,'rivotril','Lorem ipsum dolor sit amet, consectetur adipiscing elit','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,nomemedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',0,1,1,'rivotril','Lorem ipsum dolor sit amet, consectetur adipiscing elit','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,nomemedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',1,1,1,'diazepan','NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,nomemedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',1,1,1,'diazepan','NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,nomemedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',1,1,1,'diazepan','NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,nomemedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',1,1,1,'diazepan','NÃO','Lorem ipsum');
insert into consulta (data,hora,descricao,fumante,bebe,tomamedicamento,nomemedicamento,alergia,observacoes) values ('2020-01-01','00:00:00','Lorem ipsum dolor sit amet, consectetur adipiscing elit',1,1,1,'diazepan','NÃO','Lorem ipsum');



insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A00:Colera',10,'2020-01-01','00:00:00','ipsum dolor sit amet',1,14);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A01:Febres Tifoide e Paratifoide',10,'2020-01-01','00:00:00','ipsum dolor sit amet',2,14);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A03:Shiguelose',10,'2020-01-01','00:00:00','ipsum dolor sit amet',3,15);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A06:Amebiase',10,'2020-01-01','00:00:00','ipsum dolor sit amet',4,15);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A17:Tuberculose do Sistema Nervoso',10,'2020-01-01','00:00:00','ipsum dolor sit amet',5,14);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A20:Peste',10,'2020-01-01','00:00:00','ipsum dolor sit amet',6,15);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A21:Tularemia',10,'2020-01-01','00:00:00','ipsum dolor sit amet',7,14);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A22:Carbunculo',10,'2020-01-01','00:00:00','ipsum dolor sit amet',8,14);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A23:Brucelose',10,'2020-01-01','00:00:00','ipsum dolor sit amet',9,15);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A24:Mormo e Melioidose',10,'2020-01-01','00:00:00','ipsum dolor sit amet',10,14);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A26:Erisipeloide',10,'2020-01-01','00:00:00','ipsum dolor sit amet',11,15);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A26:Erisipeloide',10,'2020-01-01','00:00:00','ipsum dolor sit amet',12,14);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A30:Hanseniase',10,'2020-01-01','00:00:00','ipsum dolor sit amet',13,15);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A36:Difteria',10,'2020-01-01','00:00:00','ipsum dolor sit amet',14,14);
insert into diagnostico (nomedoenca,codigodoenca,data,hora,descricao,cod_paciente,cod_funcionario) values ('A37:Coqueluche',10,'2020-01-01','00:00:00','ipsum dolor sit amet',15,15);


insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('sange','Creatinina','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('sangue','Colesterol Total','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('sangue','HDL','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values('sangue','LDL','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('sangue','Hemograma','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('sangue','Tipagem Sanguinia','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('sangue','Hemograma','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('sangue','HDL','2020-01-01','00:00:00',1,'ipsum dolor sit am'); 
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('sangue','LDL','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes)values ('sangue','Triglicérides','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('Mamografia','imagens das mamas','2020-01-01','00:00:00',0,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('Ultra-sonografia','Abdomem','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('sangue','Hemograma','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('sangue','Colesterol Total','2020-01-01','00:00:00',1,'ipsum dolor sit am');
insert into exame (nomeexame,tipoexame,data,hora,jejum,observacoes) values ('sangue','Hemograma','2020-01-01','00:00:00',1,'ipsum dolor sit am');


insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','febre, dor de cabeça,falta de ar','grave','ipsum dolor sit',1,7);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario)  values ('2020-01-01','00:00:00','dor de cabeça','leve','ipsum dolor sit',2,10);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','febre, dor de cabeça, falta de ar, corisa','gravissimo','ipsum dolor sit',3,11);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','febre, dor de cabeça,falta de ar','grave','ipsum dolor sit',4,7);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','febre, dor de cabeça, falta de ar, corisa','gravissimo','ipsum dolor sit',cod_paciente,10);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','febre, dor de cabeça,falta de ar','grave','ipsum dolor sit',5,11);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','dor de cabeça','leve','ipsum dolor sit',6,7);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','dor de cabeça','leve','ipsum dolor sit',7,10);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','febre, dor de cabeça','moderada','ipsum dolor sit',8,11);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','febre, dor de cabeça','moderada','ipsum dolor sit',9,11);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','febre, dor de cabeça','moderada','ipsum dolor sit',10,10);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','dor de cabeça','leve','ipsum dolor sit',11,7);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','febre, dor de cabeça','moderada','ipsum dolor sit',12,11);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','dor de cabeça','leve','ipsum dolor sit',13,10);
insert into prontuario (data,hora,sintomas,gravidade,observacoes,cod_paciente,cod_funcionario) values ('2020-01-01','00:00:00','dor de cabeça','leve','ipsum dolor sit',14,7);

insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Checagem','Comum',150.00,7,1,1,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Checagem','Comum',150.00,1,2,1,1);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Consulta','simples',300.00,1,3,1,2);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Consulta','simples',300.00,1,4,1,5);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Consulta','simples',300.00,1,5,4,5);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Consulta','simples',300.00,1,6,3,2);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Checagem','Comum',150.00,1,7,1,5);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Checagem','Comum',150.00,1,8,1,5);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Checagem','Comum',150.00,1,9,3,4);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Checagem','Comum',150.00,1,10,2,5);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Consulta','simples',300.00,1,11,2,5);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Consulta','simples',300.00,1,12,4,5);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Consulta','simples',300.00,1,13,3,7);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Consulta','simples',300.00,1,14,1,4);
insert into servico (nomeservico,tipodeservico,valorservico,quantidadeservico,cod_prontuario,cod_exame,cod_consulta) values ('Consulta','simples',300.00,1,15,6,2);

select  * from funcionario;

insert into paciente_funcionario (cod_paciente,cod_funcionario) values (1,14);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (2,15);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (3,14);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (4,15);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (5,14);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (6,15);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (7,14);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (8,15);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (9,14);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (10,15);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (11,14);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (12,15);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (13,15);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (14,15);
insert into paciente_funcionario (cod_paciente,cod_funcionario) values (15,15);


insert into servico_setor(cod_servico,cod_setor) values (1,1);
insert into servico_setor(cod_servico,cod_setor) values (2,1);
insert into servico_setor(cod_servico,cod_setor) values (3,1);
insert into servico_setor(cod_servico,cod_setor) values (4,1);
insert into servico_setor(cod_servico,cod_setor) values (5,1);
insert into servico_setor(cod_servico,cod_setor) values (6,1);
insert into servico_setor(cod_servico,cod_setor) values (7,1);
insert into servico_setor(cod_servico,cod_setor) values (8,1);
insert into servico_setor(cod_servico,cod_setor) values (9,1);
insert into servico_setor(cod_servico,cod_setor) values (10,1);
insert into servico_setor(cod_servico,cod_setor) values (11,1);
insert into servico_setor(cod_servico,cod_setor) values (12,1);
insert into servico_setor(cod_servico,cod_setor) values (13,1);
insert into servico_setor(cod_servico,cod_setor) values (14,1);
insert into servico_setor(cod_servico,cod_setor) values (15,1);

/*Updates*/

update paciente
set endereco = 'Rua santo Angelo 423 Alvorada-RS 94855-720'
where cod_paciente = 1;

update servico
set nomeservico = 'consulta específica'
where cod_servico = 3;

update servico
set valorservico = 350
where cod_servico = 3;

update servico
set nomeservico = 'raio-x'
where cod_servico = 4;

update servico
set valorservico = 100
where cod_servico = 4;

/*Deletes */

delete from funcionario 
where cod_funcionario = 2;

delete from funcionario 
where cod_funcionario = 8;

delete from funcionario 
where cod_funcionario = 12;

delete from funcionario 
where cod_funcionario = 13;

delete from funcionario 
where cod_funcionario = 6;

/*Selects*/

select * from paciente;

select * from funcionario;

select * from medicamento;

select * from setor;

select * from amoxarifado;

select * from paciente
join funcionario join setor join almoxarifado;

/*3 views*/

create view vw_todosfuncionarios as select * from funcionario;

create view vw_todospacientes as select * from paciente;

create view vw_prontuarios as select * from prontuario;

/*EXERCICIOS*/

/*1*/
select funcionario.especialidade, count(paciente_funcionario.cod_funcionario) from funcionario
join paciente_funcionario
on funcionario.cod_funcionario = paciente_funcionario.cod_funcionario
where paciente_funcionario.cod_funcionario = (select count(paciente_funcionario.cod_funcionario) from paciente_funcionario);

/*2*/
select sexo,count(sexo) from funcionario
where cargo = 'Medico'
group by sexo;

/*3*/
SELECT nome, datanascimento FROM paciente
WHERE datanascimento = (SELECT max(datanascimento) FROM paciente);

/*4*/
SELECT nome, datanascimento FROM paciente
WHERE datanascimento = (SELECT min(datanascimento) FROM paciente);

/*5*/
select funcionario.nome, funcionario.especialidade from funcionario
join paciente_funcionario
on funcionario.cod_funcionario = paciente_funcionario.cod_funcionario
where paciente_funcionario.cod_paciente_funcionario = (select max(cod_funcionario) from paciente_funcionario);

/*6*/
select especialidade,count(especialidade) from funcionario
group by especialidade;

/*7*/
select count(prontuario.gravidade) as qtd_paciente_grave from paciente
join prontuario
on paciente.cod_paciente = prontuario.cod_prontuario
where gravidade = 'grave';