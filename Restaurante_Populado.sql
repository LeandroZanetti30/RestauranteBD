USE RestauranteDB;

-- Populando a tabela Cliente
INSERT INTO Cliente (cpf, nome, email, dataNascimento) VALUES
('123.456.789-00', 'João Silva', 'joao@email.com', '1985-06-15'),
('987.654.321-00', 'Maria Oliveira', 'maria@email.com', '1990-03-22'),
('111.222.333-44', 'Carlos Santos', 'carlos@email.com', '1978-11-02'),
('555.666.777-88', 'Ana Pereira', 'ana@email.com', '1995-12-10'),
('999.888.777-66', 'Lucas Almeida', 'lucas@email.com', '1988-09-30');

-- Populando a tabela Funcionario
INSERT INTO Funcionario (cpf, nome, email, cargo, salario) VALUES
('234.567.890-01', 'Fernanda Souza', 'fernanda@email.com', 'Gerente', 3500),
('876.543.210-98', 'Pedro Costa', 'pedro@email.com', 'Garçom', 1800.75),
('333.444.555-66', 'Juliana Mendes', 'juliana@email.com', 'Cozinheira', 2200),
('777.888.999-00', 'Roberto Lima', 'roberto@email.com', 'Garçom', 1850),
('111.333.555-77', 'Cláudia Silva', 'claudia@email.com', 'Atendente', 1600);

-- Populando a tabela Mesa
INSERT INTO Mesa (capacidade) VALUES
(4), (2), (6), (8), (4);

-- Populando a tabela Reserva
INSERT INTO Reserva (numClientes, dia, hora, cpfCliente) VALUES
(2, '2024-09-15', '19:00:00', '123.456.789-00'),
(4, '2024-09-16', '20:00:00', '987.654.321-00'),
(6, '2024-09-17', '18:30:00', '111.222.333-44'),
(3, '2024-09-18', '21:00:00', '555.666.777-88'),
(5, '2024-09-19', '19:30:00', '999.888.777-66');

-- Populando a tabela Pedido
INSERT INTO Pedido (dia, hora, cpfCliente, cpfFuncionario, idReserva) VALUES
('2024-09-15', '19:30:00', '123.456.789-00', '234.567.890-01', 1),
('2024-09-16', '20:30:00', '987.654.321-00', '876.543.210-98', 2),
('2024-09-17', '18:45:00', '111.222.333-44', '333.444.555-66', 3),
('2024-09-18', '21:15:00', '555.666.777-88', '777.888.999-00', 4),
('2024-09-19', '19:45:00', '999.888.777-66', '111.333.555-77', 5);

-- Populando a tabela Prato
INSERT INTO Prato (nome, descricao, preco) VALUES
('Spaghetti Carbonara', 'Pasta italiana com molho de ovos, queijo e bacon', 32),
('Frango à Parmegiana', 'Peito de frango empanado com molho de tomate e queijo', 28),
('Salada Caesar', 'Salada com alface, croutons e molho Caesar', 22),
('Picanha Grelhada', 'Picanha com arroz, feijão e farofa', 42),
('Pizza Margherita', 'Pizza tradicional com molho de tomate, mussarela e manjericão', 30);

-- Populando a tabela Cardapio
INSERT INTO Cardapio (dataInicio, dataFim) VALUES
('2024-09-01', '2024-09-07'),
('2024-09-08', '2024-09-14'),
('2024-09-15', '2024-09-21'),
('2024-09-22', '2024-09-28'),
('2024-09-29', '2024-10-05');

-- Populando a tabela Ingrediente
INSERT INTO Ingrediente (nome, descricao, unidadeMedida) VALUES
('Tomate', 'Tomate fresco', 'kg'),
('Queijo Mussarela', 'Queijo de leite de vaca', 'kg'),
('Farinha de Trigo', 'Farinha refinada para panificação', 'kg'),
('Bacon', 'Bacon defumado', 'kg'),
('Picanha', 'Carne bovina de alta qualidade', 'kg');

-- Populando a tabela Fornecedor
INSERT INTO Fornecedor (nome, endereco) VALUES
('Fornecedor A', 'Rua Principal, 123, Cidade A'),
('Fornecedor B', 'Avenida Central, 456, Cidade B'),
('Fornecedor C', 'Praça das Flores, 789, Cidade C'),
('Fornecedor D', 'Rua das Árvores, 1011, Cidade D'),
('Fornecedor E', 'Avenida dos Lagos, 1213, Cidade E');

-- Populando a tabela Compra
INSERT INTO Compra (valor, dia, hora, idFornecedor) VALUES
(1500.00, '2024-09-10', '10:30:00', 1),
(2300.00, '2024-09-11', '11:00:00', 2),
(1250.00, '2024-09-12', '09:45:00', 3),
(1750.00, '2024-09-13', '14:30:00', 4),
(2100.00, '2024-09-14', '16:15:00', 5);

-- Populando a tabela ReservaMesa
INSERT INTO ReservaMesa (idReserva, idMesa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Populando a tabela PedidoPrato
INSERT INTO PedidoPrato (idPedido, idPrato, valor) VALUES
(1, 1, 32),
(2, 2, 28),
(3, 3, 22),
(4, 4, 42),
(5, 5, 30);

-- Populando a tabela PratoCardapio
INSERT INTO PratoCardapio (idPrato, codigoCardapio) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Populando a tabela PratoIngrediente
INSERT INTO PratoIngrediente (idPrato, codigoIngrediente, quantidade) VALUES
(1, 1, 0.5),
(2, 2, 0.4),
(3, 3, 0.3),
(4, 4, 0.6),
(5, 5, 0.7);

-- Populando a tabela CompraIngrediente
INSERT INTO CompraIngrediente (codigoCompra, codigoIngrediente, quantidade) VALUES
(1, 1, 20.00),
(2, 2, 15.00),
(3, 3, 10.00),
(4, 4, 25.00),
(5, 5, 18.00);

-- Populando a tabela TelefoneCliente
INSERT INTO TelefoneCliente (clienteCpf, telefone) VALUES
('123.456.789-00', '99999-1111'),
('987.654.321-00', '99999-2222'),
('111.222.333-44', '99999-3333'),
('555.666.777-88', '99999-4444'),
('999.888.777-66', '99999-5555');

-- Populando a tabela TelefoneFornecedor
INSERT INTO TelefoneFornecedor (idFornecedor, telefone) VALUES
(1, '88888-1111'),
(2, '88888-2222'),
(3, '88888-3333'),
(4, '88888-4444'),
(5, '88888-5555');

-- Populando a tabela TelefoneFuncionario
INSERT INTO TelefoneFuncionario (funcionarioCpf, telefone) VALUES
('234.567.890-01', '77777-1111'),
('876.543.210-98', '77777-2222'),
('333.444.555-66', '77777-3333'),
('777.888.999-00', '77777-4444'),
('111.333.555-77', '77777-5555');
