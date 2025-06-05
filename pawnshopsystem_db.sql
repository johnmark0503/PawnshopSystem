-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2025 at 07:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pawnshopsystem_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `pawn_items`
--

CREATE TABLE `pawn_items` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pawn_value` decimal(10,2) DEFAULT NULL,
  `pawn_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('Pawned','Redeemed','Forfeited') DEFAULT 'Pawned',
  `balance` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pawn_items`
--

INSERT INTO `pawn_items` (`id`, `customer_name`, `item_name`, `description`, `pawn_value`, `pawn_date`, `due_date`, `status`, `balance`) VALUES
(25, 'John Mark Crisanto', 'Ring', '18K gold ring', 6000.00, '2025-05-31', '2025-06-29', 'Redeemed', 0.00),
(26, 'Ralph Joshua Olanio', 'DSLR Camera', 'Nikon D3500 with 18-55m lens', 14000.00, '2025-05-29', '2025-06-29', 'Pawned', 15400.00),
(27, 'Mark Lester Aquino', 'Smartwatch', 'Samsung Glaxy Watch 4, 44mm', 30000.00, '2025-05-30', '2025-06-29', 'Pawned', 33000.00),
(28, 'Laurence Carrasco', 'Tablet', 'Huawei MatePad T10,64GB', 5000.00, '2025-05-30', '2025-06-30', 'Pawned', 5500.00),
(29, 'Jozel Viernes', 'Jewelry Set', '18K gold necklace and earrings, total 18g', 35000.00, '2025-05-30', '2025-06-30', 'Pawned', 38500.00),
(30, 'April Rose Villedo', 'Gamig Mouse', 'Razer DeathAdder Essential wired mouse', 1000.00, '2025-05-30', '2025-06-15', 'Pawned', 1100.00),
(31, 'Aquino Mark Lester', 'Gold Ring', 'shining', 5000.00, '2025-05-30', '2025-06-01', 'Pawned', 5500.00),
(32, 'Francine Amponget', 'Watch', 'Seiko 5 automatic wristwatch', 3500.00, '2025-06-01', '2025-07-01', 'Pawned', 3850.00),
(33, 'Daniel Padilla', 'Wedding Ring', 'Pair of 18K wedding bands with diamonds', 15000.00, '2025-06-01', '2025-07-01', 'Redeemed', 0.00),
(34, 'Kathryn Bernardo', 'Bracelet', '21K gold bracelet, 10 grams', 21000.00, '2025-06-01', '2025-08-01', 'Pawned', 25200.00),
(35, 'ryan jay', 'watch', '2012 rolex', 15000.00, '2025-06-02', '2025-07-02', 'Pawned', 250.00),
(36, 'ryan jay', 'watch', 'rolex', 17000.00, '2025-06-02', '2025-07-05', 'Redeemed', 0.00),
(37, 'John Kim Leo Mercado', 'Cellphone', 'iPhone 16 Pro Max 1TB', 75000.00, '2025-06-04', '2025-08-04', 'Pawned', 90000.00);

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions`
--

CREATE TABLE `payment_transactions` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  `balance_after` double DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_transactions`
--

INSERT INTO `payment_transactions` (`id`, `item_id`, `customer_name`, `item_name`, `payment_amount`, `balance_after`, `status`, `payment_date`) VALUES
(33, 33, 'Daniel Padilla', 'Wedding Ring', 6500, 10000, 'Pawned', '2025-06-01 17:44:14'),
(34, 33, 'Daniel Padilla', 'Wedding Ring', 5000, 5000, 'Pawned', '2025-06-01 19:04:08'),
(35, 33, 'Daniel Padilla', 'Wedding Ring', 5000, 0, 'Redeemed', '2025-06-01 22:25:10'),
(36, 25, 'John Mark Crisanto', 'Ring', 600, 6000, 'Pawned', '2025-06-01 22:28:59'),
(37, 25, 'John Mark Crisanto', 'Ring', 6000, 0, 'Redeemed', '2025-06-01 22:34:14'),
(38, 36, 'ryan jay', 'watch', 18700, 0, 'Redeemed', '2025-06-02 06:35:49'),
(39, 35, 'ryan jay', 'watch', 16000, 500, 'Pawned', '2025-06-02 06:37:05'),
(40, 35, 'ryan jay', 'watch', 250, 250, 'Pawned', '2025-06-02 06:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pawn_items`
--
ALTER TABLE `pawn_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pawn_items`
--
ALTER TABLE `pawn_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
