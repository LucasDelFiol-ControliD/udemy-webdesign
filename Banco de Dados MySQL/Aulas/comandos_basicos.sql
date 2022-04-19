-- Cria banco de dados
CREATE DATABASE db_curso_web;

-- Cria tabelas no banco de dados
CREATE TABLE tb_cursos (
    id_curso int not null,
    imagem_curso varchar(100) not null,
    nome_curso char(50) not null,
    resumo text null,
    data_cadastro datetime not null,
    ativo boolean default true,
    investimento float(8,2) default 0
);

-- Deleta tabela do bano de dados
-- DROP TABLE tb_cursos;

-- Deleta banco de dados
-- DROP DATABASE db_curso_web;

-- Renomeia tabelas do banco de dados
-- RENAME TABLE tb_cursos TO tb_cursos_test;

-- Adiciona, edita e remove colunas da tabela selecionada
ALTER TABLE tb_cursos ADD COLUMN carga_horaria VARCHAR(5) not null;
ALTER TABLE tb_cursos CHANGE carga_horaria carga_horaria INT(5) null;
-- ALTER TABLE tb_cursos DROP carga_horaria;

-- Inserindo dados na tabela
INSERT INTO tb_cursos(ativo, carga_horaria, data_cadastro, id_curso, imagem_curso, investimento, nome_curso, resumo)values(1, 15, '2018-07-17 00:00:00', 1, 'curso_node.jpg', 575.86, 'Curso Completo NodeJS e MongoDB', 'Aprenda a criar aplicações front-end incríveis com JavaScript, TypeScript e Angular.');
INSERT INTO tb_cursos(ativo, carga_horaria, data_cadastro, id_curso, imagem_curso, investimento, nome_curso, resumo)values(1, 35, '2018-07-17 12:25:35', 2, 'curso_angular.jpg', 550.75, 'Web Completo com JS, TS e Angular', 'Crie aplicações back-end incríveis com a plataforma NodeJS e o banco de dados MongoDB.');

-- Selecionar colunas da tabela
SELECT ativo, carga_horaria, data_cadastro, id_curso, imagem_curso, investimento, nome_curso, resumo FROM tb_cursos;
SELECT * FROM tb_cursos; -- * seleciona todas as colunas

-- Filtros
SELECT id_curso, nome_curso FROM tb_cursos WHERE investimento < 560;