
PRAGMA foreign_keys = ON;

CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT,
    instituicao TEXT,
    username TEXT UNIQUE NOT NULL,
    senha TEXT NOT NULL,
    perfil TEXT CHECK(perfil IN ('Aluno', 'Professor', 'Organizador')) NOT NULL
);

CREATE TABLE eventos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL,                  
    titulo TEXT NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    horario TEXT NOT NULL,
    local TEXT NOT NULL,
    qtd_participantes INTEGER CHECK(qtd_participantes >= 0),
    organizador_id INTEGER NOT NULL,
    FOREIGN KEY (organizador_id) REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE inscricoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    evento_id INTEGER NOT NULL,
    data_inscricao DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(usuario_id, evento_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (evento_id) REFERENCES eventos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE certificados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    inscricao_id INTEGER NOT NULL,
    data_emissao DATETIME DEFAULT CURRENT_TIMESTAMP,
    codigo_validacao TEXT UNIQUE NOT NULL,
    FOREIGN KEY (inscricao_id) REFERENCES inscricoes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE INDEX idx_eventos_tipo ON eventos(tipo);
CREATE INDEX idx_eventos_organizador ON eventos(organizador_id);
CREATE INDEX idx_inscricoes_usuario ON inscricoes(usuario_id);
CREATE INDEX idx_inscricoes_evento ON inscricoes(evento_id);
