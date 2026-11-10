-- =====================================================================
-- RenovaFacens - schema.sql
-- Compatível com MySQL 8 / MariaDB 10.4+
-- =====================================================================

CREATE DATABASE IF NOT EXISTS renovafacens
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE renovafacens;

-- ---------------------------------------------------------------------
-- USUARIO: usuários, mentores e moderadores
-- ---------------------------------------------------------------------
CREATE TABLE USUARIO (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nome       VARCHAR(150) NOT NULL,
  email      VARCHAR(150) NOT NULL,
  senha_hash VARCHAR(255) NOT NULL,  -- nunca guardar senha em texto puro
  papel      ENUM('USUARIO','MENTOR','MODERADOR') NOT NULL DEFAULT 'USUARIO',
  criado_em  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_usuario_email UNIQUE (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- PEDIDO_MENTOR: pedido de perfil de mentor, analisado por um moderador
-- ---------------------------------------------------------------------
CREATE TABLE PEDIDO_MENTOR (
  id_pedido_mentor INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario       INT NOT NULL,
  situacao         ENUM('PENDENTE','APROVADO','RECUSADO')
                   NOT NULL DEFAULT 'PENDENTE',
  data_pedido      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  data_resposta    DATETIME NULL,
  id_moderador     INT NULL,  -- preenchido quando o pedido é respondido
  CONSTRAINT fk_pedido_mentor_usuario
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
    ON DELETE CASCADE,
  CONSTRAINT fk_pedido_mentor_moderador
    FOREIGN KEY (id_moderador) REFERENCES USUARIO(id_usuario)
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- MISSAO: criada por um mentor
-- ---------------------------------------------------------------------
CREATE TABLE MISSAO (
  id_missao              INT AUTO_INCREMENT PRIMARY KEY,
  titulo                 VARCHAR(150) NOT NULL,
  descricao              VARCHAR(500) NOT NULL,
  data_inicio            DATETIME NOT NULL,
  data_fim               DATETIME NOT NULL,
  pontos                 INT NOT NULL DEFAULT 0,
  informacoes_adicionais VARCHAR(255) NULL,
  situacao               ENUM('AGENDADA','EM_ANDAMENTO','ENCERRADA','CANCELADA')
                         NOT NULL DEFAULT 'AGENDADA',
  id_mentor              INT NOT NULL,
  criado_em              DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_missao_pontos  CHECK (pontos >= 0),
  CONSTRAINT chk_missao_periodo CHECK (data_fim >= data_inicio),
  CONSTRAINT fk_missao_mentor
    FOREIGN KEY (id_mentor) REFERENCES USUARIO(id_usuario)
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- PARTICIPACAO: inscrição, pedido fora do prazo, presença e pontos
-- PENDENTE  = pedido de inscrição fora do prazo, aguardando o mentor
-- INSCRITO  = inscrição aceita
-- PRESENTE  = presença confirmada pelo mentor (libera os pontos)
-- RECUSADO  = pedido fora do prazo recusado pelo mentor
-- ---------------------------------------------------------------------
CREATE TABLE PARTICIPACAO (
  id_participacao   INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario        INT NOT NULL,
  id_missao         INT NOT NULL,
  situacao          ENUM('PENDENTE','INSCRITO','PRESENTE','RECUSADO')
                    NOT NULL DEFAULT 'INSCRITO',
  pontos_ganhos     INT NOT NULL DEFAULT 0,
  data_participacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  data_validacao    DATETIME NULL,   -- preenchida quando o mentor confirma
  CONSTRAINT uq_participacao_usuario_missao UNIQUE (id_usuario, id_missao),
  CONSTRAINT chk_participacao_pontos CHECK (pontos_ganhos >= 0),
  CONSTRAINT fk_participacao_usuario
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
    ON DELETE RESTRICT,
  CONSTRAINT fk_participacao_missao
    FOREIGN KEY (id_missao) REFERENCES MISSAO(id_missao)
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- RECOMPENSA: prêmios e brindes cadastrados por mentores
-- estoque NULL = ilimitado
-- ---------------------------------------------------------------------
CREATE TABLE RECOMPENSA (
  id_recompensa INT AUTO_INCREMENT PRIMARY KEY,
  nome          VARCHAR(150) NOT NULL,
  descricao     VARCHAR(500) NULL,
  detalhes      VARCHAR(255) NULL,
  custo_pontos  INT NOT NULL,
  estoque       INT NULL,
  situacao      ENUM('ATIVA','INATIVA') NOT NULL DEFAULT 'ATIVA',
  id_mentor     INT NOT NULL,
  criado_em     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_recompensa_custo   CHECK (custo_pontos > 0),
  CONSTRAINT chk_recompensa_estoque CHECK (estoque IS NULL OR estoque >= 0),
  CONSTRAINT fk_recompensa_mentor
    FOREIGN KEY (id_mentor) REFERENCES USUARIO(id_usuario)
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- RESGATE: troca de pontos por recompensa
-- pontos_gastos guarda o custo no momento do resgate (histórico)
-- ---------------------------------------------------------------------
CREATE TABLE RESGATE (
  id_resgate    INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario    INT NOT NULL,
  id_recompensa INT NOT NULL,
  codigo        VARCHAR(20) NOT NULL,  -- ex.: RF-30977
  situacao      ENUM('DISPONIVEL','RETIRADO') NOT NULL DEFAULT 'DISPONIVEL',
  pontos_gastos INT NOT NULL,
  data_resgate  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_resgate_codigo UNIQUE (codigo),
  CONSTRAINT chk_resgate_pontos CHECK (pontos_gastos > 0),
  CONSTRAINT fk_resgate_usuario
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
    ON DELETE RESTRICT,
  CONSTRAINT fk_resgate_recompensa
    FOREIGN KEY (id_recompensa) REFERENCES RECOMPENSA(id_recompensa)
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- POSTAGEM: publicações do feed (texto e, opcionalmente, foto ou vídeo)
-- ---------------------------------------------------------------------
CREATE TABLE POSTAGEM (
  id_postagem INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario  INT NOT NULL,
  texto       VARCHAR(500) NOT NULL,
  midia_url   VARCHAR(255) NULL,
  midia_tipo  ENUM('FOTO','VIDEO') NULL,
  criado_em   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_postagem_midia
    CHECK ((midia_url IS NULL AND midia_tipo IS NULL)
        OR (midia_url IS NOT NULL AND midia_tipo IS NOT NULL)),
  CONSTRAINT fk_postagem_usuario
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- CURTIDA: um usuário curte uma postagem no máximo uma vez
-- ---------------------------------------------------------------------
CREATE TABLE CURTIDA (
  id_postagem INT NOT NULL,
  id_usuario  INT NOT NULL,
  criado_em   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_postagem, id_usuario),
  CONSTRAINT fk_curtida_postagem
    FOREIGN KEY (id_postagem) REFERENCES POSTAGEM(id_postagem)
    ON DELETE CASCADE,
  CONSTRAINT fk_curtida_usuario
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- Saldo de pontos = pontos de presenças confirmadas - pontos gastos em resgates
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW VW_SALDO_PONTOS AS
SELECT
  u.id_usuario,
  COALESCE((SELECT SUM(p.pontos_ganhos)
              FROM PARTICIPACAO p
             WHERE p.id_usuario = u.id_usuario
               AND p.situacao = 'PRESENTE'), 0)
  - COALESCE((SELECT SUM(r.pontos_gastos)
                FROM RESGATE r
               WHERE r.id_usuario = u.id_usuario), 0) AS saldo_pontos
FROM USUARIO u;