-- Database: SimpleShop

-- DROP DATABASE IF EXISTS "SimpleShop";

CREATE DATABASE "SimpleShop"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
	CREATE TABLE Product_Type (
    ID_Type SERIAL PRIMARY KEY NOT NULL,
    Type_Description VARCHAR(50) NOT NULL,
    Tax_Percentage FLOAT(5)
);

INSERT INTO Product_Type (ID_Type, Type_Description, Tax_Percentage)
VALUES
    (1, 'Eletrônicos', 11.3),
    (2, 'Eletrodoméstico', 9.32),
    (3, 'Roupas', 9.5),
    (4, 'Acessórios', 7.3);
	
SELECT * FROM Product_Type;

CREATE TABLE Products (
    Product_ID SERIAL PRIMARY KEY NOT NULL,
    Product_Type INTEGER REFERENCES Product_Type(ID_Type),
    Product_Description VARCHAR(50) NOT NULL
);

ALTER TABLE Products
ADD COLUMN Product_Price FLOAT(10) NOT NULL;

-- Eletrônicos
INSERT INTO Products (Product_Type, Product_Description, Product_Price) VALUES
    (1, 'Smartphone Samsung Galaxy S20', 3499.99),
    (1, 'Notebook Dell Inspiron 15', 4299.99),
    (1, 'Smart TV LG 55" 4K', 2699.99),
    (1, 'Caixa de Som Bluetooth JBL Charge 5', 899.99),
    (1, 'Câmera Digital Canon EOS Rebel T7', 2999.99),
    (1, 'Fone de Ouvido Sony WH-1000XM4', 2599.99);

-- Eletrodoméstico
INSERT INTO Products (Product_Type, Product_Description, Product_Price) VALUES
    (2, 'Geladeira Electrolux Frost Free 441 Litros', 3599.99),
    (2, 'Forno Elétrico de Embutir Brastemp Gourmand', 3299.99),
    (2, 'Lava-louças Samsung Inox 14 Serviços', 3699.99),
    (2, 'Fogão Consul 5 Bocas Inox com Timer Digital', 1999.99),
    (2, 'Aspirador de Pó Philco 1200W', 499.99),
    (2, 'Máquina de Lavar Roupas LG 16Kg', 3799.99);

-- Roupas
INSERT INTO Products (Product_Type, Product_Description, Product_Price) VALUES
    (3, 'Camisa Polo Ralph Lauren', 299.99),
    (3, 'Calça Jeans Levis', 399.99),
    (3, 'Blusa de Moletom Adidas', 249.99),
    (3, 'Vestido Longo de Festa', 899.99),
    (3, 'Tênis Nike Air Max 270', 799.99),
    (3, 'Casaco de Inverno Columbia', 1299.99);

-- Acessórios
INSERT INTO Products (Product_Type, Product_Description, Product_Price) VALUES
    (4, 'Óculos de Sol Ray-Ban Aviator', 499.99),
    (4, 'Relógio Smartwatch Apple Watch Series 7', 4699.99),
    (4, 'Bolsa de Couro Feminina', 999.99),
    (4, 'Pulseira de Prata 925', 249.99),
    (4, 'Boné New Era', 149.99),
    (4, 'Cinto de Couro Masculino', 199.99);

SELECT * FROM Products WHERE product_price < 1500;
