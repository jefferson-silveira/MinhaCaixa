SET DATEFORMAT YMD
GO
USE master
go
IF EXISTS (SELECT * FROM SYS.databases WHERE NAME = 'MinhaCaixa_Beta')
ALTER DATABASE MinhaCaixa_Beta SET SINGLE_USER WITH ROLLBACK IMMEDIATE
IF EXISTS (SELECT * FROM SYS.databases WHERE NAME = 'MinhaCaixa_Beta')
DROP database MinhaCaixa_Beta
go
CREATE DATABASE MinhaCaixa_Beta
GO
USE MinhaCaixa_Beta
GO
CREATE TABLE Grupo
(
GrupoCodigo INT IDENTITY(1,1) CONSTRAINT PK_Grupo PRIMARY KEY,
GrupoNome VARCHAR(50),
GrupoRazaoSocial VARCHAR(50),
GrupoCNPJ varchar(20),
)
GO
CREATE TABLE Filial
(
GrupoCodigo INT,
FilialCodigo INT IDENTITY(1,1) CONSTRAINT PK_Filial PRIMARY KEY,
FilialNome VARCHAR(50),
FilialRazaoSocial VARCHAR(50),
FilialCNPJ varchar(20),
)
CREATE table Clientes
(
ClienteCodigo int CONSTRAINT PK_CLIENTES PRIMARY KEY,
ClienteCPF varchar (50),
ClienteNome varchar (50),
ClienteSobrenome varchar (50),
ClienteSexo CHAR(1),
ClienteNascimento DATETIME,
ClienteEstadoCivil CHAR(1),
ClienteRua varchar(1000),
ClienteNumero INT,
ClienteBairro VARCHAR(50),
ClienteCEP VARCHAR(25),
ClienteCidade VARCHAR(50),
ClienteEstado CHAR(2),
ClientePais VARCHAR(50),
ClienteRendaAnual MONEY,
ClienteTelefone VARCHAR(50),
ClienteEmail VARCHAR(80)
) 
GO
CREATE TABLE Agencias
(
GrupoCodigo INT,
FilialCodigo INT,
AgenciaCodigo INT IDENTITY CONSTRAINT PK_Agencias PRIMARY KEY,
AgenciaNome VARCHAR (50),
AgenciaRua varchar(1000),
AgenciaNumero INT,
AgenciaBairro VARCHAR(50),
AgenciaCEP VARCHAR(25),
AgenciaCidade VARCHAR(50),
AgenciaEstado CHAR(2),
AgenciaPais VARCHAR(50)
)
GO
CREATE TABLE Contas
(
AgenciaCodigo int,
ContaNumero VARCHAR (10) CONSTRAINT PK_Conta PRIMARY KEY,
ClienteCodigo int,
ContaAbertura DATETIME,
ContaTipo int
)
CREATE TABLE Movimentos
(
ContaNumero VARCHAR (10),
MovimentoData DATETIME,
MovimentoValor MONEY,
MovimentoTipo INT,
MovimentoCodigo int
)
CREATE TABLE TipoContas
(
TipoContaCodigo INT CONSTRAINT PK_TipoContas PRIMARY KEY,
TipoContaDescição VARCHAR (25)
)
create table CartaoCredito
(
AgenciaCodigo INT,
ContaNumero VARCHAR (10),
ClienteCodigo int,
CartaoCodigo varchar (20),
CartaoLimite MONEY,
CartaoExpira DATETIME,
CartaoCodigoSeguranca int
)
INSERT dbo.CartaoCredito VALUES  (1,12,'1111-2222-3333-4444',1000)
GO
INSERT dbo.CartaoCredito VALUES  (4,13,'1234-4567-8910-1112',1000)
GO
INSERT dbo.CartaoCredito VALUES  (4,7,'2222-3333-4444-5555',2000)
GO