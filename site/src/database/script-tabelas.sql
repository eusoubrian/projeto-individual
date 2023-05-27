-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

create database mpb;
use mpb;

create table decada (
idDecada int primary key auto_increment,
nome varchar(10)
);

insert into decada values
	(null, 'anos 50'),
	(null, 'anos 60'),
	(null, 'anos 70'),
	(null, 'anos 80'),
	(null, 'anos 90'),
	(null, 'anos 2000');

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(20),
email varchar(90),
senha varchar(45),
fkDecada int,
	constraint fkDecadaUsu foreign key (fkDecada)
		references decada(idDecada)
);

create table pontuacao (
idPontuacao int primary key auto_increment,
fkUsuario int,
	constraint fkUserPont foreign key (fkUsuario)
		references usuario(idUsuario),
contador int
);

insert into usuario values
	(null, 'TESTE', 'teste@gmail.com', 'senha', 1);
    
insert into pontuacao values
	(null, 1, 5);
    
-- SELECT PONTUACAO --
select contador from pontuacao where fkUsuario = 1;


-- SELECT DA KPI --
select count(fkDecada) as voto, decada.nome from usuario
		join decada on usuario.fkDecada = decada.idDecada
        group by decada.nome 
		order by voto desc limit 1;

-- SELECT GRÁFICO --        
select count(fkDecada) as voto, decada.nome from usuario
join decada on usuario.fkDecada = decada.idDecada
group by decada.nome;
    

/*
comandos para criar usuário em banco de dados azure, sqlserver,
com permissão de insert + update + delete + select
*/

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
