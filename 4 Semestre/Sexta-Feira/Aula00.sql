create table funcionario(
id int primary key,
nome varchar(100) not null,
cpf numeric(11,0) not null,
telefone varchar(11),
sexo varchar(1) not null,
gerente int references funcionario
);

create table projeto(
id int primary key,
nome varchar(100) not null,
dt_inicio date not null,
custo numeric(10,2) not null
);

create table computador(
id int primary key,
nome varchar(100),
obs varchar(200)
);

create table alocacao(
id int primary key,
funcionario int references funcionario,
projeto int references projeto,
computador int references computador,
dt_inicio date
);

alter table funcionario
add constraint uk_func unique (cpf);

insert into funcionario values (1,'João',12345678956,'47474747','M',null),
(2,'Maria',32645678956,'47479876','F',null),
(3,'Cláudio',98745678956,'98724747','M',1),
(4,'Ricardo',26545678956,'47298647','M',2),
(5,'Helena',19645678956,'26454747','F',2);

insert into projeto values (1,'Proj A','2012-08-01',200000.00),
(2,'Proj B','2013-06-01',10000.00),
(3,'Proj C','2013-08-10',55000.00);

insert into computador values (1,'Micro A','obs'),
(2,'Micro B','obs'),
(3,'Micro C','obs'),
(4,'Micro D','obs'),
(5,'Micro E','obs');

insert into alocacao values (1,1,1,1),
(2,4,1,2),
(3,5,2,3),
(4,3,3,5),
(5,2,3,4);




