-- consultas oficina
USE oficina;

-- nome e cpf dos clientes
SELECT concat(Nome, ' ', Sobrenome) AS Cliente, CPF FROM cliente;

-- clientes e seus veículos
SELECT Modelo, Ano, concat(Nome, ' ', Sobrenome) AS Cliente FROM Veículo
	INNER JOIN Cliente USING(idCliente);
    
-- mecânicos e suas especialidades
SELECT concat(Nome, ' ', Sobrenome) AS Mecânico, Especialidade FROM Mecânico;

-- dados sobre as ordens de serviço em andamento
SELECT Número, Valor, Data_emissão, Data_conclusão, Autorizado FROM ordem WHERE Ordem_status = 'Realizando';

-- peças em estoques e valores
SELECT Tipo, Valor FROM peça ORDER BY Valor DESC;

-- ordens de serviço e equipes relacionadas
SELECT Código, Área, Número AS Ordem_num, Ordem_Status FROM equipe
	INNER JOIN Ordem USING (idEquipe);
    
-- mecânicos e equipes relacionadas
SELECT concat(Nome, ' ', Sobrenome) AS Mecânico, Código, Área FROM Mecânico
	INNER JOIN Equipe USING (idEquipe);
    
-- serviços em ordens de serviço
SELECT Tipo, Descrição, Serviço_status, Número, Ordem_status FROM Serviço
	INNER JOIN serviço_em_ordem USING(idServiço)
    INNER JOIN Ordem USING(idOrdem);
    
-- peças em ordens de serviço
SELECT Tipo, peça.Valor, Quantidade, Número AS Ordem_num, Ordem.valor FROM peça
	INNER JOIN peça_em_ordem USING(idPeça)
    INNER JOIN Ordem USING(idOrdem);
    
-- quantidade de veículos cada cliente possui cadastrado
SELECT concat(Nome, ' ', Sobrenome) AS Cliente, count(*) AS Qtd_veículos FROM Cliente
	INNER JOIN Veículo USING(idCliente)
    GROUP BY Cliente
    ORDER BY Cliente;
    
-- quantidade total de ordens de serviço no sistema
SELECT count(*) AS Qtd_total_ordens FROM Ordem;

-- valor total das ordens de serviço concluídas
SELECT sum(valor) AS Total_valor_concluídas FROM Ordem WHERE Ordem_status = 'Concluída';

-- valor médio serviços realizados
SELECT AVG(Valor) AS Média_serv_conc FROM serviço WHERE Serviço_status = 'Concluído';

-- quantidade de ordens relizadas por cada equipe
SELECT Código, count(*) AS Qtd_ordens FROM equipe
	INNER JOIN ordem USING(idEquipe)
    GROUP BY Código;

-- clientes que mais gastaram
SELECT concat(Nome, ' ', Sobrenome) Cliente, sum(valor) AS Valor_total FROM cliente 
	INNER JOIN veículo USING(idCliente)
	INNER JOIN equipe USING(idVeículo)
	INNER JOIN ordem USING(idEquipe)
	GROUP BY Cliente
	ORDER BY Valor_total DESC
	LIMIT 3;