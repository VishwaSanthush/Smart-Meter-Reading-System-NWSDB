-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2023 at 07:28 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wbp`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` varchar(15) NOT NULL,
  `user_id` varchar(15) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` varchar(40) DEFAULT NULL,
  `user_id` varchar(15) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `account_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` varchar(15) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(50) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `account_no` varchar(50) DEFAULT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `account_no`, `category_id`, `is_active`, `address`, `mobile`, `created_at`) VALUES
('', '', NULL, NULL, 0, '', 0, '2023-06-07 17:08:04'),
('002', 'chamal adhikaram', NULL, NULL, 0, 'adhikarigama', 773310772, '2023-06-07 17:18:57'),
('003', 'kamal', NULL, NULL, 0, 'kandy', 742525123, '2023-06-07 17:22:59'),
('004', 'nimal', NULL, NULL, 0, 'colombo', 124578596, '2023-06-07 17:29:08'),
('005', 'sunil', NULL, NULL, 0, 'kegalle', 71452356, '2023-06-07 18:14:05'),
('006', 'chamodya', NULL, NULL, 0, 'mathale', 714256883, '2023-06-08 03:19:47'),
('007', 'manoj', NULL, NULL, 0, 'awissawella', 714523589, '2023-06-10 07:21:50'),
('008', 'udana', NULL, NULL, 0, 'kandy', 773310772, '2023-06-10 08:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `user_role_id` varchar(15) NOT NULL,
  `role_name` varchar(60) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usr`
--

CREATE TABLE `usr` (
  `user_id` varchar(15) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `user_role_id` varchar(15) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `view_acc_statement`
--

CREATE TABLE `view_acc_statement` (
  `customerID` int(10) NOT NULL,
  `accountNumber` int(10) NOT NULL,
  `no` int(100) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time(4) DEFAULT NULL,
  `meterReaderID` int(10) NOT NULL,
  `meterReading` int(10) NOT NULL,
  `comments` varchar(100) NOT NULL,
  `reference` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `view_acc_statement`
--

INSERT INTO `view_acc_statement` (`customerID`, `accountNumber`, `no`, `date`, `time`, `meterReaderID`, `meterReading`, `comments`, `reference`) VALUES
(10, 20, 1, '0000-00-00', '00:00:05.4500', 213110, 5589856, 'there is a leak on meter', 'siba campus pallekele'),
(10, 20, 3, '0000-00-00', '00:00:05.4500', 5253857, 585884, 'tahukanda', 'colombo'),
(10, 20, 6, '2023-05-31', '19:45:13.8602', 213110, 444558, 'there is no one in the home', 'kandy');

--
-- Triggers `view_acc_statement`
--
DELIMITER $$
CREATE TRIGGER `update_date_and_time` BEFORE INSERT ON `view_acc_statement` FOR EACH ROW BEGIN
    SET NEW.date = CURRENT_DATE();
    SET NEW.time = CURRENT_TIME(4);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `view_customer_details`
--

CREATE TABLE `view_customer_details` (
  `customerID` int(10) NOT NULL,
  `accountNumber` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` int(10) NOT NULL,
  `no` int(100) NOT NULL,
  `accounts` int(10) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `view_customer_details`
--

INSERT INTO `view_customer_details` (`customerID`, `accountNumber`, `name`, `phone`, `no`, `accounts`, `description`) VALUES
(10, 20, 'M.r chamal', 773310772, 1, 1, 'good'),
(11, 21, 'm.r adhikaram', 724300772, 2, 3, 'home acc,\r\noffice acc,\r\nshop acc .');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`user_role_id`);

--
-- Indexes for table `usr`
--
ALTER TABLE `usr`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_role_id` (`user_role_id`);

--
-- Indexes for table `view_acc_statement`
--
ALTER TABLE `view_acc_statement`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `view_customer_details`
--
ALTER TABLE `view_customer_details`
  ADD PRIMARY KEY (`customerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `view_acc_statement`
--
ALTER TABLE `view_acc_statement`
  MODIFY `no` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usr` (`user_id`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usr` (`user_id`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `usr`
--
ALTER TABLE `usr`
  ADD CONSTRAINT `usr_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `userrole` (`user_role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
