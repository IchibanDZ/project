-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 10, 2024 at 12:39 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myloc`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `id` int NOT NULL,
  `tool_borrowed_id` int NOT NULL,
  `borrower_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`id`, `tool_borrowed_id`, `borrower_id`, `start_date`, `end_date`) VALUES
(1, 1, 2, '2024-09-01', '2024-09-10'),
(2, 2, 3, '2024-08-15', '2024-08-25'),
(3, 3, 4, '2024-07-20', '2024-07-30'),
(4, 4, 5, '2024-06-10', '2024-06-20'),
(5, 5, 6, '2024-05-05', '2024-05-15'),
(6, 6, 7, '2024-04-01', '2024-04-10'),
(7, 7, 8, '2024-03-15', '2024-03-25'),
(8, 8, 9, '2024-02-10', '2024-02-20'),
(9, 9, 10, '2024-01-01', '2024-01-10'),
(10, 10, 1, '2023-12-01', '2023-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `icon`) VALUES
(1, 'Hand Tools', 'hand_tools_icon.png'),
(2, 'Power Tools', 'power_tools_icon.png'),
(3, 'Gardening Tools', 'gardening_tools_icon.png'),
(4, 'Electrical Tools', 'electrical_tools_icon.png'),
(5, 'Plumbing Tools', 'plumbing_tools_icon.png'),
(6, 'Woodworking Tools', 'woodworking_tools_icon.png'),
(7, 'Construction Tools', 'construction_tools_icon.png'),
(8, 'Automotive Tools', 'automotive_tools_icon.png'),
(9, 'Cleaning Tools', 'cleaning_tools_icon.png'),
(10, 'Safety Equipment', 'safety_equipment_icon.png');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20241007205651', '2024-10-09 18:12:37', 240),
('DoctrineMigrations\\Version20241007210126', '2024-10-09 18:12:38', 14);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tool`
--

CREATE TABLE `tool` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tool`
--

INSERT INTO `tool` (`id`, `category_id`, `owner_id`, `name`, `main_pic`, `pic2`, `pic3`, `description`) VALUES
(1, 1, 1, 'Hammer', 'hammer.jpg', 'hammer_side.jpg', 'hammer_back.jpg', 'A solid hammer for construction use'),
(2, 2, 2, 'Cordless Drill', 'cordless_drill.jpg', 'cordless_drill_side.jpg', 'cordless_drill_back.jpg', 'A powerful cordless drill for all jobs'),
(3, 3, 3, 'Shovel', 'shovel.jpg', 'shovel_side.jpg', 'shovel_back.jpg', 'Sturdy shovel for gardening'),
(4, 4, 4, 'Wire Cutter', 'wire_cutter.jpg', 'wire_cutter_side.jpg', 'wire_cutter_back.jpg', 'Sharp wire cutter for electrical jobs'),
(5, 5, 5, 'Pipe Wrench', 'pipe_wrench.jpg', 'pipe_wrench_side.jpg', 'pipe_wrench_back.jpg', 'Large pipe wrench for plumbing'),
(6, 6, 6, 'Chisel', 'chisel.jpg', 'chisel_side.jpg', 'chisel_back.jpg', 'Woodworking chisel for detailed work'),
(7, 7, 7, 'Jackhammer', 'jackhammer.jpg', 'jackhammer_side.jpg', 'jackhammer_back.jpg', 'Electric jackhammer for breaking concrete'),
(8, 8, 8, 'Car Jack', 'car_jack.jpg', 'car_jack_side.jpg', 'car_jack_back.jpg', 'Heavy-duty car jack for lifting vehicles'),
(9, 9, 9, 'Vacuum Cleaner', 'vacuum_cleaner.jpg', 'vacuum_cleaner_side.jpg', 'vacuum_cleaner_back.jpg', 'Powerful vacuum cleaner for industrial cleaning'),
(10, 10, 10, 'Safety Helmet', 'safety_helmet.jpg', 'safety_helmet_side.jpg', 'safety_helmet_back.jpg', 'Durable safety helmet for construction');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_points` int NOT NULL,
  `role` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `first_name`, `total_points`, `role`) VALUES
(1, 'john.doe@example.com', '\"ROLE_USER\"', 'password123', 'Doe', 'John', 0, '\"ROLE_USER\"'),
(2, 'jane.smith@example.com', '[\"ROLE_ADMIN\"]', 'password123', 'Smith', 'Jane', 0, '[\"ROLE_USER\"]'),
(3, 'emily.davis@example.com', '[\"ROLE_USER\"]', 'password123', 'Davis', 'Emily', 0, '[\"ROLE_USER\"]'),
(4, 'michael.johnson@example.com', '[\"ROLE_USER\"]', 'password123', 'Johnson', 'Michael', 0, '[\"ROLE_USER\"]'),
(5, 'david.wilson@example.com', '[\"ROLE_USER\"]', 'password123', 'Wilson', 'David', 0, '[\"ROLE_USER\"]'),
(6, 'sarah.brown@example.com', '[\"ROLE_USER\"]', 'password123', 'Brown', 'Sarah', 0, '[\"ROLE_USER\"]'),
(7, 'daniel.taylor@example.com', '[\"ROLE_USER\"]', 'password123', 'Taylor', 'Daniel', 0, '[\"ROLE_USER\"]'),
(8, 'laura.lee@example.com', '[\"ROLE_USER\"]', 'password123', 'Lee', 'Laura', 0, '[\"ROLE_USER\"]'),
(9, 'robert.walker@example.com', '[\"ROLE_USER\"]', 'password123', 'Walker', 'Robert', 0, '[\"ROLE_USER\"]'),
(10, 'linda.white@example.com', '[\"ROLE_USER\"]', 'password123', 'White', 'Linda', 0, '[\"ROLE_USER\"]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_55DBA8B0FE8E2736` (`tool_borrowed_id`),
  ADD KEY `IDX_55DBA8B011CE312B` (`borrower_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `tool`
--
ALTER TABLE `tool`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_20F33ED112469DE2` (`category_id`),
  ADD KEY `IDX_20F33ED17E3C61F9` (`owner_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tool`
--
ALTER TABLE `tool`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `FK_55DBA8B011CE312B` FOREIGN KEY (`borrower_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_55DBA8B0FE8E2736` FOREIGN KEY (`tool_borrowed_id`) REFERENCES `tool` (`id`);

--
-- Constraints for table `tool`
--
ALTER TABLE `tool`
  ADD CONSTRAINT `FK_20F33ED112469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_20F33ED17E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
