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
-- Estrutura para tabela `gh`
--

CREATE TABLE `gh` (
  `id` int NOT NULL,
  `guild` int NOT NULL DEFAULT '0',
  `nomeguild` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `points` int DEFAULT '0',
  `domination_time` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `gh`
--

INSERT INTO `gh` (`id`, `guild`, `nomeguild`, `name`, `points`, `domination_time`) VALUES
(9, 100, 'JoninhaZ', '', 0, 1741266303);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `gh`
--
ALTER TABLE `gh`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `gh`
--
ALTER TABLE `gh`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
