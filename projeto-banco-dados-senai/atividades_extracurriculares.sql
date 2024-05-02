CREATE DATABASE IF NOT EXISTS ATIVIDADES_EXTRACURRICULARES;
USE ATIVIDADES_EXTRACURRICULARES;

-- Criação da tabela Perfil
CREATE TABLE IF NOT EXISTS PERFIL (
    id_perfil INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) UNIQUE NOT NULL
);

-- Criação da tabela Categoria de Atividades
CREATE TABLE IF NOT EXISTS CATEGORIAS (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(60) NOT NULL
);

-- Criação da tabela Eventos
CREATE TABLE IF NOT EXISTS EVENTOS (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nome_evento ENUM('Esportivo', 'Artístico', 'Acadêmico') NOT NULL
);


-- Criação da tabela Atividades
CREATE TABLE IF NOT EXISTS ATIVIDADES (
    id_atividade INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT,
    data_inicial DATE NOT NULL,
    data_final DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    id_evento INT,
    FOREIGN KEY (id_evento) REFERENCES EVENTOS(id_evento),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIAS(id_categoria)
);

-- Criação da tabela Usuários
CREATE TABLE IF NOT EXISTS USUARIOS (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    id_perfil INT,
    FOREIGN KEY (id_perfil) REFERENCES PERFIL(id_perfil)
);

-- Criação da tabela Comentarios
CREATE TABLE IF NOT EXISTS COMENTARIOS (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    comentario TEXT,
    data_comentario DATETIME NOT NULL,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario),
    id_atividade INT,
    FOREIGN KEY (id_atividade) REFERENCES ATIVIDADES(id_atividade)
);

-- Tabela de Participação em Atividades
CREATE TABLE IF NOT EXISTS PARTICIPACAO (
    id_usuario INT,
    id_atividade INT,
    PRIMARY KEY (id_usuario, id_atividade),
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario),
    FOREIGN KEY (id_atividade) REFERENCES ATIVIDADES(id_atividade)
);

-- Tabela de Conexões entre Usuários
CREATE TABLE IF NOT EXISTS CONEXOES (
    id_conexao INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id1 INT,
    usuario_id2 INT,
    data_conexao DATE NOT NULL,
    FOREIGN KEY (usuario_id1) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (usuario_id2) REFERENCES Usuarios(id_usuario)
);

-- Tabela de Permissões para Criar Atividades
CREATE TABLE IF NOT EXISTS PERMISSOES  (
    id_usuario INT PRIMARY KEY,
    permissao_criar_atividade BOOLEAN DEFAULT FALSE,
    FOREIGN KEY(id_usuario) REFERENCES USUARIOS(id_usuario)
);
