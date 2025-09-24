-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 26/07/2025 às 16:51
-- Versão do servidor: 8.2.0
-- Versão do PHP: 8.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `middle-earth`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `boost_creature`
--

CREATE TABLE `boost_creature` (
  `id` int NOT NULL,
  `category` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `exp` int NOT NULL DEFAULT '0',
  `loot` int NOT NULL DEFAULT '0',
  `type` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `boost_creature`
--

INSERT INTO `boost_creature` (`id`, `category`, `name`, `exp`, `loot`, `type`) VALUES
(894, 'second', 'Mummy', 30, 10, NULL),
(895, 'third', 'Retching horror', 30, 10, NULL),
(896, 'normal', 'Dwarf soldier', 30, 10, NULL),
(897, 'boss', 'Valaraukar', 30, 10, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `boost_creature`
--
ALTER TABLE `boost_creature`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`category`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `boost_creature`
--
ALTER TABLE `boost_creature`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=898;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
