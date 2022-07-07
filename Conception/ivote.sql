-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 08 juil. 2022 à 00:07
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ivote`
--
CREATE DATABASE IF NOT EXISTS `ivote` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ivote`;

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

CREATE TABLE `candidat` (
  `Id_Candidat` int(11) NOT NULL,
  `parti_politique` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `naissance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `candidat_espacevote`
--

CREATE TABLE `candidat_espacevote` (
  `Id_espaceVote` int(11) NOT NULL,
  `Id_Candidat` int(11) NOT NULL,
  `nbr_vote` int(11) DEFAULT NULL,
  `annee` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

CREATE TABLE `commune` (
  `Id_Commune` int(11) NOT NULL,
  `nomCommune` varchar(50) NOT NULL,
  `Id_Departement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commune`
--

INSERT INTO `commune` (`Id_Commune`, `nomCommune`, `Id_Departement`) VALUES
(1, 'VilleJuif', 1),
(2, 'Etoile', 2);

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `Id_Departement` int(11) NOT NULL,
  `nomDepartement` varchar(50) DEFAULT NULL,
  `Id_Region` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`Id_Departement`, `nomDepartement`, `Id_Region`) VALUES
(1, 'Val de Marne', 1),
(2, 'Haute Seine', 2);

-- --------------------------------------------------------

--
-- Structure de la table `electeur`
--

CREATE TABLE `electeur` (
  `Id_electeur` int(11) NOT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `numero_electeur` varchar(255) NOT NULL,
  `role` int(11) DEFAULT 0,
  `Id_Commune` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `electeur`
--

INSERT INTO `electeur` (`Id_electeur`, `prenom`, `nom`, `email`, `password`, `numero_electeur`, `role`, `Id_Commune`) VALUES
(2, 'mario', 'bob', 'mario.bob@mail.com', '$2b$10$PgyTNX5QdrVpdaUpd2HLtOA/04mqGWTQr9aaWLf7OW2Eboopblp86', 'N256JK', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `electeur_referendum`
--

CREATE TABLE `electeur_referendum` (
  `Id_electeur` int(11) NOT NULL,
  `Id_referendum` int(11) NOT NULL,
  `decision` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `espacevote`
--

CREATE TABLE `espacevote` (
  `Id_espaceVote` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `referendum`
--

CREATE TABLE `referendum` (
  `Id_referendum` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `Id_Region` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`Id_Region`, `nom`) VALUES
(1, 'Paris'),
(2, 'Lyon');

-- --------------------------------------------------------

--
-- Structure de la table `voter`
--

CREATE TABLE `voter` (
  `Id_electeur` int(11) NOT NULL,
  `Id_espaceVote` int(11) NOT NULL,
  `decision` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD PRIMARY KEY (`Id_Candidat`),
  ADD UNIQUE KEY `parti_politique` (`parti_politique`);

--
-- Index pour la table `candidat_espacevote`
--
ALTER TABLE `candidat_espacevote`
  ADD PRIMARY KEY (`Id_espaceVote`,`Id_Candidat`),
  ADD KEY `Id_Candidat` (`Id_Candidat`);

--
-- Index pour la table `commune`
--
ALTER TABLE `commune`
  ADD PRIMARY KEY (`Id_Commune`),
  ADD KEY `Id_Departement` (`Id_Departement`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`Id_Departement`,`Id_Region`),
  ADD KEY `Id_Region` (`Id_Region`);

--
-- Index pour la table `electeur`
--
ALTER TABLE `electeur`
  ADD PRIMARY KEY (`Id_electeur`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `numero_electeur` (`numero_electeur`),
  ADD KEY `electeur_ibfk_1` (`Id_Commune`);

--
-- Index pour la table `electeur_referendum`
--
ALTER TABLE `electeur_referendum`
  ADD PRIMARY KEY (`Id_electeur`,`Id_referendum`),
  ADD KEY `Id_referendum` (`Id_referendum`);

--
-- Index pour la table `espacevote`
--
ALTER TABLE `espacevote`
  ADD PRIMARY KEY (`Id_espaceVote`);

--
-- Index pour la table `referendum`
--
ALTER TABLE `referendum`
  ADD PRIMARY KEY (`Id_referendum`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`Id_Region`);

--
-- Index pour la table `voter`
--
ALTER TABLE `voter`
  ADD PRIMARY KEY (`Id_electeur`,`Id_espaceVote`),
  ADD KEY `Id_espaceVote` (`Id_espaceVote`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `candidat`
--
ALTER TABLE `candidat`
  MODIFY `Id_Candidat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commune`
--
ALTER TABLE `commune`
  MODIFY `Id_Commune` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `Id_Departement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `electeur`
--
ALTER TABLE `electeur`
  MODIFY `Id_electeur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `espacevote`
--
ALTER TABLE `espacevote`
  MODIFY `Id_espaceVote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `referendum`
--
ALTER TABLE `referendum`
  MODIFY `Id_referendum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `Id_Region` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `candidat_espacevote`
--
ALTER TABLE `candidat_espacevote`
  ADD CONSTRAINT `candidat_espaceVote_ibfk_1` FOREIGN KEY (`Id_espaceVote`) REFERENCES `espacevote` (`Id_espaceVote`),
  ADD CONSTRAINT `candidat_espaceVote_ibfk_2` FOREIGN KEY (`Id_Candidat`) REFERENCES `candidat` (`Id_Candidat`);

--
-- Contraintes pour la table `commune`
--
ALTER TABLE `commune`
  ADD CONSTRAINT `commune_ibfk_1` FOREIGN KEY (`Id_Departement`) REFERENCES `departement` (`Id_Departement`);

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`Id_Region`) REFERENCES `region` (`Id_Region`);

--
-- Contraintes pour la table `electeur`
--
ALTER TABLE `electeur`
  ADD CONSTRAINT `electeur_ibfk_1` FOREIGN KEY (`Id_Commune`) REFERENCES `commune` (`Id_Commune`);

--
-- Contraintes pour la table `electeur_referendum`
--
ALTER TABLE `electeur_referendum`
  ADD CONSTRAINT `electeur_referendum_ibfk_1` FOREIGN KEY (`Id_electeur`) REFERENCES `electeur` (`Id_electeur`),
  ADD CONSTRAINT `electeur_referendum_ibfk_2` FOREIGN KEY (`Id_referendum`) REFERENCES `referendum` (`Id_referendum`);

--
-- Contraintes pour la table `voter`
--
ALTER TABLE `voter`
  ADD CONSTRAINT `voter_ibfk_1` FOREIGN KEY (`Id_electeur`) REFERENCES `electeur` (`Id_electeur`),
  ADD CONSTRAINT `voter_ibfk_2` FOREIGN KEY (`Id_espaceVote`) REFERENCES `espacevote` (`Id_espaceVote`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
