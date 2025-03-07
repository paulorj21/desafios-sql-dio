# E-commerce Database Project

Repositório contendo o esquema conceitual, scripts SQL e consultas para um banco de dados de e-commerce.  
Projeto desenvolvido para modelar um sistema de e-commerce com funcionalidades como gestão de clientes, pedidos, produtos, fornecedores, estoque e pagamentos.

---

## 📁 Estrutura do Repositório

1. **`EER_Diagram`**: Esquema conceitual do banco de dados no formato EER (MySQL Workbench).  
2. **`SQL_Scripts`**:
   - `01_database_creation.sql`: Script para criação do banco de dados e tabelas.
   - `02_data_insertion.sql`: Script para inserção de dados fictícios.
   - `03_queries.sql`: Script com consultas SQL para análise de dados.
3. **`README.md`**: Documentação do projeto (este arquivo).

---

## 🔍 Esquema Conceitual (EER)
O banco de dados é composto pelas seguintes tabelas e relacionamentos:

### **Entidades Principais**:
- **`e_client`**: Clientes (PJ/PF) com informações básicas.
- **`product`**: Produtos com categoria, valor, avaliação e estoque.
- **`e_order`**: Pedidos com status, descrição e valor do frete.
- **`supplier`**: Fornecedores de produtos.
- **`seller`**: Vendedores terceirizados.
- **`payment`**: Pagamentos associados a pedidos.
- **`delivery`**: Entregas com status de rastreamento.

### **Relacionamentos**:
- Clientes podem fazer múltiplos pedidos (`e_client` → `e_order`).
- Produtos podem ser fornecidos por múltiplos fornecedores (`supplier` ↔ `product` via `supply`).
- Vendedores terceiros oferecem produtos (`seller` ↔ `product` via `productSeller`).
- Pedidos contêm múltiplos produtos (`e_order` ↔ `product` via `productOrder`).
