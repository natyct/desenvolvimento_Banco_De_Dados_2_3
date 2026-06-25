-- =========================
-- TABELA ALUNOS
-- =========================
CREATE TABLE Alunos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    curso TEXT NOT NULL,
    idade INTEGER,
    email TEXT
);

-- =========================
-- TABELA PROFESSORES
-- =========================
CREATE TABLE Professores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    disciplina TEXT NOT NULL,
    salario REAL
);

-- =========================
-- TABELA DISCIPLINAS
-- =========================
CREATE TABLE Disciplinas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    carga_horaria INTEGER
);

-- =========================
-- TABELA MATRICULAS
-- =========================
CREATE TABLE Matriculas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    aluno_id INTEGER,
    disciplina_id INTEGER,
    semestre TEXT,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(id)
);

-- =========================
-- TABELA LOG
-- =========================
CREATE TABLE LogAlunos (
    id_log INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_aluno TEXT,
    acao TEXT,
    data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- TRIGGER
-- =========================
CREATE TRIGGER trg_aluno_insert
AFTER INSERT ON Alunos
BEGIN
    INSERT INTO LogAlunos (
        nome_aluno,
        acao
    )
    VALUES (
        NEW.nome,
        'Novo aluno cadastrado'
    );
END;

-- =========================
-- DADOS DOS ALUNOS
-- =========================
INSERT INTO Alunos (nome, curso, idade, email) VALUES
('João Silva', 'ADS', 20, 'joao@email.com'),
('Maria Souza', 'ADS', 22, 'maria@email.com'),
('Pedro Santos', 'Engenharia de Software', 21, 'pedro@email.com'),
('Ana Oliveira', 'Ciência da Computação', 23, 'ana@email.com'),
('Lucas Ferreira', 'ADS', 19, 'lucas@email.com');

-- =========================
-- DADOS DOS PROFESSORES
-- =========================
INSERT INTO Professores (nome, disciplina, salario) VALUES
('Carlos Mendes', 'Banco de Dados', 5000),
('Fernanda Lima', 'Programação Web', 5500),
('Ricardo Alves', 'Algoritmos', 6000);

-- =========================
-- DADOS DAS DISCIPLINAS
-- =========================
INSERT INTO Disciplinas (nome, carga_horaria) VALUES
('Banco de Dados', 80),
('Programação Web', 60),
('Algoritmos', 80),
('Estrutura de Dados', 60);

-- =========================
-- DADOS DAS MATRÍCULAS
-- =========================
INSERT INTO Matriculas (aluno_id, disciplina_id, semestre) VALUES
(1, 1, '2026.1'),
(1, 2, '2026.1'),
(2, 1, '2026.1'),
(3, 3, '2026.1'),
(4, 4, '2026.1'),
(5, 2, '2026.1');

-- =========================
-- CONSULTAS
-- =========================

-- Listar alunos
SELECT * FROM Alunos;

-- Listar professores
SELECT * FROM Professores;

-- Listar disciplinas
SELECT * FROM Disciplinas;

-- Ver matrículas
SELECT * FROM Matriculas;

-- Ver registros gerados pelo trigger
SELECT * FROM LogAlunos;