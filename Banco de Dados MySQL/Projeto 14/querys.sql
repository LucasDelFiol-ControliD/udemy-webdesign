CREATE DATABASE db_loja_virtual;

CREATE TABLE tb_produtos(
    id_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    produto VARCHAR(200) NOT NULL,
    valor FLOAT(8, 2) NOT NULL
);

CREATE TABLE tb_descricoes_tecnicas(
    id_descricao_tecnica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_id_produto INT NOT NULL,
    descricao_tecnica TEXT NOT NULL,
    FOREIGN KEY(fk_id_produto) REFERENCES tb_produtos(id_produto)
);

-- Rodar o arquivo querys_necessarias.sql

CREATE TABLE tb_imagens(
    id_imagem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_id_produto INT NOT NULL,
    FOREIGN KEY(fk_id_produto) REFERENCES tb_produtos(id_produto),
    url_imagem VARCHAR(200) NOT NULL
);

INSERT INTO tb_imagens(fk_id_produto, url_imagem) VALUES(1, 'notebook_1.jpg'), (1, 'notebook_2.jpg'), (1, 'notebook_3.jpg');
INSERT INTO tb_imagens(fk_id_produto, url_imagem) VALUES(2, 'smarttv_1.jpg'), (2, 'smarttv_2.jpg');
INSERT INTO tb_imagens(fk_id_produto, url_imagem) VALUES(3, 'smartphone_1.jpg');

CREATE TABLE tb_clientes(
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT(3) NOT NULL
);

CREATE TABLE tb_pedidos(
    id_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_id_cliente INT NOT NULL,
    FOREIGN KEY(fk_id_cliente) REFERENCES tb_clientes(id_cliente),
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tb_pedidos_produtos(
    fk_id_pedido INT NOT NULL,
    fk_id_produto INT NOT NULL,
    FOREIGN KEY(fk_id_pedido) REFERENCES tb_pedidos(id_pedido),
    FOREIGN KEY(fk_id_produto) REFERENCES tb_produtos(id_produto)
);

INSERT INTO tb_clientes(nome, idade) VALUES('Jorge', 29);
INSERT INTO tb_pedidos(fk_id_cliente) VALUES(1);
INSERT INTO tb_pedidos_produtos(fk_id_pedido, fk_id_produto) VALUES(1, 2);
INSERT INTO tb_pedidos_produtos(fk_id_pedido, fk_id_produto) VALUES(1, 3);
INSERT INTO tb_pedidos(fk_id_cliente) VALUES(1);
INSERT INTO tb_pedidos_produtos(fk_id_pedido, fk_id_produto) VALUES(2, 3);
INSERT INTO tb_clientes(nome, idade) VALUES('Jamilton', 30);
INSERT INTO tb_pedidos(fk_id_cliente) VALUES(2);
INSERT INTO tb_pedidos_produtos(fk_id_pedido, fk_id_produto) VALUES(3, 1);