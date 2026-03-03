-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 16 déc. 2025 à 13:27
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hospicetale`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20251118142509', '2025-11-18 14:25:14', 51),
('DoctrineMigrations\\Version20251118153200', '2025-11-18 15:32:02', 55),
('DoctrineMigrations\\Version20251214191023', '2025-12-14 19:10:40', 199),
('DoctrineMigrations\\Version20251214192528', '2025-12-14 19:25:38', 62);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `sexe` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id`, `nom`, `prenom`, `date_naissance`, `sexe`) VALUES
(1, 'Dupont', 'Alice', '1990-05-12', 'F'),
(2, 'Martin', 'Bob', '1985-09-20', 'M'),
(3, 'Lefevre', 'Clara', '1978-03-15', 'F'),
(4, 'Moreau', 'David', '2000-11-02', 'M'),
(5, 'Petit', 'Emma', '1995-07-07', 'F'),
(6, 'Dubois', 'Fiona', '1988-08-18', 'F'),
(7, 'Lemoine', 'George', '1975-12-10', 'M'),
(8, 'Carre', 'Hugo', '1992-03-05', 'M'),
(9, 'Blanc', 'Isabelle', '1980-06-25', 'F'),
(10, 'Faure', 'Jack', '1999-01-30', 'M'),
(11, 'Morgan', 'Arthur', '1863-02-10', 'M');

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`id`, `username`, `roles`, `password`) VALUES
(1, 'infirmier', '[\"ROLE_INFIRMIER\"]', '$2y$13$pXJYuTd1ynNj7/awwTe23uaX67tfk6a3GrFUriX4SYBRL/psAU.8O'),
(2, 'medecin', '[\"ROLE_MEDECIN\"]', '$2y$13$DdVjZ03THz5PC5fkwN5wKO4Uox7fIX1K9eZiYNnvEvJbl7i592uVm'),
(3, 'admin', '[\"ROLE_ADMIN\"]', '$2y$13$B58Or7zJtBzuZe63tOwUQOZFpcZHddqK2fzpmRUMRM.0zRSRFebDS');

-- --------------------------------------------------------

--
-- Structure de la table `sejour`
--

DROP TABLE IF EXISTS `sejour`;
CREATE TABLE IF NOT EXISTS `sejour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrive` tinyint(1) NOT NULL,
  `sorti` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_96F520286B899279` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sejour`
--

INSERT INTO `sejour` (`id`, `patient_id`, `date_debut`, `date_fin`, `commentaire`, `arrive`, `sorti`) VALUES
(1, 1, '2025-12-14', '2025-12-16', 'Examen sanguin', 1, 0),
(2, 2, '2025-12-14', '2025-12-20', 'Chirurgie mineure', 0, 0),
(3, 3, '2025-12-15', '2025-12-18', 'Radiologie', 1, 0),
(4, 4, '2025-12-16', '2025-12-16', 'Vaccination', 1, 0),
(5, 5, '2025-12-17', '2025-12-19', 'Consultation cardio', 0, 0),
(6, 6, '2025-12-15', '2025-12-17', 'Analyse urinaire', 1, 0),
(7, 7, '2025-12-16', '2025-12-20', 'Chirurgie orthopédique', 0, 0),
(8, 8, '2025-12-18', '2025-12-19', 'Vaccination grippe', 0, 0),
(9, 9, '2025-12-19', '2025-12-21', 'Consultation dermatologie', 0, 0),
(10, 10, '2025-12-20', '2025-12-22', 'Radiologie pulmonaire', 0, 0),
(11, 1, '2025-12-23', '2025-12-25', 'Chirurgie ambulatoire', 0, 0),
(12, 2, '2025-12-24', '2025-12-26', 'Suivi post-opératoire', 0, 0),
(13, 3, '2025-12-25', '2025-12-27', 'Consultation générale', 0, 0),
(14, 4, '2025-12-26', '2025-12-28', 'Examen cardiologie', 0, 0),
(15, 5, '2025-12-27', '2025-12-29', 'Radiologie', 0, 0),
(16, 11, '2025-12-14', '2025-12-14', 'Chute de cheval', 0, 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD CONSTRAINT `FK_96F520286B899279` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
