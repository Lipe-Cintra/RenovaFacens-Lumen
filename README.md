# RenovaFacens

Projeto desenvolvido para a disciplina Usina de Projetos Experimentais 2 (UPX 2) do curso de Análise e Desenvolvimento de Sistemas (ADS) do Centro Universitário Facens.

Orientador: Prof. Evandro Klengenfuss Veronez.

## Sobre o projeto

A FACENS, por meio da LIS Facens, promove iniciativas beneficentes e de sustentabilidade, como doação de sangue, conscientização sobre o descarte adequado de resíduos e arrecadação de doações. O desafio é ampliar a participação da comunidade acadêmica e externa nessas ações.

O RenovaFacens é um aplicativo que incentiva a realização de boas ações por meio de recompensas. Os usuários participam de missões solidárias e ambientais, têm a presença confirmada por um mentor, acumulam pontos e podem trocá-los por prêmios e benefícios. Os prêmios são oferecidos por apoiadores (empresas e comércios parceiros) e cadastrados no aplicativo pelos mentores.

## Perfis de usuário

| Perfil no aplicativo | Equivalente na documentação | O que faz |
|---|---|---|
| **Usuário** | Estudante | Público principal. Participa de missões, acumula pontos, publica boas ações no feed e resgata recompensas (prêmios ou horas complementares). |
| **Mentor** | Embaixador | Líder da missão. Cria e gerencia missões, aprova inscrições fora do prazo, confirma a lista de presença e cadastra as recompensas. |
| **Moderador** | Administrador do projeto | Analisa os pedidos de perfil de mentor. |

Quem se cadastra como usuário pode pedir o perfil de mentor, que depende de aprovação da coordenação.

## O que este repositório contém

Esta etapa do projeto concentrou-se na modelagem e na estruturação lógica do sistema:

- **Protótipo de interface (UI/UX):** focado no usuário, priorizando a intuitividade, a rapidez no aceite das missões e a clareza no extrato de pontos e recompensas. Cobre o fluxo desde a visualização da missão pelo usuário até a confirmação de presença pelo mentor.
- **Banco de dados:** modelagem relacional e script de criação (`schema.sql`).

