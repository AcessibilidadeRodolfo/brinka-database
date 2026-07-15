INSERT INTO tbl_categoria (descricao)
VALUES
      ('CLÁSSICOS')
    , ('ESPECIAIS')
    , ('NOVOS')
    , ('PROMOÇÕES');


INSERT INTO tbl_status_pedido (descricao)
VALUES
      ('PENDENTE')
    , ('PAGO')
    , ('ENVIADO')
    , ('ENTREGUE')
    , ('CANCELADO');

INSERT INTO tbl_status_pagamento (descricao)
VALUES
      ('PENDENTE')
    , ('APROVADO')
    , ('RECUSADO')
    , ('ESTORNADO');

INSERT INTO tbl_tipo_pagamento (descricao)
VALUES
      ('PIX')
    , ('CARTÃO_CREDITO')
    , ('CARTÃO_DEBITO')
    , ('BOLETO');

INSERT INTO tbl_tipo_desconto (descricao)
VALUES
      ('PERCENTUAL')
    , ('VALOR_FIXO');

INSERT INTO tbl_categoria (descricao)
VALUES
      ('CLÁSSICO')
    , ('ESPECIAL')
    , ('NOVO')
    , ('PROMOÇÃO');

INSERT INTO tbl_usuario (nome, email, telefone, senha, eh_admin)
VALUES
      ('Mariana Marrão Ferreira Felis',  'marimarrao0115@gmail.com',    '11987654321', '$2a$12$ifhtA./vE77UqlDbMwNT/e0uQvMzH4qRPo3KnGMI3.zKsrdvXYGye', TRUE)
    , ('Bruno Henrique Costa',   'bruno.costa@email.com',     '21976543210', '$2a$12$ifhtA./vE77UqlDbMwNT/e0uQvMzH4qRPo3KnGMI3.zKsrdvXYGye', FALSE)
    , ('Camila Rodrigues Lima',  'camila.lima@email.com',     '31965432109', '$2a$12$ifhtA./vE77UqlDbMwNT/e0uQvMzH4qRPo3KnGMI3.zKsrdvXYGye', FALSE)
    , ('Diego Alves Pereira',    'diego.pereira@email.com',   '41954321098', '$2a$12$ifhtA./vE77UqlDbMwNT/e0uQvMzH4qRPo3KnGMI3.zKsrdvXYGye', FALSE)
    , ('Fernanda Souza Martins', 'fernanda.martins@email.com','51943210987', '$2a$12$ifhtA./vE77UqlDbMwNT/e0uQvMzH4qRPo3KnGMI3.zKsrdvXYGye', FALSE)
    , ('Gustavo Oliveira Reis',  'gustavo.reis@email.com',    '61932109876', '$2a$12$ifhtA./vE77UqlDbMwNT/e0uQvMzH4qRPo3KnGMI3.zKsrdvXYGye', FALSE)
    , ('Helena Barbosa Nunes',   'helena.nunes@email.com',    '71921098765', '$2a$12$ifhtA./vE77UqlDbMwNT/e0uQvMzH4qRPo3KnGMI3.zKsrdvXYGye', FALSE);

INSERT INTO tbl_endereco (id_usuario, cep, numero, complemento, cidade, estado)
VALUES
      (1, '01310100', 1000, 'Apto 42',   'São Paulo',      'SP')
    , (2, '20040002', 250,  NULL,        'Rio de Janeiro', 'RJ')
    , (3, '30130010', 88,   'Casa 2',    'Belo Horizonte', 'MG')
    , (4, '80010000', 15,   NULL,        'Curitiba',       'PR')
    , (5, '90010150', 320,  'Bloco B',   'Porto Alegre',   'RS')
    , (6, '70040010', 500,  NULL,        'Brasília',       'DF')
    , (7, '40010000', 77,   'Apto 301',  'Salvador',       'BA');

INSERT INTO tbl_boneco (imagem, nome, id_categoria, descricao, preco, estoque)
VALUES
      ('https://res.cloudinary.com/xaeo7hfy/image/upload/v1784153958/erick_mvahkm.png',   'Erick Santos',    1, 'Músico apaixonado',     89.90, 35)
    , ('https://res.cloudinary.com/xaeo7hfy/image/upload/v1784154098/mari_ekk5ds.png',    'Mari Marrão',     2, 'Cristã sonhadora',      89.90, 20)
    , ('https://res.cloudinary.com/xaeo7hfy/image/upload/f_auto,q_auto/image-removebg-preview_4_1_pwwcfx', 'Rahquel Emidio',  2, 'Artista inovadora',     89.90, 18)
    , ('https://res.cloudinary.com/xaeo7hfy/image/upload/v1784154009/jota_yn2n2j.png',     'João Souza',      1, 'Amigo fiel',            89.90, 42)
    , ('https://res.cloudinary.com/xaeo7hfy/image/upload/v1784154009/vini_hwao4o.png',  'Vinícius Boas',   3, NULL,                    89.90, 25)
    , ('https://res.cloudinary.com/xaeo7hfy/image/upload/v1784154009/isepe_h3uhjc.png',      'Isepe Nic',       3, NULL,                    89.90, 15)
    , ('https://res.cloudinary.com/xaeo7hfy/image/upload/v1784154009/samuca_lwuqcv.png',       'Samucael',        4, NULL,                    89.90, 60);

