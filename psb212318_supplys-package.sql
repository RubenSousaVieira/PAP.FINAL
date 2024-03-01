-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 01, 2024 at 05:39 PM
-- Server version: 5.7.16-log
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psb212318_supplys-package`
--

-- --------------------------------------------------------

--
-- Table structure for table `encomendas`
--

CREATE TABLE `encomendas` (
  `id_encomenda` int(11) NOT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `pin_entrega` varchar(10) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `morada` varchar(255) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `localidade` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telemovel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `estado_encomendas`
--

CREATE TABLE `estado_encomendas` (
  `id_estado_encomenda` int(11) NOT NULL,
  `id_encomenda` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reparacoes`
--

CREATE TABLE `reparacoes` (
  `idReparacao` int(11) NOT NULL,
  `CodigoReparacao` varchar(255) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `Equipamento` varchar(255) NOT NULL,
  `IMEI` int(11) NOT NULL,
  `Obs` varchar(255) NOT NULL,
  `EstadoReparacao` int(11) NOT NULL,
  `DescricaoEstado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tarefas`
--

CREATE TABLE `tarefas` (
  `idTarefa` int(11) NOT NULL,
  `tarefa` varchar(120) NOT NULL,
  `descricao` varchar(240) DEFAULT NULL,
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prazo` date DEFAULT NULL,
  `prioridade` tinyint(4) NOT NULL,
  `concluida` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tarefas`
--

INSERT INTO `tarefas` (`idTarefa`, `tarefa`, `descricao`, `data_criacao`, `prazo`, `prioridade`, `concluida`) VALUES
(5, 'B1YT5JE787Z3', 'teste', '2023-10-17 10:59:51', '2023-10-26', 2, 0),
(6, 'trabaalhar na pap', 'teste', '2024-01-31 12:01:05', '2024-01-31', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `utilizadores`
--

CREATE TABLE `utilizadores` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(180) NOT NULL,
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilizadores`
--

INSERT INTO `utilizadores` (`id`, `username`, `password`, `email`, `data_criacao`) VALUES
(1, 'psb212318', '$2y$10$vAiT6pzqg1O1CGSljqYnLOeROSkT.QO/uLlJMwbEw4aOKS0156eEe', 'po2318@alunos.epbjc.pt', '2023-09-28 12:18:22'),
(3, 'admin', '$2y$10$dpjHpnWjhsPonkSUNXmu4OdS8ChtOk268bF./tH86JJuBiYd79sW.', '', '2024-02-09 19:37:01'),
(4, 'teste02', '$2y$15$73B0F.sf8XUd/qfq765GY.7vgsrGlAOidsAOIbpztUR3f5EPUCAVq', '', '2024-02-10 12:03:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `encomendas`
--
ALTER TABLE `encomendas`
  ADD PRIMARY KEY (`id_encomenda`);

--
-- Indexes for table `estado_encomendas`
--
ALTER TABLE `estado_encomendas`
  ADD PRIMARY KEY (`id_estado_encomenda`),
  ADD KEY `id_encomenda` (`id_encomenda`);

--
-- Indexes for table `reparacoes`
--
ALTER TABLE `reparacoes`
  ADD PRIMARY KEY (`idReparacao`),
  ADD KEY `INDEX` (`idCliente`);

--
-- Indexes for table `tarefas`
--
ALTER TABLE `tarefas`
  ADD PRIMARY KEY (`idTarefa`);

--
-- Indexes for table `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `encomendas`
--
ALTER TABLE `encomendas`
  MODIFY `id_encomenda` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `estado_encomendas`
--
ALTER TABLE `estado_encomendas`
  MODIFY `id_estado_encomenda` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tarefas`
--
ALTER TABLE `tarefas`
  MODIFY `idTarefa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `estado_encomendas`
--
ALTER TABLE `estado_encomendas`
  ADD CONSTRAINT `estado_encomendas_ibfk_1` FOREIGN KEY (`id_encomenda`) REFERENCES `encomendas` (`id_encomenda`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
