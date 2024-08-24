-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 24/08/2024 às 01:36
-- Versão do servidor: 8.2.0
-- Versão do PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clinica`
--

DROP TABLE IF EXISTS `clinica`;
CREATE TABLE IF NOT EXISTS `clinica` (
  `cod_clinica` int(10) UNSIGNED ZEROFILL NOT NULL,
  `alvara` date NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(90) NOT NULL,
  PRIMARY KEY (`cod_clinica`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `clinica`
--

INSERT INTO `clinica` (`cod_clinica`, `alvara`, `nome`, `endereco`) VALUES
(0000000001, '2025-05-03', 'Bem Estar', 'Rua São Francisco, 50'),
(0000000002, '2024-12-03', 'Clean Doc', 'Rua Cidade Bela, 2'),
(0000000003, '2025-05-05', 'Care Bem', 'Rua Santo Paulo, 43'),
(0000000004, '2024-08-25', 'System Care', 'Rua Jõao da Costa, 120');

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

DROP TABLE IF EXISTS `consulta`;
CREATE TABLE IF NOT EXISTS `consulta` (
  `cod_consulta` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `cod_medico` int(10) UNSIGNED ZEROFILL NOT NULL,
  `cod_paciente` int(10) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`cod_consulta`),
  KEY `cod_medico` (`cod_medico`),
  KEY `cod_paciente` (`cod_paciente`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`cod_consulta`, `data`, `cod_medico`, `cod_paciente`) VALUES
(0000000001, '2023-09-01', 0000000002, 0000000003),
(0000000002, '2024-06-24', 0000000001, 0000000004),
(0000000003, '2024-04-22', 0000000003, 0000000002),
(0000000004, '2023-12-31', 0000000004, 0000000001);

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE IF NOT EXISTS `especialidade` (
  `cod_especialidade` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `cod_clinica` int(10) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`cod_especialidade`),
  KEY `cod_clinica` (`cod_clinica`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `especialidade`
--

INSERT INTO `especialidade` (`cod_especialidade`, `nome`, `cod_clinica`) VALUES
(0000000001, 'Cardiologista', 0000000003),
(0000000004, 'Ginecologista', 0000000004),
(0000000002, 'Oftomologista', 0000000001),
(0000000003, 'Odontologo', 0000000002);

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `cod_medico` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cod_especialidade` int(10) UNSIGNED ZEROFILL NOT NULL,
  `crm` varchar(13) NOT NULL,
  PRIMARY KEY (`cod_medico`),
  KEY `fk_medico_especialidade` (`cod_especialidade`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`cod_medico`, `nome`, `cod_especialidade`, `crm`) VALUES
(0000000001, 'José Flavio', 0000000003, '12345678-9/BR'),
(0000000002, 'Pedro Soares', 0000000001, '98752678-9/BR'),
(0000000003, 'Cleide Sousa', 0000000002, '85005678-0/BR'),
(0000000004, 'Maria Joana', 0000000004, '96425678-0/BR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `cod_paciente` int(10) UNSIGNED ZEROFILL NOT NULL,
  `nome` varchar(50) NOT NULL,
  `idade` int NOT NULL,
  `endereco` varchar(90) NOT NULL,
  PRIMARY KEY (`cod_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`cod_paciente`, `nome`, `idade`, `endereco`) VALUES
(0000000001, 'Teresa Soares', 88, 'Rua São Sebastião'),
(0000000002, 'Severino Soares', 86, 'Rua São Sebastião'),
(0000000003, 'Matheus Bruto', 23, 'Rua Clemente Costa'),
(0000000004, 'Juandir Queiroz', 43, 'Rua Pedro America');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
