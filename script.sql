DROP TABLE IF EXISTS tbl_pedido_desconto    CASCADE;
DROP TABLE IF EXISTS tbl_usuario_desconto   CASCADE;
DROP TABLE IF EXISTS tbl_cupom_desconto     CASCADE;
DROP TABLE IF EXISTS tbl_tipo_desconto      CASCADE;
DROP TABLE IF EXISTS tbl_pagamento          CASCADE;
DROP TABLE IF EXISTS tbl_tipo_pagamento     CASCADE;
DROP TABLE IF EXISTS tbl_status_pagamento   CASCADE;
DROP TABLE IF EXISTS tbl_item_pedido        CASCADE;
DROP TABLE IF EXISTS tbl_pedido             CASCADE;
DROP TABLE IF EXISTS tbl_status_pedido      CASCADE;
DROP TABLE IF EXISTS tbl_avaliacao          CASCADE;
DROP TABLE IF EXISTS tbl_favorito           CASCADE;
DROP TABLE IF EXISTS tbl_boneco             CASCADE;
DROP TABLE IF EXISTS tbl_endereco           CASCADE;
DROP TABLE IF EXISTS tbl_usuario            CASCADE;
DROP TABLE IF EXISTS tbl_categoria          CASCADE;

CREATE TABLE tbl_categoria (
      id          SERIAL          PRIMARY KEY
    , descricao   VARCHAR(30)     NOT NULL
);

CREATE TABLE tbl_usuario (
      id          SERIAL          PRIMARY KEY
    , nome        VARCHAR(150)    NOT NULL
    , email       VARCHAR(255)    NOT NULL UNIQUE
    , telefone    VARCHAR(15)
    , senha       VARCHAR(64)     NOT NULL
);

CREATE TABLE tbl_endereco (
      id          SERIAL          PRIMARY KEY
    , id_usuario  INTEGER         NOT NULL
    , cep         VARCHAR(8)      NOT NULL
    , numero      INTEGER         NOT NULL
    , complemento VARCHAR(10)
    , cidade      VARCHAR(80)     NOT NULL
    , estado      VARCHAR(20)     NOT NULL

    , CONSTRAINT fk_endereco_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES tbl_usuario(id)
        ON DELETE CASCADE
);

CREATE TABLE tbl_boneco (
      id          SERIAL          PRIMARY KEY
    , imagem      VARCHAR(250)
    , nome        VARCHAR(70)     NOT NULL
    , id_categoria INTEGER        NOT NULL
    , descricao   TEXT
    , preco       NUMERIC(18,6)   NOT NULL
    , estoque     INTEGER         NOT NULL DEFAULT 0

    , CONSTRAINT fk_boneco_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES tbl_categoria(id)
);

CREATE TABLE tbl_favorito (
      id          SERIAL          PRIMARY KEY
    , id_usuario  INTEGER         NOT NULL
    , id_boneco   INTEGER         NOT NULL
    , data_adicao TIMESTAMP       DEFAULT CURRENT_TIMESTAMP

    , CONSTRAINT fk_favorito_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES tbl_usuario(id)
        ON DELETE CASCADE

    , CONSTRAINT fk_favorito_boneco
        FOREIGN KEY (id_boneco)
        REFERENCES tbl_boneco(id)

    , CONSTRAINT uk_favorito
        UNIQUE (id_usuario, id_boneco)
);

CREATE TABLE tbl_avaliacao (
      id          SERIAL          PRIMARY KEY
    , id_boneco   INTEGER         NOT NULL
    , id_usuario  INTEGER         NOT NULL
    , comentario  TEXT
    , nota        INTEGER         NOT NULL CHECK (nota BETWEEN 1 AND 5)
    , data        TIMESTAMP       DEFAULT CURRENT_TIMESTAMP

    , CONSTRAINT fk_avaliacao_boneco
        FOREIGN KEY (id_boneco)
        REFERENCES tbl_boneco(id)

    , CONSTRAINT fk_avaliacao_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES tbl_usuario(id)

    , CONSTRAINT uk_avaliacao
        UNIQUE (id_usuario, id_boneco)
);

CREATE TABLE tbl_status_pedido (
      id          SERIAL          PRIMARY KEY
    , descricao   VARCHAR(20)     NOT NULL UNIQUE
);

