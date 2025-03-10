-- Criação do banco e uso do mesmo
USE oficina;

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (Nome, Sobrenome, CPF) VALUES
('João', 'Silva', '12345678901'),
('Maria', 'Oliveira', '23456789012'),
('Carlos', 'Pereira', '34567890123'),
('Ana', 'Costa', '45678901234'),
('Pedro', 'Souza', '56789012345');

-- Inserção de dados na tabela Veículo
INSERT INTO Veículo (idCliente, Modelo, Ano) VALUES
(1, 'Gol', 2010),
(2, 'Uno', 2012),
(3, 'Civic', 2015),
(4, 'Corolla', 2018),
(5, 'Fiesta', 2011);

-- Inserção de dados na tabela Equipe
INSERT INTO Equipe (idVeículo, Código, Área) VALUES
(1, 'EQ01', 'Geral'),
(2, 'EQ02', 'Suspensão'),
(3, 'EQ03', 'Transmissão'),
(4, 'EQ04', 'Eletrônica'),
(5, 'EQ05', 'Freios');

-- Inserção de dados na tabela Mecânico
INSERT INTO Mecânico (idEquipe, Nome, Sobrenome, Especialidade) VALUES
(1, 'Roberto', 'Dias', 'Motor'),
(2, 'Fernando', 'Santos', 'Pintura'),
(3, 'Eduardo', 'Lima', 'Elétrica'),
(4, 'Carlos', 'Almeida', 'Carroceria'),
(5, 'Marcelo', 'Rocha', 'Pneus');

-- Inserção de dados na tabela Ordem
INSERT INTO Ordem (idEquipe, Número, Valor, Ordem_status, Data_emissão, Data_conclusão, Autorizado) VALUES
(1, 1001, 500.00, 'Aguardando', '2025-03-01', NULL, TRUE),
(2, 1002, 750.00, 'Realizando', '2025-03-02', NULL, TRUE),
(3, 1003, 1200.00, 'Concluída', '2025-02-25', '2025-03-01', TRUE),
(4, 1004, 300.00, 'Cancelada', '2025-03-03', NULL, FALSE),
(5, 1005, 950.00, 'Realizando', '2025-03-04', NULL, TRUE);

-- Inserção de dados na tabela Peça
INSERT INTO Peça (Tipo, Valor) VALUES
('Filtro', 50.00),
('Pastilha', 30.00),
('Bateria', 200.00),
('Amortecedor', 150.00),
('Velas', 40.00);

-- Inserção de dados na tabela Peça_em_ordem
INSERT INTO Peça_em_ordem (idPeça, idOrdem, Quantidade) VALUES
(1, 1, 2),
(2, 2, 4),
(3, 3, 1),
(4, 4, 2),
(5, 5, 6);

-- Inserção de dados na tabela Serviço
INSERT INTO Serviço (Tipo, Descrição, Serviço_status, Valor) VALUES
('Reparo', 'Troca de óleo', 'Aguardando', 150.00),
('Manutenção', 'Revisão completa', 'Em execução', 300.00),
('Reparo', 'Alinhamento e balanceamento', 'Concluído', 100.00),
('Instalação', 'Instalação de som automotivo', 'Aguardando', 250.00),
('Reparo', 'Troca de pastilhas de freio', 'Em execução', 200.00);

-- Inserção de dados na tabela Serviço_em_ordem
INSERT INTO Serviço_em_ordem (idServiço, idOrdem) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
