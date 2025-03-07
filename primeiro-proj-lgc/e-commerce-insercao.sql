-- inserção de dados e-commerce
USE ecommerce;

INSERT INTO e_client (ClientName, ClientType, Address) VALUES
	('Alpha Corp', 'PJ', 'Rua das Flores, 123, São Paulo'),
	('Beta Solutions', 'PJ', 'Avenida Brasil, 456, Rio de Janeiro'),
	('Gamma Comércio', 'PJ', 'Rua do Comércio, 78, Recife'),
	('João Silva', 'PF', 'Rua 1, 321, Belo Horizonte'),
	('Maria Oliveira', 'PF', 'Rua 2, 654, Curitiba'),
	('Carlos Pereira', 'PF', 'Av. Central, 987, Salvador'),
	('Delta LTDA', 'PJ', 'Av. Industrial, 246, Fortaleza'),
	('Helena Costa', 'PF', 'Rua das Palmeiras, 135, Porto Alegre'),
	('Epsilon Tech', 'PJ', 'Av. Tech, 864, Brasília'),
	('Fernanda Souza', 'PF', 'Rua Nova, 753, Florianópolis');

INSERT INTO clientPJ (idClient, CNPJ, BusinessName) VALUES
	(1, '12345678000199', 'Alpha Corp'),
	(2, '98765432000188', 'Beta Solutions Ltda'),
	(3, '11223344556677', 'Gamma Comércio Ltda'),
	(7, '99887766554433', 'Delta LTDA'),
	(9, '55667788990011', 'Epsilon Tech');
    
INSERT INTO clientPF (idClient, CPF, RG) VALUES
	(4, '12345678901', '123456789'),
	(5, '98765432100', '987654321'),
	(6, '45612378902', '456123789'),
	(8, '78945612303', '789456123'),
	(10, '32165498704', '321654987');

INSERT INTO product (Pdesc, Category, VALOR, Rating, Size) VALUES
	('Smartphone X', 'Eletrônico', 3500.00, 4.0, 'Médio'),
	('Notebook Ultra', 'Eletrônico', 5200.00, 5.0, 'Grande'),
	('Camisa Polo', 'Vestimenta', 120.00, 4.0, 'M'),
	('Tênis Esportivo', 'Vestimenta', 350.00, 5.0, '42'),
	('Boneca Fashion', 'Brinquedos', 85.00, 4.0, 'Pequeno'),
	('Carrinho de Controle', 'Brinquedos', 250.00, 4.0, 'Médio'),
	('Chocolate Gourmet', 'Alimentos', 30.00, 5.0, '200g'),
	('Pacote de Café Premium', 'Alimentos', 45.00, 4.0, '500g'),
	('Fone de Ouvido Bluetooth', 'Eletrônico', 280.00, 4.0, 'Pequeno'),
	('Jaqueta de Couro', 'Vestimenta', 750.00, 5.0, 'G');

INSERT INTO e_order (idOrderClient, OrderStatus, OrderDescription, SendValue) VALUES
	(1, 'Processando', 'Pedido de eletrônicos: Smartphone X, Notebook Ultra', 10),
	(4, 'Efetuado', 'Pedido de vestimenta: Camisa Polo, Jaqueta de Couro', 15),
	(6, 'Cancelado', 'Pedido de brinquedos: Boneca Fashion', 10),
	(3, 'Processando', 'Pedido de alimentos: Chocolate Gourmet, Pacote de Café Premium', 10),
	(9, 'Efetuado', 'Pedido de eletrônicos: Fone de Ouvido Bluetooth', 12),
	(5, 'Processando', 'Pedido de vestimenta: Tênis Esportivo', 10),
	(8, 'Processando', 'Pedido de alimentos: Pacote de Café Premium', 10),
	(10, 'Efetuado', 'Pedido de eletrônicos: Smartphone X', 10),
	(2, 'Processando', 'Pedido de vestimenta: Camisa Polo', 10),
	(7, 'Efetuado', 'Pedido diversificado', 20);

INSERT INTO payment (idOrder, PaymentType, PaymentStatus) VALUES
	(1, 'Cartão', 'Em espera'),
	(2, 'Boleto', 'Efetuado'),
	(3, 'Cartão', 'Cancelado'),
	(4, 'Boleto', 'Em espera'),
	(5, 'Cartão', 'Em atraso'),
	(6, 'Boleto', 'Em espera'),
	(7, 'Cartão', 'Em espera'),
	(8, 'Boleto', 'Efetuado'),
	(9, 'Cartão', 'Em espera'),
	(10, 'Boleto', 'Em atraso');

