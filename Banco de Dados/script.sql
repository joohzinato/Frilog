create database Icelog;

use Icelog;

-- Criação da Tabela Empresa
create table Empresa (
idEmpresa int primary key auto_increment,
cnpj char (14),
nomeEmpresa varchar(100),
emailEmpresa varchar(100),
bairroEmpresa varchar(60),
cidadeEmpresa varchar(60),
cepEmpresa char(8),
senha varchar(45)
);

-- Criação da Tabela Caminhão
create table Caminhao (
idCaminhao int primary key auto_increment,
marca varchar(45),
nomeCaminhao varchar(45),
placa char(7),
fkEmpresa int,
foreign key (fkEmpresa) references Empresa(idEmpresa)
);

-- Criação da Tabela Sensor
create table Sensor (
idSensor int primary key auto_increment,
tipo varchar(20), constraint chkTipo check (tipo in('temperatura')),
codigo int,
data_instalacao date,
fkCaminhao int,
foreign key (fkCaminhao) references Caminhao(idCaminhao)
);

-- Criação da Tabela Dados
create table Dados (
idDados int primary key auto_increment,
dtH datetime,
temperatura double,
altLog varchar(30),
fkSensor int,
foreign key (fkSensor) references Sensor(idSensor)
);

insert into Empresa (cnpj, nomeEmpresa, emailEmpresa, bairroEmpresa, cidadeEmpresa, cepEmpresa, senha) values
('02916265004002', 'Friboi', 'friboi@friboi.com', 'Bairro Friboi', 'Cidade Friboi', '03978450', '123Friboi'),
('02916475004002', 'Swift', 'swift@swift.com', 'Bairro Swift', 'Cidade Swift', '03978340', '321Swifit');

insert into Caminhao (marca, nomeCaminhao, placa, fkEmpresa) values
('Scania', 'Nome1', 'JK4M333', 1),
('Marca2', 'Nome2', 'JK4M333', 1),
('Marca3', 'Nome3', 'JK4M333', 2),
('Marca4', 'Nome4', 'JK4M333', 2);

insert into Sensor (tipo, codigo, data_instalacao, fkCaminhao) values
('temperatura', 30949, '2020-04-19',  1),
('temperatura', 30950, '2020-04-20',  1),
('temperatura', 30951, '2020-04-20',  3),
('temperatura', 30952, '2020-04-20',  4);


insert into Dados (dtH, temperatura, altLog, fkSensor) values
('2022-09-11 13:09:26','30.4', 'x-100 y-400',  1),
('2022-09-12 14:09:26','30.6', 'x-838 y-400',  1),
('2022-09-13 14:09:26','30.5', 'x-858 y-400',  1),
('2022-09-14 14:09:26','30.3', 'x-868 y-400',  1),
('2022-09-11 15:09:26','30.9', 'x-100 y-848',  2),
('2022-09-11 16:09:26', '30.19', 'x-848 y-837', 2),
('2022-09-11 14:09:26','30.12', 'x-100 y-400',  3),
('2022-09-11 14:09:26','30.12', 'x-100 y-400',  4),
('2022-09-12 14:09:26','30.45', 'x-100 y-400',  3),
('2022-09-12 15:09:26','30.32', 'x-100 y-400',  4);

select Empresa.nomeEmpresa, Caminhao.marca, Caminhao.nomeCaminhao, Sensor.idSensor, Dados.temperatura, Dados.idDados, Dados.dtH from Empresa
	inner join Caminhao on Caminhao.fkEmpresa = Empresa.idEmpresa
			inner join Sensor on Sensor.fkCaminhao = Caminhao.idCaminhao
				inner join Dados on Dados.fkSensor = Sensor.idSensor
						where Sensor.idSensor = '1'
							order by Sensor.idSensor asc;
                    
			
			
                    
              