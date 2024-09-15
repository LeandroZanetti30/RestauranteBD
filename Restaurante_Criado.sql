CREATE DATABASE RestauranteDB;

USE RestauranteDB;

CREATE TABLE Cliente (
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    dataNascimento DATE NOT NULL
);

CREATE TABLE Funcionario (
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario INT NOT NULL
);

CREATE TABLE Mesa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    capacidade INT NOT NULL
);

CREATE TABLE Reserva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numClientes INT NOT NULL,
    dia DATE NOT NULL,
    hora TIME NOT NULL,
    cpfCliente VARCHAR(14) NOT NULL,
    FOREIGN KEY (cpfCliente) REFERENCES Cliente(cpf) ON DELETE CASCADE
);

CREATE TABLE Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dia DATE NOT NULL,
    hora TIME NOT NULL,
    cpfCliente VARCHAR(14) NOT NULL,
    cpfFuncionario VARCHAR(14) NOT NULL,
    idReserva INT NOT NULL,
    FOREIGN KEY (cpfCliente) REFERENCES Cliente(cpf) ON DELETE CASCADE,
    FOREIGN KEY (cpfFuncionario) REFERENCES Funcionario(cpf) ON DELETE RESTRICT,
    FOREIGN KEY (idReserva) REFERENCES Reserva(id) ON DELETE RESTRICT
);

CREATE TABLE Prato (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NULL,
    preco INT NOT NULL
);

CREATE TABLE Cardapio (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL
);

CREATE TABLE Ingrediente (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NULL,
    unidadeMedida VARCHAR(50) NOT NULL
);

CREATE TABLE Fornecedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE Compra (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    valor INT NOT NULL,
    dia DATE NOT NULL,
    hora TIME NOT NULL,
    idFornecedor INT NOT NULL,
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(id) ON DELETE RESTRICT
);

CREATE TABLE ReservaMesa (
    idReserva INT NOT NULL,
    idMesa INT NOT NULL,
    PRIMARY KEY (idReserva, idMesa),
    FOREIGN KEY (idReserva) REFERENCES Reserva(id) ON DELETE CASCADE,
    FOREIGN KEY (idMesa) REFERENCES Mesa(id) ON DELETE CASCADE
);

CREATE TABLE PedidoPrato (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT NOT NULL,
    idPrato INT NOT NULL,
    valor INT NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES Pedido(id) ON DELETE CASCADE,
    FOREIGN KEY (idPrato) REFERENCES Prato(id) ON DELETE CASCADE
);

CREATE TABLE PratoCardapio (
    idPrato INT NOT NULL,
    codigoCardapio INT NOT NULL,
    PRIMARY KEY (idPrato, codigoCardapio),
    FOREIGN KEY (idPrato) REFERENCES Prato(id) ON DELETE CASCADE,
    FOREIGN KEY (codigoCardapio) REFERENCES Cardapio(codigo) ON DELETE CASCADE
);

CREATE TABLE PratoIngrediente (
    idPrato INT NOT NULL,
    codigoIngrediente INT NOT NULL,
    quantidade DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (idPrato, codigoIngrediente),
    FOREIGN KEY (idPrato) REFERENCES Prato(id) ON DELETE RESTRICT,
    FOREIGN KEY (codigoIngrediente) REFERENCES Ingrediente(codigo) ON DELETE RESTRICT
);

CREATE TABLE CompraIngrediente (
    codigoCompra INT NOT NULL,
    codigoIngrediente INT NOT NULL,
    quantidade DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (codigoCompra, codigoIngrediente),
    FOREIGN KEY (codigoCompra) REFERENCES Compra(codigo) ON DELETE CASCADE,
    FOREIGN KEY (codigoIngrediente) REFERENCES Ingrediente(codigo) ON DELETE CASCADE
);

CREATE TABLE TelefoneCliente (
    clienteCpf VARCHAR(14),
    telefone VARCHAR(15) NOT NULL,
    PRIMARY KEY (clienteCpf, telefone),
    FOREIGN KEY (clienteCpf) REFERENCES Cliente(cpf) ON DELETE CASCADE
);

CREATE TABLE TelefoneFornecedor (
    idFornecedor INT NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    PRIMARY KEY (idFornecedor, telefone),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(id) ON DELETE CASCADE
);

CREATE TABLE TelefoneFuncionario (
    funcionarioCpf VARCHAR(14),
    telefone VARCHAR(15) NOT NULL,
    PRIMARY KEY (funcionarioCpf, telefone),
    FOREIGN KEY (funcionarioCpf) REFERENCES Funcionario(cpf) ON DELETE CASCADE
);
