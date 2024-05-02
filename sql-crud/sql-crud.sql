/*CREATE DATABASE ESCOLA_MARCIA;

USE ESCOLA_MARCIA;

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
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

insert into Professor(nome, email, senha)
values('Victor Braga', 'victor@gmail.com', '12345');

insert into Turma(numero, nome, id_professor)
values('DS2TB','Desenvolvimento de Sistemas',1);

insert into atividade(numero, descricao, id_turma)
values('08', 'Período Diurno', 1)

select * from Turma where id_turma = 1;

update atividade SET descricao = 'Nova Turma' where id_atividade=1;

delete from Professor where id_professor=1;  -- Não posso deletar pois está associado com uma turma

insert into atividade(numero, descricao, id_turma)
values('10', 'Criar conexão com banco de dados', 1);


select * from atividade where id_turma = 1;

update Turma SET id_professor = '2' where id_turma = 1;

select Turma.nome, Turma.numero, Professor.email, Professor.nome
from Turma
inner join Professor on Professor.id_professor = Turma.id_professor

select Professor.nome, atividade.descricao
from Turma
inner join Professor on Professor.id_professor = Turma.id_professor
inner join atividade on Turma.id_turma = atividade.id_turma

*/



















