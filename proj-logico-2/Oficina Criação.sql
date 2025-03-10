-- criação bd oficina
CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

CREATE TABLE Cliente(
	idCliente INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(15) NOT NULL,
    Sobrenome VARCHAR(15) NOT NULL, 
    CPF CHAR(11) NOT NULL,
    CONSTRAINT unique_cpf UNIQUE(CPF)
);

CREATE TABLE Veículo(
	idVeículo INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idCliente INT UNSIGNED,
    Modelo VARCHAR(15) NOT NULL,
    Ano YEAR,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Equipe(
	idEquipe INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idVeículo INT UNSIGNED,
    Código VARCHAR(10) NOT NULL,
    Área ENUM('Geral', 'Suspensão', 'Transmissão', 'Eletrônica', 'Climatização', 'Freios', 'Pneus', 'Pintura') NOT NULL,
    CONSTRAINT fk_equipe_veículo FOREIGN KEY(idVeículo) REFERENCES Veículo(idVeículo)
);

CREATE TABLE Mecânico(
	idMecânico INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idEquipe INT UNSIGNED,
    Nome VARCHAR(15) NOT NULL,
    Sobrenome VARCHAR(15) NOT NULL,
    Especialidade ENUM('Motor', 'Pintura', 'Elétrica', 'Carroceria', 'Pneus') NOT NULL,
    CONSTRAINT fk_mecânico_equipe FOREIGN KEY(idEquipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE Ordem(
	idOrdem INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idEquipe INT UNSIGNED,
    Número INT UNSIGNED NOT NULL,
    Valor FLOAT NOT NULL,
    Ordem_status ENUM('Aguardando', 'Realizando', 'Concluída', 'Cancelada') DEFAULT 'Aguardando',
    Data_emissão DATE NOT NULL,
    Data_conclusão DATE,
    Autorizado BOOL NOT NULL,
    CONSTRAINT fk_ordem_equipe FOREIGN KEY(idEquipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE Peça(
	idPeça INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(15),
    Valor FLOAT NOT NULL
);

CREATE TABLE Peça_em_ordem(
	idPeça INT UNSIGNED,
    idOrdem INT UNSIGNED,
    Quantidade INT UNSIGNED,
    CONSTRAINT pk_peça_ordem PRIMARY KEY(idPeça, idOrdem),
    CONSTRAINT fk_peça_ordem_peça FOREIGN KEY(idPeça) REFERENCES Peça(idPeça),
    CONSTRAINT fk_peça_ordem_ordem FOREIGN KEY(idOrdem) REFERENCES Ordem(idOrdem)
);

CREATE TABLE Serviço(
	idServiço INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(10),
    Descrição VARCHAR(50),
    Serviço_status ENUM('Aguardando', 'Em execução', 'Concluído') DEFAULT 'Aguardando',
    Valor FLOAT
);

CREATE TABLE Serviço_em_ordem(
	idServiço INT UNSIGNED,
    idOrdem INT UNSIGNED,
    CONSTRAINT pk_serviço_ordem PRIMARY KEY(idServiço, idOrdem),
    CONSTRAINT fk_serviço_ordem_serviço FOREIGN KEY(idServiço) REFERENCES Serviço(idServiço),
    CONSTRAINT fk_serviço_ordem_ordem FOREIGN KEY(idOrdem) REFERENCES Ordem(idOrdem)
);