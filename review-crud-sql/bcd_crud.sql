/*
-- DROP escola_<seunome>; -- somente se necessário
CREATE DATABASE escola_murilo;
USE escola_murilo;

-- Criação da tabela de Professores
CREATE TABLE Professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Criação da tabela de Turmas
CREATE TABLE Turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(50) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

-- Criação da tabela de Atividades
CREATE TABLE atividade (
    id_atividade INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    id_turma INT,
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);


insert INTO Professor (nome, email, senha)
values ('João Silva', 'joao@example.com', '123456' );


insert INTO Professor (nome, email, senha)
values ('Murilo', 'murilo@example.com', '345678' );

insert INTO Professor (nome, email, senha)
values ('Israel', 'israel@example.com', '234567' );


insert into Turma(numero, nome, id_professor)
values ('T01', 'Matemática Avançada', '3');

insert into Turma(numero, nome, id_professor)
values ('DS8', 'Python', '2');


insert into atividade(numero, descricao, id_turma)
values ('A001', 'Prova de Matemática', '2');


insert INTO Professor (nome, email, senha)
values ('Ana Oliveira', 'ana@example.com', 'senha123' );

insert into Turma(numero, nome, id_professor)
values ('T02', 'Física Experimental', '4');

select * from Professor where id_professor  = 1;

select Turma.numero, Turma.nome, Professor.nome
from Turma
inner join Professor on Turma.id_professor = Professor.id_professor

select atividade.numero, atividade.descricao, Turma.nome
from atividade
inner join Turma on Turma.id_turma = atividade.id_atividade

update Professor
set email = 'carlos@example.com' where id_professor = 2

update Turma
set nome = 'Inglês Intermediário' where id_turma = 3

update atividade
set descricao = 'Trabalho de Laboratório' where id_atividade = 1

update Professor
set senha = 'senha1' where id_professor = 1

update Turma
set nome = 'Química Orgânica' where id_turma = 3

update Turma
set id_professor = '1' where id_turma = 3

delete from Professor where id_professor = 4


delete from Turma where id_turma = 1

select * from Professor

select * from Turma

select * from atividade

*/

