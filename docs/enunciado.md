# Enunciado do Projeto

> Projeto desenvolvido no módulo **"Modelagem, Implementação e Governança de Data Warehouses"** da pós-graduação em Engenharia de Dados.

## Proposta

A partir do modelo lógico abaixo, criar um **modelo físico para o SGBD PostgreSQL**, implementar o processo de ETL, gerar relatórios analíticos, aplicar otimizações por índices e demonstrar técnicas de gerenciamento de dimensões (Slowly Changing Dimensions).

## Modelo lógico

### Tabela `Dim_Produto`

| Campo | Tipo |
|---|---|
| Produto_ID (PK) | INT |
| Nome | VARCHAR(255) |
| Categoria | VARCHAR(255) |

### Tabela `Dim_Canal`

| Campo | Tipo |
|---|---|
| Canal_ID (PK) | INT |
| Nome | VARCHAR(255) |
| Região | VARCHAR(255) |

### Tabela `Dim_Data`

| Campo | Tipo |
|---|---|
| Data_ID (PK) | INT |
| Dia | INT |
| Mês | INT |
| Ano | INT |
| Data_Completa | DATE |

### Tabela `Dim_Cliente`

| Campo | Tipo |
|---|---|
| Cliente_ID (PK) | INT |
| Nome | VARCHAR(255) |
| Tipo | VARCHAR(255) |
| Cidade | VARCHAR(255) |
| Estado | VARCHAR(50) |
| País | VARCHAR(255) |

### Tabela `Fato_Venda`

| Campo | Tipo |
|---|---|
| Produto_ID (FK) | INT |
| Canal_ID (FK) | INT |
| Data_ID (FK) | INT |
| Cliente_ID (FK) | INT |
| Valor | DECIMAL(10, 2) |
| Quantidade | INT |

Cada venda está associada a um produto, um canal de venda, uma data e um cliente, por meio das chaves estrangeiras `Produto_ID`, `Canal_ID`, `Data_ID` e `Cliente_ID`, respectivamente.

---

> **Nota de implementação:** na construção do modelo físico, o projeto evoluiu o modelo lógico acima com a adoção de **surrogate keys** (`sk_*`) em cada dimensão, mantendo as chaves naturais (`id_*`) como atributos. Os detalhes estão documentados no [README](../README.md).
