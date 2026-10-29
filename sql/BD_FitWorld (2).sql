-- 1
CREATE TABLE plano (
    id_plano INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    duracao INT NOT NULL,
    valor NUMERIC(10,2) NOT NULL
);

-- 2
CREATE TABLE professor (
    id_professor INT PRIMARY KEY,
    cref VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(20)
);

-- 3
CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    id_professor INT NOT NULL,

    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

-- 4
CREATE TABLE aula (
    id_aula INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    horario TIME NOT NULL,
    capacidade INT NOT NULL,
    id_professor INT NOT NULL,

    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

-- 5
CREATE TABLE matricula (
    id_matricula INT PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    status VARCHAR(20) NOT NULL,
    id_plano INT NOT NULL,
    id_aluno INT NOT NULL,

    FOREIGN KEY (id_plano) REFERENCES plano(id_plano),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

-- 6
CREATE TABLE treino (
    id_treino INT PRIMARY KEY,
    data_criacao DATE NOT NULL,
    duracao VARCHAR(20),
    id_aluno INT NOT NULL,
    id_professor INT NOT NULL,

    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

-- 7
CREATE TABLE aluno_aula (
    id_aula INT NOT NULL,
    id_aluno INT NOT NULL,
    PRIMARY KEY (id_aula, id_aluno),
    FOREIGN KEY (id_aula) REFERENCES aula(id_aula),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

-- 1
INSERT INTO plano(id_plano, nome, duracao, valor) VALUES
(1, 'Mensal', 1, 150.00),
(2, 'Semestral', 6, 780.00),
(3, 'Anual', 12, 1320.00);

-- 2
INSERT INTO professor(id_professor, cref, nome, especialidade, telefone) VALUES
(1, '123456-G/RJ', 'Renato Cariani', 'Musculação', '2191111-2222'),
(2, '789012-G/RJ', 'Grazi Massafera', 'Pilates', '2193333-4444'),
(3, '345678-G/RJ', 'Nicolas Prattes', 'Crossfit', '2195555-6666'),
(4, '901234-G/RJ', 'Lore Mello', 'Danca', '2197777-8888'),
(5, '567890-G/RJ', 'Anderson Silva', 'Luta', '2199999-0000');

-- 3
INSERT INTO aluno(id_aluno, cpf, nome, data_nascimento, email, telefone, id_professor) VALUES
(1, '111.222.333-44', 'Ana Abacate', '2000-12-14', 'Ana_Abacate@gmail.com', '2190000-9999', 1),
(2, '222.333.444-55', 'Beatriz Banana', '2001-10-14', 'Beatriz_Banana@gmail.com', '2191111-8888', 2),
(3, '333.444.555-66', 'Carlos Caqui', '2002-08-14', 'Carlos_Caqui@gmail.com', '2192222-7777', 3),
(4, '444.555.666-77', 'Eduardo Embu', '2003-06-14', 'Eduardo_Embu@gmail.com', '2193333-6666', 4),
(5, '555.666.777-88', 'Felipe Figo', '2004-04-14', 'Felipe_Figo@gmail.com', '2194444-5555', 5),
(6, '666.777.888-99', 'Gabriel Guarana', '1999-02-14', 'Gabriel_Guarana@gmail.com', '2195555-4444', 5),
(7, '777.888.999-00', 'Helio Hancornia', '2000-01-14', 'Helio_Hancornia@gmail.com', '2196666-3333', 4),
(8, '888.999.000-11', 'Italo Inga', '1998-07-14', 'Italo_Inga@gmail.com', '2197777-2222', 3),
(9, '999.000.111-22', 'Janaina Jabuticaba', '1997-12-14', 'Janaina_Jabuticaba@gmail.com', '2198888-1111', 2),
(10, '012.345.678-90', 'Karol Kiwi', '1996-05-14', 'Karol_Kiwi@gmail.com', '2199876-5432', 1);

-- 4
INSERT INTO aula(id_aula, nome, horario, capacidade, id_professor) VALUES
(1, 'WOD', '10:30:00', 15, 3),
(2, 'Pilates ', '09:00:00', 25, 2),
(3, 'Ritmos e Dança', '18:00:00', 30, 4),
(4, 'Musculação', '08:00:00', 15, 1),
(5, 'Muay Thai', '20:00:00', 20, 5);

-- 5
INSERT INTO matricula(id_matricula, data_inicio, data_fim, status, id_plano, id_aluno) VALUES
(1, '2025-01-10', '2025-07-10', 'Cancelada', 2, 1),
(2, '2025-08-01', NULL, 'Ativa', 3, 1),
(3, '2026-01-15', NULL, 'Ativa', 1, 2),
(4, '2026-02-01', NULL, 'Ativa', 2, 3),
(5, '2026-02-10', NULL, 'Ativa', 1, 4),
(6, '2026-03-01', NULL, 'Ativa', 3, 5),
(7, '2026-03-15', NULL, 'Ativa', 2, 6),
(8, '2026-04-01', NULL, 'Ativa', 1, 7),
(9, '2026-04-10', NULL, 'Ativa', 3, 8),
(10, '2026-05-01', NULL, 'Ativa', 2, 9),
(11, '2026-05-20', NULL, 'Ativa', 1, 10);

-- 6
INSERT INTO treino(id_treino, data_criacao, duracao, id_aluno, id_professor) VALUES
(1, '2026-01-12', '50 min', 1, 1),
(2, '2026-01-15', '45 min', 1, 1),
(3, '2026-01-20', '60 min', 2, 1),
(4, '2026-02-05', '55 min', 2, 2),
(5, '2026-02-12', '45 min', 3, 2),
(6, '2026-02-18', '50 min', 4, 3),
(7, '2026-03-05', '60 min', 5, 3),
(8, '2026-03-20', '40 min', 6, 4),
(9, '2026-04-02', '50 min', 7, 4),
(10, '2026-04-15', '60 min', 8, 5),
(11, '2026-05-05', '45 min', 9, 5),
(12, '2026-05-22', '50 min', 10, 1);

-- 7
INSERT INTO aluno_aula(id_aula, id_aluno) VALUES
(1, 3),
(1, 8),
(2, 2),
(2, 9),
(3, 4),
(3, 7),
(3, 1),
(4, 1),
(4, 10),
(5, 5),
(5, 6),
(5, 3);

--1
SELECT * FROM plano;

--2
SELECT * FROM professor;

--3
SELECT * FROM aluno;

--4
SELECT * FROM aula;

--5
SELECT * FROM matricula;

--6
SELECT * FROM treino;

--7
SELECT * FROM aluno_aula;

-- Consulta simples: Identifica matrículas com status cancelado
SELECT id_matricula, status, id_aluno FROM matricula 
WHERE status = 'Cancelada';

-- Consulta com junçao: Consulta o nome(do aluno), plano, valor(do plano) e o status de cada matricula ativa 
SELECT aluno.nome AS nome, plano.nome AS Plano, plano.valor, matricula.status
FROM matricula
INNER JOIN aluno ON matricula.id_aluno = aluno.id_aluno
INNER JOIN plano ON matricula.id_plano = plano.id_plano
WHERE matricula.status = 'Ativa'
ORDER BY aluno.nome;

-- Consulta com Agregação: Consulta a quantidade de aulas ministradas por professor
SELECT professor.nome AS professor, COUNT(aula.id_aula) AS total_aulas 
FROM professor
LEFT JOIN aula ON professor.id_professor = aula.id_professor
GROUP BY professor.id_professor, professor.nome
ORDER BY total_aulas DESC;

-- Consulta com HAVING COUNT: Alunos inscritos em mais de uma aula
SELECT aluno.nome AS aluno, COUNT(aluno_aula.id_aula) AS total_aulas_inscritas
FROM aluno
INNER JOIN aluno_aula ON aluno.id_aluno = aluno_aula.id_aluno
GROUP BY aluno.id_aluno, aluno.nome
HAVING COUNT(aluno_aula.id_aula) > 1
ORDER BY total_aulas_inscritas DESC;

-- Tentando cadastrar uma aula a um professor que não existe (Tirar o comentário para ver o erro)
--INSERT INTO aula(id_aula, nome, horario, capacidade, id_professor) 
--VALUES (6, 'Judô', '21:00:00', 20, 99);

-- Insert de uma aula a um professor que existe
INSERT INTO aula(id_aula, nome, horario, capacidade, id_professor) 
VALUES (6, 'Judô', '21:00:00', 20, 5);
--SELECT * FROM aula;

-- Excluindo do registro a matrícula cancelada do aluno 1
DELETE FROM matricula
WHERE id_matricula = 1 AND status = 'Cancelada';
--SELECT * FROM matricula;