Protótipo no Figma: (https://www.figma.com/design/3ciCpi6GBY8MXYly9Jj7Ig/Renova-%E2%80%94-Prot%C3%B3tipo?node-id=2-35&m=dev&t=75uhkyxE1lH0j8PY-1)

## Telas do protótipo

O protótipo foi desenhado para uso no celular e organizado em três fluxos: acesso à conta, jornada do usuário e gestão pelo mentor.

### Acesso

<table>
<tr>
<td width="260"><img src="prototipo/01_Login.png" width="240" alt="Tela de login"></td>
<td valign="top">

**Login**

Porta de entrada do aplicativo.

<ul>
<li>Entrada com e-mail e senha, com opção de recuperar a senha.</li>
<li>Link para o cadastro de quem ainda não tem conta.</li>
<li>Botões de conta de demonstração (Usuário, Mentor e Moderador) para testar cada perfil rapidamente.</li>
</ul>

</td>
</tr>
<tr>
<td width="260"><img src="prototipo/02_Cadastro.png" width="240" alt="Tela de cadastro"></td>
<td valign="top">

**Cadastro**

Criação de conta em poucos campos.

<ul>
<li>Nome completo, e-mail, senha (mínimo de 6 caracteres) e confirmação de senha.</li>
<li>Escolha de como participar: como <b>Usuário</b>, para participar de missões, ou como <b>Mentor</b>, que envia um pedido de perfil analisado pela coordenação.</li>
<li>Acesso separado para administradores do projeto.</li>
</ul>

</td>
</tr>
</table>

### Jornada do usuário

<table>
<tr>
<td width="260"><img src="prototipo/03_Feed.png" width="240" alt="Tela do feed"></td>
<td valign="top">

**Feed**

Espaço da comunidade para compartilhar boas ações.

<ul>
<li>Campo de publicação com texto e anexo opcional de foto ou vídeo.</li>
<li>Cada postagem mostra autor, tempo desde a publicação, texto, mídia e número de curtidas.</li>
<li>O autor pode excluir as próprias postagens.</li>
<li>O saldo de pontos fica visível no topo em todas as telas do usuário.</li>
</ul>

</td>
</tr>
<tr>
<td width="260"><img src="prototipo/04_Missoes.png" width="240" alt="Tela de missões"></td>
<td valign="top">

**Missões**

Lista das missões solidárias e ambientais.

<ul>
<li>Filtros: Todas, Em andamento, Agendadas e Minhas inscrições.</li>
<li>Cada cartão mostra o mentor responsável, a situação, o título, o período, a descrição e as informações adicionais (como ponto de encontro e o que levar).</li>
<li>Missões em andamento exibem barra de progresso e o tempo restante.</li>
<li>Pontos oferecidos, avatares e total de inscritos aparecem em destaque.</li>
<li>Em missões agendadas, o usuário se inscreve com <b>Participar</b>. Em missões já iniciadas, ele usa <b>Pedir autorização ao mentor</b>.</li>
</ul>

</td>
</tr>
<tr>
<td width="260"><img src="prototipo/05_Participantes.png" width="240" alt="Tela de participantes"></td>
<td valign="top">

**Participantes**

Painel que abre ao tocar nos inscritos de uma missão.

<ul>
<li>Lista de quem está inscrito, com o total no título.</li>
<li>O próprio usuário é identificado com "(você)".</li>
<li>As pessoas restantes aparecem resumidas em "+N pessoas".</li>
</ul>

</td>
</tr>
<tr>
<td width="260"><img src="prototipo/06_Recompensas.png" width="240" alt="Tela de recompensas"></td>
<td valign="top">

**Recompensas**

Troca dos pontos acumulados por itens cadastrados pelos mentores.

<ul>
<li>Cada item mostra nome, mentor responsável, estoque (ilimitado ou quantidade disponível), descrição e detalhes de validade ou retirada.</li>
<li>O custo em pontos aparece junto ao botão <b>Resgatar</b>.</li>
<li>Quando o saldo não é suficiente, o botão é substituído por <b>Pontos insuficientes</b>.</li>
</ul>

</td>
</tr>
<tr>
<td width="260"><img src="prototipo/07_Perfil.png" width="240" alt="Tela de perfil"></td>
<td valign="top">

**Perfil**

Resumo da conta e da atividade do usuário.

<ul>
<li>Nome, e-mail, perfil e saldo de pontos.</li>
<li>Totais de missões feitas, posts publicados e resgates realizados.</li>
<li>Lista de resgates com código de retirada e situação (Disponível ou Retirado).</li>
<li>Opção <b>Pedir perfil de mentor</b>, que envia o pedido para análise da coordenação.</li>
</ul>

</td>
</tr>
</table>

### Gestão pelo mentor

<table>
<tr>
<td width="260"><img src="prototipo/08_Painel_do_Mentor.png" width="240" alt="Painel do mentor"></td>
<td valign="top">

**Painel do Mentor**

Central de controle das missões criadas pelo mentor.

<ul>
<li>Botão <b>Nova missão</b> e resumo com total de missões, inscritos e pedidos pendentes.</li>
<li>Aviso de pedido de inscrição fora do prazo, com <b>Aprovar</b> e <b>Recusar</b>.</li>
<li>Lista das missões do mentor com situação, inscritos, pontos e período.</li>
<li>Ações por missão: <b>Lista de presença</b>, <b>Editar</b> e <b>Cancelar</b>.</li>
</ul>

</td>
</tr>
<tr>
<td width="260"><img src="prototipo/09_Lista_de_presenca.png" width="240" alt="Lista de presença"></td>
<td valign="top">

**Lista de presença**

Confirmação de quem realmente participou da missão.

<ul>
<li>Resumo com inscritos, presentes e pontos já distribuídos.</li>
<li>Quem já foi confirmado aparece como <b>Presente</b>. Os demais têm o botão <b>Confirmar</b>.</li>
<li>Cada confirmação libera os pontos da missão uma única vez por participante, garantindo que o esforço seja real.</li>
</ul>

</td>
</tr>
</table>

## Banco de dados

O script `schema.sql` cria o banco `renovafacens` com as seguintes tabelas:

- `USUARIO`: usuários, mentores e moderadores (campo `papel`).
- `PEDIDO_MENTOR`: pedidos de perfil de mentor e a resposta do moderador.
- `MISSAO`: missões criadas por um mentor.
- `PARTICIPACAO`: inscrição, pedido de entrada fora do prazo e presença de um usuário em uma missão, com os pontos ganhos.
- `RECOMPENSA`: prêmios e brindes cadastrados por mentores, com custo em pontos e estoque (vazio significa ilimitado).
- `RESGATE`: troca de pontos de um usuário por uma recompensa, com código de retirada.
- `POSTAGEM` e `CURTIDA`: publicações do feed e curtidas.

O saldo de pontos de cada usuário pode ser consultado na view `VW_SALDO_PONTOS`.

Para criar o banco, execute o script no MySQL/MariaDB (por linha de comando ou importando pelo phpMyAdmin):

```bash
mysql -u <usuario> -p < schema.sql
```

## Código do banco de dados

<details>
<summary><b>Ver schema.sql completo</b></summary>

```sql
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
```

</details>

### Padrão de nomes do banco

- Tabelas em MAIÚSCULAS e no singular.
- Colunas em snake_case minúsculo.
- Chave primária no formato `id_<tabela>` (ex.: `id_usuario`, `id_missao`). Chaves estrangeiras usam o mesmo nome da chave que referenciam, exceto quando o papel da relação importa (ex.: `id_mentor`).
- O estado de um registro sempre se chama `situacao`, com valores em MAIÚSCULAS (ex.: `EM_ANDAMENTO`).
- Datas de início e fim usam `data_inicio` e `data_fim`.

## Tecnologias

- Prototipação: Figma
- Banco de dados: MySQL/MariaDB

## Equipe

| Integrante | Funções |
|---|---|
| Caio Kenzo Grigoleto | Gestor do Projeto, Especialista em Deploy |
| Enzo Valentim Garcia | Product Owner, Analista de Requisitos |
| Henrique Nóbrega | Analista de Suporte, Analista de Requisitos |
| Luis Filipe Gonçalves Cintra | Desenvolvedor Back-end, Engenheiro de Teste |
| Naiara Alves Fioravanti Nunes | Scrum Master, Desenvolvedor Front-end, Designer UI/UX, Gestora de Projetos |
| Victor de Moraes Leite | Desenvolvedor Back-end, Engenheiro de Teste |
