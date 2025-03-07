-- criação do banco de dados para o cenário de E-commerce
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- criar tabela cliente
CREATE TABLE e_client(
	idClient INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ClientName VARCHAR(45) NOT NULL,
    ClientType ENUM('PJ', 'PF') NOT NULL,
    Address VARCHAR(45)
);
ALTER TABLE e_client AUTO_INCREMENT = 1;

-- criar tabela cliente PJ
CREATE TABLE clientPJ(
	idClientPJ INT UNSIGNED AUTO_INCREMENT,
    idClient INT UNSIGNED NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    BusinessName VARCHAR(100),
    CONSTRAINT unique_businessname_clientpj UNIQUE (BusinessName),
    CONSTRAINT unique_cnpj_clientpj UNIQUE (CNPJ),
    CONSTRAINT pk_clientpj PRIMARY KEY (idClientPJ, idClient),
    CONSTRAINT fk_clientpj FOREIGN KEY (idClient) REFERENCES e_client(idClient)
);
ALTER TABLE clientPJ AUTO_INCREMENT = 1;

-- criar tabela cliente PF
CREATE TABLE clientPF(
	idClientPF INT UNSIGNED AUTO_INCREMENT,
    idClient INT UNSIGNED NOT NULL,
    CPF CHAR(11) NOT NULL,
    RG CHAR(9),
    CONSTRAINT unique_cpf_clientpf UNIQUE (CPF),
    CONSTRAINT unique_rg_clientpf UNIQUE (RG),
    CONSTRAINT pk_clientpf PRIMARY KEY (idClientPF, idClient),
    CONSTRAINT fk_clientpf FOREIGN KEY (idClient) REFERENCES e_client(idClient)
);
ALTER TABLE clientPF AUTO_INCREMENT = 1;

-- criar tabela produto
CREATE TABLE product(
	idProduct INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Pdesc VARCHAR(45),
    Category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos') NOT NULL,
    VALOR FLOAT NOT NULL,
    Rating FLOAT,
    Size VARCHAR(10)
);
ALTER TABLE product RENAME COLUMN VALOR TO Price;
ALTER TABLE product AUTO_INCREMENT = 1;

-- criar tabela pedido
CREATE TABLE e_order(
	idOrder INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT UNSIGNED,
    OrderStatus ENUM('Processando', 'Efetuado', 'Cancelado') DEFAULT 'Processando',
	OrderDescription VARCHAR(255),
    SendValue FLOAT DEFAULT 10,
    CONSTRAINT fk_order_client FOREIGN KEY (idOrderClient) REFERENCES e_client(idClient) 
);
ALTER TABLE e_order AUTO_INCREMENT = 1;

-- criar tabela pagamento
CREATE TABLE payment(
	idPayment INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    idOrder INT UNSIGNED,
    PaymentType ENUM('Boleto', 'Cartão'),
    PaymentStatus ENUM('Em espera', 'Efetuado', 'Em atraso'),
    CONSTRAINT fk_payment_order FOREIGN KEY (idOrder) REFERENCES e_order(idOrder)
);
ALTER TABLE payment AUTO_INCREMENT = 1;
ALTER TABLE payment MODIFY COLUMN PaymentStatus ENUM('Em espera', 'Efetuado', 'Em atraso', 'Cancelado');

CREATE TABLE delivery(
	idDelivery INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    idOrder INT UNSIGNED,
    deliveryStatus ENUM('Em rota', 'Entregue', 'Refugo') DEFAULT 'Em rota',
    trackingNumber VARCHAR(45) NOT NULL,
    CONSTRAINT fk_idOrder_delivery FOREIGN KEY (idOrder) REFERENCES e_order(idOrder),
	CONSTRAINT unique_trackingNumber UNIQUE (trackingNumber)
);
ALTER TABLE delivery AUTO_INCREMENT = 1;

-- criar tabela estoque
CREATE TABLE e_Storage(
	idStorage INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	address VARCHAR(45)
);
ALTER TABLE e_storage MODIFY COLUMN address VARCHAR(100);
ALTER TABLE e_Storage AUTO_INCREMENT = 1;

-- tabela estoque/produto
CREATE TABLE productStorage(
	idStorage INT UNSIGNED,
    idProduct INT UNSIGNED,
    Quantity INT UNSIGNED DEFAULT 0,
    CONSTRAINT pk_productStorage PRIMARY KEY (idStorage, idProduct),
    CONSTRAINT fk_storage_productStorage FOREIGN KEY (idStorage) REFERENCES e_Storage(idStorage),
    CONSTRAINT fk_product_productStorage FOREIGN KEY (idProduct) REFERENCES Product(idProduct)    
);

-- tabela fornecedor
CREATE TABLE supplier(
	idSupplier INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    BusinessName VARCHAR(100) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    concact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_supplier UNIQUE (CNPJ),
    CONSTRAINT unique_businessname_supplier UNIQUE (BusinessName)
);
ALTER TABLE supplier AUTO_INCREMENT = 1;
ALTER TABLE supplier RENAME COLUMN concact TO contact;

-- tabela vendedor
CREATE TABLE seller(
	idSeller INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    BusinessName VARCHAR(100) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    CommercialName VARCHAR(45),
    Address VARCHAR(45),
    CONSTRAINT unique_businessname_seller UNIQUE (BusinessName),
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ)
);
ALTER TABLE seller AUTO_INCREMENT = 1;

-- tabela vendido por
CREATE TABLE productSeller(
	idProduct INT UNSIGNED,
    idSeller INT UNSIGNED,
    Quantity INT UNSIGNED DEFAULT 0,
    CONSTRAINT pk_productSeller PRIMARY KEY (idProduct, idSeller),
    CONSTRAINT fk_product_productSeller FOREIGN KEY (idProduct) REFERENCES product(idProduct),
	CONSTRAINT fk_seller_productSeller FOREIGN KEY (idSeller) REFERENCES seller(idSeller)
);

-- tabela fornece
CREATE TABLE supply(
	idSupplier INT UNSIGNED,
    idProduct INT UNSIGNED,
    Quantity INT NOT NULL,
    Price FLOAT NOT NULL,
    CONSTRAINT pk_supply PRIMARY KEY (idSupplier, idProduct),
    CONSTRAINT fk_supply_supplier FOREIGN KEY (idSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier FOREIGN KEY (idProduct) REFERENCES product(idProduct)    
);

-- tabela produto/pedido
CREATE TABLE productOrder(
	idProduct INT UNSIGNED,
    idOrder INT UNSIGNED,
    Quantity INT UNSIGNED,
    productStatus ENUM('Disponível', 'Indisponível') NOT NULL,
    CONSTRAINT pk_productOrder PRIMARY KEY (idProduct, idOrder),
    CONSTRAINT fk_productOrder_product FOREIGN KEY (idProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productOrder_order FOREIGN KEY (idOrder) REFERENCES e_order(idOrder)
);