INSERT INTO tbl_favorito (id_usuario, id_boneco, data_adicao)
VALUES
      (1, 1, '2026-05-02 10:15:00')
    , (1, 4, '2026-05-03 09:40:00')
    , (2, 2, '2026-05-05 18:22:00')
    , (3, 3, '2026-05-06 14:05:00')
    , (4, 5, '2026-05-10 11:30:00')
    , (5, 7, '2026-05-11 20:12:00')
    , (6, 1, '2026-05-12 08:50:00')
    , (7, 6, '2026-05-14 16:45:00');

INSERT INTO tbl_avaliacao (id_boneco, id_usuario, comentario, nota, data)
VALUES
      (1, 2, 'Acabamento excelente, chegou muito bem embalado.',        5, '2026-05-20 12:00:00')
    , (1, 3, 'Muito bonito, mas o frete demorou um pouco.',              4, '2026-05-21 15:30:00')
    , (2, 4, 'Superou minhas expectativas, virou meu favorito.',         5, '2026-05-22 09:10:00')
    , (3, 5, 'Design bem diferente dos outros, adorei o conceito.',      5, '2026-05-23 19:45:00')
    , (4, 1, 'Ótimo custo-benefício.',                                    4, '2026-05-24 10:20:00')
    , (5, 6, 'Gostei bastante, recomendo.',                               4, '2026-05-25 17:05:00')
    , (7, 7, 'Comprei na promoção e valeu muito a pena.',                 5, '2026-05-26 21:00:00');

INSERT INTO tbl_cupom_desconto (codigo, email, id_tipo, valor, validade, limite_por_usuario, ativo)
VALUES
      ('BEMVINDO10', NULL,                        1, 10.00, '2026-12-31', 1, TRUE)
    , ('FRETEGRATIS', NULL,                        2, 20.00, '2026-09-30', 2, TRUE)
    , ('ANIVERSARIO15', NULL,                      1, 15.00, '2026-08-15', 1, TRUE)
    , ('VIP-HELENA', 'helena.nunes@email.com',      1, 25.00, '2026-10-01', 1, TRUE)
    , ('BLACKFRIDAY', NULL,                        1, 30.00, '2025-11-30', 3, FALSE);


INSERT INTO tbl_usuario_desconto (id_usuario, id_desconto, quantidade_usada)
VALUES
      (1, 1, 1)
    , (2, 2, 1)
    , (3, 1, 0)
    , (7, 4, 1);

INSERT INTO tbl_pedido (id_usuario, id_status, subtotal, desconto, frete, total, data_pedido)
VALUES
      (1, 4, 179.80,  8.99,  15.00, 185.81, '2026-05-20 12:30:00')  -- ENTREGUE
    , (2, 4, 89.90,   0.00,  12.00, 101.90, '2026-05-21 09:15:00')  -- ENTREGUE
    , (3, 3,  89.90,  0.00,  15.00, 104.90, '2026-06-01 14:00:00')  -- ENVIADO
    , (4, 2, 179.80, 20.00,  15.00, 174.80, '2026-06-10 16:20:00')  -- PAGO
    , (7, 1,  89.90, 22.48,  12.00,  79.42, '2026-07-01 20:10:00')  -- PENDENTE
    , (5, 5,  89.90,  0.00,  15.00, 104.90, '2026-06-15 11:05:00'); -- CANCELADO

INSERT INTO tbl_item_pedido (id_pedido, id_boneco, quantidade, preco_unitario)
VALUES
      (1, 1, 1, 89.90)
    , (1, 4, 1, 89.90)
    , (2, 2, 1, 89.90)
    , (3, 3, 1, 89.90)
    , (4, 5, 1, 89.90)
    , (4, 6, 1, 89.90)
    , (5, 7, 1, 89.90)
    , (6, 1, 1, 89.90);

INSERT INTO tbl_pagamento (id_pedido, id_tipo, id_status, valor, data_pagamento)
VALUES
      (1, 1, 2, 185.81, '2026-05-20 12:32:00')  -- PIX / APROVADO
    , (2, 2, 2, 101.90, '2026-05-21 09:20:00')  -- CARTAO_CREDITO / APROVADO
    , (3, 4, 2, 104.90, '2026-06-01 14:10:00')  -- BOLETO / APROVADO
    , (4, 2, 2, 174.80, '2026-06-10 16:25:00')  -- CARTAO_CREDITO / APROVADO
    , (5, 1, 1,  79.42, '2026-07-01 20:11:00')  -- PIX / PENDENTE
    , (6, 3, 4, 104.90, '2026-06-16 09:00:00'); -- CARTAO_DEBITO / ESTORNADO

INSERT INTO tbl_pedido_desconto (id_pedido, id_desconto)
VALUES
      (1, 1)
    , (4, 2)
    , (5, 4);