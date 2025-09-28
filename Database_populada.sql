CREATE DATABASE Sistema_Academico;
USE Sistema_Academico;

-- ========================
-- Tabela Pessoa (Pai)
-- ========================
CREATE TABLE Pessoa (
	id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100),
    telefone1 VARCHAR(20),
    telefone2 VARCHAR(20)
);

-- ========================
-- Tabela Aluno (Filho)
-- ========================
CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    ra VARCHAR(20) NOT NULL,
    ano_ingresso YEAR,
    id_pessoa INT,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa)
);

-- ========================
-- Tabela Professor (Filho)
-- ========================
CREATE TABLE Professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    titulacao VARCHAR(50),
    area_atuacao VARCHAR(100),
    salario DECIMAL(10,2),
    id_pessoa INT,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa)
);

-- ========================
-- Tabela Faculdade
-- ========================
CREATE TABLE Faculdade (
    id_faculdade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100),
    end_rua VARCHAR(100),
    end_numero VARCHAR(10),
    end_bairro VARCHAR(50),
    end_cidade VARCHAR(50),
    end_estado CHAR(2),
    end_cep CHAR(8)
);

-- ========================
-- Tabela Curso
-- ========================
CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    modalidade VARCHAR(50),
    id_faculdade INT,
    id_professor INT,
    FOREIGN KEY (id_faculdade) REFERENCES Faculdade(id_faculdade),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

-- ========================
-- Tabela Turma
-- ========================
CREATE TABLE Turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    semestre INT,
    ano YEAR,
    horario VARCHAR(20),
    sala VARCHAR(20),
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- ========================
-- Tabela Disciplina
-- ========================
CREATE TABLE Disciplina (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    periodo INT
);

