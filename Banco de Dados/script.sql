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
tipo varchar(20), constraint chkTipo check (tipo in('temperatura')),
codigo int,
data_instalacao date
);


create table Dados (
idDados int,
dtH datetime,
temperatura double,
altLog varchar(30),
fkEmpresa int,
fkSensor int,
foreign key (fkEmpresa) references Empresa(idEmpresa),
foreign key (fkSensor) references Sensor(idSensor)
);

insert into Empresa (cnpj, nomeEmpresa, emailEmpresa, bairroEmpresa, cidadeEmpresa, cepEmpresa) values
('02916265004002', 'Friboi', 'friboi@friboi.com', 'Bairro Friboi', 'Cidade Friboi', '03978450'),
('02916475004002', 'Swift', 'swift@swift.com', 'Bairro Swift', 'Cidade Swift', '03978340');

insert into Sensor (tipo, codigo, data_instalacao) values
('temperatura', 30949, '2020-04-19'),
('temperatura', 30950, '2020-04-20'),
('temperatura', 30951, '2020-04-20'),
('temperatura', 30952, '2020-04-20');

insert into Dados (dtH, temperatura, altLog, fkEmpresa, fkSensor) values
('2022-09-11 13:09:26','30.4', 'x-100 y-400',  1, 1),
('2022-09-11 14:09:26','30.7', 'x-848 y-400',  1, 1),
('2022-09-11 15:09:26','30.9', 'x-100 y-848',  1, 3),
('2022-09-11 16:09:26', '30.12', 'x-848 y-837', 2, 2),
('2022-09-11 18:09:26','30.15', 'x-100 y-363',  2, 2),
('2022-09-11 14:09:26','30.12', 'x-100 y-400',  2, 4);

select concat(Empresa.nomeEmpresa, ' - ', Empresa.cnpj) as 'Nome Empresa + CNPJ', 
concat('Bairro: ',Empresa.bairroEmpresa, ' -- Cidade: ',Empresa.cidadeEmpresa,' -- CEP: ', Empresa.cepEmpresa) as 'Bairro, Cidade e CEP', 
concat(Sensor.codigo, ' - ' ,Sensor.idSensor) as 'Código do Sensor + ID', 
concat(Dados.temperatura, ' °C'), 
Dados.dtH as 'Data e Horário do dado' from Dados 
	join Sensor on Dados.fkSensor = Sensor.idSensor
		join Empresa on Dados.fkEmpresa = Empresa.idEmpresa
			where Empresa.nomeEmpresa = 'Swift' or Empresa.nomeEmpresa = 'Friboi';
        





