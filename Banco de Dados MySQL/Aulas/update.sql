UPDATE
    tb_alunos
SET
    nome = 'João'
WHERE -- Opcional
    id_aluno = 13;

UPDATE
    tb_alunos
SET
    interesse = 'Saúde'
WHERE
    idade >= 80;

UPDATE
    tb_alunos
SET
    nome = 'José', idade = 25, email = 'jose@gmail.com'
WHERE
    id_aluno = 18;

UPDATE
    tb_alunos
SET
    nome = 'Maria'
WHERE
    idade BETWEEN 18 AND 25 AND estado = 'PA';