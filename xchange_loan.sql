-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 04, 2018 at 08:07 AM
-- Server version: 5.6.39-83.1
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xchange_loan`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'zDi3W7SMOveuaAaw60aGXjyot3izVIuW', 1, '2017-08-07 08:51:00', '2017-08-07 08:51:00', '2017-08-07 08:51:00'),
(2, 2, 'PKNCZHvuFAktpVNnj2IFUcgPynbRnOyk', 1, '2017-10-24 06:36:45', '2017-10-24 06:36:45', '2017-10-24 06:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `asset_type_id` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `replacement_value` decimal(10,2) DEFAULT NULL,
  `serial_number` text COLLATE utf8_unicode_ci,
  `bought_from` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `user_id`, `asset_type_id`, `purchase_date`, `purchase_price`, `replacement_value`, `serial_number`, `bought_from`, `notes`, `files`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, 1, 1, '2014-02-07', '190000.00', '100000.00', '7410', NULL, 'black', 'a:0:{}', '2017-11-05 18:47:28', '2017-11-05 18:47:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `asset_types`
--

CREATE TABLE `asset_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `type` enum('current','fixed','intangible','investment','other') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `asset_types`
--

INSERT INTO `asset_types` (`id`, `name`, `type`) VALUES
(1, 'Furniture and fixtures', 'fixed'),
(2, 'Goodwill', 'intangible'),
(3, 'Interest receivable', 'current'),
(4, 'Prepaid tax', 'current'),
(5, 'Bonds and treasuries', 'current');

-- --------------------------------------------------------

--
-- Table structure for table `asset_valuations`
--

CREATE TABLE `asset_valuations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `asset_valuations`
--

INSERT INTO `asset_valuations` (`id`, `user_id`, `asset_id`, `date`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-11-05', '100000.00', '2017-11-05 18:47:28', '2017-11-05 18:47:28');

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `audit_trail`
--

INSERT INTO `audit_trail` (`id`, `user_id`, `user`, `module`, `notes`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-10-24 06:32:28', '2017-10-24 06:32:28', NULL),
(2, 1, 'Admin Admin', NULL, 'Added  bulk repayment', '2017-10-24 06:35:09', '2017-10-24 06:35:09', 1),
(3, 1, 'Admin Admin', NULL, 'Added user with id:2', '2017-10-24 06:36:45', '2017-10-24 06:36:45', 1),
(4, 1, 'Admin Admin', NULL, 'Added borrower  with id:1', '2017-10-24 08:16:03', '2017-10-24 08:16:03', 1),
(5, 1, 'Admin Admin', NULL, 'Logged out of system', '2017-10-24 08:16:17', '2017-10-24 08:16:17', 1),
(6, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-10-24 17:58:30', '2017-10-24 17:58:30', NULL),
(7, 1, 'Admin Admin', NULL, 'Logged out of system', '2017-10-24 17:59:45', '2017-10-24 17:59:45', 1),
(8, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-10-24 18:10:15', '2017-10-24 18:10:15', NULL),
(9, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-10-24 19:21:30', '2017-10-24 19:21:30', NULL),
(10, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-10-24 19:24:53', '2017-10-24 19:24:53', 1),
(11, 1, 'Admin Admin', NULL, 'Added borrower  with id:2', '2017-10-24 19:53:25', '2017-10-24 19:53:25', 1),
(12, 1, 'Admin Admin', NULL, 'Declined borrower  with id:2', '2017-10-24 19:54:18', '2017-10-24 19:54:18', 1),
(13, 1, 'Admin Admin', NULL, 'Approved borrower  with id:2', '2017-10-24 19:54:29', '2017-10-24 19:54:29', 1),
(14, 1, 'Admin Admin', NULL, 'Updated Settings', '2017-10-24 20:09:03', '2017-10-24 20:09:03', 1),
(15, 1, 'Admin Admin', NULL, 'Added loan product with id:1', '2017-10-24 20:26:11', '2017-10-24 20:26:11', 1),
(16, 1, 'Admin Admin', NULL, 'Added loan with id:1', '2017-10-24 20:29:08', '2017-10-24 20:29:08', 1),
(17, 1, 'Admin Admin', NULL, 'Declined loan with id:1', '2017-10-24 20:43:59', '2017-10-24 20:43:59', 1),
(18, 1, 'Admin Admin', NULL, 'Sent email to borrower ', '2017-10-24 20:44:52', '2017-10-24 20:44:52', 1),
(19, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-10-25 13:38:49', '2017-10-25 13:38:49', NULL),
(20, 1, 'Admin Admin', NULL, 'Added borrower  with id:3', '2017-10-25 14:13:40', '2017-10-25 14:13:40', 1),
(21, 1, 'Admin Admin', NULL, 'Updated Settings', '2017-10-25 14:47:17', '2017-10-25 14:47:17', 1),
(22, 1, 'Admin Admin', NULL, 'Updated Settings', '2017-10-25 14:47:54', '2017-10-25 14:47:54', 1),
(23, 1, 'Admin Admin', NULL, 'Added Capital  with id:1', '2017-10-25 14:57:33', '2017-10-25 14:57:33', 1),
(24, 1, 'Admin Admin', NULL, 'Added loan with id:2', '2017-10-25 15:32:04', '2017-10-25 15:32:04', 1),
(25, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-10-25 15:37:58', '2017-10-25 15:37:58', NULL),
(26, 1, 'Admin Admin', NULL, 'Approved loan with id:2', '2017-10-25 16:18:16', '2017-10-25 16:18:16', 1),
(27, 1, 'Admin Admin', NULL, 'Disbursed loan with id:2', '2017-10-25 16:18:40', '2017-10-25 16:18:40', 1),
(28, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-10-25 20:47:51', '2017-10-25 20:47:51', NULL),
(29, 1, 'Admin Admin', NULL, 'Added borrower  with id:4', '2017-10-25 21:07:15', '2017-10-25 21:07:15', 1),
(30, 1, 'Admin Admin', NULL, 'Updated borrower  with id:4', '2017-10-25 21:08:23', '2017-10-25 21:08:23', 1),
(31, 1, 'Admin Admin', NULL, 'Added loan product with id:2', '2017-10-25 21:35:06', '2017-10-25 21:35:06', 1),
(32, 1, 'Admin Admin', NULL, 'Added loan with id:3', '2017-10-25 23:02:27', '2017-10-25 23:02:27', 1),
(33, 1, 'Admin Admin', NULL, 'Updated loan with id:3', '2017-10-25 23:03:27', '2017-10-25 23:03:27', 1),
(34, 1, 'Admin Admin', NULL, 'Added Capital  with id:2', '2017-10-25 23:25:56', '2017-10-25 23:25:56', 1),
(35, 1, 'Admin Admin', NULL, 'Added expense with id:1', '2017-10-25 23:35:18', '2017-10-25 23:35:18', 1),
(36, 1, 'Admin Admin', NULL, 'Added other income with id:1', '2017-10-25 23:38:04', '2017-10-25 23:38:04', 1),
(37, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-10-27 13:34:23', '2017-10-27 13:34:23', NULL),
(38, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-10-27 14:28:32', '2017-10-27 14:28:32', NULL),
(39, 1, 'Admin Admin', NULL, 'Added borrower  with id:5', '2017-10-27 14:48:57', '2017-10-27 14:48:57', 1),
(40, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-10-27 14:56:12', '2017-10-27 14:56:12', NULL),
(41, 1, 'Admin Admin', NULL, 'Added loan with id:4', '2017-10-27 15:13:57', '2017-10-27 15:13:57', 1),
(42, 1, 'Admin Admin', NULL, 'Updated loan product with id:2', '2017-10-27 15:19:52', '2017-10-27 15:19:52', 1),
(43, 1, 'Admin Admin', NULL, 'Added loan with id:5', '2017-10-27 15:22:39', '2017-10-27 15:22:39', 1),
(44, 1, 'Admin Admin', NULL, 'Added loan with id:6', '2017-10-27 16:11:16', '2017-10-27 16:11:16', 1),
(45, 1, 'Admin Admin', NULL, 'Approved loan with id:3', '2017-10-27 16:54:11', '2017-10-27 16:54:11', 1),
(46, 1, 'Admin Admin', NULL, 'Added collateral  with id:1', '2017-10-27 17:15:34', '2017-10-27 17:15:34', 1),
(47, 1, 'Admin Admin', NULL, 'Approved loan with id:6', '2017-10-27 17:16:50', '2017-10-27 17:16:50', 1),
(48, 1, 'Admin Admin', NULL, 'Disbursed loan with id:6', '2017-10-27 17:17:59', '2017-10-27 17:17:59', 1),
(49, 1, 'Admin Admin', NULL, 'Updated loan with id:6', '2017-10-27 17:24:38', '2017-10-27 17:24:38', 1),
(50, 1, 'Admin Admin', NULL, 'Updated loan with id:6', '2017-10-27 17:25:08', '2017-10-27 17:25:08', 1),
(51, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-01 19:42:59', '2017-11-01 19:42:59', NULL),
(52, 1, 'Admin Admin', NULL, 'Logged out of system', '2017-11-01 20:06:11', '2017-11-01 20:06:11', 1),
(53, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-01 20:38:56', '2017-11-01 20:38:56', 1),
(54, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-02 11:02:25', '2017-11-02 11:02:25', NULL),
(55, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-02 15:16:49', '2017-11-02 15:16:49', NULL),
(56, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-02 17:46:48', '2017-11-02 17:46:48', NULL),
(57, 1, 'Admin Admin', NULL, 'Sent email to borrower ', '2017-11-02 18:40:51', '2017-11-02 18:40:51', 1),
(58, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-02 19:17:01', '2017-11-02 19:17:01', NULL),
(59, 1, 'Admin Admin', NULL, 'Added repayment for loan with id:2', '2017-11-02 19:21:49', '2017-11-02 19:21:49', 1),
(60, 1, 'Admin Admin', NULL, 'Disbursed loan with id:3', '2017-11-02 19:35:12', '2017-11-02 19:35:12', 1),
(61, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-03 17:12:56', '2017-11-03 17:12:56', NULL),
(62, 1, 'Admin Admin', NULL, 'Added  bulk repayment', '2017-11-03 17:45:41', '2017-11-03 17:45:41', 1),
(63, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-03 17:51:48', '2017-11-03 17:51:48', NULL),
(64, 1, 'Admin Admin', NULL, 'Declined borrower  with id:1', '2017-11-03 19:13:28', '2017-11-03 19:13:28', 1),
(65, 1, 'Admin Admin', NULL, 'Approved borrower  with id:1', '2017-11-03 19:13:38', '2017-11-03 19:13:38', 1),
(66, 1, 'Admin Admin', NULL, 'Added expense with id:2', '2017-11-03 20:28:41', '2017-11-03 20:28:41', 1),
(67, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-04 21:11:53', '2017-11-04 21:11:53', NULL),
(68, 1, 'Admin Admin', NULL, 'Added asset  with id:1', '2017-11-05 18:47:28', '2017-11-05 18:47:28', 1),
(69, 1, 'Admin Admin', NULL, 'Sent email to borrower ', '2017-11-05 18:56:15', '2017-11-05 18:56:15', 1),
(70, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-07 20:07:30', '2017-11-07 20:07:30', NULL),
(71, 1, 'Admin Admin', NULL, 'Added loan with id:7', '2017-11-07 20:15:03', '2017-11-07 20:15:03', 1),
(72, 1, 'Admin Admin', NULL, 'Approved loan with id:7', '2017-11-07 20:18:30', '2017-11-07 20:18:30', 1),
(73, 1, 'Admin Admin', NULL, 'Disbursed loan with id:7', '2017-11-07 20:19:30', '2017-11-07 20:19:30', 1),
(74, 1, 'Admin Admin', NULL, 'Deleted loan with id:7', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(75, 1, 'Admin Admin', NULL, 'Deleted loan with id:6', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(76, 1, 'Admin Admin', NULL, 'Updated loan with id:3', '2017-11-09 19:26:56', '2017-11-09 19:26:56', 1),
(77, 1, 'Admin Admin', NULL, 'Updated loan product with id:2', '2017-11-09 19:33:49', '2017-11-09 19:33:49', 1),
(78, 1, 'Admin Admin', NULL, 'Logged in to system', '2017-11-09 21:59:35', '2017-11-09 21:59:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `name`, `notes`) VALUES
(1, 'CRDB Bank', 'Tawi la Mlimani city');

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `loan_officers` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` enum('online','admin') COLLATE utf8_unicode_ci DEFAULT 'admin',
  `active` tinyint(4) DEFAULT '1',
  `blacklisted` tinyint(4) DEFAULT '0',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `country`, `title`, `mobile`, `email`, `unique_number`, `dob`, `address`, `city`, `state`, `zip`, `phone`, `business_name`, `working_status`, `photo`, `notes`, `files`, `loan_officers`, `created_at`, `updated_at`, `deleted_at`, `username`, `password`, `month`, `year`, `source`, `active`, `blacklisted`, `branch_id`) VALUES
(1, 1, 'Venance', 'Edson', 'Male', 'Tanzania', 'Mr', '717222303', 'robilin2@yahoo.com', '', '2016-09-02', 'P.O.BOX 54684', 'Dar es salaam', 'Tanzania', '255', '717222303', 'Riverton limited', 'Employee', NULL, '', 'a:0:{}', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}', '2017-10-24 08:16:03', '2017-11-03 19:13:38', NULL, 'vedson', '61296a2143e1adb4723f4ab5e98af8ee', '10', '2017', 'admin', 1, 0, 1),
(2, 1, 'ABEL', 'KINDOROKO MVUNGI', 'Male', 'TANZANIA', 'Mr', '255715001122', 'amvungi@triplemalengo.com', '100', '2013-10-06', 'p.o.box 76302', 'DAR ES SALAAM', 'DAR', '', '255715001122', 'STATIONARY', 'Employee', NULL, '', 'a:0:{}', 'a:1:{i:0;s:1:\"2\";}', '2017-10-24 19:53:25', '2017-10-24 19:54:29', NULL, '', NULL, '10', '2017', 'admin', 1, 0, 1),
(3, 1, 'Innocent', 'Chimpaye', 'Male', 'Tanzania', 'Mr', '0712012939', 'ichimpaye@gmail.com', '001', '1999-02-07', 'Dar free market mall plot no1904 Oysterbay', 'Dar es salaam', 'Dar es salaam', '255', '0712012939', 'IT Company', 'Owner', NULL, 'Owner of IT and telecom company called Tembotel East Africa limited', 'a:0:{}', 'N;', '2017-10-25 14:13:40', '2017-10-25 14:13:40', NULL, 'chimpaye', 'b693d6437d40aa024c4b6792cc66375c', '10', '2017', 'admin', 1, 0, 1),
(4, 1, 'Mill', 'Bill', 'Female', 'Tanzania', 'Miss', '+255743750057', 'millbill@gmail.com', '0002', '1982/01/09', 'P.O BOX 35, Kasulu', 'Kigoma', 'Kigoma', '25528', '+255222666775', 'Real Estate', 'Owner', NULL, 'Mill Bill is a real estate mogul  at Kasulu. She has managed a business for 10 years now after inheriting it from her father.', 'a:0:{}', 'N;', '2017-10-25 21:07:15', '2017-10-25 21:08:23', NULL, '', NULL, '10', '2017', 'admin', 1, 0, 1),
(5, 1, 'YUNUS', 'OMMAR', 'Male', 'Tanzania', 'Mr', '0716890110', 'yunusyunu@gmail.com', '2', '1992-08-14', 'mbezi', 'dar-es-salaam', 'dar-es-salaam', '25522', '', '', 'Employee', NULL, '', 'a:0:{}', 'N;', '2017-10-27 14:48:57', '2017-10-27 14:48:57', NULL, '', NULL, '10', '2017', 'admin', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrower_groups`
--

CREATE TABLE `borrower_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_borrowers` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `borrower_groups`
--

INSERT INTO `borrower_groups` (`id`, `name`, `assigned_borrowers`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'Ff', NULL, 'fd', '2017-09-02 14:04:50', '2017-09-02 14:04:50'),
(2, 'Tembotel', NULL, 'Kundi hili ni la vijana wabunifu katika teknolojia, wanaitaji kupata mikopo kuwezesha shughuli zao', '2017-10-25 14:20:00', '2017-10-25 14:20:00'),
(3, 'Corporate Bodies', NULL, 'Bodies managed by BOD on behalf of owners. Borrowing power of the entity is vested in the BOD', '2017-10-25 21:10:05', '2017-10-25 21:10:05'),
(4, 'Individuals', NULL, 'Natural person majority of age, not bankrupt and with a reasonable background', '2017-10-25 21:11:31', '2017-10-25 21:11:31'),
(5, 'Proprietaries', NULL, 'Business units owned by individuals with no formal business structure', '2017-10-25 21:15:22', '2017-10-25 21:15:22'),
(6, 'vikoba', NULL, 'ni group la wanawake 20', '2017-10-27 14:55:08', '2017-10-27 14:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `borrower_group_members`
--

CREATE TABLE `borrower_group_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `borrower_group_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `borrower_group_members`
--

INSERT INTO `borrower_group_members` (`id`, `borrower_group_id`, `borrower_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '2017-09-02 14:44:30', '2017-09-02 14:44:30'),
(3, 2, 3, '2017-11-01 20:41:14', '2017-11-01 20:41:14'),
(4, 2, 2, '2017-11-01 20:42:17', '2017-11-01 20:42:17'),
(5, 2, 4, '2017-11-01 20:42:52', '2017-11-01 20:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_users` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `default_branch` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `assigned_users`, `notes`, `default_branch`) VALUES
(1, 'Default', NULL, NULL, 1),
(3, 'dar', NULL, 'test', 0),
(4, 'KINYELEZI', NULL, 'KINYELEZI NEAR BUS STAND', 0),
(5, 'City Center', NULL, 'Garden Avenue-Opposite to PPF Tower', 0),
(6, 'xyz', NULL, 'dodoma ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `branch_users`
--

CREATE TABLE `branch_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `branch_users`
--

INSERT INTO `branch_users` (`id`, `branch_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-10-13 14:35:47', '2017-10-13 14:35:47');

-- --------------------------------------------------------

--
-- Table structure for table `capital`
--

CREATE TABLE `capital` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `bank_account_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `capital`
--

INSERT INTO `capital` (`id`, `user_id`, `date`, `amount`, `year`, `month`, `notes`, `created_at`, `updated_at`, `branch_id`, `bank_account_id`) VALUES
(1, 1, '2017-10-25', '99999999.99', '2017', '10', 'Investment capital', '2017-10-25 14:57:33', '2017-10-25 14:57:33', 1, 1),
(2, 1, '2017-10-01', '99999999.99', '2017', '10', 'Acquisition', '2017-10-25 23:25:56', '2017-10-25 23:25:56', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `collateral`
--

CREATE TABLE `collateral` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `collateral_type_id` int(10) UNSIGNED DEFAULT NULL,
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('returned_to_borrower','repossessed','repossession_initiated','sold','lost','collateral_with_borrower','deposited_into_branch') COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `photo` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `serial_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `collateral`
--

INSERT INTO `collateral` (`id`, `name`, `loan_id`, `borrower_id`, `collateral_type_id`, `value`, `date`, `year`, `status`, `month`, `notes`, `photo`, `files`, `serial_number`, `model_name`, `model_number`, `manufacture_date`, `created_at`, `updated_at`) VALUES
(1, 'Kiwanja', 6, 2, 1, '30000000.00', '2017-09-26', '2017', 'deposited_into_branch', '09', NULL, NULL, 'a:0:{}', '', '', '', '0000-00-00', '2017-10-27 17:15:34', '2017-10-27 17:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `collateral_types`
--

CREATE TABLE `collateral_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `collateral_types`
--

INSERT INTO `collateral_types` (`id`, `name`) VALUES
(1, 'House'),
(2, 'Land'),
(3, 'Shares/bonds'),
(4, 'Fixed deposit'),
(5, 'Insurance policy'),
(6, 'Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `sortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `sortname`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'AS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua And Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas The'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CD', 'Congo The Democratic Republic Of The'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)'),
(54, 'HR', 'Croatia (Hrvatska)'),
(55, 'CU', 'Cuba'),
(56, 'CY', 'Cyprus'),
(57, 'CZ', 'Czech Republic'),
(58, 'DK', 'Denmark'),
(59, 'DJ', 'Djibouti'),
(60, 'DM', 'Dominica'),
(61, 'DO', 'Dominican Republic'),
(62, 'TP', 'East Timor'),
(63, 'EC', 'Ecuador'),
(64, 'EG', 'Egypt'),
(65, 'SV', 'El Salvador'),
(66, 'GQ', 'Equatorial Guinea'),
(67, 'ER', 'Eritrea'),
(68, 'EE', 'Estonia'),
(69, 'ET', 'Ethiopia'),
(70, 'XA', 'External Territories of Australia'),
(71, 'FK', 'Falkland Islands'),
(72, 'FO', 'Faroe Islands'),
(73, 'FJ', 'Fiji Islands'),
(74, 'FI', 'Finland'),
(75, 'FR', 'France'),
(76, 'GF', 'French Guiana'),
(77, 'PF', 'French Polynesia'),
(78, 'TF', 'French Southern Territories'),
(79, 'GA', 'Gabon'),
(80, 'GM', 'Gambia The'),
(81, 'GE', 'Georgia'),
(82, 'DE', 'Germany'),
(83, 'GH', 'Ghana'),
(84, 'GI', 'Gibraltar'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'XU', 'Guernsey and Alderney'),
(92, 'GN', 'Guinea'),
(93, 'GW', 'Guinea-Bissau'),
(94, 'GY', 'Guyana'),
(95, 'HT', 'Haiti'),
(96, 'HM', 'Heard and McDonald Islands'),
(97, 'HN', 'Honduras'),
(98, 'HK', 'Hong Kong S.A.R.'),
(99, 'HU', 'Hungary'),
(100, 'IS', 'Iceland'),
(101, 'IN', 'India'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'JM', 'Jamaica'),
(109, 'JP', 'Japan'),
(110, 'XJ', 'Jersey'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea North'),
(116, 'KR', 'Korea South'),
(117, 'KW', 'Kuwait'),
(118, 'KG', 'Kyrgyzstan'),
(119, 'LA', 'Laos'),
(120, 'LV', 'Latvia'),
(121, 'LB', 'Lebanon'),
(122, 'LS', 'Lesotho'),
(123, 'LR', 'Liberia'),
(124, 'LY', 'Libya'),
(125, 'LI', 'Liechtenstein'),
(126, 'LT', 'Lithuania'),
(127, 'LU', 'Luxembourg'),
(128, 'MO', 'Macau S.A.R.'),
(129, 'MK', 'Macedonia'),
(130, 'MG', 'Madagascar'),
(131, 'MW', 'Malawi'),
(132, 'MY', 'Malaysia'),
(133, 'MV', 'Maldives'),
(134, 'ML', 'Mali'),
(135, 'MT', 'Malta'),
(136, 'XM', 'Man (Isle of)'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'YT', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia'),
(144, 'MD', 'Moldova'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'MS', 'Montserrat'),
(148, 'MA', 'Morocco'),
(149, 'MZ', 'Mozambique'),
(150, 'MM', 'Myanmar'),
(151, 'NA', 'Namibia'),
(152, 'NR', 'Nauru'),
(153, 'NP', 'Nepal'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NL', 'Netherlands The'),
(156, 'NC', 'New Caledonia'),
(157, 'NZ', 'New Zealand'),
(158, 'NI', 'Nicaragua'),
(159, 'NE', 'Niger'),
(160, 'NG', 'Nigeria'),
(161, 'NU', 'Niue'),
(162, 'NF', 'Norfolk Island'),
(163, 'MP', 'Northern Mariana Islands'),
(164, 'NO', 'Norway'),
(165, 'OM', 'Oman'),
(166, 'PK', 'Pakistan'),
(167, 'PW', 'Palau'),
(168, 'PS', 'Palestinian Territory Occupied'),
(169, 'PA', 'Panama'),
(170, 'PG', 'Papua new Guinea'),
(171, 'PY', 'Paraguay'),
(172, 'PE', 'Peru'),
(173, 'PH', 'Philippines'),
(174, 'PN', 'Pitcairn Island'),
(175, 'PL', 'Poland'),
(176, 'PT', 'Portugal'),
(177, 'PR', 'Puerto Rico'),
(178, 'QA', 'Qatar'),
(179, 'RE', 'Reunion'),
(180, 'RO', 'Romania'),
(181, 'RU', 'Russia'),
(182, 'RW', 'Rwanda'),
(183, 'SH', 'Saint Helena'),
(184, 'KN', 'Saint Kitts And Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'PM', 'Saint Pierre and Miquelon'),
(187, 'VC', 'Saint Vincent And The Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'XG', 'Smaller Territories of the UK'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia'),
(204, 'SS', 'South Sudan'),
(205, 'ES', 'Spain'),
(206, 'LK', 'Sri Lanka'),
(207, 'SD', 'Sudan'),
(208, 'SR', 'Suriname'),
(209, 'SJ', 'Svalbard And Jan Mayen Islands'),
(210, 'SZ', 'Swaziland'),
(211, 'SE', 'Sweden'),
(212, 'CH', 'Switzerland'),
(213, 'SY', 'Syria'),
(214, 'TW', 'Taiwan'),
(215, 'TJ', 'Tajikistan'),
(216, 'TZ', 'Tanzania'),
(217, 'TH', 'Thailand'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad And Tobago'),
(222, 'TN', 'Tunisia'),
(223, 'TR', 'Turkey'),
(224, 'TM', 'Turkmenistan'),
(225, 'TC', 'Turks And Caicos Islands'),
(226, 'TV', 'Tuvalu'),
(227, 'UG', 'Uganda'),
(228, 'UA', 'Ukraine'),
(229, 'AE', 'United Arab Emirates'),
(230, 'GB', 'United Kingdom'),
(231, 'US', 'United States'),
(232, 'UM', 'United States Minor Outlying Islands'),
(233, 'UY', 'Uruguay'),
(234, 'UZ', 'Uzbekistan'),
(235, 'VU', 'Vanuatu'),
(236, 'VA', 'Vatican City State (Holy See)'),
(237, 'VE', 'Venezuela'),
(238, 'VN', 'Vietnam'),
(239, 'VG', 'Virgin Islands (British)'),
(240, 'VI', 'Virgin Islands (US)'),
(241, 'WF', 'Wallis And Futuna Islands'),
(242, 'EH', 'Western Sahara'),
(243, 'YE', 'Yemen'),
(244, 'YU', 'Yugoslavia'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` enum('number','textfield','date','decimal','textarea') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'textfield',
  `required` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_meta`
--

CREATE TABLE `custom_fields_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `recipients` int(10) UNSIGNED NOT NULL,
  `send_to` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `user_id`, `subject`, `message`, `recipients`, `send_to`, `notes`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, 1, 'testtest', '<p>yehooo</p>', 1, 'Venance Edson()', NULL, '2017-10-24 20:44:52', '2017-10-24 20:44:52', 1),
(2, 1, 'wertyuiop[', '<p>asdfghjkl;xcvbnm,./</p>', 1, 'Innocent Chimpaye(001)', NULL, '2017-11-02 18:40:51', '2017-11-02 18:40:51', 1),
(3, 1, 'Client Statement', '<p>Dear Innocent, find attached statement of your loans with us. Thank you</p>', 1, 'Innocent Chimpaye(001)', NULL, '2017-11-02 18:49:38', '2017-11-02 18:49:38', NULL),
(4, 1, 'Loan Statement', '<p>Dear Innocent, find attached loan statement for loan 2. Thank you</p>', 1, 'Innocent Chimpaye(001)', NULL, '2017-11-02 18:51:02', '2017-11-02 18:51:02', NULL),
(5, 1, NULL, '<p>Dear Innocent, we have received your payment of $200000.00 for loan #2. New loan balance:$1160720.06. Thank you</p>', 1, 'Innocent Chimpaye(001)', NULL, '2017-11-02 19:21:49', '2017-11-02 19:21:49', NULL),
(6, 1, 'Congratulations', '<p><span style=\"color: #008000;\">Hello Innocent.</span></p>\r\n<p><span style=\"color: #008000;\">We would like to take this chance to congratulate on your wedding anniversary</span></p>\r\n<p><span style=\"color: #008000;\">May God protect your marriage and make your family goals come true</span></p>\r\n<p><span style=\"color: #008000;\">With best regards</span></p>', 1, 'Innocent Chimpaye(001)', NULL, '2017-11-05 18:56:15', '2017-11-05 18:56:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_type_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurring` tinyint(4) NOT NULL DEFAULT '0',
  `recur_frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '31',
  `recur_start_date` date DEFAULT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_next_date` date DEFAULT NULL,
  `recur_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'month',
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `user_id`, `expense_type_id`, `amount`, `date`, `year`, `month`, `recurring`, `recur_frequency`, `recur_start_date`, `recur_end_date`, `recur_next_date`, `recur_type`, `notes`, `files`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, NULL, 2, '70000.00', '2017-10-26', '2017', '10', 1, '2', '2017-10-25', '2018-08-25', '2017-11-08', 'week', '', 'a:0:{}', '2017-10-25 23:35:18', '2017-10-25 23:35:18', 1),
(2, NULL, 4, '12340.00', '2017-11-03', '2017', '11', 1, '1', '2017-11-03', '2017-12-03', '2017-12-03', 'month', 'From zam zam\r\n', 'a:0:{}', '2017-11-03 20:28:41', '2017-11-03 20:28:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

CREATE TABLE `expense_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expense_types`
--

INSERT INTO `expense_types` (`id`, `name`) VALUES
(1, 'Utilities'),
(2, 'Sandry'),
(3, 'Postage'),
(4, 'Stationary'),
(5, 'Transport');

-- --------------------------------------------------------

--
-- Table structure for table `guarantor`
--

CREATE TABLE `guarantor` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `loan_application_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `guarantor_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `saving_amount` decimal(10,2) DEFAULT NULL,
  `accepted_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','accepted','declined') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `saving_status` enum('pending','hold','restored') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `saving_restored` tinyint(4) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) NOT NULL,
  `loan_product_id` int(11) NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `maturity_date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interest_start_date` date DEFAULT NULL,
  `first_payment_date` date DEFAULT NULL,
  `loan_disbursed_by_id` int(11) DEFAULT NULL,
  `principal` decimal(10,4) DEFAULT NULL,
  `interest_method` enum('flat_rate','declining_balance_equal_installments','declining_balance_equal_principal','interest_only','compound_interest') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'flat_rate',
  `interest_rate` decimal(10,4) DEFAULT NULL,
  `interest_period` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'day',
  `override_interest` tinyint(4) NOT NULL DEFAULT '0',
  `override_interest_amount` decimal(10,4) DEFAULT '0.0000',
  `loan_duration` int(11) DEFAULT NULL,
  `loan_duration_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `repayment_cycle` enum('daily','weekly','monthly','bi_monthly','quarterly','semi_annually','annually') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'monthly',
  `decimal_places` enum('round_off_to_two_decimal','round_off_to_integer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'round_off_to_two_decimal',
  `repayment_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_fees_schedule` enum('dont_include','distribute_fees_evenly','charge_fees_on_released_date','charge_fees_on_first_payment','charge_fees_on_last_payment') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'distribute_fees_evenly',
  `grace_on_interest_charged` int(11) DEFAULT NULL,
  `loan_status_id` int(11) DEFAULT NULL,
  `files` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `loan_status` enum('open','fully_paid','defaulted','restructured','processing') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `balance` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `override` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','approved','disbursed','declined','withdrawn','written_off','closed','pending_reschedule','rescheduled') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `applied_amount` decimal(10,2) DEFAULT NULL,
  `approved_amount` decimal(10,2) DEFAULT NULL,
  `approved_notes` text COLLATE utf8_unicode_ci,
  `disbursed_notes` text COLLATE utf8_unicode_ci,
  `withdrawn_notes` text COLLATE utf8_unicode_ci,
  `closed_notes` text COLLATE utf8_unicode_ci,
  `rescheduled_notes` text COLLATE utf8_unicode_ci,
  `declined_notes` text COLLATE utf8_unicode_ci,
  `written_off_notes` text COLLATE utf8_unicode_ci,
  `approved_date` date DEFAULT NULL,
  `disbursed_date` date DEFAULT NULL,
  `withdrawn_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `rescheduled_date` date DEFAULT NULL,
  `declined_date` date DEFAULT NULL,
  `written_off_date` date DEFAULT NULL,
  `approved_by_id` int(11) DEFAULT NULL,
  `disbursed_by_id` int(11) DEFAULT NULL,
  `withdrawn_by_id` int(11) DEFAULT NULL,
  `declined_by_id` int(11) DEFAULT NULL,
  `written_off_by_id` int(11) DEFAULT NULL,
  `rescheduled_by_id` int(11) DEFAULT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `processing_fee` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `user_id`, `borrower_id`, `loan_product_id`, `reference`, `release_date`, `maturity_date`, `month`, `year`, `interest_start_date`, `first_payment_date`, `loan_disbursed_by_id`, `principal`, `interest_method`, `interest_rate`, `interest_period`, `override_interest`, `override_interest_amount`, `loan_duration`, `loan_duration_type`, `repayment_cycle`, `decimal_places`, `repayment_order`, `loan_fees_schedule`, `grace_on_interest_charged`, `loan_status_id`, `files`, `description`, `loan_status`, `balance`, `override`, `created_at`, `updated_at`, `deleted_at`, `status`, `applied_amount`, `approved_amount`, `approved_notes`, `disbursed_notes`, `withdrawn_notes`, `closed_notes`, `rescheduled_notes`, `declined_notes`, `written_off_notes`, `approved_date`, `disbursed_date`, `withdrawn_date`, `closed_date`, `rescheduled_date`, `declined_date`, `written_off_date`, `approved_by_id`, `disbursed_by_id`, `withdrawn_by_id`, `declined_by_id`, `written_off_by_id`, `rescheduled_by_id`, `closed_by_id`, `branch_id`, `processing_fee`) VALUES
(1, 1, 1, 1, NULL, '2017-10-25', '2019-10-24', '10', '2017', NULL, NULL, NULL, '999999.9999', 'flat_rate', '10.0000', 'month', 0, '0.0000', 2, 'year', 'daily', 'round_off_to_two_decimal', NULL, 'distribute_fees_evenly', 0, NULL, 'a:0:{}', '', 'open', '0.0000', 0, '2017-10-24 20:29:08', '2017-10-24 20:43:59', NULL, 'declined', '1000000.00', NULL, NULL, NULL, NULL, NULL, NULL, 'not qualified', NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL),
(2, 1, 3, 1, NULL, '2017-11-01', '2019-12-02', '11', '2017', NULL, '2017-11-30', 1, '999999.9999', 'declining_balance_equal_installments', '10.0000', 'month', 0, '0.0000', 2, 'year', 'monthly', 'round_off_to_two_decimal', NULL, 'distribute_fees_evenly', 15, NULL, 'a:0:{}', '', 'open', '0.0000', 0, '2017-10-25 15:32:04', '2017-10-25 16:18:40', NULL, 'disbursed', '1000000.00', '1000000.00', '', '', NULL, NULL, NULL, NULL, NULL, '2017-10-25', '2017-11-01', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(3, 1, 4, 2, NULL, '2017-11-02', '2023-01-01', '11', '2017', NULL, '2018-01-01', 1, '999999.9999', 'declining_balance_equal_installments', '10.0000', 'year', 0, '0.0000', 60, 'month', 'monthly', 'round_off_to_integer', NULL, 'distribute_fees_evenly', 1, NULL, 'a:0:{}', 'Loan advanced for Developing a shopping Mall at Mlimani City', 'open', '0.0000', 0, '2017-10-25 23:02:27', '2017-11-09 19:26:56', NULL, 'disbursed', '99999999.99', '1000000.00', '', '', NULL, NULL, NULL, NULL, NULL, '2017-10-27', '2017-11-02', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(4, 1, 5, 2, NULL, '2017-11-01', '2023-01-01', '11', '2017', NULL, '2018-01-01', NULL, '999999.9999', 'declining_balance_equal_installments', '10.0000', 'year', 0, '0.0000', 60, 'month', 'monthly', 'round_off_to_integer', NULL, 'distribute_fees_evenly', 1, NULL, 'a:0:{}', '', 'open', '0.0000', 0, '2017-10-27 15:13:57', '2017-10-27 15:13:57', NULL, 'pending', '99999999.99', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(5, 1, 4, 2, NULL, '2017-10-01', '2023-01-01', '10', '2017', NULL, '2018-01-01', NULL, '999999.9999', 'declining_balance_equal_installments', '2.0000', 'month', 0, '0.0000', 60, 'month', 'monthly', 'round_off_to_integer', NULL, 'distribute_fees_evenly', 1, NULL, 'a:0:{}', '', 'open', '0.0000', 0, '2017-10-27 15:22:39', '2017-10-27 15:22:39', NULL, 'pending', '99999999.99', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(6, 1, 2, 1, NULL, '2017-10-27', '2169-11-28', '10', '2017', NULL, '2017-11-28', 2, '100000.0000', 'flat_rate', '10.0000', 'month', 0, '0.0000', 60, 'day', 'monthly', 'round_off_to_integer', NULL, 'distribute_fees_evenly', 5, NULL, 'a:0:{}', '', 'open', '0.0000', 0, '2017-10-27 16:11:16', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 'disbursed', '100000.00', '100000.00', 'Everything is ok.Proceed please.', 'loan disbursed.', NULL, NULL, NULL, NULL, NULL, '2017-10-27', '2017-10-27', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(7, 1, 2, 2, NULL, '2017-11-01', '2169-12-02', '11', '2017', NULL, '2017-12-02', 1, '300000.0000', 'flat_rate', '10.0000', 'month', 0, '0.0000', 60, 'day', 'monthly', 'round_off_to_integer', NULL, 'distribute_fees_evenly', 0, NULL, 'a:0:{}', '', 'open', '0.0000', 0, '2017-11-07 20:15:03', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 'disbursed', '300000.00', '300000.00', '', '', NULL, NULL, NULL, NULL, NULL, '2017-11-07', '2017-11-01', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loan_applications`
--

CREATE TABLE `loan_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `loan_product_id` int(11) NOT NULL,
  `amount` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `status` enum('approved','pending','declined') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_comments`
--

CREATE TABLE `loan_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `loan_id` int(10) UNSIGNED NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_disbursed_by`
--

CREATE TABLE `loan_disbursed_by` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_disbursed_by`
--

INSERT INTO `loan_disbursed_by` (`id`, `name`) VALUES
(1, 'Cash'),
(2, 'CHEQUE'),
(3, 'Bank transfer'),
(4, 'MPESA');

-- --------------------------------------------------------

--
-- Table structure for table `loan_fees`
--

CREATE TABLE `loan_fees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_fee_type` enum('fixed','percentage') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_fees`
--

INSERT INTO `loan_fees` (`id`, `name`, `loan_fee_type`) VALUES
(1, 'Loan processing and documentation fee', 'fixed'),
(2, 'Loan administration fee', 'fixed'),
(3, 'Collateral audit fee', 'fixed');

-- --------------------------------------------------------

--
-- Table structure for table `loan_fees_meta`
--

CREATE TABLE `loan_fees_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `loan_fees_id` int(11) DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `loan_fees_schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_fees_meta`
--

INSERT INTO `loan_fees_meta` (`id`, `user_id`, `category`, `parent_id`, `loan_fees_id`, `value`, `loan_fees_schedule`) VALUES
(1, 1, 'loan', 4, 1, '300000.00', 'charge_fees_on_first_payment'),
(2, 1, 'loan', 4, 2, '200000.00', 'charge_fees_on_first_payment'),
(3, 1, 'loan', 4, 3, '100000.00', 'charge_fees_on_first_payment'),
(4, 1, 'loan_product', 2, 1, '0.00', 'charge_fees_on_last_payment'),
(5, 1, 'loan_product', 2, 2, '0.00', 'charge_fees_on_last_payment'),
(6, 1, 'loan_product', 2, 3, '0.00', 'charge_fees_on_last_payment'),
(7, 1, 'loan', 5, 1, '300000.00', 'distribute_fees_evenly'),
(8, 1, 'loan', 5, 2, '200000.00', 'distribute_fees_evenly'),
(9, 1, 'loan', 5, 3, '100000.00', 'distribute_fees_evenly'),
(10, 1, 'loan', 6, 1, '30000.00', 'distribute_fees_evenly'),
(11, 1, 'loan', 6, 2, '20000.00', 'distribute_fees_evenly'),
(12, 1, 'loan', 6, 3, '10000.00', 'distribute_fees_evenly'),
(13, 1, 'loan', 7, 1, '0.00', 'distribute_fees_evenly'),
(14, 1, 'loan', 7, 2, '0.00', 'distribute_fees_evenly'),
(15, 1, 'loan', 7, 3, '0.00', 'distribute_fees_evenly'),
(16, 1, 'loan', 3, 1, '300000.00', 'charge_fees_on_first_payment'),
(17, 1, 'loan', 3, 2, '200000.00', 'charge_fees_on_first_payment'),
(18, 1, 'loan', 3, 3, '200000.00', 'charge_fees_on_first_payment');

-- --------------------------------------------------------

--
-- Table structure for table `loan_products`
--

CREATE TABLE `loan_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_disbursed_by_id` text COLLATE utf8_unicode_ci,
  `minimum_principal` decimal(10,4) DEFAULT NULL,
  `default_principal` decimal(10,4) DEFAULT NULL,
  `maximum_principal` decimal(10,4) DEFAULT NULL,
  `interest_method` enum('flat_rate','declining_balance_equal_installments','declining_balance_equal_principal','interest_only','compound_interest') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'flat_rate',
  `interest_rate` decimal(10,4) DEFAULT NULL,
  `interest_period` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `minimum_interest_rate` decimal(10,4) DEFAULT NULL,
  `default_interest_rate` decimal(10,4) DEFAULT NULL,
  `maximum_interest_rate` decimal(10,4) DEFAULT NULL,
  `override_interest` tinyint(4) NOT NULL DEFAULT '0',
  `override_interest_amount` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `default_loan_duration` int(11) DEFAULT NULL,
  `default_loan_duration_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `repayment_cycle` enum('daily','weekly','monthly','bi_monthly','quarterly','semi_annually','annually') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'monthly',
  `decimal_places` enum('round_off_to_two_decimal','round_off_to_integer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'round_off_to_two_decimal',
  `repayment_order` text COLLATE utf8_unicode_ci,
  `loan_fees_schedule` enum('dont_include','distribute_fees_evenly','charge_fees_on_released_date','charge_fees_on_first_payment','charge_fees_on_last_payment') COLLATE utf8_unicode_ci DEFAULT 'distribute_fees_evenly',
  `branch_access` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grace_on_interest_charged` int(11) DEFAULT NULL,
  `advanced_enabled` tinyint(4) DEFAULT '0',
  `enable_late_repayment_penalty` tinyint(4) DEFAULT '0',
  `enable_after_maturity_date_penalty` tinyint(4) DEFAULT '0',
  `after_maturity_date_penalty_type` enum('percentage','fixed') COLLATE utf8_unicode_ci DEFAULT 'percentage',
  `late_repayment_penalty_type` enum('percentage','fixed') COLLATE utf8_unicode_ci DEFAULT 'percentage',
  `late_repayment_penalty_calculate` enum('overdue_principal','overdue_principal_interest','overdue_principal_interest_fees','total_overdue') COLLATE utf8_unicode_ci DEFAULT 'overdue_principal',
  `after_maturity_date_penalty_calculate` enum('overdue_principal','overdue_principal_interest','overdue_principal_interest_fees','total_overdue') COLLATE utf8_unicode_ci DEFAULT 'overdue_principal',
  `late_repayment_penalty_amount` decimal(10,4) DEFAULT NULL,
  `after_maturity_date_penalty_amount` decimal(10,4) DEFAULT NULL,
  `late_repayment_penalty_grace_period` int(11) DEFAULT NULL,
  `after_maturity_date_penalty_grace_period` int(11) DEFAULT NULL,
  `late_repayment_penalty_recurring` int(11) DEFAULT NULL,
  `after_maturity_date_penalty_recurring` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_products`
--

INSERT INTO `loan_products` (`id`, `user_id`, `name`, `loan_disbursed_by_id`, `minimum_principal`, `default_principal`, `maximum_principal`, `interest_method`, `interest_rate`, `interest_period`, `minimum_interest_rate`, `default_interest_rate`, `maximum_interest_rate`, `override_interest`, `override_interest_amount`, `default_loan_duration`, `default_loan_duration_type`, `repayment_cycle`, `decimal_places`, `repayment_order`, `loan_fees_schedule`, `branch_access`, `grace_on_interest_charged`, `advanced_enabled`, `enable_late_repayment_penalty`, `enable_after_maturity_date_penalty`, `after_maturity_date_penalty_type`, `late_repayment_penalty_type`, `late_repayment_penalty_calculate`, `after_maturity_date_penalty_calculate`, `late_repayment_penalty_amount`, `after_maturity_date_penalty_amount`, `late_repayment_penalty_grace_period`, `after_maturity_date_penalty_grace_period`, `late_repayment_penalty_recurring`, `after_maturity_date_penalty_recurring`) VALUES
(1, NULL, 'student', 'a:0:{}', '999999.9999', '999999.9999', '999999.9999', 'flat_rate', NULL, 'month', '10.0000', '10.0000', '30.0000', 1, '10.0000', 2, 'year', 'daily', 'round_off_to_two_decimal', 'a:4:{i:0;s:7:\"penalty\";i:1;s:4:\"fees\";i:2;s:8:\"interest\";i:3;s:9:\"principal\";}', 'distribute_fees_evenly', NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 'Business', 'a:0:{}', '999999.9999', '999999.9999', '999999.9999', 'declining_balance_equal_installments', NULL, 'month', '10.0000', '2.0000', '18.0000', 0, '0.0000', 60, 'month', 'monthly', 'round_off_to_integer', 'a:4:{i:0;s:7:\"penalty\";i:1;s:4:\"fees\";i:2;s:8:\"interest\";i:3;s:9:\"principal\";}', NULL, NULL, 1, 0, 0, 1, 'fixed', NULL, NULL, 'overdue_principal', NULL, '500000.0000', NULL, 60, NULL, 60);

-- --------------------------------------------------------

--
-- Table structure for table `loan_repayments`
--

CREATE TABLE `loan_repayments` (
  `id` int(10) UNSIGNED NOT NULL,
  `loan_id` int(10) UNSIGNED NOT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `repayment_method_id` int(10) UNSIGNED NOT NULL,
  `collection_date` date DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_repayments`
--

INSERT INTO `loan_repayments` (`id`, `loan_id`, `borrower_id`, `user_id`, `amount`, `repayment_method_id`, `collection_date`, `notes`, `month`, `year`, `due_date`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(1, 2, 3, 1, '200000.0000', 1, '2017-11-02', '', '11', '2017', '2017-11-30', '2017-11-02 19:21:48', '2017-11-02 19:21:48', NULL, 1),
(2, 2, 3, 1, '200000.0000', 1, '2017-11-03', '', '11', '2017', '2017-11-30', '2017-11-03 17:45:41', '2017-11-03 17:45:41', NULL, 1),
(3, 3, 4, 1, '200000.0000', 1, '2017-11-03', '', '11', '2017', '2018-01-01', '2017-11-03 17:45:41', '2017-11-03 17:45:41', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `loan_repayment_methods`
--

CREATE TABLE `loan_repayment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_repayment_methods`
--

INSERT INTO `loan_repayment_methods` (`id`, `name`) VALUES
(1, 'Cash'),
(2, 'Check'),
(3, 'TISS'),
(4, 'Mobile');

-- --------------------------------------------------------

--
-- Table structure for table `loan_schedules`
--

CREATE TABLE `loan_schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `loan_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `due_date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `principal` decimal(10,4) DEFAULT NULL,
  `principal_balance` decimal(10,4) DEFAULT NULL,
  `interest` decimal(10,4) DEFAULT NULL,
  `fees` decimal(10,4) DEFAULT NULL,
  `penalty` decimal(10,4) DEFAULT NULL,
  `due` decimal(10,4) DEFAULT NULL,
  `system_generated` tinyint(4) NOT NULL DEFAULT '0',
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `missed` tinyint(4) NOT NULL DEFAULT '0',
  `missed_penalty_applied` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loan_schedules`
--

INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(1, 2, 3, 'Repayment', '2017-11-30', '11', '2017', '11299.7800', '988700.2200', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(2, 2, 3, 'Repayment', '2017-12-30', '12', '2017', '12429.7600', '976270.4600', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(3, 2, 3, 'Repayment', '2018-01-30', '01', '2018', '13672.7300', '962597.7300', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(4, 2, 3, 'Repayment', '2018-03-02', '03', '2018', '15040.0100', '947557.7200', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(5, 2, 3, 'Repayment', '2018-04-02', '04', '2018', '16544.0100', '931013.7100', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(6, 2, 3, 'Repayment', '2018-05-02', '05', '2018', '18198.4100', '912815.3000', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(7, 2, 3, 'Repayment', '2018-06-02', '06', '2018', '20018.2500', '892797.0500', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(8, 2, 3, 'Repayment', '2018-07-02', '07', '2018', '22020.0700', '870776.9800', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(9, 2, 3, 'Repayment', '2018-08-02', '08', '2018', '24222.0800', '846554.9000', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(10, 2, 3, 'Repayment', '2018-09-02', '09', '2018', '26644.2900', '819910.6100', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(11, 2, 3, 'Repayment', '2018-10-02', '10', '2018', '29308.7200', '790601.8900', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(12, 2, 3, 'Repayment', '2018-11-02', '11', '2018', '32239.5900', '758362.3000', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(13, 2, 3, 'Repayment', '2018-12-02', '12', '2018', '35463.5500', '722898.7500', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(14, 2, 3, 'Repayment', '2019-01-02', '01', '2019', '39009.9000', '683888.8500', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(15, 2, 3, 'Repayment', '2019-02-02', '02', '2019', '42910.8900', '640977.9600', '0.0000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(16, 2, 3, 'Repayment', '2019-03-02', '03', '2019', '47201.9800', '593775.9800', '64097.8000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(17, 2, 3, 'Repayment', '2019-04-02', '04', '2019', '51922.1800', '541853.8000', '59377.6000', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(18, 2, 3, 'Repayment', '2019-05-02', '05', '2019', '57114.4000', '484739.4000', '54185.3800', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(19, 2, 3, 'Repayment', '2019-06-02', '06', '2019', '62825.8400', '421913.5600', '48473.9400', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(20, 2, 3, 'Repayment', '2019-07-02', '07', '2019', '69108.4200', '352805.1400', '42191.3600', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(21, 2, 3, 'Repayment', '2019-08-02', '08', '2019', '76019.2700', '276785.8700', '35280.5100', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(22, 2, 3, 'Repayment', '2019-09-02', '09', '2019', '83621.1900', '193164.6800', '27678.5900', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(23, 2, 3, 'Repayment', '2019-10-02', '10', '2019', '91983.3100', '101181.3700', '19316.4700', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(24, 2, 3, 'Repayment', '2019-11-02', '11', '2019', '101181.6400', '0.0000', '10118.1400', '0.0000', NULL, '111299.7800', 0, 0, 0, 0, '2017-10-25 16:18:40', '2017-10-25 16:18:40', NULL, 1),
(25, 6, 2, 'Repayment', '2017-11-28', '11', '2017', '0.0000', '100000.0000', '0.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:40', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(26, 6, 2, 'Repayment', '2017-12-28', '12', '2017', '0.0000', '100000.0000', '0.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:40', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(27, 6, 2, 'Repayment', '2018-01-28', '01', '2018', '0.0000', '100000.0000', '0.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:40', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(28, 6, 2, 'Repayment', '2018-02-28', '02', '2018', '0.0000', '100000.0000', '0.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:40', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(29, 6, 2, 'Repayment', '2018-03-28', '03', '2018', '0.0000', '100000.0000', '0.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:40', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(30, 6, 2, 'Repayment', '2018-04-28', '04', '2018', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:40', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(31, 6, 2, 'Repayment', '2018-05-28', '05', '2018', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:40', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(32, 6, 2, 'Repayment', '2018-06-28', '06', '2018', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:40', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(33, 6, 2, 'Repayment', '2018-07-28', '07', '2018', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(34, 6, 2, 'Repayment', '2018-08-28', '08', '2018', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(35, 6, 2, 'Repayment', '2018-09-28', '09', '2018', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(36, 6, 2, 'Repayment', '2018-10-28', '10', '2018', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(37, 6, 2, 'Repayment', '2018-11-28', '11', '2018', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(38, 6, 2, 'Repayment', '2018-12-28', '12', '2018', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(39, 6, 2, 'Repayment', '2019-01-28', '01', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(40, 6, 2, 'Repayment', '2019-02-28', '02', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(41, 6, 2, 'Repayment', '2019-03-28', '03', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(42, 6, 2, 'Repayment', '2019-04-28', '04', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(43, 6, 2, 'Repayment', '2019-05-28', '05', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(44, 6, 2, 'Repayment', '2019-06-28', '06', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(45, 6, 2, 'Repayment', '2019-07-28', '07', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(46, 6, 2, 'Repayment', '2019-08-28', '08', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(47, 6, 2, 'Repayment', '2019-09-28', '09', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(48, 6, 2, 'Repayment', '2019-10-28', '10', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(49, 6, 2, 'Repayment', '2019-11-28', '11', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(50, 6, 2, 'Repayment', '2019-12-28', '12', '2019', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(51, 6, 2, 'Repayment', '2020-01-28', '01', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(52, 6, 2, 'Repayment', '2020-02-28', '02', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(53, 6, 2, 'Repayment', '2020-03-28', '03', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(54, 6, 2, 'Repayment', '2020-04-28', '04', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(55, 6, 2, 'Repayment', '2020-05-28', '05', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(56, 6, 2, 'Repayment', '2020-06-28', '06', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(57, 6, 2, 'Repayment', '2020-07-28', '07', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(58, 6, 2, 'Repayment', '2020-08-28', '08', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(59, 6, 2, 'Repayment', '2020-09-28', '09', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(60, 6, 2, 'Repayment', '2020-10-28', '10', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(61, 6, 2, 'Repayment', '2020-11-28', '11', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(62, 6, 2, 'Repayment', '2020-12-28', '12', '2020', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(63, 6, 2, 'Repayment', '2021-01-28', '01', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(64, 6, 2, 'Repayment', '2021-02-28', '02', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(65, 6, 2, 'Repayment', '2021-03-28', '03', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(66, 6, 2, 'Repayment', '2021-04-28', '04', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(67, 6, 2, 'Repayment', '2021-05-28', '05', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(68, 6, 2, 'Repayment', '2021-06-28', '06', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(69, 6, 2, 'Repayment', '2021-07-28', '07', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(70, 6, 2, 'Repayment', '2021-08-28', '08', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(71, 6, 2, 'Repayment', '2021-09-28', '09', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(72, 6, 2, 'Repayment', '2021-10-28', '10', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(73, 6, 2, 'Repayment', '2021-11-28', '11', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(74, 6, 2, 'Repayment', '2021-12-28', '12', '2021', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(75, 6, 2, 'Repayment', '2022-01-28', '01', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(76, 6, 2, 'Repayment', '2022-02-28', '02', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(77, 6, 2, 'Repayment', '2022-03-28', '03', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(78, 6, 2, 'Repayment', '2022-04-28', '04', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(79, 6, 2, 'Repayment', '2022-05-28', '05', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(80, 6, 2, 'Repayment', '2022-06-28', '06', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(81, 6, 2, 'Repayment', '2022-07-28', '07', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(82, 6, 2, 'Repayment', '2022-08-28', '08', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(83, 6, 2, 'Repayment', '2022-09-28', '09', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(84, 6, 2, 'Repayment', '2022-10-28', '10', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(85, 6, 2, 'Repayment', '2022-11-28', '11', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(86, 6, 2, 'Repayment', '2022-12-28', '12', '2022', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(87, 6, 2, 'Repayment', '2023-01-28', '01', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(88, 6, 2, 'Repayment', '2023-02-28', '02', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(89, 6, 2, 'Repayment', '2023-03-28', '03', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(90, 6, 2, 'Repayment', '2023-04-28', '04', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(91, 6, 2, 'Repayment', '2023-05-28', '05', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(92, 6, 2, 'Repayment', '2023-06-28', '06', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(93, 6, 2, 'Repayment', '2023-07-28', '07', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(94, 6, 2, 'Repayment', '2023-08-28', '08', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(95, 6, 2, 'Repayment', '2023-09-28', '09', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(96, 6, 2, 'Repayment', '2023-10-28', '10', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(97, 6, 2, 'Repayment', '2023-11-28', '11', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(98, 6, 2, 'Repayment', '2023-12-28', '12', '2023', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(99, 6, 2, 'Repayment', '2024-01-28', '01', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(100, 6, 2, 'Repayment', '2024-02-28', '02', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(101, 6, 2, 'Repayment', '2024-03-28', '03', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(102, 6, 2, 'Repayment', '2024-04-28', '04', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(103, 6, 2, 'Repayment', '2024-05-28', '05', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(104, 6, 2, 'Repayment', '2024-06-28', '06', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(105, 6, 2, 'Repayment', '2024-07-28', '07', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(106, 6, 2, 'Repayment', '2024-08-28', '08', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(107, 6, 2, 'Repayment', '2024-09-28', '09', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(108, 6, 2, 'Repayment', '2024-10-28', '10', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(109, 6, 2, 'Repayment', '2024-11-28', '11', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(110, 6, 2, 'Repayment', '2024-12-28', '12', '2024', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(111, 6, 2, 'Repayment', '2025-01-28', '01', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(112, 6, 2, 'Repayment', '2025-02-28', '02', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(113, 6, 2, 'Repayment', '2025-03-28', '03', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(114, 6, 2, 'Repayment', '2025-04-28', '04', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(115, 6, 2, 'Repayment', '2025-05-28', '05', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(116, 6, 2, 'Repayment', '2025-06-28', '06', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(117, 6, 2, 'Repayment', '2025-07-28', '07', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(118, 6, 2, 'Repayment', '2025-08-28', '08', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(119, 6, 2, 'Repayment', '2025-09-28', '09', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(120, 6, 2, 'Repayment', '2025-10-28', '10', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(121, 6, 2, 'Repayment', '2025-11-28', '11', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(122, 6, 2, 'Repayment', '2025-12-28', '12', '2025', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(123, 6, 2, 'Repayment', '2026-01-28', '01', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(124, 6, 2, 'Repayment', '2026-02-28', '02', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(125, 6, 2, 'Repayment', '2026-03-28', '03', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(126, 6, 2, 'Repayment', '2026-04-28', '04', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(127, 6, 2, 'Repayment', '2026-05-28', '05', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(128, 6, 2, 'Repayment', '2026-06-28', '06', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(129, 6, 2, 'Repayment', '2026-07-28', '07', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(130, 6, 2, 'Repayment', '2026-08-28', '08', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(131, 6, 2, 'Repayment', '2026-09-28', '09', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(132, 6, 2, 'Repayment', '2026-10-28', '10', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(133, 6, 2, 'Repayment', '2026-11-28', '11', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(134, 6, 2, 'Repayment', '2026-12-28', '12', '2026', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(135, 6, 2, 'Repayment', '2027-01-28', '01', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(136, 6, 2, 'Repayment', '2027-02-28', '02', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(137, 6, 2, 'Repayment', '2027-03-28', '03', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(138, 6, 2, 'Repayment', '2027-04-28', '04', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(139, 6, 2, 'Repayment', '2027-05-28', '05', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(140, 6, 2, 'Repayment', '2027-06-28', '06', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(141, 6, 2, 'Repayment', '2027-07-28', '07', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(142, 6, 2, 'Repayment', '2027-08-28', '08', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(143, 6, 2, 'Repayment', '2027-09-28', '09', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(144, 6, 2, 'Repayment', '2027-10-28', '10', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(145, 6, 2, 'Repayment', '2027-11-28', '11', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(146, 6, 2, 'Repayment', '2027-12-28', '12', '2027', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(147, 6, 2, 'Repayment', '2028-01-28', '01', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(148, 6, 2, 'Repayment', '2028-02-28', '02', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(149, 6, 2, 'Repayment', '2028-03-28', '03', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(150, 6, 2, 'Repayment', '2028-04-28', '04', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:41', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(151, 6, 2, 'Repayment', '2028-05-28', '05', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(152, 6, 2, 'Repayment', '2028-06-28', '06', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(153, 6, 2, 'Repayment', '2028-07-28', '07', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(154, 6, 2, 'Repayment', '2028-08-28', '08', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(155, 6, 2, 'Repayment', '2028-09-28', '09', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(156, 6, 2, 'Repayment', '2028-10-28', '10', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(157, 6, 2, 'Repayment', '2028-11-28', '11', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(158, 6, 2, 'Repayment', '2028-12-28', '12', '2028', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(159, 6, 2, 'Repayment', '2029-01-28', '01', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(160, 6, 2, 'Repayment', '2029-02-28', '02', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(161, 6, 2, 'Repayment', '2029-03-28', '03', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(162, 6, 2, 'Repayment', '2029-04-28', '04', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(163, 6, 2, 'Repayment', '2029-05-28', '05', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(164, 6, 2, 'Repayment', '2029-06-28', '06', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(165, 6, 2, 'Repayment', '2029-07-28', '07', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(166, 6, 2, 'Repayment', '2029-08-28', '08', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(167, 6, 2, 'Repayment', '2029-09-28', '09', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(168, 6, 2, 'Repayment', '2029-10-28', '10', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(169, 6, 2, 'Repayment', '2029-11-28', '11', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(170, 6, 2, 'Repayment', '2029-12-28', '12', '2029', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(171, 6, 2, 'Repayment', '2030-01-28', '01', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(172, 6, 2, 'Repayment', '2030-02-28', '02', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(173, 6, 2, 'Repayment', '2030-03-28', '03', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(174, 6, 2, 'Repayment', '2030-04-28', '04', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(175, 6, 2, 'Repayment', '2030-05-28', '05', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(176, 6, 2, 'Repayment', '2030-06-28', '06', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(177, 6, 2, 'Repayment', '2030-07-28', '07', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(178, 6, 2, 'Repayment', '2030-08-28', '08', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(179, 6, 2, 'Repayment', '2030-09-28', '09', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(180, 6, 2, 'Repayment', '2030-10-28', '10', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(181, 6, 2, 'Repayment', '2030-11-28', '11', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(182, 6, 2, 'Repayment', '2030-12-28', '12', '2030', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(183, 6, 2, 'Repayment', '2031-01-28', '01', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(184, 6, 2, 'Repayment', '2031-02-28', '02', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(185, 6, 2, 'Repayment', '2031-03-28', '03', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(186, 6, 2, 'Repayment', '2031-04-28', '04', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(187, 6, 2, 'Repayment', '2031-05-28', '05', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(188, 6, 2, 'Repayment', '2031-06-28', '06', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(189, 6, 2, 'Repayment', '2031-07-28', '07', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(190, 6, 2, 'Repayment', '2031-08-28', '08', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(191, 6, 2, 'Repayment', '2031-09-28', '09', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(192, 6, 2, 'Repayment', '2031-10-28', '10', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(193, 6, 2, 'Repayment', '2031-11-28', '11', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(194, 6, 2, 'Repayment', '2031-12-28', '12', '2031', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(195, 6, 2, 'Repayment', '2032-01-28', '01', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(196, 6, 2, 'Repayment', '2032-02-28', '02', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(197, 6, 2, 'Repayment', '2032-03-28', '03', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(198, 6, 2, 'Repayment', '2032-04-28', '04', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(199, 6, 2, 'Repayment', '2032-05-28', '05', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(200, 6, 2, 'Repayment', '2032-06-28', '06', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(201, 6, 2, 'Repayment', '2032-07-28', '07', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(202, 6, 2, 'Repayment', '2032-08-28', '08', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(203, 6, 2, 'Repayment', '2032-09-28', '09', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(204, 6, 2, 'Repayment', '2032-10-28', '10', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(205, 6, 2, 'Repayment', '2032-11-28', '11', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(206, 6, 2, 'Repayment', '2032-12-28', '12', '2032', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(207, 6, 2, 'Repayment', '2033-01-28', '01', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(208, 6, 2, 'Repayment', '2033-02-28', '02', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(209, 6, 2, 'Repayment', '2033-03-28', '03', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(210, 6, 2, 'Repayment', '2033-04-28', '04', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(211, 6, 2, 'Repayment', '2033-05-28', '05', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(212, 6, 2, 'Repayment', '2033-06-28', '06', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(213, 6, 2, 'Repayment', '2033-07-28', '07', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(214, 6, 2, 'Repayment', '2033-08-28', '08', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(215, 6, 2, 'Repayment', '2033-09-28', '09', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(216, 6, 2, 'Repayment', '2033-10-28', '10', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(217, 6, 2, 'Repayment', '2033-11-28', '11', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(218, 6, 2, 'Repayment', '2033-12-28', '12', '2033', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(219, 6, 2, 'Repayment', '2034-01-28', '01', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(220, 6, 2, 'Repayment', '2034-02-28', '02', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(221, 6, 2, 'Repayment', '2034-03-28', '03', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(222, 6, 2, 'Repayment', '2034-04-28', '04', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(223, 6, 2, 'Repayment', '2034-05-28', '05', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(224, 6, 2, 'Repayment', '2034-06-28', '06', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(225, 6, 2, 'Repayment', '2034-07-28', '07', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(226, 6, 2, 'Repayment', '2034-08-28', '08', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(227, 6, 2, 'Repayment', '2034-09-28', '09', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(228, 6, 2, 'Repayment', '2034-10-28', '10', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(229, 6, 2, 'Repayment', '2034-11-28', '11', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(230, 6, 2, 'Repayment', '2034-12-28', '12', '2034', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(231, 6, 2, 'Repayment', '2035-01-28', '01', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(232, 6, 2, 'Repayment', '2035-02-28', '02', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(233, 6, 2, 'Repayment', '2035-03-28', '03', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(234, 6, 2, 'Repayment', '2035-04-28', '04', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(235, 6, 2, 'Repayment', '2035-05-28', '05', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(236, 6, 2, 'Repayment', '2035-06-28', '06', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(237, 6, 2, 'Repayment', '2035-07-28', '07', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(238, 6, 2, 'Repayment', '2035-08-28', '08', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(239, 6, 2, 'Repayment', '2035-09-28', '09', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(240, 6, 2, 'Repayment', '2035-10-28', '10', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(241, 6, 2, 'Repayment', '2035-11-28', '11', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:42', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(242, 6, 2, 'Repayment', '2035-12-28', '12', '2035', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(243, 6, 2, 'Repayment', '2036-01-28', '01', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(244, 6, 2, 'Repayment', '2036-02-28', '02', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(245, 6, 2, 'Repayment', '2036-03-28', '03', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(246, 6, 2, 'Repayment', '2036-04-28', '04', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(247, 6, 2, 'Repayment', '2036-05-28', '05', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(248, 6, 2, 'Repayment', '2036-06-28', '06', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(249, 6, 2, 'Repayment', '2036-07-28', '07', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(250, 6, 2, 'Repayment', '2036-08-28', '08', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(251, 6, 2, 'Repayment', '2036-09-28', '09', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(252, 6, 2, 'Repayment', '2036-10-28', '10', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(253, 6, 2, 'Repayment', '2036-11-28', '11', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(254, 6, 2, 'Repayment', '2036-12-28', '12', '2036', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(255, 6, 2, 'Repayment', '2037-01-28', '01', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(256, 6, 2, 'Repayment', '2037-02-28', '02', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(257, 6, 2, 'Repayment', '2037-03-28', '03', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(258, 6, 2, 'Repayment', '2037-04-28', '04', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(259, 6, 2, 'Repayment', '2037-05-28', '05', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(260, 6, 2, 'Repayment', '2037-06-28', '06', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(261, 6, 2, 'Repayment', '2037-07-28', '07', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(262, 6, 2, 'Repayment', '2037-08-28', '08', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(263, 6, 2, 'Repayment', '2037-09-28', '09', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(264, 6, 2, 'Repayment', '2037-10-28', '10', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(265, 6, 2, 'Repayment', '2037-11-28', '11', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(266, 6, 2, 'Repayment', '2037-12-28', '12', '2037', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(267, 6, 2, 'Repayment', '2038-01-28', '01', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(268, 6, 2, 'Repayment', '2038-02-28', '02', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(269, 6, 2, 'Repayment', '2038-03-28', '03', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(270, 6, 2, 'Repayment', '2038-04-28', '04', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(271, 6, 2, 'Repayment', '2038-05-28', '05', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(272, 6, 2, 'Repayment', '2038-06-28', '06', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(273, 6, 2, 'Repayment', '2038-07-28', '07', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(274, 6, 2, 'Repayment', '2038-08-28', '08', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(275, 6, 2, 'Repayment', '2038-09-28', '09', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(276, 6, 2, 'Repayment', '2038-10-28', '10', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(277, 6, 2, 'Repayment', '2038-11-28', '11', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(278, 6, 2, 'Repayment', '2038-12-28', '12', '2038', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(279, 6, 2, 'Repayment', '2039-01-28', '01', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(280, 6, 2, 'Repayment', '2039-02-28', '02', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(281, 6, 2, 'Repayment', '2039-03-28', '03', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:43', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(282, 6, 2, 'Repayment', '2039-04-28', '04', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(283, 6, 2, 'Repayment', '2039-05-28', '05', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(284, 6, 2, 'Repayment', '2039-06-28', '06', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(285, 6, 2, 'Repayment', '2039-07-28', '07', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(286, 6, 2, 'Repayment', '2039-08-28', '08', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(287, 6, 2, 'Repayment', '2039-09-28', '09', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(288, 6, 2, 'Repayment', '2039-10-28', '10', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(289, 6, 2, 'Repayment', '2039-11-28', '11', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(290, 6, 2, 'Repayment', '2039-12-28', '12', '2039', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(291, 6, 2, 'Repayment', '2040-01-28', '01', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(292, 6, 2, 'Repayment', '2040-02-28', '02', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(293, 6, 2, 'Repayment', '2040-03-28', '03', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(294, 6, 2, 'Repayment', '2040-04-28', '04', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(295, 6, 2, 'Repayment', '2040-05-28', '05', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(296, 6, 2, 'Repayment', '2040-06-28', '06', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(297, 6, 2, 'Repayment', '2040-07-28', '07', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(298, 6, 2, 'Repayment', '2040-08-28', '08', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(299, 6, 2, 'Repayment', '2040-09-28', '09', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(300, 6, 2, 'Repayment', '2040-10-28', '10', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(301, 6, 2, 'Repayment', '2040-11-28', '11', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(302, 6, 2, 'Repayment', '2040-12-28', '12', '2040', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(303, 6, 2, 'Repayment', '2041-01-28', '01', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(304, 6, 2, 'Repayment', '2041-02-28', '02', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(305, 6, 2, 'Repayment', '2041-03-28', '03', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(306, 6, 2, 'Repayment', '2041-04-28', '04', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(307, 6, 2, 'Repayment', '2041-05-28', '05', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(308, 6, 2, 'Repayment', '2041-06-28', '06', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(309, 6, 2, 'Repayment', '2041-07-28', '07', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(310, 6, 2, 'Repayment', '2041-08-28', '08', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(311, 6, 2, 'Repayment', '2041-09-28', '09', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(312, 6, 2, 'Repayment', '2041-10-28', '10', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(313, 6, 2, 'Repayment', '2041-11-28', '11', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(314, 6, 2, 'Repayment', '2041-12-28', '12', '2041', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(315, 6, 2, 'Repayment', '2042-01-28', '01', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(316, 6, 2, 'Repayment', '2042-02-28', '02', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(317, 6, 2, 'Repayment', '2042-03-28', '03', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(318, 6, 2, 'Repayment', '2042-04-28', '04', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(319, 6, 2, 'Repayment', '2042-05-28', '05', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(320, 6, 2, 'Repayment', '2042-06-28', '06', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(321, 6, 2, 'Repayment', '2042-07-28', '07', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(322, 6, 2, 'Repayment', '2042-08-28', '08', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(323, 6, 2, 'Repayment', '2042-09-28', '09', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(324, 6, 2, 'Repayment', '2042-10-28', '10', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(325, 6, 2, 'Repayment', '2042-11-28', '11', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(326, 6, 2, 'Repayment', '2042-12-28', '12', '2042', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(327, 6, 2, 'Repayment', '2043-01-28', '01', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(328, 6, 2, 'Repayment', '2043-02-28', '02', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(329, 6, 2, 'Repayment', '2043-03-28', '03', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(330, 6, 2, 'Repayment', '2043-04-28', '04', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(331, 6, 2, 'Repayment', '2043-05-28', '05', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(332, 6, 2, 'Repayment', '2043-06-28', '06', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(333, 6, 2, 'Repayment', '2043-07-28', '07', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(334, 6, 2, 'Repayment', '2043-08-28', '08', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(335, 6, 2, 'Repayment', '2043-09-28', '09', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(336, 6, 2, 'Repayment', '2043-10-28', '10', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(337, 6, 2, 'Repayment', '2043-11-28', '11', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(338, 6, 2, 'Repayment', '2043-12-28', '12', '2043', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(339, 6, 2, 'Repayment', '2044-01-28', '01', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(340, 6, 2, 'Repayment', '2044-02-28', '02', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(341, 6, 2, 'Repayment', '2044-03-28', '03', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(342, 6, 2, 'Repayment', '2044-04-28', '04', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(343, 6, 2, 'Repayment', '2044-05-28', '05', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(344, 6, 2, 'Repayment', '2044-06-28', '06', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(345, 6, 2, 'Repayment', '2044-07-28', '07', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(346, 6, 2, 'Repayment', '2044-08-28', '08', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(347, 6, 2, 'Repayment', '2044-09-28', '09', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(348, 6, 2, 'Repayment', '2044-10-28', '10', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(349, 6, 2, 'Repayment', '2044-11-28', '11', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(350, 6, 2, 'Repayment', '2044-12-28', '12', '2044', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(351, 6, 2, 'Repayment', '2045-01-28', '01', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(352, 6, 2, 'Repayment', '2045-02-28', '02', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(353, 6, 2, 'Repayment', '2045-03-28', '03', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(354, 6, 2, 'Repayment', '2045-04-28', '04', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(355, 6, 2, 'Repayment', '2045-05-28', '05', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(356, 6, 2, 'Repayment', '2045-06-28', '06', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(357, 6, 2, 'Repayment', '2045-07-28', '07', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(358, 6, 2, 'Repayment', '2045-08-28', '08', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(359, 6, 2, 'Repayment', '2045-09-28', '09', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(360, 6, 2, 'Repayment', '2045-10-28', '10', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(361, 6, 2, 'Repayment', '2045-11-28', '11', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(362, 6, 2, 'Repayment', '2045-12-28', '12', '2045', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(363, 6, 2, 'Repayment', '2046-01-28', '01', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(364, 6, 2, 'Repayment', '2046-02-28', '02', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(365, 6, 2, 'Repayment', '2046-03-28', '03', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(366, 6, 2, 'Repayment', '2046-04-28', '04', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(367, 6, 2, 'Repayment', '2046-05-28', '05', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(368, 6, 2, 'Repayment', '2046-06-28', '06', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(369, 6, 2, 'Repayment', '2046-07-28', '07', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(370, 6, 2, 'Repayment', '2046-08-28', '08', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(371, 6, 2, 'Repayment', '2046-09-28', '09', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(372, 6, 2, 'Repayment', '2046-10-28', '10', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(373, 6, 2, 'Repayment', '2046-11-28', '11', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(374, 6, 2, 'Repayment', '2046-12-28', '12', '2046', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(375, 6, 2, 'Repayment', '2047-01-28', '01', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(376, 6, 2, 'Repayment', '2047-02-28', '02', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(377, 6, 2, 'Repayment', '2047-03-28', '03', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:44', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(378, 6, 2, 'Repayment', '2047-04-28', '04', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(379, 6, 2, 'Repayment', '2047-05-28', '05', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(380, 6, 2, 'Repayment', '2047-06-28', '06', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(381, 6, 2, 'Repayment', '2047-07-28', '07', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(382, 6, 2, 'Repayment', '2047-08-28', '08', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(383, 6, 2, 'Repayment', '2047-09-28', '09', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(384, 6, 2, 'Repayment', '2047-10-28', '10', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(385, 6, 2, 'Repayment', '2047-11-28', '11', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(386, 6, 2, 'Repayment', '2047-12-28', '12', '2047', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(387, 6, 2, 'Repayment', '2048-01-28', '01', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(388, 6, 2, 'Repayment', '2048-02-28', '02', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(389, 6, 2, 'Repayment', '2048-03-28', '03', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(390, 6, 2, 'Repayment', '2048-04-28', '04', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(391, 6, 2, 'Repayment', '2048-05-28', '05', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(392, 6, 2, 'Repayment', '2048-06-28', '06', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(393, 6, 2, 'Repayment', '2048-07-28', '07', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(394, 6, 2, 'Repayment', '2048-08-28', '08', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(395, 6, 2, 'Repayment', '2048-09-28', '09', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(396, 6, 2, 'Repayment', '2048-10-28', '10', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(397, 6, 2, 'Repayment', '2048-11-28', '11', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(398, 6, 2, 'Repayment', '2048-12-28', '12', '2048', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(399, 6, 2, 'Repayment', '2049-01-28', '01', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(400, 6, 2, 'Repayment', '2049-02-28', '02', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(401, 6, 2, 'Repayment', '2049-03-28', '03', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(402, 6, 2, 'Repayment', '2049-04-28', '04', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(403, 6, 2, 'Repayment', '2049-05-28', '05', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(404, 6, 2, 'Repayment', '2049-06-28', '06', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(405, 6, 2, 'Repayment', '2049-07-28', '07', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(406, 6, 2, 'Repayment', '2049-08-28', '08', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(407, 6, 2, 'Repayment', '2049-09-28', '09', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(408, 6, 2, 'Repayment', '2049-10-28', '10', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(409, 6, 2, 'Repayment', '2049-11-28', '11', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(410, 6, 2, 'Repayment', '2049-12-28', '12', '2049', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(411, 6, 2, 'Repayment', '2050-01-28', '01', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(412, 6, 2, 'Repayment', '2050-02-28', '02', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(413, 6, 2, 'Repayment', '2050-03-28', '03', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(414, 6, 2, 'Repayment', '2050-04-28', '04', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(415, 6, 2, 'Repayment', '2050-05-28', '05', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(416, 6, 2, 'Repayment', '2050-06-28', '06', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(417, 6, 2, 'Repayment', '2050-07-28', '07', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(418, 6, 2, 'Repayment', '2050-08-28', '08', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(419, 6, 2, 'Repayment', '2050-09-28', '09', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(420, 6, 2, 'Repayment', '2050-10-28', '10', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(421, 6, 2, 'Repayment', '2050-11-28', '11', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(422, 6, 2, 'Repayment', '2050-12-28', '12', '2050', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(423, 6, 2, 'Repayment', '2051-01-28', '01', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(424, 6, 2, 'Repayment', '2051-02-28', '02', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(425, 6, 2, 'Repayment', '2051-03-28', '03', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(426, 6, 2, 'Repayment', '2051-04-28', '04', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(427, 6, 2, 'Repayment', '2051-05-28', '05', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(428, 6, 2, 'Repayment', '2051-06-28', '06', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(429, 6, 2, 'Repayment', '2051-07-28', '07', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(430, 6, 2, 'Repayment', '2051-08-28', '08', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(431, 6, 2, 'Repayment', '2051-09-28', '09', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(432, 6, 2, 'Repayment', '2051-10-28', '10', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(433, 6, 2, 'Repayment', '2051-11-28', '11', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(434, 6, 2, 'Repayment', '2051-12-28', '12', '2051', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(435, 6, 2, 'Repayment', '2052-01-28', '01', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(436, 6, 2, 'Repayment', '2052-02-28', '02', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(437, 6, 2, 'Repayment', '2052-03-28', '03', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(438, 6, 2, 'Repayment', '2052-04-28', '04', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(439, 6, 2, 'Repayment', '2052-05-28', '05', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(440, 6, 2, 'Repayment', '2052-06-28', '06', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(441, 6, 2, 'Repayment', '2052-07-28', '07', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(442, 6, 2, 'Repayment', '2052-08-28', '08', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(443, 6, 2, 'Repayment', '2052-09-28', '09', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(444, 6, 2, 'Repayment', '2052-10-28', '10', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(445, 6, 2, 'Repayment', '2052-11-28', '11', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(446, 6, 2, 'Repayment', '2052-12-28', '12', '2052', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(447, 6, 2, 'Repayment', '2053-01-28', '01', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(448, 6, 2, 'Repayment', '2053-02-28', '02', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(449, 6, 2, 'Repayment', '2053-03-28', '03', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(450, 6, 2, 'Repayment', '2053-04-28', '04', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(451, 6, 2, 'Repayment', '2053-05-28', '05', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(452, 6, 2, 'Repayment', '2053-06-28', '06', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(453, 6, 2, 'Repayment', '2053-07-28', '07', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(454, 6, 2, 'Repayment', '2053-08-28', '08', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(455, 6, 2, 'Repayment', '2053-09-28', '09', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(456, 6, 2, 'Repayment', '2053-10-28', '10', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(457, 6, 2, 'Repayment', '2053-11-28', '11', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(458, 6, 2, 'Repayment', '2053-12-28', '12', '2053', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(459, 6, 2, 'Repayment', '2054-01-28', '01', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(460, 6, 2, 'Repayment', '2054-02-28', '02', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(461, 6, 2, 'Repayment', '2054-03-28', '03', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(462, 6, 2, 'Repayment', '2054-04-28', '04', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(463, 6, 2, 'Repayment', '2054-05-28', '05', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(464, 6, 2, 'Repayment', '2054-06-28', '06', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(465, 6, 2, 'Repayment', '2054-07-28', '07', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(466, 6, 2, 'Repayment', '2054-08-28', '08', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(467, 6, 2, 'Repayment', '2054-09-28', '09', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(468, 6, 2, 'Repayment', '2054-10-28', '10', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(469, 6, 2, 'Repayment', '2054-11-28', '11', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(470, 6, 2, 'Repayment', '2054-12-28', '12', '2054', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(471, 6, 2, 'Repayment', '2055-01-28', '01', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(472, 6, 2, 'Repayment', '2055-02-28', '02', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(473, 6, 2, 'Repayment', '2055-03-28', '03', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(474, 6, 2, 'Repayment', '2055-04-28', '04', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(475, 6, 2, 'Repayment', '2055-05-28', '05', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(476, 6, 2, 'Repayment', '2055-06-28', '06', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:45', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(477, 6, 2, 'Repayment', '2055-07-28', '07', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(478, 6, 2, 'Repayment', '2055-08-28', '08', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(479, 6, 2, 'Repayment', '2055-09-28', '09', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(480, 6, 2, 'Repayment', '2055-10-28', '10', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(481, 6, 2, 'Repayment', '2055-11-28', '11', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(482, 6, 2, 'Repayment', '2055-12-28', '12', '2055', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(483, 6, 2, 'Repayment', '2056-01-28', '01', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(484, 6, 2, 'Repayment', '2056-02-28', '02', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(485, 6, 2, 'Repayment', '2056-03-28', '03', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(486, 6, 2, 'Repayment', '2056-04-28', '04', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(487, 6, 2, 'Repayment', '2056-05-28', '05', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(488, 6, 2, 'Repayment', '2056-06-28', '06', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(489, 6, 2, 'Repayment', '2056-07-28', '07', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(490, 6, 2, 'Repayment', '2056-08-28', '08', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(491, 6, 2, 'Repayment', '2056-09-28', '09', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(492, 6, 2, 'Repayment', '2056-10-28', '10', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(493, 6, 2, 'Repayment', '2056-11-28', '11', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(494, 6, 2, 'Repayment', '2056-12-28', '12', '2056', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(495, 6, 2, 'Repayment', '2057-01-28', '01', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(496, 6, 2, 'Repayment', '2057-02-28', '02', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(497, 6, 2, 'Repayment', '2057-03-28', '03', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(498, 6, 2, 'Repayment', '2057-04-28', '04', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(499, 6, 2, 'Repayment', '2057-05-28', '05', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(500, 6, 2, 'Repayment', '2057-06-28', '06', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(501, 6, 2, 'Repayment', '2057-07-28', '07', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(502, 6, 2, 'Repayment', '2057-08-28', '08', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(503, 6, 2, 'Repayment', '2057-09-28', '09', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(504, 6, 2, 'Repayment', '2057-10-28', '10', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(505, 6, 2, 'Repayment', '2057-11-28', '11', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(506, 6, 2, 'Repayment', '2057-12-28', '12', '2057', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(507, 6, 2, 'Repayment', '2058-01-28', '01', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(508, 6, 2, 'Repayment', '2058-02-28', '02', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(509, 6, 2, 'Repayment', '2058-03-28', '03', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(510, 6, 2, 'Repayment', '2058-04-28', '04', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(511, 6, 2, 'Repayment', '2058-05-28', '05', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(512, 6, 2, 'Repayment', '2058-06-28', '06', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(513, 6, 2, 'Repayment', '2058-07-28', '07', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(514, 6, 2, 'Repayment', '2058-08-28', '08', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(515, 6, 2, 'Repayment', '2058-09-28', '09', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(516, 6, 2, 'Repayment', '2058-10-28', '10', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(517, 6, 2, 'Repayment', '2058-11-28', '11', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(518, 6, 2, 'Repayment', '2058-12-28', '12', '2058', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(519, 6, 2, 'Repayment', '2059-01-28', '01', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(520, 6, 2, 'Repayment', '2059-02-28', '02', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(521, 6, 2, 'Repayment', '2059-03-28', '03', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(522, 6, 2, 'Repayment', '2059-04-28', '04', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(523, 6, 2, 'Repayment', '2059-05-28', '05', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(524, 6, 2, 'Repayment', '2059-06-28', '06', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(525, 6, 2, 'Repayment', '2059-07-28', '07', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(526, 6, 2, 'Repayment', '2059-08-28', '08', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(527, 6, 2, 'Repayment', '2059-09-28', '09', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(528, 6, 2, 'Repayment', '2059-10-28', '10', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(529, 6, 2, 'Repayment', '2059-11-28', '11', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(530, 6, 2, 'Repayment', '2059-12-28', '12', '2059', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(531, 6, 2, 'Repayment', '2060-01-28', '01', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(532, 6, 2, 'Repayment', '2060-02-28', '02', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(533, 6, 2, 'Repayment', '2060-03-28', '03', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(534, 6, 2, 'Repayment', '2060-04-28', '04', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(535, 6, 2, 'Repayment', '2060-05-28', '05', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(536, 6, 2, 'Repayment', '2060-06-28', '06', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(537, 6, 2, 'Repayment', '2060-07-28', '07', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(538, 6, 2, 'Repayment', '2060-08-28', '08', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(539, 6, 2, 'Repayment', '2060-09-28', '09', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(540, 6, 2, 'Repayment', '2060-10-28', '10', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(541, 6, 2, 'Repayment', '2060-11-28', '11', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(542, 6, 2, 'Repayment', '2060-12-28', '12', '2060', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(543, 6, 2, 'Repayment', '2061-01-28', '01', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(544, 6, 2, 'Repayment', '2061-02-28', '02', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(545, 6, 2, 'Repayment', '2061-03-28', '03', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(546, 6, 2, 'Repayment', '2061-04-28', '04', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(547, 6, 2, 'Repayment', '2061-05-28', '05', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(548, 6, 2, 'Repayment', '2061-06-28', '06', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(549, 6, 2, 'Repayment', '2061-07-28', '07', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(550, 6, 2, 'Repayment', '2061-08-28', '08', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(551, 6, 2, 'Repayment', '2061-09-28', '09', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(552, 6, 2, 'Repayment', '2061-10-28', '10', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(553, 6, 2, 'Repayment', '2061-11-28', '11', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(554, 6, 2, 'Repayment', '2061-12-28', '12', '2061', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(555, 6, 2, 'Repayment', '2062-01-28', '01', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(556, 6, 2, 'Repayment', '2062-02-28', '02', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(557, 6, 2, 'Repayment', '2062-03-28', '03', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(558, 6, 2, 'Repayment', '2062-04-28', '04', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(559, 6, 2, 'Repayment', '2062-05-28', '05', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(560, 6, 2, 'Repayment', '2062-06-28', '06', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(561, 6, 2, 'Repayment', '2062-07-28', '07', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(562, 6, 2, 'Repayment', '2062-08-28', '08', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(563, 6, 2, 'Repayment', '2062-09-28', '09', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(564, 6, 2, 'Repayment', '2062-10-28', '10', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(565, 6, 2, 'Repayment', '2062-11-28', '11', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(566, 6, 2, 'Repayment', '2062-12-28', '12', '2062', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(567, 6, 2, 'Repayment', '2063-01-28', '01', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(568, 6, 2, 'Repayment', '2063-02-28', '02', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(569, 6, 2, 'Repayment', '2063-03-28', '03', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(570, 6, 2, 'Repayment', '2063-04-28', '04', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(571, 6, 2, 'Repayment', '2063-05-28', '05', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(572, 6, 2, 'Repayment', '2063-06-28', '06', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(573, 6, 2, 'Repayment', '2063-07-28', '07', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(574, 6, 2, 'Repayment', '2063-08-28', '08', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(575, 6, 2, 'Repayment', '2063-09-28', '09', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(576, 6, 2, 'Repayment', '2063-10-28', '10', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(577, 6, 2, 'Repayment', '2063-11-28', '11', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:46', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(578, 6, 2, 'Repayment', '2063-12-28', '12', '2063', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(579, 6, 2, 'Repayment', '2064-01-28', '01', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(580, 6, 2, 'Repayment', '2064-02-28', '02', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(581, 6, 2, 'Repayment', '2064-03-28', '03', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(582, 6, 2, 'Repayment', '2064-04-28', '04', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(583, 6, 2, 'Repayment', '2064-05-28', '05', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(584, 6, 2, 'Repayment', '2064-06-28', '06', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(585, 6, 2, 'Repayment', '2064-07-28', '07', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(586, 6, 2, 'Repayment', '2064-08-28', '08', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(587, 6, 2, 'Repayment', '2064-09-28', '09', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(588, 6, 2, 'Repayment', '2064-10-28', '10', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(589, 6, 2, 'Repayment', '2064-11-28', '11', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(590, 6, 2, 'Repayment', '2064-12-28', '12', '2064', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(591, 6, 2, 'Repayment', '2065-01-28', '01', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(592, 6, 2, 'Repayment', '2065-02-28', '02', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(593, 6, 2, 'Repayment', '2065-03-28', '03', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(594, 6, 2, 'Repayment', '2065-04-28', '04', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(595, 6, 2, 'Repayment', '2065-05-28', '05', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(596, 6, 2, 'Repayment', '2065-06-28', '06', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(597, 6, 2, 'Repayment', '2065-07-28', '07', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(598, 6, 2, 'Repayment', '2065-08-28', '08', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(599, 6, 2, 'Repayment', '2065-09-28', '09', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(600, 6, 2, 'Repayment', '2065-10-28', '10', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(601, 6, 2, 'Repayment', '2065-11-28', '11', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(602, 6, 2, 'Repayment', '2065-12-28', '12', '2065', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(603, 6, 2, 'Repayment', '2066-01-28', '01', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(604, 6, 2, 'Repayment', '2066-02-28', '02', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(605, 6, 2, 'Repayment', '2066-03-28', '03', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(606, 6, 2, 'Repayment', '2066-04-28', '04', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(607, 6, 2, 'Repayment', '2066-05-28', '05', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(608, 6, 2, 'Repayment', '2066-06-28', '06', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(609, 6, 2, 'Repayment', '2066-07-28', '07', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(610, 6, 2, 'Repayment', '2066-08-28', '08', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(611, 6, 2, 'Repayment', '2066-09-28', '09', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(612, 6, 2, 'Repayment', '2066-10-28', '10', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(613, 6, 2, 'Repayment', '2066-11-28', '11', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(614, 6, 2, 'Repayment', '2066-12-28', '12', '2066', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(615, 6, 2, 'Repayment', '2067-01-28', '01', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(616, 6, 2, 'Repayment', '2067-02-28', '02', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(617, 6, 2, 'Repayment', '2067-03-28', '03', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(618, 6, 2, 'Repayment', '2067-04-28', '04', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(619, 6, 2, 'Repayment', '2067-05-28', '05', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(620, 6, 2, 'Repayment', '2067-06-28', '06', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(621, 6, 2, 'Repayment', '2067-07-28', '07', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(622, 6, 2, 'Repayment', '2067-08-28', '08', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(623, 6, 2, 'Repayment', '2067-09-28', '09', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(624, 6, 2, 'Repayment', '2067-10-28', '10', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(625, 6, 2, 'Repayment', '2067-11-28', '11', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(626, 6, 2, 'Repayment', '2067-12-28', '12', '2067', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(627, 6, 2, 'Repayment', '2068-01-28', '01', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(628, 6, 2, 'Repayment', '2068-02-28', '02', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(629, 6, 2, 'Repayment', '2068-03-28', '03', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(630, 6, 2, 'Repayment', '2068-04-28', '04', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(631, 6, 2, 'Repayment', '2068-05-28', '05', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(632, 6, 2, 'Repayment', '2068-06-28', '06', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(633, 6, 2, 'Repayment', '2068-07-28', '07', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(634, 6, 2, 'Repayment', '2068-08-28', '08', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(635, 6, 2, 'Repayment', '2068-09-28', '09', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(636, 6, 2, 'Repayment', '2068-10-28', '10', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(637, 6, 2, 'Repayment', '2068-11-28', '11', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(638, 6, 2, 'Repayment', '2068-12-28', '12', '2068', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(639, 6, 2, 'Repayment', '2069-01-28', '01', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(640, 6, 2, 'Repayment', '2069-02-28', '02', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(641, 6, 2, 'Repayment', '2069-03-28', '03', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(642, 6, 2, 'Repayment', '2069-04-28', '04', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(643, 6, 2, 'Repayment', '2069-05-28', '05', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(644, 6, 2, 'Repayment', '2069-06-28', '06', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(645, 6, 2, 'Repayment', '2069-07-28', '07', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(646, 6, 2, 'Repayment', '2069-08-28', '08', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(647, 6, 2, 'Repayment', '2069-09-28', '09', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(648, 6, 2, 'Repayment', '2069-10-28', '10', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(649, 6, 2, 'Repayment', '2069-11-28', '11', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(650, 6, 2, 'Repayment', '2069-12-28', '12', '2069', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(651, 6, 2, 'Repayment', '2070-01-28', '01', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(652, 6, 2, 'Repayment', '2070-02-28', '02', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:47', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(653, 6, 2, 'Repayment', '2070-03-28', '03', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(654, 6, 2, 'Repayment', '2070-04-28', '04', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(655, 6, 2, 'Repayment', '2070-05-28', '05', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(656, 6, 2, 'Repayment', '2070-06-28', '06', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(657, 6, 2, 'Repayment', '2070-07-28', '07', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(658, 6, 2, 'Repayment', '2070-08-28', '08', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(659, 6, 2, 'Repayment', '2070-09-28', '09', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(660, 6, 2, 'Repayment', '2070-10-28', '10', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(661, 6, 2, 'Repayment', '2070-11-28', '11', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(662, 6, 2, 'Repayment', '2070-12-28', '12', '2070', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(663, 6, 2, 'Repayment', '2071-01-28', '01', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(664, 6, 2, 'Repayment', '2071-02-28', '02', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(665, 6, 2, 'Repayment', '2071-03-28', '03', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(666, 6, 2, 'Repayment', '2071-04-28', '04', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(667, 6, 2, 'Repayment', '2071-05-28', '05', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(668, 6, 2, 'Repayment', '2071-06-28', '06', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(669, 6, 2, 'Repayment', '2071-07-28', '07', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(670, 6, 2, 'Repayment', '2071-08-28', '08', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(671, 6, 2, 'Repayment', '2071-09-28', '09', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(672, 6, 2, 'Repayment', '2071-10-28', '10', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(673, 6, 2, 'Repayment', '2071-11-28', '11', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(674, 6, 2, 'Repayment', '2071-12-28', '12', '2071', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(675, 6, 2, 'Repayment', '2072-01-28', '01', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(676, 6, 2, 'Repayment', '2072-02-28', '02', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(677, 6, 2, 'Repayment', '2072-03-28', '03', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(678, 6, 2, 'Repayment', '2072-04-28', '04', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(679, 6, 2, 'Repayment', '2072-05-28', '05', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(680, 6, 2, 'Repayment', '2072-06-28', '06', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(681, 6, 2, 'Repayment', '2072-07-28', '07', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(682, 6, 2, 'Repayment', '2072-08-28', '08', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(683, 6, 2, 'Repayment', '2072-09-28', '09', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(684, 6, 2, 'Repayment', '2072-10-28', '10', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(685, 6, 2, 'Repayment', '2072-11-28', '11', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(686, 6, 2, 'Repayment', '2072-12-28', '12', '2072', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(687, 6, 2, 'Repayment', '2073-01-28', '01', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(688, 6, 2, 'Repayment', '2073-02-28', '02', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(689, 6, 2, 'Repayment', '2073-03-28', '03', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(690, 6, 2, 'Repayment', '2073-04-28', '04', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(691, 6, 2, 'Repayment', '2073-05-28', '05', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(692, 6, 2, 'Repayment', '2073-06-28', '06', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(693, 6, 2, 'Repayment', '2073-07-28', '07', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(694, 6, 2, 'Repayment', '2073-08-28', '08', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(695, 6, 2, 'Repayment', '2073-09-28', '09', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(696, 6, 2, 'Repayment', '2073-10-28', '10', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(697, 6, 2, 'Repayment', '2073-11-28', '11', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(698, 6, 2, 'Repayment', '2073-12-28', '12', '2073', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(699, 6, 2, 'Repayment', '2074-01-28', '01', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(700, 6, 2, 'Repayment', '2074-02-28', '02', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(701, 6, 2, 'Repayment', '2074-03-28', '03', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(702, 6, 2, 'Repayment', '2074-04-28', '04', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(703, 6, 2, 'Repayment', '2074-05-28', '05', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(704, 6, 2, 'Repayment', '2074-06-28', '06', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(705, 6, 2, 'Repayment', '2074-07-28', '07', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(706, 6, 2, 'Repayment', '2074-08-28', '08', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(707, 6, 2, 'Repayment', '2074-09-28', '09', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(708, 6, 2, 'Repayment', '2074-10-28', '10', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(709, 6, 2, 'Repayment', '2074-11-28', '11', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(710, 6, 2, 'Repayment', '2074-12-28', '12', '2074', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(711, 6, 2, 'Repayment', '2075-01-28', '01', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(712, 6, 2, 'Repayment', '2075-02-28', '02', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(713, 6, 2, 'Repayment', '2075-03-28', '03', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(714, 6, 2, 'Repayment', '2075-04-28', '04', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(715, 6, 2, 'Repayment', '2075-05-28', '05', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(716, 6, 2, 'Repayment', '2075-06-28', '06', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(717, 6, 2, 'Repayment', '2075-07-28', '07', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(718, 6, 2, 'Repayment', '2075-08-28', '08', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(719, 6, 2, 'Repayment', '2075-09-28', '09', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(720, 6, 2, 'Repayment', '2075-10-28', '10', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(721, 6, 2, 'Repayment', '2075-11-28', '11', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:48', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(722, 6, 2, 'Repayment', '2075-12-28', '12', '2075', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(723, 6, 2, 'Repayment', '2076-01-28', '01', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(724, 6, 2, 'Repayment', '2076-02-28', '02', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(725, 6, 2, 'Repayment', '2076-03-28', '03', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(726, 6, 2, 'Repayment', '2076-04-28', '04', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(727, 6, 2, 'Repayment', '2076-05-28', '05', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(728, 6, 2, 'Repayment', '2076-06-28', '06', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(729, 6, 2, 'Repayment', '2076-07-28', '07', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(730, 6, 2, 'Repayment', '2076-08-28', '08', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(731, 6, 2, 'Repayment', '2076-09-28', '09', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(732, 6, 2, 'Repayment', '2076-10-28', '10', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(733, 6, 2, 'Repayment', '2076-11-28', '11', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(734, 6, 2, 'Repayment', '2076-12-28', '12', '2076', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(735, 6, 2, 'Repayment', '2077-01-28', '01', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(736, 6, 2, 'Repayment', '2077-02-28', '02', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(737, 6, 2, 'Repayment', '2077-03-28', '03', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(738, 6, 2, 'Repayment', '2077-04-28', '04', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(739, 6, 2, 'Repayment', '2077-05-28', '05', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(740, 6, 2, 'Repayment', '2077-06-28', '06', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(741, 6, 2, 'Repayment', '2077-07-28', '07', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(742, 6, 2, 'Repayment', '2077-08-28', '08', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(743, 6, 2, 'Repayment', '2077-09-28', '09', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(744, 6, 2, 'Repayment', '2077-10-28', '10', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(745, 6, 2, 'Repayment', '2077-11-28', '11', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(746, 6, 2, 'Repayment', '2077-12-28', '12', '2077', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(747, 6, 2, 'Repayment', '2078-01-28', '01', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(748, 6, 2, 'Repayment', '2078-02-28', '02', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(749, 6, 2, 'Repayment', '2078-03-28', '03', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(750, 6, 2, 'Repayment', '2078-04-28', '04', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(751, 6, 2, 'Repayment', '2078-05-28', '05', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(752, 6, 2, 'Repayment', '2078-06-28', '06', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(753, 6, 2, 'Repayment', '2078-07-28', '07', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(754, 6, 2, 'Repayment', '2078-08-28', '08', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(755, 6, 2, 'Repayment', '2078-09-28', '09', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(756, 6, 2, 'Repayment', '2078-10-28', '10', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(757, 6, 2, 'Repayment', '2078-11-28', '11', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(758, 6, 2, 'Repayment', '2078-12-28', '12', '2078', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(759, 6, 2, 'Repayment', '2079-01-28', '01', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(760, 6, 2, 'Repayment', '2079-02-28', '02', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(761, 6, 2, 'Repayment', '2079-03-28', '03', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(762, 6, 2, 'Repayment', '2079-04-28', '04', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(763, 6, 2, 'Repayment', '2079-05-28', '05', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(764, 6, 2, 'Repayment', '2079-06-28', '06', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(765, 6, 2, 'Repayment', '2079-07-28', '07', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(766, 6, 2, 'Repayment', '2079-08-28', '08', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(767, 6, 2, 'Repayment', '2079-09-28', '09', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(768, 6, 2, 'Repayment', '2079-10-28', '10', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(769, 6, 2, 'Repayment', '2079-11-28', '11', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(770, 6, 2, 'Repayment', '2079-12-28', '12', '2079', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(771, 6, 2, 'Repayment', '2080-01-28', '01', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(772, 6, 2, 'Repayment', '2080-02-28', '02', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(773, 6, 2, 'Repayment', '2080-03-28', '03', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(774, 6, 2, 'Repayment', '2080-04-28', '04', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(775, 6, 2, 'Repayment', '2080-05-28', '05', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(776, 6, 2, 'Repayment', '2080-06-28', '06', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(777, 6, 2, 'Repayment', '2080-07-28', '07', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(778, 6, 2, 'Repayment', '2080-08-28', '08', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(779, 6, 2, 'Repayment', '2080-09-28', '09', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(780, 6, 2, 'Repayment', '2080-10-28', '10', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(781, 6, 2, 'Repayment', '2080-11-28', '11', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(782, 6, 2, 'Repayment', '2080-12-28', '12', '2080', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(783, 6, 2, 'Repayment', '2081-01-28', '01', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(784, 6, 2, 'Repayment', '2081-02-28', '02', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(785, 6, 2, 'Repayment', '2081-03-28', '03', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(786, 6, 2, 'Repayment', '2081-04-28', '04', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(787, 6, 2, 'Repayment', '2081-05-28', '05', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(788, 6, 2, 'Repayment', '2081-06-28', '06', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(789, 6, 2, 'Repayment', '2081-07-28', '07', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(790, 6, 2, 'Repayment', '2081-08-28', '08', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(791, 6, 2, 'Repayment', '2081-09-28', '09', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(792, 6, 2, 'Repayment', '2081-10-28', '10', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(793, 6, 2, 'Repayment', '2081-11-28', '11', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(794, 6, 2, 'Repayment', '2081-12-28', '12', '2081', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(795, 6, 2, 'Repayment', '2082-01-28', '01', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(796, 6, 2, 'Repayment', '2082-02-28', '02', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(797, 6, 2, 'Repayment', '2082-03-28', '03', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(798, 6, 2, 'Repayment', '2082-04-28', '04', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(799, 6, 2, 'Repayment', '2082-05-28', '05', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(800, 6, 2, 'Repayment', '2082-06-28', '06', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(801, 6, 2, 'Repayment', '2082-07-28', '07', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(802, 6, 2, 'Repayment', '2082-08-28', '08', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(803, 6, 2, 'Repayment', '2082-09-28', '09', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(804, 6, 2, 'Repayment', '2082-10-28', '10', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(805, 6, 2, 'Repayment', '2082-11-28', '11', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(806, 6, 2, 'Repayment', '2082-12-28', '12', '2082', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:49', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(807, 6, 2, 'Repayment', '2083-01-28', '01', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(808, 6, 2, 'Repayment', '2083-02-28', '02', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(809, 6, 2, 'Repayment', '2083-03-28', '03', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(810, 6, 2, 'Repayment', '2083-04-28', '04', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(811, 6, 2, 'Repayment', '2083-05-28', '05', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(812, 6, 2, 'Repayment', '2083-06-28', '06', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(813, 6, 2, 'Repayment', '2083-07-28', '07', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(814, 6, 2, 'Repayment', '2083-08-28', '08', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(815, 6, 2, 'Repayment', '2083-09-28', '09', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(816, 6, 2, 'Repayment', '2083-10-28', '10', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(817, 6, 2, 'Repayment', '2083-11-28', '11', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(818, 6, 2, 'Repayment', '2083-12-28', '12', '2083', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(819, 6, 2, 'Repayment', '2084-01-28', '01', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(820, 6, 2, 'Repayment', '2084-02-28', '02', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(821, 6, 2, 'Repayment', '2084-03-28', '03', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(822, 6, 2, 'Repayment', '2084-04-28', '04', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(823, 6, 2, 'Repayment', '2084-05-28', '05', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(824, 6, 2, 'Repayment', '2084-06-28', '06', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(825, 6, 2, 'Repayment', '2084-07-28', '07', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(826, 6, 2, 'Repayment', '2084-08-28', '08', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(827, 6, 2, 'Repayment', '2084-09-28', '09', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(828, 6, 2, 'Repayment', '2084-10-28', '10', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(829, 6, 2, 'Repayment', '2084-11-28', '11', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(830, 6, 2, 'Repayment', '2084-12-28', '12', '2084', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(831, 6, 2, 'Repayment', '2085-01-28', '01', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(832, 6, 2, 'Repayment', '2085-02-28', '02', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(833, 6, 2, 'Repayment', '2085-03-28', '03', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(834, 6, 2, 'Repayment', '2085-04-28', '04', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(835, 6, 2, 'Repayment', '2085-05-28', '05', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(836, 6, 2, 'Repayment', '2085-06-28', '06', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(837, 6, 2, 'Repayment', '2085-07-28', '07', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(838, 6, 2, 'Repayment', '2085-08-28', '08', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(839, 6, 2, 'Repayment', '2085-09-28', '09', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(840, 6, 2, 'Repayment', '2085-10-28', '10', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(841, 6, 2, 'Repayment', '2085-11-28', '11', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(842, 6, 2, 'Repayment', '2085-12-28', '12', '2085', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(843, 6, 2, 'Repayment', '2086-01-28', '01', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(844, 6, 2, 'Repayment', '2086-02-28', '02', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(845, 6, 2, 'Repayment', '2086-03-28', '03', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(846, 6, 2, 'Repayment', '2086-04-28', '04', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(847, 6, 2, 'Repayment', '2086-05-28', '05', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(848, 6, 2, 'Repayment', '2086-06-28', '06', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(849, 6, 2, 'Repayment', '2086-07-28', '07', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(850, 6, 2, 'Repayment', '2086-08-28', '08', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(851, 6, 2, 'Repayment', '2086-09-28', '09', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(852, 6, 2, 'Repayment', '2086-10-28', '10', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(853, 6, 2, 'Repayment', '2086-11-28', '11', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(854, 6, 2, 'Repayment', '2086-12-28', '12', '2086', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(855, 6, 2, 'Repayment', '2087-01-28', '01', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(856, 6, 2, 'Repayment', '2087-02-28', '02', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(857, 6, 2, 'Repayment', '2087-03-28', '03', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(858, 6, 2, 'Repayment', '2087-04-28', '04', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(859, 6, 2, 'Repayment', '2087-05-28', '05', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(860, 6, 2, 'Repayment', '2087-06-28', '06', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(861, 6, 2, 'Repayment', '2087-07-28', '07', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(862, 6, 2, 'Repayment', '2087-08-28', '08', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(863, 6, 2, 'Repayment', '2087-09-28', '09', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(864, 6, 2, 'Repayment', '2087-10-28', '10', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(865, 6, 2, 'Repayment', '2087-11-28', '11', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(866, 6, 2, 'Repayment', '2087-12-28', '12', '2087', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(867, 6, 2, 'Repayment', '2088-01-28', '01', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(868, 6, 2, 'Repayment', '2088-02-28', '02', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(869, 6, 2, 'Repayment', '2088-03-28', '03', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(870, 6, 2, 'Repayment', '2088-04-28', '04', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(871, 6, 2, 'Repayment', '2088-05-28', '05', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(872, 6, 2, 'Repayment', '2088-06-28', '06', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(873, 6, 2, 'Repayment', '2088-07-28', '07', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(874, 6, 2, 'Repayment', '2088-08-28', '08', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(875, 6, 2, 'Repayment', '2088-09-28', '09', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(876, 6, 2, 'Repayment', '2088-10-28', '10', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(877, 6, 2, 'Repayment', '2088-11-28', '11', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(878, 6, 2, 'Repayment', '2088-12-28', '12', '2088', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(879, 6, 2, 'Repayment', '2089-01-28', '01', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(880, 6, 2, 'Repayment', '2089-02-28', '02', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(881, 6, 2, 'Repayment', '2089-03-28', '03', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(882, 6, 2, 'Repayment', '2089-04-28', '04', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(883, 6, 2, 'Repayment', '2089-05-28', '05', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(884, 6, 2, 'Repayment', '2089-06-28', '06', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(885, 6, 2, 'Repayment', '2089-07-28', '07', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(886, 6, 2, 'Repayment', '2089-08-28', '08', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(887, 6, 2, 'Repayment', '2089-09-28', '09', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(888, 6, 2, 'Repayment', '2089-10-28', '10', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(889, 6, 2, 'Repayment', '2089-11-28', '11', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(890, 6, 2, 'Repayment', '2089-12-28', '12', '2089', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(891, 6, 2, 'Repayment', '2090-01-28', '01', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(892, 6, 2, 'Repayment', '2090-02-28', '02', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(893, 6, 2, 'Repayment', '2090-03-28', '03', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(894, 6, 2, 'Repayment', '2090-04-28', '04', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(895, 6, 2, 'Repayment', '2090-05-28', '05', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(896, 6, 2, 'Repayment', '2090-06-28', '06', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(897, 6, 2, 'Repayment', '2090-07-28', '07', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(898, 6, 2, 'Repayment', '2090-08-28', '08', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(899, 6, 2, 'Repayment', '2090-09-28', '09', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(900, 6, 2, 'Repayment', '2090-10-28', '10', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(901, 6, 2, 'Repayment', '2090-11-28', '11', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(902, 6, 2, 'Repayment', '2090-12-28', '12', '2090', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(903, 6, 2, 'Repayment', '2091-01-28', '01', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(904, 6, 2, 'Repayment', '2091-02-28', '02', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(905, 6, 2, 'Repayment', '2091-03-28', '03', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(906, 6, 2, 'Repayment', '2091-04-28', '04', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(907, 6, 2, 'Repayment', '2091-05-28', '05', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(908, 6, 2, 'Repayment', '2091-06-28', '06', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(909, 6, 2, 'Repayment', '2091-07-28', '07', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(910, 6, 2, 'Repayment', '2091-08-28', '08', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(911, 6, 2, 'Repayment', '2091-09-28', '09', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(912, 6, 2, 'Repayment', '2091-10-28', '10', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:50', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(913, 6, 2, 'Repayment', '2091-11-28', '11', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(914, 6, 2, 'Repayment', '2091-12-28', '12', '2091', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(915, 6, 2, 'Repayment', '2092-01-28', '01', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(916, 6, 2, 'Repayment', '2092-02-28', '02', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(917, 6, 2, 'Repayment', '2092-03-28', '03', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(918, 6, 2, 'Repayment', '2092-04-28', '04', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(919, 6, 2, 'Repayment', '2092-05-28', '05', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(920, 6, 2, 'Repayment', '2092-06-28', '06', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(921, 6, 2, 'Repayment', '2092-07-28', '07', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(922, 6, 2, 'Repayment', '2092-08-28', '08', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(923, 6, 2, 'Repayment', '2092-09-28', '09', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(924, 6, 2, 'Repayment', '2092-10-28', '10', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(925, 6, 2, 'Repayment', '2092-11-28', '11', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(926, 6, 2, 'Repayment', '2092-12-28', '12', '2092', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(927, 6, 2, 'Repayment', '2093-01-28', '01', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(928, 6, 2, 'Repayment', '2093-02-28', '02', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(929, 6, 2, 'Repayment', '2093-03-28', '03', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(930, 6, 2, 'Repayment', '2093-04-28', '04', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(931, 6, 2, 'Repayment', '2093-05-28', '05', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(932, 6, 2, 'Repayment', '2093-06-28', '06', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(933, 6, 2, 'Repayment', '2093-07-28', '07', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(934, 6, 2, 'Repayment', '2093-08-28', '08', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(935, 6, 2, 'Repayment', '2093-09-28', '09', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(936, 6, 2, 'Repayment', '2093-10-28', '10', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(937, 6, 2, 'Repayment', '2093-11-28', '11', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(938, 6, 2, 'Repayment', '2093-12-28', '12', '2093', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(939, 6, 2, 'Repayment', '2094-01-28', '01', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(940, 6, 2, 'Repayment', '2094-02-28', '02', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(941, 6, 2, 'Repayment', '2094-03-28', '03', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(942, 6, 2, 'Repayment', '2094-04-28', '04', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(943, 6, 2, 'Repayment', '2094-05-28', '05', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(944, 6, 2, 'Repayment', '2094-06-28', '06', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(945, 6, 2, 'Repayment', '2094-07-28', '07', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(946, 6, 2, 'Repayment', '2094-08-28', '08', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(947, 6, 2, 'Repayment', '2094-09-28', '09', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(948, 6, 2, 'Repayment', '2094-10-28', '10', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(949, 6, 2, 'Repayment', '2094-11-28', '11', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(950, 6, 2, 'Repayment', '2094-12-28', '12', '2094', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(951, 6, 2, 'Repayment', '2095-01-28', '01', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(952, 6, 2, 'Repayment', '2095-02-28', '02', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(953, 6, 2, 'Repayment', '2095-03-28', '03', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(954, 6, 2, 'Repayment', '2095-04-28', '04', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(955, 6, 2, 'Repayment', '2095-05-28', '05', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(956, 6, 2, 'Repayment', '2095-06-28', '06', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(957, 6, 2, 'Repayment', '2095-07-28', '07', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(958, 6, 2, 'Repayment', '2095-08-28', '08', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(959, 6, 2, 'Repayment', '2095-09-28', '09', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(960, 6, 2, 'Repayment', '2095-10-28', '10', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(961, 6, 2, 'Repayment', '2095-11-28', '11', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(962, 6, 2, 'Repayment', '2095-12-28', '12', '2095', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(963, 6, 2, 'Repayment', '2096-01-28', '01', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(964, 6, 2, 'Repayment', '2096-02-28', '02', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(965, 6, 2, 'Repayment', '2096-03-28', '03', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(966, 6, 2, 'Repayment', '2096-04-28', '04', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(967, 6, 2, 'Repayment', '2096-05-28', '05', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(968, 6, 2, 'Repayment', '2096-06-28', '06', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(969, 6, 2, 'Repayment', '2096-07-28', '07', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(970, 6, 2, 'Repayment', '2096-08-28', '08', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(971, 6, 2, 'Repayment', '2096-09-28', '09', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(972, 6, 2, 'Repayment', '2096-10-28', '10', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(973, 6, 2, 'Repayment', '2096-11-28', '11', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(974, 6, 2, 'Repayment', '2096-12-28', '12', '2096', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(975, 6, 2, 'Repayment', '2097-01-28', '01', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(976, 6, 2, 'Repayment', '2097-02-28', '02', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(977, 6, 2, 'Repayment', '2097-03-28', '03', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(978, 6, 2, 'Repayment', '2097-04-28', '04', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(979, 6, 2, 'Repayment', '2097-05-28', '05', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(980, 6, 2, 'Repayment', '2097-06-28', '06', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(981, 6, 2, 'Repayment', '2097-07-28', '07', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(982, 6, 2, 'Repayment', '2097-08-28', '08', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(983, 6, 2, 'Repayment', '2097-09-28', '09', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(984, 6, 2, 'Repayment', '2097-10-28', '10', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(985, 6, 2, 'Repayment', '2097-11-28', '11', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(986, 6, 2, 'Repayment', '2097-12-28', '12', '2097', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(987, 6, 2, 'Repayment', '2098-01-28', '01', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(988, 6, 2, 'Repayment', '2098-02-28', '02', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(989, 6, 2, 'Repayment', '2098-03-28', '03', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(990, 6, 2, 'Repayment', '2098-04-28', '04', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(991, 6, 2, 'Repayment', '2098-05-28', '05', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(992, 6, 2, 'Repayment', '2098-06-28', '06', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(993, 6, 2, 'Repayment', '2098-07-28', '07', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(994, 6, 2, 'Repayment', '2098-08-28', '08', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(995, 6, 2, 'Repayment', '2098-09-28', '09', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(996, 6, 2, 'Repayment', '2098-10-28', '10', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(997, 6, 2, 'Repayment', '2098-11-28', '11', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(998, 6, 2, 'Repayment', '2098-12-28', '12', '2098', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(999, 6, 2, 'Repayment', '2099-01-28', '01', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1000, 6, 2, 'Repayment', '2099-02-28', '02', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1001, 6, 2, 'Repayment', '2099-03-28', '03', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1002, 6, 2, 'Repayment', '2099-04-28', '04', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1003, 6, 2, 'Repayment', '2099-05-28', '05', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1004, 6, 2, 'Repayment', '2099-06-28', '06', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1005, 6, 2, 'Repayment', '2099-07-28', '07', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1006, 6, 2, 'Repayment', '2099-08-28', '08', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1007, 6, 2, 'Repayment', '2099-09-28', '09', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1008, 6, 2, 'Repayment', '2099-10-28', '10', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1009, 6, 2, 'Repayment', '2099-11-28', '11', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1010, 6, 2, 'Repayment', '2099-12-28', '12', '2099', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1011, 6, 2, 'Repayment', '2100-01-28', '01', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1012, 6, 2, 'Repayment', '2100-02-28', '02', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1013, 6, 2, 'Repayment', '2100-03-28', '03', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1014, 6, 2, 'Repayment', '2100-04-28', '04', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1015, 6, 2, 'Repayment', '2100-05-28', '05', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1016, 6, 2, 'Repayment', '2100-06-28', '06', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1017, 6, 2, 'Repayment', '2100-07-28', '07', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1018, 6, 2, 'Repayment', '2100-08-28', '08', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1019, 6, 2, 'Repayment', '2100-09-28', '09', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1020, 6, 2, 'Repayment', '2100-10-28', '10', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1021, 6, 2, 'Repayment', '2100-11-28', '11', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1022, 6, 2, 'Repayment', '2100-12-28', '12', '2100', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1023, 6, 2, 'Repayment', '2101-01-28', '01', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1024, 6, 2, 'Repayment', '2101-02-28', '02', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1025, 6, 2, 'Repayment', '2101-03-28', '03', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1026, 6, 2, 'Repayment', '2101-04-28', '04', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1027, 6, 2, 'Repayment', '2101-05-28', '05', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1028, 6, 2, 'Repayment', '2101-06-28', '06', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1029, 6, 2, 'Repayment', '2101-07-28', '07', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1030, 6, 2, 'Repayment', '2101-08-28', '08', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1031, 6, 2, 'Repayment', '2101-09-28', '09', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1032, 6, 2, 'Repayment', '2101-10-28', '10', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1033, 6, 2, 'Repayment', '2101-11-28', '11', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1034, 6, 2, 'Repayment', '2101-12-28', '12', '2101', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:51', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1035, 6, 2, 'Repayment', '2102-01-28', '01', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1036, 6, 2, 'Repayment', '2102-02-28', '02', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1037, 6, 2, 'Repayment', '2102-03-28', '03', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1038, 6, 2, 'Repayment', '2102-04-28', '04', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1039, 6, 2, 'Repayment', '2102-05-28', '05', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1040, 6, 2, 'Repayment', '2102-06-28', '06', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1041, 6, 2, 'Repayment', '2102-07-28', '07', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1042, 6, 2, 'Repayment', '2102-08-28', '08', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1043, 6, 2, 'Repayment', '2102-09-28', '09', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1044, 6, 2, 'Repayment', '2102-10-28', '10', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1045, 6, 2, 'Repayment', '2102-11-28', '11', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1046, 6, 2, 'Repayment', '2102-12-28', '12', '2102', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1047, 6, 2, 'Repayment', '2103-01-28', '01', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1048, 6, 2, 'Repayment', '2103-02-28', '02', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1049, 6, 2, 'Repayment', '2103-03-28', '03', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1050, 6, 2, 'Repayment', '2103-04-28', '04', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1051, 6, 2, 'Repayment', '2103-05-28', '05', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1052, 6, 2, 'Repayment', '2103-06-28', '06', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1053, 6, 2, 'Repayment', '2103-07-28', '07', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1054, 6, 2, 'Repayment', '2103-08-28', '08', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1055, 6, 2, 'Repayment', '2103-09-28', '09', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1056, 6, 2, 'Repayment', '2103-10-28', '10', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1057, 6, 2, 'Repayment', '2103-11-28', '11', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1058, 6, 2, 'Repayment', '2103-12-28', '12', '2103', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1059, 6, 2, 'Repayment', '2104-01-28', '01', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1060, 6, 2, 'Repayment', '2104-02-28', '02', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1061, 6, 2, 'Repayment', '2104-03-28', '03', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1062, 6, 2, 'Repayment', '2104-04-28', '04', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1063, 6, 2, 'Repayment', '2104-05-28', '05', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1064, 6, 2, 'Repayment', '2104-06-28', '06', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1065, 6, 2, 'Repayment', '2104-07-28', '07', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1066, 6, 2, 'Repayment', '2104-08-28', '08', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1067, 6, 2, 'Repayment', '2104-09-28', '09', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1068, 6, 2, 'Repayment', '2104-10-28', '10', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1069, 6, 2, 'Repayment', '2104-11-28', '11', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1070, 6, 2, 'Repayment', '2104-12-28', '12', '2104', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1071, 6, 2, 'Repayment', '2105-01-28', '01', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1072, 6, 2, 'Repayment', '2105-02-28', '02', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1073, 6, 2, 'Repayment', '2105-03-28', '03', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1074, 6, 2, 'Repayment', '2105-04-28', '04', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1075, 6, 2, 'Repayment', '2105-05-28', '05', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1076, 6, 2, 'Repayment', '2105-06-28', '06', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1077, 6, 2, 'Repayment', '2105-07-28', '07', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1078, 6, 2, 'Repayment', '2105-08-28', '08', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1079, 6, 2, 'Repayment', '2105-09-28', '09', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1080, 6, 2, 'Repayment', '2105-10-28', '10', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1081, 6, 2, 'Repayment', '2105-11-28', '11', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1082, 6, 2, 'Repayment', '2105-12-28', '12', '2105', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1083, 6, 2, 'Repayment', '2106-01-28', '01', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1084, 6, 2, 'Repayment', '2106-02-28', '02', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1085, 6, 2, 'Repayment', '2106-03-28', '03', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1086, 6, 2, 'Repayment', '2106-04-28', '04', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1087, 6, 2, 'Repayment', '2106-05-28', '05', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1088, 6, 2, 'Repayment', '2106-06-28', '06', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1089, 6, 2, 'Repayment', '2106-07-28', '07', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1090, 6, 2, 'Repayment', '2106-08-28', '08', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1091, 6, 2, 'Repayment', '2106-09-28', '09', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1092, 6, 2, 'Repayment', '2106-10-28', '10', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1093, 6, 2, 'Repayment', '2106-11-28', '11', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1094, 6, 2, 'Repayment', '2106-12-28', '12', '2106', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1095, 6, 2, 'Repayment', '2107-01-28', '01', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1096, 6, 2, 'Repayment', '2107-02-28', '02', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1097, 6, 2, 'Repayment', '2107-03-28', '03', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1098, 6, 2, 'Repayment', '2107-04-28', '04', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1099, 6, 2, 'Repayment', '2107-05-28', '05', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1100, 6, 2, 'Repayment', '2107-06-28', '06', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1101, 6, 2, 'Repayment', '2107-07-28', '07', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1102, 6, 2, 'Repayment', '2107-08-28', '08', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1103, 6, 2, 'Repayment', '2107-09-28', '09', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1104, 6, 2, 'Repayment', '2107-10-28', '10', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1105, 6, 2, 'Repayment', '2107-11-28', '11', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1106, 6, 2, 'Repayment', '2107-12-28', '12', '2107', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1107, 6, 2, 'Repayment', '2108-01-28', '01', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1108, 6, 2, 'Repayment', '2108-02-28', '02', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1109, 6, 2, 'Repayment', '2108-03-28', '03', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1110, 6, 2, 'Repayment', '2108-04-28', '04', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1111, 6, 2, 'Repayment', '2108-05-28', '05', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1112, 6, 2, 'Repayment', '2108-06-28', '06', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1113, 6, 2, 'Repayment', '2108-07-28', '07', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1114, 6, 2, 'Repayment', '2108-08-28', '08', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1115, 6, 2, 'Repayment', '2108-09-28', '09', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1116, 6, 2, 'Repayment', '2108-10-28', '10', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1117, 6, 2, 'Repayment', '2108-11-28', '11', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1118, 6, 2, 'Repayment', '2108-12-28', '12', '2108', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1119, 6, 2, 'Repayment', '2109-01-28', '01', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1120, 6, 2, 'Repayment', '2109-02-28', '02', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1121, 6, 2, 'Repayment', '2109-03-28', '03', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1122, 6, 2, 'Repayment', '2109-04-28', '04', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1123, 6, 2, 'Repayment', '2109-05-28', '05', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1124, 6, 2, 'Repayment', '2109-06-28', '06', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1125, 6, 2, 'Repayment', '2109-07-28', '07', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1126, 6, 2, 'Repayment', '2109-08-28', '08', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1127, 6, 2, 'Repayment', '2109-09-28', '09', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1128, 6, 2, 'Repayment', '2109-10-28', '10', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1129, 6, 2, 'Repayment', '2109-11-28', '11', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1130, 6, 2, 'Repayment', '2109-12-28', '12', '2109', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1131, 6, 2, 'Repayment', '2110-01-28', '01', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1132, 6, 2, 'Repayment', '2110-02-28', '02', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1133, 6, 2, 'Repayment', '2110-03-28', '03', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1134, 6, 2, 'Repayment', '2110-04-28', '04', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1135, 6, 2, 'Repayment', '2110-05-28', '05', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1136, 6, 2, 'Repayment', '2110-06-28', '06', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1137, 6, 2, 'Repayment', '2110-07-28', '07', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1138, 6, 2, 'Repayment', '2110-08-28', '08', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1139, 6, 2, 'Repayment', '2110-09-28', '09', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1140, 6, 2, 'Repayment', '2110-10-28', '10', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1141, 6, 2, 'Repayment', '2110-11-28', '11', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1142, 6, 2, 'Repayment', '2110-12-28', '12', '2110', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1143, 6, 2, 'Repayment', '2111-01-28', '01', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1144, 6, 2, 'Repayment', '2111-02-28', '02', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1145, 6, 2, 'Repayment', '2111-03-28', '03', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1146, 6, 2, 'Repayment', '2111-04-28', '04', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1147, 6, 2, 'Repayment', '2111-05-28', '05', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1148, 6, 2, 'Repayment', '2111-06-28', '06', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:52', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1149, 6, 2, 'Repayment', '2111-07-28', '07', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1150, 6, 2, 'Repayment', '2111-08-28', '08', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1151, 6, 2, 'Repayment', '2111-09-28', '09', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1152, 6, 2, 'Repayment', '2111-10-28', '10', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1153, 6, 2, 'Repayment', '2111-11-28', '11', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1154, 6, 2, 'Repayment', '2111-12-28', '12', '2111', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1155, 6, 2, 'Repayment', '2112-01-28', '01', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1156, 6, 2, 'Repayment', '2112-02-28', '02', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1157, 6, 2, 'Repayment', '2112-03-28', '03', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1158, 6, 2, 'Repayment', '2112-04-28', '04', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1159, 6, 2, 'Repayment', '2112-05-28', '05', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1160, 6, 2, 'Repayment', '2112-06-28', '06', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1161, 6, 2, 'Repayment', '2112-07-28', '07', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1162, 6, 2, 'Repayment', '2112-08-28', '08', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1163, 6, 2, 'Repayment', '2112-09-28', '09', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1164, 6, 2, 'Repayment', '2112-10-28', '10', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1165, 6, 2, 'Repayment', '2112-11-28', '11', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1166, 6, 2, 'Repayment', '2112-12-28', '12', '2112', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1167, 6, 2, 'Repayment', '2113-01-28', '01', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1168, 6, 2, 'Repayment', '2113-02-28', '02', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1169, 6, 2, 'Repayment', '2113-03-28', '03', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1170, 6, 2, 'Repayment', '2113-04-28', '04', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1171, 6, 2, 'Repayment', '2113-05-28', '05', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1172, 6, 2, 'Repayment', '2113-06-28', '06', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1173, 6, 2, 'Repayment', '2113-07-28', '07', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1174, 6, 2, 'Repayment', '2113-08-28', '08', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1175, 6, 2, 'Repayment', '2113-09-28', '09', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1176, 6, 2, 'Repayment', '2113-10-28', '10', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1177, 6, 2, 'Repayment', '2113-11-28', '11', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1178, 6, 2, 'Repayment', '2113-12-28', '12', '2113', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1179, 6, 2, 'Repayment', '2114-01-28', '01', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1180, 6, 2, 'Repayment', '2114-02-28', '02', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1181, 6, 2, 'Repayment', '2114-03-28', '03', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1182, 6, 2, 'Repayment', '2114-04-28', '04', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1183, 6, 2, 'Repayment', '2114-05-28', '05', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1184, 6, 2, 'Repayment', '2114-06-28', '06', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1185, 6, 2, 'Repayment', '2114-07-28', '07', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1186, 6, 2, 'Repayment', '2114-08-28', '08', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1187, 6, 2, 'Repayment', '2114-09-28', '09', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1188, 6, 2, 'Repayment', '2114-10-28', '10', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1189, 6, 2, 'Repayment', '2114-11-28', '11', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1190, 6, 2, 'Repayment', '2114-12-28', '12', '2114', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1191, 6, 2, 'Repayment', '2115-01-28', '01', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1192, 6, 2, 'Repayment', '2115-02-28', '02', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1193, 6, 2, 'Repayment', '2115-03-28', '03', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1194, 6, 2, 'Repayment', '2115-04-28', '04', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1195, 6, 2, 'Repayment', '2115-05-28', '05', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1196, 6, 2, 'Repayment', '2115-06-28', '06', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1197, 6, 2, 'Repayment', '2115-07-28', '07', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1198, 6, 2, 'Repayment', '2115-08-28', '08', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1199, 6, 2, 'Repayment', '2115-09-28', '09', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1200, 6, 2, 'Repayment', '2115-10-28', '10', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1201, 6, 2, 'Repayment', '2115-11-28', '11', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1202, 6, 2, 'Repayment', '2115-12-28', '12', '2115', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1203, 6, 2, 'Repayment', '2116-01-28', '01', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1204, 6, 2, 'Repayment', '2116-02-28', '02', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1205, 6, 2, 'Repayment', '2116-03-28', '03', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1206, 6, 2, 'Repayment', '2116-04-28', '04', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(1207, 6, 2, 'Repayment', '2116-05-28', '05', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1208, 6, 2, 'Repayment', '2116-06-28', '06', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1209, 6, 2, 'Repayment', '2116-07-28', '07', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1210, 6, 2, 'Repayment', '2116-08-28', '08', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1211, 6, 2, 'Repayment', '2116-09-28', '09', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1212, 6, 2, 'Repayment', '2116-10-28', '10', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1213, 6, 2, 'Repayment', '2116-11-28', '11', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1214, 6, 2, 'Repayment', '2116-12-28', '12', '2116', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1215, 6, 2, 'Repayment', '2117-01-28', '01', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1216, 6, 2, 'Repayment', '2117-02-28', '02', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1217, 6, 2, 'Repayment', '2117-03-28', '03', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1218, 6, 2, 'Repayment', '2117-04-28', '04', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1219, 6, 2, 'Repayment', '2117-05-28', '05', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1220, 6, 2, 'Repayment', '2117-06-28', '06', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1221, 6, 2, 'Repayment', '2117-07-28', '07', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1222, 6, 2, 'Repayment', '2117-08-28', '08', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1223, 6, 2, 'Repayment', '2117-09-28', '09', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1224, 6, 2, 'Repayment', '2117-10-28', '10', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1225, 6, 2, 'Repayment', '2117-11-28', '11', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1226, 6, 2, 'Repayment', '2117-12-28', '12', '2117', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1227, 6, 2, 'Repayment', '2118-01-28', '01', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1228, 6, 2, 'Repayment', '2118-02-28', '02', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1229, 6, 2, 'Repayment', '2118-03-28', '03', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1230, 6, 2, 'Repayment', '2118-04-28', '04', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1231, 6, 2, 'Repayment', '2118-05-28', '05', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1232, 6, 2, 'Repayment', '2118-06-28', '06', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1233, 6, 2, 'Repayment', '2118-07-28', '07', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1234, 6, 2, 'Repayment', '2118-08-28', '08', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1235, 6, 2, 'Repayment', '2118-09-28', '09', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1236, 6, 2, 'Repayment', '2118-10-28', '10', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1237, 6, 2, 'Repayment', '2118-11-28', '11', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1238, 6, 2, 'Repayment', '2118-12-28', '12', '2118', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1239, 6, 2, 'Repayment', '2119-01-28', '01', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1240, 6, 2, 'Repayment', '2119-02-28', '02', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1241, 6, 2, 'Repayment', '2119-03-28', '03', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:53', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1242, 6, 2, 'Repayment', '2119-04-28', '04', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1243, 6, 2, 'Repayment', '2119-05-28', '05', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1244, 6, 2, 'Repayment', '2119-06-28', '06', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1245, 6, 2, 'Repayment', '2119-07-28', '07', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1246, 6, 2, 'Repayment', '2119-08-28', '08', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1247, 6, 2, 'Repayment', '2119-09-28', '09', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1248, 6, 2, 'Repayment', '2119-10-28', '10', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1249, 6, 2, 'Repayment', '2119-11-28', '11', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1250, 6, 2, 'Repayment', '2119-12-28', '12', '2119', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1251, 6, 2, 'Repayment', '2120-01-28', '01', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1252, 6, 2, 'Repayment', '2120-02-28', '02', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1253, 6, 2, 'Repayment', '2120-03-28', '03', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1254, 6, 2, 'Repayment', '2120-04-28', '04', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1255, 6, 2, 'Repayment', '2120-05-28', '05', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1256, 6, 2, 'Repayment', '2120-06-28', '06', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1257, 6, 2, 'Repayment', '2120-07-28', '07', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1258, 6, 2, 'Repayment', '2120-08-28', '08', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1259, 6, 2, 'Repayment', '2120-09-28', '09', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1260, 6, 2, 'Repayment', '2120-10-28', '10', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1261, 6, 2, 'Repayment', '2120-11-28', '11', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1262, 6, 2, 'Repayment', '2120-12-28', '12', '2120', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1263, 6, 2, 'Repayment', '2121-01-28', '01', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1264, 6, 2, 'Repayment', '2121-02-28', '02', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1265, 6, 2, 'Repayment', '2121-03-28', '03', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1266, 6, 2, 'Repayment', '2121-04-28', '04', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1267, 6, 2, 'Repayment', '2121-05-28', '05', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1268, 6, 2, 'Repayment', '2121-06-28', '06', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1269, 6, 2, 'Repayment', '2121-07-28', '07', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1270, 6, 2, 'Repayment', '2121-08-28', '08', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1271, 6, 2, 'Repayment', '2121-09-28', '09', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1272, 6, 2, 'Repayment', '2121-10-28', '10', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1273, 6, 2, 'Repayment', '2121-11-28', '11', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1274, 6, 2, 'Repayment', '2121-12-28', '12', '2121', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1275, 6, 2, 'Repayment', '2122-01-28', '01', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1276, 6, 2, 'Repayment', '2122-02-28', '02', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1277, 6, 2, 'Repayment', '2122-03-28', '03', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1278, 6, 2, 'Repayment', '2122-04-28', '04', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1279, 6, 2, 'Repayment', '2122-05-28', '05', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1280, 6, 2, 'Repayment', '2122-06-28', '06', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1281, 6, 2, 'Repayment', '2122-07-28', '07', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1282, 6, 2, 'Repayment', '2122-08-28', '08', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1283, 6, 2, 'Repayment', '2122-09-28', '09', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1284, 6, 2, 'Repayment', '2122-10-28', '10', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1285, 6, 2, 'Repayment', '2122-11-28', '11', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1286, 6, 2, 'Repayment', '2122-12-28', '12', '2122', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1287, 6, 2, 'Repayment', '2123-01-28', '01', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1288, 6, 2, 'Repayment', '2123-02-28', '02', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1289, 6, 2, 'Repayment', '2123-03-28', '03', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1290, 6, 2, 'Repayment', '2123-04-28', '04', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1291, 6, 2, 'Repayment', '2123-05-28', '05', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1292, 6, 2, 'Repayment', '2123-06-28', '06', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1293, 6, 2, 'Repayment', '2123-07-28', '07', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1294, 6, 2, 'Repayment', '2123-08-28', '08', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1295, 6, 2, 'Repayment', '2123-09-28', '09', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1296, 6, 2, 'Repayment', '2123-10-28', '10', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1297, 6, 2, 'Repayment', '2123-11-28', '11', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1298, 6, 2, 'Repayment', '2123-12-28', '12', '2123', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1299, 6, 2, 'Repayment', '2124-01-28', '01', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1300, 6, 2, 'Repayment', '2124-02-28', '02', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1301, 6, 2, 'Repayment', '2124-03-28', '03', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1302, 6, 2, 'Repayment', '2124-04-28', '04', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1303, 6, 2, 'Repayment', '2124-05-28', '05', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1304, 6, 2, 'Repayment', '2124-06-28', '06', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1305, 6, 2, 'Repayment', '2124-07-28', '07', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1306, 6, 2, 'Repayment', '2124-08-28', '08', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1307, 6, 2, 'Repayment', '2124-09-28', '09', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1308, 6, 2, 'Repayment', '2124-10-28', '10', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1309, 6, 2, 'Repayment', '2124-11-28', '11', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1310, 6, 2, 'Repayment', '2124-12-28', '12', '2124', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1311, 6, 2, 'Repayment', '2125-01-28', '01', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1312, 6, 2, 'Repayment', '2125-02-28', '02', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1313, 6, 2, 'Repayment', '2125-03-28', '03', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1314, 6, 2, 'Repayment', '2125-04-28', '04', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1315, 6, 2, 'Repayment', '2125-05-28', '05', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1316, 6, 2, 'Repayment', '2125-06-28', '06', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1317, 6, 2, 'Repayment', '2125-07-28', '07', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1318, 6, 2, 'Repayment', '2125-08-28', '08', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1319, 6, 2, 'Repayment', '2125-09-28', '09', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1320, 6, 2, 'Repayment', '2125-10-28', '10', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1321, 6, 2, 'Repayment', '2125-11-28', '11', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1322, 6, 2, 'Repayment', '2125-12-28', '12', '2125', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1323, 6, 2, 'Repayment', '2126-01-28', '01', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1324, 6, 2, 'Repayment', '2126-02-28', '02', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1325, 6, 2, 'Repayment', '2126-03-28', '03', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1326, 6, 2, 'Repayment', '2126-04-28', '04', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1327, 6, 2, 'Repayment', '2126-05-28', '05', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1328, 6, 2, 'Repayment', '2126-06-28', '06', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1329, 6, 2, 'Repayment', '2126-07-28', '07', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1330, 6, 2, 'Repayment', '2126-08-28', '08', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1331, 6, 2, 'Repayment', '2126-09-28', '09', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1332, 6, 2, 'Repayment', '2126-10-28', '10', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1333, 6, 2, 'Repayment', '2126-11-28', '11', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1334, 6, 2, 'Repayment', '2126-12-28', '12', '2126', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1335, 6, 2, 'Repayment', '2127-01-28', '01', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1336, 6, 2, 'Repayment', '2127-02-28', '02', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1337, 6, 2, 'Repayment', '2127-03-28', '03', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1338, 6, 2, 'Repayment', '2127-04-28', '04', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1339, 6, 2, 'Repayment', '2127-05-28', '05', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1340, 6, 2, 'Repayment', '2127-06-28', '06', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1341, 6, 2, 'Repayment', '2127-07-28', '07', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1342, 6, 2, 'Repayment', '2127-08-28', '08', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1343, 6, 2, 'Repayment', '2127-09-28', '09', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1344, 6, 2, 'Repayment', '2127-10-28', '10', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1345, 6, 2, 'Repayment', '2127-11-28', '11', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1346, 6, 2, 'Repayment', '2127-12-28', '12', '2127', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1347, 6, 2, 'Repayment', '2128-01-28', '01', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1348, 6, 2, 'Repayment', '2128-02-28', '02', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1349, 6, 2, 'Repayment', '2128-03-28', '03', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1350, 6, 2, 'Repayment', '2128-04-28', '04', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1351, 6, 2, 'Repayment', '2128-05-28', '05', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:54', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1352, 6, 2, 'Repayment', '2128-06-28', '06', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1353, 6, 2, 'Repayment', '2128-07-28', '07', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1354, 6, 2, 'Repayment', '2128-08-28', '08', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1355, 6, 2, 'Repayment', '2128-09-28', '09', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1356, 6, 2, 'Repayment', '2128-10-28', '10', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1357, 6, 2, 'Repayment', '2128-11-28', '11', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1358, 6, 2, 'Repayment', '2128-12-28', '12', '2128', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1359, 6, 2, 'Repayment', '2129-01-28', '01', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1360, 6, 2, 'Repayment', '2129-02-28', '02', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1361, 6, 2, 'Repayment', '2129-03-28', '03', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1362, 6, 2, 'Repayment', '2129-04-28', '04', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1363, 6, 2, 'Repayment', '2129-05-28', '05', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1364, 6, 2, 'Repayment', '2129-06-28', '06', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1365, 6, 2, 'Repayment', '2129-07-28', '07', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1366, 6, 2, 'Repayment', '2129-08-28', '08', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1367, 6, 2, 'Repayment', '2129-09-28', '09', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1368, 6, 2, 'Repayment', '2129-10-28', '10', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1369, 6, 2, 'Repayment', '2129-11-28', '11', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1370, 6, 2, 'Repayment', '2129-12-28', '12', '2129', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1371, 6, 2, 'Repayment', '2130-01-28', '01', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1372, 6, 2, 'Repayment', '2130-02-28', '02', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1373, 6, 2, 'Repayment', '2130-03-28', '03', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1374, 6, 2, 'Repayment', '2130-04-28', '04', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1375, 6, 2, 'Repayment', '2130-05-28', '05', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1376, 6, 2, 'Repayment', '2130-06-28', '06', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1377, 6, 2, 'Repayment', '2130-07-28', '07', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1378, 6, 2, 'Repayment', '2130-08-28', '08', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1379, 6, 2, 'Repayment', '2130-09-28', '09', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1380, 6, 2, 'Repayment', '2130-10-28', '10', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1381, 6, 2, 'Repayment', '2130-11-28', '11', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1382, 6, 2, 'Repayment', '2130-12-28', '12', '2130', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1383, 6, 2, 'Repayment', '2131-01-28', '01', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1384, 6, 2, 'Repayment', '2131-02-28', '02', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1385, 6, 2, 'Repayment', '2131-03-28', '03', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1386, 6, 2, 'Repayment', '2131-04-28', '04', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1387, 6, 2, 'Repayment', '2131-05-28', '05', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1388, 6, 2, 'Repayment', '2131-06-28', '06', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1389, 6, 2, 'Repayment', '2131-07-28', '07', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1390, 6, 2, 'Repayment', '2131-08-28', '08', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1391, 6, 2, 'Repayment', '2131-09-28', '09', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1392, 6, 2, 'Repayment', '2131-10-28', '10', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1393, 6, 2, 'Repayment', '2131-11-28', '11', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1394, 6, 2, 'Repayment', '2131-12-28', '12', '2131', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1395, 6, 2, 'Repayment', '2132-01-28', '01', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1396, 6, 2, 'Repayment', '2132-02-28', '02', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1397, 6, 2, 'Repayment', '2132-03-28', '03', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1398, 6, 2, 'Repayment', '2132-04-28', '04', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1399, 6, 2, 'Repayment', '2132-05-28', '05', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1400, 6, 2, 'Repayment', '2132-06-28', '06', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1401, 6, 2, 'Repayment', '2132-07-28', '07', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1402, 6, 2, 'Repayment', '2132-08-28', '08', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1403, 6, 2, 'Repayment', '2132-09-28', '09', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1404, 6, 2, 'Repayment', '2132-10-28', '10', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1405, 6, 2, 'Repayment', '2132-11-28', '11', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1406, 6, 2, 'Repayment', '2132-12-28', '12', '2132', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1407, 6, 2, 'Repayment', '2133-01-28', '01', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1408, 6, 2, 'Repayment', '2133-02-28', '02', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1409, 6, 2, 'Repayment', '2133-03-28', '03', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1410, 6, 2, 'Repayment', '2133-04-28', '04', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1411, 6, 2, 'Repayment', '2133-05-28', '05', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1412, 6, 2, 'Repayment', '2133-06-28', '06', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1413, 6, 2, 'Repayment', '2133-07-28', '07', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1414, 6, 2, 'Repayment', '2133-08-28', '08', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1415, 6, 2, 'Repayment', '2133-09-28', '09', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1416, 6, 2, 'Repayment', '2133-10-28', '10', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1417, 6, 2, 'Repayment', '2133-11-28', '11', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1418, 6, 2, 'Repayment', '2133-12-28', '12', '2133', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1419, 6, 2, 'Repayment', '2134-01-28', '01', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1420, 6, 2, 'Repayment', '2134-02-28', '02', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1421, 6, 2, 'Repayment', '2134-03-28', '03', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1422, 6, 2, 'Repayment', '2134-04-28', '04', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1423, 6, 2, 'Repayment', '2134-05-28', '05', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1424, 6, 2, 'Repayment', '2134-06-28', '06', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1425, 6, 2, 'Repayment', '2134-07-28', '07', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1426, 6, 2, 'Repayment', '2134-08-28', '08', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1427, 6, 2, 'Repayment', '2134-09-28', '09', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1428, 6, 2, 'Repayment', '2134-10-28', '10', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1429, 6, 2, 'Repayment', '2134-11-28', '11', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1430, 6, 2, 'Repayment', '2134-12-28', '12', '2134', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1431, 6, 2, 'Repayment', '2135-01-28', '01', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1432, 6, 2, 'Repayment', '2135-02-28', '02', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1433, 6, 2, 'Repayment', '2135-03-28', '03', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1434, 6, 2, 'Repayment', '2135-04-28', '04', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1435, 6, 2, 'Repayment', '2135-05-28', '05', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1436, 6, 2, 'Repayment', '2135-06-28', '06', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1437, 6, 2, 'Repayment', '2135-07-28', '07', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1438, 6, 2, 'Repayment', '2135-08-28', '08', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1439, 6, 2, 'Repayment', '2135-09-28', '09', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1440, 6, 2, 'Repayment', '2135-10-28', '10', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1441, 6, 2, 'Repayment', '2135-11-28', '11', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1442, 6, 2, 'Repayment', '2135-12-28', '12', '2135', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1443, 6, 2, 'Repayment', '2136-01-28', '01', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1444, 6, 2, 'Repayment', '2136-02-28', '02', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1445, 6, 2, 'Repayment', '2136-03-28', '03', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1446, 6, 2, 'Repayment', '2136-04-28', '04', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(1447, 6, 2, 'Repayment', '2136-05-28', '05', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1448, 6, 2, 'Repayment', '2136-06-28', '06', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1449, 6, 2, 'Repayment', '2136-07-28', '07', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1450, 6, 2, 'Repayment', '2136-08-28', '08', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1451, 6, 2, 'Repayment', '2136-09-28', '09', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1452, 6, 2, 'Repayment', '2136-10-28', '10', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1453, 6, 2, 'Repayment', '2136-11-28', '11', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1454, 6, 2, 'Repayment', '2136-12-28', '12', '2136', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1455, 6, 2, 'Repayment', '2137-01-28', '01', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1456, 6, 2, 'Repayment', '2137-02-28', '02', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1457, 6, 2, 'Repayment', '2137-03-28', '03', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1458, 6, 2, 'Repayment', '2137-04-28', '04', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1459, 6, 2, 'Repayment', '2137-05-28', '05', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1460, 6, 2, 'Repayment', '2137-06-28', '06', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1461, 6, 2, 'Repayment', '2137-07-28', '07', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1462, 6, 2, 'Repayment', '2137-08-28', '08', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1463, 6, 2, 'Repayment', '2137-09-28', '09', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1464, 6, 2, 'Repayment', '2137-10-28', '10', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1465, 6, 2, 'Repayment', '2137-11-28', '11', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1466, 6, 2, 'Repayment', '2137-12-28', '12', '2137', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1467, 6, 2, 'Repayment', '2138-01-28', '01', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1468, 6, 2, 'Repayment', '2138-02-28', '02', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1469, 6, 2, 'Repayment', '2138-03-28', '03', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1470, 6, 2, 'Repayment', '2138-04-28', '04', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1471, 6, 2, 'Repayment', '2138-05-28', '05', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1472, 6, 2, 'Repayment', '2138-06-28', '06', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1473, 6, 2, 'Repayment', '2138-07-28', '07', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1474, 6, 2, 'Repayment', '2138-08-28', '08', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1475, 6, 2, 'Repayment', '2138-09-28', '09', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1476, 6, 2, 'Repayment', '2138-10-28', '10', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1477, 6, 2, 'Repayment', '2138-11-28', '11', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1478, 6, 2, 'Repayment', '2138-12-28', '12', '2138', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1479, 6, 2, 'Repayment', '2139-01-28', '01', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1480, 6, 2, 'Repayment', '2139-02-28', '02', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1481, 6, 2, 'Repayment', '2139-03-28', '03', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:55', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1482, 6, 2, 'Repayment', '2139-04-28', '04', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1483, 6, 2, 'Repayment', '2139-05-28', '05', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1484, 6, 2, 'Repayment', '2139-06-28', '06', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1485, 6, 2, 'Repayment', '2139-07-28', '07', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1486, 6, 2, 'Repayment', '2139-08-28', '08', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1487, 6, 2, 'Repayment', '2139-09-28', '09', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1488, 6, 2, 'Repayment', '2139-10-28', '10', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1489, 6, 2, 'Repayment', '2139-11-28', '11', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1490, 6, 2, 'Repayment', '2139-12-28', '12', '2139', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1491, 6, 2, 'Repayment', '2140-01-28', '01', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1492, 6, 2, 'Repayment', '2140-02-28', '02', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1493, 6, 2, 'Repayment', '2140-03-28', '03', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1494, 6, 2, 'Repayment', '2140-04-28', '04', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1495, 6, 2, 'Repayment', '2140-05-28', '05', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1496, 6, 2, 'Repayment', '2140-06-28', '06', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1497, 6, 2, 'Repayment', '2140-07-28', '07', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1498, 6, 2, 'Repayment', '2140-08-28', '08', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1499, 6, 2, 'Repayment', '2140-09-28', '09', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1500, 6, 2, 'Repayment', '2140-10-28', '10', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1501, 6, 2, 'Repayment', '2140-11-28', '11', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1502, 6, 2, 'Repayment', '2140-12-28', '12', '2140', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1503, 6, 2, 'Repayment', '2141-01-28', '01', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1504, 6, 2, 'Repayment', '2141-02-28', '02', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1505, 6, 2, 'Repayment', '2141-03-28', '03', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1506, 6, 2, 'Repayment', '2141-04-28', '04', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1507, 6, 2, 'Repayment', '2141-05-28', '05', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1508, 6, 2, 'Repayment', '2141-06-28', '06', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1509, 6, 2, 'Repayment', '2141-07-28', '07', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1510, 6, 2, 'Repayment', '2141-08-28', '08', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1511, 6, 2, 'Repayment', '2141-09-28', '09', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1512, 6, 2, 'Repayment', '2141-10-28', '10', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1513, 6, 2, 'Repayment', '2141-11-28', '11', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1514, 6, 2, 'Repayment', '2141-12-28', '12', '2141', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1515, 6, 2, 'Repayment', '2142-01-28', '01', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1516, 6, 2, 'Repayment', '2142-02-28', '02', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1517, 6, 2, 'Repayment', '2142-03-28', '03', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1518, 6, 2, 'Repayment', '2142-04-28', '04', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1519, 6, 2, 'Repayment', '2142-05-28', '05', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1520, 6, 2, 'Repayment', '2142-06-28', '06', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1521, 6, 2, 'Repayment', '2142-07-28', '07', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1522, 6, 2, 'Repayment', '2142-08-28', '08', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1523, 6, 2, 'Repayment', '2142-09-28', '09', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1524, 6, 2, 'Repayment', '2142-10-28', '10', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1525, 6, 2, 'Repayment', '2142-11-28', '11', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1526, 6, 2, 'Repayment', '2142-12-28', '12', '2142', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1527, 6, 2, 'Repayment', '2143-01-28', '01', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1528, 6, 2, 'Repayment', '2143-02-28', '02', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1529, 6, 2, 'Repayment', '2143-03-28', '03', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1530, 6, 2, 'Repayment', '2143-04-28', '04', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1531, 6, 2, 'Repayment', '2143-05-28', '05', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1532, 6, 2, 'Repayment', '2143-06-28', '06', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1533, 6, 2, 'Repayment', '2143-07-28', '07', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1534, 6, 2, 'Repayment', '2143-08-28', '08', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1535, 6, 2, 'Repayment', '2143-09-28', '09', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1536, 6, 2, 'Repayment', '2143-10-28', '10', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1537, 6, 2, 'Repayment', '2143-11-28', '11', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1538, 6, 2, 'Repayment', '2143-12-28', '12', '2143', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1539, 6, 2, 'Repayment', '2144-01-28', '01', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1540, 6, 2, 'Repayment', '2144-02-28', '02', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1541, 6, 2, 'Repayment', '2144-03-28', '03', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1542, 6, 2, 'Repayment', '2144-04-28', '04', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1543, 6, 2, 'Repayment', '2144-05-28', '05', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1544, 6, 2, 'Repayment', '2144-06-28', '06', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1545, 6, 2, 'Repayment', '2144-07-28', '07', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1546, 6, 2, 'Repayment', '2144-08-28', '08', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1547, 6, 2, 'Repayment', '2144-09-28', '09', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1548, 6, 2, 'Repayment', '2144-10-28', '10', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1549, 6, 2, 'Repayment', '2144-11-28', '11', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1550, 6, 2, 'Repayment', '2144-12-28', '12', '2144', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1551, 6, 2, 'Repayment', '2145-01-28', '01', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1552, 6, 2, 'Repayment', '2145-02-28', '02', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1553, 6, 2, 'Repayment', '2145-03-28', '03', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1554, 6, 2, 'Repayment', '2145-04-28', '04', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1555, 6, 2, 'Repayment', '2145-05-28', '05', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1556, 6, 2, 'Repayment', '2145-06-28', '06', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1557, 6, 2, 'Repayment', '2145-07-28', '07', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1558, 6, 2, 'Repayment', '2145-08-28', '08', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1559, 6, 2, 'Repayment', '2145-09-28', '09', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1560, 6, 2, 'Repayment', '2145-10-28', '10', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1561, 6, 2, 'Repayment', '2145-11-28', '11', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1562, 6, 2, 'Repayment', '2145-12-28', '12', '2145', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1563, 6, 2, 'Repayment', '2146-01-28', '01', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1564, 6, 2, 'Repayment', '2146-02-28', '02', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1565, 6, 2, 'Repayment', '2146-03-28', '03', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1566, 6, 2, 'Repayment', '2146-04-28', '04', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1567, 6, 2, 'Repayment', '2146-05-28', '05', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1568, 6, 2, 'Repayment', '2146-06-28', '06', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1569, 6, 2, 'Repayment', '2146-07-28', '07', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1570, 6, 2, 'Repayment', '2146-08-28', '08', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1571, 6, 2, 'Repayment', '2146-09-28', '09', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1572, 6, 2, 'Repayment', '2146-10-28', '10', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1573, 6, 2, 'Repayment', '2146-11-28', '11', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1574, 6, 2, 'Repayment', '2146-12-28', '12', '2146', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1575, 6, 2, 'Repayment', '2147-01-28', '01', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1576, 6, 2, 'Repayment', '2147-02-28', '02', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1577, 6, 2, 'Repayment', '2147-03-28', '03', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1578, 6, 2, 'Repayment', '2147-04-28', '04', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1579, 6, 2, 'Repayment', '2147-05-28', '05', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:56', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1580, 6, 2, 'Repayment', '2147-06-28', '06', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1581, 6, 2, 'Repayment', '2147-07-28', '07', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1582, 6, 2, 'Repayment', '2147-08-28', '08', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1583, 6, 2, 'Repayment', '2147-09-28', '09', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1584, 6, 2, 'Repayment', '2147-10-28', '10', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1585, 6, 2, 'Repayment', '2147-11-28', '11', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1586, 6, 2, 'Repayment', '2147-12-28', '12', '2147', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1587, 6, 2, 'Repayment', '2148-01-28', '01', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1588, 6, 2, 'Repayment', '2148-02-28', '02', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1589, 6, 2, 'Repayment', '2148-03-28', '03', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1590, 6, 2, 'Repayment', '2148-04-28', '04', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1591, 6, 2, 'Repayment', '2148-05-28', '05', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1592, 6, 2, 'Repayment', '2148-06-28', '06', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1593, 6, 2, 'Repayment', '2148-07-28', '07', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1594, 6, 2, 'Repayment', '2148-08-28', '08', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1595, 6, 2, 'Repayment', '2148-09-28', '09', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1596, 6, 2, 'Repayment', '2148-10-28', '10', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1597, 6, 2, 'Repayment', '2148-11-28', '11', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1598, 6, 2, 'Repayment', '2148-12-28', '12', '2148', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1599, 6, 2, 'Repayment', '2149-01-28', '01', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1600, 6, 2, 'Repayment', '2149-02-28', '02', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1601, 6, 2, 'Repayment', '2149-03-28', '03', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1602, 6, 2, 'Repayment', '2149-04-28', '04', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1603, 6, 2, 'Repayment', '2149-05-28', '05', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1604, 6, 2, 'Repayment', '2149-06-28', '06', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1605, 6, 2, 'Repayment', '2149-07-28', '07', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1606, 6, 2, 'Repayment', '2149-08-28', '08', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1607, 6, 2, 'Repayment', '2149-09-28', '09', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1608, 6, 2, 'Repayment', '2149-10-28', '10', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1609, 6, 2, 'Repayment', '2149-11-28', '11', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1610, 6, 2, 'Repayment', '2149-12-28', '12', '2149', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1611, 6, 2, 'Repayment', '2150-01-28', '01', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1612, 6, 2, 'Repayment', '2150-02-28', '02', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1613, 6, 2, 'Repayment', '2150-03-28', '03', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1614, 6, 2, 'Repayment', '2150-04-28', '04', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1615, 6, 2, 'Repayment', '2150-05-28', '05', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1616, 6, 2, 'Repayment', '2150-06-28', '06', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1617, 6, 2, 'Repayment', '2150-07-28', '07', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1618, 6, 2, 'Repayment', '2150-08-28', '08', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1619, 6, 2, 'Repayment', '2150-09-28', '09', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1620, 6, 2, 'Repayment', '2150-10-28', '10', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1621, 6, 2, 'Repayment', '2150-11-28', '11', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1622, 6, 2, 'Repayment', '2150-12-28', '12', '2150', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1623, 6, 2, 'Repayment', '2151-01-28', '01', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1624, 6, 2, 'Repayment', '2151-02-28', '02', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1625, 6, 2, 'Repayment', '2151-03-28', '03', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1626, 6, 2, 'Repayment', '2151-04-28', '04', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1627, 6, 2, 'Repayment', '2151-05-28', '05', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1628, 6, 2, 'Repayment', '2151-06-28', '06', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1629, 6, 2, 'Repayment', '2151-07-28', '07', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1630, 6, 2, 'Repayment', '2151-08-28', '08', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1631, 6, 2, 'Repayment', '2151-09-28', '09', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1632, 6, 2, 'Repayment', '2151-10-28', '10', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1633, 6, 2, 'Repayment', '2151-11-28', '11', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1634, 6, 2, 'Repayment', '2151-12-28', '12', '2151', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1635, 6, 2, 'Repayment', '2152-01-28', '01', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1636, 6, 2, 'Repayment', '2152-02-28', '02', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1637, 6, 2, 'Repayment', '2152-03-28', '03', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1638, 6, 2, 'Repayment', '2152-04-28', '04', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1639, 6, 2, 'Repayment', '2152-05-28', '05', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1640, 6, 2, 'Repayment', '2152-06-28', '06', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1641, 6, 2, 'Repayment', '2152-07-28', '07', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1642, 6, 2, 'Repayment', '2152-08-28', '08', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1643, 6, 2, 'Repayment', '2152-09-28', '09', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1644, 6, 2, 'Repayment', '2152-10-28', '10', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1645, 6, 2, 'Repayment', '2152-11-28', '11', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1646, 6, 2, 'Repayment', '2152-12-28', '12', '2152', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1647, 6, 2, 'Repayment', '2153-01-28', '01', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1648, 6, 2, 'Repayment', '2153-02-28', '02', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1649, 6, 2, 'Repayment', '2153-03-28', '03', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1650, 6, 2, 'Repayment', '2153-04-28', '04', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1651, 6, 2, 'Repayment', '2153-05-28', '05', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1652, 6, 2, 'Repayment', '2153-06-28', '06', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1653, 6, 2, 'Repayment', '2153-07-28', '07', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1654, 6, 2, 'Repayment', '2153-08-28', '08', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1655, 6, 2, 'Repayment', '2153-09-28', '09', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1656, 6, 2, 'Repayment', '2153-10-28', '10', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1657, 6, 2, 'Repayment', '2153-11-28', '11', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1658, 6, 2, 'Repayment', '2153-12-28', '12', '2153', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1659, 6, 2, 'Repayment', '2154-01-28', '01', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1660, 6, 2, 'Repayment', '2154-02-28', '02', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1661, 6, 2, 'Repayment', '2154-03-28', '03', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1662, 6, 2, 'Repayment', '2154-04-28', '04', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1663, 6, 2, 'Repayment', '2154-05-28', '05', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1664, 6, 2, 'Repayment', '2154-06-28', '06', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1665, 6, 2, 'Repayment', '2154-07-28', '07', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1666, 6, 2, 'Repayment', '2154-08-28', '08', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1667, 6, 2, 'Repayment', '2154-09-28', '09', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1668, 6, 2, 'Repayment', '2154-10-28', '10', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1669, 6, 2, 'Repayment', '2154-11-28', '11', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1670, 6, 2, 'Repayment', '2154-12-28', '12', '2154', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1671, 6, 2, 'Repayment', '2155-01-28', '01', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1672, 6, 2, 'Repayment', '2155-02-28', '02', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1673, 6, 2, 'Repayment', '2155-03-28', '03', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1674, 6, 2, 'Repayment', '2155-04-28', '04', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1675, 6, 2, 'Repayment', '2155-05-28', '05', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1676, 6, 2, 'Repayment', '2155-06-28', '06', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1677, 6, 2, 'Repayment', '2155-07-28', '07', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1678, 6, 2, 'Repayment', '2155-08-28', '08', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1679, 6, 2, 'Repayment', '2155-09-28', '09', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1680, 6, 2, 'Repayment', '2155-10-28', '10', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1681, 6, 2, 'Repayment', '2155-11-28', '11', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1682, 6, 2, 'Repayment', '2155-12-28', '12', '2155', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1683, 6, 2, 'Repayment', '2156-01-28', '01', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1684, 6, 2, 'Repayment', '2156-02-28', '02', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1685, 6, 2, 'Repayment', '2156-03-28', '03', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1686, 6, 2, 'Repayment', '2156-04-28', '04', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(1687, 6, 2, 'Repayment', '2156-05-28', '05', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1688, 6, 2, 'Repayment', '2156-06-28', '06', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1689, 6, 2, 'Repayment', '2156-07-28', '07', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1690, 6, 2, 'Repayment', '2156-08-28', '08', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1691, 6, 2, 'Repayment', '2156-09-28', '09', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1692, 6, 2, 'Repayment', '2156-10-28', '10', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1693, 6, 2, 'Repayment', '2156-11-28', '11', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1694, 6, 2, 'Repayment', '2156-12-28', '12', '2156', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1695, 6, 2, 'Repayment', '2157-01-28', '01', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1696, 6, 2, 'Repayment', '2157-02-28', '02', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1697, 6, 2, 'Repayment', '2157-03-28', '03', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1698, 6, 2, 'Repayment', '2157-04-28', '04', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1699, 6, 2, 'Repayment', '2157-05-28', '05', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1700, 6, 2, 'Repayment', '2157-06-28', '06', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1701, 6, 2, 'Repayment', '2157-07-28', '07', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1702, 6, 2, 'Repayment', '2157-08-28', '08', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1703, 6, 2, 'Repayment', '2157-09-28', '09', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1704, 6, 2, 'Repayment', '2157-10-28', '10', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1705, 6, 2, 'Repayment', '2157-11-28', '11', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1706, 6, 2, 'Repayment', '2157-12-28', '12', '2157', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1707, 6, 2, 'Repayment', '2158-01-28', '01', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1708, 6, 2, 'Repayment', '2158-02-28', '02', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1709, 6, 2, 'Repayment', '2158-03-28', '03', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1710, 6, 2, 'Repayment', '2158-04-28', '04', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1711, 6, 2, 'Repayment', '2158-05-28', '05', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:57', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1712, 6, 2, 'Repayment', '2158-06-28', '06', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1713, 6, 2, 'Repayment', '2158-07-28', '07', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1714, 6, 2, 'Repayment', '2158-08-28', '08', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1715, 6, 2, 'Repayment', '2158-09-28', '09', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1716, 6, 2, 'Repayment', '2158-10-28', '10', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1717, 6, 2, 'Repayment', '2158-11-28', '11', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1718, 6, 2, 'Repayment', '2158-12-28', '12', '2158', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1719, 6, 2, 'Repayment', '2159-01-28', '01', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1720, 6, 2, 'Repayment', '2159-02-28', '02', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1721, 6, 2, 'Repayment', '2159-03-28', '03', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1722, 6, 2, 'Repayment', '2159-04-28', '04', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1723, 6, 2, 'Repayment', '2159-05-28', '05', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1724, 6, 2, 'Repayment', '2159-06-28', '06', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1725, 6, 2, 'Repayment', '2159-07-28', '07', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1726, 6, 2, 'Repayment', '2159-08-28', '08', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1727, 6, 2, 'Repayment', '2159-09-28', '09', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1728, 6, 2, 'Repayment', '2159-10-28', '10', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1729, 6, 2, 'Repayment', '2159-11-28', '11', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1730, 6, 2, 'Repayment', '2159-12-28', '12', '2159', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1731, 6, 2, 'Repayment', '2160-01-28', '01', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1732, 6, 2, 'Repayment', '2160-02-28', '02', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1733, 6, 2, 'Repayment', '2160-03-28', '03', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1734, 6, 2, 'Repayment', '2160-04-28', '04', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1735, 6, 2, 'Repayment', '2160-05-28', '05', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1736, 6, 2, 'Repayment', '2160-06-28', '06', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1737, 6, 2, 'Repayment', '2160-07-28', '07', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1738, 6, 2, 'Repayment', '2160-08-28', '08', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1739, 6, 2, 'Repayment', '2160-09-28', '09', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1740, 6, 2, 'Repayment', '2160-10-28', '10', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1741, 6, 2, 'Repayment', '2160-11-28', '11', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1742, 6, 2, 'Repayment', '2160-12-28', '12', '2160', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1743, 6, 2, 'Repayment', '2161-01-28', '01', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1744, 6, 2, 'Repayment', '2161-02-28', '02', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1745, 6, 2, 'Repayment', '2161-03-28', '03', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1746, 6, 2, 'Repayment', '2161-04-28', '04', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1747, 6, 2, 'Repayment', '2161-05-28', '05', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1748, 6, 2, 'Repayment', '2161-06-28', '06', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1749, 6, 2, 'Repayment', '2161-07-28', '07', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1750, 6, 2, 'Repayment', '2161-08-28', '08', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1751, 6, 2, 'Repayment', '2161-09-28', '09', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1752, 6, 2, 'Repayment', '2161-10-28', '10', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1753, 6, 2, 'Repayment', '2161-11-28', '11', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1754, 6, 2, 'Repayment', '2161-12-28', '12', '2161', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1755, 6, 2, 'Repayment', '2162-01-28', '01', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1756, 6, 2, 'Repayment', '2162-02-28', '02', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1757, 6, 2, 'Repayment', '2162-03-28', '03', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1758, 6, 2, 'Repayment', '2162-04-28', '04', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1759, 6, 2, 'Repayment', '2162-05-28', '05', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1760, 6, 2, 'Repayment', '2162-06-28', '06', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1761, 6, 2, 'Repayment', '2162-07-28', '07', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1762, 6, 2, 'Repayment', '2162-08-28', '08', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1763, 6, 2, 'Repayment', '2162-09-28', '09', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1764, 6, 2, 'Repayment', '2162-10-28', '10', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1765, 6, 2, 'Repayment', '2162-11-28', '11', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1766, 6, 2, 'Repayment', '2162-12-28', '12', '2162', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1767, 6, 2, 'Repayment', '2163-01-28', '01', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1768, 6, 2, 'Repayment', '2163-02-28', '02', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1769, 6, 2, 'Repayment', '2163-03-28', '03', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1770, 6, 2, 'Repayment', '2163-04-28', '04', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1771, 6, 2, 'Repayment', '2163-05-28', '05', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1772, 6, 2, 'Repayment', '2163-06-28', '06', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1773, 6, 2, 'Repayment', '2163-07-28', '07', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1774, 6, 2, 'Repayment', '2163-08-28', '08', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1775, 6, 2, 'Repayment', '2163-09-28', '09', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1776, 6, 2, 'Repayment', '2163-10-28', '10', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1777, 6, 2, 'Repayment', '2163-11-28', '11', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1778, 6, 2, 'Repayment', '2163-12-28', '12', '2163', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1779, 6, 2, 'Repayment', '2164-01-28', '01', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1780, 6, 2, 'Repayment', '2164-02-28', '02', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1781, 6, 2, 'Repayment', '2164-03-28', '03', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1782, 6, 2, 'Repayment', '2164-04-28', '04', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1783, 6, 2, 'Repayment', '2164-05-28', '05', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1784, 6, 2, 'Repayment', '2164-06-28', '06', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1785, 6, 2, 'Repayment', '2164-07-28', '07', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1786, 6, 2, 'Repayment', '2164-08-28', '08', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1787, 6, 2, 'Repayment', '2164-09-28', '09', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1788, 6, 2, 'Repayment', '2164-10-28', '10', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1789, 6, 2, 'Repayment', '2164-11-28', '11', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1790, 6, 2, 'Repayment', '2164-12-28', '12', '2164', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1791, 6, 2, 'Repayment', '2165-01-28', '01', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1792, 6, 2, 'Repayment', '2165-02-28', '02', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1793, 6, 2, 'Repayment', '2165-03-28', '03', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1794, 6, 2, 'Repayment', '2165-04-28', '04', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1795, 6, 2, 'Repayment', '2165-05-28', '05', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1796, 6, 2, 'Repayment', '2165-06-28', '06', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1797, 6, 2, 'Repayment', '2165-07-28', '07', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1798, 6, 2, 'Repayment', '2165-08-28', '08', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1799, 6, 2, 'Repayment', '2165-09-28', '09', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1800, 6, 2, 'Repayment', '2165-10-28', '10', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1801, 6, 2, 'Repayment', '2165-11-28', '11', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1802, 6, 2, 'Repayment', '2165-12-28', '12', '2165', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1803, 6, 2, 'Repayment', '2166-01-28', '01', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1804, 6, 2, 'Repayment', '2166-02-28', '02', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1805, 6, 2, 'Repayment', '2166-03-28', '03', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1806, 6, 2, 'Repayment', '2166-04-28', '04', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1807, 6, 2, 'Repayment', '2166-05-28', '05', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1808, 6, 2, 'Repayment', '2166-06-28', '06', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1809, 6, 2, 'Repayment', '2166-07-28', '07', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1810, 6, 2, 'Repayment', '2166-08-28', '08', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1811, 6, 2, 'Repayment', '2166-09-28', '09', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1812, 6, 2, 'Repayment', '2166-10-28', '10', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1813, 6, 2, 'Repayment', '2166-11-28', '11', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1814, 6, 2, 'Repayment', '2166-12-28', '12', '2166', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1815, 6, 2, 'Repayment', '2167-01-28', '01', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1816, 6, 2, 'Repayment', '2167-02-28', '02', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1817, 6, 2, 'Repayment', '2167-03-28', '03', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1818, 6, 2, 'Repayment', '2167-04-28', '04', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1819, 6, 2, 'Repayment', '2167-05-28', '05', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1820, 6, 2, 'Repayment', '2167-06-28', '06', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1821, 6, 2, 'Repayment', '2167-07-28', '07', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1822, 6, 2, 'Repayment', '2167-08-28', '08', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1823, 6, 2, 'Repayment', '2167-09-28', '09', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1824, 6, 2, 'Repayment', '2167-10-28', '10', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1825, 6, 2, 'Repayment', '2167-11-28', '11', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1826, 6, 2, 'Repayment', '2167-12-28', '12', '2167', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1827, 6, 2, 'Repayment', '2168-01-28', '01', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1828, 6, 2, 'Repayment', '2168-02-28', '02', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1829, 6, 2, 'Repayment', '2168-03-28', '03', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1830, 6, 2, 'Repayment', '2168-04-28', '04', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1831, 6, 2, 'Repayment', '2168-05-28', '05', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1832, 6, 2, 'Repayment', '2168-06-28', '06', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1833, 6, 2, 'Repayment', '2168-07-28', '07', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1834, 6, 2, 'Repayment', '2168-08-28', '08', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1835, 6, 2, 'Repayment', '2168-09-28', '09', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1836, 6, 2, 'Repayment', '2168-10-28', '10', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1837, 6, 2, 'Repayment', '2168-11-28', '11', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1838, 6, 2, 'Repayment', '2168-12-28', '12', '2168', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1839, 6, 2, 'Repayment', '2169-01-28', '01', '2169', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1840, 6, 2, 'Repayment', '2169-02-28', '02', '2169', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1841, 6, 2, 'Repayment', '2169-03-28', '03', '2169', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:58', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1842, 6, 2, 'Repayment', '2169-04-28', '04', '2169', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:59', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1843, 6, 2, 'Repayment', '2169-05-28', '05', '2169', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:59', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1844, 6, 2, 'Repayment', '2169-06-28', '06', '2169', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:59', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1845, 6, 2, 'Repayment', '2169-07-28', '07', '2169', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:59', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1846, 6, 2, 'Repayment', '2169-08-28', '08', '2169', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:59', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1847, 6, 2, 'Repayment', '2169-09-28', '09', '2169', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:59', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1848, 6, 2, 'Repayment', '2169-10-28', '10', '2169', '0.0000', '100000.0000', '10000.0000', '32.8947', NULL, '10000.0000', 0, 0, 0, 0, '2017-10-27 17:17:59', '2017-11-07 20:22:03', '2017-11-07 20:22:03', 1),
(1849, 3, 4, 'Repayment', '2018-01-01', '01', '2018', '12914.0000', '987086.0000', '0.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1850, 3, 4, 'Repayment', '2018-02-01', '02', '2018', '13021.0000', '974065.0000', '8226.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1851, 3, 4, 'Repayment', '2018-03-01', '03', '2018', '13130.0000', '960935.0000', '8117.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1852, 3, 4, 'Repayment', '2018-04-01', '04', '2018', '13239.0000', '947696.0000', '8008.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1853, 3, 4, 'Repayment', '2018-05-01', '05', '2018', '13350.0000', '934346.0000', '7897.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1854, 3, 4, 'Repayment', '2018-06-01', '06', '2018', '13461.0000', '920885.0000', '7786.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1855, 3, 4, 'Repayment', '2018-07-01', '07', '2018', '13573.0000', '907312.0000', '7674.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1856, 3, 4, 'Repayment', '2018-08-01', '08', '2018', '13686.0000', '893626.0000', '7561.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1857, 3, 4, 'Repayment', '2018-09-01', '09', '2018', '13800.0000', '879826.0000', '7447.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1858, 3, 4, 'Repayment', '2018-10-01', '10', '2018', '13915.0000', '865911.0000', '7332.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1859, 3, 4, 'Repayment', '2018-11-01', '11', '2018', '14031.0000', '851880.0000', '7216.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1860, 3, 4, 'Repayment', '2018-12-01', '12', '2018', '14148.0000', '837732.0000', '7099.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1861, 3, 4, 'Repayment', '2019-01-01', '01', '2019', '14266.0000', '823466.0000', '6981.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1862, 3, 4, 'Repayment', '2019-02-01', '02', '2019', '14385.0000', '809081.0000', '6862.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1863, 3, 4, 'Repayment', '2019-03-01', '03', '2019', '14505.0000', '794576.0000', '6742.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1864, 3, 4, 'Repayment', '2019-04-01', '04', '2019', '14626.0000', '779950.0000', '6621.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1865, 3, 4, 'Repayment', '2019-05-01', '05', '2019', '14747.0000', '765203.0000', '6500.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1866, 3, 4, 'Repayment', '2019-06-01', '06', '2019', '14870.0000', '750333.0000', '6377.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1867, 3, 4, 'Repayment', '2019-07-01', '07', '2019', '14994.0000', '735339.0000', '6253.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1868, 3, 4, 'Repayment', '2019-08-01', '08', '2019', '15119.0000', '720220.0000', '6128.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1869, 3, 4, 'Repayment', '2019-09-01', '09', '2019', '15245.0000', '704975.0000', '6002.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1870, 3, 4, 'Repayment', '2019-10-01', '10', '2019', '15372.0000', '689603.0000', '5875.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1871, 3, 4, 'Repayment', '2019-11-01', '11', '2019', '15500.0000', '674103.0000', '5747.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1872, 3, 4, 'Repayment', '2019-12-01', '12', '2019', '15629.0000', '658474.0000', '5618.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1873, 3, 4, 'Repayment', '2020-01-01', '01', '2020', '15760.0000', '642714.0000', '5487.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1874, 3, 4, 'Repayment', '2020-02-01', '02', '2020', '15891.0000', '626823.0000', '5356.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1875, 3, 4, 'Repayment', '2020-03-01', '03', '2020', '16023.0000', '610800.0000', '5224.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1876, 3, 4, 'Repayment', '2020-04-01', '04', '2020', '16157.0000', '594643.0000', '5090.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1877, 3, 4, 'Repayment', '2020-05-01', '05', '2020', '16292.0000', '578351.0000', '4955.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1878, 3, 4, 'Repayment', '2020-06-01', '06', '2020', '16427.0000', '561924.0000', '4820.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1879, 3, 4, 'Repayment', '2020-07-01', '07', '2020', '16564.0000', '545360.0000', '4683.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1880, 3, 4, 'Repayment', '2020-08-01', '08', '2020', '16702.0000', '528658.0000', '4545.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1881, 3, 4, 'Repayment', '2020-09-01', '09', '2020', '16842.0000', '511816.0000', '4405.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1882, 3, 4, 'Repayment', '2020-10-01', '10', '2020', '16982.0000', '494834.0000', '4265.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1883, 3, 4, 'Repayment', '2020-11-01', '11', '2020', '17123.0000', '477711.0000', '4124.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1884, 3, 4, 'Repayment', '2020-12-01', '12', '2020', '17266.0000', '460445.0000', '3981.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1885, 3, 4, 'Repayment', '2021-01-01', '01', '2021', '17410.0000', '443035.0000', '3837.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1886, 3, 4, 'Repayment', '2021-02-01', '02', '2021', '17555.0000', '425480.0000', '3692.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1887, 3, 4, 'Repayment', '2021-03-01', '03', '2021', '17701.0000', '407779.0000', '3546.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1888, 3, 4, 'Repayment', '2021-04-01', '04', '2021', '17849.0000', '389930.0000', '3398.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1889, 3, 4, 'Repayment', '2021-05-01', '05', '2021', '17998.0000', '371932.0000', '3249.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1890, 3, 4, 'Repayment', '2021-06-01', '06', '2021', '18148.0000', '353784.0000', '3099.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1891, 3, 4, 'Repayment', '2021-07-01', '07', '2021', '18299.0000', '335485.0000', '2948.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1892, 3, 4, 'Repayment', '2021-08-01', '08', '2021', '18451.0000', '317034.0000', '2796.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1893, 3, 4, 'Repayment', '2021-09-01', '09', '2021', '18605.0000', '298429.0000', '2642.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1894, 3, 4, 'Repayment', '2021-10-01', '10', '2021', '18760.0000', '279669.0000', '2487.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1895, 3, 4, 'Repayment', '2021-11-01', '11', '2021', '18916.0000', '260753.0000', '2331.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1896, 3, 4, 'Repayment', '2021-12-01', '12', '2021', '19074.0000', '241679.0000', '2173.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1897, 3, 4, 'Repayment', '2022-01-01', '01', '2022', '19233.0000', '222446.0000', '2014.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1898, 3, 4, 'Repayment', '2022-02-01', '02', '2022', '19393.0000', '203053.0000', '1854.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1899, 3, 4, 'Repayment', '2022-03-01', '03', '2022', '19555.0000', '183498.0000', '1692.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1900, 3, 4, 'Repayment', '2022-04-01', '04', '2022', '19718.0000', '163780.0000', '1529.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1901, 3, 4, 'Repayment', '2022-05-01', '05', '2022', '19882.0000', '143898.0000', '1365.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1902, 3, 4, 'Repayment', '2022-06-01', '06', '2022', '20048.0000', '123850.0000', '1199.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1903, 3, 4, 'Repayment', '2022-07-01', '07', '2022', '20215.0000', '103635.0000', '1032.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1904, 3, 4, 'Repayment', '2022-08-01', '08', '2022', '20383.0000', '83252.0000', '864.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1905, 3, 4, 'Repayment', '2022-09-01', '09', '2022', '20553.0000', '62699.0000', '694.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1906, 3, 4, 'Repayment', '2022-10-01', '10', '2022', '20725.0000', '41974.0000', '522.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1907, 3, 4, 'Repayment', '2022-11-01', '11', '2022', '20897.0000', '21077.0000', '350.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1908, 3, 4, 'Repayment', '2022-12-01', '12', '2022', '21071.0000', '6.0000', '176.0000', '0.0000', NULL, '21247.0000', 0, 0, 0, 0, '2017-11-02 19:35:12', '2017-11-02 19:35:12', NULL, 1),
(1909, 7, 2, 'Repayment', '2017-12-02', '12', '2017', '164.0000', '299836.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1910, 7, 2, 'Repayment', '2018-01-02', '01', '2018', '164.0000', '299672.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1911, 7, 2, 'Repayment', '2018-02-02', '02', '2018', '164.0000', '299508.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1912, 7, 2, 'Repayment', '2018-03-02', '03', '2018', '164.0000', '299344.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1913, 7, 2, 'Repayment', '2018-04-02', '04', '2018', '164.0000', '299180.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1914, 7, 2, 'Repayment', '2018-05-02', '05', '2018', '164.0000', '299016.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1915, 7, 2, 'Repayment', '2018-06-02', '06', '2018', '164.0000', '298852.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1916, 7, 2, 'Repayment', '2018-07-02', '07', '2018', '164.0000', '298688.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1917, 7, 2, 'Repayment', '2018-08-02', '08', '2018', '164.0000', '298524.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1918, 7, 2, 'Repayment', '2018-09-02', '09', '2018', '164.0000', '298360.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1919, 7, 2, 'Repayment', '2018-10-02', '10', '2018', '164.0000', '298196.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1920, 7, 2, 'Repayment', '2018-11-02', '11', '2018', '164.0000', '298032.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1921, 7, 2, 'Repayment', '2018-12-02', '12', '2018', '164.0000', '297868.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1922, 7, 2, 'Repayment', '2019-01-02', '01', '2019', '164.0000', '297704.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1923, 7, 2, 'Repayment', '2019-02-02', '02', '2019', '164.0000', '297540.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1924, 7, 2, 'Repayment', '2019-03-02', '03', '2019', '164.0000', '297376.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:21', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1925, 7, 2, 'Repayment', '2019-04-02', '04', '2019', '164.0000', '297212.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1926, 7, 2, 'Repayment', '2019-05-02', '05', '2019', '164.0000', '297048.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1927, 7, 2, 'Repayment', '2019-06-02', '06', '2019', '164.0000', '296884.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1928, 7, 2, 'Repayment', '2019-07-02', '07', '2019', '164.0000', '296720.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1929, 7, 2, 'Repayment', '2019-08-02', '08', '2019', '164.0000', '296556.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1930, 7, 2, 'Repayment', '2019-09-02', '09', '2019', '164.0000', '296392.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(1931, 7, 2, 'Repayment', '2019-10-02', '10', '2019', '164.0000', '296228.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1932, 7, 2, 'Repayment', '2019-11-02', '11', '2019', '164.0000', '296064.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1933, 7, 2, 'Repayment', '2019-12-02', '12', '2019', '164.0000', '295900.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1934, 7, 2, 'Repayment', '2020-01-02', '01', '2020', '164.0000', '295736.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1935, 7, 2, 'Repayment', '2020-02-02', '02', '2020', '164.0000', '295572.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1936, 7, 2, 'Repayment', '2020-03-02', '03', '2020', '164.0000', '295408.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1937, 7, 2, 'Repayment', '2020-04-02', '04', '2020', '164.0000', '295244.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1938, 7, 2, 'Repayment', '2020-05-02', '05', '2020', '164.0000', '295080.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1939, 7, 2, 'Repayment', '2020-06-02', '06', '2020', '164.0000', '294916.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1940, 7, 2, 'Repayment', '2020-07-02', '07', '2020', '164.0000', '294752.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1941, 7, 2, 'Repayment', '2020-08-02', '08', '2020', '164.0000', '294588.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1942, 7, 2, 'Repayment', '2020-09-02', '09', '2020', '164.0000', '294424.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1943, 7, 2, 'Repayment', '2020-10-02', '10', '2020', '164.0000', '294260.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1944, 7, 2, 'Repayment', '2020-11-02', '11', '2020', '164.0000', '294096.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1945, 7, 2, 'Repayment', '2020-12-02', '12', '2020', '164.0000', '293932.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1946, 7, 2, 'Repayment', '2021-01-02', '01', '2021', '164.0000', '293768.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1947, 7, 2, 'Repayment', '2021-02-02', '02', '2021', '164.0000', '293604.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1948, 7, 2, 'Repayment', '2021-03-02', '03', '2021', '164.0000', '293440.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1949, 7, 2, 'Repayment', '2021-04-02', '04', '2021', '164.0000', '293276.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1950, 7, 2, 'Repayment', '2021-05-02', '05', '2021', '164.0000', '293112.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1951, 7, 2, 'Repayment', '2021-06-02', '06', '2021', '164.0000', '292948.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1952, 7, 2, 'Repayment', '2021-07-02', '07', '2021', '164.0000', '292784.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1953, 7, 2, 'Repayment', '2021-08-02', '08', '2021', '164.0000', '292620.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1954, 7, 2, 'Repayment', '2021-09-02', '09', '2021', '164.0000', '292456.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1955, 7, 2, 'Repayment', '2021-10-02', '10', '2021', '164.0000', '292292.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1956, 7, 2, 'Repayment', '2021-11-02', '11', '2021', '164.0000', '292128.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1957, 7, 2, 'Repayment', '2021-12-02', '12', '2021', '164.0000', '291964.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1958, 7, 2, 'Repayment', '2022-01-02', '01', '2022', '164.0000', '291800.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1959, 7, 2, 'Repayment', '2022-02-02', '02', '2022', '164.0000', '291636.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1960, 7, 2, 'Repayment', '2022-03-02', '03', '2022', '164.0000', '291472.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1961, 7, 2, 'Repayment', '2022-04-02', '04', '2022', '164.0000', '291308.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1962, 7, 2, 'Repayment', '2022-05-02', '05', '2022', '164.0000', '291144.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1963, 7, 2, 'Repayment', '2022-06-02', '06', '2022', '164.0000', '290980.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1964, 7, 2, 'Repayment', '2022-07-02', '07', '2022', '164.0000', '290816.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1965, 7, 2, 'Repayment', '2022-08-02', '08', '2022', '164.0000', '290652.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1966, 7, 2, 'Repayment', '2022-09-02', '09', '2022', '164.0000', '290488.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1967, 7, 2, 'Repayment', '2022-10-02', '10', '2022', '164.0000', '290324.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1968, 7, 2, 'Repayment', '2022-11-02', '11', '2022', '164.0000', '290160.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1969, 7, 2, 'Repayment', '2022-12-02', '12', '2022', '164.0000', '289996.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1970, 7, 2, 'Repayment', '2023-01-02', '01', '2023', '164.0000', '289832.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1971, 7, 2, 'Repayment', '2023-02-02', '02', '2023', '164.0000', '289668.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1972, 7, 2, 'Repayment', '2023-03-02', '03', '2023', '164.0000', '289504.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1973, 7, 2, 'Repayment', '2023-04-02', '04', '2023', '164.0000', '289340.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1974, 7, 2, 'Repayment', '2023-05-02', '05', '2023', '164.0000', '289176.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1975, 7, 2, 'Repayment', '2023-06-02', '06', '2023', '164.0000', '289012.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1976, 7, 2, 'Repayment', '2023-07-02', '07', '2023', '164.0000', '288848.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1977, 7, 2, 'Repayment', '2023-08-02', '08', '2023', '164.0000', '288684.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1978, 7, 2, 'Repayment', '2023-09-02', '09', '2023', '164.0000', '288520.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1979, 7, 2, 'Repayment', '2023-10-02', '10', '2023', '164.0000', '288356.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1980, 7, 2, 'Repayment', '2023-11-02', '11', '2023', '164.0000', '288192.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1981, 7, 2, 'Repayment', '2023-12-02', '12', '2023', '164.0000', '288028.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1982, 7, 2, 'Repayment', '2024-01-02', '01', '2024', '164.0000', '287864.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1983, 7, 2, 'Repayment', '2024-02-02', '02', '2024', '164.0000', '287700.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1984, 7, 2, 'Repayment', '2024-03-02', '03', '2024', '164.0000', '287536.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1985, 7, 2, 'Repayment', '2024-04-02', '04', '2024', '164.0000', '287372.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1986, 7, 2, 'Repayment', '2024-05-02', '05', '2024', '164.0000', '287208.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1987, 7, 2, 'Repayment', '2024-06-02', '06', '2024', '164.0000', '287044.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1988, 7, 2, 'Repayment', '2024-07-02', '07', '2024', '164.0000', '286880.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1989, 7, 2, 'Repayment', '2024-08-02', '08', '2024', '164.0000', '286716.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1990, 7, 2, 'Repayment', '2024-09-02', '09', '2024', '164.0000', '286552.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1991, 7, 2, 'Repayment', '2024-10-02', '10', '2024', '164.0000', '286388.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1992, 7, 2, 'Repayment', '2024-11-02', '11', '2024', '164.0000', '286224.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1993, 7, 2, 'Repayment', '2024-12-02', '12', '2024', '164.0000', '286060.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1994, 7, 2, 'Repayment', '2025-01-02', '01', '2025', '164.0000', '285896.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1995, 7, 2, 'Repayment', '2025-02-02', '02', '2025', '164.0000', '285732.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1996, 7, 2, 'Repayment', '2025-03-02', '03', '2025', '164.0000', '285568.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1997, 7, 2, 'Repayment', '2025-04-02', '04', '2025', '164.0000', '285404.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1998, 7, 2, 'Repayment', '2025-05-02', '05', '2025', '164.0000', '285240.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(1999, 7, 2, 'Repayment', '2025-06-02', '06', '2025', '164.0000', '285076.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2000, 7, 2, 'Repayment', '2025-07-02', '07', '2025', '164.0000', '284912.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2001, 7, 2, 'Repayment', '2025-08-02', '08', '2025', '164.0000', '284748.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2002, 7, 2, 'Repayment', '2025-09-02', '09', '2025', '164.0000', '284584.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2003, 7, 2, 'Repayment', '2025-10-02', '10', '2025', '164.0000', '284420.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2004, 7, 2, 'Repayment', '2025-11-02', '11', '2025', '164.0000', '284256.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2005, 7, 2, 'Repayment', '2025-12-02', '12', '2025', '164.0000', '284092.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2006, 7, 2, 'Repayment', '2026-01-02', '01', '2026', '164.0000', '283928.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2007, 7, 2, 'Repayment', '2026-02-02', '02', '2026', '164.0000', '283764.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2008, 7, 2, 'Repayment', '2026-03-02', '03', '2026', '164.0000', '283600.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2009, 7, 2, 'Repayment', '2026-04-02', '04', '2026', '164.0000', '283436.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2010, 7, 2, 'Repayment', '2026-05-02', '05', '2026', '164.0000', '283272.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2011, 7, 2, 'Repayment', '2026-06-02', '06', '2026', '164.0000', '283108.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2012, 7, 2, 'Repayment', '2026-07-02', '07', '2026', '164.0000', '282944.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2013, 7, 2, 'Repayment', '2026-08-02', '08', '2026', '164.0000', '282780.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2014, 7, 2, 'Repayment', '2026-09-02', '09', '2026', '164.0000', '282616.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2015, 7, 2, 'Repayment', '2026-10-02', '10', '2026', '164.0000', '282452.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2016, 7, 2, 'Repayment', '2026-11-02', '11', '2026', '164.0000', '282288.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2017, 7, 2, 'Repayment', '2026-12-02', '12', '2026', '164.0000', '282124.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2018, 7, 2, 'Repayment', '2027-01-02', '01', '2027', '164.0000', '281960.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2019, 7, 2, 'Repayment', '2027-02-02', '02', '2027', '164.0000', '281796.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2020, 7, 2, 'Repayment', '2027-03-02', '03', '2027', '164.0000', '281632.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2021, 7, 2, 'Repayment', '2027-04-02', '04', '2027', '164.0000', '281468.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2022, 7, 2, 'Repayment', '2027-05-02', '05', '2027', '164.0000', '281304.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2023, 7, 2, 'Repayment', '2027-06-02', '06', '2027', '164.0000', '281140.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2024, 7, 2, 'Repayment', '2027-07-02', '07', '2027', '164.0000', '280976.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2025, 7, 2, 'Repayment', '2027-08-02', '08', '2027', '164.0000', '280812.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2026, 7, 2, 'Repayment', '2027-09-02', '09', '2027', '164.0000', '280648.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2027, 7, 2, 'Repayment', '2027-10-02', '10', '2027', '164.0000', '280484.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2028, 7, 2, 'Repayment', '2027-11-02', '11', '2027', '164.0000', '280320.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2029, 7, 2, 'Repayment', '2027-12-02', '12', '2027', '164.0000', '280156.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2030, 7, 2, 'Repayment', '2028-01-02', '01', '2028', '164.0000', '279992.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2031, 7, 2, 'Repayment', '2028-02-02', '02', '2028', '164.0000', '279828.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2032, 7, 2, 'Repayment', '2028-03-02', '03', '2028', '164.0000', '279664.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2033, 7, 2, 'Repayment', '2028-04-02', '04', '2028', '164.0000', '279500.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2034, 7, 2, 'Repayment', '2028-05-02', '05', '2028', '164.0000', '279336.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2035, 7, 2, 'Repayment', '2028-06-02', '06', '2028', '164.0000', '279172.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2036, 7, 2, 'Repayment', '2028-07-02', '07', '2028', '164.0000', '279008.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2037, 7, 2, 'Repayment', '2028-08-02', '08', '2028', '164.0000', '278844.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2038, 7, 2, 'Repayment', '2028-09-02', '09', '2028', '164.0000', '278680.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2039, 7, 2, 'Repayment', '2028-10-02', '10', '2028', '164.0000', '278516.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2040, 7, 2, 'Repayment', '2028-11-02', '11', '2028', '164.0000', '278352.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2041, 7, 2, 'Repayment', '2028-12-02', '12', '2028', '164.0000', '278188.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2042, 7, 2, 'Repayment', '2029-01-02', '01', '2029', '164.0000', '278024.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2043, 7, 2, 'Repayment', '2029-02-02', '02', '2029', '164.0000', '277860.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2044, 7, 2, 'Repayment', '2029-03-02', '03', '2029', '164.0000', '277696.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2045, 7, 2, 'Repayment', '2029-04-02', '04', '2029', '164.0000', '277532.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2046, 7, 2, 'Repayment', '2029-05-02', '05', '2029', '164.0000', '277368.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2047, 7, 2, 'Repayment', '2029-06-02', '06', '2029', '164.0000', '277204.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2048, 7, 2, 'Repayment', '2029-07-02', '07', '2029', '164.0000', '277040.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2049, 7, 2, 'Repayment', '2029-08-02', '08', '2029', '164.0000', '276876.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2050, 7, 2, 'Repayment', '2029-09-02', '09', '2029', '164.0000', '276712.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2051, 7, 2, 'Repayment', '2029-10-02', '10', '2029', '164.0000', '276548.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2052, 7, 2, 'Repayment', '2029-11-02', '11', '2029', '164.0000', '276384.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2053, 7, 2, 'Repayment', '2029-12-02', '12', '2029', '164.0000', '276220.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2054, 7, 2, 'Repayment', '2030-01-02', '01', '2030', '164.0000', '276056.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2055, 7, 2, 'Repayment', '2030-02-02', '02', '2030', '164.0000', '275892.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2056, 7, 2, 'Repayment', '2030-03-02', '03', '2030', '164.0000', '275728.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2057, 7, 2, 'Repayment', '2030-04-02', '04', '2030', '164.0000', '275564.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2058, 7, 2, 'Repayment', '2030-05-02', '05', '2030', '164.0000', '275400.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2059, 7, 2, 'Repayment', '2030-06-02', '06', '2030', '164.0000', '275236.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2060, 7, 2, 'Repayment', '2030-07-02', '07', '2030', '164.0000', '275072.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2061, 7, 2, 'Repayment', '2030-08-02', '08', '2030', '164.0000', '274908.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2062, 7, 2, 'Repayment', '2030-09-02', '09', '2030', '164.0000', '274744.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2063, 7, 2, 'Repayment', '2030-10-02', '10', '2030', '164.0000', '274580.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2064, 7, 2, 'Repayment', '2030-11-02', '11', '2030', '164.0000', '274416.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2065, 7, 2, 'Repayment', '2030-12-02', '12', '2030', '164.0000', '274252.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2066, 7, 2, 'Repayment', '2031-01-02', '01', '2031', '164.0000', '274088.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2067, 7, 2, 'Repayment', '2031-02-02', '02', '2031', '164.0000', '273924.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2068, 7, 2, 'Repayment', '2031-03-02', '03', '2031', '164.0000', '273760.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2069, 7, 2, 'Repayment', '2031-04-02', '04', '2031', '164.0000', '273596.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2070, 7, 2, 'Repayment', '2031-05-02', '05', '2031', '164.0000', '273432.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2071, 7, 2, 'Repayment', '2031-06-02', '06', '2031', '164.0000', '273268.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2072, 7, 2, 'Repayment', '2031-07-02', '07', '2031', '164.0000', '273104.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2073, 7, 2, 'Repayment', '2031-08-02', '08', '2031', '164.0000', '272940.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2074, 7, 2, 'Repayment', '2031-09-02', '09', '2031', '164.0000', '272776.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2075, 7, 2, 'Repayment', '2031-10-02', '10', '2031', '164.0000', '272612.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2076, 7, 2, 'Repayment', '2031-11-02', '11', '2031', '164.0000', '272448.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2077, 7, 2, 'Repayment', '2031-12-02', '12', '2031', '164.0000', '272284.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2078, 7, 2, 'Repayment', '2032-01-02', '01', '2032', '164.0000', '272120.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2079, 7, 2, 'Repayment', '2032-02-02', '02', '2032', '164.0000', '271956.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2080, 7, 2, 'Repayment', '2032-03-02', '03', '2032', '164.0000', '271792.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2081, 7, 2, 'Repayment', '2032-04-02', '04', '2032', '164.0000', '271628.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2082, 7, 2, 'Repayment', '2032-05-02', '05', '2032', '164.0000', '271464.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2083, 7, 2, 'Repayment', '2032-06-02', '06', '2032', '164.0000', '271300.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2084, 7, 2, 'Repayment', '2032-07-02', '07', '2032', '164.0000', '271136.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2085, 7, 2, 'Repayment', '2032-08-02', '08', '2032', '164.0000', '270972.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2086, 7, 2, 'Repayment', '2032-09-02', '09', '2032', '164.0000', '270808.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2087, 7, 2, 'Repayment', '2032-10-02', '10', '2032', '164.0000', '270644.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2088, 7, 2, 'Repayment', '2032-11-02', '11', '2032', '164.0000', '270480.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2089, 7, 2, 'Repayment', '2032-12-02', '12', '2032', '164.0000', '270316.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2090, 7, 2, 'Repayment', '2033-01-02', '01', '2033', '164.0000', '270152.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2091, 7, 2, 'Repayment', '2033-02-02', '02', '2033', '164.0000', '269988.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2092, 7, 2, 'Repayment', '2033-03-02', '03', '2033', '164.0000', '269824.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2093, 7, 2, 'Repayment', '2033-04-02', '04', '2033', '164.0000', '269660.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2094, 7, 2, 'Repayment', '2033-05-02', '05', '2033', '164.0000', '269496.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2095, 7, 2, 'Repayment', '2033-06-02', '06', '2033', '164.0000', '269332.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2096, 7, 2, 'Repayment', '2033-07-02', '07', '2033', '164.0000', '269168.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2097, 7, 2, 'Repayment', '2033-08-02', '08', '2033', '164.0000', '269004.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2098, 7, 2, 'Repayment', '2033-09-02', '09', '2033', '164.0000', '268840.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2099, 7, 2, 'Repayment', '2033-10-02', '10', '2033', '164.0000', '268676.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2100, 7, 2, 'Repayment', '2033-11-02', '11', '2033', '164.0000', '268512.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2101, 7, 2, 'Repayment', '2033-12-02', '12', '2033', '164.0000', '268348.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2102, 7, 2, 'Repayment', '2034-01-02', '01', '2034', '164.0000', '268184.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2103, 7, 2, 'Repayment', '2034-02-02', '02', '2034', '164.0000', '268020.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2104, 7, 2, 'Repayment', '2034-03-02', '03', '2034', '164.0000', '267856.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2105, 7, 2, 'Repayment', '2034-04-02', '04', '2034', '164.0000', '267692.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2106, 7, 2, 'Repayment', '2034-05-02', '05', '2034', '164.0000', '267528.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2107, 7, 2, 'Repayment', '2034-06-02', '06', '2034', '164.0000', '267364.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2108, 7, 2, 'Repayment', '2034-07-02', '07', '2034', '164.0000', '267200.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2109, 7, 2, 'Repayment', '2034-08-02', '08', '2034', '164.0000', '267036.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2110, 7, 2, 'Repayment', '2034-09-02', '09', '2034', '164.0000', '266872.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2111, 7, 2, 'Repayment', '2034-10-02', '10', '2034', '164.0000', '266708.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2112, 7, 2, 'Repayment', '2034-11-02', '11', '2034', '164.0000', '266544.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2113, 7, 2, 'Repayment', '2034-12-02', '12', '2034', '164.0000', '266380.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2114, 7, 2, 'Repayment', '2035-01-02', '01', '2035', '164.0000', '266216.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2115, 7, 2, 'Repayment', '2035-02-02', '02', '2035', '164.0000', '266052.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2116, 7, 2, 'Repayment', '2035-03-02', '03', '2035', '164.0000', '265888.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2117, 7, 2, 'Repayment', '2035-04-02', '04', '2035', '164.0000', '265724.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2118, 7, 2, 'Repayment', '2035-05-02', '05', '2035', '164.0000', '265560.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2119, 7, 2, 'Repayment', '2035-06-02', '06', '2035', '164.0000', '265396.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2120, 7, 2, 'Repayment', '2035-07-02', '07', '2035', '164.0000', '265232.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2121, 7, 2, 'Repayment', '2035-08-02', '08', '2035', '164.0000', '265068.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2122, 7, 2, 'Repayment', '2035-09-02', '09', '2035', '164.0000', '264904.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2123, 7, 2, 'Repayment', '2035-10-02', '10', '2035', '164.0000', '264740.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2124, 7, 2, 'Repayment', '2035-11-02', '11', '2035', '164.0000', '264576.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2125, 7, 2, 'Repayment', '2035-12-02', '12', '2035', '164.0000', '264412.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2126, 7, 2, 'Repayment', '2036-01-02', '01', '2036', '164.0000', '264248.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2127, 7, 2, 'Repayment', '2036-02-02', '02', '2036', '164.0000', '264084.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2128, 7, 2, 'Repayment', '2036-03-02', '03', '2036', '164.0000', '263920.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2129, 7, 2, 'Repayment', '2036-04-02', '04', '2036', '164.0000', '263756.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2130, 7, 2, 'Repayment', '2036-05-02', '05', '2036', '164.0000', '263592.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2131, 7, 2, 'Repayment', '2036-06-02', '06', '2036', '164.0000', '263428.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2132, 7, 2, 'Repayment', '2036-07-02', '07', '2036', '164.0000', '263264.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2133, 7, 2, 'Repayment', '2036-08-02', '08', '2036', '164.0000', '263100.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2134, 7, 2, 'Repayment', '2036-09-02', '09', '2036', '164.0000', '262936.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2135, 7, 2, 'Repayment', '2036-10-02', '10', '2036', '164.0000', '262772.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2136, 7, 2, 'Repayment', '2036-11-02', '11', '2036', '164.0000', '262608.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2137, 7, 2, 'Repayment', '2036-12-02', '12', '2036', '164.0000', '262444.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2138, 7, 2, 'Repayment', '2037-01-02', '01', '2037', '164.0000', '262280.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2139, 7, 2, 'Repayment', '2037-02-02', '02', '2037', '164.0000', '262116.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2140, 7, 2, 'Repayment', '2037-03-02', '03', '2037', '164.0000', '261952.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2141, 7, 2, 'Repayment', '2037-04-02', '04', '2037', '164.0000', '261788.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2142, 7, 2, 'Repayment', '2037-05-02', '05', '2037', '164.0000', '261624.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2143, 7, 2, 'Repayment', '2037-06-02', '06', '2037', '164.0000', '261460.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2144, 7, 2, 'Repayment', '2037-07-02', '07', '2037', '164.0000', '261296.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2145, 7, 2, 'Repayment', '2037-08-02', '08', '2037', '164.0000', '261132.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2146, 7, 2, 'Repayment', '2037-09-02', '09', '2037', '164.0000', '260968.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2147, 7, 2, 'Repayment', '2037-10-02', '10', '2037', '164.0000', '260804.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2148, 7, 2, 'Repayment', '2037-11-02', '11', '2037', '164.0000', '260640.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2149, 7, 2, 'Repayment', '2037-12-02', '12', '2037', '164.0000', '260476.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2150, 7, 2, 'Repayment', '2038-01-02', '01', '2038', '164.0000', '260312.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2151, 7, 2, 'Repayment', '2038-02-02', '02', '2038', '164.0000', '260148.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2152, 7, 2, 'Repayment', '2038-03-02', '03', '2038', '164.0000', '259984.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2153, 7, 2, 'Repayment', '2038-04-02', '04', '2038', '164.0000', '259820.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2154, 7, 2, 'Repayment', '2038-05-02', '05', '2038', '164.0000', '259656.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2155, 7, 2, 'Repayment', '2038-06-02', '06', '2038', '164.0000', '259492.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2156, 7, 2, 'Repayment', '2038-07-02', '07', '2038', '164.0000', '259328.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2157, 7, 2, 'Repayment', '2038-08-02', '08', '2038', '164.0000', '259164.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2158, 7, 2, 'Repayment', '2038-09-02', '09', '2038', '164.0000', '259000.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2159, 7, 2, 'Repayment', '2038-10-02', '10', '2038', '164.0000', '258836.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2160, 7, 2, 'Repayment', '2038-11-02', '11', '2038', '164.0000', '258672.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2161, 7, 2, 'Repayment', '2038-12-02', '12', '2038', '164.0000', '258508.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2162, 7, 2, 'Repayment', '2039-01-02', '01', '2039', '164.0000', '258344.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2163, 7, 2, 'Repayment', '2039-02-02', '02', '2039', '164.0000', '258180.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2164, 7, 2, 'Repayment', '2039-03-02', '03', '2039', '164.0000', '258016.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2165, 7, 2, 'Repayment', '2039-04-02', '04', '2039', '164.0000', '257852.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2166, 7, 2, 'Repayment', '2039-05-02', '05', '2039', '164.0000', '257688.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2167, 7, 2, 'Repayment', '2039-06-02', '06', '2039', '164.0000', '257524.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2168, 7, 2, 'Repayment', '2039-07-02', '07', '2039', '164.0000', '257360.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(2169, 7, 2, 'Repayment', '2039-08-02', '08', '2039', '164.0000', '257196.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2170, 7, 2, 'Repayment', '2039-09-02', '09', '2039', '164.0000', '257032.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2171, 7, 2, 'Repayment', '2039-10-02', '10', '2039', '164.0000', '256868.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2172, 7, 2, 'Repayment', '2039-11-02', '11', '2039', '164.0000', '256704.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2173, 7, 2, 'Repayment', '2039-12-02', '12', '2039', '164.0000', '256540.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2174, 7, 2, 'Repayment', '2040-01-02', '01', '2040', '164.0000', '256376.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2175, 7, 2, 'Repayment', '2040-02-02', '02', '2040', '164.0000', '256212.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2176, 7, 2, 'Repayment', '2040-03-02', '03', '2040', '164.0000', '256048.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2177, 7, 2, 'Repayment', '2040-04-02', '04', '2040', '164.0000', '255884.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2178, 7, 2, 'Repayment', '2040-05-02', '05', '2040', '164.0000', '255720.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2179, 7, 2, 'Repayment', '2040-06-02', '06', '2040', '164.0000', '255556.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2180, 7, 2, 'Repayment', '2040-07-02', '07', '2040', '164.0000', '255392.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2181, 7, 2, 'Repayment', '2040-08-02', '08', '2040', '164.0000', '255228.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2182, 7, 2, 'Repayment', '2040-09-02', '09', '2040', '164.0000', '255064.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2183, 7, 2, 'Repayment', '2040-10-02', '10', '2040', '164.0000', '254900.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2184, 7, 2, 'Repayment', '2040-11-02', '11', '2040', '164.0000', '254736.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2185, 7, 2, 'Repayment', '2040-12-02', '12', '2040', '164.0000', '254572.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2186, 7, 2, 'Repayment', '2041-01-02', '01', '2041', '164.0000', '254408.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:22', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2187, 7, 2, 'Repayment', '2041-02-02', '02', '2041', '164.0000', '254244.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2188, 7, 2, 'Repayment', '2041-03-02', '03', '2041', '164.0000', '254080.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2189, 7, 2, 'Repayment', '2041-04-02', '04', '2041', '164.0000', '253916.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2190, 7, 2, 'Repayment', '2041-05-02', '05', '2041', '164.0000', '253752.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2191, 7, 2, 'Repayment', '2041-06-02', '06', '2041', '164.0000', '253588.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2192, 7, 2, 'Repayment', '2041-07-02', '07', '2041', '164.0000', '253424.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2193, 7, 2, 'Repayment', '2041-08-02', '08', '2041', '164.0000', '253260.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2194, 7, 2, 'Repayment', '2041-09-02', '09', '2041', '164.0000', '253096.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2195, 7, 2, 'Repayment', '2041-10-02', '10', '2041', '164.0000', '252932.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2196, 7, 2, 'Repayment', '2041-11-02', '11', '2041', '164.0000', '252768.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2197, 7, 2, 'Repayment', '2041-12-02', '12', '2041', '164.0000', '252604.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2198, 7, 2, 'Repayment', '2042-01-02', '01', '2042', '164.0000', '252440.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2199, 7, 2, 'Repayment', '2042-02-02', '02', '2042', '164.0000', '252276.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2200, 7, 2, 'Repayment', '2042-03-02', '03', '2042', '164.0000', '252112.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2201, 7, 2, 'Repayment', '2042-04-02', '04', '2042', '164.0000', '251948.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2202, 7, 2, 'Repayment', '2042-05-02', '05', '2042', '164.0000', '251784.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2203, 7, 2, 'Repayment', '2042-06-02', '06', '2042', '164.0000', '251620.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2204, 7, 2, 'Repayment', '2042-07-02', '07', '2042', '164.0000', '251456.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2205, 7, 2, 'Repayment', '2042-08-02', '08', '2042', '164.0000', '251292.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2206, 7, 2, 'Repayment', '2042-09-02', '09', '2042', '164.0000', '251128.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2207, 7, 2, 'Repayment', '2042-10-02', '10', '2042', '164.0000', '250964.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2208, 7, 2, 'Repayment', '2042-11-02', '11', '2042', '164.0000', '250800.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2209, 7, 2, 'Repayment', '2042-12-02', '12', '2042', '164.0000', '250636.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2210, 7, 2, 'Repayment', '2043-01-02', '01', '2043', '164.0000', '250472.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2211, 7, 2, 'Repayment', '2043-02-02', '02', '2043', '164.0000', '250308.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2212, 7, 2, 'Repayment', '2043-03-02', '03', '2043', '164.0000', '250144.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2213, 7, 2, 'Repayment', '2043-04-02', '04', '2043', '164.0000', '249980.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2214, 7, 2, 'Repayment', '2043-05-02', '05', '2043', '164.0000', '249816.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2215, 7, 2, 'Repayment', '2043-06-02', '06', '2043', '164.0000', '249652.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2216, 7, 2, 'Repayment', '2043-07-02', '07', '2043', '164.0000', '249488.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2217, 7, 2, 'Repayment', '2043-08-02', '08', '2043', '164.0000', '249324.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2218, 7, 2, 'Repayment', '2043-09-02', '09', '2043', '164.0000', '249160.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2219, 7, 2, 'Repayment', '2043-10-02', '10', '2043', '164.0000', '248996.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2220, 7, 2, 'Repayment', '2043-11-02', '11', '2043', '164.0000', '248832.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2221, 7, 2, 'Repayment', '2043-12-02', '12', '2043', '164.0000', '248668.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2222, 7, 2, 'Repayment', '2044-01-02', '01', '2044', '164.0000', '248504.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2223, 7, 2, 'Repayment', '2044-02-02', '02', '2044', '164.0000', '248340.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2224, 7, 2, 'Repayment', '2044-03-02', '03', '2044', '164.0000', '248176.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2225, 7, 2, 'Repayment', '2044-04-02', '04', '2044', '164.0000', '248012.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2226, 7, 2, 'Repayment', '2044-05-02', '05', '2044', '164.0000', '247848.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2227, 7, 2, 'Repayment', '2044-06-02', '06', '2044', '164.0000', '247684.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2228, 7, 2, 'Repayment', '2044-07-02', '07', '2044', '164.0000', '247520.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2229, 7, 2, 'Repayment', '2044-08-02', '08', '2044', '164.0000', '247356.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2230, 7, 2, 'Repayment', '2044-09-02', '09', '2044', '164.0000', '247192.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2231, 7, 2, 'Repayment', '2044-10-02', '10', '2044', '164.0000', '247028.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2232, 7, 2, 'Repayment', '2044-11-02', '11', '2044', '164.0000', '246864.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2233, 7, 2, 'Repayment', '2044-12-02', '12', '2044', '164.0000', '246700.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2234, 7, 2, 'Repayment', '2045-01-02', '01', '2045', '164.0000', '246536.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2235, 7, 2, 'Repayment', '2045-02-02', '02', '2045', '164.0000', '246372.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2236, 7, 2, 'Repayment', '2045-03-02', '03', '2045', '164.0000', '246208.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2237, 7, 2, 'Repayment', '2045-04-02', '04', '2045', '164.0000', '246044.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2238, 7, 2, 'Repayment', '2045-05-02', '05', '2045', '164.0000', '245880.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2239, 7, 2, 'Repayment', '2045-06-02', '06', '2045', '164.0000', '245716.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2240, 7, 2, 'Repayment', '2045-07-02', '07', '2045', '164.0000', '245552.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2241, 7, 2, 'Repayment', '2045-08-02', '08', '2045', '164.0000', '245388.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2242, 7, 2, 'Repayment', '2045-09-02', '09', '2045', '164.0000', '245224.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2243, 7, 2, 'Repayment', '2045-10-02', '10', '2045', '164.0000', '245060.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2244, 7, 2, 'Repayment', '2045-11-02', '11', '2045', '164.0000', '244896.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2245, 7, 2, 'Repayment', '2045-12-02', '12', '2045', '164.0000', '244732.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2246, 7, 2, 'Repayment', '2046-01-02', '01', '2046', '164.0000', '244568.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2247, 7, 2, 'Repayment', '2046-02-02', '02', '2046', '164.0000', '244404.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2248, 7, 2, 'Repayment', '2046-03-02', '03', '2046', '164.0000', '244240.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2249, 7, 2, 'Repayment', '2046-04-02', '04', '2046', '164.0000', '244076.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2250, 7, 2, 'Repayment', '2046-05-02', '05', '2046', '164.0000', '243912.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2251, 7, 2, 'Repayment', '2046-06-02', '06', '2046', '164.0000', '243748.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2252, 7, 2, 'Repayment', '2046-07-02', '07', '2046', '164.0000', '243584.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2253, 7, 2, 'Repayment', '2046-08-02', '08', '2046', '164.0000', '243420.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2254, 7, 2, 'Repayment', '2046-09-02', '09', '2046', '164.0000', '243256.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2255, 7, 2, 'Repayment', '2046-10-02', '10', '2046', '164.0000', '243092.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2256, 7, 2, 'Repayment', '2046-11-02', '11', '2046', '164.0000', '242928.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2257, 7, 2, 'Repayment', '2046-12-02', '12', '2046', '164.0000', '242764.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2258, 7, 2, 'Repayment', '2047-01-02', '01', '2047', '164.0000', '242600.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2259, 7, 2, 'Repayment', '2047-02-02', '02', '2047', '164.0000', '242436.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2260, 7, 2, 'Repayment', '2047-03-02', '03', '2047', '164.0000', '242272.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2261, 7, 2, 'Repayment', '2047-04-02', '04', '2047', '164.0000', '242108.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2262, 7, 2, 'Repayment', '2047-05-02', '05', '2047', '164.0000', '241944.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2263, 7, 2, 'Repayment', '2047-06-02', '06', '2047', '164.0000', '241780.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2264, 7, 2, 'Repayment', '2047-07-02', '07', '2047', '164.0000', '241616.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2265, 7, 2, 'Repayment', '2047-08-02', '08', '2047', '164.0000', '241452.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2266, 7, 2, 'Repayment', '2047-09-02', '09', '2047', '164.0000', '241288.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2267, 7, 2, 'Repayment', '2047-10-02', '10', '2047', '164.0000', '241124.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2268, 7, 2, 'Repayment', '2047-11-02', '11', '2047', '164.0000', '240960.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2269, 7, 2, 'Repayment', '2047-12-02', '12', '2047', '164.0000', '240796.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2270, 7, 2, 'Repayment', '2048-01-02', '01', '2048', '164.0000', '240632.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2271, 7, 2, 'Repayment', '2048-02-02', '02', '2048', '164.0000', '240468.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2272, 7, 2, 'Repayment', '2048-03-02', '03', '2048', '164.0000', '240304.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2273, 7, 2, 'Repayment', '2048-04-02', '04', '2048', '164.0000', '240140.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2274, 7, 2, 'Repayment', '2048-05-02', '05', '2048', '164.0000', '239976.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2275, 7, 2, 'Repayment', '2048-06-02', '06', '2048', '164.0000', '239812.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2276, 7, 2, 'Repayment', '2048-07-02', '07', '2048', '164.0000', '239648.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2277, 7, 2, 'Repayment', '2048-08-02', '08', '2048', '164.0000', '239484.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2278, 7, 2, 'Repayment', '2048-09-02', '09', '2048', '164.0000', '239320.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2279, 7, 2, 'Repayment', '2048-10-02', '10', '2048', '164.0000', '239156.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2280, 7, 2, 'Repayment', '2048-11-02', '11', '2048', '164.0000', '238992.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2281, 7, 2, 'Repayment', '2048-12-02', '12', '2048', '164.0000', '238828.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2282, 7, 2, 'Repayment', '2049-01-02', '01', '2049', '164.0000', '238664.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2283, 7, 2, 'Repayment', '2049-02-02', '02', '2049', '164.0000', '238500.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2284, 7, 2, 'Repayment', '2049-03-02', '03', '2049', '164.0000', '238336.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2285, 7, 2, 'Repayment', '2049-04-02', '04', '2049', '164.0000', '238172.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2286, 7, 2, 'Repayment', '2049-05-02', '05', '2049', '164.0000', '238008.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2287, 7, 2, 'Repayment', '2049-06-02', '06', '2049', '164.0000', '237844.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2288, 7, 2, 'Repayment', '2049-07-02', '07', '2049', '164.0000', '237680.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2289, 7, 2, 'Repayment', '2049-08-02', '08', '2049', '164.0000', '237516.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2290, 7, 2, 'Repayment', '2049-09-02', '09', '2049', '164.0000', '237352.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2291, 7, 2, 'Repayment', '2049-10-02', '10', '2049', '164.0000', '237188.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2292, 7, 2, 'Repayment', '2049-11-02', '11', '2049', '164.0000', '237024.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2293, 7, 2, 'Repayment', '2049-12-02', '12', '2049', '164.0000', '236860.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2294, 7, 2, 'Repayment', '2050-01-02', '01', '2050', '164.0000', '236696.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2295, 7, 2, 'Repayment', '2050-02-02', '02', '2050', '164.0000', '236532.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2296, 7, 2, 'Repayment', '2050-03-02', '03', '2050', '164.0000', '236368.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2297, 7, 2, 'Repayment', '2050-04-02', '04', '2050', '164.0000', '236204.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2298, 7, 2, 'Repayment', '2050-05-02', '05', '2050', '164.0000', '236040.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2299, 7, 2, 'Repayment', '2050-06-02', '06', '2050', '164.0000', '235876.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2300, 7, 2, 'Repayment', '2050-07-02', '07', '2050', '164.0000', '235712.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2301, 7, 2, 'Repayment', '2050-08-02', '08', '2050', '164.0000', '235548.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2302, 7, 2, 'Repayment', '2050-09-02', '09', '2050', '164.0000', '235384.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2303, 7, 2, 'Repayment', '2050-10-02', '10', '2050', '164.0000', '235220.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2304, 7, 2, 'Repayment', '2050-11-02', '11', '2050', '164.0000', '235056.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2305, 7, 2, 'Repayment', '2050-12-02', '12', '2050', '164.0000', '234892.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2306, 7, 2, 'Repayment', '2051-01-02', '01', '2051', '164.0000', '234728.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2307, 7, 2, 'Repayment', '2051-02-02', '02', '2051', '164.0000', '234564.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2308, 7, 2, 'Repayment', '2051-03-02', '03', '2051', '164.0000', '234400.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2309, 7, 2, 'Repayment', '2051-04-02', '04', '2051', '164.0000', '234236.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2310, 7, 2, 'Repayment', '2051-05-02', '05', '2051', '164.0000', '234072.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2311, 7, 2, 'Repayment', '2051-06-02', '06', '2051', '164.0000', '233908.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2312, 7, 2, 'Repayment', '2051-07-02', '07', '2051', '164.0000', '233744.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2313, 7, 2, 'Repayment', '2051-08-02', '08', '2051', '164.0000', '233580.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2314, 7, 2, 'Repayment', '2051-09-02', '09', '2051', '164.0000', '233416.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2315, 7, 2, 'Repayment', '2051-10-02', '10', '2051', '164.0000', '233252.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2316, 7, 2, 'Repayment', '2051-11-02', '11', '2051', '164.0000', '233088.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2317, 7, 2, 'Repayment', '2051-12-02', '12', '2051', '164.0000', '232924.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2318, 7, 2, 'Repayment', '2052-01-02', '01', '2052', '164.0000', '232760.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2319, 7, 2, 'Repayment', '2052-02-02', '02', '2052', '164.0000', '232596.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2320, 7, 2, 'Repayment', '2052-03-02', '03', '2052', '164.0000', '232432.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2321, 7, 2, 'Repayment', '2052-04-02', '04', '2052', '164.0000', '232268.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2322, 7, 2, 'Repayment', '2052-05-02', '05', '2052', '164.0000', '232104.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2323, 7, 2, 'Repayment', '2052-06-02', '06', '2052', '164.0000', '231940.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2324, 7, 2, 'Repayment', '2052-07-02', '07', '2052', '164.0000', '231776.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2325, 7, 2, 'Repayment', '2052-08-02', '08', '2052', '164.0000', '231612.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2326, 7, 2, 'Repayment', '2052-09-02', '09', '2052', '164.0000', '231448.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2327, 7, 2, 'Repayment', '2052-10-02', '10', '2052', '164.0000', '231284.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2328, 7, 2, 'Repayment', '2052-11-02', '11', '2052', '164.0000', '231120.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2329, 7, 2, 'Repayment', '2052-12-02', '12', '2052', '164.0000', '230956.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2330, 7, 2, 'Repayment', '2053-01-02', '01', '2053', '164.0000', '230792.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2331, 7, 2, 'Repayment', '2053-02-02', '02', '2053', '164.0000', '230628.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2332, 7, 2, 'Repayment', '2053-03-02', '03', '2053', '164.0000', '230464.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2333, 7, 2, 'Repayment', '2053-04-02', '04', '2053', '164.0000', '230300.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2334, 7, 2, 'Repayment', '2053-05-02', '05', '2053', '164.0000', '230136.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2335, 7, 2, 'Repayment', '2053-06-02', '06', '2053', '164.0000', '229972.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2336, 7, 2, 'Repayment', '2053-07-02', '07', '2053', '164.0000', '229808.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2337, 7, 2, 'Repayment', '2053-08-02', '08', '2053', '164.0000', '229644.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2338, 7, 2, 'Repayment', '2053-09-02', '09', '2053', '164.0000', '229480.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2339, 7, 2, 'Repayment', '2053-10-02', '10', '2053', '164.0000', '229316.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2340, 7, 2, 'Repayment', '2053-11-02', '11', '2053', '164.0000', '229152.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2341, 7, 2, 'Repayment', '2053-12-02', '12', '2053', '164.0000', '228988.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2342, 7, 2, 'Repayment', '2054-01-02', '01', '2054', '164.0000', '228824.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2343, 7, 2, 'Repayment', '2054-02-02', '02', '2054', '164.0000', '228660.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2344, 7, 2, 'Repayment', '2054-03-02', '03', '2054', '164.0000', '228496.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2345, 7, 2, 'Repayment', '2054-04-02', '04', '2054', '164.0000', '228332.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2346, 7, 2, 'Repayment', '2054-05-02', '05', '2054', '164.0000', '228168.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2347, 7, 2, 'Repayment', '2054-06-02', '06', '2054', '164.0000', '228004.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2348, 7, 2, 'Repayment', '2054-07-02', '07', '2054', '164.0000', '227840.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2349, 7, 2, 'Repayment', '2054-08-02', '08', '2054', '164.0000', '227676.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2350, 7, 2, 'Repayment', '2054-09-02', '09', '2054', '164.0000', '227512.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2351, 7, 2, 'Repayment', '2054-10-02', '10', '2054', '164.0000', '227348.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2352, 7, 2, 'Repayment', '2054-11-02', '11', '2054', '164.0000', '227184.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2353, 7, 2, 'Repayment', '2054-12-02', '12', '2054', '164.0000', '227020.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2354, 7, 2, 'Repayment', '2055-01-02', '01', '2055', '164.0000', '226856.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2355, 7, 2, 'Repayment', '2055-02-02', '02', '2055', '164.0000', '226692.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2356, 7, 2, 'Repayment', '2055-03-02', '03', '2055', '164.0000', '226528.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2357, 7, 2, 'Repayment', '2055-04-02', '04', '2055', '164.0000', '226364.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2358, 7, 2, 'Repayment', '2055-05-02', '05', '2055', '164.0000', '226200.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2359, 7, 2, 'Repayment', '2055-06-02', '06', '2055', '164.0000', '226036.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2360, 7, 2, 'Repayment', '2055-07-02', '07', '2055', '164.0000', '225872.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2361, 7, 2, 'Repayment', '2055-08-02', '08', '2055', '164.0000', '225708.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2362, 7, 2, 'Repayment', '2055-09-02', '09', '2055', '164.0000', '225544.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2363, 7, 2, 'Repayment', '2055-10-02', '10', '2055', '164.0000', '225380.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2364, 7, 2, 'Repayment', '2055-11-02', '11', '2055', '164.0000', '225216.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2365, 7, 2, 'Repayment', '2055-12-02', '12', '2055', '164.0000', '225052.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2366, 7, 2, 'Repayment', '2056-01-02', '01', '2056', '164.0000', '224888.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2367, 7, 2, 'Repayment', '2056-02-02', '02', '2056', '164.0000', '224724.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2368, 7, 2, 'Repayment', '2056-03-02', '03', '2056', '164.0000', '224560.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2369, 7, 2, 'Repayment', '2056-04-02', '04', '2056', '164.0000', '224396.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2370, 7, 2, 'Repayment', '2056-05-02', '05', '2056', '164.0000', '224232.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2371, 7, 2, 'Repayment', '2056-06-02', '06', '2056', '164.0000', '224068.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2372, 7, 2, 'Repayment', '2056-07-02', '07', '2056', '164.0000', '223904.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2373, 7, 2, 'Repayment', '2056-08-02', '08', '2056', '164.0000', '223740.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2374, 7, 2, 'Repayment', '2056-09-02', '09', '2056', '164.0000', '223576.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2375, 7, 2, 'Repayment', '2056-10-02', '10', '2056', '164.0000', '223412.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2376, 7, 2, 'Repayment', '2056-11-02', '11', '2056', '164.0000', '223248.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2377, 7, 2, 'Repayment', '2056-12-02', '12', '2056', '164.0000', '223084.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2378, 7, 2, 'Repayment', '2057-01-02', '01', '2057', '164.0000', '222920.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2379, 7, 2, 'Repayment', '2057-02-02', '02', '2057', '164.0000', '222756.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2380, 7, 2, 'Repayment', '2057-03-02', '03', '2057', '164.0000', '222592.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2381, 7, 2, 'Repayment', '2057-04-02', '04', '2057', '164.0000', '222428.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2382, 7, 2, 'Repayment', '2057-05-02', '05', '2057', '164.0000', '222264.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2383, 7, 2, 'Repayment', '2057-06-02', '06', '2057', '164.0000', '222100.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2384, 7, 2, 'Repayment', '2057-07-02', '07', '2057', '164.0000', '221936.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2385, 7, 2, 'Repayment', '2057-08-02', '08', '2057', '164.0000', '221772.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2386, 7, 2, 'Repayment', '2057-09-02', '09', '2057', '164.0000', '221608.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2387, 7, 2, 'Repayment', '2057-10-02', '10', '2057', '164.0000', '221444.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2388, 7, 2, 'Repayment', '2057-11-02', '11', '2057', '164.0000', '221280.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2389, 7, 2, 'Repayment', '2057-12-02', '12', '2057', '164.0000', '221116.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2390, 7, 2, 'Repayment', '2058-01-02', '01', '2058', '164.0000', '220952.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2391, 7, 2, 'Repayment', '2058-02-02', '02', '2058', '164.0000', '220788.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2392, 7, 2, 'Repayment', '2058-03-02', '03', '2058', '164.0000', '220624.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2393, 7, 2, 'Repayment', '2058-04-02', '04', '2058', '164.0000', '220460.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2394, 7, 2, 'Repayment', '2058-05-02', '05', '2058', '164.0000', '220296.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2395, 7, 2, 'Repayment', '2058-06-02', '06', '2058', '164.0000', '220132.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2396, 7, 2, 'Repayment', '2058-07-02', '07', '2058', '164.0000', '219968.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2397, 7, 2, 'Repayment', '2058-08-02', '08', '2058', '164.0000', '219804.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2398, 7, 2, 'Repayment', '2058-09-02', '09', '2058', '164.0000', '219640.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2399, 7, 2, 'Repayment', '2058-10-02', '10', '2058', '164.0000', '219476.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2400, 7, 2, 'Repayment', '2058-11-02', '11', '2058', '164.0000', '219312.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2401, 7, 2, 'Repayment', '2058-12-02', '12', '2058', '164.0000', '219148.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2402, 7, 2, 'Repayment', '2059-01-02', '01', '2059', '164.0000', '218984.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2403, 7, 2, 'Repayment', '2059-02-02', '02', '2059', '164.0000', '218820.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2404, 7, 2, 'Repayment', '2059-03-02', '03', '2059', '164.0000', '218656.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2405, 7, 2, 'Repayment', '2059-04-02', '04', '2059', '164.0000', '218492.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2406, 7, 2, 'Repayment', '2059-05-02', '05', '2059', '164.0000', '218328.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(2407, 7, 2, 'Repayment', '2059-06-02', '06', '2059', '164.0000', '218164.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2408, 7, 2, 'Repayment', '2059-07-02', '07', '2059', '164.0000', '218000.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2409, 7, 2, 'Repayment', '2059-08-02', '08', '2059', '164.0000', '217836.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2410, 7, 2, 'Repayment', '2059-09-02', '09', '2059', '164.0000', '217672.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2411, 7, 2, 'Repayment', '2059-10-02', '10', '2059', '164.0000', '217508.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2412, 7, 2, 'Repayment', '2059-11-02', '11', '2059', '164.0000', '217344.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2413, 7, 2, 'Repayment', '2059-12-02', '12', '2059', '164.0000', '217180.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2414, 7, 2, 'Repayment', '2060-01-02', '01', '2060', '164.0000', '217016.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2415, 7, 2, 'Repayment', '2060-02-02', '02', '2060', '164.0000', '216852.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2416, 7, 2, 'Repayment', '2060-03-02', '03', '2060', '164.0000', '216688.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2417, 7, 2, 'Repayment', '2060-04-02', '04', '2060', '164.0000', '216524.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2418, 7, 2, 'Repayment', '2060-05-02', '05', '2060', '164.0000', '216360.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2419, 7, 2, 'Repayment', '2060-06-02', '06', '2060', '164.0000', '216196.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2420, 7, 2, 'Repayment', '2060-07-02', '07', '2060', '164.0000', '216032.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2421, 7, 2, 'Repayment', '2060-08-02', '08', '2060', '164.0000', '215868.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2422, 7, 2, 'Repayment', '2060-09-02', '09', '2060', '164.0000', '215704.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2423, 7, 2, 'Repayment', '2060-10-02', '10', '2060', '164.0000', '215540.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2424, 7, 2, 'Repayment', '2060-11-02', '11', '2060', '164.0000', '215376.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2425, 7, 2, 'Repayment', '2060-12-02', '12', '2060', '164.0000', '215212.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2426, 7, 2, 'Repayment', '2061-01-02', '01', '2061', '164.0000', '215048.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2427, 7, 2, 'Repayment', '2061-02-02', '02', '2061', '164.0000', '214884.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2428, 7, 2, 'Repayment', '2061-03-02', '03', '2061', '164.0000', '214720.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2429, 7, 2, 'Repayment', '2061-04-02', '04', '2061', '164.0000', '214556.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2430, 7, 2, 'Repayment', '2061-05-02', '05', '2061', '164.0000', '214392.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2431, 7, 2, 'Repayment', '2061-06-02', '06', '2061', '164.0000', '214228.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2432, 7, 2, 'Repayment', '2061-07-02', '07', '2061', '164.0000', '214064.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2433, 7, 2, 'Repayment', '2061-08-02', '08', '2061', '164.0000', '213900.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2434, 7, 2, 'Repayment', '2061-09-02', '09', '2061', '164.0000', '213736.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2435, 7, 2, 'Repayment', '2061-10-02', '10', '2061', '164.0000', '213572.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2436, 7, 2, 'Repayment', '2061-11-02', '11', '2061', '164.0000', '213408.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2437, 7, 2, 'Repayment', '2061-12-02', '12', '2061', '164.0000', '213244.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2438, 7, 2, 'Repayment', '2062-01-02', '01', '2062', '164.0000', '213080.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2439, 7, 2, 'Repayment', '2062-02-02', '02', '2062', '164.0000', '212916.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2440, 7, 2, 'Repayment', '2062-03-02', '03', '2062', '164.0000', '212752.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2441, 7, 2, 'Repayment', '2062-04-02', '04', '2062', '164.0000', '212588.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2442, 7, 2, 'Repayment', '2062-05-02', '05', '2062', '164.0000', '212424.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2443, 7, 2, 'Repayment', '2062-06-02', '06', '2062', '164.0000', '212260.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2444, 7, 2, 'Repayment', '2062-07-02', '07', '2062', '164.0000', '212096.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2445, 7, 2, 'Repayment', '2062-08-02', '08', '2062', '164.0000', '211932.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2446, 7, 2, 'Repayment', '2062-09-02', '09', '2062', '164.0000', '211768.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:23', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2447, 7, 2, 'Repayment', '2062-10-02', '10', '2062', '164.0000', '211604.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2448, 7, 2, 'Repayment', '2062-11-02', '11', '2062', '164.0000', '211440.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2449, 7, 2, 'Repayment', '2062-12-02', '12', '2062', '164.0000', '211276.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2450, 7, 2, 'Repayment', '2063-01-02', '01', '2063', '164.0000', '211112.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2451, 7, 2, 'Repayment', '2063-02-02', '02', '2063', '164.0000', '210948.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2452, 7, 2, 'Repayment', '2063-03-02', '03', '2063', '164.0000', '210784.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2453, 7, 2, 'Repayment', '2063-04-02', '04', '2063', '164.0000', '210620.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2454, 7, 2, 'Repayment', '2063-05-02', '05', '2063', '164.0000', '210456.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2455, 7, 2, 'Repayment', '2063-06-02', '06', '2063', '164.0000', '210292.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2456, 7, 2, 'Repayment', '2063-07-02', '07', '2063', '164.0000', '210128.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2457, 7, 2, 'Repayment', '2063-08-02', '08', '2063', '164.0000', '209964.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2458, 7, 2, 'Repayment', '2063-09-02', '09', '2063', '164.0000', '209800.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2459, 7, 2, 'Repayment', '2063-10-02', '10', '2063', '164.0000', '209636.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2460, 7, 2, 'Repayment', '2063-11-02', '11', '2063', '164.0000', '209472.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2461, 7, 2, 'Repayment', '2063-12-02', '12', '2063', '164.0000', '209308.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2462, 7, 2, 'Repayment', '2064-01-02', '01', '2064', '164.0000', '209144.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2463, 7, 2, 'Repayment', '2064-02-02', '02', '2064', '164.0000', '208980.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2464, 7, 2, 'Repayment', '2064-03-02', '03', '2064', '164.0000', '208816.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2465, 7, 2, 'Repayment', '2064-04-02', '04', '2064', '164.0000', '208652.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2466, 7, 2, 'Repayment', '2064-05-02', '05', '2064', '164.0000', '208488.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2467, 7, 2, 'Repayment', '2064-06-02', '06', '2064', '164.0000', '208324.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2468, 7, 2, 'Repayment', '2064-07-02', '07', '2064', '164.0000', '208160.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2469, 7, 2, 'Repayment', '2064-08-02', '08', '2064', '164.0000', '207996.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2470, 7, 2, 'Repayment', '2064-09-02', '09', '2064', '164.0000', '207832.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2471, 7, 2, 'Repayment', '2064-10-02', '10', '2064', '164.0000', '207668.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2472, 7, 2, 'Repayment', '2064-11-02', '11', '2064', '164.0000', '207504.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2473, 7, 2, 'Repayment', '2064-12-02', '12', '2064', '164.0000', '207340.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2474, 7, 2, 'Repayment', '2065-01-02', '01', '2065', '164.0000', '207176.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2475, 7, 2, 'Repayment', '2065-02-02', '02', '2065', '164.0000', '207012.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2476, 7, 2, 'Repayment', '2065-03-02', '03', '2065', '164.0000', '206848.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2477, 7, 2, 'Repayment', '2065-04-02', '04', '2065', '164.0000', '206684.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2478, 7, 2, 'Repayment', '2065-05-02', '05', '2065', '164.0000', '206520.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2479, 7, 2, 'Repayment', '2065-06-02', '06', '2065', '164.0000', '206356.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2480, 7, 2, 'Repayment', '2065-07-02', '07', '2065', '164.0000', '206192.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2481, 7, 2, 'Repayment', '2065-08-02', '08', '2065', '164.0000', '206028.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2482, 7, 2, 'Repayment', '2065-09-02', '09', '2065', '164.0000', '205864.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2483, 7, 2, 'Repayment', '2065-10-02', '10', '2065', '164.0000', '205700.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2484, 7, 2, 'Repayment', '2065-11-02', '11', '2065', '164.0000', '205536.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2485, 7, 2, 'Repayment', '2065-12-02', '12', '2065', '164.0000', '205372.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2486, 7, 2, 'Repayment', '2066-01-02', '01', '2066', '164.0000', '205208.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2487, 7, 2, 'Repayment', '2066-02-02', '02', '2066', '164.0000', '205044.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2488, 7, 2, 'Repayment', '2066-03-02', '03', '2066', '164.0000', '204880.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2489, 7, 2, 'Repayment', '2066-04-02', '04', '2066', '164.0000', '204716.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2490, 7, 2, 'Repayment', '2066-05-02', '05', '2066', '164.0000', '204552.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2491, 7, 2, 'Repayment', '2066-06-02', '06', '2066', '164.0000', '204388.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2492, 7, 2, 'Repayment', '2066-07-02', '07', '2066', '164.0000', '204224.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2493, 7, 2, 'Repayment', '2066-08-02', '08', '2066', '164.0000', '204060.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2494, 7, 2, 'Repayment', '2066-09-02', '09', '2066', '164.0000', '203896.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2495, 7, 2, 'Repayment', '2066-10-02', '10', '2066', '164.0000', '203732.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2496, 7, 2, 'Repayment', '2066-11-02', '11', '2066', '164.0000', '203568.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2497, 7, 2, 'Repayment', '2066-12-02', '12', '2066', '164.0000', '203404.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2498, 7, 2, 'Repayment', '2067-01-02', '01', '2067', '164.0000', '203240.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2499, 7, 2, 'Repayment', '2067-02-02', '02', '2067', '164.0000', '203076.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2500, 7, 2, 'Repayment', '2067-03-02', '03', '2067', '164.0000', '202912.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2501, 7, 2, 'Repayment', '2067-04-02', '04', '2067', '164.0000', '202748.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2502, 7, 2, 'Repayment', '2067-05-02', '05', '2067', '164.0000', '202584.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2503, 7, 2, 'Repayment', '2067-06-02', '06', '2067', '164.0000', '202420.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2504, 7, 2, 'Repayment', '2067-07-02', '07', '2067', '164.0000', '202256.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2505, 7, 2, 'Repayment', '2067-08-02', '08', '2067', '164.0000', '202092.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2506, 7, 2, 'Repayment', '2067-09-02', '09', '2067', '164.0000', '201928.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2507, 7, 2, 'Repayment', '2067-10-02', '10', '2067', '164.0000', '201764.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2508, 7, 2, 'Repayment', '2067-11-02', '11', '2067', '164.0000', '201600.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2509, 7, 2, 'Repayment', '2067-12-02', '12', '2067', '164.0000', '201436.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2510, 7, 2, 'Repayment', '2068-01-02', '01', '2068', '164.0000', '201272.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2511, 7, 2, 'Repayment', '2068-02-02', '02', '2068', '164.0000', '201108.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2512, 7, 2, 'Repayment', '2068-03-02', '03', '2068', '164.0000', '200944.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2513, 7, 2, 'Repayment', '2068-04-02', '04', '2068', '164.0000', '200780.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2514, 7, 2, 'Repayment', '2068-05-02', '05', '2068', '164.0000', '200616.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2515, 7, 2, 'Repayment', '2068-06-02', '06', '2068', '164.0000', '200452.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2516, 7, 2, 'Repayment', '2068-07-02', '07', '2068', '164.0000', '200288.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2517, 7, 2, 'Repayment', '2068-08-02', '08', '2068', '164.0000', '200124.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2518, 7, 2, 'Repayment', '2068-09-02', '09', '2068', '164.0000', '199960.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2519, 7, 2, 'Repayment', '2068-10-02', '10', '2068', '164.0000', '199796.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2520, 7, 2, 'Repayment', '2068-11-02', '11', '2068', '164.0000', '199632.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2521, 7, 2, 'Repayment', '2068-12-02', '12', '2068', '164.0000', '199468.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2522, 7, 2, 'Repayment', '2069-01-02', '01', '2069', '164.0000', '199304.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2523, 7, 2, 'Repayment', '2069-02-02', '02', '2069', '164.0000', '199140.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2524, 7, 2, 'Repayment', '2069-03-02', '03', '2069', '164.0000', '198976.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2525, 7, 2, 'Repayment', '2069-04-02', '04', '2069', '164.0000', '198812.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2526, 7, 2, 'Repayment', '2069-05-02', '05', '2069', '164.0000', '198648.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2527, 7, 2, 'Repayment', '2069-06-02', '06', '2069', '164.0000', '198484.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2528, 7, 2, 'Repayment', '2069-07-02', '07', '2069', '164.0000', '198320.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2529, 7, 2, 'Repayment', '2069-08-02', '08', '2069', '164.0000', '198156.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2530, 7, 2, 'Repayment', '2069-09-02', '09', '2069', '164.0000', '197992.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2531, 7, 2, 'Repayment', '2069-10-02', '10', '2069', '164.0000', '197828.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2532, 7, 2, 'Repayment', '2069-11-02', '11', '2069', '164.0000', '197664.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2533, 7, 2, 'Repayment', '2069-12-02', '12', '2069', '164.0000', '197500.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2534, 7, 2, 'Repayment', '2070-01-02', '01', '2070', '164.0000', '197336.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2535, 7, 2, 'Repayment', '2070-02-02', '02', '2070', '164.0000', '197172.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2536, 7, 2, 'Repayment', '2070-03-02', '03', '2070', '164.0000', '197008.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2537, 7, 2, 'Repayment', '2070-04-02', '04', '2070', '164.0000', '196844.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2538, 7, 2, 'Repayment', '2070-05-02', '05', '2070', '164.0000', '196680.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2539, 7, 2, 'Repayment', '2070-06-02', '06', '2070', '164.0000', '196516.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2540, 7, 2, 'Repayment', '2070-07-02', '07', '2070', '164.0000', '196352.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2541, 7, 2, 'Repayment', '2070-08-02', '08', '2070', '164.0000', '196188.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2542, 7, 2, 'Repayment', '2070-09-02', '09', '2070', '164.0000', '196024.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2543, 7, 2, 'Repayment', '2070-10-02', '10', '2070', '164.0000', '195860.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2544, 7, 2, 'Repayment', '2070-11-02', '11', '2070', '164.0000', '195696.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2545, 7, 2, 'Repayment', '2070-12-02', '12', '2070', '164.0000', '195532.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2546, 7, 2, 'Repayment', '2071-01-02', '01', '2071', '164.0000', '195368.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2547, 7, 2, 'Repayment', '2071-02-02', '02', '2071', '164.0000', '195204.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2548, 7, 2, 'Repayment', '2071-03-02', '03', '2071', '164.0000', '195040.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2549, 7, 2, 'Repayment', '2071-04-02', '04', '2071', '164.0000', '194876.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2550, 7, 2, 'Repayment', '2071-05-02', '05', '2071', '164.0000', '194712.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2551, 7, 2, 'Repayment', '2071-06-02', '06', '2071', '164.0000', '194548.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2552, 7, 2, 'Repayment', '2071-07-02', '07', '2071', '164.0000', '194384.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2553, 7, 2, 'Repayment', '2071-08-02', '08', '2071', '164.0000', '194220.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2554, 7, 2, 'Repayment', '2071-09-02', '09', '2071', '164.0000', '194056.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2555, 7, 2, 'Repayment', '2071-10-02', '10', '2071', '164.0000', '193892.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2556, 7, 2, 'Repayment', '2071-11-02', '11', '2071', '164.0000', '193728.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2557, 7, 2, 'Repayment', '2071-12-02', '12', '2071', '164.0000', '193564.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2558, 7, 2, 'Repayment', '2072-01-02', '01', '2072', '164.0000', '193400.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2559, 7, 2, 'Repayment', '2072-02-02', '02', '2072', '164.0000', '193236.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2560, 7, 2, 'Repayment', '2072-03-02', '03', '2072', '164.0000', '193072.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2561, 7, 2, 'Repayment', '2072-04-02', '04', '2072', '164.0000', '192908.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2562, 7, 2, 'Repayment', '2072-05-02', '05', '2072', '164.0000', '192744.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2563, 7, 2, 'Repayment', '2072-06-02', '06', '2072', '164.0000', '192580.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2564, 7, 2, 'Repayment', '2072-07-02', '07', '2072', '164.0000', '192416.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2565, 7, 2, 'Repayment', '2072-08-02', '08', '2072', '164.0000', '192252.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2566, 7, 2, 'Repayment', '2072-09-02', '09', '2072', '164.0000', '192088.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2567, 7, 2, 'Repayment', '2072-10-02', '10', '2072', '164.0000', '191924.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2568, 7, 2, 'Repayment', '2072-11-02', '11', '2072', '164.0000', '191760.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2569, 7, 2, 'Repayment', '2072-12-02', '12', '2072', '164.0000', '191596.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2570, 7, 2, 'Repayment', '2073-01-02', '01', '2073', '164.0000', '191432.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2571, 7, 2, 'Repayment', '2073-02-02', '02', '2073', '164.0000', '191268.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2572, 7, 2, 'Repayment', '2073-03-02', '03', '2073', '164.0000', '191104.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2573, 7, 2, 'Repayment', '2073-04-02', '04', '2073', '164.0000', '190940.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2574, 7, 2, 'Repayment', '2073-05-02', '05', '2073', '164.0000', '190776.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2575, 7, 2, 'Repayment', '2073-06-02', '06', '2073', '164.0000', '190612.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2576, 7, 2, 'Repayment', '2073-07-02', '07', '2073', '164.0000', '190448.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2577, 7, 2, 'Repayment', '2073-08-02', '08', '2073', '164.0000', '190284.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2578, 7, 2, 'Repayment', '2073-09-02', '09', '2073', '164.0000', '190120.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2579, 7, 2, 'Repayment', '2073-10-02', '10', '2073', '164.0000', '189956.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2580, 7, 2, 'Repayment', '2073-11-02', '11', '2073', '164.0000', '189792.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2581, 7, 2, 'Repayment', '2073-12-02', '12', '2073', '164.0000', '189628.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2582, 7, 2, 'Repayment', '2074-01-02', '01', '2074', '164.0000', '189464.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2583, 7, 2, 'Repayment', '2074-02-02', '02', '2074', '164.0000', '189300.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2584, 7, 2, 'Repayment', '2074-03-02', '03', '2074', '164.0000', '189136.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2585, 7, 2, 'Repayment', '2074-04-02', '04', '2074', '164.0000', '188972.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2586, 7, 2, 'Repayment', '2074-05-02', '05', '2074', '164.0000', '188808.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2587, 7, 2, 'Repayment', '2074-06-02', '06', '2074', '164.0000', '188644.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2588, 7, 2, 'Repayment', '2074-07-02', '07', '2074', '164.0000', '188480.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2589, 7, 2, 'Repayment', '2074-08-02', '08', '2074', '164.0000', '188316.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2590, 7, 2, 'Repayment', '2074-09-02', '09', '2074', '164.0000', '188152.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2591, 7, 2, 'Repayment', '2074-10-02', '10', '2074', '164.0000', '187988.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2592, 7, 2, 'Repayment', '2074-11-02', '11', '2074', '164.0000', '187824.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2593, 7, 2, 'Repayment', '2074-12-02', '12', '2074', '164.0000', '187660.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2594, 7, 2, 'Repayment', '2075-01-02', '01', '2075', '164.0000', '187496.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2595, 7, 2, 'Repayment', '2075-02-02', '02', '2075', '164.0000', '187332.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2596, 7, 2, 'Repayment', '2075-03-02', '03', '2075', '164.0000', '187168.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2597, 7, 2, 'Repayment', '2075-04-02', '04', '2075', '164.0000', '187004.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2598, 7, 2, 'Repayment', '2075-05-02', '05', '2075', '164.0000', '186840.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2599, 7, 2, 'Repayment', '2075-06-02', '06', '2075', '164.0000', '186676.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2600, 7, 2, 'Repayment', '2075-07-02', '07', '2075', '164.0000', '186512.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2601, 7, 2, 'Repayment', '2075-08-02', '08', '2075', '164.0000', '186348.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2602, 7, 2, 'Repayment', '2075-09-02', '09', '2075', '164.0000', '186184.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2603, 7, 2, 'Repayment', '2075-10-02', '10', '2075', '164.0000', '186020.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2604, 7, 2, 'Repayment', '2075-11-02', '11', '2075', '164.0000', '185856.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2605, 7, 2, 'Repayment', '2075-12-02', '12', '2075', '164.0000', '185692.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2606, 7, 2, 'Repayment', '2076-01-02', '01', '2076', '164.0000', '185528.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2607, 7, 2, 'Repayment', '2076-02-02', '02', '2076', '164.0000', '185364.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2608, 7, 2, 'Repayment', '2076-03-02', '03', '2076', '164.0000', '185200.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2609, 7, 2, 'Repayment', '2076-04-02', '04', '2076', '164.0000', '185036.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2610, 7, 2, 'Repayment', '2076-05-02', '05', '2076', '164.0000', '184872.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2611, 7, 2, 'Repayment', '2076-06-02', '06', '2076', '164.0000', '184708.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2612, 7, 2, 'Repayment', '2076-07-02', '07', '2076', '164.0000', '184544.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2613, 7, 2, 'Repayment', '2076-08-02', '08', '2076', '164.0000', '184380.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2614, 7, 2, 'Repayment', '2076-09-02', '09', '2076', '164.0000', '184216.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2615, 7, 2, 'Repayment', '2076-10-02', '10', '2076', '164.0000', '184052.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2616, 7, 2, 'Repayment', '2076-11-02', '11', '2076', '164.0000', '183888.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2617, 7, 2, 'Repayment', '2076-12-02', '12', '2076', '164.0000', '183724.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2618, 7, 2, 'Repayment', '2077-01-02', '01', '2077', '164.0000', '183560.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2619, 7, 2, 'Repayment', '2077-02-02', '02', '2077', '164.0000', '183396.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2620, 7, 2, 'Repayment', '2077-03-02', '03', '2077', '164.0000', '183232.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2621, 7, 2, 'Repayment', '2077-04-02', '04', '2077', '164.0000', '183068.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2622, 7, 2, 'Repayment', '2077-05-02', '05', '2077', '164.0000', '182904.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2623, 7, 2, 'Repayment', '2077-06-02', '06', '2077', '164.0000', '182740.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2624, 7, 2, 'Repayment', '2077-07-02', '07', '2077', '164.0000', '182576.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2625, 7, 2, 'Repayment', '2077-08-02', '08', '2077', '164.0000', '182412.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2626, 7, 2, 'Repayment', '2077-09-02', '09', '2077', '164.0000', '182248.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2627, 7, 2, 'Repayment', '2077-10-02', '10', '2077', '164.0000', '182084.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2628, 7, 2, 'Repayment', '2077-11-02', '11', '2077', '164.0000', '181920.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2629, 7, 2, 'Repayment', '2077-12-02', '12', '2077', '164.0000', '181756.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2630, 7, 2, 'Repayment', '2078-01-02', '01', '2078', '164.0000', '181592.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2631, 7, 2, 'Repayment', '2078-02-02', '02', '2078', '164.0000', '181428.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2632, 7, 2, 'Repayment', '2078-03-02', '03', '2078', '164.0000', '181264.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2633, 7, 2, 'Repayment', '2078-04-02', '04', '2078', '164.0000', '181100.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2634, 7, 2, 'Repayment', '2078-05-02', '05', '2078', '164.0000', '180936.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2635, 7, 2, 'Repayment', '2078-06-02', '06', '2078', '164.0000', '180772.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2636, 7, 2, 'Repayment', '2078-07-02', '07', '2078', '164.0000', '180608.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2637, 7, 2, 'Repayment', '2078-08-02', '08', '2078', '164.0000', '180444.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2638, 7, 2, 'Repayment', '2078-09-02', '09', '2078', '164.0000', '180280.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2639, 7, 2, 'Repayment', '2078-10-02', '10', '2078', '164.0000', '180116.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2640, 7, 2, 'Repayment', '2078-11-02', '11', '2078', '164.0000', '179952.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2641, 7, 2, 'Repayment', '2078-12-02', '12', '2078', '164.0000', '179788.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2642, 7, 2, 'Repayment', '2079-01-02', '01', '2079', '164.0000', '179624.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2643, 7, 2, 'Repayment', '2079-02-02', '02', '2079', '164.0000', '179460.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2644, 7, 2, 'Repayment', '2079-03-02', '03', '2079', '164.0000', '179296.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(2645, 7, 2, 'Repayment', '2079-04-02', '04', '2079', '164.0000', '179132.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2646, 7, 2, 'Repayment', '2079-05-02', '05', '2079', '164.0000', '178968.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2647, 7, 2, 'Repayment', '2079-06-02', '06', '2079', '164.0000', '178804.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2648, 7, 2, 'Repayment', '2079-07-02', '07', '2079', '164.0000', '178640.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2649, 7, 2, 'Repayment', '2079-08-02', '08', '2079', '164.0000', '178476.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2650, 7, 2, 'Repayment', '2079-09-02', '09', '2079', '164.0000', '178312.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2651, 7, 2, 'Repayment', '2079-10-02', '10', '2079', '164.0000', '178148.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2652, 7, 2, 'Repayment', '2079-11-02', '11', '2079', '164.0000', '177984.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2653, 7, 2, 'Repayment', '2079-12-02', '12', '2079', '164.0000', '177820.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2654, 7, 2, 'Repayment', '2080-01-02', '01', '2080', '164.0000', '177656.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2655, 7, 2, 'Repayment', '2080-02-02', '02', '2080', '164.0000', '177492.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2656, 7, 2, 'Repayment', '2080-03-02', '03', '2080', '164.0000', '177328.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2657, 7, 2, 'Repayment', '2080-04-02', '04', '2080', '164.0000', '177164.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2658, 7, 2, 'Repayment', '2080-05-02', '05', '2080', '164.0000', '177000.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2659, 7, 2, 'Repayment', '2080-06-02', '06', '2080', '164.0000', '176836.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2660, 7, 2, 'Repayment', '2080-07-02', '07', '2080', '164.0000', '176672.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2661, 7, 2, 'Repayment', '2080-08-02', '08', '2080', '164.0000', '176508.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2662, 7, 2, 'Repayment', '2080-09-02', '09', '2080', '164.0000', '176344.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2663, 7, 2, 'Repayment', '2080-10-02', '10', '2080', '164.0000', '176180.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2664, 7, 2, 'Repayment', '2080-11-02', '11', '2080', '164.0000', '176016.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2665, 7, 2, 'Repayment', '2080-12-02', '12', '2080', '164.0000', '175852.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2666, 7, 2, 'Repayment', '2081-01-02', '01', '2081', '164.0000', '175688.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2667, 7, 2, 'Repayment', '2081-02-02', '02', '2081', '164.0000', '175524.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2668, 7, 2, 'Repayment', '2081-03-02', '03', '2081', '164.0000', '175360.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2669, 7, 2, 'Repayment', '2081-04-02', '04', '2081', '164.0000', '175196.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2670, 7, 2, 'Repayment', '2081-05-02', '05', '2081', '164.0000', '175032.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2671, 7, 2, 'Repayment', '2081-06-02', '06', '2081', '164.0000', '174868.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2672, 7, 2, 'Repayment', '2081-07-02', '07', '2081', '164.0000', '174704.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2673, 7, 2, 'Repayment', '2081-08-02', '08', '2081', '164.0000', '174540.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2674, 7, 2, 'Repayment', '2081-09-02', '09', '2081', '164.0000', '174376.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2675, 7, 2, 'Repayment', '2081-10-02', '10', '2081', '164.0000', '174212.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2676, 7, 2, 'Repayment', '2081-11-02', '11', '2081', '164.0000', '174048.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2677, 7, 2, 'Repayment', '2081-12-02', '12', '2081', '164.0000', '173884.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2678, 7, 2, 'Repayment', '2082-01-02', '01', '2082', '164.0000', '173720.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2679, 7, 2, 'Repayment', '2082-02-02', '02', '2082', '164.0000', '173556.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2680, 7, 2, 'Repayment', '2082-03-02', '03', '2082', '164.0000', '173392.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2681, 7, 2, 'Repayment', '2082-04-02', '04', '2082', '164.0000', '173228.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2682, 7, 2, 'Repayment', '2082-05-02', '05', '2082', '164.0000', '173064.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2683, 7, 2, 'Repayment', '2082-06-02', '06', '2082', '164.0000', '172900.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2684, 7, 2, 'Repayment', '2082-07-02', '07', '2082', '164.0000', '172736.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2685, 7, 2, 'Repayment', '2082-08-02', '08', '2082', '164.0000', '172572.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2686, 7, 2, 'Repayment', '2082-09-02', '09', '2082', '164.0000', '172408.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2687, 7, 2, 'Repayment', '2082-10-02', '10', '2082', '164.0000', '172244.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2688, 7, 2, 'Repayment', '2082-11-02', '11', '2082', '164.0000', '172080.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2689, 7, 2, 'Repayment', '2082-12-02', '12', '2082', '164.0000', '171916.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2690, 7, 2, 'Repayment', '2083-01-02', '01', '2083', '164.0000', '171752.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2691, 7, 2, 'Repayment', '2083-02-02', '02', '2083', '164.0000', '171588.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2692, 7, 2, 'Repayment', '2083-03-02', '03', '2083', '164.0000', '171424.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2693, 7, 2, 'Repayment', '2083-04-02', '04', '2083', '164.0000', '171260.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2694, 7, 2, 'Repayment', '2083-05-02', '05', '2083', '164.0000', '171096.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2695, 7, 2, 'Repayment', '2083-06-02', '06', '2083', '164.0000', '170932.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2696, 7, 2, 'Repayment', '2083-07-02', '07', '2083', '164.0000', '170768.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2697, 7, 2, 'Repayment', '2083-08-02', '08', '2083', '164.0000', '170604.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2698, 7, 2, 'Repayment', '2083-09-02', '09', '2083', '164.0000', '170440.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2699, 7, 2, 'Repayment', '2083-10-02', '10', '2083', '164.0000', '170276.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2700, 7, 2, 'Repayment', '2083-11-02', '11', '2083', '164.0000', '170112.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2701, 7, 2, 'Repayment', '2083-12-02', '12', '2083', '164.0000', '169948.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2702, 7, 2, 'Repayment', '2084-01-02', '01', '2084', '164.0000', '169784.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2703, 7, 2, 'Repayment', '2084-02-02', '02', '2084', '164.0000', '169620.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2704, 7, 2, 'Repayment', '2084-03-02', '03', '2084', '164.0000', '169456.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2705, 7, 2, 'Repayment', '2084-04-02', '04', '2084', '164.0000', '169292.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:24', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2706, 7, 2, 'Repayment', '2084-05-02', '05', '2084', '164.0000', '169128.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2707, 7, 2, 'Repayment', '2084-06-02', '06', '2084', '164.0000', '168964.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2708, 7, 2, 'Repayment', '2084-07-02', '07', '2084', '164.0000', '168800.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2709, 7, 2, 'Repayment', '2084-08-02', '08', '2084', '164.0000', '168636.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2710, 7, 2, 'Repayment', '2084-09-02', '09', '2084', '164.0000', '168472.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2711, 7, 2, 'Repayment', '2084-10-02', '10', '2084', '164.0000', '168308.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2712, 7, 2, 'Repayment', '2084-11-02', '11', '2084', '164.0000', '168144.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2713, 7, 2, 'Repayment', '2084-12-02', '12', '2084', '164.0000', '167980.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2714, 7, 2, 'Repayment', '2085-01-02', '01', '2085', '164.0000', '167816.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2715, 7, 2, 'Repayment', '2085-02-02', '02', '2085', '164.0000', '167652.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2716, 7, 2, 'Repayment', '2085-03-02', '03', '2085', '164.0000', '167488.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2717, 7, 2, 'Repayment', '2085-04-02', '04', '2085', '164.0000', '167324.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2718, 7, 2, 'Repayment', '2085-05-02', '05', '2085', '164.0000', '167160.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2719, 7, 2, 'Repayment', '2085-06-02', '06', '2085', '164.0000', '166996.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2720, 7, 2, 'Repayment', '2085-07-02', '07', '2085', '164.0000', '166832.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2721, 7, 2, 'Repayment', '2085-08-02', '08', '2085', '164.0000', '166668.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2722, 7, 2, 'Repayment', '2085-09-02', '09', '2085', '164.0000', '166504.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2723, 7, 2, 'Repayment', '2085-10-02', '10', '2085', '164.0000', '166340.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2724, 7, 2, 'Repayment', '2085-11-02', '11', '2085', '164.0000', '166176.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2725, 7, 2, 'Repayment', '2085-12-02', '12', '2085', '164.0000', '166012.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2726, 7, 2, 'Repayment', '2086-01-02', '01', '2086', '164.0000', '165848.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2727, 7, 2, 'Repayment', '2086-02-02', '02', '2086', '164.0000', '165684.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2728, 7, 2, 'Repayment', '2086-03-02', '03', '2086', '164.0000', '165520.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2729, 7, 2, 'Repayment', '2086-04-02', '04', '2086', '164.0000', '165356.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2730, 7, 2, 'Repayment', '2086-05-02', '05', '2086', '164.0000', '165192.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2731, 7, 2, 'Repayment', '2086-06-02', '06', '2086', '164.0000', '165028.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2732, 7, 2, 'Repayment', '2086-07-02', '07', '2086', '164.0000', '164864.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2733, 7, 2, 'Repayment', '2086-08-02', '08', '2086', '164.0000', '164700.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2734, 7, 2, 'Repayment', '2086-09-02', '09', '2086', '164.0000', '164536.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2735, 7, 2, 'Repayment', '2086-10-02', '10', '2086', '164.0000', '164372.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2736, 7, 2, 'Repayment', '2086-11-02', '11', '2086', '164.0000', '164208.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2737, 7, 2, 'Repayment', '2086-12-02', '12', '2086', '164.0000', '164044.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2738, 7, 2, 'Repayment', '2087-01-02', '01', '2087', '164.0000', '163880.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2739, 7, 2, 'Repayment', '2087-02-02', '02', '2087', '164.0000', '163716.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2740, 7, 2, 'Repayment', '2087-03-02', '03', '2087', '164.0000', '163552.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2741, 7, 2, 'Repayment', '2087-04-02', '04', '2087', '164.0000', '163388.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2742, 7, 2, 'Repayment', '2087-05-02', '05', '2087', '164.0000', '163224.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2743, 7, 2, 'Repayment', '2087-06-02', '06', '2087', '164.0000', '163060.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2744, 7, 2, 'Repayment', '2087-07-02', '07', '2087', '164.0000', '162896.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2745, 7, 2, 'Repayment', '2087-08-02', '08', '2087', '164.0000', '162732.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2746, 7, 2, 'Repayment', '2087-09-02', '09', '2087', '164.0000', '162568.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2747, 7, 2, 'Repayment', '2087-10-02', '10', '2087', '164.0000', '162404.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2748, 7, 2, 'Repayment', '2087-11-02', '11', '2087', '164.0000', '162240.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2749, 7, 2, 'Repayment', '2087-12-02', '12', '2087', '164.0000', '162076.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2750, 7, 2, 'Repayment', '2088-01-02', '01', '2088', '164.0000', '161912.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2751, 7, 2, 'Repayment', '2088-02-02', '02', '2088', '164.0000', '161748.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2752, 7, 2, 'Repayment', '2088-03-02', '03', '2088', '164.0000', '161584.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2753, 7, 2, 'Repayment', '2088-04-02', '04', '2088', '164.0000', '161420.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2754, 7, 2, 'Repayment', '2088-05-02', '05', '2088', '164.0000', '161256.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2755, 7, 2, 'Repayment', '2088-06-02', '06', '2088', '164.0000', '161092.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2756, 7, 2, 'Repayment', '2088-07-02', '07', '2088', '164.0000', '160928.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2757, 7, 2, 'Repayment', '2088-08-02', '08', '2088', '164.0000', '160764.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2758, 7, 2, 'Repayment', '2088-09-02', '09', '2088', '164.0000', '160600.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2759, 7, 2, 'Repayment', '2088-10-02', '10', '2088', '164.0000', '160436.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2760, 7, 2, 'Repayment', '2088-11-02', '11', '2088', '164.0000', '160272.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2761, 7, 2, 'Repayment', '2088-12-02', '12', '2088', '164.0000', '160108.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2762, 7, 2, 'Repayment', '2089-01-02', '01', '2089', '164.0000', '159944.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2763, 7, 2, 'Repayment', '2089-02-02', '02', '2089', '164.0000', '159780.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2764, 7, 2, 'Repayment', '2089-03-02', '03', '2089', '164.0000', '159616.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2765, 7, 2, 'Repayment', '2089-04-02', '04', '2089', '164.0000', '159452.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2766, 7, 2, 'Repayment', '2089-05-02', '05', '2089', '164.0000', '159288.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2767, 7, 2, 'Repayment', '2089-06-02', '06', '2089', '164.0000', '159124.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2768, 7, 2, 'Repayment', '2089-07-02', '07', '2089', '164.0000', '158960.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2769, 7, 2, 'Repayment', '2089-08-02', '08', '2089', '164.0000', '158796.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2770, 7, 2, 'Repayment', '2089-09-02', '09', '2089', '164.0000', '158632.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2771, 7, 2, 'Repayment', '2089-10-02', '10', '2089', '164.0000', '158468.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2772, 7, 2, 'Repayment', '2089-11-02', '11', '2089', '164.0000', '158304.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2773, 7, 2, 'Repayment', '2089-12-02', '12', '2089', '164.0000', '158140.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2774, 7, 2, 'Repayment', '2090-01-02', '01', '2090', '164.0000', '157976.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2775, 7, 2, 'Repayment', '2090-02-02', '02', '2090', '164.0000', '157812.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2776, 7, 2, 'Repayment', '2090-03-02', '03', '2090', '164.0000', '157648.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2777, 7, 2, 'Repayment', '2090-04-02', '04', '2090', '164.0000', '157484.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2778, 7, 2, 'Repayment', '2090-05-02', '05', '2090', '164.0000', '157320.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2779, 7, 2, 'Repayment', '2090-06-02', '06', '2090', '164.0000', '157156.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2780, 7, 2, 'Repayment', '2090-07-02', '07', '2090', '164.0000', '156992.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2781, 7, 2, 'Repayment', '2090-08-02', '08', '2090', '164.0000', '156828.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2782, 7, 2, 'Repayment', '2090-09-02', '09', '2090', '164.0000', '156664.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2783, 7, 2, 'Repayment', '2090-10-02', '10', '2090', '164.0000', '156500.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2784, 7, 2, 'Repayment', '2090-11-02', '11', '2090', '164.0000', '156336.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2785, 7, 2, 'Repayment', '2090-12-02', '12', '2090', '164.0000', '156172.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2786, 7, 2, 'Repayment', '2091-01-02', '01', '2091', '164.0000', '156008.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2787, 7, 2, 'Repayment', '2091-02-02', '02', '2091', '164.0000', '155844.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2788, 7, 2, 'Repayment', '2091-03-02', '03', '2091', '164.0000', '155680.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2789, 7, 2, 'Repayment', '2091-04-02', '04', '2091', '164.0000', '155516.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2790, 7, 2, 'Repayment', '2091-05-02', '05', '2091', '164.0000', '155352.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2791, 7, 2, 'Repayment', '2091-06-02', '06', '2091', '164.0000', '155188.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2792, 7, 2, 'Repayment', '2091-07-02', '07', '2091', '164.0000', '155024.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2793, 7, 2, 'Repayment', '2091-08-02', '08', '2091', '164.0000', '154860.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2794, 7, 2, 'Repayment', '2091-09-02', '09', '2091', '164.0000', '154696.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2795, 7, 2, 'Repayment', '2091-10-02', '10', '2091', '164.0000', '154532.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2796, 7, 2, 'Repayment', '2091-11-02', '11', '2091', '164.0000', '154368.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2797, 7, 2, 'Repayment', '2091-12-02', '12', '2091', '164.0000', '154204.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2798, 7, 2, 'Repayment', '2092-01-02', '01', '2092', '164.0000', '154040.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2799, 7, 2, 'Repayment', '2092-02-02', '02', '2092', '164.0000', '153876.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2800, 7, 2, 'Repayment', '2092-03-02', '03', '2092', '164.0000', '153712.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2801, 7, 2, 'Repayment', '2092-04-02', '04', '2092', '164.0000', '153548.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2802, 7, 2, 'Repayment', '2092-05-02', '05', '2092', '164.0000', '153384.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2803, 7, 2, 'Repayment', '2092-06-02', '06', '2092', '164.0000', '153220.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2804, 7, 2, 'Repayment', '2092-07-02', '07', '2092', '164.0000', '153056.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2805, 7, 2, 'Repayment', '2092-08-02', '08', '2092', '164.0000', '152892.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2806, 7, 2, 'Repayment', '2092-09-02', '09', '2092', '164.0000', '152728.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2807, 7, 2, 'Repayment', '2092-10-02', '10', '2092', '164.0000', '152564.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2808, 7, 2, 'Repayment', '2092-11-02', '11', '2092', '164.0000', '152400.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2809, 7, 2, 'Repayment', '2092-12-02', '12', '2092', '164.0000', '152236.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2810, 7, 2, 'Repayment', '2093-01-02', '01', '2093', '164.0000', '152072.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2811, 7, 2, 'Repayment', '2093-02-02', '02', '2093', '164.0000', '151908.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2812, 7, 2, 'Repayment', '2093-03-02', '03', '2093', '164.0000', '151744.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2813, 7, 2, 'Repayment', '2093-04-02', '04', '2093', '164.0000', '151580.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2814, 7, 2, 'Repayment', '2093-05-02', '05', '2093', '164.0000', '151416.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2815, 7, 2, 'Repayment', '2093-06-02', '06', '2093', '164.0000', '151252.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2816, 7, 2, 'Repayment', '2093-07-02', '07', '2093', '164.0000', '151088.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2817, 7, 2, 'Repayment', '2093-08-02', '08', '2093', '164.0000', '150924.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2818, 7, 2, 'Repayment', '2093-09-02', '09', '2093', '164.0000', '150760.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2819, 7, 2, 'Repayment', '2093-10-02', '10', '2093', '164.0000', '150596.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2820, 7, 2, 'Repayment', '2093-11-02', '11', '2093', '164.0000', '150432.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2821, 7, 2, 'Repayment', '2093-12-02', '12', '2093', '164.0000', '150268.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2822, 7, 2, 'Repayment', '2094-01-02', '01', '2094', '164.0000', '150104.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2823, 7, 2, 'Repayment', '2094-02-02', '02', '2094', '164.0000', '149940.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2824, 7, 2, 'Repayment', '2094-03-02', '03', '2094', '164.0000', '149776.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2825, 7, 2, 'Repayment', '2094-04-02', '04', '2094', '164.0000', '149612.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2826, 7, 2, 'Repayment', '2094-05-02', '05', '2094', '164.0000', '149448.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2827, 7, 2, 'Repayment', '2094-06-02', '06', '2094', '164.0000', '149284.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2828, 7, 2, 'Repayment', '2094-07-02', '07', '2094', '164.0000', '149120.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2829, 7, 2, 'Repayment', '2094-08-02', '08', '2094', '164.0000', '148956.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2830, 7, 2, 'Repayment', '2094-09-02', '09', '2094', '164.0000', '148792.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2831, 7, 2, 'Repayment', '2094-10-02', '10', '2094', '164.0000', '148628.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2832, 7, 2, 'Repayment', '2094-11-02', '11', '2094', '164.0000', '148464.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2833, 7, 2, 'Repayment', '2094-12-02', '12', '2094', '164.0000', '148300.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2834, 7, 2, 'Repayment', '2095-01-02', '01', '2095', '164.0000', '148136.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2835, 7, 2, 'Repayment', '2095-02-02', '02', '2095', '164.0000', '147972.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2836, 7, 2, 'Repayment', '2095-03-02', '03', '2095', '164.0000', '147808.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2837, 7, 2, 'Repayment', '2095-04-02', '04', '2095', '164.0000', '147644.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2838, 7, 2, 'Repayment', '2095-05-02', '05', '2095', '164.0000', '147480.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2839, 7, 2, 'Repayment', '2095-06-02', '06', '2095', '164.0000', '147316.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2840, 7, 2, 'Repayment', '2095-07-02', '07', '2095', '164.0000', '147152.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2841, 7, 2, 'Repayment', '2095-08-02', '08', '2095', '164.0000', '146988.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2842, 7, 2, 'Repayment', '2095-09-02', '09', '2095', '164.0000', '146824.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2843, 7, 2, 'Repayment', '2095-10-02', '10', '2095', '164.0000', '146660.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2844, 7, 2, 'Repayment', '2095-11-02', '11', '2095', '164.0000', '146496.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2845, 7, 2, 'Repayment', '2095-12-02', '12', '2095', '164.0000', '146332.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2846, 7, 2, 'Repayment', '2096-01-02', '01', '2096', '164.0000', '146168.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2847, 7, 2, 'Repayment', '2096-02-02', '02', '2096', '164.0000', '146004.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2848, 7, 2, 'Repayment', '2096-03-02', '03', '2096', '164.0000', '145840.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2849, 7, 2, 'Repayment', '2096-04-02', '04', '2096', '164.0000', '145676.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2850, 7, 2, 'Repayment', '2096-05-02', '05', '2096', '164.0000', '145512.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2851, 7, 2, 'Repayment', '2096-06-02', '06', '2096', '164.0000', '145348.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2852, 7, 2, 'Repayment', '2096-07-02', '07', '2096', '164.0000', '145184.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2853, 7, 2, 'Repayment', '2096-08-02', '08', '2096', '164.0000', '145020.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2854, 7, 2, 'Repayment', '2096-09-02', '09', '2096', '164.0000', '144856.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2855, 7, 2, 'Repayment', '2096-10-02', '10', '2096', '164.0000', '144692.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2856, 7, 2, 'Repayment', '2096-11-02', '11', '2096', '164.0000', '144528.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2857, 7, 2, 'Repayment', '2096-12-02', '12', '2096', '164.0000', '144364.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2858, 7, 2, 'Repayment', '2097-01-02', '01', '2097', '164.0000', '144200.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2859, 7, 2, 'Repayment', '2097-02-02', '02', '2097', '164.0000', '144036.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2860, 7, 2, 'Repayment', '2097-03-02', '03', '2097', '164.0000', '143872.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2861, 7, 2, 'Repayment', '2097-04-02', '04', '2097', '164.0000', '143708.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2862, 7, 2, 'Repayment', '2097-05-02', '05', '2097', '164.0000', '143544.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2863, 7, 2, 'Repayment', '2097-06-02', '06', '2097', '164.0000', '143380.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2864, 7, 2, 'Repayment', '2097-07-02', '07', '2097', '164.0000', '143216.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2865, 7, 2, 'Repayment', '2097-08-02', '08', '2097', '164.0000', '143052.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2866, 7, 2, 'Repayment', '2097-09-02', '09', '2097', '164.0000', '142888.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2867, 7, 2, 'Repayment', '2097-10-02', '10', '2097', '164.0000', '142724.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2868, 7, 2, 'Repayment', '2097-11-02', '11', '2097', '164.0000', '142560.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2869, 7, 2, 'Repayment', '2097-12-02', '12', '2097', '164.0000', '142396.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2870, 7, 2, 'Repayment', '2098-01-02', '01', '2098', '164.0000', '142232.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2871, 7, 2, 'Repayment', '2098-02-02', '02', '2098', '164.0000', '142068.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2872, 7, 2, 'Repayment', '2098-03-02', '03', '2098', '164.0000', '141904.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2873, 7, 2, 'Repayment', '2098-04-02', '04', '2098', '164.0000', '141740.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2874, 7, 2, 'Repayment', '2098-05-02', '05', '2098', '164.0000', '141576.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2875, 7, 2, 'Repayment', '2098-06-02', '06', '2098', '164.0000', '141412.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2876, 7, 2, 'Repayment', '2098-07-02', '07', '2098', '164.0000', '141248.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2877, 7, 2, 'Repayment', '2098-08-02', '08', '2098', '164.0000', '141084.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2878, 7, 2, 'Repayment', '2098-09-02', '09', '2098', '164.0000', '140920.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2879, 7, 2, 'Repayment', '2098-10-02', '10', '2098', '164.0000', '140756.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2880, 7, 2, 'Repayment', '2098-11-02', '11', '2098', '164.0000', '140592.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2881, 7, 2, 'Repayment', '2098-12-02', '12', '2098', '164.0000', '140428.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2882, 7, 2, 'Repayment', '2099-01-02', '01', '2099', '164.0000', '140264.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(2883, 7, 2, 'Repayment', '2099-02-02', '02', '2099', '164.0000', '140100.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2884, 7, 2, 'Repayment', '2099-03-02', '03', '2099', '164.0000', '139936.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2885, 7, 2, 'Repayment', '2099-04-02', '04', '2099', '164.0000', '139772.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2886, 7, 2, 'Repayment', '2099-05-02', '05', '2099', '164.0000', '139608.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2887, 7, 2, 'Repayment', '2099-06-02', '06', '2099', '164.0000', '139444.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2888, 7, 2, 'Repayment', '2099-07-02', '07', '2099', '164.0000', '139280.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2889, 7, 2, 'Repayment', '2099-08-02', '08', '2099', '164.0000', '139116.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2890, 7, 2, 'Repayment', '2099-09-02', '09', '2099', '164.0000', '138952.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2891, 7, 2, 'Repayment', '2099-10-02', '10', '2099', '164.0000', '138788.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2892, 7, 2, 'Repayment', '2099-11-02', '11', '2099', '164.0000', '138624.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2893, 7, 2, 'Repayment', '2099-12-02', '12', '2099', '164.0000', '138460.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2894, 7, 2, 'Repayment', '2100-01-02', '01', '2100', '164.0000', '138296.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2895, 7, 2, 'Repayment', '2100-02-02', '02', '2100', '164.0000', '138132.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2896, 7, 2, 'Repayment', '2100-03-02', '03', '2100', '164.0000', '137968.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2897, 7, 2, 'Repayment', '2100-04-02', '04', '2100', '164.0000', '137804.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2898, 7, 2, 'Repayment', '2100-05-02', '05', '2100', '164.0000', '137640.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2899, 7, 2, 'Repayment', '2100-06-02', '06', '2100', '164.0000', '137476.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2900, 7, 2, 'Repayment', '2100-07-02', '07', '2100', '164.0000', '137312.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2901, 7, 2, 'Repayment', '2100-08-02', '08', '2100', '164.0000', '137148.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2902, 7, 2, 'Repayment', '2100-09-02', '09', '2100', '164.0000', '136984.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2903, 7, 2, 'Repayment', '2100-10-02', '10', '2100', '164.0000', '136820.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2904, 7, 2, 'Repayment', '2100-11-02', '11', '2100', '164.0000', '136656.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2905, 7, 2, 'Repayment', '2100-12-02', '12', '2100', '164.0000', '136492.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2906, 7, 2, 'Repayment', '2101-01-02', '01', '2101', '164.0000', '136328.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2907, 7, 2, 'Repayment', '2101-02-02', '02', '2101', '164.0000', '136164.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2908, 7, 2, 'Repayment', '2101-03-02', '03', '2101', '164.0000', '136000.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2909, 7, 2, 'Repayment', '2101-04-02', '04', '2101', '164.0000', '135836.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2910, 7, 2, 'Repayment', '2101-05-02', '05', '2101', '164.0000', '135672.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2911, 7, 2, 'Repayment', '2101-06-02', '06', '2101', '164.0000', '135508.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2912, 7, 2, 'Repayment', '2101-07-02', '07', '2101', '164.0000', '135344.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2913, 7, 2, 'Repayment', '2101-08-02', '08', '2101', '164.0000', '135180.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2914, 7, 2, 'Repayment', '2101-09-02', '09', '2101', '164.0000', '135016.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2915, 7, 2, 'Repayment', '2101-10-02', '10', '2101', '164.0000', '134852.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2916, 7, 2, 'Repayment', '2101-11-02', '11', '2101', '164.0000', '134688.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2917, 7, 2, 'Repayment', '2101-12-02', '12', '2101', '164.0000', '134524.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2918, 7, 2, 'Repayment', '2102-01-02', '01', '2102', '164.0000', '134360.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2919, 7, 2, 'Repayment', '2102-02-02', '02', '2102', '164.0000', '134196.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2920, 7, 2, 'Repayment', '2102-03-02', '03', '2102', '164.0000', '134032.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2921, 7, 2, 'Repayment', '2102-04-02', '04', '2102', '164.0000', '133868.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2922, 7, 2, 'Repayment', '2102-05-02', '05', '2102', '164.0000', '133704.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2923, 7, 2, 'Repayment', '2102-06-02', '06', '2102', '164.0000', '133540.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2924, 7, 2, 'Repayment', '2102-07-02', '07', '2102', '164.0000', '133376.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2925, 7, 2, 'Repayment', '2102-08-02', '08', '2102', '164.0000', '133212.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2926, 7, 2, 'Repayment', '2102-09-02', '09', '2102', '164.0000', '133048.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2927, 7, 2, 'Repayment', '2102-10-02', '10', '2102', '164.0000', '132884.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2928, 7, 2, 'Repayment', '2102-11-02', '11', '2102', '164.0000', '132720.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2929, 7, 2, 'Repayment', '2102-12-02', '12', '2102', '164.0000', '132556.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2930, 7, 2, 'Repayment', '2103-01-02', '01', '2103', '164.0000', '132392.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2931, 7, 2, 'Repayment', '2103-02-02', '02', '2103', '164.0000', '132228.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2932, 7, 2, 'Repayment', '2103-03-02', '03', '2103', '164.0000', '132064.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2933, 7, 2, 'Repayment', '2103-04-02', '04', '2103', '164.0000', '131900.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2934, 7, 2, 'Repayment', '2103-05-02', '05', '2103', '164.0000', '131736.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2935, 7, 2, 'Repayment', '2103-06-02', '06', '2103', '164.0000', '131572.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2936, 7, 2, 'Repayment', '2103-07-02', '07', '2103', '164.0000', '131408.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2937, 7, 2, 'Repayment', '2103-08-02', '08', '2103', '164.0000', '131244.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2938, 7, 2, 'Repayment', '2103-09-02', '09', '2103', '164.0000', '131080.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2939, 7, 2, 'Repayment', '2103-10-02', '10', '2103', '164.0000', '130916.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2940, 7, 2, 'Repayment', '2103-11-02', '11', '2103', '164.0000', '130752.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2941, 7, 2, 'Repayment', '2103-12-02', '12', '2103', '164.0000', '130588.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2942, 7, 2, 'Repayment', '2104-01-02', '01', '2104', '164.0000', '130424.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2943, 7, 2, 'Repayment', '2104-02-02', '02', '2104', '164.0000', '130260.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2944, 7, 2, 'Repayment', '2104-03-02', '03', '2104', '164.0000', '130096.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2945, 7, 2, 'Repayment', '2104-04-02', '04', '2104', '164.0000', '129932.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2946, 7, 2, 'Repayment', '2104-05-02', '05', '2104', '164.0000', '129768.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2947, 7, 2, 'Repayment', '2104-06-02', '06', '2104', '164.0000', '129604.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2948, 7, 2, 'Repayment', '2104-07-02', '07', '2104', '164.0000', '129440.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2949, 7, 2, 'Repayment', '2104-08-02', '08', '2104', '164.0000', '129276.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2950, 7, 2, 'Repayment', '2104-09-02', '09', '2104', '164.0000', '129112.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2951, 7, 2, 'Repayment', '2104-10-02', '10', '2104', '164.0000', '128948.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:25', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2952, 7, 2, 'Repayment', '2104-11-02', '11', '2104', '164.0000', '128784.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2953, 7, 2, 'Repayment', '2104-12-02', '12', '2104', '164.0000', '128620.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2954, 7, 2, 'Repayment', '2105-01-02', '01', '2105', '164.0000', '128456.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2955, 7, 2, 'Repayment', '2105-02-02', '02', '2105', '164.0000', '128292.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2956, 7, 2, 'Repayment', '2105-03-02', '03', '2105', '164.0000', '128128.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2957, 7, 2, 'Repayment', '2105-04-02', '04', '2105', '164.0000', '127964.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2958, 7, 2, 'Repayment', '2105-05-02', '05', '2105', '164.0000', '127800.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2959, 7, 2, 'Repayment', '2105-06-02', '06', '2105', '164.0000', '127636.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2960, 7, 2, 'Repayment', '2105-07-02', '07', '2105', '164.0000', '127472.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2961, 7, 2, 'Repayment', '2105-08-02', '08', '2105', '164.0000', '127308.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2962, 7, 2, 'Repayment', '2105-09-02', '09', '2105', '164.0000', '127144.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2963, 7, 2, 'Repayment', '2105-10-02', '10', '2105', '164.0000', '126980.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2964, 7, 2, 'Repayment', '2105-11-02', '11', '2105', '164.0000', '126816.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2965, 7, 2, 'Repayment', '2105-12-02', '12', '2105', '164.0000', '126652.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2966, 7, 2, 'Repayment', '2106-01-02', '01', '2106', '164.0000', '126488.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2967, 7, 2, 'Repayment', '2106-02-02', '02', '2106', '164.0000', '126324.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2968, 7, 2, 'Repayment', '2106-03-02', '03', '2106', '164.0000', '126160.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2969, 7, 2, 'Repayment', '2106-04-02', '04', '2106', '164.0000', '125996.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2970, 7, 2, 'Repayment', '2106-05-02', '05', '2106', '164.0000', '125832.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2971, 7, 2, 'Repayment', '2106-06-02', '06', '2106', '164.0000', '125668.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2972, 7, 2, 'Repayment', '2106-07-02', '07', '2106', '164.0000', '125504.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2973, 7, 2, 'Repayment', '2106-08-02', '08', '2106', '164.0000', '125340.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2974, 7, 2, 'Repayment', '2106-09-02', '09', '2106', '164.0000', '125176.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2975, 7, 2, 'Repayment', '2106-10-02', '10', '2106', '164.0000', '125012.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2976, 7, 2, 'Repayment', '2106-11-02', '11', '2106', '164.0000', '124848.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2977, 7, 2, 'Repayment', '2106-12-02', '12', '2106', '164.0000', '124684.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2978, 7, 2, 'Repayment', '2107-01-02', '01', '2107', '164.0000', '124520.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2979, 7, 2, 'Repayment', '2107-02-02', '02', '2107', '164.0000', '124356.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2980, 7, 2, 'Repayment', '2107-03-02', '03', '2107', '164.0000', '124192.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2981, 7, 2, 'Repayment', '2107-04-02', '04', '2107', '164.0000', '124028.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2982, 7, 2, 'Repayment', '2107-05-02', '05', '2107', '164.0000', '123864.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2983, 7, 2, 'Repayment', '2107-06-02', '06', '2107', '164.0000', '123700.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2984, 7, 2, 'Repayment', '2107-07-02', '07', '2107', '164.0000', '123536.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2985, 7, 2, 'Repayment', '2107-08-02', '08', '2107', '164.0000', '123372.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2986, 7, 2, 'Repayment', '2107-09-02', '09', '2107', '164.0000', '123208.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2987, 7, 2, 'Repayment', '2107-10-02', '10', '2107', '164.0000', '123044.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2988, 7, 2, 'Repayment', '2107-11-02', '11', '2107', '164.0000', '122880.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2989, 7, 2, 'Repayment', '2107-12-02', '12', '2107', '164.0000', '122716.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2990, 7, 2, 'Repayment', '2108-01-02', '01', '2108', '164.0000', '122552.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2991, 7, 2, 'Repayment', '2108-02-02', '02', '2108', '164.0000', '122388.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2992, 7, 2, 'Repayment', '2108-03-02', '03', '2108', '164.0000', '122224.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2993, 7, 2, 'Repayment', '2108-04-02', '04', '2108', '164.0000', '122060.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2994, 7, 2, 'Repayment', '2108-05-02', '05', '2108', '164.0000', '121896.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2995, 7, 2, 'Repayment', '2108-06-02', '06', '2108', '164.0000', '121732.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2996, 7, 2, 'Repayment', '2108-07-02', '07', '2108', '164.0000', '121568.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2997, 7, 2, 'Repayment', '2108-08-02', '08', '2108', '164.0000', '121404.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2998, 7, 2, 'Repayment', '2108-09-02', '09', '2108', '164.0000', '121240.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(2999, 7, 2, 'Repayment', '2108-10-02', '10', '2108', '164.0000', '121076.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3000, 7, 2, 'Repayment', '2108-11-02', '11', '2108', '164.0000', '120912.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3001, 7, 2, 'Repayment', '2108-12-02', '12', '2108', '164.0000', '120748.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3002, 7, 2, 'Repayment', '2109-01-02', '01', '2109', '164.0000', '120584.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3003, 7, 2, 'Repayment', '2109-02-02', '02', '2109', '164.0000', '120420.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3004, 7, 2, 'Repayment', '2109-03-02', '03', '2109', '164.0000', '120256.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3005, 7, 2, 'Repayment', '2109-04-02', '04', '2109', '164.0000', '120092.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3006, 7, 2, 'Repayment', '2109-05-02', '05', '2109', '164.0000', '119928.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3007, 7, 2, 'Repayment', '2109-06-02', '06', '2109', '164.0000', '119764.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3008, 7, 2, 'Repayment', '2109-07-02', '07', '2109', '164.0000', '119600.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3009, 7, 2, 'Repayment', '2109-08-02', '08', '2109', '164.0000', '119436.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3010, 7, 2, 'Repayment', '2109-09-02', '09', '2109', '164.0000', '119272.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3011, 7, 2, 'Repayment', '2109-10-02', '10', '2109', '164.0000', '119108.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3012, 7, 2, 'Repayment', '2109-11-02', '11', '2109', '164.0000', '118944.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3013, 7, 2, 'Repayment', '2109-12-02', '12', '2109', '164.0000', '118780.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3014, 7, 2, 'Repayment', '2110-01-02', '01', '2110', '164.0000', '118616.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3015, 7, 2, 'Repayment', '2110-02-02', '02', '2110', '164.0000', '118452.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3016, 7, 2, 'Repayment', '2110-03-02', '03', '2110', '164.0000', '118288.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3017, 7, 2, 'Repayment', '2110-04-02', '04', '2110', '164.0000', '118124.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3018, 7, 2, 'Repayment', '2110-05-02', '05', '2110', '164.0000', '117960.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3019, 7, 2, 'Repayment', '2110-06-02', '06', '2110', '164.0000', '117796.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3020, 7, 2, 'Repayment', '2110-07-02', '07', '2110', '164.0000', '117632.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3021, 7, 2, 'Repayment', '2110-08-02', '08', '2110', '164.0000', '117468.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3022, 7, 2, 'Repayment', '2110-09-02', '09', '2110', '164.0000', '117304.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3023, 7, 2, 'Repayment', '2110-10-02', '10', '2110', '164.0000', '117140.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3024, 7, 2, 'Repayment', '2110-11-02', '11', '2110', '164.0000', '116976.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3025, 7, 2, 'Repayment', '2110-12-02', '12', '2110', '164.0000', '116812.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3026, 7, 2, 'Repayment', '2111-01-02', '01', '2111', '164.0000', '116648.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3027, 7, 2, 'Repayment', '2111-02-02', '02', '2111', '164.0000', '116484.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3028, 7, 2, 'Repayment', '2111-03-02', '03', '2111', '164.0000', '116320.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3029, 7, 2, 'Repayment', '2111-04-02', '04', '2111', '164.0000', '116156.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3030, 7, 2, 'Repayment', '2111-05-02', '05', '2111', '164.0000', '115992.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3031, 7, 2, 'Repayment', '2111-06-02', '06', '2111', '164.0000', '115828.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3032, 7, 2, 'Repayment', '2111-07-02', '07', '2111', '164.0000', '115664.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3033, 7, 2, 'Repayment', '2111-08-02', '08', '2111', '164.0000', '115500.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3034, 7, 2, 'Repayment', '2111-09-02', '09', '2111', '164.0000', '115336.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3035, 7, 2, 'Repayment', '2111-10-02', '10', '2111', '164.0000', '115172.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3036, 7, 2, 'Repayment', '2111-11-02', '11', '2111', '164.0000', '115008.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3037, 7, 2, 'Repayment', '2111-12-02', '12', '2111', '164.0000', '114844.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3038, 7, 2, 'Repayment', '2112-01-02', '01', '2112', '164.0000', '114680.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3039, 7, 2, 'Repayment', '2112-02-02', '02', '2112', '164.0000', '114516.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3040, 7, 2, 'Repayment', '2112-03-02', '03', '2112', '164.0000', '114352.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3041, 7, 2, 'Repayment', '2112-04-02', '04', '2112', '164.0000', '114188.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3042, 7, 2, 'Repayment', '2112-05-02', '05', '2112', '164.0000', '114024.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3043, 7, 2, 'Repayment', '2112-06-02', '06', '2112', '164.0000', '113860.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3044, 7, 2, 'Repayment', '2112-07-02', '07', '2112', '164.0000', '113696.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3045, 7, 2, 'Repayment', '2112-08-02', '08', '2112', '164.0000', '113532.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3046, 7, 2, 'Repayment', '2112-09-02', '09', '2112', '164.0000', '113368.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3047, 7, 2, 'Repayment', '2112-10-02', '10', '2112', '164.0000', '113204.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3048, 7, 2, 'Repayment', '2112-11-02', '11', '2112', '164.0000', '113040.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3049, 7, 2, 'Repayment', '2112-12-02', '12', '2112', '164.0000', '112876.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3050, 7, 2, 'Repayment', '2113-01-02', '01', '2113', '164.0000', '112712.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3051, 7, 2, 'Repayment', '2113-02-02', '02', '2113', '164.0000', '112548.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3052, 7, 2, 'Repayment', '2113-03-02', '03', '2113', '164.0000', '112384.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3053, 7, 2, 'Repayment', '2113-04-02', '04', '2113', '164.0000', '112220.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3054, 7, 2, 'Repayment', '2113-05-02', '05', '2113', '164.0000', '112056.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3055, 7, 2, 'Repayment', '2113-06-02', '06', '2113', '164.0000', '111892.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3056, 7, 2, 'Repayment', '2113-07-02', '07', '2113', '164.0000', '111728.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3057, 7, 2, 'Repayment', '2113-08-02', '08', '2113', '164.0000', '111564.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3058, 7, 2, 'Repayment', '2113-09-02', '09', '2113', '164.0000', '111400.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3059, 7, 2, 'Repayment', '2113-10-02', '10', '2113', '164.0000', '111236.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3060, 7, 2, 'Repayment', '2113-11-02', '11', '2113', '164.0000', '111072.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3061, 7, 2, 'Repayment', '2113-12-02', '12', '2113', '164.0000', '110908.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3062, 7, 2, 'Repayment', '2114-01-02', '01', '2114', '164.0000', '110744.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3063, 7, 2, 'Repayment', '2114-02-02', '02', '2114', '164.0000', '110580.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3064, 7, 2, 'Repayment', '2114-03-02', '03', '2114', '164.0000', '110416.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3065, 7, 2, 'Repayment', '2114-04-02', '04', '2114', '164.0000', '110252.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3066, 7, 2, 'Repayment', '2114-05-02', '05', '2114', '164.0000', '110088.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3067, 7, 2, 'Repayment', '2114-06-02', '06', '2114', '164.0000', '109924.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3068, 7, 2, 'Repayment', '2114-07-02', '07', '2114', '164.0000', '109760.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3069, 7, 2, 'Repayment', '2114-08-02', '08', '2114', '164.0000', '109596.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3070, 7, 2, 'Repayment', '2114-09-02', '09', '2114', '164.0000', '109432.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3071, 7, 2, 'Repayment', '2114-10-02', '10', '2114', '164.0000', '109268.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3072, 7, 2, 'Repayment', '2114-11-02', '11', '2114', '164.0000', '109104.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3073, 7, 2, 'Repayment', '2114-12-02', '12', '2114', '164.0000', '108940.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3074, 7, 2, 'Repayment', '2115-01-02', '01', '2115', '164.0000', '108776.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3075, 7, 2, 'Repayment', '2115-02-02', '02', '2115', '164.0000', '108612.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3076, 7, 2, 'Repayment', '2115-03-02', '03', '2115', '164.0000', '108448.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3077, 7, 2, 'Repayment', '2115-04-02', '04', '2115', '164.0000', '108284.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3078, 7, 2, 'Repayment', '2115-05-02', '05', '2115', '164.0000', '108120.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3079, 7, 2, 'Repayment', '2115-06-02', '06', '2115', '164.0000', '107956.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3080, 7, 2, 'Repayment', '2115-07-02', '07', '2115', '164.0000', '107792.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3081, 7, 2, 'Repayment', '2115-08-02', '08', '2115', '164.0000', '107628.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3082, 7, 2, 'Repayment', '2115-09-02', '09', '2115', '164.0000', '107464.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3083, 7, 2, 'Repayment', '2115-10-02', '10', '2115', '164.0000', '107300.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3084, 7, 2, 'Repayment', '2115-11-02', '11', '2115', '164.0000', '107136.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3085, 7, 2, 'Repayment', '2115-12-02', '12', '2115', '164.0000', '106972.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3086, 7, 2, 'Repayment', '2116-01-02', '01', '2116', '164.0000', '106808.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3087, 7, 2, 'Repayment', '2116-02-02', '02', '2116', '164.0000', '106644.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3088, 7, 2, 'Repayment', '2116-03-02', '03', '2116', '164.0000', '106480.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3089, 7, 2, 'Repayment', '2116-04-02', '04', '2116', '164.0000', '106316.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3090, 7, 2, 'Repayment', '2116-05-02', '05', '2116', '164.0000', '106152.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3091, 7, 2, 'Repayment', '2116-06-02', '06', '2116', '164.0000', '105988.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3092, 7, 2, 'Repayment', '2116-07-02', '07', '2116', '164.0000', '105824.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3093, 7, 2, 'Repayment', '2116-08-02', '08', '2116', '164.0000', '105660.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3094, 7, 2, 'Repayment', '2116-09-02', '09', '2116', '164.0000', '105496.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3095, 7, 2, 'Repayment', '2116-10-02', '10', '2116', '164.0000', '105332.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3096, 7, 2, 'Repayment', '2116-11-02', '11', '2116', '164.0000', '105168.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3097, 7, 2, 'Repayment', '2116-12-02', '12', '2116', '164.0000', '105004.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3098, 7, 2, 'Repayment', '2117-01-02', '01', '2117', '164.0000', '104840.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3099, 7, 2, 'Repayment', '2117-02-02', '02', '2117', '164.0000', '104676.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3100, 7, 2, 'Repayment', '2117-03-02', '03', '2117', '164.0000', '104512.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3101, 7, 2, 'Repayment', '2117-04-02', '04', '2117', '164.0000', '104348.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3102, 7, 2, 'Repayment', '2117-05-02', '05', '2117', '164.0000', '104184.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3103, 7, 2, 'Repayment', '2117-06-02', '06', '2117', '164.0000', '104020.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3104, 7, 2, 'Repayment', '2117-07-02', '07', '2117', '164.0000', '103856.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3105, 7, 2, 'Repayment', '2117-08-02', '08', '2117', '164.0000', '103692.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3106, 7, 2, 'Repayment', '2117-09-02', '09', '2117', '164.0000', '103528.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3107, 7, 2, 'Repayment', '2117-10-02', '10', '2117', '164.0000', '103364.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3108, 7, 2, 'Repayment', '2117-11-02', '11', '2117', '164.0000', '103200.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3109, 7, 2, 'Repayment', '2117-12-02', '12', '2117', '164.0000', '103036.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3110, 7, 2, 'Repayment', '2118-01-02', '01', '2118', '164.0000', '102872.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3111, 7, 2, 'Repayment', '2118-02-02', '02', '2118', '164.0000', '102708.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3112, 7, 2, 'Repayment', '2118-03-02', '03', '2118', '164.0000', '102544.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3113, 7, 2, 'Repayment', '2118-04-02', '04', '2118', '164.0000', '102380.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3114, 7, 2, 'Repayment', '2118-05-02', '05', '2118', '164.0000', '102216.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3115, 7, 2, 'Repayment', '2118-06-02', '06', '2118', '164.0000', '102052.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3116, 7, 2, 'Repayment', '2118-07-02', '07', '2118', '164.0000', '101888.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3117, 7, 2, 'Repayment', '2118-08-02', '08', '2118', '164.0000', '101724.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3118, 7, 2, 'Repayment', '2118-09-02', '09', '2118', '164.0000', '101560.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3119, 7, 2, 'Repayment', '2118-10-02', '10', '2118', '164.0000', '101396.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3120, 7, 2, 'Repayment', '2118-11-02', '11', '2118', '164.0000', '101232.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(3121, 7, 2, 'Repayment', '2118-12-02', '12', '2118', '164.0000', '101068.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3122, 7, 2, 'Repayment', '2119-01-02', '01', '2119', '164.0000', '100904.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3123, 7, 2, 'Repayment', '2119-02-02', '02', '2119', '164.0000', '100740.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3124, 7, 2, 'Repayment', '2119-03-02', '03', '2119', '164.0000', '100576.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3125, 7, 2, 'Repayment', '2119-04-02', '04', '2119', '164.0000', '100412.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3126, 7, 2, 'Repayment', '2119-05-02', '05', '2119', '164.0000', '100248.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3127, 7, 2, 'Repayment', '2119-06-02', '06', '2119', '164.0000', '100084.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3128, 7, 2, 'Repayment', '2119-07-02', '07', '2119', '164.0000', '99920.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3129, 7, 2, 'Repayment', '2119-08-02', '08', '2119', '164.0000', '99756.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3130, 7, 2, 'Repayment', '2119-09-02', '09', '2119', '164.0000', '99592.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3131, 7, 2, 'Repayment', '2119-10-02', '10', '2119', '164.0000', '99428.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3132, 7, 2, 'Repayment', '2119-11-02', '11', '2119', '164.0000', '99264.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3133, 7, 2, 'Repayment', '2119-12-02', '12', '2119', '164.0000', '99100.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3134, 7, 2, 'Repayment', '2120-01-02', '01', '2120', '164.0000', '98936.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3135, 7, 2, 'Repayment', '2120-02-02', '02', '2120', '164.0000', '98772.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3136, 7, 2, 'Repayment', '2120-03-02', '03', '2120', '164.0000', '98608.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3137, 7, 2, 'Repayment', '2120-04-02', '04', '2120', '164.0000', '98444.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3138, 7, 2, 'Repayment', '2120-05-02', '05', '2120', '164.0000', '98280.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3139, 7, 2, 'Repayment', '2120-06-02', '06', '2120', '164.0000', '98116.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3140, 7, 2, 'Repayment', '2120-07-02', '07', '2120', '164.0000', '97952.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3141, 7, 2, 'Repayment', '2120-08-02', '08', '2120', '164.0000', '97788.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3142, 7, 2, 'Repayment', '2120-09-02', '09', '2120', '164.0000', '97624.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3143, 7, 2, 'Repayment', '2120-10-02', '10', '2120', '164.0000', '97460.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3144, 7, 2, 'Repayment', '2120-11-02', '11', '2120', '164.0000', '97296.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3145, 7, 2, 'Repayment', '2120-12-02', '12', '2120', '164.0000', '97132.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3146, 7, 2, 'Repayment', '2121-01-02', '01', '2121', '164.0000', '96968.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3147, 7, 2, 'Repayment', '2121-02-02', '02', '2121', '164.0000', '96804.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3148, 7, 2, 'Repayment', '2121-03-02', '03', '2121', '164.0000', '96640.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3149, 7, 2, 'Repayment', '2121-04-02', '04', '2121', '164.0000', '96476.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3150, 7, 2, 'Repayment', '2121-05-02', '05', '2121', '164.0000', '96312.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3151, 7, 2, 'Repayment', '2121-06-02', '06', '2121', '164.0000', '96148.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3152, 7, 2, 'Repayment', '2121-07-02', '07', '2121', '164.0000', '95984.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3153, 7, 2, 'Repayment', '2121-08-02', '08', '2121', '164.0000', '95820.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3154, 7, 2, 'Repayment', '2121-09-02', '09', '2121', '164.0000', '95656.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3155, 7, 2, 'Repayment', '2121-10-02', '10', '2121', '164.0000', '95492.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3156, 7, 2, 'Repayment', '2121-11-02', '11', '2121', '164.0000', '95328.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3157, 7, 2, 'Repayment', '2121-12-02', '12', '2121', '164.0000', '95164.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3158, 7, 2, 'Repayment', '2122-01-02', '01', '2122', '164.0000', '95000.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3159, 7, 2, 'Repayment', '2122-02-02', '02', '2122', '164.0000', '94836.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3160, 7, 2, 'Repayment', '2122-03-02', '03', '2122', '164.0000', '94672.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3161, 7, 2, 'Repayment', '2122-04-02', '04', '2122', '164.0000', '94508.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3162, 7, 2, 'Repayment', '2122-05-02', '05', '2122', '164.0000', '94344.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3163, 7, 2, 'Repayment', '2122-06-02', '06', '2122', '164.0000', '94180.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3164, 7, 2, 'Repayment', '2122-07-02', '07', '2122', '164.0000', '94016.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3165, 7, 2, 'Repayment', '2122-08-02', '08', '2122', '164.0000', '93852.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3166, 7, 2, 'Repayment', '2122-09-02', '09', '2122', '164.0000', '93688.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3167, 7, 2, 'Repayment', '2122-10-02', '10', '2122', '164.0000', '93524.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3168, 7, 2, 'Repayment', '2122-11-02', '11', '2122', '164.0000', '93360.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3169, 7, 2, 'Repayment', '2122-12-02', '12', '2122', '164.0000', '93196.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3170, 7, 2, 'Repayment', '2123-01-02', '01', '2123', '164.0000', '93032.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3171, 7, 2, 'Repayment', '2123-02-02', '02', '2123', '164.0000', '92868.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3172, 7, 2, 'Repayment', '2123-03-02', '03', '2123', '164.0000', '92704.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3173, 7, 2, 'Repayment', '2123-04-02', '04', '2123', '164.0000', '92540.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3174, 7, 2, 'Repayment', '2123-05-02', '05', '2123', '164.0000', '92376.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3175, 7, 2, 'Repayment', '2123-06-02', '06', '2123', '164.0000', '92212.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3176, 7, 2, 'Repayment', '2123-07-02', '07', '2123', '164.0000', '92048.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3177, 7, 2, 'Repayment', '2123-08-02', '08', '2123', '164.0000', '91884.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3178, 7, 2, 'Repayment', '2123-09-02', '09', '2123', '164.0000', '91720.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3179, 7, 2, 'Repayment', '2123-10-02', '10', '2123', '164.0000', '91556.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3180, 7, 2, 'Repayment', '2123-11-02', '11', '2123', '164.0000', '91392.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3181, 7, 2, 'Repayment', '2123-12-02', '12', '2123', '164.0000', '91228.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3182, 7, 2, 'Repayment', '2124-01-02', '01', '2124', '164.0000', '91064.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3183, 7, 2, 'Repayment', '2124-02-02', '02', '2124', '164.0000', '90900.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3184, 7, 2, 'Repayment', '2124-03-02', '03', '2124', '164.0000', '90736.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3185, 7, 2, 'Repayment', '2124-04-02', '04', '2124', '164.0000', '90572.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3186, 7, 2, 'Repayment', '2124-05-02', '05', '2124', '164.0000', '90408.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3187, 7, 2, 'Repayment', '2124-06-02', '06', '2124', '164.0000', '90244.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3188, 7, 2, 'Repayment', '2124-07-02', '07', '2124', '164.0000', '90080.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3189, 7, 2, 'Repayment', '2124-08-02', '08', '2124', '164.0000', '89916.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3190, 7, 2, 'Repayment', '2124-09-02', '09', '2124', '164.0000', '89752.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3191, 7, 2, 'Repayment', '2124-10-02', '10', '2124', '164.0000', '89588.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3192, 7, 2, 'Repayment', '2124-11-02', '11', '2124', '164.0000', '89424.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3193, 7, 2, 'Repayment', '2124-12-02', '12', '2124', '164.0000', '89260.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3194, 7, 2, 'Repayment', '2125-01-02', '01', '2125', '164.0000', '89096.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3195, 7, 2, 'Repayment', '2125-02-02', '02', '2125', '164.0000', '88932.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3196, 7, 2, 'Repayment', '2125-03-02', '03', '2125', '164.0000', '88768.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3197, 7, 2, 'Repayment', '2125-04-02', '04', '2125', '164.0000', '88604.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3198, 7, 2, 'Repayment', '2125-05-02', '05', '2125', '164.0000', '88440.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3199, 7, 2, 'Repayment', '2125-06-02', '06', '2125', '164.0000', '88276.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3200, 7, 2, 'Repayment', '2125-07-02', '07', '2125', '164.0000', '88112.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3201, 7, 2, 'Repayment', '2125-08-02', '08', '2125', '164.0000', '87948.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3202, 7, 2, 'Repayment', '2125-09-02', '09', '2125', '164.0000', '87784.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3203, 7, 2, 'Repayment', '2125-10-02', '10', '2125', '164.0000', '87620.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3204, 7, 2, 'Repayment', '2125-11-02', '11', '2125', '164.0000', '87456.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3205, 7, 2, 'Repayment', '2125-12-02', '12', '2125', '164.0000', '87292.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3206, 7, 2, 'Repayment', '2126-01-02', '01', '2126', '164.0000', '87128.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3207, 7, 2, 'Repayment', '2126-02-02', '02', '2126', '164.0000', '86964.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3208, 7, 2, 'Repayment', '2126-03-02', '03', '2126', '164.0000', '86800.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3209, 7, 2, 'Repayment', '2126-04-02', '04', '2126', '164.0000', '86636.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3210, 7, 2, 'Repayment', '2126-05-02', '05', '2126', '164.0000', '86472.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3211, 7, 2, 'Repayment', '2126-06-02', '06', '2126', '164.0000', '86308.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3212, 7, 2, 'Repayment', '2126-07-02', '07', '2126', '164.0000', '86144.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3213, 7, 2, 'Repayment', '2126-08-02', '08', '2126', '164.0000', '85980.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3214, 7, 2, 'Repayment', '2126-09-02', '09', '2126', '164.0000', '85816.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3215, 7, 2, 'Repayment', '2126-10-02', '10', '2126', '164.0000', '85652.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3216, 7, 2, 'Repayment', '2126-11-02', '11', '2126', '164.0000', '85488.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3217, 7, 2, 'Repayment', '2126-12-02', '12', '2126', '164.0000', '85324.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3218, 7, 2, 'Repayment', '2127-01-02', '01', '2127', '164.0000', '85160.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3219, 7, 2, 'Repayment', '2127-02-02', '02', '2127', '164.0000', '84996.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3220, 7, 2, 'Repayment', '2127-03-02', '03', '2127', '164.0000', '84832.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3221, 7, 2, 'Repayment', '2127-04-02', '04', '2127', '164.0000', '84668.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3222, 7, 2, 'Repayment', '2127-05-02', '05', '2127', '164.0000', '84504.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3223, 7, 2, 'Repayment', '2127-06-02', '06', '2127', '164.0000', '84340.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3224, 7, 2, 'Repayment', '2127-07-02', '07', '2127', '164.0000', '84176.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3225, 7, 2, 'Repayment', '2127-08-02', '08', '2127', '164.0000', '84012.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3226, 7, 2, 'Repayment', '2127-09-02', '09', '2127', '164.0000', '83848.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3227, 7, 2, 'Repayment', '2127-10-02', '10', '2127', '164.0000', '83684.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3228, 7, 2, 'Repayment', '2127-11-02', '11', '2127', '164.0000', '83520.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3229, 7, 2, 'Repayment', '2127-12-02', '12', '2127', '164.0000', '83356.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3230, 7, 2, 'Repayment', '2128-01-02', '01', '2128', '164.0000', '83192.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3231, 7, 2, 'Repayment', '2128-02-02', '02', '2128', '164.0000', '83028.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3232, 7, 2, 'Repayment', '2128-03-02', '03', '2128', '164.0000', '82864.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3233, 7, 2, 'Repayment', '2128-04-02', '04', '2128', '164.0000', '82700.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3234, 7, 2, 'Repayment', '2128-05-02', '05', '2128', '164.0000', '82536.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3235, 7, 2, 'Repayment', '2128-06-02', '06', '2128', '164.0000', '82372.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3236, 7, 2, 'Repayment', '2128-07-02', '07', '2128', '164.0000', '82208.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3237, 7, 2, 'Repayment', '2128-08-02', '08', '2128', '164.0000', '82044.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3238, 7, 2, 'Repayment', '2128-09-02', '09', '2128', '164.0000', '81880.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3239, 7, 2, 'Repayment', '2128-10-02', '10', '2128', '164.0000', '81716.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3240, 7, 2, 'Repayment', '2128-11-02', '11', '2128', '164.0000', '81552.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:26', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3241, 7, 2, 'Repayment', '2128-12-02', '12', '2128', '164.0000', '81388.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3242, 7, 2, 'Repayment', '2129-01-02', '01', '2129', '164.0000', '81224.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3243, 7, 2, 'Repayment', '2129-02-02', '02', '2129', '164.0000', '81060.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3244, 7, 2, 'Repayment', '2129-03-02', '03', '2129', '164.0000', '80896.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3245, 7, 2, 'Repayment', '2129-04-02', '04', '2129', '164.0000', '80732.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3246, 7, 2, 'Repayment', '2129-05-02', '05', '2129', '164.0000', '80568.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3247, 7, 2, 'Repayment', '2129-06-02', '06', '2129', '164.0000', '80404.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3248, 7, 2, 'Repayment', '2129-07-02', '07', '2129', '164.0000', '80240.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3249, 7, 2, 'Repayment', '2129-08-02', '08', '2129', '164.0000', '80076.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3250, 7, 2, 'Repayment', '2129-09-02', '09', '2129', '164.0000', '79912.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3251, 7, 2, 'Repayment', '2129-10-02', '10', '2129', '164.0000', '79748.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3252, 7, 2, 'Repayment', '2129-11-02', '11', '2129', '164.0000', '79584.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3253, 7, 2, 'Repayment', '2129-12-02', '12', '2129', '164.0000', '79420.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3254, 7, 2, 'Repayment', '2130-01-02', '01', '2130', '164.0000', '79256.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3255, 7, 2, 'Repayment', '2130-02-02', '02', '2130', '164.0000', '79092.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3256, 7, 2, 'Repayment', '2130-03-02', '03', '2130', '164.0000', '78928.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3257, 7, 2, 'Repayment', '2130-04-02', '04', '2130', '164.0000', '78764.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3258, 7, 2, 'Repayment', '2130-05-02', '05', '2130', '164.0000', '78600.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3259, 7, 2, 'Repayment', '2130-06-02', '06', '2130', '164.0000', '78436.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3260, 7, 2, 'Repayment', '2130-07-02', '07', '2130', '164.0000', '78272.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3261, 7, 2, 'Repayment', '2130-08-02', '08', '2130', '164.0000', '78108.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3262, 7, 2, 'Repayment', '2130-09-02', '09', '2130', '164.0000', '77944.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3263, 7, 2, 'Repayment', '2130-10-02', '10', '2130', '164.0000', '77780.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3264, 7, 2, 'Repayment', '2130-11-02', '11', '2130', '164.0000', '77616.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3265, 7, 2, 'Repayment', '2130-12-02', '12', '2130', '164.0000', '77452.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3266, 7, 2, 'Repayment', '2131-01-02', '01', '2131', '164.0000', '77288.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3267, 7, 2, 'Repayment', '2131-02-02', '02', '2131', '164.0000', '77124.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3268, 7, 2, 'Repayment', '2131-03-02', '03', '2131', '164.0000', '76960.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3269, 7, 2, 'Repayment', '2131-04-02', '04', '2131', '164.0000', '76796.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3270, 7, 2, 'Repayment', '2131-05-02', '05', '2131', '164.0000', '76632.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3271, 7, 2, 'Repayment', '2131-06-02', '06', '2131', '164.0000', '76468.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3272, 7, 2, 'Repayment', '2131-07-02', '07', '2131', '164.0000', '76304.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3273, 7, 2, 'Repayment', '2131-08-02', '08', '2131', '164.0000', '76140.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3274, 7, 2, 'Repayment', '2131-09-02', '09', '2131', '164.0000', '75976.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3275, 7, 2, 'Repayment', '2131-10-02', '10', '2131', '164.0000', '75812.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3276, 7, 2, 'Repayment', '2131-11-02', '11', '2131', '164.0000', '75648.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3277, 7, 2, 'Repayment', '2131-12-02', '12', '2131', '164.0000', '75484.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3278, 7, 2, 'Repayment', '2132-01-02', '01', '2132', '164.0000', '75320.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3279, 7, 2, 'Repayment', '2132-02-02', '02', '2132', '164.0000', '75156.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3280, 7, 2, 'Repayment', '2132-03-02', '03', '2132', '164.0000', '74992.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3281, 7, 2, 'Repayment', '2132-04-02', '04', '2132', '164.0000', '74828.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3282, 7, 2, 'Repayment', '2132-05-02', '05', '2132', '164.0000', '74664.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3283, 7, 2, 'Repayment', '2132-06-02', '06', '2132', '164.0000', '74500.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3284, 7, 2, 'Repayment', '2132-07-02', '07', '2132', '164.0000', '74336.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3285, 7, 2, 'Repayment', '2132-08-02', '08', '2132', '164.0000', '74172.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3286, 7, 2, 'Repayment', '2132-09-02', '09', '2132', '164.0000', '74008.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3287, 7, 2, 'Repayment', '2132-10-02', '10', '2132', '164.0000', '73844.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3288, 7, 2, 'Repayment', '2132-11-02', '11', '2132', '164.0000', '73680.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3289, 7, 2, 'Repayment', '2132-12-02', '12', '2132', '164.0000', '73516.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3290, 7, 2, 'Repayment', '2133-01-02', '01', '2133', '164.0000', '73352.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3291, 7, 2, 'Repayment', '2133-02-02', '02', '2133', '164.0000', '73188.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3292, 7, 2, 'Repayment', '2133-03-02', '03', '2133', '164.0000', '73024.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3293, 7, 2, 'Repayment', '2133-04-02', '04', '2133', '164.0000', '72860.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3294, 7, 2, 'Repayment', '2133-05-02', '05', '2133', '164.0000', '72696.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3295, 7, 2, 'Repayment', '2133-06-02', '06', '2133', '164.0000', '72532.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3296, 7, 2, 'Repayment', '2133-07-02', '07', '2133', '164.0000', '72368.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3297, 7, 2, 'Repayment', '2133-08-02', '08', '2133', '164.0000', '72204.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3298, 7, 2, 'Repayment', '2133-09-02', '09', '2133', '164.0000', '72040.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3299, 7, 2, 'Repayment', '2133-10-02', '10', '2133', '164.0000', '71876.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3300, 7, 2, 'Repayment', '2133-11-02', '11', '2133', '164.0000', '71712.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3301, 7, 2, 'Repayment', '2133-12-02', '12', '2133', '164.0000', '71548.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3302, 7, 2, 'Repayment', '2134-01-02', '01', '2134', '164.0000', '71384.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3303, 7, 2, 'Repayment', '2134-02-02', '02', '2134', '164.0000', '71220.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3304, 7, 2, 'Repayment', '2134-03-02', '03', '2134', '164.0000', '71056.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3305, 7, 2, 'Repayment', '2134-04-02', '04', '2134', '164.0000', '70892.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3306, 7, 2, 'Repayment', '2134-05-02', '05', '2134', '164.0000', '70728.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3307, 7, 2, 'Repayment', '2134-06-02', '06', '2134', '164.0000', '70564.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3308, 7, 2, 'Repayment', '2134-07-02', '07', '2134', '164.0000', '70400.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3309, 7, 2, 'Repayment', '2134-08-02', '08', '2134', '164.0000', '70236.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3310, 7, 2, 'Repayment', '2134-09-02', '09', '2134', '164.0000', '70072.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3311, 7, 2, 'Repayment', '2134-10-02', '10', '2134', '164.0000', '69908.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3312, 7, 2, 'Repayment', '2134-11-02', '11', '2134', '164.0000', '69744.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3313, 7, 2, 'Repayment', '2134-12-02', '12', '2134', '164.0000', '69580.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3314, 7, 2, 'Repayment', '2135-01-02', '01', '2135', '164.0000', '69416.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3315, 7, 2, 'Repayment', '2135-02-02', '02', '2135', '164.0000', '69252.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3316, 7, 2, 'Repayment', '2135-03-02', '03', '2135', '164.0000', '69088.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3317, 7, 2, 'Repayment', '2135-04-02', '04', '2135', '164.0000', '68924.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3318, 7, 2, 'Repayment', '2135-05-02', '05', '2135', '164.0000', '68760.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3319, 7, 2, 'Repayment', '2135-06-02', '06', '2135', '164.0000', '68596.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3320, 7, 2, 'Repayment', '2135-07-02', '07', '2135', '164.0000', '68432.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3321, 7, 2, 'Repayment', '2135-08-02', '08', '2135', '164.0000', '68268.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3322, 7, 2, 'Repayment', '2135-09-02', '09', '2135', '164.0000', '68104.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3323, 7, 2, 'Repayment', '2135-10-02', '10', '2135', '164.0000', '67940.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3324, 7, 2, 'Repayment', '2135-11-02', '11', '2135', '164.0000', '67776.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3325, 7, 2, 'Repayment', '2135-12-02', '12', '2135', '164.0000', '67612.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3326, 7, 2, 'Repayment', '2136-01-02', '01', '2136', '164.0000', '67448.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3327, 7, 2, 'Repayment', '2136-02-02', '02', '2136', '164.0000', '67284.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3328, 7, 2, 'Repayment', '2136-03-02', '03', '2136', '164.0000', '67120.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3329, 7, 2, 'Repayment', '2136-04-02', '04', '2136', '164.0000', '66956.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3330, 7, 2, 'Repayment', '2136-05-02', '05', '2136', '164.0000', '66792.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3331, 7, 2, 'Repayment', '2136-06-02', '06', '2136', '164.0000', '66628.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3332, 7, 2, 'Repayment', '2136-07-02', '07', '2136', '164.0000', '66464.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3333, 7, 2, 'Repayment', '2136-08-02', '08', '2136', '164.0000', '66300.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3334, 7, 2, 'Repayment', '2136-09-02', '09', '2136', '164.0000', '66136.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3335, 7, 2, 'Repayment', '2136-10-02', '10', '2136', '164.0000', '65972.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3336, 7, 2, 'Repayment', '2136-11-02', '11', '2136', '164.0000', '65808.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3337, 7, 2, 'Repayment', '2136-12-02', '12', '2136', '164.0000', '65644.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3338, 7, 2, 'Repayment', '2137-01-02', '01', '2137', '164.0000', '65480.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3339, 7, 2, 'Repayment', '2137-02-02', '02', '2137', '164.0000', '65316.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3340, 7, 2, 'Repayment', '2137-03-02', '03', '2137', '164.0000', '65152.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3341, 7, 2, 'Repayment', '2137-04-02', '04', '2137', '164.0000', '64988.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3342, 7, 2, 'Repayment', '2137-05-02', '05', '2137', '164.0000', '64824.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3343, 7, 2, 'Repayment', '2137-06-02', '06', '2137', '164.0000', '64660.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3344, 7, 2, 'Repayment', '2137-07-02', '07', '2137', '164.0000', '64496.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3345, 7, 2, 'Repayment', '2137-08-02', '08', '2137', '164.0000', '64332.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3346, 7, 2, 'Repayment', '2137-09-02', '09', '2137', '164.0000', '64168.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3347, 7, 2, 'Repayment', '2137-10-02', '10', '2137', '164.0000', '64004.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3348, 7, 2, 'Repayment', '2137-11-02', '11', '2137', '164.0000', '63840.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3349, 7, 2, 'Repayment', '2137-12-02', '12', '2137', '164.0000', '63676.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3350, 7, 2, 'Repayment', '2138-01-02', '01', '2138', '164.0000', '63512.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3351, 7, 2, 'Repayment', '2138-02-02', '02', '2138', '164.0000', '63348.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3352, 7, 2, 'Repayment', '2138-03-02', '03', '2138', '164.0000', '63184.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3353, 7, 2, 'Repayment', '2138-04-02', '04', '2138', '164.0000', '63020.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3354, 7, 2, 'Repayment', '2138-05-02', '05', '2138', '164.0000', '62856.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3355, 7, 2, 'Repayment', '2138-06-02', '06', '2138', '164.0000', '62692.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3356, 7, 2, 'Repayment', '2138-07-02', '07', '2138', '164.0000', '62528.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3357, 7, 2, 'Repayment', '2138-08-02', '08', '2138', '164.0000', '62364.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3358, 7, 2, 'Repayment', '2138-09-02', '09', '2138', '164.0000', '62200.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3359, 7, 2, 'Repayment', '2138-10-02', '10', '2138', '164.0000', '62036.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3360, 7, 2, 'Repayment', '2138-11-02', '11', '2138', '164.0000', '61872.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(3361, 7, 2, 'Repayment', '2138-12-02', '12', '2138', '164.0000', '61708.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3362, 7, 2, 'Repayment', '2139-01-02', '01', '2139', '164.0000', '61544.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3363, 7, 2, 'Repayment', '2139-02-02', '02', '2139', '164.0000', '61380.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3364, 7, 2, 'Repayment', '2139-03-02', '03', '2139', '164.0000', '61216.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3365, 7, 2, 'Repayment', '2139-04-02', '04', '2139', '164.0000', '61052.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3366, 7, 2, 'Repayment', '2139-05-02', '05', '2139', '164.0000', '60888.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3367, 7, 2, 'Repayment', '2139-06-02', '06', '2139', '164.0000', '60724.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3368, 7, 2, 'Repayment', '2139-07-02', '07', '2139', '164.0000', '60560.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3369, 7, 2, 'Repayment', '2139-08-02', '08', '2139', '164.0000', '60396.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3370, 7, 2, 'Repayment', '2139-09-02', '09', '2139', '164.0000', '60232.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3371, 7, 2, 'Repayment', '2139-10-02', '10', '2139', '164.0000', '60068.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3372, 7, 2, 'Repayment', '2139-11-02', '11', '2139', '164.0000', '59904.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3373, 7, 2, 'Repayment', '2139-12-02', '12', '2139', '164.0000', '59740.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3374, 7, 2, 'Repayment', '2140-01-02', '01', '2140', '164.0000', '59576.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3375, 7, 2, 'Repayment', '2140-02-02', '02', '2140', '164.0000', '59412.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3376, 7, 2, 'Repayment', '2140-03-02', '03', '2140', '164.0000', '59248.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3377, 7, 2, 'Repayment', '2140-04-02', '04', '2140', '164.0000', '59084.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3378, 7, 2, 'Repayment', '2140-05-02', '05', '2140', '164.0000', '58920.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3379, 7, 2, 'Repayment', '2140-06-02', '06', '2140', '164.0000', '58756.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3380, 7, 2, 'Repayment', '2140-07-02', '07', '2140', '164.0000', '58592.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3381, 7, 2, 'Repayment', '2140-08-02', '08', '2140', '164.0000', '58428.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3382, 7, 2, 'Repayment', '2140-09-02', '09', '2140', '164.0000', '58264.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3383, 7, 2, 'Repayment', '2140-10-02', '10', '2140', '164.0000', '58100.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3384, 7, 2, 'Repayment', '2140-11-02', '11', '2140', '164.0000', '57936.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3385, 7, 2, 'Repayment', '2140-12-02', '12', '2140', '164.0000', '57772.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3386, 7, 2, 'Repayment', '2141-01-02', '01', '2141', '164.0000', '57608.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3387, 7, 2, 'Repayment', '2141-02-02', '02', '2141', '164.0000', '57444.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3388, 7, 2, 'Repayment', '2141-03-02', '03', '2141', '164.0000', '57280.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3389, 7, 2, 'Repayment', '2141-04-02', '04', '2141', '164.0000', '57116.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3390, 7, 2, 'Repayment', '2141-05-02', '05', '2141', '164.0000', '56952.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3391, 7, 2, 'Repayment', '2141-06-02', '06', '2141', '164.0000', '56788.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3392, 7, 2, 'Repayment', '2141-07-02', '07', '2141', '164.0000', '56624.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3393, 7, 2, 'Repayment', '2141-08-02', '08', '2141', '164.0000', '56460.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3394, 7, 2, 'Repayment', '2141-09-02', '09', '2141', '164.0000', '56296.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3395, 7, 2, 'Repayment', '2141-10-02', '10', '2141', '164.0000', '56132.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3396, 7, 2, 'Repayment', '2141-11-02', '11', '2141', '164.0000', '55968.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3397, 7, 2, 'Repayment', '2141-12-02', '12', '2141', '164.0000', '55804.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3398, 7, 2, 'Repayment', '2142-01-02', '01', '2142', '164.0000', '55640.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3399, 7, 2, 'Repayment', '2142-02-02', '02', '2142', '164.0000', '55476.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3400, 7, 2, 'Repayment', '2142-03-02', '03', '2142', '164.0000', '55312.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3401, 7, 2, 'Repayment', '2142-04-02', '04', '2142', '164.0000', '55148.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:27', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3402, 7, 2, 'Repayment', '2142-05-02', '05', '2142', '164.0000', '54984.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3403, 7, 2, 'Repayment', '2142-06-02', '06', '2142', '164.0000', '54820.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3404, 7, 2, 'Repayment', '2142-07-02', '07', '2142', '164.0000', '54656.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3405, 7, 2, 'Repayment', '2142-08-02', '08', '2142', '164.0000', '54492.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3406, 7, 2, 'Repayment', '2142-09-02', '09', '2142', '164.0000', '54328.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3407, 7, 2, 'Repayment', '2142-10-02', '10', '2142', '164.0000', '54164.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3408, 7, 2, 'Repayment', '2142-11-02', '11', '2142', '164.0000', '54000.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3409, 7, 2, 'Repayment', '2142-12-02', '12', '2142', '164.0000', '53836.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3410, 7, 2, 'Repayment', '2143-01-02', '01', '2143', '164.0000', '53672.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3411, 7, 2, 'Repayment', '2143-02-02', '02', '2143', '164.0000', '53508.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3412, 7, 2, 'Repayment', '2143-03-02', '03', '2143', '164.0000', '53344.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3413, 7, 2, 'Repayment', '2143-04-02', '04', '2143', '164.0000', '53180.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3414, 7, 2, 'Repayment', '2143-05-02', '05', '2143', '164.0000', '53016.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3415, 7, 2, 'Repayment', '2143-06-02', '06', '2143', '164.0000', '52852.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3416, 7, 2, 'Repayment', '2143-07-02', '07', '2143', '164.0000', '52688.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3417, 7, 2, 'Repayment', '2143-08-02', '08', '2143', '164.0000', '52524.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3418, 7, 2, 'Repayment', '2143-09-02', '09', '2143', '164.0000', '52360.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3419, 7, 2, 'Repayment', '2143-10-02', '10', '2143', '164.0000', '52196.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3420, 7, 2, 'Repayment', '2143-11-02', '11', '2143', '164.0000', '52032.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3421, 7, 2, 'Repayment', '2143-12-02', '12', '2143', '164.0000', '51868.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3422, 7, 2, 'Repayment', '2144-01-02', '01', '2144', '164.0000', '51704.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3423, 7, 2, 'Repayment', '2144-02-02', '02', '2144', '164.0000', '51540.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3424, 7, 2, 'Repayment', '2144-03-02', '03', '2144', '164.0000', '51376.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3425, 7, 2, 'Repayment', '2144-04-02', '04', '2144', '164.0000', '51212.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3426, 7, 2, 'Repayment', '2144-05-02', '05', '2144', '164.0000', '51048.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3427, 7, 2, 'Repayment', '2144-06-02', '06', '2144', '164.0000', '50884.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3428, 7, 2, 'Repayment', '2144-07-02', '07', '2144', '164.0000', '50720.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3429, 7, 2, 'Repayment', '2144-08-02', '08', '2144', '164.0000', '50556.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3430, 7, 2, 'Repayment', '2144-09-02', '09', '2144', '164.0000', '50392.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3431, 7, 2, 'Repayment', '2144-10-02', '10', '2144', '164.0000', '50228.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3432, 7, 2, 'Repayment', '2144-11-02', '11', '2144', '164.0000', '50064.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3433, 7, 2, 'Repayment', '2144-12-02', '12', '2144', '164.0000', '49900.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3434, 7, 2, 'Repayment', '2145-01-02', '01', '2145', '164.0000', '49736.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3435, 7, 2, 'Repayment', '2145-02-02', '02', '2145', '164.0000', '49572.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3436, 7, 2, 'Repayment', '2145-03-02', '03', '2145', '164.0000', '49408.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3437, 7, 2, 'Repayment', '2145-04-02', '04', '2145', '164.0000', '49244.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3438, 7, 2, 'Repayment', '2145-05-02', '05', '2145', '164.0000', '49080.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3439, 7, 2, 'Repayment', '2145-06-02', '06', '2145', '164.0000', '48916.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3440, 7, 2, 'Repayment', '2145-07-02', '07', '2145', '164.0000', '48752.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3441, 7, 2, 'Repayment', '2145-08-02', '08', '2145', '164.0000', '48588.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3442, 7, 2, 'Repayment', '2145-09-02', '09', '2145', '164.0000', '48424.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3443, 7, 2, 'Repayment', '2145-10-02', '10', '2145', '164.0000', '48260.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3444, 7, 2, 'Repayment', '2145-11-02', '11', '2145', '164.0000', '48096.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3445, 7, 2, 'Repayment', '2145-12-02', '12', '2145', '164.0000', '47932.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3446, 7, 2, 'Repayment', '2146-01-02', '01', '2146', '164.0000', '47768.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3447, 7, 2, 'Repayment', '2146-02-02', '02', '2146', '164.0000', '47604.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3448, 7, 2, 'Repayment', '2146-03-02', '03', '2146', '164.0000', '47440.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3449, 7, 2, 'Repayment', '2146-04-02', '04', '2146', '164.0000', '47276.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3450, 7, 2, 'Repayment', '2146-05-02', '05', '2146', '164.0000', '47112.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3451, 7, 2, 'Repayment', '2146-06-02', '06', '2146', '164.0000', '46948.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3452, 7, 2, 'Repayment', '2146-07-02', '07', '2146', '164.0000', '46784.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3453, 7, 2, 'Repayment', '2146-08-02', '08', '2146', '164.0000', '46620.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3454, 7, 2, 'Repayment', '2146-09-02', '09', '2146', '164.0000', '46456.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3455, 7, 2, 'Repayment', '2146-10-02', '10', '2146', '164.0000', '46292.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3456, 7, 2, 'Repayment', '2146-11-02', '11', '2146', '164.0000', '46128.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3457, 7, 2, 'Repayment', '2146-12-02', '12', '2146', '164.0000', '45964.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3458, 7, 2, 'Repayment', '2147-01-02', '01', '2147', '164.0000', '45800.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3459, 7, 2, 'Repayment', '2147-02-02', '02', '2147', '164.0000', '45636.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3460, 7, 2, 'Repayment', '2147-03-02', '03', '2147', '164.0000', '45472.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3461, 7, 2, 'Repayment', '2147-04-02', '04', '2147', '164.0000', '45308.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3462, 7, 2, 'Repayment', '2147-05-02', '05', '2147', '164.0000', '45144.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3463, 7, 2, 'Repayment', '2147-06-02', '06', '2147', '164.0000', '44980.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3464, 7, 2, 'Repayment', '2147-07-02', '07', '2147', '164.0000', '44816.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3465, 7, 2, 'Repayment', '2147-08-02', '08', '2147', '164.0000', '44652.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3466, 7, 2, 'Repayment', '2147-09-02', '09', '2147', '164.0000', '44488.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3467, 7, 2, 'Repayment', '2147-10-02', '10', '2147', '164.0000', '44324.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3468, 7, 2, 'Repayment', '2147-11-02', '11', '2147', '164.0000', '44160.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3469, 7, 2, 'Repayment', '2147-12-02', '12', '2147', '164.0000', '43996.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3470, 7, 2, 'Repayment', '2148-01-02', '01', '2148', '164.0000', '43832.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3471, 7, 2, 'Repayment', '2148-02-02', '02', '2148', '164.0000', '43668.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3472, 7, 2, 'Repayment', '2148-03-02', '03', '2148', '164.0000', '43504.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3473, 7, 2, 'Repayment', '2148-04-02', '04', '2148', '164.0000', '43340.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3474, 7, 2, 'Repayment', '2148-05-02', '05', '2148', '164.0000', '43176.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3475, 7, 2, 'Repayment', '2148-06-02', '06', '2148', '164.0000', '43012.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3476, 7, 2, 'Repayment', '2148-07-02', '07', '2148', '164.0000', '42848.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3477, 7, 2, 'Repayment', '2148-08-02', '08', '2148', '164.0000', '42684.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3478, 7, 2, 'Repayment', '2148-09-02', '09', '2148', '164.0000', '42520.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3479, 7, 2, 'Repayment', '2148-10-02', '10', '2148', '164.0000', '42356.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3480, 7, 2, 'Repayment', '2148-11-02', '11', '2148', '164.0000', '42192.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3481, 7, 2, 'Repayment', '2148-12-02', '12', '2148', '164.0000', '42028.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3482, 7, 2, 'Repayment', '2149-01-02', '01', '2149', '164.0000', '41864.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:28', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3483, 7, 2, 'Repayment', '2149-02-02', '02', '2149', '164.0000', '41700.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3484, 7, 2, 'Repayment', '2149-03-02', '03', '2149', '164.0000', '41536.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3485, 7, 2, 'Repayment', '2149-04-02', '04', '2149', '164.0000', '41372.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3486, 7, 2, 'Repayment', '2149-05-02', '05', '2149', '164.0000', '41208.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3487, 7, 2, 'Repayment', '2149-06-02', '06', '2149', '164.0000', '41044.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3488, 7, 2, 'Repayment', '2149-07-02', '07', '2149', '164.0000', '40880.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3489, 7, 2, 'Repayment', '2149-08-02', '08', '2149', '164.0000', '40716.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3490, 7, 2, 'Repayment', '2149-09-02', '09', '2149', '164.0000', '40552.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3491, 7, 2, 'Repayment', '2149-10-02', '10', '2149', '164.0000', '40388.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3492, 7, 2, 'Repayment', '2149-11-02', '11', '2149', '164.0000', '40224.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3493, 7, 2, 'Repayment', '2149-12-02', '12', '2149', '164.0000', '40060.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3494, 7, 2, 'Repayment', '2150-01-02', '01', '2150', '164.0000', '39896.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3495, 7, 2, 'Repayment', '2150-02-02', '02', '2150', '164.0000', '39732.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3496, 7, 2, 'Repayment', '2150-03-02', '03', '2150', '164.0000', '39568.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3497, 7, 2, 'Repayment', '2150-04-02', '04', '2150', '164.0000', '39404.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3498, 7, 2, 'Repayment', '2150-05-02', '05', '2150', '164.0000', '39240.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3499, 7, 2, 'Repayment', '2150-06-02', '06', '2150', '164.0000', '39076.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3500, 7, 2, 'Repayment', '2150-07-02', '07', '2150', '164.0000', '38912.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3501, 7, 2, 'Repayment', '2150-08-02', '08', '2150', '164.0000', '38748.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3502, 7, 2, 'Repayment', '2150-09-02', '09', '2150', '164.0000', '38584.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3503, 7, 2, 'Repayment', '2150-10-02', '10', '2150', '164.0000', '38420.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3504, 7, 2, 'Repayment', '2150-11-02', '11', '2150', '164.0000', '38256.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3505, 7, 2, 'Repayment', '2150-12-02', '12', '2150', '164.0000', '38092.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3506, 7, 2, 'Repayment', '2151-01-02', '01', '2151', '164.0000', '37928.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3507, 7, 2, 'Repayment', '2151-02-02', '02', '2151', '164.0000', '37764.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3508, 7, 2, 'Repayment', '2151-03-02', '03', '2151', '164.0000', '37600.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3509, 7, 2, 'Repayment', '2151-04-02', '04', '2151', '164.0000', '37436.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3510, 7, 2, 'Repayment', '2151-05-02', '05', '2151', '164.0000', '37272.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3511, 7, 2, 'Repayment', '2151-06-02', '06', '2151', '164.0000', '37108.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3512, 7, 2, 'Repayment', '2151-07-02', '07', '2151', '164.0000', '36944.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3513, 7, 2, 'Repayment', '2151-08-02', '08', '2151', '164.0000', '36780.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3514, 7, 2, 'Repayment', '2151-09-02', '09', '2151', '164.0000', '36616.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3515, 7, 2, 'Repayment', '2151-10-02', '10', '2151', '164.0000', '36452.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3516, 7, 2, 'Repayment', '2151-11-02', '11', '2151', '164.0000', '36288.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3517, 7, 2, 'Repayment', '2151-12-02', '12', '2151', '164.0000', '36124.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3518, 7, 2, 'Repayment', '2152-01-02', '01', '2152', '164.0000', '35960.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3519, 7, 2, 'Repayment', '2152-02-02', '02', '2152', '164.0000', '35796.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3520, 7, 2, 'Repayment', '2152-03-02', '03', '2152', '164.0000', '35632.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3521, 7, 2, 'Repayment', '2152-04-02', '04', '2152', '164.0000', '35468.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3522, 7, 2, 'Repayment', '2152-05-02', '05', '2152', '164.0000', '35304.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3523, 7, 2, 'Repayment', '2152-06-02', '06', '2152', '164.0000', '35140.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3524, 7, 2, 'Repayment', '2152-07-02', '07', '2152', '164.0000', '34976.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3525, 7, 2, 'Repayment', '2152-08-02', '08', '2152', '164.0000', '34812.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3526, 7, 2, 'Repayment', '2152-09-02', '09', '2152', '164.0000', '34648.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3527, 7, 2, 'Repayment', '2152-10-02', '10', '2152', '164.0000', '34484.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3528, 7, 2, 'Repayment', '2152-11-02', '11', '2152', '164.0000', '34320.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3529, 7, 2, 'Repayment', '2152-12-02', '12', '2152', '164.0000', '34156.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3530, 7, 2, 'Repayment', '2153-01-02', '01', '2153', '164.0000', '33992.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3531, 7, 2, 'Repayment', '2153-02-02', '02', '2153', '164.0000', '33828.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3532, 7, 2, 'Repayment', '2153-03-02', '03', '2153', '164.0000', '33664.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3533, 7, 2, 'Repayment', '2153-04-02', '04', '2153', '164.0000', '33500.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3534, 7, 2, 'Repayment', '2153-05-02', '05', '2153', '164.0000', '33336.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3535, 7, 2, 'Repayment', '2153-06-02', '06', '2153', '164.0000', '33172.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3536, 7, 2, 'Repayment', '2153-07-02', '07', '2153', '164.0000', '33008.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3537, 7, 2, 'Repayment', '2153-08-02', '08', '2153', '164.0000', '32844.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3538, 7, 2, 'Repayment', '2153-09-02', '09', '2153', '164.0000', '32680.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3539, 7, 2, 'Repayment', '2153-10-02', '10', '2153', '164.0000', '32516.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3540, 7, 2, 'Repayment', '2153-11-02', '11', '2153', '164.0000', '32352.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3541, 7, 2, 'Repayment', '2153-12-02', '12', '2153', '164.0000', '32188.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3542, 7, 2, 'Repayment', '2154-01-02', '01', '2154', '164.0000', '32024.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3543, 7, 2, 'Repayment', '2154-02-02', '02', '2154', '164.0000', '31860.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3544, 7, 2, 'Repayment', '2154-03-02', '03', '2154', '164.0000', '31696.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3545, 7, 2, 'Repayment', '2154-04-02', '04', '2154', '164.0000', '31532.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3546, 7, 2, 'Repayment', '2154-05-02', '05', '2154', '164.0000', '31368.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3547, 7, 2, 'Repayment', '2154-06-02', '06', '2154', '164.0000', '31204.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3548, 7, 2, 'Repayment', '2154-07-02', '07', '2154', '164.0000', '31040.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3549, 7, 2, 'Repayment', '2154-08-02', '08', '2154', '164.0000', '30876.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3550, 7, 2, 'Repayment', '2154-09-02', '09', '2154', '164.0000', '30712.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3551, 7, 2, 'Repayment', '2154-10-02', '10', '2154', '164.0000', '30548.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3552, 7, 2, 'Repayment', '2154-11-02', '11', '2154', '164.0000', '30384.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3553, 7, 2, 'Repayment', '2154-12-02', '12', '2154', '164.0000', '30220.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3554, 7, 2, 'Repayment', '2155-01-02', '01', '2155', '164.0000', '30056.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3555, 7, 2, 'Repayment', '2155-02-02', '02', '2155', '164.0000', '29892.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3556, 7, 2, 'Repayment', '2155-03-02', '03', '2155', '164.0000', '29728.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3557, 7, 2, 'Repayment', '2155-04-02', '04', '2155', '164.0000', '29564.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3558, 7, 2, 'Repayment', '2155-05-02', '05', '2155', '164.0000', '29400.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3559, 7, 2, 'Repayment', '2155-06-02', '06', '2155', '164.0000', '29236.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3560, 7, 2, 'Repayment', '2155-07-02', '07', '2155', '164.0000', '29072.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3561, 7, 2, 'Repayment', '2155-08-02', '08', '2155', '164.0000', '28908.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3562, 7, 2, 'Repayment', '2155-09-02', '09', '2155', '164.0000', '28744.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3563, 7, 2, 'Repayment', '2155-10-02', '10', '2155', '164.0000', '28580.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3564, 7, 2, 'Repayment', '2155-11-02', '11', '2155', '164.0000', '28416.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3565, 7, 2, 'Repayment', '2155-12-02', '12', '2155', '164.0000', '28252.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3566, 7, 2, 'Repayment', '2156-01-02', '01', '2156', '164.0000', '28088.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3567, 7, 2, 'Repayment', '2156-02-02', '02', '2156', '164.0000', '27924.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3568, 7, 2, 'Repayment', '2156-03-02', '03', '2156', '164.0000', '27760.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3569, 7, 2, 'Repayment', '2156-04-02', '04', '2156', '164.0000', '27596.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3570, 7, 2, 'Repayment', '2156-05-02', '05', '2156', '164.0000', '27432.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3571, 7, 2, 'Repayment', '2156-06-02', '06', '2156', '164.0000', '27268.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3572, 7, 2, 'Repayment', '2156-07-02', '07', '2156', '164.0000', '27104.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3573, 7, 2, 'Repayment', '2156-08-02', '08', '2156', '164.0000', '26940.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3574, 7, 2, 'Repayment', '2156-09-02', '09', '2156', '164.0000', '26776.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3575, 7, 2, 'Repayment', '2156-10-02', '10', '2156', '164.0000', '26612.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3576, 7, 2, 'Repayment', '2156-11-02', '11', '2156', '164.0000', '26448.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3577, 7, 2, 'Repayment', '2156-12-02', '12', '2156', '164.0000', '26284.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3578, 7, 2, 'Repayment', '2157-01-02', '01', '2157', '164.0000', '26120.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3579, 7, 2, 'Repayment', '2157-02-02', '02', '2157', '164.0000', '25956.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3580, 7, 2, 'Repayment', '2157-03-02', '03', '2157', '164.0000', '25792.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3581, 7, 2, 'Repayment', '2157-04-02', '04', '2157', '164.0000', '25628.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3582, 7, 2, 'Repayment', '2157-05-02', '05', '2157', '164.0000', '25464.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3583, 7, 2, 'Repayment', '2157-06-02', '06', '2157', '164.0000', '25300.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3584, 7, 2, 'Repayment', '2157-07-02', '07', '2157', '164.0000', '25136.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3585, 7, 2, 'Repayment', '2157-08-02', '08', '2157', '164.0000', '24972.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3586, 7, 2, 'Repayment', '2157-09-02', '09', '2157', '164.0000', '24808.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3587, 7, 2, 'Repayment', '2157-10-02', '10', '2157', '164.0000', '24644.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3588, 7, 2, 'Repayment', '2157-11-02', '11', '2157', '164.0000', '24480.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3589, 7, 2, 'Repayment', '2157-12-02', '12', '2157', '164.0000', '24316.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3590, 7, 2, 'Repayment', '2158-01-02', '01', '2158', '164.0000', '24152.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3591, 7, 2, 'Repayment', '2158-02-02', '02', '2158', '164.0000', '23988.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3592, 7, 2, 'Repayment', '2158-03-02', '03', '2158', '164.0000', '23824.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3593, 7, 2, 'Repayment', '2158-04-02', '04', '2158', '164.0000', '23660.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3594, 7, 2, 'Repayment', '2158-05-02', '05', '2158', '164.0000', '23496.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3595, 7, 2, 'Repayment', '2158-06-02', '06', '2158', '164.0000', '23332.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3596, 7, 2, 'Repayment', '2158-07-02', '07', '2158', '164.0000', '23168.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3597, 7, 2, 'Repayment', '2158-08-02', '08', '2158', '164.0000', '23004.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3598, 7, 2, 'Repayment', '2158-09-02', '09', '2158', '164.0000', '22840.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3599, 7, 2, 'Repayment', '2158-10-02', '10', '2158', '164.0000', '22676.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3600, 7, 2, 'Repayment', '2158-11-02', '11', '2158', '164.0000', '22512.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1);
INSERT INTO `loan_schedules` (`id`, `loan_id`, `borrower_id`, `description`, `due_date`, `month`, `year`, `principal`, `principal_balance`, `interest`, `fees`, `penalty`, `due`, `system_generated`, `closed`, `missed`, `missed_penalty_applied`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(3601, 7, 2, 'Repayment', '2158-12-02', '12', '2158', '164.0000', '22348.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3602, 7, 2, 'Repayment', '2159-01-02', '01', '2159', '164.0000', '22184.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3603, 7, 2, 'Repayment', '2159-02-02', '02', '2159', '164.0000', '22020.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3604, 7, 2, 'Repayment', '2159-03-02', '03', '2159', '164.0000', '21856.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3605, 7, 2, 'Repayment', '2159-04-02', '04', '2159', '164.0000', '21692.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3606, 7, 2, 'Repayment', '2159-05-02', '05', '2159', '164.0000', '21528.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3607, 7, 2, 'Repayment', '2159-06-02', '06', '2159', '164.0000', '21364.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3608, 7, 2, 'Repayment', '2159-07-02', '07', '2159', '164.0000', '21200.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3609, 7, 2, 'Repayment', '2159-08-02', '08', '2159', '164.0000', '21036.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3610, 7, 2, 'Repayment', '2159-09-02', '09', '2159', '164.0000', '20872.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3611, 7, 2, 'Repayment', '2159-10-02', '10', '2159', '164.0000', '20708.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3612, 7, 2, 'Repayment', '2159-11-02', '11', '2159', '164.0000', '20544.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3613, 7, 2, 'Repayment', '2159-12-02', '12', '2159', '164.0000', '20380.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3614, 7, 2, 'Repayment', '2160-01-02', '01', '2160', '164.0000', '20216.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3615, 7, 2, 'Repayment', '2160-02-02', '02', '2160', '164.0000', '20052.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3616, 7, 2, 'Repayment', '2160-03-02', '03', '2160', '164.0000', '19888.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3617, 7, 2, 'Repayment', '2160-04-02', '04', '2160', '164.0000', '19724.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3618, 7, 2, 'Repayment', '2160-05-02', '05', '2160', '164.0000', '19560.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3619, 7, 2, 'Repayment', '2160-06-02', '06', '2160', '164.0000', '19396.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3620, 7, 2, 'Repayment', '2160-07-02', '07', '2160', '164.0000', '19232.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3621, 7, 2, 'Repayment', '2160-08-02', '08', '2160', '164.0000', '19068.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3622, 7, 2, 'Repayment', '2160-09-02', '09', '2160', '164.0000', '18904.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3623, 7, 2, 'Repayment', '2160-10-02', '10', '2160', '164.0000', '18740.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3624, 7, 2, 'Repayment', '2160-11-02', '11', '2160', '164.0000', '18576.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3625, 7, 2, 'Repayment', '2160-12-02', '12', '2160', '164.0000', '18412.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3626, 7, 2, 'Repayment', '2161-01-02', '01', '2161', '164.0000', '18248.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3627, 7, 2, 'Repayment', '2161-02-02', '02', '2161', '164.0000', '18084.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3628, 7, 2, 'Repayment', '2161-03-02', '03', '2161', '164.0000', '17920.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3629, 7, 2, 'Repayment', '2161-04-02', '04', '2161', '164.0000', '17756.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3630, 7, 2, 'Repayment', '2161-05-02', '05', '2161', '164.0000', '17592.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3631, 7, 2, 'Repayment', '2161-06-02', '06', '2161', '164.0000', '17428.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3632, 7, 2, 'Repayment', '2161-07-02', '07', '2161', '164.0000', '17264.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3633, 7, 2, 'Repayment', '2161-08-02', '08', '2161', '164.0000', '17100.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3634, 7, 2, 'Repayment', '2161-09-02', '09', '2161', '164.0000', '16936.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3635, 7, 2, 'Repayment', '2161-10-02', '10', '2161', '164.0000', '16772.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3636, 7, 2, 'Repayment', '2161-11-02', '11', '2161', '164.0000', '16608.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3637, 7, 2, 'Repayment', '2161-12-02', '12', '2161', '164.0000', '16444.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3638, 7, 2, 'Repayment', '2162-01-02', '01', '2162', '164.0000', '16280.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3639, 7, 2, 'Repayment', '2162-02-02', '02', '2162', '164.0000', '16116.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3640, 7, 2, 'Repayment', '2162-03-02', '03', '2162', '164.0000', '15952.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3641, 7, 2, 'Repayment', '2162-04-02', '04', '2162', '164.0000', '15788.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3642, 7, 2, 'Repayment', '2162-05-02', '05', '2162', '164.0000', '15624.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3643, 7, 2, 'Repayment', '2162-06-02', '06', '2162', '164.0000', '15460.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3644, 7, 2, 'Repayment', '2162-07-02', '07', '2162', '164.0000', '15296.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3645, 7, 2, 'Repayment', '2162-08-02', '08', '2162', '164.0000', '15132.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3646, 7, 2, 'Repayment', '2162-09-02', '09', '2162', '164.0000', '14968.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3647, 7, 2, 'Repayment', '2162-10-02', '10', '2162', '164.0000', '14804.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3648, 7, 2, 'Repayment', '2162-11-02', '11', '2162', '164.0000', '14640.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3649, 7, 2, 'Repayment', '2162-12-02', '12', '2162', '164.0000', '14476.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3650, 7, 2, 'Repayment', '2163-01-02', '01', '2163', '164.0000', '14312.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3651, 7, 2, 'Repayment', '2163-02-02', '02', '2163', '164.0000', '14148.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3652, 7, 2, 'Repayment', '2163-03-02', '03', '2163', '164.0000', '13984.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3653, 7, 2, 'Repayment', '2163-04-02', '04', '2163', '164.0000', '13820.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3654, 7, 2, 'Repayment', '2163-05-02', '05', '2163', '164.0000', '13656.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3655, 7, 2, 'Repayment', '2163-06-02', '06', '2163', '164.0000', '13492.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3656, 7, 2, 'Repayment', '2163-07-02', '07', '2163', '164.0000', '13328.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3657, 7, 2, 'Repayment', '2163-08-02', '08', '2163', '164.0000', '13164.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3658, 7, 2, 'Repayment', '2163-09-02', '09', '2163', '164.0000', '13000.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3659, 7, 2, 'Repayment', '2163-10-02', '10', '2163', '164.0000', '12836.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3660, 7, 2, 'Repayment', '2163-11-02', '11', '2163', '164.0000', '12672.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3661, 7, 2, 'Repayment', '2163-12-02', '12', '2163', '164.0000', '12508.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3662, 7, 2, 'Repayment', '2164-01-02', '01', '2164', '164.0000', '12344.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3663, 7, 2, 'Repayment', '2164-02-02', '02', '2164', '164.0000', '12180.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3664, 7, 2, 'Repayment', '2164-03-02', '03', '2164', '164.0000', '12016.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3665, 7, 2, 'Repayment', '2164-04-02', '04', '2164', '164.0000', '11852.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3666, 7, 2, 'Repayment', '2164-05-02', '05', '2164', '164.0000', '11688.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3667, 7, 2, 'Repayment', '2164-06-02', '06', '2164', '164.0000', '11524.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3668, 7, 2, 'Repayment', '2164-07-02', '07', '2164', '164.0000', '11360.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3669, 7, 2, 'Repayment', '2164-08-02', '08', '2164', '164.0000', '11196.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3670, 7, 2, 'Repayment', '2164-09-02', '09', '2164', '164.0000', '11032.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3671, 7, 2, 'Repayment', '2164-10-02', '10', '2164', '164.0000', '10868.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3672, 7, 2, 'Repayment', '2164-11-02', '11', '2164', '164.0000', '10704.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3673, 7, 2, 'Repayment', '2164-12-02', '12', '2164', '164.0000', '10540.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3674, 7, 2, 'Repayment', '2165-01-02', '01', '2165', '164.0000', '10376.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3675, 7, 2, 'Repayment', '2165-02-02', '02', '2165', '164.0000', '10212.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3676, 7, 2, 'Repayment', '2165-03-02', '03', '2165', '164.0000', '10048.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3677, 7, 2, 'Repayment', '2165-04-02', '04', '2165', '164.0000', '9884.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3678, 7, 2, 'Repayment', '2165-05-02', '05', '2165', '164.0000', '9720.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3679, 7, 2, 'Repayment', '2165-06-02', '06', '2165', '164.0000', '9556.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3680, 7, 2, 'Repayment', '2165-07-02', '07', '2165', '164.0000', '9392.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3681, 7, 2, 'Repayment', '2165-08-02', '08', '2165', '164.0000', '9228.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3682, 7, 2, 'Repayment', '2165-09-02', '09', '2165', '164.0000', '9064.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3683, 7, 2, 'Repayment', '2165-10-02', '10', '2165', '164.0000', '8900.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3684, 7, 2, 'Repayment', '2165-11-02', '11', '2165', '164.0000', '8736.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3685, 7, 2, 'Repayment', '2165-12-02', '12', '2165', '164.0000', '8572.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3686, 7, 2, 'Repayment', '2166-01-02', '01', '2166', '164.0000', '8408.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3687, 7, 2, 'Repayment', '2166-02-02', '02', '2166', '164.0000', '8244.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3688, 7, 2, 'Repayment', '2166-03-02', '03', '2166', '164.0000', '8080.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3689, 7, 2, 'Repayment', '2166-04-02', '04', '2166', '164.0000', '7916.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3690, 7, 2, 'Repayment', '2166-05-02', '05', '2166', '164.0000', '7752.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3691, 7, 2, 'Repayment', '2166-06-02', '06', '2166', '164.0000', '7588.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3692, 7, 2, 'Repayment', '2166-07-02', '07', '2166', '164.0000', '7424.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3693, 7, 2, 'Repayment', '2166-08-02', '08', '2166', '164.0000', '7260.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3694, 7, 2, 'Repayment', '2166-09-02', '09', '2166', '164.0000', '7096.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3695, 7, 2, 'Repayment', '2166-10-02', '10', '2166', '164.0000', '6932.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3696, 7, 2, 'Repayment', '2166-11-02', '11', '2166', '164.0000', '6768.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3697, 7, 2, 'Repayment', '2166-12-02', '12', '2166', '164.0000', '6604.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3698, 7, 2, 'Repayment', '2167-01-02', '01', '2167', '164.0000', '6440.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3699, 7, 2, 'Repayment', '2167-02-02', '02', '2167', '164.0000', '6276.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3700, 7, 2, 'Repayment', '2167-03-02', '03', '2167', '164.0000', '6112.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3701, 7, 2, 'Repayment', '2167-04-02', '04', '2167', '164.0000', '5948.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3702, 7, 2, 'Repayment', '2167-05-02', '05', '2167', '164.0000', '5784.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3703, 7, 2, 'Repayment', '2167-06-02', '06', '2167', '164.0000', '5620.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3704, 7, 2, 'Repayment', '2167-07-02', '07', '2167', '164.0000', '5456.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3705, 7, 2, 'Repayment', '2167-08-02', '08', '2167', '164.0000', '5292.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3706, 7, 2, 'Repayment', '2167-09-02', '09', '2167', '164.0000', '5128.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3707, 7, 2, 'Repayment', '2167-10-02', '10', '2167', '164.0000', '4964.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3708, 7, 2, 'Repayment', '2167-11-02', '11', '2167', '164.0000', '4800.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3709, 7, 2, 'Repayment', '2167-12-02', '12', '2167', '164.0000', '4636.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3710, 7, 2, 'Repayment', '2168-01-02', '01', '2168', '164.0000', '4472.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3711, 7, 2, 'Repayment', '2168-02-02', '02', '2168', '164.0000', '4308.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3712, 7, 2, 'Repayment', '2168-03-02', '03', '2168', '164.0000', '4144.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3713, 7, 2, 'Repayment', '2168-04-02', '04', '2168', '164.0000', '3980.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3714, 7, 2, 'Repayment', '2168-05-02', '05', '2168', '164.0000', '3816.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3715, 7, 2, 'Repayment', '2168-06-02', '06', '2168', '164.0000', '3652.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3716, 7, 2, 'Repayment', '2168-07-02', '07', '2168', '164.0000', '3488.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3717, 7, 2, 'Repayment', '2168-08-02', '08', '2168', '164.0000', '3324.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3718, 7, 2, 'Repayment', '2168-09-02', '09', '2168', '164.0000', '3160.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3719, 7, 2, 'Repayment', '2168-10-02', '10', '2168', '164.0000', '2996.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3720, 7, 2, 'Repayment', '2168-11-02', '11', '2168', '164.0000', '2832.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3721, 7, 2, 'Repayment', '2168-12-02', '12', '2168', '164.0000', '2668.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3722, 7, 2, 'Repayment', '2169-01-02', '01', '2169', '164.0000', '2504.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3723, 7, 2, 'Repayment', '2169-02-02', '02', '2169', '164.0000', '2340.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3724, 7, 2, 'Repayment', '2169-03-02', '03', '2169', '164.0000', '2176.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3725, 7, 2, 'Repayment', '2169-04-02', '04', '2169', '164.0000', '2012.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3726, 7, 2, 'Repayment', '2169-05-02', '05', '2169', '164.0000', '1848.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:29', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3727, 7, 2, 'Repayment', '2169-06-02', '06', '2169', '164.0000', '1684.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:30', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3728, 7, 2, 'Repayment', '2169-07-02', '07', '2169', '164.0000', '1520.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:30', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3729, 7, 2, 'Repayment', '2169-08-02', '08', '2169', '164.0000', '1356.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:30', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3730, 7, 2, 'Repayment', '2169-09-02', '09', '2169', '164.0000', '1192.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:30', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3731, 7, 2, 'Repayment', '2169-10-02', '10', '2169', '164.0000', '1028.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:30', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1),
(3732, 7, 2, 'Repayment', '2169-11-02', '11', '2169', '164.0000', '864.0000', '30000.0000', '0.0000', NULL, '30164.0000', 0, 0, 0, 0, '2017-11-07 20:19:30', '2017-11-07 20:21:51', '2017-11-07 20:21:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `loan_status`
--

CREATE TABLE `loan_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  `attach_file` text COLLATE utf8_unicode_ci,
  `to_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `read` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_07_02_230147_migration_cartalyst_sentinel', 1),
('2016_07_23_173157_create_messages_table', 1),
('2016_07_23_173226_create_sms_table', 1),
('2016_07_23_173242_create_settings_table', 1),
('2016_11_05_062734_create_permissions_table', 1),
('2017_02_23_000640_create_borrowers_table', 1),
('2017_02_23_002300_create_custom_fields_table', 1),
('2017_02_23_003720_create_custom_fields_meta_table', 1),
('2017_03_05_131103_create_loans_table', 1),
('2017_03_05_132848_create_loans_products_table', 1),
('2017_03_05_145851_create_loan_disbursed_by_table', 1),
('2017_03_05_150107_create_loan_repayment_methods_table', 1),
('2017_03_05_151538_create_loan_status_table', 1),
('2017_03_08_182936_create_loan_schedules_table', 1),
('2017_03_19_080840_create_loan_repayments_table', 1),
('2017_04_02_142753_create_loan_comments_table', 1),
('2017_04_11_091435_create_payroll_templates_table', 1),
('2017_04_11_094729_create_payroll_template_meta_table', 1),
('2017_04_12_004631_create_payroll_table', 1),
('2017_04_12_004829_create_payroll_meta_table', 1),
('2017_04_14_083438_create_expenses_table', 1),
('2017_04_14_083535_create_expense_types_table', 1),
('2017_04_16_084016_create_other_income_table', 1),
('2017_04_16_084118_create_other_income_types_table', 1),
('2017_04_16_094025_create_collateral_types_table', 1),
('2017_04_16_094131_create_collateral_table', 1),
('2017_04_18_083800_create_emails_table', 1),
('2017_04_23_072100_create_loan_fees_table', 1),
('2017_04_23_073118_create_loan_fees_meta_table', 1),
('2017_05_04_103559_create_countries_table', 1),
('2017_07_17_123811_add_login_fields_to_borrowers_table', 1),
('2017_07_17_124138_add_month_year_to_borrowers_table', 1),
('2017_07_17_124357_add_fields_to_borrowers_table', 1),
('2017_07_17_130228_add_v1_1_settings_table', 1),
('2017_07_23_061641_create_loan_applications_table', 1),
('2017_07_23_064420_create_audit_trail_table', 1),
('2017_07_23_120222_add_payment_to_v1_1_settings_table', 1),
('2017_07_24_063824_create_savings_product_table', 1),
('2017_07_24_070639_create_savings_table', 1),
('2017_07_24_071756_create_savings_transactions_table', 1),
('2017_07_24_073802_create_savings_fees_table', 1),
('2017_07_27_071556_create_asset_types_table', 1),
('2017_07_27_071814_create_assets_table', 1),
('2017_07_27_074421_create_asset_valuations_table', 1),
('2017_07_27_174045_create_capital_table', 1),
('2017_08_01_064016_add_status_to_loans_table', 1),
('2017_08_01_081424_create_guarantor_table', 1),
('2017_08_07_083717_update_from_v1_0_to_1_1', 1),
('2017_08_23_205719_add_blacklist_to_borrowers_table', 2),
('2017_09_02_092303_create_borrower_groups', 3),
('2017_09_02_092551_create_branches', 3),
('2017_09_02_094025_add_branches_to_all_tables', 3),
('2017_09_02_154128_create_borrower_group_members_table', 3),
('2017_09_02_171328_update_from_v1_1_to_1_2', 4),
('2017_09_05_075257_add_v12_settings', 5),
('2017_09_05_082513_add_v12_permissions', 5),
('2017_09_20_093729_add_client_background_settings', 6),
('2017_09_20_094221_change_update_url', 6),
('2017_09_23_133042_create_provision_rates_table', 7),
('2017_09_23_133535_insert_data_to_provision_rates_table', 8),
('2017_09_24_091220_create_bank_accounts_table', 9),
('2017_09_24_091340_add_bank_accounts_to_capital_table', 9),
('2017_10_13_113742_create_branch_users_table', 10),
('2017_10_13_121839_add_application_fee_to_loans_table', 10),
('2017_10_13_161720_add_default_branch', 10),
('2017_10_13_161930_create_default_branch_and_assign_user', 11),
('2017_10_13_173431_add_branch_to_schedules', 12),
('2017_10_13_184930_set_default_branch_for_current_loans', 13),
('2017_10_14_062601_add_v_1_3_permissions', 14),
('2017_10_14_063504_update_v_1_3_update_url', 14),
('2017_10_14_074553_update_to_v_1_3', 14);

-- --------------------------------------------------------

--
-- Table structure for table `other_income`
--

CREATE TABLE `other_income` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `other_income_type_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `files` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `other_income`
--

INSERT INTO `other_income` (`id`, `user_id`, `other_income_type_id`, `amount`, `date`, `year`, `month`, `notes`, `files`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, NULL, 1, '60000000.00', '2017-10-01', '2017', '10', '', 'a:0:{}', '2017-10-25 23:38:04', '2017-10-25 23:38:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `other_income_types`
--

CREATE TABLE `other_income_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `other_income_types`
--

INSERT INTO `other_income_types` (`id`, `name`) VALUES
(1, 'Security gain'),
(2, 'Business advice'),
(3, 'OBS Income');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(10) UNSIGNED NOT NULL,
  `payroll_template_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `employee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurring` tinyint(4) NOT NULL DEFAULT '0',
  `recur_frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '31',
  `recur_start_date` date DEFAULT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_next_date` date DEFAULT NULL,
  `recur_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'month',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_meta`
--

CREATE TABLE `payroll_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `payroll_id` int(10) UNSIGNED NOT NULL,
  `payroll_template_meta_id` int(10) UNSIGNED DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` enum('top_left','top_right','bottom_left','bottom_right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bottom_left'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_templates`
--

CREATE TABLE `payroll_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payroll_templates`
--

INSERT INTO `payroll_templates` (`id`, `name`, `notes`, `picture`) VALUES
(1, 'Default', 'Default Payroll Template', 'default_payroll_template');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_template_meta`
--

CREATE TABLE `payroll_template_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `payroll_template_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` enum('top_left','top_right','bottom_left','bottom_right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bottom_left',
  `is_default` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payroll_template_meta`
--

INSERT INTO `payroll_template_meta` (`id`, `payroll_template_id`, `name`, `position`, `is_default`) VALUES
(1, 1, '41(k)', 'top_left', 0),
(2, 1, 'SS Cotributions', 'bottom_right', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `parent_id`, `name`, `slug`, `description`) VALUES
(1, 0, 'Borrowers', 'borrowers', 'Access Borrowers Module'),
(2, 1, 'View borrowers', 'borrowers.view', 'View borrowers'),
(3, 1, 'Update borrowers', 'borrowers.update', 'Update Borrowers'),
(4, 1, 'Delete borrowers', 'borrowers.delete', 'Delete borrowers'),
(5, 1, 'Create borrowers', 'borrowers.create', 'Add new borrower'),
(6, 0, 'Loans', 'loans', 'Access Loans Module'),
(7, 6, 'Create Loans', 'loans.create', 'Create Loans'),
(9, 6, 'Update Loans', 'loans.update', 'Update Loans'),
(10, 6, 'Delete Loans', 'loans.delete', 'Delete Loans'),
(11, 6, 'View Loans', 'loans.view', 'View Loans'),
(12, 6, 'Loan Products', 'loans.products', 'Manage Loan Products'),
(13, 6, 'Loan Fees', 'loans.fees', 'Manage Loan Fees'),
(14, 6, 'Loan Schedule', 'loans.schedule', 'Manage loan schedule, including sending loan schedule emails'),
(15, 0, 'Repayments', 'repayments', 'View Repayments Module'),
(16, 15, 'View Repayments', 'repayments.view', 'View All repayments'),
(17, 15, 'Create Repayments', 'repayments.create', 'Add Repayments'),
(18, 15, 'Delete Repayments', 'repayments.delete', 'Delete Repayments'),
(19, 15, 'Update Repayments', 'repayments.update', 'Update Repayments'),
(20, 0, 'Payroll', 'payroll', 'Access Payroll Module'),
(21, 20, 'View Payroll', 'payroll.view', 'View Payroll'),
(22, 20, 'Update Payroll', 'payroll.update', 'Update Payroll'),
(23, 20, 'Delete Payroll', 'payroll.delete', 'Delete Payroll'),
(24, 20, 'Create Payroll', 'payroll.create', 'Create Payroll'),
(25, 0, 'Expenses', 'expenses', 'Access Expenses Module'),
(26, 25, 'View Expenses', 'expenses.view', 'View Expenses'),
(27, 25, 'Create Expenses', 'expenses.create', 'Create Expenses'),
(28, 25, 'Update Expenses', 'expenses.update', 'Update Expenses'),
(29, 25, 'Delete Expenses', 'expenses.delete', 'Delete Expenses'),
(30, 0, 'Other Income', 'other_income', 'Access Other Income Module'),
(31, 30, 'View Other Income', 'other_income.view', 'View Other income'),
(32, 30, 'Create Other Income', 'other_income.create', 'Create other income'),
(33, 30, 'Update Other Income', 'other_income.update', 'Update Other Incom'),
(34, 30, 'Delete Other Income', 'other_income.delete', 'Delete other income'),
(35, 0, 'Collateral', 'collateral', 'Access Collateral Module'),
(36, 35, 'View collateral', 'collateral.view', 'View Collateral'),
(37, 35, 'Update Collateral', 'collateral.update', 'Update Collateral'),
(38, 35, 'Create Collateral', 'collateral.create', 'Create Collateral'),
(39, 35, 'Delete Collateral', 'collateral.delete', 'Delete Collateral'),
(40, 0, 'Reports', 'reports', 'Access Reports Module'),
(41, 0, 'Communication', 'communication', 'Access Communication Module'),
(42, 41, 'Create Communication', 'communication.create', 'Send Emails & SMS'),
(43, 41, 'Delete Communication', 'communication.delete', 'Delete Communication'),
(44, 0, 'Custom Fields', 'custom_fields', 'Access Custom Fields Module'),
(45, 44, 'View Custom Fields', 'custom_fields.view', 'View Custom fields'),
(46, 44, 'Create Custom Fields', 'custom_fields.create', 'Create Custom Fields'),
(47, 44, 'Custom Fields', 'custom_fields.update', 'Update Custom Fields'),
(48, 44, 'Delete Custom Fields', 'custom_fields.delete', 'Delete Custom Fields'),
(49, 0, 'Users', 'users', 'Access Users Module'),
(50, 49, 'View Users', 'users.view', 'View Users '),
(51, 49, 'Create Users', 'users.create', 'Create users'),
(52, 49, 'Update Users', 'users.update', 'Update Users'),
(53, 49, 'Delete Users', 'users.delete', 'Delete Users'),
(54, 49, 'Manage Roles', 'users.roles', 'Manage user roles'),
(55, 0, 'Settings', 'settings', 'Manage Settings'),
(56, 0, 'Audit Trail', 'audit_trail', 'Access Audit Trail'),
(57, 0, 'Savings', 'savings', 'Access Savings Menu'),
(58, 57, 'Create Savings', 'savings.create', ''),
(59, 57, 'Update Savings', 'savings.update', ''),
(60, 57, 'Delete Savings', 'savings.delete', ''),
(61, 57, 'Create Savings Transaction', 'savings.transactions.create', ''),
(62, 57, 'Update Savings Transaction', 'savings.transactions.update', ''),
(63, 57, 'Delete Savings Transaction', 'savings.transactions.delete', ''),
(64, 57, 'View Savings', 'savings.view', ''),
(65, 57, 'View Savings Transaction', 'savings.transactions.view', ''),
(66, 57, 'Manage Savings Products', 'savings.products', 'Manage Savings Products'),
(67, 57, 'Manage Savings Fees', 'savings.fees', ''),
(68, 6, 'Approve Loans', 'loans.approve', 'Approve Loans'),
(69, 6, 'Disburse Loans', 'loans.disburse', 'Disburse Loans'),
(70, 1, 'Approve Borrowers', 'borrowers.approve', 'Approve Borrowers'),
(71, 6, 'Withdraw Loans', 'loans.withdraw', 'Withdraw Loans'),
(72, 6, 'Write Off Loans', 'loans.writeoff', 'Write off Loans'),
(73, 6, 'Reschedule Loans', 'loans.reschedule', 'Reschedule Loans'),
(74, 0, 'Dashboard', 'dashboard', 'Access Dashboard'),
(75, 74, 'Loans Released Monthly Graph', 'dashboard.loans_released_monthly_graph', 'Access Loans Released Monthly Graph'),
(76, 74, 'Loans Collected Monthly Graph', 'dashboard.loans_collected_monthly_graph', 'Access Loans Collected Monthly Graph'),
(77, 74, 'Registered Borrowers', 'dashboard.registered_borrowers', 'Access Registered Borrowers Statistics'),
(78, 74, 'Total Loans Released', 'dashboard.total_loans_released', 'Access Total Loans Released'),
(79, 74, 'Total Collections', 'dashboard.total_collections', 'Access Total Collections Statistics'),
(80, 74, 'Total Disbursed Loans', 'dashboard.loans_disbursed', 'Access Total Disbursed Loans Statistics'),
(81, 74, 'Total Loans Pending', 'dashboard.loans_pending', ''),
(82, 74, 'Loans Approved', 'dashboard.loans_approved', ''),
(83, 74, 'Loans Declined', 'dashboard.loans_declined', ''),
(84, 74, 'Loans Closed', 'dashboard.loans_closed', ''),
(85, 74, 'Loans Withdrawn', 'dashboard.loans_withdrawn', ''),
(86, 74, 'Loans Written Off', 'dashboard.loans_written_off', ''),
(87, 74, 'Loans Rescheduled', 'dashboard.loans_rescheduled', ''),
(88, 6, 'Create Guarantor', 'loans.guarantor.create', ''),
(89, 6, 'Update Guarantor', 'loans.guarantor.update', ''),
(90, 6, 'Delete Guarantor', 'loans.guarantor.delete', ''),
(91, 6, 'Guarantor Savings', 'loans.guarantor.savings', ''),
(92, 0, 'Capital', 'capital', 'Access Capital'),
(93, 92, 'View  Capital', 'capital.view', ''),
(94, 92, 'Create Capital', 'capital.create', ''),
(95, 92, 'Update Capital', 'capital.update', ''),
(96, 92, 'Delete Capital', 'capital.delete', ''),
(97, 0, 'Assets', 'assets', 'Access Assets Menu'),
(98, 97, 'Create Assets', 'assets.create', ''),
(99, 97, 'View Assets', 'assets.view', ''),
(100, 97, 'Update Assets', 'assets.update', ''),
(101, 97, 'Delete Assets', 'assets.delete', ''),
(102, 1, 'Blacklist Borrower', 'borrowers.blacklist', 'Blacklist borrower'),
(103, 1, 'Manage Borrower Groups', 'borrowers.groups', ''),
(104, 6, 'Use Loan Calculator', 'loans.loan_calculator', ''),
(105, 0, 'Branches', 'branches', 'Access Branches menu'),
(106, 105, 'View Branches', 'branches.view', ''),
(107, 105, 'Create Branches', 'branches.create', ''),
(108, 105, 'Update Branches', 'branches.update', ''),
(109, 105, 'Delete Branches', 'branches.delete', ''),
(110, 105, 'Assign Users', 'branches.assign', '');

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(23, 1, 'EX3RAMJjNTqHtZbVaXrTnLusSTE99DfO', '2017-11-01 20:38:56', '2017-11-01 20:38:56'),
(24, 1, 'r0gBDcPD2xlmF7N4NJ4toI2Fk5LDv8rV', '2017-11-02 11:02:25', '2017-11-02 11:02:25'),
(25, 1, 'cVQb0xMw8wz0xalKaKk2yvThxYl3bc9U', '2017-11-02 15:16:49', '2017-11-02 15:16:49'),
(26, 1, 'u6tvxjomIizTrTBbxs91QHw1IwJTNB8F', '2017-11-02 17:46:48', '2017-11-02 17:46:48'),
(27, 1, 'dPX13P1W0kLiFu78GqLyQ4itC81qDOaY', '2017-11-02 19:17:01', '2017-11-02 19:17:01'),
(28, 1, 'tX8SyRdjBLS3FdP9ka0N8cCW3uqrC2hA', '2017-11-03 17:12:56', '2017-11-03 17:12:56'),
(29, 1, 'HOWHYKUPVkZ1IEaKRr5xjCp2B4IwJZGh', '2017-11-03 17:51:48', '2017-11-03 17:51:48'),
(30, 1, 'nNv2nQuz4Wqy6gP3XX04iLVuwnGCQSAp', '2017-11-04 21:11:53', '2017-11-04 21:11:53'),
(31, 1, 'BVGbTPhxABdmO8VcPH9YM9r3jbyXdPtO', '2017-11-07 20:07:30', '2017-11-07 20:07:30'),
(32, 1, 'acgWBEroM4V704sRjpwbrKmMEW5mb2Ql', '2017-11-09 21:59:35', '2017-11-09 21:59:35');

-- --------------------------------------------------------

--
-- Table structure for table `provision_rates`
--

CREATE TABLE `provision_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `rate` double(10,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provision_rates`
--

INSERT INTO `provision_rates` (`id`, `name`, `days`, `rate`, `notes`) VALUES
(1, 'Current', 0, 0.00, NULL),
(2, 'Especially Mentioned', 31, 5.00, NULL),
(3, 'Substandard', 61, 10.00, NULL),
(4, 'Doubtful', 91, 50.00, NULL),
(5, 'Loss', 181, 100.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'YD3Ik6cRWGCEnhuP4BO6nS3LtQFaZa4T', 0, NULL, '2018-09-04 14:45:06', '2018-09-04 14:45:06');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\"borrowers\":true,\"borrowers.view\":true,\"borrowers.update\":true,\"borrowers.delete\":true,\"borrowers.create\":true,\"borrowers.approve\":true,\"borrowers.blacklist\":true,\"borrowers.groups\":true,\"loans\":true,\"loans.create\":true,\"loans.update\":true,\"loans.delete\":true,\"loans.view\":true,\"loans.products\":true,\"loans.fees\":true,\"loans.schedule\":true,\"loans.approve\":true,\"loans.disburse\":true,\"loans.withdraw\":true,\"loans.writeoff\":true,\"loans.reschedule\":true,\"loans.guarantor.create\":true,\"loans.guarantor.update\":true,\"loans.guarantor.delete\":true,\"loans.guarantor.savings\":true,\"loans.loan_calculator\":true,\"repayments\":true,\"repayments.view\":true,\"repayments.create\":true,\"repayments.delete\":true,\"repayments.update\":true,\"payroll\":true,\"payroll.view\":true,\"payroll.update\":true,\"payroll.delete\":true,\"payroll.create\":true,\"expenses\":true,\"expenses.view\":true,\"expenses.create\":true,\"expenses.update\":true,\"expenses.delete\":true,\"other_income\":true,\"other_income.view\":true,\"other_income.create\":true,\"other_income.update\":true,\"other_income.delete\":true,\"collateral\":true,\"collateral.view\":true,\"collateral.update\":true,\"collateral.create\":true,\"collateral.delete\":true,\"reports\":true,\"communication\":true,\"communication.create\":true,\"communication.delete\":true,\"custom_fields\":true,\"custom_fields.view\":true,\"custom_fields.create\":true,\"custom_fields.update\":true,\"custom_fields.delete\":true,\"users\":true,\"users.view\":true,\"users.create\":true,\"users.update\":true,\"users.delete\":true,\"users.roles\":true,\"settings\":true,\"audit_trail\":true,\"savings\":true,\"savings.create\":true,\"savings.update\":true,\"savings.delete\":true,\"savings.transactions.create\":true,\"savings.transactions.update\":true,\"savings.transactions.delete\":true,\"savings.view\":true,\"savings.transactions.view\":true,\"savings.products\":true,\"savings.fees\":true,\"dashboard\":true,\"dashboard.loans_released_monthly_graph\":true,\"dashboard.loans_collected_monthly_graph\":true,\"dashboard.registered_borrowers\":true,\"dashboard.total_loans_released\":true,\"dashboard.total_collections\":true,\"dashboard.loans_disbursed\":true,\"dashboard.loans_pending\":true,\"dashboard.loans_approved\":true,\"dashboard.loans_declined\":true,\"dashboard.loans_closed\":true,\"dashboard.loans_withdrawn\":true,\"dashboard.loans_written_off\":true,\"dashboard.loans_rescheduled\":true,\"capital\":true,\"capital.view\":true,\"capital.create\":true,\"capital.update\":true,\"capital.delete\":true,\"assets\":true,\"assets.create\":true,\"assets.view\":true,\"assets.update\":true,\"assets.delete\":true,\"branches\":true,\"branches.view\":true,\"branches.create\":true,\"branches.update\":true,\"branches.delete\":true,\"branches.assign\":true}', NULL, '2017-10-13 12:47:14');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-08-07 08:51:00', '2017-08-07 08:51:00'),
(2, 1, '2017-10-24 06:36:45', '2017-10-24 06:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `savings_product_id` int(10) UNSIGNED DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`id`, `user_id`, `borrower_id`, `savings_product_id`, `notes`, `date`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, 1, 4, 1, 'For Purchasing Luxuries', '2017-10-25', '2017-10-25 23:21:20', '2017-10-25 23:21:20', 1),
(2, 1, 3, 1, '', '2017-11-03', '2017-11-03 17:48:36', '2017-11-03 17:48:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `savings_fees`
--

CREATE TABLE `savings_fees` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `savings_products` text COLLATE utf8_unicode_ci,
  `amount` decimal(10,2) DEFAULT '0.00',
  `fees_posting` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fees_adding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_fee_type` enum('full','pro_rata') COLLATE utf8_unicode_ci DEFAULT 'full',
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `savings_fees`
--

INSERT INTO `savings_fees` (`id`, `user_id`, `name`, `savings_products`, `amount`, `fees_posting`, `fees_adding`, `new_fee_type`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 'Account maintainance', 'a:1:{i:0;s:1:\"1\";}', '2000.00', '1', '6', 'full', NULL, '2017-10-25 23:24:15', '2017-10-25 23:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `savings_products`
--

CREATE TABLE `savings_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_overdraw` tinyint(4) NOT NULL DEFAULT '0',
  `interest_rate` decimal(10,2) DEFAULT NULL,
  `minimum_balance` int(11) DEFAULT '0',
  `interest_posting` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interest_adding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `savings_products`
--

INSERT INTO `savings_products` (`id`, `user_id`, `name`, `allow_overdraw`, `interest_rate`, `minimum_balance`, `interest_posting`, `interest_adding`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 'Heshima Ac', 1, '7.00', -1000000, '1', '6', NULL, '2017-10-25 23:20:26', '2017-10-25 23:20:26'),
(2, 1, 'Dhamana', 0, '2.00', 0, '1', '6', NULL, '2017-11-03 17:57:53', '2017-11-03 17:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `savings_transactions`
--

CREATE TABLE `savings_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `savings_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `type` enum('deposit','withdrawal','bank_fees','interest','dividend','guarantee','guarantee_restored') COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_interest` tinyint(4) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'allow_self_registration', '0'),
(2, 'allow_client_login', '1'),
(3, 'welcome_note', 'Welcome to our company. You can login with your username and password'),
(4, 'allow_client_apply', '0'),
(5, 'enable_online_payment', '0'),
(6, 'paynow_key', ''),
(7, 'paynow_id', ''),
(8, 'paypal_enabled', '0'),
(9, 'paynow_enabled', '0'),
(10, 'client_registration_required_fields', ''),
(11, 'client_auto_activate_account', '0'),
(12, 'client_request_guarantor', '0'),
(13, 'auto_post_savings_interest', '0'),
(14, 'company_name', 'Loan'),
(15, 'company_address', 'http://www.webstudio.co.zw'),
(16, 'company_currency', 'TZS'),
(17, 'company_website', 'http://www.xchangewallet.com'),
(18, 'company_country', 'Tanzania'),
(19, 'system_version', '1.3'),
(20, 'sms_enabled', '1'),
(21, 'active_sms', 'clickatell'),
(22, 'portal_address', 'http://www.'),
(23, 'company_email', 'info@xchangewallet.com'),
(24, 'currency_symbol', 'TZS'),
(25, 'currency_position', 'left'),
(26, 'company_logo', 'logo.jpg'),
(27, 'twilio_sid', ''),
(28, 'twilio_token', ''),
(29, 'twilio_phone_number', ''),
(30, 'routesms_host', ''),
(31, 'routesms_username', ''),
(32, 'routesms_password', ''),
(33, 'routesms_port', ''),
(34, 'sms_sender', ''),
(35, 'clickatell_username', ''),
(36, 'clickatell_password', ''),
(37, 'clickatell_api_id', ''),
(38, 'paypal_email', ''),
(39, 'currency', 'USD'),
(40, 'password_reset_subject', 'Password reset instructions'),
(41, 'password_reset_template', 'Password reset instructions'),
(42, 'payment_received_sms_template', 'Dear {borrowerFirstName}, we have received your payment of ${paymentAmount} for loan {loanNumber}. New loan balance:${loanBalance}. Thank you'),
(43, 'payment_received_email_template', '<p>Dear {borrowerFirstName}, we have received your payment of ${paymentAmount} for loan {loanNumber}. New loan balance:${loanBalance}. Thank you</p>'),
(44, 'payment_received_email_subject', 'Payment Received'),
(45, 'payment_email_subject', 'Payment Receipt'),
(46, 'payment_email_template', '<p>Dear {borrowerFirstName}, find attached receipt of your payment of ${paymentAmount} for loan {loanNumber} on {paymentDate}. New loan balance:${loanBalance}. Thank you</p>'),
(47, 'borrower_statement_email_subject', 'Client Statement'),
(48, 'borrower_statement_email_template', '<p>Dear {borrowerFirstName}, find attached statement of your loans with us. Thank you</p>'),
(49, 'loan_statement_email_subject', 'Loan Statement'),
(50, 'loan_statement_email_template', '<p>Dear {borrowerFirstName}, find attached loan statement for loan {loanNumber}. Thank you</p>'),
(51, 'loan_schedule_email_subject', 'Loan Schedule'),
(52, 'loan_schedule_email_template', '<p>Dear {borrowerFirstName}, find attached loan schedule for loan {loanNumber}. Thank you</p>'),
(53, 'cron_last_run', '2017-08-12 03:45:42'),
(54, 'auto_apply_penalty', '1'),
(55, 'auto_payment_receipt_sms', '0'),
(56, 'auto_payment_receipt_email', '1'),
(57, 'auto_repayment_sms_reminder', '0'),
(58, 'auto_repayment_email_reminder', '1'),
(59, 'auto_repayment_days', '4'),
(60, 'auto_overdue_repayment_sms_reminder', '0'),
(61, 'auto_overdue_repayment_email_reminder', '1'),
(62, 'auto_overdue_repayment_days', '2'),
(63, 'auto_overdue_loan_sms_reminder', '0'),
(64, 'auto_overdue_loan_email_reminder', '1'),
(65, 'auto_overdue_loan_days', '2'),
(66, 'loan_overdue_email_subject', 'Loan Overdue'),
(67, 'loan_overdue_email_template', '<p>Dear {borrowerFirstName}, Your loan {loanNumber} is overdue. Please make your payment. Thank you</p>'),
(68, 'loan_overdue_sms_template', 'Dear {borrowerFirstName}, Your loan {loanNumber} is overdue. Please make your payment. Thank you'),
(69, 'loan_payment_reminder_subject', 'Upcoming Payment Reminder'),
(70, 'loan_payment_reminder_email_template', '<p>Dear {borrowerFirstName},You have an upcoming payment of {paymentAmount} due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you</p>'),
(71, 'loan_payment_reminder_sms_template', 'Dear {borrowerFirstName},You have an upcoming payment of {paymentAmount} due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you'),
(72, 'missed_payment_email_subject', 'Missed Payment'),
(73, 'missed_payment_email_template', '<p>Dear {borrowerFirstName},You missed payment of {paymentAmount} which was due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you</p>'),
(74, 'missed_payment_sms_template', 'Dear {borrowerFirstName},You missed  payment of {paymentAmount} which was due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you'),
(75, 'enable_cron', '1'),
(76, 'infobip_username', ''),
(77, 'infobip_password', ''),
(78, 'update_url', 'http://webstudio.co.zw/ulm/update'),
(79, 'client_login_background', '');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `recipients` int(10) UNSIGNED NOT NULL,
  `send_to` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `gateway` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `throttle`
--

INSERT INTO `throttle` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES
(1, NULL, 'global', NULL, '2017-10-24 19:24:44', '2017-10-24 19:24:44'),
(2, NULL, 'ip', '197.250.98.12', '2017-10-24 19:24:44', '2017-10-24 19:24:44'),
(3, 1, 'user', NULL, '2017-10-24 19:24:44', '2017-10-24 19:24:44'),
(4, NULL, 'global', NULL, '2017-10-25 20:15:10', '2017-10-25 20:15:10'),
(5, NULL, 'ip', '197.250.99.54', '2017-10-25 20:15:10', '2017-10-25 20:15:10'),
(6, NULL, 'global', NULL, '2017-10-26 13:10:46', '2017-10-26 13:10:46'),
(7, NULL, 'ip', '197.250.98.1', '2017-10-26 13:10:46', '2017-10-26 13:10:46'),
(8, NULL, 'global', NULL, '2017-10-26 13:11:42', '2017-10-26 13:11:42'),
(9, NULL, 'ip', '197.250.98.1', '2017-10-26 13:11:42', '2017-10-26 13:11:42'),
(10, NULL, 'global', NULL, '2017-10-27 14:22:58', '2017-10-27 14:22:58'),
(11, NULL, 'ip', '197.250.228.130', '2017-10-27 14:22:58', '2017-10-27 14:22:58'),
(12, NULL, 'global', NULL, '2017-11-01 19:42:44', '2017-11-01 19:42:44'),
(13, NULL, 'ip', '41.222.181.66', '2017-11-01 19:42:44', '2017-11-01 19:42:44'),
(14, 1, 'user', NULL, '2017-11-01 19:42:44', '2017-11-01 19:42:44'),
(15, NULL, 'global', NULL, '2017-11-02 05:20:35', '2017-11-02 05:20:35'),
(16, NULL, 'ip', '86.150.224.237', '2017-11-02 05:20:35', '2017-11-02 05:20:35'),
(17, NULL, 'global', NULL, '2017-11-02 05:20:45', '2017-11-02 05:20:45'),
(18, NULL, 'ip', '86.150.224.237', '2017-11-02 05:20:45', '2017-11-02 05:20:45'),
(19, NULL, 'global', NULL, '2017-11-02 05:20:51', '2017-11-02 05:20:51'),
(20, NULL, 'ip', '86.150.224.237', '2017-11-02 05:20:51', '2017-11-02 05:20:51'),
(21, NULL, 'global', NULL, '2017-11-04 21:11:23', '2017-11-04 21:11:23'),
(22, NULL, 'ip', '197.250.227.90', '2017-11-04 21:11:23', '2017-11-04 21:11:23'),
(23, NULL, 'global', NULL, '2017-12-20 19:41:54', '2017-12-20 19:41:54'),
(24, NULL, 'ip', '197.250.100.159', '2017-12-20 19:41:54', '2017-12-20 19:41:54'),
(25, NULL, 'global', NULL, '2017-12-26 22:37:23', '2017-12-26 22:37:23'),
(26, NULL, 'ip', '197.250.227.22', '2017-12-26 22:37:24', '2017-12-26 22:37:24'),
(27, NULL, 'global', NULL, '2017-12-26 22:41:33', '2017-12-26 22:41:33'),
(28, NULL, 'ip', '197.250.227.22', '2017-12-26 22:41:33', '2017-12-26 22:41:33'),
(29, NULL, 'global', NULL, '2017-12-26 22:44:25', '2017-12-26 22:44:25'),
(30, NULL, 'ip', '197.250.227.22', '2017-12-26 22:44:25', '2017-12-26 22:44:25'),
(31, 1, 'user', NULL, '2017-12-26 22:44:25', '2017-12-26 22:44:25'),
(32, NULL, 'global', NULL, '2017-12-26 22:44:37', '2017-12-26 22:44:37'),
(33, NULL, 'ip', '197.250.227.22', '2017-12-26 22:44:37', '2017-12-26 22:44:37'),
(34, 1, 'user', NULL, '2017-12-26 22:44:37', '2017-12-26 22:44:37'),
(35, NULL, 'global', NULL, '2017-12-26 22:44:42', '2017-12-26 22:44:42'),
(36, NULL, 'ip', '197.250.227.22', '2017-12-26 22:44:42', '2017-12-26 22:44:42'),
(37, 1, 'user', NULL, '2017-12-26 22:44:42', '2017-12-26 22:44:42'),
(38, NULL, 'global', NULL, '2017-12-26 22:45:11', '2017-12-26 22:45:11'),
(39, NULL, 'ip', '197.250.227.22', '2017-12-26 22:45:11', '2017-12-26 22:45:11'),
(40, 1, 'user', NULL, '2017-12-26 22:45:11', '2017-12-26 22:45:11'),
(41, NULL, 'global', NULL, '2018-02-20 10:46:24', '2018-02-20 10:46:24'),
(42, NULL, 'ip', '114.124.228.76', '2018-02-20 10:46:24', '2018-02-20 10:46:24'),
(43, NULL, 'global', NULL, '2018-02-20 10:46:36', '2018-02-20 10:46:36'),
(44, NULL, 'ip', '114.124.228.76', '2018-02-20 10:46:36', '2018-02-20 10:46:36'),
(45, NULL, 'global', NULL, '2018-09-04 14:47:26', '2018-09-04 14:47:26'),
(46, NULL, 'ip', '197.215.240.67', '2018-09-04 14:47:26', '2018-09-04 14:47:26'),
(47, 1, 'user', NULL, '2018-09-04 14:47:26', '2018-09-04 14:47:26'),
(48, NULL, 'global', NULL, '2018-09-04 14:47:37', '2018-09-04 14:47:37'),
(49, NULL, 'ip', '197.215.240.67', '2018-09-04 14:47:37', '2018-09-04 14:47:37'),
(50, 1, 'user', NULL, '2018-09-04 14:47:37', '2018-09-04 14:47:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `permissions`, `last_login`, `first_name`, `last_name`, `address`, `phone`, `city`, `gender`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'robilin2@yahoo.com', '$2y$10$Opa9twkep14MtwfyB4yWDur/Prv/h3kYiKmcvEH1CeHgx0jDR1lfO', NULL, '2017-11-09 21:59:35', 'Admin', 'Admin', NULL, NULL, NULL, NULL, NULL, '2017-08-07 08:51:00', '2017-11-09 21:59:35'),
(2, 'royalit.net@gmail.com', '$2y$10$Sr4GdLEiC9bak6QBCZyKYemNYmVn4mNVuSi/ScrPzRszN0iy7Z7XG', NULL, NULL, 'Venance', 'Edson', '', '717222303', NULL, 'Male', '', '2017-10-24 06:36:45', '2017-10-24 06:36:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_types`
--
ALTER TABLE `asset_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_valuations`
--
ALTER TABLE `asset_valuations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrower_groups`
--
ALTER TABLE `borrower_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrower_group_members`
--
ALTER TABLE `borrower_group_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch_users`
--
ALTER TABLE `branch_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `capital`
--
ALTER TABLE `capital`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collateral`
--
ALTER TABLE `collateral`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collateral_types`
--
ALTER TABLE `collateral_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields_meta`
--
ALTER TABLE `custom_fields_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guarantor`
--
ALTER TABLE `guarantor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_applications`
--
ALTER TABLE `loan_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_comments`
--
ALTER TABLE `loan_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_disbursed_by`
--
ALTER TABLE `loan_disbursed_by`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_fees`
--
ALTER TABLE `loan_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_fees_meta`
--
ALTER TABLE `loan_fees_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_products`
--
ALTER TABLE `loan_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_repayments`
--
ALTER TABLE `loan_repayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_repayment_methods`
--
ALTER TABLE `loan_repayment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_status`
--
ALTER TABLE `loan_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_income`
--
ALTER TABLE `other_income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_income_types`
--
ALTER TABLE `other_income_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_meta`
--
ALTER TABLE `payroll_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_templates`
--
ALTER TABLE `payroll_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_template_meta`
--
ALTER TABLE `payroll_template_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Indexes for table `provision_rates`
--
ALTER TABLE `provision_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savings_fees`
--
ALTER TABLE `savings_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savings_products`
--
ALTER TABLE `savings_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savings_transactions`
--
ALTER TABLE `savings_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_setting_key_unique` (`setting_key`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `asset_types`
--
ALTER TABLE `asset_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `asset_valuations`
--
ALTER TABLE `asset_valuations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `borrower_groups`
--
ALTER TABLE `borrower_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `borrower_group_members`
--
ALTER TABLE `borrower_group_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `branch_users`
--
ALTER TABLE `branch_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `capital`
--
ALTER TABLE `capital`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `collateral`
--
ALTER TABLE `collateral`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `collateral_types`
--
ALTER TABLE `collateral_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_meta`
--
ALTER TABLE `custom_fields_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_types`
--
ALTER TABLE `expense_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `guarantor`
--
ALTER TABLE `guarantor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loan_applications`
--
ALTER TABLE `loan_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_comments`
--
ALTER TABLE `loan_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_disbursed_by`
--
ALTER TABLE `loan_disbursed_by`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `loan_fees`
--
ALTER TABLE `loan_fees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loan_fees_meta`
--
ALTER TABLE `loan_fees_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `loan_products`
--
ALTER TABLE `loan_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `loan_repayments`
--
ALTER TABLE `loan_repayments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loan_repayment_methods`
--
ALTER TABLE `loan_repayment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3733;

--
-- AUTO_INCREMENT for table `loan_status`
--
ALTER TABLE `loan_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `other_income`
--
ALTER TABLE `other_income`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `other_income_types`
--
ALTER TABLE `other_income_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_meta`
--
ALTER TABLE `payroll_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_templates`
--
ALTER TABLE `payroll_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_template_meta`
--
ALTER TABLE `payroll_template_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `provision_rates`
--
ALTER TABLE `provision_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `savings`
--
ALTER TABLE `savings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `savings_fees`
--
ALTER TABLE `savings_fees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `savings_products`
--
ALTER TABLE `savings_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `savings_transactions`
--
ALTER TABLE `savings_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