CREATE TABLE tbl_pedido (
      id          SERIAL          PRIMARY KEY
    , id_usuario  INTEGER         NOT NULL
    , id_status   INTEGER         NOT NULL
    , subtotal    NUMERIC(18,6)   NOT NULL
    , desconto    NUMERIC(18,6)   NOT NULL DEFAULT 0
    , frete       NUMERIC(18,6)   NOT NULL DEFAULT 0
    , total       NUMERIC(18,6)   NOT NULL
    , data_pedido TIMESTAMP       DEFAULT CURRENT_TIMESTAMP

    , CONSTRAINT fk_pedido_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES tbl_usuario(id)

    , CONSTRAINT fk_pedido_status
        FOREIGN KEY (id_status)
        REFERENCES tbl_status_pedido(id)
);

CREATE TABLE tbl_item_pedido (
      id              SERIAL          PRIMARY KEY
    , id_pedido       INTEGER         NOT NULL
    , id_boneco       INTEGER         NOT NULL
    , quantidade      INTEGER         NOT NULL CHECK (quantidade > 0)
    , preco_unitario  NUMERIC(18,6)   NOT NULL

    , CONSTRAINT fk_item_pedido_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES tbl_pedido(id)
        ON DELETE CASCADE

    , CONSTRAINT fk_item_pedido_boneco
        FOREIGN KEY (id_boneco)
        REFERENCES tbl_boneco(id)
);

CREATE TABLE tbl_status_pagamento (
      id          SERIAL          PRIMARY KEY
    , descricao   VARCHAR(20)     NOT NULL UNIQUE
);

CREATE TABLE tbl_tipo_pagamento (
      id          SERIAL          PRIMARY KEY
    , descricao   VARCHAR(20)     NOT NULL UNIQUE
);

CREATE TABLE tbl_pagamento (
      id              SERIAL          PRIMARY KEY
    , id_pedido       INTEGER         NOT NULL
    , id_tipo         INTEGER         NOT NULL
    , id_status       INTEGER         NOT NULL
    , valor           NUMERIC(18,6)   NOT NULL
    , data_pagamento  TIMESTAMP       DEFAULT CURRENT_TIMESTAMP

    , CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES tbl_pedido(id)

    , CONSTRAINT fk_pagamento_tipo
        FOREIGN KEY (id_tipo)
        REFERENCES tbl_tipo_pagamento(id)

    , CONSTRAINT fk_pagamento_status
        FOREIGN KEY (id_status)
        REFERENCES tbl_status_pagamento(id)
);

CREATE TABLE tbl_tipo_desconto (
      id          SERIAL          PRIMARY KEY
    , descricao   VARCHAR(30)     NOT NULL UNIQUE
);

CREATE TABLE tbl_cupom_desconto (
      id                  SERIAL          PRIMARY KEY
    , codigo              VARCHAR(30)     NOT NULL UNIQUE
    , email               VARCHAR(355)
    , id_tipo             INTEGER         NOT NULL
    , valor               NUMERIC(18,6)   NOT NULL
    , validade            DATE            NOT NULL
    , limite_por_usuario  INTEGER         NOT NULL DEFAULT 1
    , ativo               BOOLEAN         NOT NULL DEFAULT TRUE

    , CONSTRAINT fk_cupom_tipo
        FOREIGN KEY (id_tipo)
        REFERENCES tbl_tipo_desconto(id)
);

CREATE TABLE tbl_usuario_desconto (
      id              SERIAL          PRIMARY KEY
    , id_usuario      INTEGER         NOT NULL
    , id_desconto     INTEGER         NOT NULL
    , quantidade_usada INTEGER        NOT NULL DEFAULT 0

    , CONSTRAINT fk_usuario_desconto_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES tbl_usuario(id)
        ON DELETE CASCADE

    , CONSTRAINT fk_usuario_desconto_desconto
        FOREIGN KEY (id_desconto)
        REFERENCES tbl_cupom_desconto(id)

    , CONSTRAINT uk_usuario_desconto
        UNIQUE (id_usuario, id_desconto)
);

CREATE TABLE tbl_pedido_desconto (
      id              SERIAL          PRIMARY KEY
    , id_pedido       INTEGER         NOT NULL
    , id_desconto     INTEGER         NOT NULL

    , CONSTRAINT fk_pedido_desconto_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES tbl_pedido(id)

    , CONSTRAINT fk_pedido_desconto_desconto
        FOREIGN KEY (id_desconto)
        REFERENCES tbl_cupom_desconto(id)

    , CONSTRAINT uk_pedido_desconto
        UNIQUE (id_pedido, id_desconto)
);

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