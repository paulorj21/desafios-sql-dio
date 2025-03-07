-- consultas e-commerce
USE ecommerce;

-- consultando dados de todos os clientes
SELECT * FROM e_client;

-- consultando descrição, categorias e valores de todos os produtos
SELECT Pdesc, Category, Price FROM product;

-- todos os pedidos que estão sendo processados
SELECT OrderDescription, SendValue FROM e_order WHERE OrderStatus = 'Processando';

-- entregas que foram concluídas
SELECT idDelivery, trackingNumber FROM delivery WHERE deliveryStatus = 'Entregue';

-- clientes e pedidos que fizeram
SELECT ClientName, ClientType, OrderDescription
	FROM e_client 
    INNER JOIN e_order ON idOrderClient = idClient
    ORDER BY ClientType DESC, ClientName;
    
-- produtos e seus fornecedores
SELECT Pdesc, Category, BusinessName FROM product
	INNER JOIN supply USING(idProduct)
    INNER JOIN supplier s USING(idSupplier);
    
-- todos os fornecedores cadastrados, incluindo os que ainda não forneceram produtos
SELECT BusinessName, p.Pdesc, p.Category FROM supplier
	LEFT JOIN supply USING(idSupplier)
    LEFT JOIN product p USING(idProduct);

-- vendedores terceiros, produtos vendidos e quantidade
SELECT BusinessName, Pdesc, Category, Quantity FROM seller
	INNER JOIN productseller USING(idSeller)
    INNER JOIN product USING(idProduct);

-- pedidos, status e tipo de pagamento
SELECT OrderDescription, PaymentType, PaymentStatus FROM e_order
	INNER JOIN payment USING(idOrder)
    ORDER BY PaymentStatus;
    
-- produtos, qtd em estoque e endereços
SELECT Pdesc, Quantity, Address FROM product
	INNER JOIN productstorage USING(idProduct)
    INNER JOIN e_storage USING(idStorage);
    
-- qtd de pedidos feitos por cada cliente
SELECT ClientName, Address, count(*) AS Orders_count
	FROM e_client INNER JOIN e_order ON idOrderClient = idClient
    GROUP BY idClient;

-- valor total gasto por pedidos
SELECT ClientName, SUM(p.Price * po.Quantity) + o.SendValue AS Total
	FROM e_client 
	INNER JOIN e_order o ON idClient = idOrderClient
	INNER JOIN productOrder po ON po.idOrder = o.idOrder
	INNER JOIN product p ON p.idProduct = po.idProduct
	WHERE OrderStatus = 'Efetuado'
	GROUP BY o.idOrder
	ORDER BY Total DESC;
    
-- média de avaliação de produtos por categoria
SELECT Category, round(AVG(Rating), 1) Avg_rating FROM product
	GROUP BY Category;
    
-- total de produtos em estoque por categoria
SELECT Category, sum(Quantity) Total FROM product
	INNER JOIN productstorage USING(idProduct)
    GROUP BY Category
    ORDER BY Total DESC;

-- produtos mais caros que a média
SELECT Pdesc, Price FROM product 
	WHERE Price > (SELECT AVG(Price) FROM product);
    
-- pedidos acima de 500
SELECT o.OrderDescription, sum(po.Quantity * p.Price) + o.SendValue AS Total
	FROM e_order o
	JOIN productOrder po ON o.idOrder = po.idOrder
	JOIN product p ON po.idProduct = p.idProduct
	GROUP BY o.idOrder
	HAVING Total > 500
    ORDER BY Total DESC;

-- dados sobre o fornecimento e estoque de cada produto
SELECT Pdesc AS Product_desc, Category, BusinessName AS Supplier, supply.Quantity Supply_qtt, e_storage.Address Address_storage, productStorage.Quantity Storage_qtt
	FROM product 
    INNER JOIN productstorage USING(idProduct)
    INNER JOIN e_storage USING(idStorage)
    INNER JOIN supply USING(idProduct)
    INNER JOIN supplier USING(idSupplier);