-- ========================
-- Tabela de ligação Turma_Disciplina (N:N)
-- ========================
CREATE TABLE Turma_Disciplina (
    id_turma INT,
    id_disciplina INT,
    PRIMARY KEY (id_turma, id_disciplina),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

-- ========================
-- Tabela de ligação Professor_Disciplina (N:N)
-- ========================
CREATE TABLE Professor_Disciplina (
    id_professor INT,
    id_disciplina INT,
    PRIMARY KEY (id_professor, id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

-- ========================
-- Tabela Matrícula
-- ========================
CREATE TABLE Matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    data_matricula DATE,
    situacao VARCHAR(20),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);

-- ========================
-- Tabela Histórico Escolar
-- ========================
CREATE TABLE Historico_Escolar (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT,
    id_disciplina INT,
    nota DECIMAL(5,2),
    frequencia DECIMAL(5,2),
    estado VARCHAR(20),
    FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);





-- ========================
-- CADASTRO DE PESSOAS
-- ========================
INSERT INTO Pessoa (nome_completo, cpf, data_nascimento, email, telefone1, telefone2) VALUES
('Juliana Almeida Torres', '48219670083', '1990-06-15', 'juliana.torres@gmail.com', '11933452234', '11998761234'),
('Carlos Henrique da Silva', '12730859001', '1985-03-22', 'carlos.h.silva@outlook.com', NULL, '21987654321'),
('Renata Oliveira Costa', '80913765030', '1978-11-09', 'renata.costa@yahoo.com', '31984561122', NULL),
('Marcos Vinícius Pereira', '23577698002', '1995-12-05', 'marcosvp@hotmail.com', NULL, NULL),
('Ana Beatriz Figueiredo', '61348029044', '2002-07-27', 'ana.b.figueiredo@gmail.com', '41992345566', '41996781122'),
('Luciano Roberto Martins', '34256078015', '1980-01-30', 'luciano.martins@outlook.com', '51991234455', NULL),
('Fernanda Rocha Lima', '96582137069', '1992-04-18', 'fernandarochalima@gmail.com', NULL, NULL),
('Thiago Mendes Duarte', '72133468070', '1988-09-02', 'thiago.duarte@hotmail.com', '61998876655', '61987765544'),
('Patrícia Gonçalves Araújo', '53410928095', '1975-02-14', 'patricia.araujo@yahoo.com.br', NULL, '81999998888'),
('Diego Fernando Nogueira', '18039756037', '2000-10-11', 'diego.nogueira@gmail.com', '71988887777', NULL);

-- ========================
-- CADASTRO DE ALUNOS
-- ========================
INSERT INTO Aluno (ra, ano_ingresso, id_pessoa) VALUES
('202012345', 2020, 1),
('202134567', 2021, 3),
('202298765', 2022, 5),
('202312378', 2023, 7),
('202412399', 2024, 9);

-- ========================
-- CADASTRO DE PROFESSORES
-- ========================
INSERT INTO Professor (titulacao, area_atuacao, salario, id_pessoa) VALUES
('Doutor em Engenharia de Software', 'Engenharia de Software', 12500.00, 2),
('Mestre em Matemática Aplicada', 'Matemática Aplicada', 9800.50, 4),
('Especialista em Administração de Empresas', 'Administração', 7600.00, 6),
('Doutor em Física Teórica', 'Física Teórica', 13200.75, 8),
('Mestre em Linguística e Estudos da Linguagem', 'Linguística', 8900.00, 10);

-- ========================
-- CADASTRO DE FACULDADES
-- ========================
INSERT INTO Faculdade (nome, cnpj, email, end_rua, end_numero, end_bairro, end_cidade, end_estado, end_cep) VALUES
('Faculdade Exemplar - Campus Centro', '12345678000190', 'contato.centro@faculdadeexemplar.edu.br', 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', '01001000'),
('Faculdade Exemplar - Campus Zona Sul', '12345678000270', 'contato.zonasul@faculdadeexemplar.edu.br', 'Avenida do Estudante', '456', 'Vila Mariana', 'São Paulo', 'SP', '04002200'),
('Faculdade Exemplar - Campus Campinas', '12345678000350', 'contato.campinas@faculdadeexemplar.edu.br', 'Rua Universitária', '789', 'Barão Geraldo', 'Campinas', 'SP', '13083970');

-- ========================
-- CADASTRO DE CURSOS
-- ========================
INSERT INTO Curso (nome, carga_horaria, modalidade, id_faculdade, id_professor) VALUES
('Engenharia de Software', 3600, 'Presencial', 1, 1),
('Matemática Aplicada', 3200, 'EAD', 2, 2),
('Administração de Empresas', 3000, 'Híbrido', 1, 3),
('Física Teórica', 4000, 'Presencial', 3, 4),
('Letras - Linguística', 2800, 'EAD', 2, 5);

-- ========================
-- CADASTRO DE TURMAS
-- ========================
INSERT INTO Turma (semestre, ano, horario, sala, id_curso) VALUES
(1, 2024, '08:00 - 12:00', 'Sala 101', 1),
(2, 2024, '19:00 - 22:30', 'Sala 202', 2),
(1, 2025, '13:30 - 17:30', 'Sala 303', 3),
(2, 2025, '08:00 - 12:00', 'Sala 404', 4),
(1, 2024, '18:00 - 22:00', 'Sala 505', 5);

-- ========================
-- CADASTRO DE DISCIPLINAS
-- ========================
INSERT INTO Disciplina (nome, carga_horaria, periodo) VALUES
('Algoritmos e Lógica de Programação', 80, 1),
('Cálculo Diferencial e Integral I', 120, 1),
('Teoria das Organizações', 60, 2),
('Física Mecânica', 100, 2),
('Fonética e Fonologia', 60, 3);

-- ========================
-- TURMA_DISCIPLINA
-- ========================
INSERT INTO Turma_disciplina (id_turma, id_disciplina) VALUES
(1, 1), -- Engenharia de Software > Algoritmos
(1, 2), -- Engenharia de Software > Cálculo
(2, 2), -- Matemática Aplicada > Cálculo
(2, 4), -- Matemática Aplicada > Física
(3, 3), -- Administração > Teoria das Organizações
(4, 4), -- Física Teórica > Física Mecânica
(4, 2), -- Física Teórica > Cálculo
(5, 5), -- Letras > Fonética e Fonologia
(5, 3); -- Letras > Teoria das Organizações

-- ========================
-- PROFESSOR_DISCIPLINA
-- ========================
INSERT INTO Professor_disciplina (id_professor, id_disciplina) VALUES
(1, 1), -- Carlos > Algoritmos
(1, 2), -- Carlos > Cálculo
(2, 2), -- Marcos > Cálculo
(2, 4), -- Marcos > Física
(3, 3), -- Luciano > Teoria das Organizações
(4, 4), -- Thiago > Física Mecânica
(4, 2), -- Thiago > Cálculo
(5, 5), -- Diego > Fonética e Fonologia
(5, 3); -- Diego > Teoria das Organizações

-- ========================
-- CADASTRO DA MATRICULA
-- ========================
INSERT INTO Matricula (id_aluno, id_turma, data_matricula, situacao) VALUES
(1, 1, '2024-02-15', 'Ativo'),
(2, 2, '2024-02-16', 'Ativo'),
(3, 3, '2025-02-10', 'Ativo'),
(4, 5, '2024-03-01', 'Trancado'),
(5, 4, '2025-01-20', 'Cancelado');

-- ========================
-- HISTORICO ESCOLAR
-- ========================
INSERT INTO Historico_escolar (id_matricula, id_disciplina, nota, frequencia, estado) VALUES
(1, 1, 8.5, 95, 'Aprovado'),  -- Juliana > Algoritmos
(1, 2, 6.0, 88, 'Aprovado'),  -- Juliana > Cálculo
(2, 2, 4.5, 92, 'Reprovado'), -- Renata > Cálculo
(2, 4, 7.0, 85, 'Aprovado'),  -- Renata > Física
(3, 3, 9.0, 98, 'Aprovado'),  -- Ana > Teoria das Organizações
(4, 5, 7.5, 59, 'Reprovado'), -- Fernanda > Fonética e Fonologia
(5, 4, 6.0, 91, 'Aprovado');  -- Patrícia > Física Mecânica



