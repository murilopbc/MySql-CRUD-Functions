-- Criação do banco de dados
/*
CREATE DATABASE IF NOT EXISTS VENDAS_murilo;
USE VENDAS_murilo;

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

-- Criação da tabela Produto
CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- Criação da tabela vendas_online
CREATE TABLE vendas_online (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    data_venda DATE NOT NULL,
    valor_venda DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Criação da tabela vendas_fisicas
CREATE TABLE vendas_fisicas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    data_venda DATE NOT NULL,
    valor_venda DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Inserção de dados em Cliente
INSERT INTO Cliente (nome, email) VALUES
('João Silva', 'joao.silva@example.com'),
('Maria Oliveira', 'maria.oliveira@example.com'),
('Carlos Souza', 'carlos.souza@example.com'),
('Olívia Reis', 'olivia.reis@example.com');


-- Inserção de dados em Produto
INSERT INTO Produto (nome, preco) VALUES
('Livro de SQL', 50.00),
('Curso de Dados', 150.00),
('Notebook Gamer', 5000.00),
('Notebook i7', 3500.00);

 -- Inserção de dados em vendas_online
INSERT INTO vendas_online (id_cliente, id_produto, data_venda, valor_venda) VALUES
(1, 1, '2023-01-05', 50.00),
(2, 2, '2023-01-15', 150.00),
(3, 3, '2023-01-20', 5000.00),
(1, 3, '2023-01-25', 5000.00);

-- Inserção de dados em vendas_fisicas
INSERT INTO vendas_fisicas (id_cliente, id_produto, data_venda, valor_venda) VALUES
(2, 1, '2023-01-03', 50.00),
(3, 2, '2023-01-12', 150.00),
(1, 3, '2023-01-18', 5000.00),
(1, 1, '2023-01-18', 60.00),
(2, 3, '2023-01-25', 5000.00);

*/


select cliente.nome, produto.nome
from cliente
inner join vendas_online on cliente.id_cliente = vendas_online.id_cliente
inner join produto on vendas_online.id_produto = produto.id_produto;


select vendas_fisicas.id_venda, cliente.nome, produto.nome
from vendas_fisicas
inner join cliente on vendas_fisicas.id_cliente = cliente.id_cliente
inner join produto on vendas_fisicas.id_produto = produto.id_produto;


select produto.nome, vendas_fisicas.data_venda, vendas_online.data_venda
from produto
inner join vendas_fisicas on produto.id_produto = vendas_fisicas.id_produto
inner join vendas_online on produto.id_produto = vendas_online.id_produto
WHERE DATE(vendas_fisicas.data_venda) = DATE(vendas_online.data_venda);


select cliente.nome, produto.nome
from cliente
inner join vendas_fisicas on cliente.id_cliente = vendas_fisicas.id_cliente
inner join vendas_online on cliente.id_cliente = vendas_online.id_cliente
inner join produto on vendas_fisicas.id_produto AND vendas_online.id_produto = produto.id_produto;


select produto.nome, SUM(vendas_online.valor_venda) as total_vendas_online
from produto
inner join vendas_online on produto.id_produto = vendas_online.id_produto
group by produto.nome;


select produto.nome as nome_produto, IFNULL(SUM(vendas_online.valor_venda), 0) as total_vendas_online
from produto
left join vendas_online on produto.id_produto = vendas_online.id_produto
group by produto.nome;


SELECT cliente.nome AS nome_cliente
FROM cliente
LEFT JOIN vendas_fisicas ON cliente.id_cliente = vendas_fisicas.id_cliente
WHERE vendas_fisicas.id_venda IS NULL;


select produto.nome as nome_produto
from produto
left join vendas_online on produto.id_produto = vendas_online.id_produto
where vendas_online.id_venda is null;


SELECT produto.nome
FROM produto
INNER JOIN vendas_fisicas ON produto.id_produto = vendas_fisicas.id_produto
LEFT JOIN vendas_online ON vendas_fisicas.id_venda = vendas_online.id_venda
WHERE vendas_online.id_venda IS NULL;


select cliente.nome
from cliente
left join vendas_online on cliente.id_cliente = vendas_online.id_cliente
where vendas_online.id_venda is null;


select * from vendas_online
UNION
select * from vendas_fisicas;


select id_produto, data_venda, valor_venda, 'online' as tipo
from vendas_online
UNION
select id_produto, data_venda, valor_venda, 'física' as tipo
from vendas_fisicas;