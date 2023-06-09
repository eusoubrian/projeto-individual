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
	(null, 'anos 50'), 1
	(null, 'anos 60'), 2
	(null, 'anos 70'), 3
	(null, 'anos 80'), 4
	(null, 'anos 90'), 5
	(null, 'anos 2000'); 6

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(20),
email varchar(90),
senha varchar(45),
fkDecada int,
	constraint fkDecadaUsu foreign key (fkDecada)
		references decada(idDecada)
);

insert into usuario values	
	(null, 'vivian', 'vivi@gmail.com', '111', 5),
	(null, 'rayssa', 'rayssa@gmail.com', '222', 3),
	(null, 'eduardo', 'edu@gmail.com', '111', 2),
	(null, 'luna', 'luna@gmail.com', '222', 6),
	(null, 'carolina', 'carol@gmail.com', '222', 6),
	(null, 'gabs', 'perniconi@gmail.com', '111', 4),
	(null, 'isabella', 'bella@gmail.com', '222', 6),
	(null, 'vitor kava', 'kavabata@gmail.com', '111', 6),
	(null, 'nicolas', 'nicolau@gmail.com', '222', 6),
	(null, 'beatriz ferrante', 'biiiibs@gmail.com', '111', 6),
	(null, 'andreia', 'andreia@gmail.com', '111', 4);

	

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
