SELECT
    *
FROM
    tb_clientes LEFT JOIN tb_pedidos ON(tb_clientes.id_cliente = tb_pedidos.fk_id_cliente);

SELECT
    *
FROM
    tb_produtos LEFT JOIN tb_imagens ON(tb_produtos.id_produto = tb_imagens.fk_id_produto);

SELECT
    *
FROM
    tb_clientes RIGHT JOIN tb_pedidos ON(tb_clientes.id_cliente = tb_pedidos.fk_id_cliente);

INSERT INTO tb_produtos(produto, valor) VALUES('HD Externo Portátil Seagate Expansion 1TB USB 3.0', 274.90);

SELECT
    *
FROM
    tb_pedidos LEFT JOIN tb_pedidos_produtos ON(tb_pedidos.id_pedido = tb_pedidos_produtos.fk_id_pedido);

SELECT
    *
FROM
    tb_pedidos LEFT JOIN tb_pedidos_produtos ON(tb_pedidos.id_pedido = tb_pedidos_produtos.fk_id_pedido)
    LEFT JOIN tb_produtos ON(tb_pedidos_produtos.fk_id_pedido = tb_produtos.id_produto);

SELECT
    *
FROM
    tb_pedidos RIGHT JOIN tb_pedidos_produtos ON(tb_pedidos.id_pedido = tb_pedidos_produtos.fk_id_pedido)
    LEFT JOIN tb_produtos ON(tb_pedidos_produtos.fk_id_pedido = tb_produtos.id_produto);

SELECT
    *
FROM
    tb_pedidos RIGHT JOIN tb_pedidos_produtos ON(tb_pedidos.id_pedido = tb_pedidos_produtos.fk_id_pedido)
    RIGHT JOIN tb_produtos ON(tb_pedidos_produtos.fk_id_pedido = tb_produtos.id_produto);

SELECT
    *
FROM
    tb_pedidos INNER JOIN tb_pedidos_produtos ON(tb_pedidos.id_pedido = tb_pedidos_produtos.fk_id_pedido);

SELECT
    *
FROM
    tb_pedidos INNER JOIN tb_pedidos_produtos ON(tb_pedidos.id_pedido = tb_pedidos_produtos.fk_id_pedido) INNER JOIN tb_produtos ON(tb_pedidos_produtos.fk_id_pedido = tb_produtos.id_produto);