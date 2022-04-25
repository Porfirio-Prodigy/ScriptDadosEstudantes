/* comentários sql */
create database if not exists dados_estudantes;
use dados_estudantes;
show tables;

/* criação da tabale alunos */
create table ALUNOS (
		CPF int NOT NULL,
        Nome varchar(30) not null,
        DataNascimento DATE,
        Endereco varchar(100) not null,
        NomeMae varchar(30),
        primary key (CPF)
);

create table Professores(
	CPF int NOT NULL,
    Nome varchar(30) NOT NULL,
	Salario decimal,
    CargaHoraria int,
    Endereco varchar(100) NOT NULL,
    primary key (CPF)
);

create table cursos(
	ID int not null auto_increment,
    Nome varchar(50) not null,
    CargaHoraria int not null,
    CPF int not null,
    primary key (ID),
    foreign key (CPF) references Professores(CPF)
);

create table matriculas(
	ID int auto_increment not null,
    IDAlunos int not null,
    IDCursos int not null,
    
    primary key (ID),
    foreign key (IDAlunos) references alunos(CPF),
    foreign key (IDCursos) references cursos(ID)
);


/* populando alunos */
INSERT INTO `alunos` (`CPF`,`Nome`,`DataNascimento`,`Endereco`,`NomeMae`)
VALUES
  ("44288361","Vaughan Ellison","2004-03-13","ipsum. Suspendisse non","Halee Michael"),
  ("33696789","Kyla Blair","2002-12-24","ac, feugiat non, lobortis","Regina Forbes"),
  ("32738163","Levi Fry","1995-10-16","eleifend nec, malesuada ut, sem. Nulla","Britanney Maynard"),
  ("25297994","Kaye Cameron","2020-12-12","ante ipsum primis in","Cynthia Oneal"),
  ("34774120","Shana Baird","2002-08-25","nisl arcu iaculis enim, sit","Jada Stokes");

INSERT INTO `professores` (`CPF`,`Nome`,`Endereco`,`Salario`,`CargaHoraria`)
VALUES
  ("44288361","Vaughan Ellison","ipsum. Suspendisse non","1008.70",41),
  ("33696789","Kyla Blair","ac, feugiat non, lobortis","1727.99",6),
  ("32738163","Levi Fry","eleifend nec, malesuada ut, sem. Nulla","1456.40",29),
  ("25297994","Kaye Cameron","ante ipsum primis in","1777.97",8),
  ("34774120","Shana Baird","nisl arcu iaculis enim, sit","1477.42",45);
select * from alunos;

insert into `cursos` (`Nome`, `CargaHoraria`,`CPF`)
values
	("Administração", "40", "44288361"),
    ("ADS", "30", "32738163"),
    ("Nutrição", "35", "32738163"),
    ("Medicina", "100", "34774120");

INSERT INTO `matriculas` (`IDAlunos`,`IDCursos`)
VALUES
  ("25297994", "1"),
  ("32738163", "2"),
  ("33696789", "3"),
  ("34774120", "4"),
  ("44288361", "2");

/* SELECTS de Cada Tabela */
select * from alunos;
select * from professores;
select * from cursos;
select * from matriculas;

/* JOIN Completo da relação matriculas(alunos, cursos, professores) */ 
select alunos.CPF, alunos.Nome, cursos.Nome as Curso, cursos.CargaHoraria ,  professores.Nome as Professor
from matriculas
inner join alunos on matriculas.IDAlunos = alunos.CPF
inner join cursos on matriculas.IDCursos = cursos.ID
inner join professores on cursos.CPF = professores.CPF;

    