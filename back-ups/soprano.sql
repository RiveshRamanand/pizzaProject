-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 10 jun 2024 om 10:17
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soprano`
--
CREATE DATABASE IF NOT EXISTS `soprano` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `soprano`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `description`) VALUES
(1, 'vegetarisch ', 'vegetarisch.jpg', 'een lekkere vegetarische pizza!'),
(2, 'Vlees', 'vlees.jpg', 'Pizza met vlees'),
(3, 'vis ', 'vis.png', 'een lekkere vis pizza');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240215134954', '2024-02-15 14:50:32', 66),
('DoctrineMigrations\\Version20240215135349', '2024-02-15 14:54:06', 9),
('DoctrineMigrations\\Version20240215135627', '2024-02-15 14:57:01', 7),
('DoctrineMigrations\\Version20240215135844', '2024-02-15 14:58:58', 10);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `streetname` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `city` varchar(25) NOT NULL,
  `price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `pizza`
--

INSERT INTO `pizza` (`id`, `name`, `price`, `description`, `image`) VALUES
(3, 'Margherita', 12.59, 'Tomatensaus, mozzarella en met knoflookolie op de rand van de pizza.', 'margherita.jpg'),
(4, 'Caprese', 15.49, 'Tomatensaus, mozzarella, cherry tomaat, buffel mozzarella, swirl van pesto en knoflookolie op de rand.', 'caprese.jpg'),
(5, 'four cheese pizza', 14.99, 'Crème fraîche, mozzarella, cheddar, Goudse kaas en gorgonzola en knoflookolie op de rand.', '4cheese.png'),
(6, 'Veggie Deluxe', 15.49, 'Tomatensaus, mozzarella, rode ui, paprika, champignons, broccoli, cherry tomaat en knoflookolie op de rand.', 'veggiedeluxe.png'),
(7, 'BBQ hot & spicy ', 15.49, 'Tomatensaus, mozzarella, rode ui, paprika, champignons, broccoli, cherry tomaat en knoflookolie op de rand.', 'bbqHS.jpg'),
(8, 'Pepperoni', 14.99, 'Tomatensaus, 3 soorten kaas, mozzarella, cheddar, Goudse en pepperoni. Met knoflookolie op de rand van de pizza.', 'pepperoni.jpg'),
(9, 'Hawaii', 15.49, 'Tomatensaus, mozzarella, ham (kalkoen), ananas en extra mozzarella en knoflookolie op de rand.', 'hawaii.jpg'),
(10, 'BBQ mixed grill', 16.49, 'BBQ saus, mozzarella, rode ui, paprika, pepperoni, natural chicken, chorizo, gehakt en knoflookolie op de rand.', 'bbqmixedgril.png');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `size` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `size`
--

INSERT INTO `size` (`id`, `size`) VALUES
(1, 'medium (25cm)'),
(2, 'large (35cm)'),
(3, 'calzone');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
