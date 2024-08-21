-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/08/2024 às 21:50
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `locadora`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `codigo` int(10) NOT NULL,
  `descricao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`codigo`, `descricao`) VALUES
(1, '4x4'),
(2, 'Basico'),
(3, 'Compacto'),
(4, 'Esportivo'),
(5, 'Caminhonete');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codigo` int(10) NOT NULL,
  `cpf` char(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `telefone` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codigo`, `cpf`, `nome`, `telefone`) VALUES
(1, '00000000110', 'Alan Rick', '83910011001'),
(2, '10845678460', 'Leo Silva', '84999885544'),
(3, '00000000220', 'Silva Freita', '83910021000'),
(4, '10000000012', 'Barbosa Coelho', '83910031001'),
(5, '12000000013', 'João Serafim', '83910042001');

-- --------------------------------------------------------

--
-- Estrutura para tabela `locacao`
--

CREATE TABLE `locacao` (
  `id_locacao` int(10) NOT NULL,
  `dt_inicial` date DEFAULT NULL,
  `dt_final` date DEFAULT NULL,
  `vl_locacao` decimal(7,2) DEFAULT NULL,
  `codigoCliente` int(10) DEFAULT NULL,
  `codigoVeiculo` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `locacao`
--

INSERT INTO `locacao` (`id_locacao`, `dt_inicial`, `dt_final`, `vl_locacao`, `codigoCliente`, `codigoVeiculo`) VALUES
(1, '2024-01-24', '2024-02-12', 1000.00, 4, 2),
(2, '2023-04-04', '2023-06-12', 5040.50, 3, 1),
(3, '2023-06-12', '2023-06-30', 2500.00, 1, 5),
(4, '2023-01-02', '2023-01-22', 2000.00, 2, 4),
(5, '2023-03-12', '2023-05-12', 2400.00, 5, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `marca`
--

CREATE TABLE `marca` (
  `codigo` int(10) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `marca`
--

INSERT INTO `marca` (`codigo`, `nome`) VALUES
(1, 'Jeep'),
(2, 'Toyota'),
(3, 'BMW'),
(4, 'Fiat'),
(5, 'Mercedes-Benz');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `codigo` int(10) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `codigoMarca` int(10) NOT NULL,
  `codigoCategoria` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veiculo`
--

INSERT INTO `veiculo` (`codigo`, `placa`, `codigoMarca`, `codigoCategoria`) VALUES
(1, 'ABG8B45', 1, 2),
(2, 'BFC8O90', 3, 2),
(3, 'NJK0YU5', 2, 3),
(4, 'PHJ7I90', 5, 4),
(5, 'YUT5IU78', 4, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `locacao`
--
ALTER TABLE `locacao`
  ADD PRIMARY KEY (`id_locacao`),
  ADD KEY `codigoCliente` (`codigoCliente`),
  ADD KEY `codigoVeiculo` (`codigoVeiculo`);

--
-- Índices de tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigoMarca` (`codigoMarca`),
  ADD KEY `codigoCategoria` (`codigoCategoria`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `codigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `locacao`
--
ALTER TABLE `locacao`
  MODIFY `id_locacao` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `codigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `codigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `locacao`
--
ALTER TABLE `locacao`
  ADD CONSTRAINT `locacao_ibfk_1` FOREIGN KEY (`codigoCliente`) REFERENCES `cliente` (`codigo`),
  ADD CONSTRAINT `locacao_ibfk_2` FOREIGN KEY (`codigoVeiculo`) REFERENCES `veiculo` (`codigo`);

--
-- Restrições para tabelas `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`codigoMarca`) REFERENCES `marca` (`codigo`),
  ADD CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`codigoCategoria`) REFERENCES `categoria` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
