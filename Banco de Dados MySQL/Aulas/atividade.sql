-- 1)
SELECT
    *
FROM
    tb_clientes
WHERE
    idade >= 29
ORDER BY
    idade ASC;

-- 2)
ALTER TABLE tb_clientes ADD COLUMN sexo CHAR(1) NOT NULL;
ALTER TABLE tb_clientes ADD COLUMN endereco VARCHAR(150) NULL;

-- 3)
UPDATE
    tb_clientes
SET
    sexo = 'M'
WHERE
    id_cliente IN(1, 2, 3, 6, 7);

-- 4)
UPDATE
    tb_clientes
SET
    sexo = 'F'
WHERE
    id_cliente BETWEEN 4 AND 5 OR id_cliente BETWEEN 8 AND 10;

-- 5)
SELECT
    c.id_cliente,
    c.nome,
    c.idade,
    prod.produto,
    prod.valor
FROM
    tb_clientes AS c INNER JOIN tb_pedidos AS p ON(c.id_cliente = p.fk_id_cliente) INNER JOIN tb_pedidos_produtos AS PP ON(p.id_pedido = pp.fk_id_pedido) LEFT JOIN tb_produtos AS prod ON(pp.fk_id_produto = prod.id_produto);