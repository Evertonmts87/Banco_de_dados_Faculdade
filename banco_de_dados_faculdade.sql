-- Criação do Banco de Dados
CREATE DATABASE Faculdade;
USE Faculdade;

-- Tabela Alunos
CREATE TABLE Alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY, -- Chave primária
    nome VARCHAR(255) NOT NULL,             -- Nome do aluno
    matricula VARCHAR(20) UNIQUE NOT NULL,  -- Matrícula única
    cpf VARCHAR(14) UNIQUE NOT NULL,        -- CPF único
    data_nascimento DATE NOT NULL,          -- Data de nascimento
    id_turma INT NOT NULL,                  -- Chave estrangeira para Turmas
    FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma) -- Relacionamento com Turmas
);

-- Tabela Professores
CREATE TABLE Professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY, -- Chave primária
    nome VARCHAR(255) NOT NULL,                 -- Nome do professor
    cpf VARCHAR(14) UNIQUE NOT NULL,            -- CPF único
    especializacao VARCHAR(255)                 -- Especialização do professor
);

-- Tabela Cursos
CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY, -- Chave primária
    nome_curso VARCHAR(255) NOT NULL,       -- Nome do curso
    carga_horaria INT NOT NULL              -- Carga horária total do curso
);

-- Tabela Turmas
CREATE TABLE Turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY, -- Chave primária
    codigo_turma VARCHAR(50) NOT NULL,      -- Código da turma
    ano_semestre VARCHAR(50) NOT NULL,      -- Ano e semestre da turma
    id_curso INT NOT NULL,                  -- Chave estrangeira para Cursos
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso) -- Relacionamento com Cursos
);

-- Tabela Matérias
CREATE TABLE Materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY, -- Chave primária
    nome_materia VARCHAR(255) NOT NULL,       -- Nome da matéria
    carga_horaria INT NOT NULL,               -- Carga horária da matéria
    id_curso INT NOT NULL,                    -- Chave estrangeira para Cursos
    id_professor INT NOT NULL,                -- Chave estrangeira para Professores
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso), -- Relacionamento com Cursos
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor) -- Relacionamento com Professores
);

-- Tabela Notas
CREATE TABLE Notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY, -- Chave primária
    id_aluno INT NOT NULL,                  -- Chave estrangeira para Alunos
    id_materia INT NOT NULL,                -- Chave estrangeira para Matérias
    id_professor INT NOT NULL,              -- Chave estrangeira para Professores
    id_turma INT NOT NULL,                  -- Chave estrangeira para Turmas
    nota DECIMAL(5, 2) NOT NULL,            -- Nota do aluno
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno), -- Relacionamento com Alunos
    FOREIGN KEY (id_materia) REFERENCES Materias(id_materia), -- Relacionamento com Matérias
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor), -- Relacionamento com Professores
    FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma) -- Relacionamento com Turmas
);
Adiciona script SQL do banco de dados acadêmico.
