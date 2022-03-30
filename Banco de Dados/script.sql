create database Icelog;

use Icelog;

create table Empresa (
idEmpresa int primary key auto_increment,
cnpj char (14),
nomeEmpresa varchar(100),
emailEmpresa varchar(100),
bairroEmpresa varchar(60),
cidadeEmpresa varchar(60),
cepEmpresa char(8)
);

create table Sensor (
idSensor int primary key auto_increment,
temperatura double,
cordLatAlt varchar(25),
dhH datetime,
fkEmpresa int,
foreign key (fkEmpresa) references Empresa(idEmpresa)
);

insert into Empresa (cnpj, nomeEmpresa, emailEmpresa, bairroEmpresa, cidadeEmpresa, cepEmpresa) values
('13347016000117', 'Brandão', 'brandao@sptech.school', 'Brandão', 'Brandão', '07540450');

insert into Sensor (temperatura, cordLatAlt, dhH, fkEmpresa) values
(03.90 , '22-22-33 33-33-44' , '2001-09-11 13:09:26', 1);

select e.*, s.* from Empresa as e
	join Sensor as s
		on s.fkEmpresa = e.idEmpresa;
