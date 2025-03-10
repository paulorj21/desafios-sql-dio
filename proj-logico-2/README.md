# Oficina Mecânica - Banco de Dados

Repositório contendo o esquema conceitual, scripts SQL e consultas para um sistema de gestão de ordens de serviço de uma oficina mecânica.  
Desenvolvido para modelar clientes, veículos, equipes, mecânicos, peças, serviços e ordens de serviço.

---

## 📁 Estrutura do Repositório

1. **`EER_Diagram`**: 
   - `diagrama-logico-oficina.png`: Diagrama Entidade-Relacionamento Estendido (EER) do banco de dados.
2. **`SQL_Scripts`**:  
   - `oficina-criacao.sql`: Script para criação do banco de dados e tabelas.  
   - `oficina-inserção.sql`: Script para inserção de dados fictícios.  
   - `oficina-consultas.sql`: Script com consultas de exemplo para análise de dados.  
3. **`README.md`**: Documentação do projeto (este arquivo).

---

## 🔍 Esquema Conceitual (EER)
O banco de dados é composto pelas seguintes entidades e relacionamentos:

### **Entidades Principais**:
- **`Cliente`**: Armazena informações dos clientes (Nome, Sobrenome, CPF).  
- **`Veículo`**: Registra os veículos dos clientes (Modelo, Ano).  
- **`Equipe`**: Representa equipes de mecânicos (Código, Área de atuação).  
- **`Mecânico`**: Detalha os mecânicos (Nome, Sobrenome, Especialidade).  
- **`Ordem`**: Gerencia ordens de serviço (Status, Valor, Datas).  
- **`Peça`**: Lista peças utilizadas (Tipo, Valor).  
- **`Serviço`**: Descreve serviços realizados (Tipo, Descrição, Valor).  

### **Relacionamentos**:
- Um cliente pode ter vários **veículos**.  
- Uma **equipe** atende múltiplas ordens de serviço e é composta por vários mecânicos.  
- Uma **ordem** pode incluir várias peças e serviços.
