-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Servidor: 127.11.50.132:3306
-- Tempo de Geração: 29/12/2015 às 23:35
-- Versão do servidor: 5.1.73
-- Versão do PHP: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `dissys`


-- --------------------------------------------------------

--
-- Estrutura para tabela `_masc_recurso_indoor`
--

CREATE TABLE IF NOT EXISTS `_masc_recurso_indoor` (
  `id_recurso_indoor` int(11) NOT NULL AUTO_INCREMENT,
  `id_recurso_indoor_ambiente` int(11) DEFAULT NULL,
  `id_tiporecurso` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL,
  `descricao` varchar(85) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id_recurso_indoor`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=77 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `_masc_recurso_indoor_tag`
--

CREATE TABLE IF NOT EXISTS `_masc_recurso_indoor_tag` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `id_recurso_indoor` int(11) NOT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `_masc_recurso_outdoor`
--

CREATE TABLE IF NOT EXISTS `_masc_recurso_outdoor` (
  `id_recursooutdoor` int(11) NOT NULL AUTO_INCREMENT,
  `id_tiporecurso` int(11) NOT NULL,
  `id_tipodef` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  PRIMARY KEY (`id_recursooutdoor`),
  KEY `id_tipodef` (`id_tipodef`),
  KEY `id_tiporecurso` (`id_tiporecurso`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `_masc_tag`
--

CREATE TABLE IF NOT EXISTS `_masc_tag` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=181 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `_masc_tipo_def`
--

CREATE TABLE IF NOT EXISTS `_masc_tipo_def` (
  `Id_TipoDef` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(35) NOT NULL,
  PRIMARY KEY (`Id_TipoDef`),
  KEY `Descricao` (`Descricao`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `_masc_tipo_recurso`
--

CREATE TABLE IF NOT EXISTS `_masc_tipo_recurso` (
  `Id_TipoRecurso` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(35) NOT NULL,
  `Icone` varchar(35) NOT NULL,
  PRIMARY KEY (`Id_TipoRecurso`),
  KEY `Descricao` (`Descricao`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `_masc_trilha`
--

CREATE TABLE IF NOT EXISTS `_masc_trilha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latitude` decimal(18,15) NOT NULL,
  `longitude` decimal(18,15) NOT NULL,
  `tag` varchar(40) NOT NULL,
  `recs` varchar(100) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dataHora` (`dataHora`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=269314 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `_masc_trilhaBKP`
--

CREATE TABLE IF NOT EXISTS `_masc_trilhaBKP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latitude` decimal(18,15) NOT NULL,
  `longitude` decimal(18,15) NOT NULL,
  `tag` varchar(40) NOT NULL,
  `recs` varchar(100) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dataHora` (`dataHora`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=270071 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `_masc_trilhaSiafu`
--

CREATE TABLE IF NOT EXISTS `_masc_trilhaSiafu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora` datetime NOT NULL,
  `latitude` decimal(18,15) NOT NULL,
  `longitude` decimal(18,15) NOT NULL,
  `tag` varchar(40) NOT NULL,
  `recs` varchar(100) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dataHora` (`dataHora`),
  KEY `longitude` (`longitude`),
  KEY `latitude` (`latitude`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=270188 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `_masc_trilhaSiafu27k`
--

CREATE TABLE IF NOT EXISTS `_masc_trilhaSiafu27k` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora` datetime NOT NULL,
  `latitude` decimal(18,15) NOT NULL,
  `longitude` decimal(18,15) NOT NULL,
  `tag` varchar(40) NOT NULL,
  `recs` varchar(100) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `dataHora` (`dataHora`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=270188 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `_masc_usuario`
--

CREATE TABLE IF NOT EXISTS `_masc_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `tipoUser` varchar(50) DEFAULT NULL,
  `tipoDef` varchar(50) NOT NULL,
  `ativo` int(2) DEFAULT '1',
  `dataCadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tipoUser` (`tipoUser`),
  KEY `tipoDef` (`tipoDef`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=18 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