INSERT INTO delivery (idOrder, deliveryStatus, trackingNumber) VALUES
	(1, 'Em rota', '100001'),
	(2, 'Entregue', '100002'),
	(3, 'Refugo', '100003'),
	(4, 'Em rota', '100004'),
	(5, 'Refugo', '100005'),
	(6, 'Em rota', '100006'),
	(7, 'Em rota', '100007'),
	(8, 'Entregue', '100008'),
	(9, 'Refugo', '100009'),
	(10, 'Entregue', '100010');
    
INSERT INTO e_Storage (address) VALUES
	('Armazém Central, Av. Brasil, 100'),
	('Armazém Norte, Rua das Indústrias, 200'),
	('Depósito Sul, Av. das Nações, 300'),
	('Centro Distribuição Leste, Rua do Comércio, 400'),
	('Logística Oeste, Av. dos Transportes, 500');

INSERT INTO productStorage (idStorage, idProduct, Quantity) VALUES
	(1, 1, 50),
	(1, 2, 30),
	(1, 3, 100),
	(2, 4, 75),
	(2, 5, 20),
	(3, 6, 60),
	(3, 7, 120),
	(4, 8, 45),
	(4, 9, 90),
	(5, 10, 10);
    
INSERT INTO supplier (BusinessName, CNPJ, contact) VALUES
	('Tech Solutions LTDA', '12345678000199', '11987654321'),
	('Moda e Estilo SA', '23456789000188', '21987654322'),
	('Alimentos Frescos ME', '34567890000177', '31987654323'),
	('Brinquedos Felizes EIRELI', '45678901000166', '41987654324'),
	('Eletrônicos Power LTDA', '56789012000155', '51987654325'),
	('Auto Peças Rápidas SA', '67890123000144', '61987654326'),
	('Moveis & Cia LTDA', '78901234000133', '71987654327'),
	('Café Gourmet Distribuidora', '89012345000122', '81987654328'),
	('Vestimenta Premium SA', '90123456000111', '91987654329'),
	('Tech Imports ME', '01234567000100', '11912345678');
    
    
INSERT INTO supply VALUES
	 (1, 1, 100, 2000),
	 (1, 2, 50, 3000),
	 (2, 3, 200, 40),
	 (2, 4, 75, 180),
	 (4, 5, 120, 30),
	 (4, 6, 60, 25),
	 (8, 7, 80, 15),
	 (8, 8, 90, 20),
	 (9, 10, 70, 450),
	 (10, 9, 50, 100);
	
-- Inserção de vendedores
INSERT INTO seller (BusinessName, CNPJ, CommercialName, Address) VALUES
    ('Tech Eletrônicos', '11112222333344', 'Eletrônicos Tech', 'Av. das Tecnologias, 100, São Paulo'),
    ('Moda Ativa', '22223333444455', 'Moda Ativa Store', 'Rua da Moda, 200, Rio de Janeiro'),
    ('Brinquedos Kids', '33334444555566', 'Brinquedos Kids Ltda', 'Av. dos Brinquedos, 300, Belo Horizonte'),
    ('Alimentos Saudáveis', '44445555666677', 'Alimentos Naturais', 'Rua das Frutas, 400, Curitiba'),
    ('Vestuário Premium', '55556666777788', 'Premium Fashion', 'Av. das Roupas, 500, Porto Alegre');

-- Inserção de produtos vendidos por vendedores
INSERT INTO productSeller (idProduct, idSeller, Quantity) VALUES
    (1, 1, 20),
    (2, 1, 15),
    (9, 1, 30),
    (3, 2, 50),
    (4, 2, 25),
    (10, 2, 10),
    (5, 3, 40),
    (6, 3, 30),
    (7, 4, 100),
    (8, 4, 80),
    (3, 5, 60),
    (10, 5, 20);

-- Inserção de produtos associados aos pedidos
INSERT INTO productOrder (idProduct, idOrder, Quantity, productStatus) VALUES
    (1, 1, 1, 'Indisponível'),
    (2, 1, 1, 'Disponível'),
    (3, 2, 1, 'Disponível'),
    (10, 2, 1, 'Indisponível'),
    (5, 3, 1, 'Disponível'),
    (7, 4, 2, 'Disponível'),
    (8, 4, 1, 'Disponível'),
    (9, 5, 1, 'Disponível'),
    (4, 6, 1, 'Disponível'),
    (8, 7, 1, 'Disponível'),
    (1, 8, 1, 'Indisponível'),
    (3, 9, 1, 'Disponível'),
    (1, 10, 1, 'Indisponível'),
    (5, 10, 1, 'Disponível'),
    (8, 10, 1, 'Disponível');
