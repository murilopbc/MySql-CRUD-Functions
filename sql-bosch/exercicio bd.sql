/*CREATE DATABASE escola;

CREATE TABLE Curso (
  id_curso INT IDENTITY PRIMARY KEY,
    nome VARCHAR(50),
    turno VARCHAR(50)
  
  );

CREATE TABLE Aluno (
  id_aluno INT IDENTITY PRIMARY KEY,
    nome VARCHAR(50),
    matricula VARCHAR(50),
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
  
  );
CREATE TABLE Disciplina (
    id_disciplina INT IDENTITY PRIMARY KEY,
    nome VARCHAR(50),
    carga_hora INT,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
  
  );

  


ALTER TABLE Curso ADD ano INT ;
ALTER TABLE Disciplina ADD sala INT;

INSERT INTO Curso(nome, turno)
VALUES ('info', 'manh�'),
('eletro', 'tarde'),
('mec', 'noite');

INSERT INTO Disciplina(nome, carga_hora, id_curso) VALUES
('poo', 40, 1),
('bd',40 , 1),
('digital',20 , 2);

INSERT INTO Disciplina(nome, carga_hora, id_curso) VALUES
('anal�gica', 20, 2),
 ('des_tec',100 , 3),
('usinagem',100 , 3);

INSERT INTO Aluno(nome, matricula, id_curso) VALUES 
('Caio', '01', 1), 
('Murilo', '02', 2), 
('Jo�o', '03', 3);


UPDATE Disciplina
SET carga_hora = 90;

SELECT * FROM Disciplina;

UPDATE Curso
SET turno = 'noite' WHERE id_curso = 2;


SELECT Aluno.nome, Curso.nome
FROM Aluno
inner join Curso on Curso.id_curso = Aluno.id_aluno
WHERE Curso.nome = 'info';


SELECT Aluno.nome, Disciplina.nome
FROM Aluno
inner join Disciplina on Disciplina.id_curso = Aluno.id_aluno
WHERE Disciplina.nome = 'poo';



SELECT Curso.nome, Disciplina.nome
FROM Curso
inner join Disciplina on Disciplina.id_curso = Curso.id_curso
WHERE Disciplina.nome = 'bd';


SELECT Disciplina.nome, Curso.nome
FROM Disciplina
inner join Curso on Curso.id_curso = Disciplina.id_disciplina
WHERE Curso.nome = 'info';

SELECT Aluno.nome, Aluno.matricula, Curso.nome
FROM Aluno
inner join Curso on Curso.id_curso = Aluno.id_aluno
WHERE Curso.nome = 'eletro' OR Curso.nome =  'info';

SELECT Aluno.nome, Curso.nome
FROM Aluno
INNER JOIN Curso on Curso.id_curso = Aluno.id_aluno;

SELECT Curso.nome, Disciplina.nome, Disciplina.carga_hora
FROM Curso
INNER JOIN Disciplina on Curso.id_curso = Disciplina.id_curso;

SELECT Aluno.nome, Disciplina.nome
FROM Aluno
INNER JOIN Disciplina on Aluno.id_curso = Disciplina.id_curso
ORDER BY Aluno.nome, Disciplina.nome

*/