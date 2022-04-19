-- Filtros com Operadores de Comparação: =, !=, <, <=, >, >=
SELECT
	*
FROM
	`tb_alunos`
WHERE
	interesse = 'Jogos';

SELECT
	*
FROM
	`tb_alunos`
WHERE
	idade <= 25;

-- Filtros com Operadores Lógicos: AND, OR
SELECT
	*
FROM
	`tb_alunos`
WHERE
	interesse = 'Jogos' AND idade > 45 AND estado = 'RN';

SELECT
	*
FROM
	`tb_alunos`
WHERE
	interesse = 'Jogos' OR idade > 45;

-- Filtros com o operador BETWEEN
SELECT
	*
FROM
	`tb_alunos`
WHERE
	idade BETWEEN 18 AND 25; -- Equivalente: idade >= 18 AND idade <= 25

-- Filtros com o operador IN
SELECT
	*
FROM
	`tb_alunos`
WHERE
	interesse IN('Jogos', 'Música', 'Esporte'); -- Equivalente: interesse = 'Jogos OR interesse = 'Música' OR interesse = 'Esporte'

SELECT
	*
FROM
	`tb_alunos`
WHERE
	interesse NOT IN('Jogos', 'Música', 'Esporte');

-- Filtros com o operador LIKE
-- % indica que pode haver a existência de qualquer conjunto de caracteres no texto
-- _ indica que pode haver a existência de um ou mais caracteres em uma posição específica do texto

SELECT
	*
FROM
	`tb_alunos`
WHERE
	nome LIKE '%ne'; -- retorna os nomes com final "ne"

SELECT
	*
FROM
	`tb_alunos`
WHERE
	nome LIKE '%a%';

SELECT
	*
FROM
	`tb_alunos`
WHERE
	nome LIKE '_riel'; -- retorna os nomes que terminam com "riel", seguidos de um caractere indefinido

SELECT
	*
FROM
	`tb_alunos`
WHERE
	nome LIKE '_ru_'; -- retorna nome com caracteres indefinidos no começo e final, e possui no meio os caracteres "ru"

SELECT
	*
FROM
	`tb_alunos`
WHERE
	nome LIKE 'I__'; -- nome começa com I e possui a direita dois caracteres indefinidos

-- Ordenação de resultados: ascendente (ASC) e descendente (DESC)
SELECT
	*
FROM
	`tb_alunos`
WHERE
	idade BETWEEN 18 AND 59
ORDER BY
    nome ASC;

SELECT
	*
FROM
	`tb_alunos`
WHERE
	idade BETWEEN 18 AND 59
ORDER BY
    nome ASC, idade DESC, estado ASC;

-- Limitando retorno
SELECT
	*
FROM
	`tb_alunos`
WHERE -- opcional
	idade BETWEEN 18 AND 59
ORDER BY -- opcional
    nome ASC
LIMIT -- limita a quantidade de resultados
    25
OFFSET -- Define o começo da listagem
    5;

SELECT
	*
FROM
	`tb_alunos`
WHERE -- opcional
	idade BETWEEN 18 AND 59
ORDER BY -- opcional
    nome ASC
LIMIT -- limite com offset
    5, 25; -- offset, limit

-- Funções de agregação: MAX, MIN, AVG, SUM e COUNT
SELECT
	MIN(investimento) -- Retorna o máximo
FROM
	`tb_cursos`
WHERE
    ativo = true;

SELECT
	MAX(investimento) -- Retorna o mínimo
FROM
	`tb_cursos`
WHERE
    ativo = true;

SELECT
	AVG(investimento) -- Retorna a média
FROM
	`tb_cursos`
WHERE
    ativo = true;

SELECT
	SUM(investimento) -- Soma os valores da coluna "investimento"
FROM
	`tb_cursos`;

SELECT
	COUNT(*) -- Retorna a quantidade de todos os registros de uma tabela
FROM
	`tb_cursos`
WHERE
    ativo = false;

-- Agrupando seleção de registros (GROUP BY)
SELECT
	*, COUNT(*) -- Mostra a quantidade agrupada
FROM
	`tb_alunos`
GROUP BY
	interesse;

SELECT
	interesse, COUNT(*) AS total_por_interesse -- Dá um nome para a coluna de quantidade agrupada
FROM
	`tb_alunos`
GROUP BY
	interesse;

SELECT
	*, COUNT(*)
FROM
	`tb_alunos`
GROUP BY
	estado;

SELECT
	*, COUNT(*) AS total_por_estado
FROM
	`tb_alunos`
GROUP BY
	estado;

-- Filtrando seleções agrupadas (HAVING)
SELECT
	estado, COUNT(*) AS total_de_registros_por_estado
FROM
	`tb_alunos`
GROUP BY
	estado
HAVING
	total_de_registros_por_estado > 5;

SELECT
	estado, COUNT(*) AS total_de_registros_por_estado
FROM
	`tb_alunos`
GROUP BY
	estado
HAVING
	estado IN('MG', 'SP');

SELECT
	estado, COUNT(*) AS total_de_registros_por_estado
FROM
	`tb_alunos`
GROUP BY
	estado
HAVING
	estado IN('CE', 'SC') AND total_de_registros_por_estado > 4;

SELECT
	estado, COUNT(*) AS total_de_registros_por_estado
FROM
	`tb_alunos`
WHERE
	interesse != 'Esporte'
GROUP BY
	estado
HAVING
	total_de_registros_por_estado > 3;