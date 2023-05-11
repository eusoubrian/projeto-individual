-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

create database mpb;
use mpb;

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(20),
email varchar(90),
senha varchar(8),
fkDecada int,
	constraint fkDecadaUsu foreign key (fkDecada)
		references decada(idDecada)
);

create table decada (
idDecada int primary key auto_increment,
nome varchar(10)
);


create table voto (
idVoto int,
fkUsuario int,
fkDecada int,
dataVoto datetime,
	constraint fkUsuarioVoto foreign key (fkUsuario)
		references usuario(idUsuario),
    constraint fkDecVoto foreign key (fkDecada)
		references decada(idDecada),
    constraint pkTripla primary key (idVoto, fkUsuario, fkDecada));
    

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
