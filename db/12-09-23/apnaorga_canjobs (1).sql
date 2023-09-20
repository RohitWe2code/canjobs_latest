-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 12, 2023 at 11:48 AM
-- Server version: 5.7.42-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apnaorga_canjobs`
--

DELIMITER $$
--
-- Procedures
--
$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_type` text,
  `request_api` text,
  `status` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33') DEFAULT NULL COMMENT '1 = "Employee updated", 2 = "Employee inserted", 3 = "Employee skill inserted", 4 = "Employee education details inserted", 5 = "Employee education details updated", 6 = "Employee career details inserted", 7 = "Employee career details updated", 8 = "Employee document inserted", 9 = "Employee document updated", 10 = "Employee visa inserted", 11 = "Employee visa updated", 12 = "Employer details updated", 13 = "Employer details inserted", 14 = "Employer contact details updated", 15 = "Employer kyc details inserted", 16 = "Employer kyc details updated", 17 = "job details updated", 18 = "job details inserted", 19 = "job switch", 20 = "apply on job", 21 = "interview schedule", 22 = "lmia updated", 23 = "lmia inserted", 24 = "Employer document inserted", 25 = "Employer document updated", 26 = "Employee lmia substage added", 27 = "Employee lmia substage updated", 28 = "job lmia substage inserted", 29 = "job lmia substage updated", 30 = "category inserted", 31 = "category updated", 32 = "category type inserted", 33 = "',
  `action_id` bigint(20) DEFAULT NULL,
  `action_type` text,
  `ip_address` varchar(21) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `user_id`, `user_type`, `request_api`, `status`, `action_id`, `action_type`, `ip_address`, `created_at`) VALUES
(1, 1, 'super-admin', 'employeeSkill', '3', 20, 'employee', '49.43.7.145', '2023-08-29 09:03:58'),
(2, 1, 'super-admin', 'employeePersonal_detail', '1', 20, 'employee', '49.43.7.145', '2023-08-29 09:08:00'),
(3, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '49.43.7.145', '2023-08-29 09:08:53'),
(4, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '49.43.7.145', '2023-08-29 09:08:55'),
(5, 1, 'super-admin', 'admin/addUpdateLmia', NULL, NULL, NULL, '49.43.7.145', '2023-08-29 09:08:56'),
(6, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '49.43.7.145', '2023-08-29 09:14:31'),
(7, 1, 'super-admin', 'admin/addUpdateLmia', '22', 3, 'lmia', '49.43.7.145', '2023-08-29 09:14:35'),
(8, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '49.43.7.145', '2023-08-29 09:15:50'),
(9, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.7.145', '2023-08-29 09:16:31'),
(10, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.7.145', '2023-08-29 09:19:07'),
(11, 1, 'super-admin', 'addUpdateVisa', '11', 21, 'employee', '49.43.7.145', '2023-08-29 09:20:01'),
(12, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '122.166.5.152', '2023-08-29 21:51:37'),
(13, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '122.166.5.152', '2023-08-29 21:52:35'),
(14, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '122.166.5.152', '2023-08-29 21:52:36'),
(15, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '122.166.5.152', '2023-08-29 21:52:39'),
(16, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '122.166.5.152', '2023-08-29 21:52:40'),
(17, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '122.166.5.152', '2023-08-29 21:52:42'),
(18, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '122.166.5.152', '2023-08-29 21:52:44'),
(19, 1, 'super-admin', 'employeePersonal_detail', '1', 4, 'employee', '122.166.5.152', '2023-08-29 21:57:59'),
(20, 1, 'super-admin', 'applyJob', '20', 6, 'apply_on_job', '122.166.5.152', '2023-08-29 21:59:37'),
(21, 1, 'super-admin', 'addUpdateVisa', '10', 4, 'employee', '122.166.5.152', '2023-08-30 06:35:28'),
(22, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 05:07:39'),
(23, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 05:07:40'),
(24, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 05:07:42'),
(25, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 05:07:43'),
(26, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 05:07:44'),
(27, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 05:07:45'),
(28, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 05:07:48'),
(29, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 05:07:50'),
(30, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 05:07:53'),
(31, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 05:07:55'),
(32, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 05:07:58'),
(33, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 05:08:00'),
(34, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 05:08:00'),
(35, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 05:08:01'),
(36, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.1.147', '2023-08-31 06:08:55'),
(37, 1, 'super-admin', 'addJobs', '17', 2, 'jobs', '49.43.1.147', '2023-08-31 06:08:56'),
(38, 1, 'super-admin', 'addJobs', '17', 6, 'jobs', '49.43.1.147', '2023-08-31 06:12:02'),
(39, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 6, 'jobs', '49.43.1.147', '2023-08-31 06:12:10'),
(40, 1, 'super-admin', 'contact_detail', '14', 1, 'employer', '49.43.1.147', '2023-08-31 08:29:55'),
(41, 1, 'super-admin', 'company_detail', '12', 1, 'employer', '49.43.1.147', '2023-08-31 08:35:44'),
(42, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.1.147', '2023-08-31 08:47:11'),
(43, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.1.147', '2023-08-31 08:51:25'),
(44, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.1.147', '2023-08-31 08:51:27'),
(45, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '49.43.1.147', '2023-08-31 08:51:28'),
(46, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '49.43.1.147', '2023-08-31 08:51:29'),
(47, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '49.43.1.147', '2023-08-31 08:51:30'),
(48, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.1.147', '2023-08-31 08:51:31'),
(49, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.1.147', '2023-08-31 08:51:33'),
(50, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.1.147', '2023-08-31 08:51:34'),
(51, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '49.43.1.147', '2023-08-31 08:51:46'),
(52, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '49.43.1.147', '2023-08-31 08:51:47'),
(53, 1, 'super-admin', 'admin/addUpdateInterview', '21', 4, 'apply_on_job', '49.43.1.147', '2023-08-31 08:52:51'),
(54, 1, 'super-admin', 'company/documentsUpload', '25', 2, 'employer', '49.43.1.147', '2023-08-31 09:00:51'),
(55, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.1.147', '2023-08-31 09:26:31'),
(56, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '49.43.1.147', '2023-08-31 09:26:33'),
(57, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 3, 'jobs', '49.43.1.147', '2023-08-31 10:16:01'),
(58, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 10:18:26'),
(59, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:18:28'),
(60, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.147', '2023-08-31 10:18:32'),
(61, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.147', '2023-08-31 10:18:37'),
(62, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.147', '2023-08-31 10:18:41'),
(63, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 10:18:49'),
(64, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:18:51'),
(65, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.147', '2023-08-31 10:18:51'),
(66, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 10:19:00'),
(67, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:19:01'),
(68, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.147', '2023-08-31 10:19:02'),
(69, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.147', '2023-08-31 10:19:09'),
(70, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.147', '2023-08-31 10:19:18'),
(71, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.147', '2023-08-31 10:19:22'),
(72, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 10, 'jobs', '49.43.1.147', '2023-08-31 10:24:13'),
(73, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 10, 'jobs', '49.43.1.147', '2023-08-31 10:24:13'),
(74, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 10, 'jobs', '49.43.1.147', '2023-08-31 10:24:14'),
(75, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 8, 'jobs', '49.43.1.147', '2023-08-31 10:24:20'),
(76, 1, 'super-admin', 'addJobs', '17', 8, 'jobs', '49.43.1.147', '2023-08-31 10:24:24'),
(77, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 8, 'jobs', '49.43.1.147', '2023-08-31 10:25:58'),
(78, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:26:11'),
(79, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 10, 'jobs', '49.43.1.147', '2023-08-31 10:26:20'),
(80, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.147', '2023-08-31 10:26:57'),
(81, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.147', '2023-08-31 10:27:01'),
(82, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.147', '2023-08-31 10:28:08'),
(83, 1, 'super-admin', 'user/documentsUpload', '8', 21, 'employee', '49.43.1.147', '2023-08-31 10:33:01'),
(84, 1, 'super-admin', 'user/documentsUpload', '8', 21, 'employee', '49.43.1.147', '2023-08-31 10:33:20'),
(85, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 3, 'jobs', '49.43.1.147', '2023-08-31 10:37:29'),
(86, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 3, 'jobs', '49.43.1.147', '2023-08-31 10:37:43'),
(87, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 3, 'jobs', '49.43.1.147', '2023-08-31 10:37:56'),
(88, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:51:53'),
(89, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:51:55'),
(90, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:51:57'),
(91, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:51:58'),
(92, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:52:00'),
(93, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:52:02'),
(94, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:52:05'),
(95, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:52:33'),
(96, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 10:52:36'),
(97, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 10:52:37'),
(98, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:52:49'),
(99, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 10:52:50'),
(100, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 10:52:52'),
(101, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.147', '2023-08-31 10:52:54'),
(102, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 1, 'lmia', '49.43.1.147', '2023-08-31 11:33:40'),
(103, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.1.147', '2023-08-31 11:34:25'),
(104, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 1, 'lmia', '49.43.1.147', '2023-08-31 12:05:20'),
(105, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 1, 'lmia', '49.43.1.147', '2023-08-31 12:06:05'),
(106, 1, 'super-admin', 'admin/addUpdateLmia', '22', 2, 'lmia', '49.43.1.147', '2023-08-31 12:09:40'),
(107, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:10:26'),
(108, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:10:28'),
(109, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:10:28'),
(110, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:10:32'),
(111, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:12:48'),
(112, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:12:50'),
(113, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:12:50'),
(114, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:13:06'),
(115, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:13:08'),
(116, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:13:08'),
(117, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:13:09'),
(118, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:13:10'),
(119, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:13:11'),
(120, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:13:15'),
(121, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:13:19'),
(122, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:13:48'),
(123, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:14:47'),
(124, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:14:49'),
(125, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:14:50'),
(126, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.1.147', '2023-08-31 12:14:50'),
(127, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.1.147', '2023-08-31 12:16:23'),
(128, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.1.147', '2023-08-31 12:16:25'),
(129, 1, 'super-admin', 'admin/addUpdateLmia', '22', 3, 'lmia', '49.43.1.147', '2023-08-31 12:16:29'),
(130, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.1.147', '2023-08-31 12:16:32'),
(131, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.1.147', '2023-08-31 12:16:34'),
(132, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.1.147', '2023-08-31 12:16:36'),
(133, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '49.43.1.147', '2023-08-31 12:17:27'),
(134, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.1.147', '2023-08-31 12:17:29'),
(135, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '49.43.1.147', '2023-08-31 12:17:36'),
(136, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '49.43.1.147', '2023-08-31 12:17:37'),
(137, 1, 'super-admin', 'addUpdateVisa', '11', 21, 'employee', '49.43.1.147', '2023-08-31 12:20:25'),
(138, 1, 'super-admin', 'addUpdateVisa', '11', 21, 'employee', '49.43.1.147', '2023-08-31 12:20:32'),
(139, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.1.147', '2023-08-31 12:26:01'),
(140, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.1.147', '2023-08-31 12:26:02'),
(141, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.1.147', '2023-08-31 12:26:04'),
(142, 1, 'super-admin', 'addUpdateVisa', '11', 21, 'employee', '49.43.1.147', '2023-08-31 12:42:20'),
(143, 1, 'super-admin', 'employeePersonal_detail', '1', 20, 'employee', '49.43.1.28', '2023-09-01 04:13:51'),
(144, 1, 'super-admin', 'employeePersonal_detail', '1', 20, 'employee', '49.43.1.28', '2023-09-01 04:13:53'),
(145, 1, 'super-admin', 'employeePersonal_detail', '1', 20, 'employee', '49.43.1.28', '2023-09-01 04:14:04'),
(146, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 1, 'lmia', '49.43.1.28', '2023-09-01 04:32:40'),
(147, 1, 'super-admin', 'admin/addUpdateLmia', '22', 1, 'lmia', '49.43.1.28', '2023-09-01 04:48:32'),
(148, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.1.28', '2023-09-01 04:48:39'),
(149, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.1.28', '2023-09-01 04:51:20'),
(150, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.1.28', '2023-09-01 04:51:22'),
(151, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.1.28', '2023-09-01 04:51:23'),
(152, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.1.28', '2023-09-01 04:51:24'),
(153, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.1.28', '2023-09-01 04:51:26'),
(154, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.1.28', '2023-09-01 04:51:27'),
(155, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.1.28', '2023-09-01 04:51:31'),
(156, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.1.28', '2023-09-01 04:57:12'),
(157, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.1.28', '2023-09-01 04:57:15'),
(158, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 3, 'lmia', '49.43.1.28', '2023-09-01 04:57:47'),
(159, 1, 'super-admin', 'addUpdateVisa', '10', 21, 'employee', '49.43.1.28', '2023-09-01 04:59:03'),
(160, 1, 'super-admin', 'admin/addUpdateLmia', '23', 4, 'lmia', '49.43.1.28', '2023-09-01 05:00:02'),
(161, 1, 'super-admin', 'admin/addUpdateLmia', '22', 4, 'lmia', '49.43.1.28', '2023-09-01 05:12:43'),
(162, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 4, 'lmia', '49.43.1.28', '2023-09-01 05:12:47'),
(163, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 4, 'lmia', '49.43.1.28', '2023-09-01 05:12:49'),
(164, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 6, 'jobs', '49.43.1.28', '2023-09-01 05:48:50'),
(165, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.1.28', '2023-09-01 05:48:55'),
(166, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.1.28', '2023-09-01 05:53:10'),
(167, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 6, 'jobs', '49.43.1.28', '2023-09-01 05:53:32'),
(168, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '49.43.1.28', '2023-09-01 05:53:35'),
(169, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '49.43.1.28', '2023-09-01 06:04:46'),
(170, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 6, 'jobs', '49.43.1.28', '2023-09-01 06:04:51'),
(171, 1, 'super-admin', 'addJobs', '17', 6, 'jobs', '49.43.1.28', '2023-09-01 06:04:52'),
(172, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '49.43.1.28', '2023-09-01 06:08:02'),
(173, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 6, 'jobs', '49.43.1.28', '2023-09-01 06:08:07'),
(174, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 1, 'lmia', '49.43.1.28', '2023-09-01 07:32:01'),
(175, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.1.28', '2023-09-01 08:32:40'),
(176, 1, 'super-admin', 'applyJob', '20', 7, 'apply_on_job', '49.43.1.28', '2023-09-01 09:23:56'),
(177, 1, 'super-admin', 'applyJob', '20', 8, 'apply_on_job', '49.43.1.28', '2023-09-01 09:23:57'),
(178, 1, 'super-admin', 'applyJob', '20', 9, 'apply_on_job', '49.43.1.28', '2023-09-01 09:24:00'),
(179, 1, 'super-admin', 'addUpdateVisa', '11', 21, 'employee', '49.43.1.28', '2023-09-01 10:10:01'),
(180, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.1.28', '2023-09-01 11:06:25'),
(181, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.1.28', '2023-09-01 11:06:38'),
(182, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.1.28', '2023-09-01 11:08:12'),
(183, 1, 'super-admin', 'admin/addUpdateLmia', '23', 5, 'lmia', '49.43.1.28', '2023-09-01 11:08:12'),
(184, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.1.28', '2023-09-01 11:09:08'),
(185, 1, 'super-admin', 'admin/addUpdateLmia', '23', 6, 'lmia', '49.43.1.28', '2023-09-01 11:09:08'),
(186, 1, 'super-admin', 'admin/addUpdateLmia', '23', 7, 'lmia', '49.43.1.28', '2023-09-01 11:09:13'),
(187, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 7, 'lmia', '49.43.1.28', '2023-09-01 11:10:11'),
(188, 1, 'super-admin', 'admin/addUpdateLmia', '22', 7, 'lmia', '49.43.1.28', '2023-09-01 11:10:14'),
(189, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 7, 'lmia', '49.43.1.28', '2023-09-01 11:10:49'),
(190, 1, 'super-admin', 'admin/addUpdateLmia', '22', 7, 'lmia', '49.43.1.28', '2023-09-01 11:10:52'),
(191, 1, 'super-admin', 'admin/addUpdateLmia', '22', 7, 'lmia', '49.43.1.28', '2023-09-01 11:11:14'),
(192, 1, 'super-admin', 'admin/addUpdateLmia', '22', 7, 'lmia', '49.43.1.28', '2023-09-01 11:15:12'),
(193, 1, 'super-admin', 'admin/addUpdateLmia', '22', 6, 'lmia', '49.43.1.28', '2023-09-01 11:15:22'),
(194, 1, 'super-admin', 'addUpdateVisa', '11', 3, 'employee', '49.43.1.28', '2023-09-01 11:27:42'),
(195, 1, 'super-admin', 'addUpdateVisa', '11', 3, 'employee', '49.43.1.28', '2023-09-01 11:27:49'),
(196, 1, 'super-admin', 'addUpdateVisa', '11', 3, 'employee', '49.43.1.28', '2023-09-01 11:28:08'),
(197, 1, 'super-admin', 'addUpdateVisa', '11', 3, 'employee', '49.43.1.28', '2023-09-01 11:28:11'),
(198, 1, 'super-admin', 'addUpdateVisa', '11', 3, 'employee', '49.43.1.28', '2023-09-01 11:28:19'),
(199, 1, 'super-admin', 'admin/addUpdateLmia', '23', 8, 'lmia', '49.43.1.28', '2023-09-01 11:31:38'),
(200, 1, 'super-admin', 'addUpdateVisa', '11', 4, 'employee', '49.43.1.28', '2023-09-01 11:31:45'),
(201, 1, 'super-admin', 'applyJob', '20', 10, 'apply_on_job', '49.43.1.28', '2023-09-01 11:32:24'),
(202, 1, 'super-admin', 'applyJob', '20', 11, 'apply_on_job', '49.43.1.28', '2023-09-01 11:32:25'),
(203, 1, 'super-admin', 'applyJob', '20', 12, 'apply_on_job', '49.43.1.28', '2023-09-01 11:32:27'),
(204, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.1.28', '2023-09-01 11:32:51'),
(205, 1, 'super-admin', 'admin/addUpdateLmia', '23', 9, 'lmia', '49.43.1.28', '2023-09-01 11:32:51'),
(206, 1, 'super-admin', 'addUpdateVisa', '11', 3, 'employee', '49.43.1.28', '2023-09-01 11:35:34'),
(207, 1, 'super-admin', 'addUpdateVisa', '11', 3, 'employee', '49.43.1.28', '2023-09-01 11:35:40'),
(208, 1, 'super-admin', 'addUpdateVisa', '11', 3, 'employee', '49.43.1.28', '2023-09-01 11:36:09'),
(209, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 6, 'lmia', '49.43.1.28', '2023-09-01 11:36:32'),
(210, 1, 'super-admin', 'applyJob', '20', 13, 'apply_on_job', '49.43.1.28', '2023-09-01 11:41:13'),
(211, 1, 'super-admin', 'applyJob', '20', 14, 'apply_on_job', '49.43.1.28', '2023-09-01 11:41:15'),
(212, 1, 'super-admin', 'applyJob', '20', 15, 'apply_on_job', '49.43.1.28', '2023-09-01 11:41:17'),
(213, 1, 'super-admin', 'addUpdateVisa', '10', 6, 'employee', '49.43.1.28', '2023-09-01 11:41:27'),
(214, 1, 'super-admin', 'admin/addUpdateLmia', '23', 10, 'lmia', '49.43.1.28', '2023-09-01 11:41:27'),
(215, 1, 'super-admin', 'addUpdateVisa', '11', 6, 'employee', '49.43.1.28', '2023-09-01 11:45:12'),
(216, 1, 'super-admin', 'addUpdateVisa', '11', 6, 'employee', '49.43.1.28', '2023-09-01 11:46:11'),
(217, 1, 'super-admin', 'addUpdateVisa', '11', 6, 'employee', '49.43.1.28', '2023-09-01 11:47:02'),
(218, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 8, 'jobs', '49.43.1.28', '2023-09-01 11:59:06'),
(219, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 10, 'jobs', '49.43.1.28', '2023-09-01 11:59:23'),
(220, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.15.187.81', '2023-09-02 09:07:03'),
(221, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.15.187.81', '2023-09-02 09:07:06'),
(222, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.15.187.81', '2023-09-02 09:07:09'),
(223, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.15.187.81', '2023-09-02 09:07:10'),
(224, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.15.187.81', '2023-09-02 09:07:12'),
(225, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.15.187.81', '2023-09-02 09:07:14'),
(226, 1, 'super-admin', 'contact_detail', '14', 2, 'employer', '49.43.2.133', '2023-09-04 04:08:52'),
(227, 1, 'super-admin', 'contact_detail', '14', 2, 'employer', '49.43.2.133', '2023-09-04 04:09:03'),
(228, 1, 'super-admin', 'contact_detail', '14', 2, 'employer', '49.43.2.133', '2023-09-04 04:09:09'),
(229, 1, 'super-admin', 'company_kyc_detail', '16', 2, 'employer', '49.43.2.133', '2023-09-04 04:09:30'),
(230, 1, 'super-admin', 'company_detail', '12', 2, 'employer', '49.43.2.133', '2023-09-04 04:09:41'),
(231, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 2, 'lmia', '49.43.2.133', '2023-09-04 04:09:49'),
(232, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 2, 'lmia', '49.43.2.133', '2023-09-04 04:09:50'),
(233, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 2, 'lmia', '49.43.2.133', '2023-09-04 04:09:52'),
(234, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 2, 'lmia', '49.43.2.133', '2023-09-04 04:09:56'),
(235, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 2, 'lmia', '49.43.2.133', '2023-09-04 04:09:57'),
(236, 1, 'super-admin', 'admin/addUpdateLmia', '22', 2, 'lmia', '49.43.2.133', '2023-09-04 04:10:02'),
(237, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.133', '2023-09-04 05:05:36'),
(238, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.2.133', '2023-09-04 05:23:15'),
(239, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.2.133', '2023-09-04 05:23:16'),
(240, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.133', '2023-09-04 05:56:36'),
(241, 1, 'super-admin', 'applyJob', '20', 16, 'apply_on_job', '49.43.2.133', '2023-09-04 06:07:50'),
(242, 1, 'super-admin', 'applyJob', '20', 17, 'apply_on_job', '49.43.2.133', '2023-09-04 06:07:53'),
(243, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.133', '2023-09-04 06:08:09'),
(244, 1, 'super-admin', 'company/documentsUpload', '25', 2, 'employer', '49.43.2.133', '2023-09-04 06:08:54'),
(245, 1, 'super-admin', 'company/documentsUpload', '25', 2, 'employer', '49.43.2.133', '2023-09-04 06:09:32'),
(246, 1, 'super-admin', 'contact_detail', '14', 1, 'employer', '49.43.2.133', '2023-09-04 06:10:21'),
(247, 1, 'super-admin', 'contact_detail', '14', 1, 'employer', '49.43.2.133', '2023-09-04 06:10:28'),
(248, 1, 'super-admin', 'employeePersonal_detail', '1', 11, 'employee', '49.43.2.133', '2023-09-04 06:12:29'),
(249, 1, 'super-admin', 'employeePersonal_detail', '1', 11, 'employee', '49.43.2.133', '2023-09-04 06:13:27'),
(250, 1, 'super-admin', 'addUpdateVisa', '10', 11, 'employee', '49.43.2.133', '2023-09-04 06:13:47'),
(251, 1, 'super-admin', 'admin/addUpdateLmia', '23', 11, 'lmia', '49.43.2.133', '2023-09-04 06:13:47'),
(252, 1, 'super-admin', 'addUpdateVisa', '11', 11, 'employee', '49.43.2.133', '2023-09-04 06:15:28'),
(253, 1, 'super-admin', 'employeePersonal_detail', '1', 11, 'employee', '49.43.2.133', '2023-09-04 06:33:18'),
(254, 1, 'super-admin', 'employeeCareer_detail', '6', 11, 'employee', '49.43.2.133', '2023-09-04 06:36:29'),
(255, 1, 'super-admin', 'employeeCareer_detail', '6', 11, 'employee', '49.43.2.133', '2023-09-04 06:36:51'),
(256, 1, 'super-admin', 'employeeSkill', '3', 11, 'employee', '49.43.2.133', '2023-09-04 06:37:10'),
(257, 1, 'super-admin', 'employeeSkill', '3', 11, 'employee', '49.43.2.133', '2023-09-04 06:37:13'),
(258, 1, 'super-admin', 'employeeSkill', '3', 11, 'employee', '49.43.2.133', '2023-09-04 06:37:16'),
(259, 1, 'super-admin', 'employeeSkill', '3', 11, 'employee', '49.43.2.133', '2023-09-04 06:37:19'),
(260, 1, 'super-admin', 'employeeSkill', '3', 11, 'employee', '49.43.2.133', '2023-09-04 06:37:23'),
(261, 1, 'super-admin', 'employeeEducation_detail', '4', 11, 'employee', '49.43.2.133', '2023-09-04 06:37:36'),
(262, 1, 'super-admin', 'employeeEducation_detail', '4', 11, 'employee', '49.43.2.133', '2023-09-04 06:37:47'),
(263, 1, 'super-admin', 'employeeEducation_detail', '4', 11, 'employee', '49.43.2.133', '2023-09-04 06:37:59'),
(264, 1, 'super-admin', 'admin/addUpdateInterview', '21', 17, 'apply_on_job', '49.43.2.133', '2023-09-04 06:38:20'),
(265, 1, 'super-admin', 'user/documentsUpload', '8', 11, 'employee', '49.43.2.133', '2023-09-04 06:38:30'),
(266, 1, 'super-admin', 'user/documentsUpload', '8', 11, 'employee', '49.43.2.133', '2023-09-04 06:38:40'),
(267, 1, 'super-admin', 'user/documentsUpload', '8', 11, 'employee', '49.43.2.133', '2023-09-04 06:38:58'),
(268, 1, 'super-admin', 'user/documentsUpload', '8', 11, 'employee', '49.43.2.133', '2023-09-04 06:39:40'),
(269, 1, 'super-admin', 'company/documentsUpload', '24', 2, 'employer', '49.43.2.133', '2023-09-04 06:42:35'),
(270, 1, 'super-admin', 'admin/addUpdateInterview', '21', 17, 'apply_on_job', '49.43.2.133', '2023-09-04 06:42:43'),
(271, 1, 'super-admin', 'addUpdateVisa', '10', 6, 'employee', '49.43.2.133', '2023-09-04 06:45:45'),
(272, 1, 'super-admin', 'admin/addUpdateLmia', '23', 12, 'lmia', '49.43.2.133', '2023-09-04 06:45:45'),
(273, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 11, 'lmia', '49.43.2.133', '2023-09-04 07:06:34'),
(274, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 11, 'lmia', '49.43.2.133', '2023-09-04 07:06:39'),
(275, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 11, 'lmia', '49.43.2.133', '2023-09-04 07:06:42'),
(276, 1, 'super-admin', 'admin/addUpdateLmia', '22', 11, 'lmia', '49.43.2.133', '2023-09-04 07:07:21'),
(277, 1, 'super-admin', 'employeePersonal_detail', '1', 11, 'employee', '49.43.2.133', '2023-09-04 07:23:06'),
(278, 1, 'super-admin', 'employeeEducation_detail', '4', 11, 'employee', '49.43.2.133', '2023-09-04 07:25:08'),
(279, 1, 'super-admin', 'employeePersonal_detail', '1', 11, 'employee', '49.43.2.133', '2023-09-04 07:25:24'),
(280, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 11, 'lmia', '49.43.2.133', '2023-09-04 09:05:48'),
(281, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 11, 'lmia', '49.43.2.133', '2023-09-04 09:15:40'),
(282, 1, 'super-admin', 'applyJob', '20', 18, 'apply_on_job', '49.43.2.133', '2023-09-04 09:19:20'),
(283, 1, 'super-admin', 'applyJob', '20', 19, 'apply_on_job', '49.43.2.133', '2023-09-04 09:19:21'),
(284, 1, 'super-admin', 'applyJob', '20', 20, 'apply_on_job', '49.43.2.133', '2023-09-04 09:19:23'),
(285, 1, 'super-admin', 'applyJob', '20', 21, 'apply_on_job', '49.43.2.133', '2023-09-04 09:19:24'),
(286, 1, 'super-admin', 'applyJob', '20', 22, 'apply_on_job', '49.43.2.133', '2023-09-04 09:19:26'),
(287, 1, 'super-admin', 'addUpdateVisa', '10', 11, 'employee', '49.43.2.133', '2023-09-04 09:19:37'),
(288, 1, 'super-admin', 'admin/addUpdateLmia', '23', 13, 'lmia', '49.43.2.133', '2023-09-04 09:19:37'),
(289, 1, 'super-admin', 'admin/addUpdateLmia', '22', 13, 'lmia', '49.43.2.133', '2023-09-04 09:19:49'),
(290, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 13, 'lmia', '49.43.2.133', '2023-09-04 09:21:11'),
(291, 1, 'super-admin', 'admin/addUpdateLmia', '22', 13, 'lmia', '49.43.2.133', '2023-09-04 09:21:14'),
(292, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 13, 'lmia', '49.43.2.133', '2023-09-04 09:21:18'),
(293, 1, 'super-admin', 'addUpdateVisa', '11', 11, 'employee', '49.43.2.133', '2023-09-04 09:21:30'),
(294, 1, 'super-admin', 'addUpdateVisa', '11', 11, 'employee', '49.43.2.133', '2023-09-04 09:23:39'),
(295, 1, 'super-admin', 'admin/addUpdateLmia', '23', 14, 'lmia', '49.43.2.133', '2023-09-04 09:23:39'),
(296, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.133', '2023-09-04 09:23:49'),
(297, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.2.133', '2023-09-04 09:29:22'),
(298, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.2.133', '2023-09-04 09:32:17'),
(299, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.2.133', '2023-09-04 09:36:56'),
(300, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.133', '2023-09-04 09:37:06'),
(301, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.133', '2023-09-04 09:37:17'),
(302, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.133', '2023-09-04 09:37:23'),
(303, 1, 'super-admin', 'addUpdateVisa', '11', 21, 'employee', '49.43.2.133', '2023-09-04 09:48:19'),
(304, 1, 'super-admin', 'addUpdateVisa', '11', 11, 'employee', '49.43.2.133', '2023-09-04 10:02:29'),
(305, 1, 'super-admin', 'addUpdateVisa', '11', 11, 'employee', '49.43.2.133', '2023-09-04 10:03:42'),
(306, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.2.133', '2023-09-04 10:53:28'),
(307, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 3, 'lmia', '49.43.2.133', '2023-09-04 10:53:36'),
(308, 1, 'super-admin', 'employeeEducation_detail', '4', 21, 'employee', '49.37.170.181', '2023-09-04 11:11:34'),
(309, 1, 'super-admin', 'employeeCareer_detail', '6', 21, 'employee', '49.37.170.181', '2023-09-04 11:12:38'),
(310, 1, 'super-admin', 'addUpdateVisa', '11', 6, 'employee', '49.37.170.181', '2023-09-04 11:15:01'),
(311, 1, 'super-admin', 'addUpdateVisa', '11', 6, 'employee', '49.37.170.181', '2023-09-04 11:15:06'),
(312, 1, 'super-admin', 'employeePersonal_detail', '1', 4, 'employee', '49.43.2.133', '2023-09-04 11:15:21'),
(313, 1, 'super-admin', 'employeePersonal_detail', '1', 4, 'employee', '49.43.2.133', '2023-09-04 11:15:26'),
(314, 1, 'super-admin', 'employeePersonal_detail', '1', 11, 'employee', '49.43.2.133', '2023-09-04 11:15:53'),
(315, 1, 'super-admin', 'employeePersonal_detail', '1', 11, 'employee', '49.43.2.133', '2023-09-04 11:18:01'),
(316, 1, 'super-admin', 'admin/addUpdateInterview', '21', 4, 'apply_on_job', '49.37.170.181', '2023-09-04 11:18:21'),
(317, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 6, 'jobs', '49.43.2.133', '2023-09-04 11:25:44'),
(318, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 6, 'jobs', '49.43.2.133', '2023-09-04 11:25:45'),
(319, 1, 'super-admin', 'addJobs', '17', 6, 'jobs', '49.43.2.133', '2023-09-04 11:25:47'),
(320, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.133', '2023-09-04 12:21:12'),
(321, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.133', '2023-09-04 12:21:22'),
(322, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.133', '2023-09-04 12:34:50'),
(323, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.133', '2023-09-04 12:35:03'),
(324, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.133', '2023-09-04 12:35:43'),
(325, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.133', '2023-09-04 12:36:04'),
(326, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.133', '2023-09-04 12:36:37'),
(327, 1, 'super-admin', 'employeePersonal_detail', '1', 18, 'employee', '49.43.2.72', '2023-09-05 05:24:14'),
(328, 1, 'super-admin', 'employeeSkill', '3', 1, 'employee', '49.43.2.72', '2023-09-05 06:23:47'),
(329, 1, 'super-admin', 'employeePersonal_detail', '1', 1, 'employee', '49.43.2.72', '2023-09-05 06:26:44'),
(330, 1, 'super-admin', 'employeePersonal_detail', '1', 1, 'employee', '49.43.2.72', '2023-09-05 06:33:58'),
(331, 1, 'super-admin', 'employeeEducation_detail', '4', 1, 'employee', '49.43.2.72', '2023-09-05 06:34:53'),
(332, 1, 'super-admin', 'employeeEducation_detail', '4', 1, 'employee', '49.43.2.72', '2023-09-05 06:35:40'),
(333, 1, 'super-admin', 'employeeEducation_detail', '4', 1, 'employee', '49.43.2.72', '2023-09-05 06:35:58'),
(334, 1, 'super-admin', 'employeeEducation_detail', '5', 1, 'employee', '49.43.2.72', '2023-09-05 06:36:40'),
(335, 1, 'super-admin', 'employeeEducation_detail', '5', 1, 'employee', '49.43.2.72', '2023-09-05 06:36:54'),
(336, 1, 'super-admin', 'employeeCareer_detail', '6', 1, 'employee', '49.43.2.72', '2023-09-05 06:38:15'),
(337, 1, 'super-admin', 'employeeCareer_detail', '6', 1, 'employee', '49.43.2.72', '2023-09-05 06:38:41'),
(338, 1, 'super-admin', 'employeeCareer_detail', '7', 1, 'employee', '49.43.2.72', '2023-09-05 06:39:16'),
(339, 1, 'super-admin', 'applyJob', '20', 23, 'apply_on_job', '49.43.2.72', '2023-09-05 06:41:21'),
(340, 1, 'super-admin', 'applyJob', '20', 24, 'apply_on_job', '49.43.2.72', '2023-09-05 06:41:25'),
(341, 1, 'super-admin', 'applyJob', '20', 25, 'apply_on_job', '49.43.2.72', '2023-09-05 06:41:28'),
(342, 1, 'super-admin', 'applyJob', '20', 26, 'apply_on_job', '49.43.2.72', '2023-09-05 06:41:31'),
(343, 1, 'super-admin', 'applyJob', '20', 27, 'apply_on_job', '49.43.2.72', '2023-09-05 06:41:36'),
(344, 1, 'super-admin', 'applyJob', '20', 28, 'apply_on_job', '49.43.2.72', '2023-09-05 06:41:40'),
(345, 1, 'super-admin', 'applyJob', '20', 29, 'apply_on_job', '49.43.2.72', '2023-09-05 06:41:47'),
(346, 1, 'super-admin', 'applyJob', '20', 30, 'apply_on_job', '49.43.2.72', '2023-09-05 06:41:50'),
(347, 1, 'super-admin', 'applyJob', '20', 31, 'apply_on_job', '49.43.2.72', '2023-09-05 06:41:57'),
(348, 1, 'super-admin', 'applyJob', '20', 32, 'apply_on_job', '49.43.2.72', '2023-09-05 06:41:59'),
(349, 1, 'super-admin', 'applyJob', '20', 33, 'apply_on_job', '49.43.2.72', '2023-09-05 06:42:01'),
(350, 1, 'super-admin', 'applyJob', '20', 34, 'apply_on_job', '49.43.2.72', '2023-09-05 06:42:03'),
(351, 1, 'super-admin', 'applyJob', '20', 35, 'apply_on_job', '49.43.2.72', '2023-09-05 06:55:16'),
(352, 1, 'super-admin', 'employeePersonal_detail', '2', 25, 'employee', '49.43.2.72', '2023-09-05 07:09:00'),
(353, 1, 'super-admin', 'employeePersonal_detail', '2', 26, 'employee', '49.43.2.72', '2023-09-05 07:11:46'),
(354, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.72', '2023-09-05 07:13:44'),
(355, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.72', '2023-09-05 07:13:53'),
(356, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.72', '2023-09-05 07:14:59'),
(357, 1, 'super-admin', 'addJobs', '17', 2, 'jobs', '49.43.2.72', '2023-09-05 07:15:06'),
(358, 1, 'super-admin', 'addJobs', '17', 6, 'jobs', '49.43.2.72', '2023-09-05 07:15:19'),
(359, 1, 'super-admin', 'addJobs', '17', 16, 'jobs', '49.43.2.72', '2023-09-05 07:15:27'),
(360, 1, 'super-admin', 'addJobs', '17', 16, 'jobs', '49.43.2.72', '2023-09-05 07:15:35'),
(361, 1, 'super-admin', 'addJobs', '17', 14, 'jobs', '49.43.2.72', '2023-09-05 07:15:42'),
(362, 1, 'super-admin', 'addJobs', '17', 10, 'jobs', '49.43.2.72', '2023-09-05 07:15:48'),
(363, 1, 'super-admin', 'employeeEducation_detail', '4', 21, 'employee', '49.43.2.72', '2023-09-05 07:15:53'),
(364, 1, 'super-admin', 'addJobs', '17', 9, 'jobs', '49.43.2.72', '2023-09-05 07:15:55'),
(365, 1, 'super-admin', 'addJobs', '17', 8, 'jobs', '49.43.2.72', '2023-09-05 07:16:12'),
(366, 1, 'super-admin', 'addJobs', '17', 7, 'jobs', '49.43.2.72', '2023-09-05 07:16:19'),
(367, 1, 'super-admin', 'addJobs', '17', 5, 'jobs', '49.43.2.72', '2023-09-05 07:16:25'),
(368, 1, 'super-admin', 'employeeEducation_detail', '5', 21, 'employee', '49.43.2.72', '2023-09-05 07:16:30'),
(369, 1, 'super-admin', 'addJobs', '17', 21, 'jobs', '49.43.2.72', '2023-09-05 07:16:43'),
(370, 1, 'super-admin', 'addJobs', '17', 20, 'jobs', '49.43.2.72', '2023-09-05 07:16:49'),
(371, 1, 'super-admin', 'employeeEducation_detail', '5', 21, 'employee', '49.43.2.72', '2023-09-05 07:16:55'),
(372, 1, 'super-admin', 'addJobs', '17', 9, 'jobs', '49.43.2.72', '2023-09-05 07:17:01'),
(373, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.72', '2023-09-05 07:17:09'),
(374, 1, 'super-admin', 'employeeEducation_detail', '5', 21, 'employee', '49.43.2.72', '2023-09-05 07:17:09'),
(375, 1, 'super-admin', 'employeeEducation_detail', '4', 21, 'employee', '49.43.2.72', '2023-09-05 07:17:50'),
(376, 1, 'super-admin', 'employeeEducation_detail', '4', 21, 'employee', '49.43.2.72', '2023-09-05 07:19:27'),
(377, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.72', '2023-09-05 08:22:27'),
(378, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.72', '2023-09-05 08:22:53'),
(379, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.72', '2023-09-05 08:22:57'),
(380, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.72', '2023-09-05 08:23:00'),
(381, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.72', '2023-09-05 08:23:03'),
(382, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.72', '2023-09-05 08:23:07'),
(383, 1, 'super-admin', 'admin/addUpdateLmia', '22', 4, 'lmia', '49.43.2.72', '2023-09-05 08:23:51'),
(384, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 4, 'lmia', '49.43.2.72', '2023-09-05 08:24:18'),
(385, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 4, 'lmia', '49.43.2.72', '2023-09-05 08:24:31'),
(386, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 4, 'lmia', '49.43.2.72', '2023-09-05 08:24:33'),
(387, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 4, 'lmia', '49.43.2.72', '2023-09-05 08:24:35'),
(388, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 4, 'lmia', '49.43.2.72', '2023-09-05 08:24:37'),
(389, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 4, 'lmia', '49.43.2.72', '2023-09-05 08:24:38'),
(390, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 4, 'lmia', '49.43.2.72', '2023-09-05 08:24:40'),
(391, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 4, 'lmia', '49.43.2.72', '2023-09-05 08:24:48'),
(392, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 4, 'lmia', '49.43.2.72', '2023-09-05 08:24:49'),
(393, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 4, 'lmia', '49.43.2.72', '2023-09-05 08:24:50'),
(394, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 4, 'lmia', '49.43.2.72', '2023-09-05 08:25:00'),
(395, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.72', '2023-09-05 08:34:51'),
(396, 1, 'super-admin', 'employeePersonal_detail', '1', 25, 'employee', '49.43.2.72', '2023-09-05 08:34:57'),
(397, 1, 'super-admin', 'employeePersonal_detail', '1', 1, 'employee', '49.43.2.72', '2023-09-05 08:35:02'),
(398, 1, 'super-admin', 'employeePersonal_detail', '1', 4, 'employee', '49.43.2.72', '2023-09-05 08:35:22'),
(399, 1, 'super-admin', 'employeePersonal_detail', '1', 6, 'employee', '49.43.2.72', '2023-09-05 08:35:31'),
(400, 1, 'super-admin', 'employeePersonal_detail', '1', 20, 'employee', '49.43.2.72', '2023-09-05 08:35:46'),
(401, 1, 'super-admin', 'employeePersonal_detail', '1', 18, 'employee', '49.43.2.72', '2023-09-05 08:35:54'),
(402, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.72', '2023-09-05 08:37:33'),
(403, 1, 'super-admin', 'employeeSkill', '3', 21, 'employee', '49.43.2.72', '2023-09-05 08:38:29'),
(404, 1, 'super-admin', 'employeeSkill', '3', 21, 'employee', '49.43.2.72', '2023-09-05 08:38:32'),
(405, 1, 'super-admin', 'employeeSkill', '3', 21, 'employee', '49.43.2.72', '2023-09-05 08:38:35'),
(406, 1, 'super-admin', 'employeeSkill', '3', 21, 'employee', '49.43.2.72', '2023-09-05 08:39:26'),
(407, 1, 'super-admin', 'employeeCareer_detail', '6', 21, 'employee', '49.43.2.72', '2023-09-05 08:39:59'),
(408, 1, 'super-admin', 'employeeCareer_detail', '7', 21, 'employee', '49.43.2.72', '2023-09-05 08:40:17'),
(409, 1, 'super-admin', 'employeeCareer_detail', '7', 21, 'employee', '49.43.2.72', '2023-09-05 08:40:23'),
(410, 1, 'super-admin', 'employeePersonal_detail', '1', 25, 'employee', '49.43.2.72', '2023-09-05 09:25:08'),
(411, 1, 'super-admin', 'employeePersonal_detail', '1', 25, 'employee', '49.43.2.72', '2023-09-05 09:25:10'),
(412, 1, 'super-admin', 'employeePersonal_detail', '1', 25, 'employee', '49.43.2.72', '2023-09-05 09:25:14'),
(413, 1, 'super-admin', 'employeePersonal_detail', '1', 25, 'employee', '49.43.2.72', '2023-09-05 09:25:18'),
(414, 1, 'super-admin', 'employeePersonal_detail', '1', 25, 'employee', '49.43.2.72', '2023-09-05 09:25:21'),
(415, 1, 'super-admin', 'employeeCareer_detail', '7', 3, 'employee', '49.43.2.72', '2023-09-05 09:30:17'),
(416, 1, 'super-admin', 'employeeCareer_detail', '6', 3, 'employee', '49.43.2.72', '2023-09-05 09:30:29'),
(417, 1, 'super-admin', 'employeeEducation_detail', '4', 25, 'employee', '49.43.2.72', '2023-09-05 09:40:11'),
(418, 1, 'super-admin', 'employeeSkill', '3', 25, 'employee', '49.43.2.72', '2023-09-05 09:40:31'),
(419, 1, 'super-admin', 'employeeSkill', '3', 25, 'employee', '49.43.2.72', '2023-09-05 09:40:34'),
(420, 1, 'super-admin', 'employeeSkill', '3', 25, 'employee', '49.43.2.72', '2023-09-05 09:40:38'),
(421, 1, 'super-admin', 'employeeSkill', '3', 25, 'employee', '49.43.2.72', '2023-09-05 09:40:41'),
(422, 1, 'super-admin', 'employeeSkill', '3', 25, 'employee', '49.43.2.72', '2023-09-05 09:40:45'),
(423, 1, 'super-admin', 'employeeCareer_detail', '6', 1, 'employee', '49.43.2.72', '2023-09-05 09:41:08'),
(424, 1, 'super-admin', 'employeePersonal_detail', '1', 10, 'employee', '49.43.2.72', '2023-09-05 09:42:37'),
(425, 1, 'super-admin', 'contact_detail', '14', 4, 'employer', '49.43.2.72', '2023-09-05 09:44:11'),
(426, 1, 'super-admin', 'company_kyc_detail', '16', 4, 'employer', '49.43.2.72', '2023-09-05 09:53:58'),
(427, 1, 'super-admin', 'company_kyc_detail', '16', 4, 'employer', '49.43.2.72', '2023-09-05 09:54:04'),
(428, 1, 'super-admin', 'company_kyc_detail', '16', 4, 'employer', '49.43.2.72', '2023-09-05 09:54:04'),
(429, 1, 'super-admin', 'company_kyc_detail', '16', 4, 'employer', '49.43.2.72', '2023-09-05 09:54:05'),
(430, 1, 'super-admin', 'company_kyc_detail', '16', 4, 'employer', '49.43.2.72', '2023-09-05 09:54:06'),
(431, 1, 'super-admin', 'company_kyc_detail', '16', 4, 'employer', '49.43.2.72', '2023-09-05 09:54:07'),
(432, 1, 'super-admin', 'company_kyc_detail', '16', 4, 'employer', '49.43.2.72', '2023-09-05 09:54:07'),
(433, 1, 'super-admin', 'company_kyc_detail', '16', 4, 'employer', '49.43.2.72', '2023-09-05 09:54:08'),
(434, 1, 'super-admin', 'company_kyc_detail', '16', 4, 'employer', '49.43.2.72', '2023-09-05 09:54:08'),
(435, 1, 'super-admin', 'company_kyc_detail', '16', 4, 'employer', '49.43.2.72', '2023-09-05 09:54:08'),
(436, 1, 'super-admin', 'company_kyc_detail', '16', 4, 'employer', '49.43.2.72', '2023-09-05 09:54:08'),
(437, 1, 'super-admin', 'company_detail', '12', 4, 'employer', '49.43.2.72', '2023-09-05 10:00:10'),
(438, 1, 'super-admin', 'company_detail', '12', 4, 'employer', '49.43.2.72', '2023-09-05 10:01:06'),
(439, 1, 'super-admin', 'company_detail', '12', 3, 'employer', '49.43.2.72', '2023-09-05 10:02:14'),
(440, 1, 'super-admin', 'company_detail', '12', 3, 'employer', '49.43.2.72', '2023-09-05 10:02:23'),
(441, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:05:25'),
(442, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:05:33'),
(443, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:05:36'),
(444, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:05:38'),
(445, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:05:40'),
(446, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:05:41'),
(447, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:12:28'),
(448, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:12:30'),
(449, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:12:32'),
(450, 1, 'super-admin', 'applyJob', '20', 36, 'apply_on_job', '49.43.2.72', '2023-09-05 10:15:29'),
(451, 1, 'super-admin', 'applyJob', '20', 37, 'apply_on_job', '49.43.2.72', '2023-09-05 10:15:35'),
(452, 1, 'super-admin', 'applyJob', '20', 38, 'apply_on_job', '49.43.2.72', '2023-09-05 10:16:16'),
(453, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.72', '2023-09-05 10:19:31'),
(454, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.72', '2023-09-05 10:19:40'),
(455, 1, 'super-admin', 'company/documentsUpload', '24', 3, 'employer', '49.43.2.72', '2023-09-05 10:23:21'),
(456, 1, 'super-admin', 'company/documentsUpload', '24', 3, 'employer', '49.43.2.72', '2023-09-05 10:24:16'),
(457, 1, 'super-admin', 'company/documentsUpload', '25', 3, 'employer', '49.43.2.72', '2023-09-05 10:25:41'),
(458, 1, 'super-admin', 'company/documentsUpload', '25', 3, 'employer', '49.43.2.72', '2023-09-05 10:25:48'),
(459, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:32:14'),
(460, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:32:52'),
(461, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:32:52'),
(462, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:33:40'),
(463, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:33:44'),
(464, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:33:44'),
(465, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:33:50'),
(466, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:33:53'),
(467, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:33:56'),
(468, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:33:59'),
(469, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:01'),
(470, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:03'),
(471, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:06'),
(472, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:08'),
(473, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:10'),
(474, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:12'),
(475, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:12'),
(476, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:12'),
(477, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:12'),
(478, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:17'),
(479, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:18'),
(480, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:20');
INSERT INTO `activity_log` (`id`, `user_id`, `user_type`, `request_api`, `status`, `action_id`, `action_type`, `ip_address`, `created_at`) VALUES
(481, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:22'),
(482, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:24'),
(483, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:24'),
(484, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:31'),
(485, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:31'),
(486, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:34'),
(487, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:36'),
(488, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:36'),
(489, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:38'),
(490, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.2.72', '2023-09-05 10:34:41'),
(491, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:44:05'),
(492, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:44:07'),
(493, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 10:44:13'),
(494, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 10:44:16'),
(495, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 10:45:00'),
(496, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:45:01'),
(497, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 10:45:02'),
(498, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 10:45:05'),
(499, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 10:45:08'),
(500, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 10:45:09'),
(501, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 10:45:23'),
(502, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 10:45:40'),
(503, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:48:53'),
(504, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:48:54'),
(505, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:48:56'),
(506, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 10:48:57'),
(507, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:01:24'),
(508, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:01:27'),
(509, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:01:28'),
(510, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:01:30'),
(511, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:01:41'),
(512, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:01:43'),
(513, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:01:45'),
(514, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:01:47'),
(515, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:01:50'),
(516, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:16'),
(517, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:19'),
(518, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:23'),
(519, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:24'),
(520, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:24'),
(521, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:26'),
(522, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:27'),
(523, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:43'),
(524, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:44'),
(525, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:48'),
(526, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:49'),
(527, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:53'),
(528, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:54'),
(529, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:04:55'),
(530, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:05:01'),
(531, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:05:02'),
(532, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:05:04'),
(533, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:05:05'),
(534, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:05:06'),
(535, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:05:07'),
(536, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:05:08'),
(537, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.72', '2023-09-05 11:06:42'),
(538, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:08:56'),
(539, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:09:11'),
(540, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.72', '2023-09-05 11:09:13'),
(541, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:09:36'),
(542, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:09:38'),
(543, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:09:40'),
(544, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:09:41'),
(545, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:09:42'),
(546, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:09:44'),
(547, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.72', '2023-09-05 11:09:45'),
(548, 1, 'super-admin', 'addUpdateVisa', '10', 25, 'employee', '49.43.2.72', '2023-09-05 11:09:59'),
(549, 1, 'super-admin', 'admin/addUpdateLmia', '23', 15, 'lmia', '49.43.2.72', '2023-09-05 11:09:59'),
(550, 1, 'super-admin', 'employeePersonal_detail', '1', 19, 'employee', '49.43.2.72', '2023-09-05 11:12:01'),
(551, 1, 'super-admin', 'employeeCareer_detail', '6', 25, 'employee', '49.43.2.72', '2023-09-05 11:19:04'),
(552, 1, 'super-admin', 'employeeCareer_detail', '6', 25, 'employee', '49.43.2.72', '2023-09-05 11:19:14'),
(553, 1, 'super-admin', 'employeeEducation_detail', '4', 25, 'employee', '49.43.2.72', '2023-09-05 11:19:37'),
(554, 1, 'super-admin', 'admin/addUpdateInterview', '21', 36, 'apply_on_job', '49.43.2.72', '2023-09-05 11:21:42'),
(555, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 15, 'lmia', '49.43.2.72', '2023-09-05 11:21:46'),
(556, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 15, 'lmia', '49.43.2.72', '2023-09-05 11:21:46'),
(557, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 15, 'lmia', '49.43.2.72', '2023-09-05 11:21:48'),
(558, 1, 'super-admin', 'admin/addUpdateLmia', '22', 15, 'lmia', '49.43.2.72', '2023-09-05 11:21:51'),
(559, 1, 'super-admin', 'applyJob', '19', 36, 'apply_on_job', '49.43.2.72', '2023-09-05 11:21:59'),
(560, 1, 'super-admin', 'applyJob', '19', 36, 'apply_on_job', '49.43.2.72', '2023-09-05 11:22:05'),
(561, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.2.72', '2023-09-05 11:30:31'),
(562, 1, 'super-admin', 'admin/addCategory', '33', NULL, 'employee', '49.43.2.72', '2023-09-05 11:41:58'),
(563, 1, 'super-admin', 'applyJob', '20', 39, 'apply_on_job', '152.58.25.255', '2023-09-05 17:05:06'),
(564, 1, 'super-admin', 'applyJob', '20', 40, 'apply_on_job', '152.58.25.255', '2023-09-05 17:05:53'),
(565, 1, 'super-admin', 'applyJob', '20', 41, 'apply_on_job', '152.58.25.255', '2023-09-05 17:05:58'),
(566, 1, 'super-admin', 'applyJob', '20', 42, 'apply_on_job', '152.58.25.255', '2023-09-05 17:06:00'),
(567, 1, 'super-admin', 'user/documentsUpload', '8', 21, 'employee', '152.58.25.255', '2023-09-05 17:19:19'),
(568, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '152.58.25.255', '2023-09-05 17:27:34'),
(569, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '152.58.25.255', '2023-09-05 17:27:42'),
(570, 1, 'super-admin', 'addUpdateVisa', '10', 19, 'employee', '152.58.25.255', '2023-09-05 17:33:02'),
(571, 1, 'super-admin', 'admin/addUpdateLmia', '23', 16, 'lmia', '152.58.25.255', '2023-09-05 17:33:02'),
(572, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 04:08:39'),
(573, 1, 'super-admin', 'admin/addCategory', '33', NULL, 'employee', '49.43.2.204', '2023-09-06 04:22:35'),
(574, 1, 'super-admin', 'admin/addCategory', '33', NULL, 'employee', '49.43.2.204', '2023-09-06 04:22:53'),
(575, 1, 'super-admin', 'admin/addCategory', '33', NULL, 'employee', '49.43.2.204', '2023-09-06 04:23:03'),
(576, 1, 'super-admin', 'admin/addCategory', '33', NULL, 'employee', '49.43.2.204', '2023-09-06 04:23:13'),
(577, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '49.43.2.204', '2023-09-06 05:07:36'),
(578, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 2, 'jobs', '49.43.2.204', '2023-09-06 05:07:40'),
(579, 1, 'super-admin', 'addJobs', '17', 2, 'jobs', '49.43.2.204', '2023-09-06 05:07:44'),
(580, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.2.204', '2023-09-06 05:10:18'),
(581, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.2.204', '2023-09-06 05:10:18'),
(582, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.2.204', '2023-09-06 05:10:19'),
(583, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.2.204', '2023-09-06 05:10:20'),
(584, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.2.204', '2023-09-06 05:10:20'),
(585, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.2.204', '2023-09-06 05:10:21'),
(586, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 2, 'jobs', '49.43.2.204', '2023-09-06 05:10:21'),
(587, 1, 'super-admin', 'addJobs', '17', 2, 'jobs', '49.43.2.204', '2023-09-06 05:10:26'),
(588, 1, 'super-admin', 'applyJob', '20', 43, 'apply_on_job', '49.43.2.204', '2023-09-06 06:59:42'),
(589, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 08:30:03'),
(590, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 08:30:06'),
(591, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 08:30:08'),
(592, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 08:30:11'),
(593, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.204', '2023-09-06 08:31:46'),
(594, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:22:50'),
(595, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.204', '2023-09-06 09:22:57'),
(596, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.204', '2023-09-06 09:23:10'),
(597, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.204', '2023-09-06 09:23:16'),
(598, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.204', '2023-09-06 09:26:16'),
(599, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:26:49'),
(600, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:26:50'),
(601, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:26:52'),
(602, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:27:49'),
(603, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:27:50'),
(604, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:27:51'),
(605, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:27:52'),
(606, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:27:53'),
(607, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:27:55'),
(608, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:27:56'),
(609, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:27:57'),
(610, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:29:31'),
(611, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:29:33'),
(612, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:29:34'),
(613, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:20'),
(614, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:21'),
(615, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:22'),
(616, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:23'),
(617, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:23'),
(618, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:24'),
(619, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:24'),
(620, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:25'),
(621, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:40'),
(622, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:40'),
(623, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:41'),
(624, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:53'),
(625, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:54'),
(626, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:56'),
(627, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:57'),
(628, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:57'),
(629, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:31:58'),
(630, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:32:53'),
(631, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:33:06'),
(632, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '29', 1, 'jobs', '49.43.2.204', '2023-09-06 09:33:07'),
(633, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.204', '2023-09-06 09:45:30'),
(634, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.204', '2023-09-06 09:45:30'),
(635, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.204', '2023-09-06 09:45:31'),
(636, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.204', '2023-09-06 09:45:32'),
(637, 1, 'super-admin', 'addUpdateLmiaSubstagesJob', '28', 1, 'jobs', '49.43.2.204', '2023-09-06 09:45:32'),
(638, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.2.204', '2023-09-06 09:45:43'),
(639, 1, 'super-admin', 'addUpdateVisa', '11', 21, 'employee', '49.43.2.204', '2023-09-06 11:56:15'),
(640, 1, 'super-admin', 'addUpdateVisa', '11', 21, 'employee', '49.43.2.204', '2023-09-06 11:59:36'),
(641, 1, 'super-admin', 'applyJob', '20', 1, 'apply_on_job', '49.43.2.204', '2023-09-06 12:18:46'),
(642, 1, 'super-admin', 'applyJob', '20', 2, 'apply_on_job', '49.43.2.204', '2023-09-06 12:18:48'),
(643, 1, 'super-admin', 'applyJob', '20', 3, 'apply_on_job', '49.43.2.204', '2023-09-06 12:18:50'),
(644, 1, 'super-admin', 'applyJob', '20', 4, 'apply_on_job', '49.43.2.204', '2023-09-06 12:18:51'),
(645, 1, 'super-admin', 'addUpdateVisa', '10', 18, 'employee', '49.43.2.204', '2023-09-06 12:19:12'),
(646, 1, 'super-admin', 'admin/addUpdateLmia', '23', 17, 'lmia', '49.43.2.204', '2023-09-06 12:19:12'),
(647, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.2.204', '2023-09-06 12:19:16'),
(648, 1, 'super-admin', 'addUpdateVisa', '10', 8, 'employee', '49.43.2.204', '2023-09-06 12:28:56'),
(649, 1, 'super-admin', 'admin/addUpdateLmia', '23', 18, 'lmia', '49.43.2.204', '2023-09-06 12:28:56'),
(650, 1, 'super-admin', 'addUpdateVisa', '11', 8, 'employee', '49.43.2.204', '2023-09-06 12:29:03'),
(651, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.2.204', '2023-09-06 12:30:17'),
(652, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.2.204', '2023-09-06 12:32:09'),
(653, 1, 'super-admin', 'addUpdateVisa', '10', 4, 'employee', '49.43.2.204', '2023-09-06 12:33:00'),
(654, 1, 'super-admin', 'admin/addUpdateLmia', '23', 19, 'lmia', '49.43.2.204', '2023-09-06 12:33:00'),
(655, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.2.204', '2023-09-06 12:33:28'),
(656, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.2.204', '2023-09-06 12:33:51'),
(657, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.2.204', '2023-09-06 12:34:32'),
(658, 1, 'super-admin', 'admin/addUpdateLmia', '23', 20, 'lmia', '49.43.2.204', '2023-09-06 12:34:32'),
(659, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.0.235', '2023-09-07 05:10:53'),
(660, 1, 'super-admin', 'admin/addUpdateLmia', '23', 21, 'lmia', '49.43.0.235', '2023-09-07 05:10:53'),
(661, 1, 'super-admin', 'addUpdateVisa', '11', 8, 'employee', '49.43.0.235', '2023-09-07 05:10:54'),
(662, 1, 'super-admin', 'admin/addUpdateLmia', '23', 22, 'lmia', '49.43.0.235', '2023-09-07 05:10:55'),
(663, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.0.235', '2023-09-07 05:11:01'),
(664, 1, 'super-admin', 'admin/addUpdateLmia', '23', 23, 'lmia', '49.43.0.235', '2023-09-07 05:11:01'),
(665, 1, 'super-admin', 'addUpdateVisa', '11', 8, 'employee', '49.43.0.235', '2023-09-07 05:11:02'),
(666, 1, 'super-admin', 'admin/addUpdateLmia', '23', 24, 'lmia', '49.43.0.235', '2023-09-07 05:11:02'),
(667, 1, 'super-admin', 'addUpdateVisa', '10', 4, 'employee', '49.43.0.235', '2023-09-07 05:11:04'),
(668, 1, 'super-admin', 'admin/addUpdateLmia', '23', 25, 'lmia', '49.43.0.235', '2023-09-07 05:11:04'),
(669, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.0.235', '2023-09-07 05:11:05'),
(670, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.0.235', '2023-09-07 05:11:39'),
(671, 1, 'super-admin', 'admin/addUpdateLmia', '23', 26, 'lmia', '49.43.0.235', '2023-09-07 05:11:39'),
(672, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.0.235', '2023-09-07 05:11:46'),
(673, 1, 'super-admin', 'admin/addUpdateLmia', '23', 27, 'lmia', '49.43.0.235', '2023-09-07 05:11:46'),
(674, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.0.235', '2023-09-07 05:11:52'),
(675, 1, 'super-admin', 'admin/addUpdateLmia', '23', 28, 'lmia', '49.43.0.235', '2023-09-07 05:11:52'),
(676, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.0.235', '2023-09-07 05:12:01'),
(677, 1, 'super-admin', 'admin/addUpdateLmia', '23', 29, 'lmia', '49.43.0.235', '2023-09-07 05:12:01'),
(678, 1, 'super-admin', 'addUpdateVisa', '11', 8, 'employee', '49.43.0.235', '2023-09-07 05:12:03'),
(679, 1, 'super-admin', 'admin/addUpdateLmia', '23', 30, 'lmia', '49.43.0.235', '2023-09-07 05:12:03'),
(680, 1, 'super-admin', 'addUpdateVisa', '10', 4, 'employee', '49.43.0.235', '2023-09-07 05:12:04'),
(681, 1, 'super-admin', 'admin/addUpdateLmia', '23', 31, 'lmia', '49.43.0.235', '2023-09-07 05:12:04'),
(682, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.0.235', '2023-09-07 05:12:05'),
(683, 1, 'super-admin', 'admin/addUpdateLmia', '23', 32, 'lmia', '49.43.0.235', '2023-09-07 05:12:05'),
(684, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.0.235', '2023-09-07 05:14:20'),
(685, 1, 'super-admin', 'admin/addUpdateLmia', '23', 33, 'lmia', '49.43.0.235', '2023-09-07 05:14:20'),
(686, 1, 'super-admin', 'addUpdateVisa', '11', 8, 'employee', '49.43.0.235', '2023-09-07 05:14:23'),
(687, 1, 'super-admin', 'admin/addUpdateLmia', '23', 34, 'lmia', '49.43.0.235', '2023-09-07 05:14:23'),
(688, 1, 'super-admin', 'addUpdateVisa', '10', 4, 'employee', '49.43.0.235', '2023-09-07 05:14:25'),
(689, 1, 'super-admin', 'admin/addUpdateLmia', '23', 35, 'lmia', '49.43.0.235', '2023-09-07 05:14:25'),
(690, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.0.235', '2023-09-07 05:14:27'),
(691, 1, 'super-admin', 'admin/addUpdateLmia', '23', 36, 'lmia', '49.43.0.235', '2023-09-07 05:14:27'),
(692, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.0.235', '2023-09-07 10:21:49'),
(693, 1, 'super-admin', 'admin/addUpdateLmia', '23', 37, 'lmia', '49.43.0.235', '2023-09-07 10:21:49'),
(694, 1, 'super-admin', 'addUpdateVisa', '11', 18, 'employee', '49.43.0.235', '2023-09-07 10:23:07'),
(695, 1, 'super-admin', 'admin/addUpdateLmia', '23', 38, 'lmia', '49.43.0.235', '2023-09-07 10:23:07'),
(696, 1, 'super-admin', 'admin/addUpdateLmia', '22', 38, 'lmia', '208.98.252.186', '2023-09-07 22:32:07'),
(697, 1, 'super-admin', 'employeePersonal_detail', '1', 21, 'employee', '49.43.5.93', '2023-09-08 04:26:29'),
(698, NULL, NULL, 'admin/addUpdateLmia', '23', 1, 'lmia', '49.43.5.93', '2023-09-08 08:31:54'),
(699, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 1, 'lmia', '49.43.5.93', '2023-09-08 08:35:23'),
(700, 1, 'super-admin', 'admin/addUpdateLmia', '22', 1, 'lmia', '49.43.5.93', '2023-09-08 08:40:35'),
(701, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 1, 'lmia', '49.43.5.93', '2023-09-08 08:40:41'),
(702, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.5.93', '2023-09-08 08:40:42'),
(703, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.5.93', '2023-09-08 08:40:45'),
(704, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '27', 1, 'lmia', '49.43.5.93', '2023-09-08 08:40:54'),
(705, 1, 'super-admin', 'addUpdateVisa', '11', 8, 'employee', '49.43.5.93', '2023-09-08 08:46:36'),
(706, 1, 'super-admin', 'admin/addUpdateLmia', '23', NULL, 'lmia', '49.43.5.93', '2023-09-08 08:46:36'),
(707, 1, 'super-admin', 'addUpdateVisa', '10', 4, 'employee', '49.43.5.93', '2023-09-08 08:49:40'),
(708, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.5.93', '2023-09-08 08:53:08'),
(709, 1, 'super-admin', 'admin/addUpdateLmia', '22', NULL, 'lmia', '49.43.5.93', '2023-09-08 08:53:08'),
(710, 1, 'super-admin', 'addUpdateVisa', '10', 18, 'employee', '49.43.5.93', '2023-09-08 08:59:12'),
(711, 1, 'super-admin', 'admin/addUpdateLmia', '23', NULL, 'lmia', '49.43.5.93', '2023-09-08 08:59:12'),
(712, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.5.93', '2023-09-08 09:12:58'),
(713, 1, 'super-admin', 'admin/addUpdateLmia', '23', NULL, 'lmia', '49.43.5.93', '2023-09-08 09:12:58'),
(714, 1, 'super-admin', 'addUpdateVisa', '10', 4, 'employee', '49.43.5.93', '2023-09-08 09:13:00'),
(715, 1, 'super-admin', 'admin/addUpdateLmia', '23', NULL, 'lmia', '49.43.5.93', '2023-09-08 09:13:00'),
(716, 1, 'super-admin', 'admin/addUpdateLmia', '22', NULL, 'lmia', '49.43.5.93', '2023-09-08 09:20:35'),
(717, 1, 'super-admin', 'admin/addUpdateLmia', '22', 1, 'lmia', '49.43.5.93', '2023-09-08 09:28:24'),
(718, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 1, 'lmia', '49.43.5.93', '2023-09-08 09:28:29'),
(719, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 1, 'lmia', '49.43.5.93', '2023-09-08 09:28:30'),
(720, 1, 'super-admin', 'applyJob', '20', 5, 'apply_on_job', '49.43.5.93', '2023-09-08 09:28:46'),
(721, 1, 'super-admin', 'applyJob', '20', 6, 'apply_on_job', '49.43.5.93', '2023-09-08 09:28:49'),
(722, 1, 'super-admin', 'applyJob', '20', 7, 'apply_on_job', '49.43.5.93', '2023-09-08 09:28:51'),
(723, 1, 'super-admin', 'applyJob', '20', 8, 'apply_on_job', '49.43.5.93', '2023-09-08 09:28:56'),
(724, 1, 'super-admin', 'addUpdateVisa', '10', 8, 'employee', '49.43.5.93', '2023-09-08 09:29:09'),
(725, 1, 'super-admin', 'admin/addUpdateLmia', '23', 4, 'lmia', '49.43.5.93', '2023-09-08 09:29:10'),
(726, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.5.93', '2023-09-08 09:30:00'),
(727, 1, 'super-admin', 'addJobs', '17', 1, 'jobs', '49.43.5.93', '2023-09-08 09:30:06'),
(728, 1, 'super-admin', 'applyJob', '20', 1, 'apply_on_job', '49.43.5.93', '2023-09-08 10:35:06'),
(729, 1, 'super-admin', 'applyJob', '20', 2, 'apply_on_job', '49.43.5.93', '2023-09-08 10:35:09'),
(730, 1, 'super-admin', 'applyJob', '20', 3, 'apply_on_job', '49.43.5.93', '2023-09-08 10:35:12'),
(731, 1, 'super-admin', 'applyJob', '20', 4, 'apply_on_job', '49.43.5.93', '2023-09-08 10:35:14'),
(732, 1, 'super-admin', 'applyJob', '20', 5, 'apply_on_job', '49.43.5.93', '2023-09-08 10:35:18'),
(733, 1, 'super-admin', 'applyJob', '20', 6, 'apply_on_job', '49.43.5.93', '2023-09-08 10:35:23'),
(734, 1, 'super-admin', 'addUpdateVisa', '11', 3, 'employee', '49.43.5.93', '2023-09-08 10:35:32'),
(735, 1, 'super-admin', 'addUpdateVisa', '11', 8, 'employee', '49.43.5.93', '2023-09-08 10:35:43'),
(736, 1, 'super-admin', 'applyJob', '20', 1, 'apply_on_job', '49.43.5.93', '2023-09-08 10:40:06'),
(737, 1, 'super-admin', 'applyJob', '20', 2, 'apply_on_job', '49.43.5.93', '2023-09-08 10:40:08'),
(738, 1, 'super-admin', 'applyJob', '20', 3, 'apply_on_job', '49.43.5.93', '2023-09-08 10:40:11'),
(739, 1, 'super-admin', 'addUpdateVisa', '10', 3, 'employee', '49.43.5.93', '2023-09-08 10:40:21'),
(740, 1, 'super-admin', 'admin/addUpdateLmia', '23', 1, 'lmia', '49.43.5.93', '2023-09-08 10:40:21'),
(741, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 1, 'lmia', '49.43.5.93', '2023-09-08 10:42:29'),
(742, 1, 'super-admin', 'addUpdateLmiaSubstagesEmployee', '26', 1, 'lmia', '49.43.5.93', '2023-09-08 10:42:32'),
(743, 1, 'super-admin', 'applyJob', '20', 4, 'apply_on_job', '49.43.5.93', '2023-09-08 11:47:31'),
(744, 1, 'super-admin', 'applyJob', '20', 5, 'apply_on_job', '49.43.5.93', '2023-09-08 11:47:34'),
(745, 1, 'super-admin', 'applyJob', '20', 6, 'apply_on_job', '49.43.5.93', '2023-09-08 11:47:40'),
(746, 1, 'super-admin', 'addUpdateVisa', '10', 8, 'employee', '49.43.5.93', '2023-09-08 11:48:23'),
(747, 1, 'super-admin', 'admin/addUpdateLmia', '23', 2, 'lmia', '49.43.5.93', '2023-09-08 11:48:23'),
(748, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.5.93', '2023-09-08 12:50:50'),
(749, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.5.93', '2023-09-08 12:50:57'),
(750, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.5.93', '2023-09-08 12:51:03'),
(751, 1, 'super-admin', 'company_kyc_detail', '16', 2, 'employer', '49.43.5.93', '2023-09-08 12:51:20'),
(752, 1, 'super-admin', 'company_kyc_detail', '16', 2, 'employer', '49.43.5.93', '2023-09-08 12:51:22'),
(753, 1, 'super-admin', 'company_kyc_detail', '16', 2, 'employer', '49.43.5.93', '2023-09-08 12:51:24'),
(754, 1, 'super-admin', 'company_kyc_detail', '16', 2, 'employer', '49.43.5.93', '2023-09-08 12:51:24'),
(755, 1, 'super-admin', 'company_kyc_detail', '16', 2, 'employer', '49.43.5.93', '2023-09-08 12:51:26'),
(756, 1, 'super-admin', 'company_kyc_detail', '16', 2, 'employer', '49.43.5.93', '2023-09-08 12:51:27'),
(757, 1, 'super-admin', 'company_kyc_detail', '16', 2, 'employer', '49.43.5.93', '2023-09-08 12:51:30'),
(758, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.5.93', '2023-09-08 12:51:59'),
(759, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.5.93', '2023-09-08 12:52:05'),
(760, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.5.93', '2023-09-08 12:52:11'),
(761, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.5.93', '2023-09-08 12:52:17'),
(762, 1, 'super-admin', 'company_kyc_detail', '16', 1, 'employer', '49.43.5.93', '2023-09-08 12:52:17'),
(763, 1, 'super-admin', 'applyJob', '20', 7, 'apply_on_job', '49.43.2.197', '2023-09-09 05:04:11'),
(764, 1, 'super-admin', 'applyJob', '20', 8, 'apply_on_job', '49.43.2.197', '2023-09-09 05:04:14'),
(765, 1, 'super-admin', 'applyJob', '20', 9, 'apply_on_job', '49.43.2.197', '2023-09-09 05:04:15'),
(766, 1, 'super-admin', 'applyJob', '20', 10, 'apply_on_job', '49.43.2.197', '2023-09-09 05:04:22'),
(767, 1, 'super-admin', 'applyJob', '20', 11, 'apply_on_job', '49.43.2.197', '2023-09-09 05:04:25'),
(768, 1, 'super-admin', 'applyJob', '20', 12, 'apply_on_job', '49.43.2.197', '2023-09-09 05:04:29'),
(769, 1, 'super-admin', 'addUpdateVisa', '10', 4, 'employee', '49.43.2.197', '2023-09-09 05:06:31'),
(770, 1, 'super-admin', 'admin/addUpdateLmia', '23', 3, 'lmia', '49.43.2.197', '2023-09-09 05:06:32'),
(771, 1, 'super-admin', 'applyJob', '20', 13, 'apply_on_job', '49.43.2.197', '2023-09-09 05:15:02'),
(772, 1, 'super-admin', 'applyJob', '20', 14, 'apply_on_job', '49.43.2.197', '2023-09-09 05:15:09'),
(773, 1, 'super-admin', 'applyJob', '20', 15, 'apply_on_job', '49.43.2.197', '2023-09-09 05:15:17'),
(774, 1, 'super-admin', 'applyJob', '20', 16, 'apply_on_job', '49.43.2.197', '2023-09-09 05:15:55'),
(775, 1, 'super-admin', 'applyJob', '20', 17, 'apply_on_job', '49.43.2.197', '2023-09-09 05:16:00'),
(776, 1, 'super-admin', 'applyJob', '20', 18, 'apply_on_job', '49.43.2.197', '2023-09-09 05:29:34'),
(777, 1, 'super-admin', 'applyJob', '20', 19, 'apply_on_job', '49.43.2.197', '2023-09-09 05:29:36'),
(778, 1, 'super-admin', 'applyJob', '20', 20, 'apply_on_job', '49.43.2.197', '2023-09-09 05:29:45'),
(779, 1, 'super-admin', 'applyJob', '20', 21, 'apply_on_job', '49.43.2.197', '2023-09-09 05:29:52'),
(780, 1, 'super-admin', 'applyJob', '20', 22, 'apply_on_job', '49.43.2.197', '2023-09-09 05:36:26'),
(781, 1, 'super-admin', 'applyJob', '20', 23, 'apply_on_job', '49.43.2.197', '2023-09-09 05:36:29'),
(782, 1, 'super-admin', 'applyJob', '20', 24, 'apply_on_job', '49.43.2.197', '2023-09-09 05:36:37'),
(783, 1, 'super-admin', 'addUpdateVisa', '11', 4, 'employee', '49.43.2.197', '2023-09-09 06:00:37'),
(784, 1, 'super-admin', 'addUpdateVisa', '10', 19, 'employee', '49.43.2.197', '2023-09-09 06:01:01'),
(785, 1, 'super-admin', 'admin/addUpdateLmia', '23', 4, 'lmia', '49.43.2.197', '2023-09-09 06:01:01'),
(786, 1, 'super-admin', 'addUpdateVisa', '10', 10, 'employee', '49.43.2.197', '2023-09-09 08:29:56'),
(787, 1, 'super-admin', 'admin/addUpdateLmia', '23', 5, 'lmia', '49.43.2.197', '2023-09-09 08:29:56'),
(788, 1, 'super-admin', 'addUpdateVisa', '11', 19, 'employee', '49.43.2.197', '2023-09-09 08:30:11'),
(789, 1, 'super-admin', 'applyJob', '20', 25, 'apply_on_job', '49.43.2.197', '2023-09-09 08:35:46'),
(790, 1, 'super-admin', 'addUpdateVisa', '11', 19, 'employee', '49.43.2.197', '2023-09-09 08:36:02'),
(791, 1, 'super-admin', 'addUpdateVisa', '10', 19, 'employee', '49.43.2.197', '2023-09-09 09:18:03'),
(792, 1, 'super-admin', 'admin/addUpdateLmia', '23', 1, 'lmia', '49.43.2.197', '2023-09-09 09:18:03'),
(793, 1, 'super-admin', 'addUpdateVisa', '10', 18, 'employee', '49.43.2.197', '2023-09-09 09:18:06'),
(794, 1, 'super-admin', 'admin/addUpdateLmia', '23', 2, 'lmia', '49.43.2.197', '2023-09-09 09:18:06'),
(795, 1, 'super-admin', 'addUpdateVisa', '11', 19, 'employee', '49.43.2.197', '2023-09-09 09:18:10'),
(796, 1, 'super-admin', 'addUpdateVisa', '11', 19, 'employee', '49.43.2.197', '2023-09-09 09:18:26'),
(797, 1, 'super-admin', 'addJobs', '18', 18, 'jobs', '49.43.0.127', '2023-09-11 05:08:40'),
(798, 23, 'manager', 'company_detail', '13', NULL, 'employer', '49.43.5.119', '2023-09-12 05:07:03'),
(799, 23, 'manager', 'company/documentsUpload', '24', 10, 'employer', '49.43.5.119', '2023-09-12 05:07:18'),
(800, 23, 'manager', 'company/documentsUpload', '24', 10, 'employer', '49.43.5.119', '2023-09-12 05:07:26'),
(801, 1, 'super-admin', 'company/documentsUpload', '24', 1, 'employer', '49.43.5.119', '2023-09-12 05:40:41'),
(802, 1, 'super-admin', 'user/documentsUpload', '8', 3, 'employee', '49.43.5.119', '2023-09-12 05:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` bigint(20) NOT NULL,
  `email` varchar(251) NOT NULL,
  `password` varchar(301) NOT NULL,
  `name` text,
  `contact_no` bigint(21) DEFAULT NULL,
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `admin_type` varchar(251) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `profile_image` varchar(151) DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email_permission` tinyint(1) NOT NULL DEFAULT '1',
  `token` varchar(151) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`, `name`, `contact_no`, `parent_id`, `admin_type`, `is_active`, `profile_image`, `is_deleted`, `created_at`, `updated_at`, `email_permission`, `token`) VALUES
(1, 'raj.we2code@gmail.com', 'c13b1fd8824c5577074601c325503a9a', 'raj', NULL, 0, 'super-admin', 1, NULL, 0, '2023-05-19 06:40:51', '2023-08-03 11:45:47', 1, ''),
(8, 'ram@gmail.com', 'b7d6954a2c8c9d45ee8c26d96f0b5570', 'Ram', NULL, 0, 'manager', 1, NULL, 1, '2023-08-04 04:42:40', '2023-08-26 06:37:15', 1, ''),
(9, 'piku12@gmail.com', '9d07001aeffb741471a25c5a92ecebfa', 'piku', NULL, 0, 'admin', 1, NULL, 1, '2023-08-08 06:25:11', '2023-08-11 12:46:21', 1, ''),
(10, 'rSSaj.we2code@gmail.com', 'bc12ce68e66324ff3b6b2010a55218cd', 'SSS', NULL, 0, 'super-admin', 1, NULL, 1, '2023-08-26 06:37:24', '2023-08-26 06:37:24', 1, ''),
(11, 'g.choudhary.we2code@gmail.com', '1409db4b6d1ec9f083528315c9bb4560', 'Gourav choudary', NULL, 17, 'executive', 1, NULL, 0, '2023-09-07 06:39:26', '2023-09-11 11:29:31', 1, ''),
(12, 'nidhi.we2code@gmail.com', '97eef96c36bbe8ef38bbca3a7a176718', 'Nidhi', NULL, 16, 'executive', 1, NULL, 0, '2023-09-07 07:28:58', '2023-09-11 11:23:59', 1, ''),
(13, 'anmol@gmail.com', '358a09e62f84bf90cdbb6b4994d3bf72', 'Anmol', NULL, 16, 'executive', 1, NULL, 0, '2023-09-08 06:19:08', '2023-09-11 11:52:50', 1, ''),
(14, 'Shivam7000@gmail.com', 'c264680c1b7c2b89a673260e255d923f', 'Shivam thakur', 9874102563, 0, 'manager', 1, NULL, 0, '2023-09-08 10:56:59', '2023-09-09 09:22:36', 1, ''),
(15, 'ram@gmail.com', '7d644cb3c6d3e1b13215c78293d70c78', 'ram', NULL, 0, 'manager', 1, NULL, 0, '2023-09-09 06:06:13', '2023-09-09 06:06:13', 1, ''),
(16, 'aashi.we2code@gmail.com', 'f33244fee1c937af6e46cbcf70a0e302', 'Aashi vyas', 9685741230, 0, 'manager', 1, NULL, 0, '2023-09-09 09:19:11', '2023-09-09 09:24:44', 1, ''),
(17, 'anu@gmail.com', 'd1878c3216d17a6820e31b868534246f', 'Anuhsree', 9685741230, 0, 'manager', 1, NULL, 0, '2023-09-09 09:25:46', '2023-09-09 09:25:46', 1, ''),
(18, 'xyz@gmail.com', 'dc02c947d1b6c77047f17e5f01ea39ed', 'xyz', 8741259630, 16, 'executive', 1, NULL, 0, '2023-09-11 06:29:09', '2023-09-11 11:29:27', 1, ''),
(19, 'dasfsdf@gmail.com', 'a7e8aaa6751f2734df3a86da79e5ab49', 'sdfs', 4444444546, 16, 'executive', 1, NULL, 0, '2023-09-11 06:30:57', '2023-09-11 11:31:50', 1, ''),
(20, 'hfhffghg@gmail.com', '66c29c2d479c3ae1fb8131d6bda5d060', 'ghdfh', 5555555555, 16, 'executive', 1, 'https://apnaorganicstore.in/canjobs/uploads/1694425675.png', 0, '2023-09-11 06:33:34', '2023-09-11 11:24:02', 1, ''),
(21, 'ra34324de@gmail.com', '8e7cd914131e0e436b6fff60defbcaf3', 'sdasd', 2131243254, 0, 'admin', 1, 'https://apnaorganicstore.in/canjobs/uploads/1694423333.jpeg', 0, '2023-09-11 06:57:29', '2023-09-11 09:36:21', 1, ''),
(22, 'dsfsdf@gmail.com', '8bac9ee50ab60edf127ac9ad57ad9e70', 'sdsf', 2222222222, 16, 'executive', 1, 'https://apnaorganicstore.in/canjobs/uploads/1694425728.jpeg', 0, '2023-09-11 09:48:29', '2023-09-11 11:31:51', 1, ''),
(23, 'Rupali@gmail.com', 'f33244fee1c937af6e46cbcf70a0e302', 'Rupali', 5478963210, 0, 'manager', 1, 'https://apnaorganicstore.in/canjobs/uploads/1694495148.jpeg', 0, '2023-09-12 05:05:48', '2023-09-12 05:05:48', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `apply_on_job`
--

CREATE TABLE `apply_on_job` (
  `apply_id` int(101) NOT NULL,
  `job_id` int(101) NOT NULL,
  `employee_id` int(101) NOT NULL,
  `is_viewed` smallint(11) NOT NULL DEFAULT '1',
  `is_reserve` smallint(6) NOT NULL DEFAULT '0',
  `apply_by_admin_id` smallint(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='apply job = 0, view job = 1, connect job = 2, save job = 3';

--
-- Dumping data for table `apply_on_job`
--

INSERT INTO `apply_on_job` (`apply_id`, `job_id`, `employee_id`, `is_viewed`, `is_reserve`, `apply_by_admin_id`, `created_at`, `updated_at`) VALUES
(6, 20, 8, 0, 0, 1, '2023-09-08 11:47:40', '2023-09-08 11:48:23'),
(8, 2, 3, 0, 0, 1, '2023-09-09 05:04:14', '2023-09-09 05:04:14'),
(9, 5, 3, 0, 0, 1, '2023-09-09 05:04:15', '2023-09-09 05:04:15'),
(10, 1, 4, 0, 0, 1, '2023-09-09 05:04:22', '2023-09-09 06:00:51'),
(11, 2, 4, 0, 0, 1, '2023-09-09 05:04:25', '2023-09-09 05:04:25'),
(12, 5, 4, 0, 0, 1, '2023-09-09 05:04:29', '2023-09-09 05:04:29'),
(13, 1, 10, 0, 0, 1, '2023-09-09 05:15:02', '2023-09-09 08:29:59'),
(14, 6, 3, 0, 0, 1, '2023-09-09 05:15:09', '2023-09-09 05:15:09'),
(15, 6, 4, 0, 0, 1, '2023-09-09 05:15:17', '2023-09-09 05:15:17'),
(16, 1, 18, 0, 0, 1, '2023-09-09 05:15:55', '2023-09-09 09:18:08'),
(17, 2, 18, 0, 0, 1, '2023-09-09 05:16:00', '2023-09-09 05:16:00'),
(18, 7, 3, 0, 0, 1, '2023-09-09 05:29:34', '2023-09-09 05:29:34'),
(19, 8, 3, 0, 0, 1, '2023-09-09 05:29:36', '2023-09-09 05:29:36'),
(21, 1, 19, 0, 1, 1, '2023-09-09 05:29:52', '2023-09-09 09:18:26'),
(22, 7, 4, 0, 0, 1, '2023-09-09 05:36:26', '2023-09-09 05:36:26'),
(23, 8, 4, 0, 0, 1, '2023-09-09 05:36:29', '2023-09-09 05:36:29'),
(24, 21, 3, 0, 0, 1, '2023-09-09 05:36:37', '2023-09-09 05:36:37'),
(25, 2, 10, 0, 0, 1, '2023-09-09 08:35:46', '2023-09-09 08:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city`, `state_id`) VALUES
(1, 'North and Middle Andaman', 32),
(2, 'South Andaman', 32),
(3, 'Nicobar', 32),
(4, 'Adilabad', 1),
(5, 'Anantapur', 1),
(6, 'Chittoor', 1),
(7, 'East Godavari', 1),
(8, 'Guntur', 1),
(9, 'Hyderabad', 1),
(10, 'Kadapa', 1),
(11, 'Karimnagar', 1),
(12, 'Khammam', 1),
(13, 'Krishna', 1),
(14, 'Kurnool', 1),
(15, 'Mahbubnagar', 1),
(16, 'Medak', 1),
(17, 'Nalgonda', 1),
(18, 'Nellore', 1),
(19, 'Nizamabad', 1),
(20, 'Prakasam', 1),
(21, 'Rangareddi', 1),
(22, 'Srikakulam', 1),
(23, 'Vishakhapatnam', 1),
(24, 'Vizianagaram', 1),
(25, 'Warangal', 1),
(26, 'West Godavari', 1),
(27, 'Anjaw', 3),
(28, 'Changlang', 3),
(29, 'East Kameng', 3),
(30, 'Lohit', 3),
(31, 'Lower Subansiri', 3),
(32, 'Papum Pare', 3),
(33, 'Tirap', 3),
(34, 'Dibang Valley', 3),
(35, 'Upper Subansiri', 3),
(36, 'West Kameng', 3),
(37, 'Barpeta', 2),
(38, 'Bongaigaon', 2),
(39, 'Cachar', 2),
(40, 'Darrang', 2),
(41, 'Dhemaji', 2),
(42, 'Dhubri', 2),
(43, 'Dibrugarh', 2),
(44, 'Goalpara', 2),
(45, 'Golaghat', 2),
(46, 'Hailakandi', 2),
(47, 'Jorhat', 2),
(48, 'Karbi Anglong', 2),
(49, 'Karimganj', 2),
(50, 'Kokrajhar', 2),
(51, 'Lakhimpur', 2),
(52, 'Marigaon', 2),
(53, 'Nagaon', 2),
(54, 'Nalbari', 2),
(55, 'North Cachar Hills', 2),
(56, 'Sibsagar', 2),
(57, 'Sonitpur', 2),
(58, 'Tinsukia', 2),
(59, 'Araria', 4),
(60, 'Aurangabad', 4),
(61, 'Banka', 4),
(62, 'Begusarai', 4),
(63, 'Bhagalpur', 4),
(64, 'Bhojpur', 4),
(65, 'Buxar', 4),
(66, 'Darbhanga', 4),
(67, 'Purba Champaran', 4),
(68, 'Gaya', 4),
(69, 'Gopalganj', 4),
(70, 'Jamui', 4),
(71, 'Jehanabad', 4),
(72, 'Khagaria', 4),
(73, 'Kishanganj', 4),
(74, 'Kaimur', 4),
(75, 'Katihar', 4),
(76, 'Lakhisarai', 4),
(77, 'Madhubani', 4),
(78, 'Munger', 4),
(79, 'Madhepura', 4),
(80, 'Muzaffarpur', 4),
(81, 'Nalanda', 4),
(82, 'Nawada', 4),
(83, 'Patna', 4),
(84, 'Purnia', 4),
(85, 'Rohtas', 4),
(86, 'Saharsa', 4),
(87, 'Samastipur', 4),
(88, 'Sheohar', 4),
(89, 'Sheikhpura', 4),
(90, 'Saran', 4),
(91, 'Sitamarhi', 4),
(92, 'Supaul', 4),
(93, 'Siwan', 4),
(94, 'Vaishali', 4),
(95, 'Pashchim Champaran', 4),
(96, 'Bastar', 36),
(97, 'Bilaspur', 36),
(98, 'Dantewada', 36),
(99, 'Dhamtari', 36),
(100, 'Durg', 36),
(101, 'Jashpur', 36),
(102, 'Janjgir-Champa', 36),
(103, 'Korba', 36),
(104, 'Koriya', 36),
(105, 'Kanker', 36),
(106, 'Kawardha', 36),
(107, 'Mahasamund', 36),
(108, 'Raigarh', 36),
(109, 'Rajnandgaon', 36),
(110, 'Raipur', 36),
(111, 'Surguja', 36),
(112, 'Diu', 29),
(113, 'Daman', 29),
(114, 'Central Delhi', 25),
(115, 'East Delhi', 25),
(116, 'New Delhi', 25),
(117, 'North Delhi', 25),
(118, 'North East Delhi', 25),
(119, 'North West Delhi', 25),
(120, 'South Delhi', 25),
(121, 'South West Delhi', 25),
(122, 'West Delhi', 25),
(123, 'North Goa', 26),
(124, 'South Goa', 26),
(125, 'Ahmedabad', 5),
(126, 'Amreli District', 5),
(127, 'Anand', 5),
(128, 'Banaskantha', 5),
(129, 'Bharuch', 5),
(130, 'Bhavnagar', 5),
(131, 'Dahod', 5),
(132, 'The Dangs', 5),
(133, 'Gandhinagar', 5),
(134, 'Jamnagar', 5),
(135, 'Junagadh', 5),
(136, 'Kutch', 5),
(137, 'Kheda', 5),
(138, 'Mehsana', 5),
(139, 'Narmada', 5),
(140, 'Navsari', 5),
(141, 'Patan', 5),
(142, 'Panchmahal', 5),
(143, 'Porbandar', 5),
(144, 'Rajkot', 5),
(145, 'Sabarkantha', 5),
(146, 'Surendranagar', 5),
(147, 'Surat', 5),
(148, 'Vadodara', 5),
(149, 'Valsad', 5),
(150, 'Ambala', 6),
(151, 'Bhiwani', 6),
(152, 'Faridabad', 6),
(153, 'Fatehabad', 6),
(154, 'Gurgaon', 6),
(155, 'Hissar', 6),
(156, 'Jhajjar', 6),
(157, 'Jind', 6),
(158, 'Karnal', 6),
(159, 'Kaithal', 6),
(160, 'Kurukshetra', 6),
(161, 'Mahendragarh', 6),
(162, 'Mewat', 6),
(163, 'Panchkula', 6),
(164, 'Panipat', 6),
(165, 'Rewari', 6),
(166, 'Rohtak', 6),
(167, 'Sirsa', 6),
(168, 'Sonepat', 6),
(169, 'Yamuna Nagar', 6),
(170, 'Palwal', 6),
(171, 'Bilaspur', 7),
(172, 'Chamba', 7),
(173, 'Hamirpur', 7),
(174, 'Kangra', 7),
(175, 'Kinnaur', 7),
(176, 'Kulu', 7),
(177, 'Lahaul and Spiti', 7),
(178, 'Mandi', 7),
(179, 'Shimla', 7),
(180, 'Sirmaur', 7),
(181, 'Solan', 7),
(182, 'Una', 7),
(183, 'Anantnag', 8),
(184, 'Badgam', 8),
(185, 'Bandipore', 8),
(186, 'Baramula', 8),
(187, 'Doda', 8),
(188, 'Jammu', 8),
(189, 'Kargil', 8),
(190, 'Kathua', 8),
(191, 'Kupwara', 8),
(192, 'Leh', 8),
(193, 'Poonch', 8),
(194, 'Pulwama', 8),
(195, 'Rajauri', 8),
(196, 'Srinagar', 8),
(197, 'Samba', 8),
(198, 'Udhampur', 8),
(199, 'Bokaro', 34),
(200, 'Chatra', 34),
(201, 'Deoghar', 34),
(202, 'Dhanbad', 34),
(203, 'Dumka', 34),
(204, 'Purba Singhbhum', 34),
(205, 'Garhwa', 34),
(206, 'Giridih', 34),
(207, 'Godda', 34),
(208, 'Gumla', 34),
(209, 'Hazaribagh', 34),
(210, 'Koderma', 34),
(211, 'Lohardaga', 34),
(212, 'Pakur', 34),
(213, 'Palamu', 34),
(214, 'Ranchi', 34),
(215, 'Sahibganj', 34),
(216, 'Seraikela and Kharsawan', 34),
(217, 'Pashchim Singhbhum', 34),
(218, 'Ramgarh', 34),
(219, 'Bidar', 9),
(220, 'Belgaum', 9),
(221, 'Bijapur', 9),
(222, 'Bagalkot', 9),
(223, 'Bellary', 9),
(224, 'Bangalore Rural District', 9),
(225, 'Bangalore Urban District', 9),
(226, 'Chamarajnagar', 9),
(227, 'Chikmagalur', 9),
(228, 'Chitradurga', 9),
(229, 'Davanagere', 9),
(230, 'Dharwad', 9),
(231, 'Dakshina Kannada', 9),
(232, 'Gadag', 9),
(233, 'Gulbarga', 9),
(234, 'Hassan', 9),
(235, 'Haveri District', 9),
(236, 'Kodagu', 9),
(237, 'Kolar', 9),
(238, 'Koppal', 9),
(239, 'Mandya', 9),
(240, 'Mysore', 9),
(241, 'Raichur', 9),
(242, 'Shimoga', 9),
(243, 'Tumkur', 9),
(244, 'Udupi', 9),
(245, 'Uttara Kannada', 9),
(246, 'Ramanagara', 9),
(247, 'Chikballapur', 9),
(248, 'Yadagiri', 9),
(249, 'Alappuzha', 10),
(250, 'Ernakulam', 10),
(251, 'Idukki', 10),
(252, 'Kollam', 10),
(253, 'Kannur', 10),
(254, 'Kasaragod', 10),
(255, 'Kottayam', 10),
(256, 'Kozhikode', 10),
(257, 'Malappuram', 10),
(258, 'Palakkad', 10),
(259, 'Pathanamthitta', 10),
(260, 'Thrissur', 10),
(261, 'Thiruvananthapuram', 10),
(262, 'Wayanad', 10),
(263, 'Alirajpur', 11),
(264, 'Anuppur', 11),
(265, 'Ashok Nagar', 11),
(266, 'Balaghat', 11),
(267, 'Barwani', 11),
(268, 'Betul', 11),
(269, 'Bhind', 11),
(270, 'Bhopal', 11),
(271, 'Burhanpur', 11),
(272, 'Chhatarpur', 11),
(273, 'Chhindwara', 11),
(274, 'Damoh', 11),
(275, 'Datia', 11),
(276, 'Dewas', 11),
(277, 'Dhar', 11),
(278, 'Dindori', 11),
(279, 'Guna', 11),
(280, 'Gwalior', 11),
(281, 'Harda', 11),
(282, 'Hoshangabad', 11),
(283, 'Indore', 11),
(284, 'Jabalpur', 11),
(285, 'Jhabua', 11),
(286, 'Katni', 11),
(287, 'Khandwa', 11),
(288, 'Khargone', 11),
(289, 'Mandla', 11),
(290, 'Mandsaur', 11),
(291, 'Morena', 11),
(292, 'Narsinghpur', 11),
(293, 'Neemuch', 11),
(294, 'Panna', 11),
(295, 'Rewa', 11),
(296, 'Rajgarh', 11),
(297, 'Ratlam', 11),
(298, 'Raisen', 11),
(299, 'Sagar', 11),
(300, 'Satna', 11),
(301, 'Sehore', 11),
(302, 'Seoni', 11),
(303, 'Shahdol', 11),
(304, 'Shajapur', 11),
(305, 'Sheopur', 11),
(306, 'Shivpuri', 11),
(307, 'Sidhi', 11),
(308, 'Singrauli', 11),
(309, 'Tikamgarh', 11),
(310, 'Ujjain', 11),
(311, 'Umaria', 11),
(312, 'Vidisha', 11),
(313, 'Ahmednagar', 12),
(314, 'Akola', 12),
(315, 'Amrawati', 12),
(316, 'Aurangabad', 12),
(317, 'Bhandara', 12),
(318, 'Beed', 12),
(319, 'Buldhana', 12),
(320, 'Chandrapur', 12),
(321, 'Dhule', 12),
(322, 'Gadchiroli', 12),
(323, 'Gondiya', 12),
(324, 'Hingoli', 12),
(325, 'Jalgaon', 12),
(326, 'Jalna', 12),
(327, 'Kolhapur', 12),
(328, 'Latur', 12),
(329, 'Mumbai City', 12),
(330, 'Mumbai suburban', 12),
(331, 'Nandurbar', 12),
(332, 'Nanded', 12),
(333, 'Nagpur', 12),
(334, 'Nashik', 12),
(335, 'Osmanabad', 12),
(336, 'Parbhani', 12),
(337, 'Pune', 12),
(338, 'Raigad', 12),
(339, 'Ratnagiri', 12),
(340, 'Sindhudurg', 12),
(341, 'Sangli', 12),
(342, 'Solapur', 12),
(343, 'Satara', 12),
(344, 'Thane', 12),
(345, 'Wardha', 12),
(346, 'Washim', 12),
(347, 'Yavatmal', 12),
(348, 'Bishnupur', 13),
(349, 'Churachandpur', 13),
(350, 'Chandel', 13),
(351, 'Imphal East', 13),
(352, 'Senapati', 13),
(353, 'Tamenglong', 13),
(354, 'Thoubal', 13),
(355, 'Ukhrul', 13),
(356, 'Imphal West', 13),
(357, 'East Garo Hills', 14),
(358, 'East Khasi Hills', 14),
(359, 'Jaintia Hills', 14),
(360, 'Ri-Bhoi', 14),
(361, 'South Garo Hills', 14),
(362, 'West Garo Hills', 14),
(363, 'West Khasi Hills', 14),
(364, 'Aizawl', 15),
(365, 'Champhai', 15),
(366, 'Kolasib', 15),
(367, 'Lawngtlai', 15),
(368, 'Lunglei', 15),
(369, 'Mamit', 15),
(370, 'Saiha', 15),
(371, 'Serchhip', 15),
(372, 'Dimapur', 16),
(373, 'Kohima', 16),
(374, 'Mokokchung', 16),
(375, 'Mon', 16),
(376, 'Phek', 16),
(377, 'Tuensang', 16),
(378, 'Wokha', 16),
(379, 'Zunheboto', 16),
(380, 'Angul', 17),
(381, 'Boudh', 17),
(382, 'Bhadrak', 17),
(383, 'Bolangir', 17),
(384, 'Bargarh', 17),
(385, 'Baleswar', 17),
(386, 'Cuttack', 17),
(387, 'Debagarh', 17),
(388, 'Dhenkanal', 17),
(389, 'Ganjam', 17),
(390, 'Gajapati', 17),
(391, 'Jharsuguda', 17),
(392, 'Jajapur', 17),
(393, 'Jagatsinghpur', 17),
(394, 'Khordha', 17),
(395, 'Kendujhar', 17),
(396, 'Kalahandi', 17),
(397, 'Kandhamal', 17),
(398, 'Koraput', 17),
(399, 'Kendrapara', 17),
(400, 'Malkangiri', 17),
(401, 'Mayurbhanj', 17),
(402, 'Nabarangpur', 17),
(403, 'Nuapada', 17),
(404, 'Nayagarh', 17),
(405, 'Puri', 17),
(406, 'Rayagada', 17),
(407, 'Sambalpur', 17),
(408, 'Subarnapur', 17),
(409, 'Sundargarh', 17),
(410, 'Karaikal', 27),
(411, 'Mahe', 27),
(412, 'Puducherry', 27),
(413, 'Yanam', 27),
(414, 'Amritsar', 18),
(415, 'Bathinda', 18),
(416, 'Firozpur', 18),
(417, 'Faridkot', 18),
(418, 'Fatehgarh Sahib', 18),
(419, 'Gurdaspur', 18),
(420, 'Hoshiarpur', 18),
(421, 'Jalandhar', 18),
(422, 'Kapurthala', 18),
(423, 'Ludhiana', 18),
(424, 'Mansa', 18),
(425, 'Moga', 18),
(426, 'Mukatsar', 18),
(427, 'Nawan Shehar', 18),
(428, 'Patiala', 18),
(429, 'Rupnagar', 18),
(430, 'Sangrur', 18),
(431, 'Ajmer', 19),
(432, 'Alwar', 19),
(433, 'Bikaner', 19),
(434, 'Barmer', 19),
(435, 'Banswara', 19),
(436, 'Bharatpur', 19),
(437, 'Baran', 19),
(438, 'Bundi', 19),
(439, 'Bhilwara', 19),
(440, 'Churu', 19),
(441, 'Chittorgarh', 19),
(442, 'Dausa', 19),
(443, 'Dholpur', 19),
(444, 'Dungapur', 19),
(445, 'Ganganagar', 19),
(446, 'Hanumangarh', 19),
(447, 'Juhnjhunun', 19),
(448, 'Jalore', 19),
(449, 'Jodhpur', 19),
(450, 'Jaipur', 19),
(451, 'Jaisalmer', 19),
(452, 'Jhalawar', 19),
(453, 'Karauli', 19),
(454, 'Kota', 19),
(455, 'Nagaur', 19),
(456, 'Pali', 19),
(457, 'Pratapgarh', 19),
(458, 'Rajsamand', 19),
(459, 'Sikar', 19),
(460, 'Sawai Madhopur', 19),
(461, 'Sirohi', 19),
(462, 'Tonk', 19),
(463, 'Udaipur', 19),
(464, 'East Sikkim', 20),
(465, 'North Sikkim', 20),
(466, 'South Sikkim', 20),
(467, 'West Sikkim', 20),
(468, 'Ariyalur', 21),
(469, 'Chennai', 21),
(470, 'Coimbatore', 21),
(471, 'Cuddalore', 21),
(472, 'Dharmapuri', 21),
(473, 'Dindigul', 21),
(474, 'Erode', 21),
(475, 'Kanchipuram', 21),
(476, 'Kanyakumari', 21),
(477, 'Karur', 21),
(478, 'Madurai', 21),
(479, 'Nagapattinam', 21),
(480, 'The Nilgiris', 21),
(481, 'Namakkal', 21),
(482, 'Perambalur', 21),
(483, 'Pudukkottai', 21),
(484, 'Ramanathapuram', 21),
(485, 'Salem', 21),
(486, 'Sivagangai', 21),
(487, 'Tiruppur', 21),
(488, 'Tiruchirappalli', 21),
(489, 'Theni', 21),
(490, 'Tirunelveli', 21),
(491, 'Thanjavur', 21),
(492, 'Thoothukudi', 21),
(493, 'Thiruvallur', 21),
(494, 'Thiruvarur', 21),
(495, 'Tiruvannamalai', 21),
(496, 'Vellore', 21),
(497, 'Villupuram', 21),
(498, 'Dhalai', 22),
(499, 'North Tripura', 22),
(500, 'South Tripura', 22),
(501, 'West Tripura', 22),
(502, 'Almora', 33),
(503, 'Bageshwar', 33),
(504, 'Chamoli', 33),
(505, 'Champawat', 33),
(506, 'Dehradun', 33),
(507, 'Haridwar', 33),
(508, 'Nainital', 33),
(509, 'Pauri Garhwal', 33),
(510, 'Pithoragharh', 33),
(511, 'Rudraprayag', 33),
(512, 'Tehri Garhwal', 33),
(513, 'Udham Singh Nagar', 33),
(514, 'Uttarkashi', 33),
(515, 'Agra', 23),
(516, 'Allahabad', 23),
(517, 'Aligarh', 23),
(518, 'Ambedkar Nagar', 23),
(519, 'Auraiya', 23),
(520, 'Azamgarh', 23),
(521, 'Barabanki', 23),
(522, 'Badaun', 23),
(523, 'Bagpat', 23),
(524, 'Bahraich', 23),
(525, 'Bijnor', 23),
(526, 'Ballia', 23),
(527, 'Banda', 23),
(528, 'Balrampur', 23),
(529, 'Bareilly', 23),
(530, 'Basti', 23),
(531, 'Bulandshahr', 23),
(532, 'Chandauli', 23),
(533, 'Chitrakoot', 23),
(534, 'Deoria', 23),
(535, 'Etah', 23),
(536, 'Kanshiram Nagar', 23),
(537, 'Etawah', 23),
(538, 'Firozabad', 23),
(539, 'Farrukhabad', 23),
(540, 'Fatehpur', 23),
(541, 'Faizabad', 23),
(542, 'Gautam Buddha Nagar', 23),
(543, 'Gonda', 23),
(544, 'Ghazipur', 23),
(545, 'Gorkakhpur', 23),
(546, 'Ghaziabad', 23),
(547, 'Hamirpur', 23),
(548, 'Hardoi', 23),
(549, 'Mahamaya Nagar', 23),
(550, 'Jhansi', 23),
(551, 'Jalaun', 23),
(552, 'Jyotiba Phule Nagar', 23),
(553, 'Jaunpur District', 23),
(554, 'Kanpur Dehat', 23),
(555, 'Kannauj', 23),
(556, 'Kanpur Nagar', 23),
(557, 'Kaushambi', 23),
(558, 'Kushinagar', 23),
(559, 'Lalitpur', 23),
(560, 'Lakhimpur Kheri', 23),
(561, 'Lucknow', 23),
(562, 'Mau', 23),
(563, 'Meerut', 23),
(564, 'Maharajganj', 23),
(565, 'Mahoba', 23),
(566, 'Mirzapur', 23),
(567, 'Moradabad', 23),
(568, 'Mainpuri', 23),
(569, 'Mathura', 23),
(570, 'Muzaffarnagar', 23),
(571, 'Pilibhit', 23),
(572, 'Pratapgarh', 23),
(573, 'Rampur', 23),
(574, 'Rae Bareli', 23),
(575, 'Saharanpur', 23),
(576, 'Sitapur', 23),
(577, 'Shahjahanpur', 23),
(578, 'Sant Kabir Nagar', 23),
(579, 'Siddharthnagar', 23),
(580, 'Sonbhadra', 23),
(581, 'Sant Ravidas Nagar', 23),
(582, 'Sultanpur', 23),
(583, 'Shravasti', 23),
(584, 'Unnao', 23),
(585, 'Varanasi', 23),
(586, 'Birbhum', 24),
(587, 'Bankura', 24),
(588, 'Bardhaman', 24),
(589, 'Darjeeling', 24),
(590, 'Dakshin Dinajpur', 24),
(591, 'Hooghly', 24),
(592, 'Howrah', 24),
(593, 'Jalpaiguri', 24),
(594, 'Cooch Behar', 24),
(595, 'Kolkata', 24),
(596, 'Malda', 24),
(597, 'Midnapore', 24),
(598, 'Murshidabad', 24),
(599, 'Nadia', 24),
(600, 'North 24 Parganas', 24),
(601, 'South 24 Parganas', 24),
(602, 'Purulia', 24),
(603, 'Uttar Dinajpur', 24);

-- --------------------------------------------------------

--
-- Table structure for table `company_kyc`
--

CREATE TABLE `company_kyc` (
  `id` int(101) NOT NULL,
  `company_id` int(101) NOT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `name` text,
  `pan_date` date DEFAULT NULL,
  `address` text,
  `pincode` int(11) DEFAULT NULL,
  `city` text,
  `state` text,
  `country` text,
  `gstin` varchar(101) DEFAULT NULL,
  `fax_number` varchar(20) DEFAULT NULL,
  `tan_number` varchar(20) DEFAULT NULL,
  `document` varchar(251) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_kyc`
--

INSERT INTO `company_kyc` (`id`, `company_id`, `pan_no`, `name`, `pan_date`, `address`, `pincode`, `city`, `state`, `country`, `gstin`, `fax_number`, `tan_number`, `document`, `created_at`, `updated_at`) VALUES
(1, 1, 'ABCTY1234D', 'Blade', '2010-06-16', 'Ram nagar', 752963, 'zurich', 'mp', 'India', '29GGGGG1314R9Z6', '123-456-7890', 'PDES03028F', 'https://apnaorganicstore.in/canjobs/uploads/1694177536.pdf', '2023-08-03 11:36:43', '2023-09-08 12:52:17'),
(2, 2, 'ABCTY1234D', 'Ram choudary', '2023-08-07', 'Ram nagar', 752963, 'indore', 'mp', 'India', '37AADCS0472N1Z1', '123-456-7890', 'PDES03028F', 'https://apnaorganicstore.in/canjobs/uploads/1694177490.pdf', '2023-08-08 05:02:42', '2023-09-08 12:51:30'),
(3, 4, 'ABCDE1234F', 'Pikashoo', '2023-08-27', '2nd Floor, 45 Universal Tower,', 452010, 'indore', 'Madhya Pradesh', 'India', NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1693907647.pdf', '2023-09-05 09:53:09', '2023-09-05 09:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `countrycode` char(2) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `countrycode`, `name`) VALUES
(1, 'AD', 'Andorra'),
(2, 'AE', 'United Arab Emirates'),
(3, 'AF', 'Afghanistan'),
(4, 'AG', 'Antigua and Barbuda'),
(5, 'AI', 'Anguilla'),
(6, 'AL', 'Albania'),
(7, 'AM', 'Armenia'),
(8, 'AO', 'Angola'),
(9, 'AQ', 'Antarctica'),
(10, 'AR', 'Argentina'),
(11, 'AS', 'American Samoa'),
(12, 'AT', 'Austria'),
(13, 'AU', 'Australia'),
(14, 'AW', 'Aruba'),
(15, 'AX', 'Åland'),
(16, 'AZ', 'Azerbaijan'),
(17, 'BA', 'Bosnia and Herzegovina'),
(18, 'BB', 'Barbados'),
(19, 'BD', 'Bangladesh'),
(20, 'BE', 'Belgium'),
(21, 'BF', 'Burkina Faso'),
(22, 'BG', 'Bulgaria'),
(23, 'BH', 'Bahrain'),
(24, 'BI', 'Burundi'),
(25, 'BJ', 'Benin'),
(26, 'BL', 'Saint Barthélemy'),
(27, 'BM', 'Bermuda'),
(28, 'BN', 'Brunei'),
(29, 'BO', 'Bolivia'),
(30, 'BQ', 'Bonaire'),
(31, 'BR', 'Brazil'),
(32, 'BS', 'Bahamas'),
(33, 'BT', 'Bhutan'),
(34, 'BV', 'Bouvet Island'),
(35, 'BW', 'Botswana'),
(36, 'BY', 'Belarus'),
(37, 'BZ', 'Belize'),
(38, 'CA', 'Canada'),
(39, 'CC', 'Cocos [Keeling] Islands'),
(40, 'CD', 'Democratic Republic of the Congo'),
(41, 'CF', 'Central African Republic'),
(42, 'CG', 'Republic of the Congo'),
(43, 'CH', 'Switzerland'),
(44, 'CI', 'Ivory Coast'),
(45, 'CK', 'Cook Islands'),
(46, 'CL', 'Chile'),
(47, 'CM', 'Cameroon'),
(48, 'CN', 'China'),
(49, 'CO', 'Colombia'),
(50, 'CR', 'Costa Rica'),
(51, 'CU', 'Cuba'),
(52, 'CV', 'Cape Verde'),
(53, 'CW', 'Curacao'),
(54, 'CX', 'Christmas Island'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DE', 'Germany'),
(58, 'DJ', 'Djibouti'),
(59, 'DK', 'Denmark'),
(60, 'DM', 'Dominica'),
(61, 'DO', 'Dominican Republic'),
(62, 'DZ', 'Algeria'),
(63, 'EC', 'Ecuador'),
(64, 'EE', 'Estonia'),
(65, 'EG', 'Egypt'),
(66, 'EH', 'Western Sahara'),
(67, 'ER', 'Eritrea'),
(68, 'ES', 'Spain'),
(69, 'ET', 'Ethiopia'),
(70, 'FI', 'Finland'),
(71, 'FJ', 'Fiji'),
(72, 'FK', 'Falkland Islands'),
(73, 'FM', 'Micronesia'),
(74, 'FO', 'Faroe Islands'),
(75, 'FR', 'France'),
(76, 'GA', 'Gabon'),
(77, 'GB', 'United Kingdom'),
(78, 'GD', 'Grenada'),
(79, 'GE', 'Georgia'),
(80, 'GF', 'French Guiana'),
(81, 'GG', 'Guernsey'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GL', 'Greenland'),
(85, 'GM', 'Gambia'),
(86, 'GN', 'Guinea'),
(87, 'GP', 'Guadeloupe'),
(88, 'GQ', 'Equatorial Guinea'),
(89, 'GR', 'Greece'),
(90, 'GS', 'South Georgia and the South Sandwich Islands'),
(91, 'GT', 'Guatemala'),
(92, 'GU', 'Guam'),
(93, 'GW', 'Guinea-Bissau'),
(94, 'GY', 'Guyana'),
(95, 'HK', 'Hong Kong'),
(96, 'HM', 'Heard Island and McDonald Islands'),
(97, 'HN', 'Honduras'),
(98, 'HR', 'Croatia'),
(99, 'HT', 'Haiti'),
(100, 'HU', 'Hungary'),
(101, 'ID', 'Indonesia'),
(102, 'IE', 'Ireland'),
(103, 'IL', 'Israel'),
(104, 'IM', 'Isle of Man'),
(105, 'IN', 'India'),
(106, 'IO', 'British Indian Ocean Territory'),
(107, 'IQ', 'Iraq'),
(108, 'IR', 'Iran'),
(109, 'IS', 'Iceland'),
(110, 'IT', 'Italy'),
(111, 'JE', 'Jersey'),
(112, 'JM', 'Jamaica'),
(113, 'JO', 'Jordan'),
(114, 'JP', 'Japan'),
(115, 'KE', 'Kenya'),
(116, 'KG', 'Kyrgyzstan'),
(117, 'KH', 'Cambodia'),
(118, 'KI', 'Kiribati'),
(119, 'KM', 'Comoros'),
(120, 'KN', 'Saint Kitts and Nevis'),
(121, 'KP', 'North Korea'),
(122, 'KR', 'South Korea'),
(123, 'KW', 'Kuwait'),
(124, 'KY', 'Cayman Islands'),
(125, 'KZ', 'Kazakhstan'),
(126, 'LA', 'Laos'),
(127, 'LB', 'Lebanon'),
(128, 'LC', 'Saint Lucia'),
(129, 'LI', 'Liechtenstein'),
(130, 'LK', 'Sri Lanka'),
(131, 'LR', 'Liberia'),
(132, 'LS', 'Lesotho'),
(133, 'LT', 'Lithuania'),
(134, 'LU', 'Luxembourg'),
(135, 'LV', 'Latvia'),
(136, 'LY', 'Libya'),
(137, 'MA', 'Morocco'),
(138, 'MC', 'Monaco'),
(139, 'MD', 'Moldova'),
(140, 'ME', 'Montenegro'),
(141, 'MF', 'Saint Martin'),
(142, 'MG', 'Madagascar'),
(143, 'MH', 'Marshall Islands'),
(144, 'MK', 'Macedonia'),
(145, 'ML', 'Mali'),
(146, 'MM', 'Myanmar [Burma]'),
(147, 'MN', 'Mongolia'),
(148, 'MO', 'Macao'),
(149, 'MP', 'Northern Mariana Islands'),
(150, 'MQ', 'Martinique'),
(151, 'MR', 'Mauritania'),
(152, 'MS', 'Montserrat'),
(153, 'MT', 'Malta'),
(154, 'MU', 'Mauritius'),
(155, 'MV', 'Maldives'),
(156, 'MW', 'Malawi'),
(157, 'MX', 'Mexico'),
(158, 'MY', 'Malaysia'),
(159, 'MZ', 'Mozambique'),
(160, 'NA', 'Namibia'),
(161, 'NC', 'New Caledonia'),
(162, 'NE', 'Niger'),
(163, 'NF', 'Norfolk Island'),
(164, 'NG', 'Nigeria'),
(165, 'NI', 'Nicaragua'),
(166, 'NL', 'Netherlands'),
(167, 'NO', 'Norway'),
(168, 'NP', 'Nepal'),
(169, 'NR', 'Nauru'),
(170, 'NU', 'Niue'),
(171, 'NZ', 'New Zealand'),
(172, 'OM', 'Oman'),
(173, 'PA', 'Panama'),
(174, 'PE', 'Peru'),
(175, 'PF', 'French Polynesia'),
(176, 'PG', 'Papua New Guinea'),
(177, 'PH', 'Philippines'),
(178, 'PK', 'Pakistan'),
(179, 'PL', 'Poland'),
(180, 'PM', 'Saint Pierre and Miquelon'),
(181, 'PN', 'Pitcairn Islands'),
(182, 'PR', 'Puerto Rico'),
(183, 'PS', 'Palestine'),
(184, 'PT', 'Portugal'),
(185, 'PW', 'Palau'),
(186, 'PY', 'Paraguay'),
(187, 'QA', 'Qatar'),
(188, 'RE', 'Réunion'),
(189, 'RO', 'Romania'),
(190, 'RS', 'Serbia'),
(191, 'RU', 'Russia'),
(192, 'RW', 'Rwanda'),
(193, 'SA', 'Saudi Arabia'),
(194, 'SB', 'Solomon Islands'),
(195, 'SC', 'Seychelles'),
(196, 'SD', 'Sudan'),
(197, 'SE', 'Sweden'),
(198, 'SG', 'Singapore'),
(199, 'SH', 'Saint Helena'),
(200, 'SI', 'Slovenia'),
(201, 'SJ', 'Svalbard and Jan Mayen'),
(202, 'SK', 'Slovakia'),
(203, 'SL', 'Sierra Leone'),
(204, 'SM', 'San Marino'),
(205, 'SN', 'Senegal'),
(206, 'SO', 'Somalia'),
(207, 'SR', 'Suriname'),
(208, 'SS', 'South Sudan'),
(209, 'ST', 'São Tomé and Príncipe'),
(210, 'SV', 'El Salvador'),
(211, 'SX', 'Sint Maarten'),
(212, 'SY', 'Syria'),
(213, 'SZ', 'Swaziland'),
(214, 'TC', 'Turks and Caicos Islands'),
(215, 'TD', 'Chad'),
(216, 'TF', 'French Southern Territories'),
(217, 'TG', 'Togo'),
(218, 'TH', 'Thailand'),
(219, 'TJ', 'Tajikistan'),
(220, 'TK', 'Tokelau'),
(221, 'TL', 'East Timor'),
(222, 'TM', 'Turkmenistan'),
(223, 'TN', 'Tunisia'),
(224, 'TO', 'Tonga'),
(225, 'TR', 'Turkey'),
(226, 'TT', 'Trinidad and Tobago'),
(227, 'TV', 'Tuvalu'),
(228, 'TW', 'Taiwan'),
(229, 'TZ', 'Tanzania'),
(230, 'UA', 'Ukraine'),
(231, 'UG', 'Uganda'),
(232, 'UM', 'U.S. Minor Outlying Islands'),
(233, 'US', 'United States'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Uzbekistan'),
(236, 'VA', 'Vatican City'),
(237, 'VC', 'Saint Vincent and the Grenadines'),
(238, 'VE', 'Venezuela'),
(239, 'VG', 'British Virgin Islands'),
(240, 'VI', 'U.S. Virgin Islands'),
(241, 'VN', 'Vietnam'),
(242, 'VU', 'Vanuatu'),
(243, 'WF', 'Wallis and Futuna'),
(244, 'WS', 'Samoa'),
(245, 'XK', 'Kosovo'),
(246, 'YE', 'Yemen'),
(247, 'YT', 'Mayotte'),
(248, 'ZA', 'South Africa'),
(249, 'ZM', 'Zambia'),
(250, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int(101) NOT NULL,
  `email_template_id` int(101) NOT NULL,
  `email_json` json NOT NULL,
  `status` varchar(21) NOT NULL DEFAULT 'PENDING',
  `group_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id`, `email_template_id`, `email_json`, `status`, `group_id`, `created_at`) VALUES
(1, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade \", \"candidate_name\": \"Piku\", \"interview_date\": \"2023-08-04\"}', 'PROCESSING', 14502, '2023-08-03 11:44:16'),
(2, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade \", \"candidate_name\": \"Piku\", \"interview_date\": \"2023-08-05\"}', 'PROCESSING', 19606, '2023-08-03 11:44:44'),
(3, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade \", \"candidate_name\": \"Piku\", \"interview_date\": \"2023-08-17\"}', 'PROCESSING', 19070, '2023-08-03 11:47:35'),
(4, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 301296}', 'PROCESSING', 19265, '2023-08-03 12:03:20'),
(5, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'PROCESSING', 12727, '2023-08-03 12:04:06'),
(6, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"aashi.we2code@gmail.com\"}', 'PROCESSING', 12727, '2023-08-03 12:04:06'),
(7, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 490789}', 'PROCESSING', 14477, '2023-08-03 12:11:10'),
(8, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'PROCESSING', 74118, '2023-08-03 12:11:54'),
(9, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"aashi.we2code@gmail.com\"}', 'PROCESSING', 74118, '2023-08-03 12:11:54'),
(10, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade \", \"candidate_name\": \"Piku\", \"interview_date\": \"2023-08-04\"}', 'SENT', 14571, '2023-08-03 12:22:45'),
(11, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"name\": \"Ayushi shaman \", \"reset_link\": \"http://localhost:3000/resetpassword/user:587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 11602, '2023-08-07 04:08:11'),
(12, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade \", \"candidate_name\": \"Pikashoo\", \"interview_date\": \"2023-08-08\"}', 'SENT', 17731, '2023-08-07 07:06:29'),
(13, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade \", \"candidate_name\": \"Pikashoo\", \"interview_date\": \"2023-08-09\"}', 'SENT', 11698, '2023-08-07 07:10:57'),
(14, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"name\": \"Ayushi shaman \", \"reset_link\": \"http://localhost:3000/resetpassword/user:587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 16485, '2023-08-07 10:55:38'),
(15, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"name\": null, \"reset_link\": \"https://canjobs.vercel.app/:587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 14361, '2023-08-07 11:18:48'),
(16, 7, '{\"to\": \"nidhi.we2code@gmail.com\", \"otp\": 442529}', 'SENT', 14825, '2023-08-07 11:35:25'),
(17, 1, '{\"to\": \"nidhi.we2code@gmail.com\"}', 'SENT', 12731, '2023-08-07 11:36:46'),
(18, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"nidhi.we2code@gmail.com\"}', 'SENT', 12731, '2023-08-07 11:36:46'),
(19, 6, '{\"to\": \"nidhi.we2code@gmail.com\", \"name\": \"NIdhi savner\", \"reset_link\": \"https://canjobs.vercel.app/resetpassword/user:7495782e7934a6421a603ba933fd4bd7\"}', 'SENT', 14336, '2023-08-07 12:02:53'),
(20, 6, '{\"to\": \"nidhi.we2code@gmail.com\", \"name\": \"NIdhi savner\", \"reset_link\": \"https://canjobs.vercel.app/resetpassword/user:7495782e7934a6421a603ba933fd4bd7\"}', 'SENT', 17437, '2023-08-07 12:08:13'),
(21, 11, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade \", \"candidate_name\": \"Piku\", \"interview_date\": \"2023-08-09\"}', 'SENT', 13193, '2023-08-07 12:14:58'),
(22, 11, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade \", \"candidate_name\": \"Ayushi shaman \", \"interview_date\": \"2023-08-09\"}', 'SENT', 15229, '2023-08-07 12:15:23'),
(23, 11, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade \", \"candidate_name\": \"Ayushi shaman \", \"interview_date\": \"2023-08-11\"}', 'SENT', 19958, '2023-08-07 12:18:21'),
(24, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Land\"}', 'SENT', 16041, '2023-08-07 19:39:19'),
(25, 7, '{\"to\": \"utkarsh.we2code@gmail.com\", \"otp\": 723588}', 'SENT', 19469, '2023-08-08 04:36:54'),
(26, 1, '{\"to\": \"utkarsh.we2code@gmail.com\"}', 'SENT', 16023, '2023-08-08 04:39:53'),
(27, 8, '{\"to\": \"raj.we2code@gmail.com\", \"admin_name\": \"Raj\", \"user_email\": \"utkarsh.we2code@gmail.com\"}', 'SENT', 16023, '2023-08-08 04:39:53'),
(28, 7, '{\"to\": \"utkarsh.we2code@gmail.com\", \"otp\": 789145}', 'SENT', 11435, '2023-08-08 04:40:58'),
(29, 1, '{\"to\": \"utkarsh.we2code@gmail.com\"}', 'SENT', 16835, '2023-08-08 04:42:21'),
(30, 8, '{\"to\": \"raj.we2code@gmail.com\", \"admin_name\": \"Raj\", \"user_email\": \"utkarsh.we2code@gmail.com\"}', 'SENT', 16835, '2023-08-08 04:42:21'),
(31, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade\", \"candidate_name\": \"Piku\", \"interview_date\": \"2023-08-08\"}', 'SENT', 13512, '2023-08-08 06:59:24'),
(32, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade\", \"candidate_name\": \"Piku\", \"interview_date\": \"2023-08-08\"}', 'SENT', 318886, '2023-08-08 06:59:46'),
(34, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade\", \"candidate_name\": \"Ayushi shaman \", \"interview_date\": \"2023-08-11\"}', 'SENT', 331422, '2023-08-08 07:00:18'),
(33, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade\", \"candidate_name\": \"Ayushi shaman \", \"interview_date\": \"2023-08-09\"}', 'SENT', 314380, '2023-08-08 07:00:02'),
(35, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade\", \"candidate_name\": \"Ayushi shaman \", \"interview_date\": \"2023-08-08\"}', 'SENT', 343273, '2023-08-08 07:00:41'),
(36, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade\", \"candidate_name\": \"Ayushi shaman \", \"interview_date\": \"2023-08-08\"}', 'SENT', 355222, '2023-08-08 07:00:53'),
(37, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade\", \"candidate_name\": \"Piku\", \"interview_date\": \"2023-08-31\"}', 'SENT', 353637, '2023-08-08 07:01:37'),
(38, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Blade\", \"candidate_name\": \"Ayushi shaman \", \"interview_date\": \"2023-09-16\"}', 'SENT', 371884, '2023-08-08 07:01:52'),
(39, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blade\", \"employee_name\": \"Ayushi shaman \", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Organization Operations & Administrative Occupations,Healthcare Occupations,Technology Occupations,Tally,React js,Typing,Bootstrap,Css,Html,JavaScript\", \"employee_contact_no\": \"9874563210\"}', 'SENT', 16688, '2023-08-08 11:45:15'),
(40, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blade\", \"employee_name\": \"Sunil shekaukar\", \"employee_email\": \"sunil@gmail.com\", \"employee_skill\": \"Science & Research Occupations,Technology Occupations,Construction & Extraction Occupations,Marketing, Advertising & Public Relations Occupations\", \"employee_contact_no\": \"9874563210\"}', 'SENT', 13742, '2023-08-08 11:53:27'),
(41, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"candidate_name\": \"Gourav choudary\", \"interview_date\": \"2023-08-08\"}', 'SENT', 16584, '2023-08-08 12:15:19'),
(42, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"candidate_name\": \"Gourav choudary\", \"interview_date\": \"2023-08-08\"}', 'SENT', 18804, '2023-08-09 09:46:08'),
(43, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"candidate_name\": \"Gourav choudary\", \"interview_date\": \"2023-08-08\"}', 'SENT', 422704, '2023-08-09 09:46:19'),
(44, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blade\", \"employee_name\": \"Piku\", \"employee_email\": \"piku@gmail.com\", \"employee_skill\": \"Organization Operations & Administrative Occupations,Technology Occupations,Healthcare Occupations,Typing\", \"employee_contact_no\": \"10067895643\"}', 'SENT', 12171, '2023-08-09 10:10:52'),
(45, 7, '{\"to\": \"gouravchoudhary9888@gmail.com\", \"otp\": 128506}', 'SENT', 12622, '2023-08-10 04:25:18'),
(46, 1, '{\"to\": \"gouravchoudhary9888@gmail.com\"}', 'SENT', 13007, '2023-08-10 04:26:24'),
(47, 8, '{\"to\": \"raj.we2code@gmail.com\", \"admin_name\": \"Raj\", \"user_email\": \"gouravchoudhary9888@gmail.com\"}', 'SENT', 13007, '2023-08-10 04:26:24'),
(49, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": \"Dipti rathore\", \"employee_email\": \"dipti@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"7410147852\"}', 'SENT', 16934, '2023-08-10 05:14:24'),
(48, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"employee_name\": \"Gourav \", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Organization Operations & Administrative Occupations,Technology Occupations,Healthcare Occupations,Typing,Bootstrap,Food & Beverage Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 19599, '2023-08-10 04:27:02'),
(50, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"We2code\", \"employee_name\": \"Dipti rathore\", \"employee_email\": \"dipti@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"7410147852\"}', 'SENT', 19661, '2023-08-10 05:20:25'),
(51, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 164682}', 'SENT', 19925, '2023-08-10 05:34:12'),
(52, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'SENT', 19558, '2023-08-10 05:35:22'),
(53, 8, '{\"to\": \"raj.we2code@gmail.com\", \"admin_name\": \"Raj\", \"user_email\": \"aashi.we2code@gmail.com\"}', 'SENT', 19558, '2023-08-10 05:35:22'),
(54, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"8520147963\"}', 'SENT', 19540, '2023-08-10 05:49:48'),
(55, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"We2code\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"8520147963\"}', 'SENT', 16183, '2023-08-10 05:52:38'),
(56, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"8520147963\"}', 'SENT', 18537, '2023-08-10 05:54:59'),
(57, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"8520147963\"}', 'SENT', 15153, '2023-08-10 07:09:26'),
(58, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9857412034\"}', 'SENT', 16690, '2023-08-10 07:11:07'),
(59, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9857412034\"}', 'SENT', 586256, '2023-08-10 07:11:08'),
(60, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Land\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9857412034\"}', 'SENT', 12952, '2023-08-10 07:19:40'),
(61, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Postmen \", \"company_name\": \"Money Land\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9857412034\"}', 'SENT', 603061, '2023-08-10 07:19:41'),
(62, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": \"Rohan Dhakad\", \"employee_email\": \"rohan@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"7410258963\"}', 'SENT', 615625, '2023-08-10 07:19:45'),
(63, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Land\", \"employee_name\": \"Rohan Dhakad\", \"employee_email\": \"rohan@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"7410258963\"}', 'SENT', 622887, '2023-08-10 07:19:47'),
(64, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"employee_name\": \"Rohan Dhakad\", \"employee_email\": \"rohan@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"7410258963\"}', 'SENT', 639659, '2023-08-10 07:19:47'),
(65, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Postmen \", \"company_name\": \"Money Land\", \"employee_name\": \"Rohan Dhakad\", \"employee_email\": \"rohan@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"7410258963\"}', 'SENT', 644317, '2023-08-10 07:19:48'),
(66, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": \"utkarsh\", \"employee_email\": \"utkarsh.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"96302587410\"}', 'SENT', 19395, '2023-08-10 07:29:22'),
(67, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"employee_name\": \"utkarsh\", \"employee_email\": \"utkarsh.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"96302587410\"}', 'SENT', 669169, '2023-08-10 07:29:24'),
(68, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Land\", \"employee_name\": \"utkarsh\", \"employee_email\": \"utkarsh.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"96302587410\"}', 'SENT', 673652, '2023-08-10 07:29:25'),
(69, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Postmen \", \"company_name\": \"Money Land\", \"employee_name\": \"utkarsh\", \"employee_email\": \"utkarsh.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"96302587410\"}', 'SENT', 684491, '2023-08-10 07:29:26'),
(70, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"employee_name\": \"Gourav choudary\", \"employee_email\": \"g.choudhary.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"2145874963\"}', 'SENT', 14748, '2023-08-10 09:29:19'),
(71, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": \"Gourav choudary\", \"employee_email\": \"g.choudhary.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"2145874963\"}', 'SENT', 706892, '2023-08-10 09:29:20'),
(72, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Driver\", \"company_name\": \"Blaade\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"8520147963\"}', 'SENT', 14042, '2023-08-10 10:15:17'),
(73, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Postmen \", \"company_name\": \"Money Land\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"8520147963\"}', 'SENT', 18554, '2023-08-10 10:16:13'),
(74, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Land\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"8520147963\"}', 'SENT', 12788, '2023-08-10 10:19:54'),
(75, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Potmen\", \"company_name\": \"Blaade\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"8520147963\"}', 'SENT', 11869, '2023-08-10 13:06:52'),
(76, 7, '{\"to\": \"nidhi.we2code@gmail.com\", \"otp\": 447273}', 'SENT', 16905, '2023-08-11 04:18:10'),
(77, 1, '{\"to\": \"nidhi.we2code@gmail.com\"}', 'SENT', 16253, '2023-08-11 04:19:28'),
(78, 8, '{\"to\": \"raj.we2code@gmail.com\", \"admin_name\": \"Raj\", \"user_email\": \"nidhi.we2code@gmail.com\"}', 'SENT', 16253, '2023-08-11 04:19:28'),
(79, 7, '{\"to\": \"aashivyas2001@gmail.com\", \"otp\": 442694}', 'SENT', 16001, '2023-08-11 04:21:20'),
(80, 7, '{\"to\": \"nidhisavner843@gmail.com\", \"otp\": 643987}', 'SENT', 793843, '2023-08-11 04:21:21'),
(81, 1, '{\"to\": \"aashivyas2001@gmail.com\"}', 'SENT', 11543, '2023-08-11 04:23:45'),
(82, 8, '{\"to\": \"raj.we2code@gmail.com\", \"admin_name\": \"Raj\", \"user_email\": \"aashivyas2001@gmail.com\"}', 'SENT', 11543, '2023-08-11 04:23:45'),
(83, 7, '{\"to\": \"nidhisavner843@gmail.com\", \"otp\": 432881}', 'SENT', 11615, '2023-08-11 04:24:27'),
(84, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Driver\", \"company_name\": \"Blaade\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9874563210\"}', 'SENT', 832365, '2023-08-11 04:24:37'),
(85, 1, '{\"to\": \"nidhisavner843@gmail.com\"}', 'SENT', 838393, '2023-08-11 04:25:28'),
(86, 8, '{\"to\": \"raj.we2code@gmail.com\", \"admin_name\": \"Raj\", \"user_email\": \"nidhisavner843@gmail.com\"}', 'SENT', 838393, '2023-08-11 04:25:28'),
(87, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Postmen \", \"company_name\": \"Money Land\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9874563210\"}', 'SENT', 865138, '2023-08-11 04:25:55'),
(88, 7, '{\"to\": \"sagar.we2code@gmail.com\", \"otp\": 892054}', 'SENT', 15818, '2023-08-11 05:05:15'),
(89, 1, '{\"to\": \"sagar.we2code@gmail.com\"}', 'SENT', 12172, '2023-08-11 05:06:36'),
(90, 8, '{\"to\": \"raj.we2code@gmail.com\", \"admin_name\": \"Raj\", \"user_email\": \"sagar.we2code@gmail.com\"}', 'SENT', 12172, '2023-08-11 05:06:36'),
(91, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Hr\", \"company_name\": \"We2code\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"8520147963\"}', 'SENT', 14180, '2023-08-11 06:21:18'),
(92, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": \"Gourav \", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"7247935400\"}', 'SENT', 17224, '2023-08-11 06:39:25'),
(93, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Hr\", \"company_name\": \"We2code\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9874563210\"}', 'SENT', 15715, '2023-08-11 10:05:19'),
(94, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9857412034\"}', 'SENT', 12603, '2023-08-11 11:40:00'),
(95, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Potmen\", \"company_name\": \"Blaade\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9857412034\"}', 'SENT', 11639, '2023-08-11 11:40:06'),
(96, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Hr\", \"company_name\": \"We2code\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9857412034\"}', 'SENT', 11865, '2023-08-11 11:41:42'),
(97, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Land\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"8520147963\"}', 'SENT', 14833, '2023-08-11 11:42:18'),
(98, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Land\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"8520147963\"}', 'SENT', 12554, '2023-08-11 11:45:20'),
(99, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Land\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"8520147963\"}', 'SENT', 16330, '2023-08-11 11:47:28'),
(100, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Land\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"8520147963\"}', 'SENT', 11317, '2023-08-11 11:50:11'),
(101, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Land\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"8520147963\"}', 'SENT', 15455, '2023-08-11 11:59:13'),
(102, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"employee_name\": \"Dipti rathore\", \"employee_email\": \"dipti@gmail.com\", \"employee_skill\": \"Sales, Retail, & Customer Support Occupations,Healthcare Occupations\", \"employee_contact_no\": \"7410147852\"}', 'SENT', 19955, '2023-08-11 12:06:02'),
(103, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Gourav choudary\", \"interview_date\": \"2023-08-17\"}', 'SENT', 16871, '2023-08-11 12:12:18'),
(104, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Gourav choudary\", \"interview_date\": \"2023-08-15\"}', 'SENT', 1031076, '2023-08-11 12:12:27'),
(105, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Gourav \", \"interview_date\": \"2023-08-31\"}', 'SENT', 11623, '2023-08-11 12:53:36'),
(106, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Dipti rathore\", \"interview_date\": \"2023-09-16\"}', 'SENT', 1056039, '2023-08-11 12:53:39'),
(108, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Dipti rathore\", \"interview_date\": \"2023-09-16\"}', 'SENT', 12804, '2023-08-12 04:49:20'),
(107, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Gourav \", \"interview_date\": \"2023-08-31\"}', 'SENT', 1051850, '2023-08-11 12:54:03'),
(109, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Dipti rathore\", \"interview_date\": \"2023-09-16\"}', 'SENT', 1087402, '2023-08-12 04:49:27'),
(110, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": null, \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 16924, '2023-08-12 06:10:09'),
(111, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Rohan Dhakad\", \"interview_date\": \"2023-08-12\"}', 'SENT', 12769, '2023-08-12 06:25:14'),
(112, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Gourav \", \"interview_date\": \"2023-08-24\"}', 'SENT', 11370, '2023-08-16 05:27:43'),
(113, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Gourav \", \"interview_date\": \"2023-08-23\"}', 'SENT', 13811, '2023-08-16 05:28:44'),
(114, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Gourav \", \"interview_date\": \"2023-08-22\"}', 'SENT', 12025, '2023-08-16 05:29:32'),
(115, 7, '{\"to\": \"aashivyas2001@gmail.com\", \"otp\": 732123}', 'SENT', 14249, '2023-08-16 06:30:39'),
(116, 1, '{\"to\": \"aashivyas2001@gmail.com\"}', 'SENT', 16037, '2023-08-16 06:32:48'),
(117, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"aashivyas2001@gmail.com\"}', 'SENT', 16037, '2023-08-16 06:32:48'),
(118, 7, '{\"to\": \"apurvavyas3@gmail.com\", \"otp\": 409663}', 'SENT', 13837, '2023-08-16 06:40:41'),
(119, 1, '{\"to\": \"apurvavyas3@gmail.com\"}', 'SENT', 17222, '2023-08-16 06:42:18'),
(120, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"apurvavyas3@gmail.com\"}', 'SENT', 17222, '2023-08-16 06:42:18'),
(121, 7, '{\"to\": \"apurvavya3@gmail.com\", \"otp\": 980267}', 'SENT', 18093, '2023-08-16 06:49:50'),
(122, 7, '{\"to\": \"apurvavyas@3Gmail.com\", \"otp\": 915469}', 'SENT', 16981, '2023-08-16 06:54:42'),
(123, 7, '{\"to\": \"aashivyas2001@gmail.com\", \"otp\": 401091}', 'SENT', 17698, '2023-08-16 06:57:21'),
(124, 1, '{\"to\": \"aashivyas2001@gmail.com\"}', 'SENT', 17419, '2023-08-16 06:58:27'),
(125, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"aashivyas2001@gmail.com\"}', 'SENT', 17419, '2023-08-16 06:58:27'),
(126, 6, '{\"to\": \"aashivyas2001@gmail.com\", \"name\": null, \"reset_link\": \"https://canjobs.vercel.app/resetpassword/user:2478d80d891220b414c392e93c7fc1c3\"}', 'SENT', 11140, '2023-08-16 06:59:50'),
(127, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9517538264\"}', 'SENT', 19661, '2023-08-16 07:03:47'),
(128, 7, '{\"to\": \"aashivyas2001@gmail.com\", \"otp\": 676565}', 'SENT', 11744, '2023-08-16 07:06:18'),
(129, 1, '{\"to\": \"aashivyas2001@gmail.com\"}', 'SENT', 13286, '2023-08-16 07:07:24'),
(130, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"aashivyas2001@gmail.com\"}', 'SENT', 13286, '2023-08-16 07:07:24'),
(131, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Home worker\", \"company_name\": null, \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9517538264\"}', 'SENT', 13483, '2023-08-16 07:10:34'),
(132, 7, '{\"to\": \"aashivyas2001@gmail.com\", \"otp\": 319218}', 'SENT', 16355, '2023-08-16 07:24:23'),
(133, 1, '{\"to\": \"aashivyas2001@gmail.com\"}', 'SENT', 13681, '2023-08-16 07:25:55'),
(134, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"aashivyas2001@gmail.com\"}', 'SENT', 13681, '2023-08-16 07:25:55'),
(135, 7, '{\"to\": \"aashivyas2001@gmail.com\", \"otp\": 253609}', 'SENT', 15932, '2023-08-16 07:29:03'),
(136, 1, '{\"to\": \"aashivyas2001@gmail.com\"}', 'SENT', 11622, '2023-08-16 07:31:49'),
(137, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"aashivyas2001@gmail.com\"}', 'SENT', 11622, '2023-08-16 07:31:49'),
(138, 7, '{\"to\": \"aashivyas2001@gmail.com\", \"otp\": 364069}', 'SENT', 16644, '2023-08-16 07:35:19'),
(139, 1, '{\"to\": \"aashivyas2001@gmail.com\"}', 'SENT', 15835, '2023-08-16 07:37:44'),
(140, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"aashivyas2001@gmail.com\"}', 'SENT', 15835, '2023-08-16 07:37:44'),
(141, 7, '{\"to\": \"aashivyas2001@gmail.com\", \"otp\": 665995}', 'SENT', 13579, '2023-08-16 08:19:51'),
(142, 1, '{\"to\": \"aashivyas2001@gmail.com\"}', 'SENT', 11731, '2023-08-16 08:21:13'),
(143, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"aashivyas2001@gmail.com\"}', 'SENT', 11731, '2023-08-16 08:21:13'),
(144, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9519511590\"}', 'SENT', 16116, '2023-08-16 08:23:41'),
(145, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Land\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"9519511590\"}', 'SENT', 1447446, '2023-08-16 08:23:58'),
(146, 6, '{\"to\": \"aashivyas2001@gmail.com\", \"name\": null, \"reset_link\": \"https://canjobs.vercel.app/resetpassword/user:2478d80d891220b414c392e93c7fc1c3\"}', 'SENT', 14164, '2023-08-16 08:26:51'),
(147, 9, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React Developeer\", \"admin_name\": \"Aashi\", \"website_url\": \"jhgbh.com\", \"company_name\": null, \"job_location\": \"aland islands\", \"job_description\": \"tgfhfh\"}', 'SENT', 18023, '2023-08-16 08:44:03'),
(148, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"candidate_name\": \"Aashi vyas\", \"interview_date\": \"2023-08-17\"}', 'SENT', 18142, '2023-08-16 13:09:33'),
(149, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React Developeer\", \"company_name\": \"Lost bird\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,React js\", \"employee_contact_no\": \"9519511590\"}', 'SENT', 19350, '2023-08-17 04:34:49'),
(150, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Nurse\", \"company_name\": \"Money Land\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,React js\", \"employee_contact_no\": \"9519511590\"}', 'SENT', 1491035, '2023-08-17 04:34:59'),
(151, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Nurse\", \"company_name\": \"Money Land\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,React js\", \"employee_contact_no\": \"9519511590\"}', 'SENT', 1496688, '2023-08-17 04:35:03'),
(152, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,React js\", \"employee_contact_no\": \"9519511590\"}', 'SENT', 1513118, '2023-08-17 04:35:14'),
(153, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,React js\", \"employee_contact_no\": \"9519511590\"}', 'SENT', 1525677, '2023-08-17 04:35:17'),
(154, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Potmen\", \"company_name\": \"Blaade\", \"employee_name\": \"utkarsh\", \"employee_email\": \"utkarsh.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"96302587410\"}', 'SENT', 13163, '2023-08-19 12:37:40'),
(155, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": \"utkarsh\", \"employee_email\": \"utkarsh.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"96302587410\"}', 'SENT', 1544290, '2023-08-19 12:37:42'),
(156, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money Land\", \"candidate_name\": \"Aashi vyas\", \"interview_date\": \"2023-08-24\"}', 'SENT', 17178, '2023-08-19 13:00:21'),
(157, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Gourav \", \"interview_date\": \"2023-08-22\"}', 'SENT', 1566981, '2023-08-19 13:00:26'),
(158, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"candidate_name\": \"Aashi vyas\", \"interview_date\": \"2023-08-19\"}', 'SENT', 12612, '2023-08-19 13:08:14'),
(159, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Bussiness Development officer\", \"company_name\": \"Lost bird\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 17459, '2023-08-19 17:20:10'),
(160, 9, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Manager\", \"admin_name\": \"Aashi\", \"website_url\": \"we2code.com\", \"company_name\": \"TESTING\", \"job_location\": \"guinea\", \"job_description\": \"Testing\"}', 'SENT', 18455, '2023-08-19 17:26:11'),
(161, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Manager\", \"company_name\": \"TESTING\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 1605160, '2023-08-19 17:26:48'),
(162, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Postmen \", \"company_name\": \"Money Land\", \"candidate_name\": \"Shivam thakur\", \"interview_date\": \"2023-08-21\"}', 'SENT', 11107, '2023-08-21 17:05:57'),
(163, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"name\": \"Anuhsree\", \"reset_link\": \"https://canjobs.vercel.app/resetpassword/user:587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 13496, '2023-08-23 05:27:12'),
(164, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Manager\", \"company_name\": \"TESTING\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"8520147963\"}', 'SENT', 16661, '2023-08-25 06:12:39'),
(165, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React Developeer\", \"company_name\": \"Lost bird\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"8520147963\"}', 'SENT', 16583, '2023-08-25 06:14:13'),
(166, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Nurse\", \"company_name\": \"Money Land\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"8520147963\"}', 'SENT', 1658237, '2023-08-25 06:14:18'),
(167, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"We2code\", \"employee_name\": \"Gourav \", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 17494, '2023-08-25 08:55:04'),
(168, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"We2code\", \"employee_name\": \"Raj Testing\", \"employee_email\": \"rajtest@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"1234567890\"}', 'SENT', 1679304, '2023-08-25 08:55:06'),
(169, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data Analysts\", \"company_name\": \"Money \", \"employee_name\": null, \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 13627, '2023-08-25 09:17:41'),
(170, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data writer job\", \"company_name\": \"Money \", \"candidate_name\": \"Gourav \", \"interview_date\": \"2023-08-25\"}', 'SENT', 13304, '2023-08-25 09:27:20'),
(171, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data writer job\", \"company_name\": \"Money \", \"candidate_name\": \"Aashi vyas\", \"interview_date\": \"2023-08-28\"}', 'SENT', 11198, '2023-08-25 09:29:55'),
(172, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Bakers \", \"company_name\": \"Money \", \"candidate_name\": \"Aashi vyas\", \"interview_date\": \"2023-08-26\"}', 'SENT', 11163, '2023-08-25 09:33:38'),
(173, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Bakers \", \"company_name\": \"Money \", \"candidate_name\": \"Anuhsree\", \"interview_date\": \"2023-08-25\"}', 'SENT', 19595, '2023-08-25 09:34:07'),
(174, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Home worker\", \"company_name\": \"Lost bird\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"8520147963\"}', 'SENT', 19858, '2023-08-26 05:02:26'),
(175, 9, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"admin_name\": \"Aashi\", \"website_url\": \"ddd.com\", \"company_name\": \"Money \", \"job_location\": \"afghanistan\", \"job_description\": \"wsdad xasd fgrfgh thfhfgh fthgsg tryhdfgtrt dfg vdfrtrg dfgtgfssa sdfdg drgdgg rg rf er ertet  rgr er rewre rtert rdtrtertrtretret ret t  t rewretrtretr5tyrg r trtrtgrgf5rtrgvv gfbfgrt grthh fghrtfg ftgfgrth fgbvc gffhrthftg hvcb rfgtrfgr ththgfbh tgrtg rththb fggrtgrt yhthgfbh rftgertr ytrhgfbh trgrtgrtyth gfbhfg rtgrytryh\"}', 'SENT', 13456, '2023-08-26 05:24:13'),
(176, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data writer\", \"company_name\": \"Money \", \"employee_name\": null, \"employee_email\": \"sagar.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 12844, '2023-08-26 06:05:10'),
(177, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Blaade\", \"employee_name\": null, \"employee_email\": \"sagar.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 15417, '2023-08-26 06:21:25'),
(178, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul\", \"employee_name\": null, \"employee_email\": \"sagar.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 1776762, '2023-08-26 06:21:29'),
(179, 9, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"sdsfdsf\", \"admin_name\": \"Aashi\", \"website_url\": \"ddd.com\", \"company_name\": \"Amul\", \"job_location\": \"afghanistan\", \"job_description\": null}', 'SENT', 18901, '2023-08-26 10:11:50'),
(180, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"sdsfdsf\", \"company_name\": \"Amul\", \"employee_name\": \"HR We2code\", \"employee_email\": \"hr.we2codepvtltd@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 14961, '2023-08-26 10:12:04'),
(181, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"sdsfdsf\", \"company_name\": \"Money \", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 14178, '2023-08-26 11:02:20'),
(182, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"sdsfdsf\", \"company_name\": \"Money \", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 17295, '2023-08-26 11:07:21'),
(183, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"sdsfdsf\", \"company_name\": \"Money \", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 12810, '2023-08-26 11:22:58'),
(184, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money \", \"candidate_name\": \"Aashi vyas\", \"interview_date\": \"2023-08-28\"}', 'SENT', 14081, '2023-08-26 12:18:40'),
(185, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"getse\", \"employee_name\": \"HR We2code\", \"employee_email\": \"hr.we2codepvtltd@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 13592, '2023-08-28 05:17:12'),
(186, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money \", \"employee_name\": \"HR We2code\", \"employee_email\": \"hr.we2codepvtltd@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 18214, '2023-08-28 05:20:55'),
(187, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Potmen\", \"company_name\": \"getse\", \"employee_name\": \"HR We2code\", \"employee_email\": \"hr.we2codepvtltd@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 12070, '2023-08-28 05:22:54'),
(188, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"getse\", \"employee_name\": \"Gourav choudary\", \"employee_email\": \"g.choudhary.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"4145222451\"}', 'SENT', 12133, '2023-08-28 09:34:42'),
(189, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"sdsfdsf\", \"company_name\": \"Money \", \"employee_name\": \"Gourav choudary\", \"employee_email\": \"g.choudhary.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"4145222451\"}', 'SENT', 1887390, '2023-08-28 09:34:51'),
(190, 9, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"admin_name\": \"Aashi\", \"website_url\": \"www.careerattcs.com\", \"company_name\": \"Money \", \"job_location\": \"american samoa\", \"job_description\": null}', 'SENT', 18536, '2023-08-28 10:46:16'),
(191, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money \", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 11519, '2023-08-29 21:59:37'),
(192, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"getse\", \"candidate_name\": \"Gourav choudary\", \"interview_date\": \"2023-09-07\"}', 'SENT', 17080, '2023-08-31 08:52:51'),
(193, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"getse\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 12593, '2023-09-01 09:23:56'),
(194, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"We2code\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 1934391, '2023-09-01 09:23:57'),
(195, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React Developeer\", \"company_name\": \"Lost bird\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 1948286, '2023-09-01 09:24:00'),
(196, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Money \", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 17540, '2023-09-01 11:32:24'),
(197, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money \", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 1962588, '2023-09-01 11:32:25'),
(198, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Postmen\", \"company_name\": \"Money \", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 1977721, '2023-09-01 11:32:27'),
(199, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money \", \"employee_name\": \"utkarsh\", \"employee_email\": \"utkarsh.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"96302587410\"}', 'SENT', 12326, '2023-09-01 11:41:13'),
(200, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"getse\", \"employee_name\": \"utkarsh\", \"employee_email\": \"utkarsh.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"96302587410\"}', 'SENT', 1996499, '2023-09-01 11:41:15'),
(201, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Money \", \"employee_name\": \"utkarsh\", \"employee_email\": \"utkarsh.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"96302587410\"}', 'SENT', 2003252, '2023-09-01 11:41:17'),
(202, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"getse\", \"employee_name\": \"Gourav \", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 11372, '2023-09-04 06:07:50'),
(203, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"getse\", \"employee_name\": null, \"employee_email\": \"sagar.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 2029774, '2023-09-04 06:07:53'),
(204, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Money Money \", \"candidate_name\": \"Sagar shah\", \"interview_date\": \"2023-09-05\"}', 'SENT', 12033, '2023-09-04 06:38:20'),
(205, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Money Money \", \"candidate_name\": \"Sagar shah\", \"interview_date\": \"2023-09-05\"}', 'SENT', 19726, '2023-09-04 06:42:43');
INSERT INTO `email` (`id`, `email_template_id`, `email_json`, `status`, `group_id`, `created_at`) VALUES
(206, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money Money \", \"employee_name\": \"Sagar \", \"employee_email\": \"sagar.we2code@gmail.com\", \"employee_skill\": \"Organization Operations & Administrative Occupations,Science & Research Occupations,Travel, Attractions & Events Occupations,Legal Occupations,Farming, Fisheries & Forestry Occupations \", \"employee_contact_no\": \"8888555541\"}', 'SENT', 18374, '2023-09-04 09:19:20'),
(207, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Money Money \", \"employee_name\": \"Sagar \", \"employee_email\": \"sagar.we2code@gmail.com\", \"employee_skill\": \"Organization Operations & Administrative Occupations,Science & Research Occupations,Travel, Attractions & Events Occupations,Legal Occupations,Farming, Fisheries & Forestry Occupations \", \"employee_contact_no\": \"8888555541\"}', 'SENT', 2066518, '2023-09-04 09:19:21'),
(208, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"We2code\", \"employee_name\": \"Sagar \", \"employee_email\": \"sagar.we2code@gmail.com\", \"employee_skill\": \"Organization Operations & Administrative Occupations,Science & Research Occupations,Travel, Attractions & Events Occupations,Legal Occupations,Farming, Fisheries & Forestry Occupations \", \"employee_contact_no\": \"8888555541\"}', 'SENT', 2071256, '2023-09-04 09:19:23'),
(209, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Money \", \"employee_name\": \"Sagar \", \"employee_email\": \"sagar.we2code@gmail.com\", \"employee_skill\": \"Organization Operations & Administrative Occupations,Science & Research Occupations,Travel, Attractions & Events Occupations,Legal Occupations,Farming, Fisheries & Forestry Occupations \", \"employee_contact_no\": \"8888555541\"}', 'SENT', 2089391, '2023-09-04 09:19:24'),
(210, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Postmen\", \"company_name\": \"Money Money \", \"employee_name\": \"Sagar \", \"employee_email\": \"sagar.we2code@gmail.com\", \"employee_skill\": \"Organization Operations & Administrative Occupations,Science & Research Occupations,Travel, Attractions & Events Occupations,Legal Occupations,Farming, Fisheries & Forestry Occupations \", \"employee_contact_no\": \"8888555541\"}', 'SENT', 2096029, '2023-09-04 09:19:26'),
(211, 7, '{\"to\": \"sagar.we2code@gmail.com\", \"otp\": 224315}', 'SENT', 15982, '2023-09-04 11:06:51'),
(212, 6, '{\"to\": \"sagar.we2code@gmail.com\", \"name\": \"Sagar \", \"reset_link\": \"https://canjobs.vercel.app/resetpassword/user:b64e19581565d85e9561c4f7648947ff\"}', 'SENT', 15332, '2023-09-04 11:12:31'),
(213, 1, '{\"to\": \"sagar.we2code@gmail.com\"}', 'SENT', 15405, '2023-09-04 11:14:06'),
(214, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"sagar.we2code@gmail.com\"}', 'SENT', 15405, '2023-09-04 11:14:06'),
(215, 6, '{\"to\": \"sagar.we2code@gmail.com\", \"name\": null, \"reset_link\": \"https://canjobs.vercel.app/resetpassword/user:b64e19581565d85e9561c4f7648947ff\"}', 'SENT', 17062, '2023-09-04 11:16:10'),
(216, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Money Money \", \"candidate_name\": \"Gourav choudary\", \"interview_date\": \"2023-09-07\"}', 'SENT', 16961, '2023-09-04 11:18:21'),
(217, 6, '{\"to\": \"sagar.we2code@gmail.com\", \"name\": null, \"reset_link\": \"https://canjobs.vercel.app/resetpassword/user:b64e19581565d85e9561c4f7648947ff\"}', 'SENT', 2164197, '2023-09-04 11:18:47'),
(218, 7, '{\"to\": \"sagar.we2code@gmail.com\", \"otp\": 275134}', 'SENT', 15340, '2023-09-04 11:25:01'),
(219, 1, '{\"to\": \"sagar.we2code@gmail.com\"}', 'SENT', 19995, '2023-09-04 11:25:42'),
(220, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"sagar.we2code@gmail.com\"}', 'SENT', 19995, '2023-09-04 11:25:42'),
(221, 7, '{\"to\": \"sagar.we2code@gmail.com\", \"otp\": 776537}', 'SENT', 19232, '2023-09-04 12:11:16'),
(222, 1, '{\"to\": \"sagar.we2code@gmail.com\"}', 'SENT', 16401, '2023-09-04 12:12:55'),
(223, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"sagar.we2code@gmail.com\"}', 'SENT', 16401, '2023-09-04 12:12:55'),
(224, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money Money \", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 17584, '2023-09-05 06:41:21'),
(225, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Money Money \", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 2246101, '2023-09-05 06:41:25'),
(226, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"We2code\", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 2256054, '2023-09-05 06:41:28'),
(227, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Money \", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 2265597, '2023-09-05 06:41:31'),
(228, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Potmen\", \"company_name\": \"getse\", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 2272627, '2023-09-05 06:41:36'),
(229, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Postmen\", \"company_name\": \"Money Money \", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 2286607, '2023-09-05 06:41:40'),
(230, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Home worker\", \"company_name\": \"Lost bird\", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 2294634, '2023-09-05 06:41:47'),
(231, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React Developeer\", \"company_name\": \"Lost bird\", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 2307713, '2023-09-05 06:41:50'),
(232, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Bussiness Development officer\", \"company_name\": \"Lost bird\", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 2317992, '2023-09-05 06:41:57'),
(233, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"sdsfdsf\", \"company_name\": \"Money Money \", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 2326349, '2023-09-05 06:41:59'),
(236, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money Money \", \"employee_name\": \"Gourav choudary\", \"employee_email\": \"g.choudhary.we2code@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": \"4145222451\"}', 'SENT', 16974, '2023-09-05 06:55:16'),
(234, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Money \", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 2322778, '2023-09-05 06:42:01'),
(235, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Manager\", \"company_name\": \"TESTING\", \"employee_name\": \"Pikashoo\", \"employee_email\": \"gouravchoudhary9888@gmail.com\", \"employee_skill\": \"Food & Beverage Occupations,Healthcare Occupations,Sales, Retail, & Customer Support Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"7247935400\"}', 'SENT', 2349670, '2023-09-05 06:42:03'),
(237, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Money Money \", \"employee_name\": \"Pikashoo\", \"employee_email\": \"rahul.verma.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Food & Beverage Occupations,Technology Occupations,Finance & Accounting Occupations\", \"employee_contact_no\": \"12345567890\"}', 'SENT', 17136, '2023-09-05 10:15:29'),
(238, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Money Money \", \"employee_name\": \"Raj Testing\", \"employee_email\": \"rajtest@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"1234567890\"}', 'SENT', 2379280, '2023-09-05 10:15:35'),
(239, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"Money Money \", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,React js,Food & Beverage Occupations,Technology Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Architecture & Engineering Occupations,C\", \"employee_contact_no\": \"9519511590\"}', 'SENT', 2378428, '2023-09-05 10:16:16'),
(240, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"candidate_name\": \"Pikashoo\", \"interview_date\": \"2023-09-05\"}', 'SENT', 12592, '2023-09-05 11:21:42'),
(241, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Money \", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,React js,Food & Beverage Occupations,Technology Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Architecture & Engineering Occupations,C\", \"employee_contact_no\": \"9519511590\"}', 'SENT', 13636, '2023-09-05 17:05:06'),
(242, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Pikashoo\", \"employee_email\": \"rahul.verma.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations,Finance & Accounting Occupations\", \"employee_contact_no\": \"12345567890\"}', 'SENT', 2415695, '2023-09-05 17:05:53'),
(243, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money Money \", \"employee_name\": \"Pikashoo\", \"employee_email\": \"rahul.verma.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations,Finance & Accounting Occupations\", \"employee_contact_no\": \"12345567890\"}', 'SENT', 2428142, '2023-09-05 17:05:58'),
(244, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Money \", \"employee_name\": \"Pikashoo\", \"employee_email\": \"rahul.verma.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations,Finance & Accounting Occupations\", \"employee_contact_no\": \"12345567890\"}', 'SENT', 2431439, '2023-09-05 17:06:00'),
(245, 7, '{\"to\": \"utkarsh.we2code@gmail.com\", \"otp\": 781604}', 'SENT', 12168, '2023-09-06 06:54:06'),
(246, 1, '{\"to\": \"utkarsh.we2code@gmail.com\"}', 'SENT', 18659, '2023-09-06 06:56:20'),
(247, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"utkarsh.we2code@gmail.com\"}', 'SENT', 18659, '2023-09-06 06:56:20'),
(248, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 19488, '2023-09-06 06:59:42'),
(249, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 13987, '2023-09-06 12:18:46'),
(250, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 2492234, '2023-09-06 12:18:48'),
(251, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"NIdhi savner\", \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"9632587410\"}', 'SENT', 2508659, '2023-09-06 12:18:50'),
(252, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,React js,Food & Beverage Occupations,Technology Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Architecture & Engineering Occupations,C\", \"employee_contact_no\": \"9519511590\"}', 'SENT', 2516425, '2023-09-06 12:18:51'),
(253, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Home worker\", \"company_name\": \"Lost bird\", \"employee_name\": \"NIdhi savner\", \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"9632587410\"}', 'SENT', 15191, '2023-09-08 09:28:46'),
(254, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Bussiness Development officer\", \"company_name\": \"Lost bird\", \"employee_name\": \"NIdhi savner\", \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"9632587410\"}', 'SENT', 2533458, '2023-09-08 09:28:49'),
(255, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React Developeer\", \"company_name\": \"Lost bird\", \"employee_name\": \"NIdhi savner\", \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"9632587410\"}', 'SENT', 2549700, '2023-09-08 09:28:51'),
(256, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"sdsfdsf\", \"company_name\": \"Money Money \", \"employee_name\": \"NIdhi savner\", \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"9632587410\"}', 'SENT', 2552758, '2023-09-08 09:28:56'),
(257, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money Money \", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 13414, '2023-09-08 10:35:06'),
(258, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Home worker\", \"company_name\": \"Lost bird\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 2571919, '2023-09-08 10:35:09'),
(259, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 2589796, '2023-09-08 10:35:12'),
(260, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"We2code\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 2593477, '2023-09-08 10:35:14'),
(261, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 2603509, '2023-09-08 10:35:18'),
(262, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"NIdhi savner\", \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"9632587410\"}', 'SENT', 2618926, '2023-09-08 10:35:23'),
(263, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 2577812, '2023-09-08 10:40:06'),
(264, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money Money \", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 2636385, '2023-09-08 10:40:08'),
(265, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"We2code\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 2647211, '2023-09-08 10:40:11'),
(266, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Bussiness Development officer\", \"company_name\": \"Lost bird\", \"employee_name\": \"NIdhi savner\", \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"9632587410\"}', 'SENT', 19407, '2023-09-08 11:47:31'),
(267, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React Developeer\", \"company_name\": \"Lost bird\", \"employee_name\": \"NIdhi savner\", \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"9632587410\"}', 'SENT', 2662689, '2023-09-08 11:47:34'),
(268, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"sdsfdsf\", \"company_name\": \"Money Money \", \"employee_name\": \"NIdhi savner\", \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"9632587410\"}', 'SENT', 2674371, '2023-09-08 11:47:40'),
(269, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 16787, '2023-09-09 05:04:11'),
(270, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money Money \", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 2698247, '2023-09-09 05:04:14'),
(271, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"We2code\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 2702516, '2023-09-09 05:04:15'),
(272, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 2713850, '2023-09-09 05:04:22'),
(273, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money Money \", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 2725644, '2023-09-09 05:04:25'),
(274, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"We2code\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 2739827, '2023-09-09 05:04:29'),
(275, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": null, \"employee_email\": \"nidhisavner843@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 11716, '2023-09-09 05:15:02'),
(276, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Money Money \", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 18108, '2023-09-09 05:15:09'),
(277, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Money Money \", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 2763961, '2023-09-09 05:15:17'),
(278, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,React js,Food & Beverage Occupations,Technology Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Architecture & Engineering Occupations,C\", \"employee_contact_no\": \"9519511590\"}', 'SENT', 2778242, '2023-09-09 05:15:55'),
(279, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money Money \", \"employee_name\": \"Aashi vyas\", \"employee_email\": \"aashivyas2001@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,React js,Food & Beverage Occupations,Technology Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Architecture & Engineering Occupations,C\", \"employee_contact_no\": \"9519511590\"}', 'SENT', 2787491, '2023-09-09 05:16:00'),
(280, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Money \", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 17855, '2023-09-09 05:29:34'),
(281, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Potmen\", \"company_name\": \"getse\", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 2805833, '2023-09-09 05:29:36'),
(282, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"NIdhi savner\", \"employee_email\": \"nidhi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations,Technology Occupations\", \"employee_contact_no\": \"9632587410\"}', 'SENT', 2813953, '2023-09-09 05:29:45'),
(283, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data analyst\", \"company_name\": \"We2code\", \"employee_name\": \"Raj Testing\", \"employee_email\": \"rajtest@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Food & Beverage Occupations\", \"employee_contact_no\": \"1234567890\"}', 'SENT', 2826084, '2023-09-09 05:29:52'),
(284, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Money \", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 17540, '2023-09-09 05:36:26'),
(285, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Potmen\", \"company_name\": \"getse\", \"employee_name\": \"Shivam thakur\", \"employee_email\": \"shivamthakur@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Repair, Maintenance & Installation Occupations,Finance & Accounting Occupations,Construction & Extraction Occupations\", \"employee_contact_no\": \"7415000034\"}', 'SENT', 2842283, '2023-09-09 05:36:29'),
(286, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"Money Money \", \"employee_name\": \"Anuhsree\", \"employee_email\": \"aashi.we2code@gmail.com\", \"employee_skill\": \"Healthcare Occupations,Organization Operations & Administrative Occupations\", \"employee_contact_no\": \"8585858585\"}', 'SENT', 2856708, '2023-09-09 05:36:37'),
(287, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Data dATA\", \"company_name\": \"Money Money \", \"employee_name\": null, \"employee_email\": \"nidhisavner843@gmail.com\", \"employee_skill\": null, \"employee_contact_no\": null}', 'SENT', 19905, '2023-09-09 08:35:46'),
(288, 9, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"manager\", \"admin_name\": \"Aashi\", \"website_url\": \"www.careerattcs.com\", \"company_name\": \"Money Money \", \"job_location\": \"banglore\", \"job_description\": \" hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO\"}', 'SENT', 14520, '2023-09-11 05:08:40');

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE `email_template` (
  `id` int(101) NOT NULL,
  `email_type` varchar(101) NOT NULL,
  `subject` longtext NOT NULL,
  `message` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`id`, `email_type`, `subject`, `message`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'employee_signup', 'a new user registered', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n  <meta charset=\"UTF-8\">\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <title>Email Template</title>\n</head>\n\n<body>\n  <div\n    style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n    <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n      Congratulations!\n    </div>\n    <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n      style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n      <tbody>\n        <tr>\n          <td>\n            <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n              style=\"min-width:100%;background: transparent;\">\n              <tbody>\n                <tr>\n                  <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                    <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                      <img alt=\"Canjobs\" src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                        style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\" data-bit=\"iit\"\n                        width=\"200\" height=\"auto\"> </a>\n                  </td>\n                </tr>\n              </tbody>\n            </table>\n          </td>\n        </tr>\n        <tr>\n          <td\n            style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n            <div style=\"color: black;font-size:medium;\">\n              <p>Congratulations! We are excited to inform you that your account registration on Canjobs was successful.  Welcome to our community!\n              </p>\n              <p>\n                We encourage you to take full advantage of the resources and opportunities available to you on Canjobs. If you have any questions, require assistance, or would like guidance on navigating our  platform, please  don\'t hesitate to contact our support team at <b>[Organization Email Address]</b>. We are here to help you make the most of your membership.  </p>\n  </div>\n          </td>\n        </tr>\n        <tr>\n          <td style=\"background-color:#f3f2f0;padding:24px\">\n            <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n            <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n              style=\"font-size:16px;text-align: center;\">\n              <tbody>\n                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i>\n                      Please take the necessary steps to ensure that the your\n                      account is set up correctly and that they have the appropriate\n                      permissions for their role. If you have any questions or\n                      require any additional information, please don\'t hesitate to\n                      reach out to me. <b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                <tr>\n                  <td> © 2023 Canjobs </td>\n                </tr>\n              </tbody>\n            </table>\n          </td>\n        </tr>\n      </tbody>\n    </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n      data-bit=\"iit\">\n    <font color=\"#888888\"> </font>\n  </div>\n</body>\n\n</html>', 1, '2023-05-15 08:39:52', '2023-09-04 12:48:26'),
(2, 'company_sign_up', 'a new company registered', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n  <meta charset=\"UTF-8\">\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <title>Email Template</title>\n</head>\n\n<body>\n  <div\n    style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n    <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n      Congratulations!\n    </div>\n    <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n      style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n      <tbody>\n        <tr>\n          <td>\n            <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n              style=\"min-width:100%;background: transparent;\">\n              <tbody>\n                <tr>\n                  <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                    <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                      <img alt=\"Canjobs\" src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                        style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\" data-bit=\"iit\"\n                        width=\"200\" height=\"auto\"> </a>\n                  </td>\n                </tr>\n              </tbody>\n            </table>\n          </td>\n        </tr>\n        <tr>\n          <td\n            style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n            <div style=\"color: black;font-size:medium;\">\n              <p>Congratulations! We are excited to inform you that your account registration on Canjobs was successful.  Welcome to our community!\n              </p>\n              <p>\n                We encourage you to take full advantage of the resources and opportunities available to you on Canjobs. If you have any questions, require assistance, or would like guidance on navigating our  platform, please  don\'t hesitate to contact our support team at <b>[Organization Email Address]</b>. We are here to help you make the most of your membership.  </p>\n  </div>\n          </td>\n        </tr>\n        <tr>\n          <td style=\"background-color:#f3f2f0;padding:24px\">\n            <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n            <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n              style=\"font-size:16px;text-align: center;\">\n              <tbody>\n                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i>\n                      Please take the necessary steps to ensure that the user\'s\n                      account is set up correctly and that they have the appropriate\n                      permissions for their role. If you have any questions or\n                      require any additional information, please don\'t hesitate to\n                      reach out to me. <b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                <tr>\n                  <td> © 2023 Canjobs </td>\n                </tr>\n              </tbody>\n            </table>\n          </td>\n        </tr>\n      </tbody>\n    </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n      data-bit=\"iit\">\n    <font color=\"#888888\"> </font>\n  </div>\n</body>\n\n</html>', 1, '2023-05-15 08:43:30', '2023-06-12 07:29:50'),
(3, 'add_job_company', 'job posted successfully', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            job alerts !\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                            <p>Dear <b>{postjob_company_name}</b>,</p>\n                            <p>\n                                <br>\n                                We hope this message finds you well. We would like to inform you that a new job has been created on our platform. The details of the job are as follows::\n                                <br>\n                                <br>\n                                Job Title: <b>{postjob_job_title}</b>\n                                <br>\n                                Company: <b>{postjob_company_name}</b>\n                                <br>\n                                Location: <b>{job_location}</b>\n                                <br>\n                                Job Description:\n                                <b>{job_description}</b>\n                                <br><br>\n                                We believe this opportunity could be a great fit for your organization, and we encourage you to review the job posting and consider recommending suitable candidates. Interested individuals can apply directly through our platform or follow the instructions provided in the job posting.\n                            </p>\n                        </div>\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                                <tr>\n                                    <td> © 2023 Canjobs </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>', 1, '2023-05-15 08:46:49', '2023-06-13 09:10:10'),
(4, 'apply_on_job', 'job applied successfully', '<!DOCTYPE html>\n<html lang=\"en\">\n\n  <head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n  </head>\n\n  <body>\n    <div\n      style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n      <div\n        style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n        Congratulations!\n      </div>\n      <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n        cellpadding=\"0\" width=\"512\" align=\"center\"\n        style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n        <tbody>\n          <tr>\n            <td>\n              <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n                cellpadding=\"0\" width=\"100%\"\n                style=\"min-width:100%;background: transparent;\">\n                <tbody>\n                  <tr>\n                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                      <a href style=\"display:inline-block;text-decoration:none;\"\n                        target=\"_blank\">\n                        <img alt=\"Canjobs\"\n                          src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                          style=\"outline:none;text-decoration:none;display:block\"\n                          class=\"CToWUd\"\n                          data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                    </td>\n                  </tr>\n                </tbody>\n              </table>\n            </td>\n          </tr>\n          <tr>\n            <td\n              style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n              <div style=\"color: black;font-size:medium;\">\n                <p>Dear <b>{apply_on_job_company_name} Hiring Team</b>,</p>\n                <p>A new application has been received for the <b>{apply_on_job_job_title}</b>\n                  position. Please\n                  review and consider the candidate accordingly. Kindly\n                  acknowledge the receipt of the\n                  application and communicate next steps to the applicant.</p>\n                <p>Applicant\'s Details:</p>\n                <ul>\n                  <li>Name: {applyjob_applicant_name}</li>\n                  <li>Email: {applyjob_applicant_email}</li>\n                  <li>Contact Number: {applyjob_applicant_contact}</li>\n                  <li>\n                    Skills:\n                    <b>{applyjob_applicant_skills}</b></li>\n                </ul>\n                <p>Past Job Details:</p>\n                <ul>\n                  <li>\n                    Job Title: <b>{apply_on_job_job_title}</b>\n                  </li>\n\n                  <li>\n                    Company: <b>{apply_on_job_company_name}</b>\n                  </li>\n                </ul>\n              </div>\n            </td>\n          </tr>\n          <tr>\n            <td style=\"background-color:#f3f2f0;padding:24px\">\n              <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n              <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n                cellpadding=\"0\" width=\"100%\"\n                style=\"font-size:16px;text-align: center;\">\n                <tbody>\n                  <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                  <tr>\n                    <td\n                      style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                      <i> If you have any questions or require any further\n                        information, please do not hesitate to reach out to us.\n                        We are here to assist you throughout the hiring process.<b>[Organization\n                          Email Address]</b>.\n                      </i>\n                    </td>\n                  </tr>\n                  <tr>\n                    <td> © 2023 Canjobs </td>\n                  </tr>\n                </tbody>\n              </table>\n            </td>\n          </tr>\n        </tbody>\n      </table> <img alt role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\"\n        height=\"1\" class=\"CToWUd\"\n        data-bit=\"iit\">\n      <font color=\"#888888\"> </font>\n    </div>\n  </body>\n\n</html>', 1, '2023-05-15 08:47:34', '2023-08-11 12:03:27'),
(5, 'interview_schedule_employee', 'new interview scheduled', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            job alerts !\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                           <p>Dear <b>{interview_schedule_name}</b>,</p>\n                            <p>\n                                <br>\n                                We are confirming your scheduled interview for the position of <b>{interview_schedule_job_title} </b>at <b>{interview_schedule_company_name}</b>.\n\n                                <br>\n                                <br>\n\n                                Date: <b>{interview_schedule_interview_date}</b>\n                                <br>\n                                Please arrive on time and come prepared for the interview. If you have any questions or need to reschedule, please let us know.\n                                <br>  <br>\n                                Looking forward to meeting you.\n                            </p>\n                        </div>\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                                <tr>\n                                    <td> © 2023 Canjobs </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>', 1, '2023-05-15 08:48:39', '2023-06-13 09:14:44'),
(6, 'forget_password', 'reset password', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            Congratulations!\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                            <p>Dear <b>{name}</b>,</p>\n                            <p>\n                             We have received a request to reset your password for your account at Canjobs. To set a new password, please click on the following link: <b>{reset_link}</b>\n                                </p>\n                                </div>\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i>If you did not initiate this request, please disregard this email and ensure the security of your account. If you have any concerns or need assistance, please contact our support team at <b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"font-size: x-small;\"> © 2023 Canjobs </td>\n                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>', 1, '2023-05-15 09:53:18', '2023-06-12 09:10:51');
INSERT INTO `email_template` (`id`, `email_type`, `subject`, `message`, `is_active`, `created_at`, `updated_at`) VALUES
(7, 'otp_signup', 'one time password', '<!DOCTYPE html>\n<html lang=\"en\">\n\n  <head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n  </head>\n\n  <body>\n    <div\n      style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n      <div\n        style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n        Congratulations!\n      </div>\n      <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n        cellpadding=\"0\" width=\"512\" align=\"center\"\n        style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n        <tbody>\n          <tr>\n            <td>\n              <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n                cellpadding=\"0\" width=\"100%\"\n                style=\"min-width:100%;background: transparent;\">\n                <tbody>\n                  <tr>\n                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                      <a href style=\"display:inline-block;text-decoration:none;\"\n                        target=\"_blank\">\n                        <img alt=\"Canjobs\"\n                          src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                          style=\"outline:none;text-decoration:none;display:block\"\n                          class=\"CToWUd\"\n                          data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                    </td>\n                  </tr>\n                </tbody>\n              </table>\n            </td>\n          </tr>\n          <tr>\n            <td\n              style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n              <div style=\"color: black;font-size:medium;\">\n                <p>Account Verification OTP\n                </p>\n                <p>\n                  Please use the following One-Time Password (OTP) to verify\n                  your account at Canjobs: <b>{otp}</b>.\n                </div>\n              </td>\n            </tr>\n            <tr>\n              <td style=\"background-color:#f3f2f0;padding:24px\">\n                <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                <table role=\"presentation\" valign=\"top\" border=\"0\"\n                  cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                  style=\"font-size:16px;text-align: center;\">\n                  <tbody>\n                    <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                    <tr>\n                      <td\n                        style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                        <i>If you did not request this OTP or need\n                          assistance,\n                          please contact our support team at <b>[Organisation\n                            Email Address]</b>.\n                        </i>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td> © 2023 Canjobs </td>\n                    </tr>\n                  </tbody>\n                </table>\n              </td>\n            </tr>\n          </tbody>\n        </table> <img alt role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\"\n          height=\"1\" class=\"CToWUd\"\n          data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n      </div>\n    </body>\n\n  </html>', 1, '2023-05-15 09:54:33', '2023-06-12 07:32:30'),
(8, 'new_user_registered', 'New User registered ', '<!DOCTYPE html>\n<html lang=\"en\">\n\n  <head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n  </head>\n\n  <body>\n    <div\n      style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n      <div\n        style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n        Congratulations!\n      </div>\n      <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n        cellpadding=\"0\" width=\"512\" align=\"center\"\n        style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n        <tbody>\n          <tr>\n            <td>\n              <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n                cellpadding=\"0\" width=\"100%\"\n                style=\"min-width:100%;background: transparent;\">\n                <tbody>\n                  <tr>\n                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                      <a href style=\"display:inline-block;text-decoration:none;\"\n                        target=\"_blank\">\n                        <img alt=\"Canjobs\"\n                          src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                          style=\"outline:none;text-decoration:none;display:block\"\n                          class=\"CToWUd\"\n                          data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                    </td>\n                  </tr>\n                </tbody>\n              </table>\n            </td>\n          </tr>\n          <tr>\n            <td\n              style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n              <div style=\"color: black;font-size:medium;\">\n                <p>Dear <b>{admin_name}</b>,</p>\n                <p>I hope this message finds you well. I wanted to inform you\n                  that a new user has been registered on our platform. Below are\n                  the details of the newly created user:\n                </p>\n                <p>\n                  Email Address: <b>{user_email_address}</b>\n                </p>\n                </div>\n            </td>\n          </tr>\n          <tr>\n            <td style=\"background-color:#f3f2f0;padding:24px\">\n              <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n              <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n                cellpadding=\"0\" width=\"100%\"\n                style=\"font-size:16px;text-align: center;\">\n                <tbody>\n                  <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i> Please take the necessary steps to ensure that the user\'s\n                  account is set up correctly and that they have the appropriate\n                  permissions for their role. If you have any questions or\n                  require any additional information, please don\'t hesitate to\n                  reach out to me <b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                  <tr>\n                    <td> © 2023 Canjobs </td>\n                  </tr>\n                </tbody>\n              </table>\n            </td>\n          </tr>\n        </tbody>\n      </table> <img alt role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\"\n        height=\"1\" class=\"CToWUd\"\n        data-bit=\"iit\">\n      <font color=\"#888888\"> </font>\n    </div>\n  </body>\n\n</html>', 1, '2023-05-15 12:13:56', '2023-06-12 07:24:12'),
(9, 'add_job_admin', 'new job posted ', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Email Template</title>\r\n</head>\r\n\r\n<body>\r\n    <div\r\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\r\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\r\n            job alerts !\r\n        </div>\r\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\r\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\r\n            <tbody>\r\n                <tr>\r\n                    <td>\r\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\r\n                            style=\"min-width:100%;background: transparent;\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\r\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\r\n                                            <img alt=\"Canjobs\"\r\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\r\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\r\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\r\n                                    </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td\r\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\r\n                        <div style=\"color: black;font-size:medium;\">\r\n                            <p>Dear <b>{name}</b>,</p>\r\n                            <p>\r\n                                <br>\r\n                                A new job has been created by <b>{postjob_company_name}</b>. Please review the details and take the necessary actions:\r\n                                <br>\r\n                                <br>\r\n                                Job Title: <b>{postjob_job_title}</b>\r\n                                <br>\r\n                                Company: <b>{postjob_company_name}</b>\r\n                                <br>\r\n                                Location: <b>{job_location}</b>\r\n                                <br>\r\n                                <br>\r\n\r\n                                Job Description:\r\n                                <b>{job_description}</b>\r\n                                <br>\r\n                                Please post the job, notify the relevant hiring team, and set up any required accounts.\r\n                            </p>\r\n                        </div>\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\r\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\r\n              <tbody>\r\n                <tr>\r\n                  <td style=\"padding-bottom:16px;text-align:center\">\r\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"text-align:center\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img alt=\"Download on the App Store\"\r\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\r\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\r\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img alt=\"Get it on Google Play\"\r\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\r\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\r\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\r\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\r\n                  </td>\r\n                </tr>\r\n              </tbody>\r\n            </table> -->\r\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\r\n                            style=\"font-size:16px;text-align: center;\">\r\n                            <tbody>\r\n                                <!-- <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\r\n                    Designer, PHP) </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\r\n                      why we included this.</a> </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\r\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\r\n                      target=\"_blank\">Help</a>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img src=\"\" alt=\"LinkedIn\"\r\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\r\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\r\n                </tr> -->\r\n                <tr>\r\n                  <td\r\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\r\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\r\n                    </i>\r\n                  </td>\r\n                </tr>\r\n                                <tr>\r\n                                    <td> © 2023 Canjobs </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </td>\r\n                </tr>\r\n            </tbody>\r\n        </table> <img alt=\"\" role=\"presentation\" src=\"\r\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\r\n            data-bit=\"iit\">\r\n        <font color=\"#888888\"> </font>\r\n    </div>\r\n</body>\r\n\r\n</html>', 1, '2023-05-15 12:15:13', '2023-06-12 09:55:27'),
(10, 'interview_schedule_employer', 'interview confirmation', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            job alerts !\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                           <p>Dear <b>{interview_schedule_company_name}</b>,</p>\n                            <p>\n                                <br>\n                                Confirming the scheduled interview for the position  of <b>{interview_schedule_job_title} </b>at <b>{interview_schedule_company_name}</b>.                              <br>\n                                <br>\n                                Date: <b>{interview_schedule_interview_date}</b>\n                                <br>\n                                Please ensure your representative arrives on time and is prepared. Let us know if there are any changes or questions. \n                            </p>\n                        </div>\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                                <tr>\n                                    <td> © 2023 Canjobs </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>', 1, '2023-06-12 11:21:08', '2023-06-12 12:11:55'),
(11, 'interview_schedule_admin', 'interview confirmation', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            job alerts !\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                           <p>Dear <b>{admin_name}</b>,</p>\n                            <p>\n                                <br>\n                                Confirming the scheduled interview for the position  of <b>{interview_schedule_job_title}</b>at <b>{interview_schedule_company_name}</b>.                              <br>\n                                <br>\n                                Date: <b>{interview_schedule_interview_date}</b>\n                                <br>\n                                Please make necessary arrangements for the interview. Let us know if there are any changes or questions.\n                            </p>\n                        </div>\n                    </td>.                   \n                  \n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                                <tr>\n                                    <td> © 2023 Canjobs </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>\n', 1, '2023-06-12 11:23:45', '2023-06-12 12:14:41'),
(12, 'lmia_status_update', 'lmia status updated', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Email Template</title>\r\n</head>\r\n\r\n<body>\r\n    <div\r\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\r\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\r\n            LIMIA Status\r\n        </div>\r\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\r\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\r\n            <tbody>\r\n                <tr>\r\n                    <td>\r\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\r\n                            style=\"min-width:100%;background: transparent;\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\r\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\r\n                                            <img alt=\"Canjobs\"\r\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\r\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\r\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\r\n                                    </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td\r\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\r\n                        <div style=\"color: black;font-size:medium;\">\r\n                            <p>Dear <b>{company_name}</b>,</p>\r\n                            <p>\r\n                                <br>\r\n                             Your Applicant\'s <b>{employee_name}</b> LIMA status has been Succesfully changed to <b>{lmia_status}</b>\r\n                                <br>\r\n              \r\n                            </p>\r\n                        </div>\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\r\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\r\n              <tbody>\r\n                <tr>\r\n                  <td style=\"padding-bottom:16px;text-align:center\">\r\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"text-align:center\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img alt=\"Download on the App Store\"\r\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\r\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\r\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img alt=\"Get it on Google Play\"\r\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\r\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\r\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\r\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\r\n                  </td>\r\n                </tr>\r\n              </tbody>\r\n            </table> -->\r\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\r\n                            style=\"font-size:16px;text-align: center;\">\r\n                            <tbody>\r\n                                <!-- <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\r\n                    Designer, PHP) </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\r\n                      why we included this.</a> </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\r\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\r\n                      target=\"_blank\">Help</a>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img src=\"\" alt=\"LinkedIn\"\r\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\r\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\r\n                </tr> -->\r\n                <tr>\r\n                  <td\r\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\r\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\r\n                    </i>\r\n                  </td>\r\n                </tr>\r\n                                <tr>\r\n                                    <td> © 2023 Canjobs </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </td>\r\n                </tr>\r\n            </tbody>\r\n        </table> <img alt=\"\" role=\"presentation\" src=\"\r\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\r\n            data-bit=\"iit\">\r\n        <font color=\"#888888\"> </font>\r\n    </div>\r\n</body>\r\n\r\n</html>', 1, '2023-06-13 09:31:12', '2023-06-13 09:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` bigint(20) NOT NULL,
  `name` text,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `contact_no` bigint(15) DEFAULT NULL,
  `description` longtext,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `marital_status` varchar(55) DEFAULT NULL,
  `nationality` text,
  `current_location` text,
  `currently_located_country` text,
  `language` varchar(100) DEFAULT NULL,
  `religion` text,
  `interested_in` text,
  `experience` varchar(100) DEFAULT NULL,
  `work_permit_canada` char(100) DEFAULT NULL,
  `work_permit_other_country` text,
  `status` int(11) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `job_status` int(11) NOT NULL DEFAULT '0',
  `posted_job_id` int(11) NOT NULL DEFAULT '0',
  `date_of_posting` date NOT NULL,
  `designation` varchar(251) NOT NULL,
  `resume` varchar(301) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_admin` int(51) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL,
  `token` varchar(301) NOT NULL,
  `google` varchar(151) NOT NULL,
  `facebook` varchar(151) NOT NULL,
  `linkedin` varchar(151) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `name`, `email`, `password`, `contact_no`, `description`, `date_of_birth`, `gender`, `marital_status`, `nationality`, `current_location`, `currently_located_country`, `language`, `religion`, `interested_in`, `experience`, `work_permit_canada`, `work_permit_other_country`, `status`, `message`, `is_featured`, `job_status`, `posted_job_id`, `date_of_posting`, `designation`, `resume`, `profile_photo`, `created_at`, `created_by_admin`, `updated_at`, `is_deleted`, `token`, `google`, `facebook`, `linkedin`) VALUES
(1, 'Pikashoo', 'gouravchoudhary9888@gmail.com', '255f214ff4a609db43db5bd3dcc38dae', 7247935400, 'Hello hello hello hello hello\n', '2023-08-31', 'other', 'married', 'indian', 'India', 'Madhya Pradesh', 'afar', NULL, 'all', '1-3 ', 'yes', 'India', 5, '', 1, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693895638pdf', 'https://apnaorganicstore.in/canjobs/uploads/1693895638.png', '2023-08-10 04:26:24', 0, '2023-09-05 08:35:02', 1, '', '', '', ''),
(2, 'Dipti rathore', 'dipti@gmail.com', '', 7410147852, 'Hello dipti how are and are you doing well ?', '1999-10-12', 'other', 'single', 'indian', 'India', 'mp', 'bengali', NULL, 'all', '7+ ', 'no', NULL, 3, '', 0, 0, 1, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1691817269.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1691643783.jpeg', '2023-08-10 05:03:03', 1, '2023-08-12 05:14:29', 1, '', '', '', ''),
(3, 'Anuhsree', 'aashi.we2code@gmail.com', '32328cdd5e00703533e4e1bf0366d0ab', 8585858585, 'Hello guy\'s\n', '1999-05-19', 'female', 'single', 'indian', 'Indore', NULL, 'hindi', NULL, 'all', '1-3 ', 'no', NULL, 2, '', 1, 0, 2, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693202092.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1693026417.jpeg', '2023-08-10 05:35:22', 0, '2023-08-28 11:18:37', 0, '587ea74f1e1c1b667fcfa0826f5ac338', '', '', ''),
(4, 'Shivam thakur', 'shivamthakur@gmail.com', '', 7415000034, 'dfds fgtfdf ', '2001-04-11', 'male', 'married', 'indian', 'Khandwa', '', 'belarusian', NULL, 'full-time', '1-3 ', 'no', NULL, 4, '', 0, 0, 1, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1692446422.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1692445620.jpeg', '2023-08-10 07:11:03', 1, '2023-09-05 08:35:22', 0, '', '', '', ''),
(5, 'Rohan Dhakad', 'rohan@gmail.com', '', 7410258963, NULL, '2000-10-13', 'male', 'single', 'indian', 'India', 'India', 'belarusian', NULL, 'part-time', 'fresher', 'no', NULL, 1, '', 0, 0, 9, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1691651898.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1691651898.png', '2023-08-10 07:18:06', 1, '2023-08-10 07:20:15', 1, '', '', '', ''),
(6, 'utkarsh', 'utkarsh.we2code@gmail.com', '', 96302587410, NULL, '1997-06-13', 'male', 'married', 'Austrialian', 'Thiland', 'India', 'bashkir', NULL, 'full-time', '1-3 ', 'yes', NULL, 1, '', 1, 0, 7, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693040805.pdf', NULL, '2023-08-10 07:29:07', 1, '2023-09-05 08:35:31', 1, '', '', '', ''),
(7, 'Gourav choudary', 'g.choudhary.we2code@gmail.com', '', 2145874963, NULL, '2004-02-10', 'male', 'single', 'indian', 'India', 'mp', 'bashkir', NULL, 'full-time', '5-7 ', 'no', NULL, 1, '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1691659752.pdf', NULL, '2023-08-10 09:29:12', 1, '2023-08-10 09:29:12', 1, '', '', '', ''),
(8, 'NIdhi savner', 'nidhi.we2code@gmail.com', '64c8bec39ec95b4d4f14c3d19e3bda91', 9632587410, NULL, '2002-11-23', 'female', 'single', 'korean', 'india', NULL, 'belarusian', NULL, 'swep', '1-3 ', 'no', NULL, 2, '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693030833.pdf', NULL, '2023-08-11 04:19:28', 0, '2023-08-26 06:20:33', 0, '', '', '', ''),
(10, NULL, 'nidhisavner843@gmail.com', 'fd0f5b4761c8d987a9c90e40849c949a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '', 0, 0, 0, '0000-00-00', '', NULL, NULL, '2023-08-11 04:25:28', 0, '2023-09-05 09:42:37', 0, '', '', '', ''),
(11, 'Sagar ', 'sagar.we2code@gmail.com', '4ff691f69007c66f2c03e45a0ed6b760', 8888555541, 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh\n', '1999-07-08', 'male', 'single', 'Austrialian', 'India', NULL, 'belarusian', NULL, 'internship', '1-3 ', 'no', NULL, 2, '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693812324.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1693808007.jpeg', '2023-08-11 05:06:36', 0, '2023-09-04 11:18:01', 1, 'b64e19581565d85e9561c4f7648947ff', '', '', ''),
(18, 'Aashi vyas', 'aashivyas2001@gmail.com', '4f1058b235cc3827fb8888a5d1aab930', 9519511590, 'React. js developers design and implement user interface components for JavaScript-based web and mobile applications using the React open-source library ecosystem. These skilled front-end developers are involved in all stages of interface component design, from conception through to final testing.', '2001-10-10', 'female', 'single', 'indian', 'Khandwa', 'India', 'english', NULL, 'full-time', '1-3 ', 'no', 'no', 1, '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693222060.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1693222060.jpeg', '2023-08-16 08:21:13', 0, '2023-09-05 08:35:54', 0, '', '', '', ''),
(19, 'Raj Testing', 'rajtest@gmail.com', '', 1234567890, 'Testing', '2023-08-01', 'male', 'single', 'Indian', 'India', 'Madhya Pradesh', 'hiri motu', NULL, 'swep', '1-3 ', 'no', 'India', 3, '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693912321pdf', NULL, '2023-08-19 17:14:16', 1, '2023-09-05 11:12:01', 0, '', '', '', ''),
(20, 'Ambani', 'hr.we2codepvtltd@gmail.com', '', -1001256987, 'sdfgds qefg qer qergfdbg qer gfgb wergtd dfg.', '2003-06-11', 'female', 'single', 'Austrialian', 'Thiland', 'thailand', 'bashkir', NULL, 'swep', '1-3 ', 'no', 'India', 6, '', 1, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693300080.pdf', 'https://lh3.googleusercontent.com/a/AAcHTtdJAmiX5ta08MyKg_JrZisRXGD8hj-H11E3HCaisQww=s96-c', '2023-08-25 10:37:56', 0, '2023-09-05 08:35:46', 0, '', '112276275944362493396', '', ''),
(21, 'Gourav choudary', 'g.choudhary.we2code@gmail.com', '', 4145222451, 'Happy\n', '2023-08-16', 'male', 'single', ' rtg gf fg ', 'Khandwa', 'Madhya Pradesh', 'belarusian', NULL, 'internship', '1-3 ', 'no', 'India', 4, '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693902147pdf', NULL, '2023-08-26 06:19:51', 1, '2023-09-08 04:26:29', 0, '', '', '', ''),
(24, NULL, 'sagar.we2code@gmail.com', '4ff691f69007c66f2c03e45a0ed6b760', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693829575.pdf', NULL, '2023-09-04 12:12:55', 0, '2023-09-04 12:12:55', 0, '', '', '', ''),
(25, 'Pikashoo', 'rahul.verma.we2code@gmail.com', '', 12345567890, NULL, '2023-09-06', 'other', 'single', 'Austrialian', 'Khandwa', 'Madhya Pradesh', 'afrikaans', NULL, 'internship', '1-3 ', 'yes', 'India', 6, '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693897740.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1693897740.jpeg', '2023-09-05 07:09:00', 1, '2023-09-05 09:25:21', 0, '', '', '', ''),
(26, 'Pikashoo', 'sagar.we2code@gmail.com', '', 1234567890, NULL, '2023-09-05', 'male', 'single', 'Austrialian', 'Thiland', 'Madhya Pradesh', 'afrikaans', NULL, 'part-time', '1-3 ', 'yes', 'India', 1, '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693897906.pdf', NULL, '2023-09-05 07:11:46', 1, '2023-09-05 07:11:46', 1, '', '', '', ''),
(27, NULL, 'utkarsh.we2code@gmail.com', 'b2e146fbe64be8ea3da9056b55bb2979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1693983380.pdf', NULL, '2023-09-06 06:56:20', 0, '2023-09-06 06:56:20', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `employee_career`
--

CREATE TABLE `employee_career` (
  `career_id` int(251) NOT NULL,
  `employee_id` int(255) NOT NULL,
  `company` text,
  `designation` text,
  `company_location` varchar(300) DEFAULT NULL,
  `industry` char(30) DEFAULT NULL,
  `functional_area` text,
  `work_level` varchar(101) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `currently_work_here` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_career`
--

INSERT INTO `employee_career` (`career_id`, `employee_id`, `company`, `designation`, `company_location`, `industry`, `functional_area`, `work_level`, `start_date`, `end_date`, `currently_work_here`, `created_at`, `updated_at`) VALUES
(1, 4, 'matrimonial', 'CEO', 'indore', 'Healthcare', 'Backend', NULL, '2023-07-31', NULL, 1, '2023-08-11 11:39:35', '2023-08-11 11:39:35'),
(3, 4, 'sysko', 'dfvd ', 'indore', 'Government & Public Administra', 'rterf tf', 'rgre', '2019-11-19', NULL, 1, '2023-08-19 12:04:12', '2023-08-19 12:04:12'),
(4, 19, 'Amazon', 'Manager', 'Indore', 'Education', 'Social Relationship', 'Intermediate', '2023-08-01', '2023-08-18', NULL, '2023-08-19 17:16:06', '2023-08-19 17:16:06'),
(5, 18, 'Amazon', 'Manager', 'Indore', 'Manufacturing', 'Social Relationship', 'Intermediate', '2019-01-01', '2023-08-01', NULL, '2023-08-20 04:47:03', '2023-08-20 04:47:03'),
(7, 3, 'matrimonial', 'CEO', 'indore', 'Retail & Wholesale', 'Backend', 'fresher', '2019-09-26', '2023-02-23', 1, '2023-08-26 05:05:15', '2023-09-05 09:30:17'),
(9, 6, 'we2code', 'php developer', 'Indore', 'Information Technology', 'Backend', 'Experienced Professional', '2023-01-05', '2023-08-26', 1, '2023-08-26 09:08:30', '2023-08-26 09:10:31'),
(10, 11, 'matrimonial', 'CEO', 'Jamnagar ', 'Manufacturing', 'indore', 'Experienced Professional', '2021-02-09', '2023-09-08', NULL, '2023-09-04 06:36:29', '2023-09-04 06:36:29'),
(12, 21, 'ABC', 'analyst', NULL, NULL, NULL, NULL, '2023-07-04', '2023-08-31', 1, '2023-09-04 11:12:38', '2023-09-05 08:40:17'),
(13, 1, 'Apna Sweet', 'Managdfsdfsf', 'indore', 'Telecommunications', 'asdfghjkl', '1234rdfg', '2023-09-05', '2023-09-05', 1, '2023-09-05 06:38:15', '2023-09-05 06:39:16'),
(14, 1, 'Apna Sweet', 'receptionist', 'indore', 'Government & Public Administra', NULL, NULL, '2023-09-05', '2023-09-05', NULL, '2023-09-05 06:38:41', '2023-09-05 06:38:41'),
(15, 21, 'Apna Sweet', 'receptionist ', NULL, NULL, NULL, NULL, '2023-09-05', '2023-09-05', 1, '2023-09-05 08:39:59', '2023-09-05 08:40:23'),
(16, 3, 'Apna Sweet', 'Managdfsdfsf', NULL, NULL, NULL, NULL, '2023-09-05', '2023-09-05', 1, '2023-09-05 09:30:29', '2023-09-05 09:30:29'),
(17, 1, 'matrimonial', 'receptionist ', NULL, NULL, NULL, NULL, '2023-09-05', '2023-09-30', NULL, '2023-09-05 09:41:08', '2023-09-05 09:41:08'),
(18, 25, 'matrimonial', 'receptionist', NULL, NULL, NULL, NULL, '2023-09-05', NULL, 1, '2023-09-05 11:19:04', '2023-09-05 11:19:04'),
(19, 25, 'matrimonial', 'receptionist ', NULL, NULL, NULL, NULL, '2023-09-05', NULL, 1, '2023-09-05 11:19:14', '2023-09-05 11:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(51) NOT NULL,
  `document_url` varchar(251) NOT NULL,
  `extension_type` mediumtext NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_type` text,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_type` text,
  `is_varify` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_documents`
--

INSERT INTO `employee_documents` (`id`, `employee_id`, `type`, `document_url`, `extension_type`, `created_by`, `created_type`, `updated_by`, `updated_type`, `is_varify`, `created_at`, `updated_at`) VALUES
(1, 3, 'resume_or_cv', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_3/resume_or_cv_3.jpeg', 'jpeg', 1, 'super-admin', NULL, NULL, 1, '2023-08-23 11:10:59', '2023-08-26 05:54:37'),
(2, 18, 'photograph', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_18/photograph_18.jpeg', 'jpeg', 1, 'super-admin', 1, 'super-admin', 0, '2023-08-23 11:43:31', '2023-08-25 09:30:29'),
(3, 18, 'lmia', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_18/lmia_18.jpeg', 'jpeg', 1, 'super-admin', NULL, NULL, 1, '2023-08-23 11:43:45', '2023-08-25 09:30:13'),
(4, 4, 'police_clearance', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_4/police_clearance_4.png', 'png', 1, 'super-admin', NULL, NULL, 0, '2023-08-24 10:45:09', '2023-08-24 10:45:09'),
(5, 4, 'ielts', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_4/ielts_4.png', 'png', 1, 'super-admin', NULL, NULL, 0, '2023-08-24 10:45:18', '2023-08-24 10:45:18'),
(6, 4, 'proof_of_funds', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_4/proof_of_funds_4.png', 'png', 1, 'super-admin', NULL, NULL, 1, '2023-08-24 10:45:30', '2023-08-24 10:45:41'),
(7, 3, 'medical', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_3/medical_3.jpeg', 'jpeg', 3, 'employee', NULL, NULL, 0, '2023-08-25 05:40:10', '2023-08-25 05:40:30'),
(8, 6, 'ielts', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_6/ielts_6.jpeg', 'jpeg', 1, 'super-admin', NULL, NULL, 1, '2023-08-25 08:32:20', '2023-08-25 08:32:22'),
(9, 18, 'proof_of_funds', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_18/proof_of_funds_18.jpeg', 'jpeg', 1, 'super-admin', NULL, NULL, 0, '2023-08-25 09:30:43', '2023-08-25 09:30:43'),
(10, 3, 'education_post_graduation', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_3/education_post_graduation_3.jpeg', 'jpeg', 3, 'employee', NULL, NULL, 0, '2023-08-26 05:42:29', '2023-08-26 05:42:29'),
(11, 3, 'police_clearance', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_3/police_clearance_3.jpeg', 'jpeg', 3, 'employee', NULL, NULL, 1, '2023-08-26 05:42:41', '2023-09-01 04:07:05'),
(12, 21, 'photograph', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_21/photograph_21.png', 'png', 1, 'super-admin', NULL, NULL, 0, '2023-08-31 10:33:01', '2023-08-31 10:33:01'),
(13, 21, 'passport', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_21/passport_21.jpeg', 'jpeg', 1, 'super-admin', NULL, NULL, 0, '2023-08-31 10:33:20', '2023-08-31 10:33:20'),
(14, 11, 'drivers_license', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_11/drivers_license_11.png', 'png', 1, 'super-admin', NULL, NULL, 0, '2023-09-04 06:38:30', '2023-09-04 06:38:30'),
(15, 11, 'marriage_certificate', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_11/marriage_certificate_11.png', 'png', 1, 'super-admin', NULL, NULL, 1, '2023-09-04 06:38:40', '2023-09-04 06:38:42'),
(16, 11, 'passport', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_11/passport_11.pdf', 'pdf', 1, 'super-admin', NULL, NULL, 0, '2023-09-04 06:38:58', '2023-09-04 06:38:58'),
(17, 11, 'police_clearance', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_11/police_clearance_11.vnd.openxmlformats-officedocument.wordprocessingml.document', 'vnd.openxmlformats-officedocument.wordprocessingml.document', 1, 'super-admin', NULL, NULL, 0, '2023-09-04 06:39:40', '2023-09-04 06:39:40'),
(18, 21, 'resume_or_cv', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_21/resume_or_cv_21.jpeg', 'jpeg', 1, 'super-admin', NULL, NULL, 0, '2023-09-05 17:19:19', '2023-09-05 17:19:19'),
(19, 3, 'proof_of_employment', 'https://apnaorganicstore.in/canjobs/uploads/employee_documents/employee_3/proof_of_employment_3.png', 'png', 1, 'super-admin', NULL, NULL, 0, '2023-09-12 05:44:06', '2023-09-12 05:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `employee_education`
--

CREATE TABLE `employee_education` (
  `education_id` int(101) NOT NULL,
  `employee_id` int(101) NOT NULL,
  `qualification` varchar(251) DEFAULT NULL,
  `university_institute` text,
  `course` text,
  `specialization` text,
  `institute_location` text,
  `passing_year` smallint(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_education`
--

INSERT INTO `employee_education` (`education_id`, `employee_id`, `qualification`, `university_institute`, `course`, `specialization`, `institute_location`, `passing_year`, `created_at`, `updated_at`) VALUES
(1, 1, 'post metric', 'gfhghb', 'Bachelor of Applied Science', 'Customer service', 'bahamas', 2023, '2023-08-11 11:25:36', '2023-08-11 11:25:36'),
(3, 2, 'diploma', 'Oxford ', 'Bachelor of Arts', NULL, 'afghanistan', 2023, '2023-08-11 11:30:57', '2023-08-11 11:30:57'),
(4, 2, 'diploma', 'Oxford ', 'Bachelor of Arts', NULL, 'afghanistan', 2023, '2023-08-11 11:31:20', '2023-08-11 11:31:20'),
(6, 6, 'post metric', 'davv', 'Bachelor of Arts', 'Social Engineering', 'bahamas', 2333, '2023-08-19 17:07:50', '2023-08-19 17:07:50'),
(7, 19, 'graduate', 'RGPV', 'Bachelor of Aerospace Engineering', 'Computer Science Engineer', 'india', 2012, '2023-08-19 17:15:07', '2023-08-19 17:15:07'),
(8, 4, 'metric', 'RGPV', 'Bachelor of Liberal Arts', 'Computer Science Engineer', 'belarus', 2012, '2023-08-24 12:33:12', '2023-08-24 12:33:12'),
(9, 4, 'diploma', 'Oxford London', 'Bachelor of Architectural Studies', 'Social Engineering', 'barbados', 2012, '2023-08-24 12:33:25', '2023-08-24 12:33:25'),
(10, 18, 'post metric', 'Oxford ', 'Bachelor of Applied Studies', 'Customer service', 'bahrain', 2001, '2023-08-25 09:28:34', '2023-08-25 09:28:39'),
(12, 3, 'post metric', 'gfhghb', 'Bachelor of Applied Science', 'Drams', 'bangladesh', 2023, '2023-08-26 05:06:16', '2023-08-26 05:06:16'),
(14, 8, 'post metric', 'Oxford ', 'Bachelor of Applied Studies', NULL, NULL, 2022, '2023-08-26 06:20:51', '2023-08-26 06:20:51'),
(15, 11, 'diploma', 'Oxford ', 'Bachelor of Applied Science', 'Drams', 'azerbaijan', 2022, '2023-09-04 06:37:36', '2023-09-04 06:37:36'),
(16, 11, 'metric', 'Oxford ', 'Bachelor of Architectural Studies', 'Drams', 'azerbaijan', 1122, '2023-09-04 06:37:47', '2023-09-04 06:37:47'),
(18, 11, 'diploma', 'harward', 'Bachelor of Applied Studies', NULL, 'austria', 2013, '2023-09-04 07:25:08', '2023-09-04 07:25:08'),
(19, 21, 'graduate', 'SJIT', 'Bachelor of Applied Science', 'arts', 'iceland', 2015, '2023-09-04 11:11:34', '2023-09-05 07:16:30'),
(21, 1, 'metric', 'st paul0', 'Bachelor of Applied Studies', 'arts', 'bahrain', 1234, '2023-09-05 06:35:40', '2023-09-05 06:36:54'),
(22, 1, 'diploma', 'st paul1', 'Bachelor of Applied Studies', '!0th', 'bangladesh', 1234, '2023-09-05 06:35:58', '2023-09-05 06:36:40'),
(23, 21, 'post metric', 'st paul', 'Bachelor of Arts', '!0th', 'afghanistan', 9999, '2023-09-05 07:15:53', '2023-09-05 07:17:09'),
(24, 21, 'diploma', 'st paul', 'Alternate Entry Master of Science in Nursing', 'arts', 'aland islands', 1234, '2023-09-05 07:17:50', '2023-09-05 07:17:50'),
(25, 21, 'graduate', 'st paul', 'Bachelor of Applied Science', 'arts', 'iceland', 2015, '2023-09-05 07:19:27', '2023-09-05 07:19:27'),
(27, 25, 'metric', 'st paul', 'Bachelor of Applied Science', NULL, NULL, 9999, '2023-09-05 11:19:37', '2023-09-05 11:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `employee_follow_up`
--

CREATE TABLE `employee_follow_up` (
  `id` bigint(20) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `subject` text,
  `remark` text,
  `next_followup_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `type` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_follow_up`
--

INSERT INTO `employee_follow_up` (`id`, `employee_id`, `subject`, `remark`, `next_followup_date`, `created_by`, `type`, `created_at`) VALUES
(1, 3, 'Complaint', 'pougg ggh hjggy fgct bvvgu cuy nbgbuj cfguyg gjhbhj ghchv bvbnvjgv ghygyb  vnvgvhj gyujghmb hukhjb bhjkhj ', NULL, 1, 'super-admin', '2023-08-28 11:19:11'),
(2, 11, 'Complaint', 'He is not punctual at work.', '2023-09-05', 1, 'super-admin', '2023-09-04 06:40:09'),
(3, 11, 'Interview', 'Reminder there is the interview for this employee.', '2023-09-06', 1, 'super-admin', '2023-09-04 06:41:56'),
(4, 21, 'sa', 'asd', '2023-09-05', 1, 'super-admin', '2023-09-04 10:40:16'),
(5, 21, 'Test', 'sdadasd', '2023-09-20', 1, 'super-admin', '2023-09-04 10:57:43'),
(6, 21, '1234ertyufgfdsd', 'sdfgh', '2023-09-05', 1, 'super-admin', '2023-09-05 11:26:59'),
(7, 21, '1234ertyufgfdsd', 'asdfghjk', '2023-09-05', 1, 'super-admin', '2023-09-05 11:27:10'),
(8, 21, '1234ertyufgfdsd', 'dfgh', '2023-10-04', 1, 'super-admin', '2023-09-05 11:28:10'),
(9, 21, 'testing', 'testing notes', '2023-09-07', 1, 'super-admin', '2023-09-05 17:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `employee_setting`
--

CREATE TABLE `employee_setting` (
  `id` int(101) NOT NULL,
  `employee_id` int(101) NOT NULL,
  `email_permission` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee_skill`
--

CREATE TABLE `employee_skill` (
  `skill_id` int(101) NOT NULL,
  `employee_id` int(101) DEFAULT NULL,
  `skill` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_skill`
--

INSERT INTO `employee_skill` (`skill_id`, `employee_id`, `skill`) VALUES
(1, 1, 'Food & Beverage Occupations'),
(2, 1, 'Healthcare Occupations'),
(3, 1, 'Sales, Retail, & Customer Support Occupations'),
(4, 2, 'Sales, Retail, & Customer Support Occupations'),
(5, 2, 'Healthcare Occupations'),
(41, 3, 'Healthcare Occupations'),
(42, 8, 'Healthcare Occupations'),
(8, 1, 'Organization Operations & Administrative Occupations'),
(9, 2, 'Organization Operations & Administrative Occupations'),
(10, 2, 'Food & Beverage Occupations'),
(11, 2, 'Technology Occupations'),
(12, 2, 'Finance & Accounting Occupations'),
(39, 18, 'Healthcare Occupations'),
(14, 18, 'Organization Operations & Administrative Occupations'),
(15, 18, 'React js'),
(16, 4, 'Healthcare Occupations'),
(19, 4, 'Repair, Maintenance & Installation Occupations'),
(21, 4, 'Finance & Accounting Occupations'),
(22, 4, 'Construction & Extraction Occupations'),
(25, 6, 'Healthcare Occupations'),
(26, 6, 'Organization Operations & Administrative Occupations'),
(27, 19, 'Healthcare Occupations'),
(28, 19, 'Food & Beverage Occupations'),
(29, 18, 'Food & Beverage Occupations'),
(30, 18, 'Technology Occupations'),
(31, 18, 'Repair, Maintenance & Installation Occupations'),
(32, 18, 'Finance & Accounting Occupations'),
(33, 18, 'Architecture & Engineering Occupations'),
(34, 18, 'Construction & Extraction Occupations'),
(35, 18, 'Supply Chain & Logistics Occupations'),
(36, 18, 'Manufacturing & Utilities Occupations'),
(37, 18, 'Education & Instruction Occupations'),
(38, 18, 'Farming, Fisheries & Forestry Occupations '),
(40, 3, 'Organization Operations & Administrative Occupations'),
(43, 8, 'Organization Operations & Administrative Occupations'),
(44, 8, 'Technology Occupations'),
(46, 6, 'Technology Occupations'),
(47, 20, 'Healthcare Occupations'),
(48, 11, 'Organization Operations & Administrative Occupations'),
(49, 11, 'Science & Research Occupations'),
(50, 11, 'Travel, Attractions & Events Occupations'),
(51, 11, 'Legal Occupations'),
(52, 11, 'Farming, Fisheries & Forestry Occupations '),
(54, 21, 'Sales, Retail, & Customer Support Occupations'),
(55, 21, 'Healthcare Occupations'),
(56, 21, 'Organization Operations & Administrative Occupations'),
(57, 21, 'Food & Beverage Occupations'),
(58, 25, 'Healthcare Occupations'),
(59, 25, 'Organization Operations & Administrative Occupations'),
(61, 25, 'Technology Occupations'),
(62, 25, 'Finance & Accounting Occupations');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_view`
-- (See below for the actual view)
--
CREATE TABLE `employee_view` (
`employee_id` bigint(20)
,`name` text
,`email` varchar(50)
,`password` varchar(255)
,`contact_no` bigint(15)
,`description` longtext
,`date_of_birth` date
,`gender` varchar(20)
,`marital_status` varchar(55)
,`nationality` text
,`current_location` text
,`currently_located_country` text
,`language` varchar(100)
,`religion` text
,`interested_in` text
,`experience` varchar(100)
,`work_permit_canada` char(100)
,`work_permit_other_country` text
,`status` int(11)
,`message` text
,`is_featured` tinyint(1)
,`job_status` int(11)
,`posted_job_id` int(11)
,`date_of_posting` date
,`designation` varchar(251)
,`resume` varchar(301)
,`profile_photo` varchar(255)
,`created_at` timestamp
,`created_by_admin` int(51)
,`updated_at` timestamp
,`is_deleted` tinyint(1)
,`token` varchar(301)
,`google` varchar(151)
,`facebook` varchar(151)
,`linkedin` varchar(151)
,`profile_complete` decimal(21,2)
,`education` text
,`specialization` text
,`skill` varchar(256)
);

-- --------------------------------------------------------

--
-- Table structure for table `employee_visa`
--

CREATE TABLE `employee_visa` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `status` mediumtext NOT NULL,
  `country` mediumtext NOT NULL,
  `type` mediumtext NOT NULL,
  `validity` varchar(101) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_visa`
--

INSERT INTO `employee_visa` (`id`, `employee_id`, `status`, `country`, `type`, `validity`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 19, 'onboard', 'algeria', '', '', 0, '2023-09-09 09:18:03', '2023-09-09 09:18:26'),
(2, 18, 'onboard', 'algeria', '', '', 0, '2023-09-09 09:18:06', '2023-09-09 09:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `company_id` int(101) NOT NULL,
  `company_name` varchar(251) DEFAULT NULL,
  `industry` text,
  `corporation` varchar(251) DEFAULT NULL,
  `alias` text,
  `company_start_date` date DEFAULT NULL,
  `company_size` varchar(251) DEFAULT NULL,
  `website_url` varchar(251) DEFAULT NULL,
  `vacancy_for_post` varchar(251) DEFAULT NULL,
  `about` mediumtext,
  `contact_person_name` char(251) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contact_no` bigint(20) DEFAULT NULL,
  `contact_no_other` bigint(20) DEFAULT NULL,
  `address` text,
  `pin_code` int(101) DEFAULT NULL,
  `city` text,
  `state` text,
  `country` text,
  `designation` char(101) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_admin` int(51) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `franchise` varchar(101) NOT NULL,
  `token` varchar(301) NOT NULL,
  `google` varchar(151) NOT NULL,
  `facebook` varchar(151) NOT NULL,
  `linkedin` varchar(151) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`company_id`, `company_name`, `industry`, `corporation`, `alias`, `company_start_date`, `company_size`, `website_url`, `vacancy_for_post`, `about`, `contact_person_name`, `email`, `password`, `contact_no`, `contact_no_other`, `address`, `pin_code`, `city`, `state`, `country`, `designation`, `logo`, `is_active`, `created_at`, `updated_at`, `created_by_admin`, `is_deleted`, `franchise`, `token`, `google`, `facebook`, `linkedin`) VALUES
(1, 'getse', 'Finance', 'B2C', NULL, '2023-08-08', '55', 'www.we2code.pvt.ltd', 'office boy', 'Blade is one of the many heroes recruited by Nick Fury in Ultimate Comics: Avengers.We2Code is an emerging web design and development company of India. We have wide range of technical skill to provide better services to our clients.@We2Code, core strength lies in our super energetic and gigantic team, forming an excellent blend of IT minds along with a creative bent. Our endeavor is to continuously improve and deliver maximum – enriching products & solutions. That’s what we mean – We code your dreams.', 'Doremon', 'Blade@gmail.com', NULL, 9874563210, NULL, '3nd Floor, 45 Universal Tower,', 452010, 'indore', 'Madhya Pradesh', 'India', 'MD', 'https://apnaorganicstore.in/canjobs/uploads/1691554911.jpeg', 0, '2023-08-03 11:33:44', '2023-09-04 06:10:28', 1, 0, 'indore', '', '', '', ''),
(2, 'Money Money ', 'Construction, Repair & Maintenance Services', 'B2G', NULL, '2023-08-07', '15', 'www.we2code.pvt.ltd', 'receptionists ', 'We2Code is an emerging web design and development company of India. We have wide range of technical skill to provide better services to our clients.@We2Code, core strength lies in our super energetic and gigantic team, forming an excellent blend of IT minds along with a creative bent. Our endeavor is to continuously improve and deliver maximum – enriching products & solutions. That’s what we mean – We code your dreams.', 'Priya dubey', 'aashi.we2code@gmail.com', '32328cdd5e00703533e4e1bf0366d0ab', 9874563201, NULL, '2nd Floor, 45 Universal Tower', 452010, 'indore', 'Madhya Pradesh', 'India', 'receptionist', 'https://apnaorganicstore.in/canjobs/uploads/1693027997.jpeg', 0, '2023-08-03 12:11:54', '2023-09-04 04:09:41', 0, 0, 'Information Technology', '587ea74f1e1c1b667fcfa0826f5ac338', '', '', ''),
(3, 'We2code', 'Retail & Wholesale', 'B2C', NULL, NULL, '10', 'www.we2code.pvt.ltd', 'QA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1693908143.jpeg', 0, '2023-08-07 11:07:16', '2023-09-05 10:02:23', 1, 0, '', '', '', '', ''),
(4, 'Amul', 'Restaurants & Food Service', 'B2B', NULL, NULL, '100', NULL, 'QA Devloper', 'Amul is an acronym of the Indian cooperative society named Gujarat Milk Marketing Federation based in Anand, Gujarat. It is under the ownership of Gujarat Cooperative Milk Marketing Federation Limited, Department of Cooperation, Government of Gujarat. It is controlled by 3.6 million milk producers.', 'Pikashoo', 'raj.we2code@gmail.com', NULL, 1234567890, NULL, '2nd Floor, 45 Universal Tower,', 452010, 'indore', 'Madhya Pradesh', 'India', 'receptionist', 'https://apnaorganicstore.in/canjobs/uploads/1691643233.png', 0, '2023-08-07 11:07:34', '2023-09-05 10:01:06', 1, 1, '', '', '', '', ''),
(5, 'We2code', 'Retail & Wholesale', 'B2B', NULL, NULL, '10', NULL, 'QA Devloper', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-07 11:08:59', '2023-08-07 11:09:25', 1, 1, '', '', '', '', ''),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'utkarsh.we2code@gmail.com', 'b2e146fbe64be8ea3da9056b55bb2979', 9519519510, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-08 04:42:21', '2023-08-08 04:42:21', 0, 1, '', '', '', '', ''),
(7, 'We2code', 'Non-profit & NGO', 'C2C', 'W2C', '2023-08-08', '12000', 'www.we2code.pvt.ltd', 'Frontend Developer', 'We2Code is an emerging web design and development company of India. We have wide range of technical skill to provide better services to our clients.@We2Code, core strength lies in our super energetic and gigantic team, forming an excellent blend of IT minds along with a creative bent. Our endeavor is to continuously improve and deliver maximum – enriching products & solutions. That’s what we mean – We code your dreams.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1691470451.jpeg', 0, '2023-08-08 04:54:11', '2023-08-08 04:54:11', 1, 0, 'Information Technology', '', '', '', ''),
(8, 'Lost bird', 'Information Technology', NULL, NULL, NULL, '20', NULL, 'business executive', NULL, 'Aashi vyas', 'aashivyas2001@gmail.com', '4f1058b235cc3827fb8888a5d1aab930', 95175382460, NULL, 'andher nagari chor gali kholi no 420', 400002, 'mumbai', 'maharshtra', 'india', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1692175623.jpeg', 0, '2023-08-16 07:07:24', '2023-08-16 08:47:03', 0, 0, '', '2478d80d891220b414c392e93c7fc1c3', '', '', ''),
(9, 'TESTING', 'Healthcare', 'B2C', 'HNS', '2023-08-01', '1000', 'amazon.in', 'Driver', 'testing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1692465885.png', 0, '2023-08-19 17:24:45', '2023-08-19 17:24:45', 1, 0, 'INDORE', '', '', '', ''),
(10, 'Blaade', 'Healthcare', 'B2B', 'ff', '2023-01-31', '20', 'apollo.com', 'CEO', 'wdsa gerg rfgd effd erfef df edfer fder erf fdersef df derfef f dsf sdr ewrsdf ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1694495223.jpeg', 0, '2023-09-12 05:07:03', '2023-09-12 05:07:03', 23, 0, 'vijay nagar', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `employer_documents`
--

CREATE TABLE `employer_documents` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `type` text NOT NULL,
  `document_url` varchar(251) NOT NULL,
  `extension_type` text NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_type` text,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_type` text,
  `is_varify` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employer_documents`
--

INSERT INTO `employer_documents` (`id`, `company_id`, `type`, `document_url`, `extension_type`, `created_by`, `created_type`, `updated_by`, `updated_type`, `is_varify`, `created_at`, `updated_at`) VALUES
(1, 1, 'police_clearance', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_1/police_clearance_1.jpeg', 'jpeg', 1, 'super-admin', NULL, NULL, 0, '2023-08-23 07:30:34', '2023-08-23 10:19:43'),
(2, 1, 'resume_or_cv', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_1/resume_or_cv_1.jpeg', 'jpeg', 1, 'employee', 1, 'super-admin', 0, '2023-08-23 07:31:16', '2023-08-23 07:31:33'),
(3, 1, 'education_metric', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_1/education_metric_1.jpeg', 'jpeg', 1, 'super-admin', NULL, NULL, 0, '2023-08-23 07:31:23', '2023-08-23 07:31:23'),
(4, 1, 'hello', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_1/hello_1.jpeg', 'jpeg', 1, 'company', NULL, NULL, 0, '2023-08-23 07:31:50', '2023-08-23 07:31:50'),
(5, 2, 'medical', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_2/medical_2.jpeg', 'jpeg', 1, 'super-admin', 1, 'super-admin', 1, '2023-08-23 10:15:27', '2023-08-24 06:41:14'),
(6, 2, 'education_graduation', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_2/education_graduation_2.png', 'png', 1, 'super-admin', 1, 'super-admin', 0, '2023-08-23 10:24:34', '2023-08-24 07:24:33'),
(7, 2, 'marriage_certificate', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_2/marriage_certificate_2.png', 'png', 1, 'super-admin', 1, 'super-admin', 0, '2023-08-24 07:25:04', '2023-08-24 09:37:39'),
(8, 2, 'photograph', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_2/photograph_2.jpeg', 'jpeg', 1, 'super-admin', 1, 'super-admin', 1, '2023-08-24 07:28:03', '2023-09-04 06:42:26'),
(9, 2, 'resume_or_cv', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_2/resume_or_cv_2.jpeg', 'jpeg', 1, 'super-admin', 1, 'super-admin', 1, '2023-08-24 09:37:17', '2023-08-25 09:18:09'),
(10, 2, 'education_metric', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_2/education_metric_2.jpeg', 'jpeg', 1, 'super-admin', NULL, NULL, 0, '2023-08-25 09:18:17', '2023-08-25 09:18:17'),
(11, 2, 'police_clearance', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_2/police_clearance_2.jpeg', 'jpeg', 2, 'company', NULL, NULL, 0, '2023-08-26 05:41:00', '2023-08-26 05:41:00'),
(12, 2, 'ielts', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_2/ielts_2.jpeg', 'jpeg', 2, 'company', NULL, NULL, 0, '2023-08-26 05:41:10', '2023-08-26 05:41:10'),
(13, 2, 'education_post_graduation', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_2/education_post_graduation_2.png', 'png', 2, 'company', 1, 'super-admin', 0, '2023-08-26 05:41:27', '2023-09-04 06:09:32'),
(15, 2, 'provincial_nominee_letter', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_2/provincial_nominee_letter_2.png', 'png', 1, 'super-admin', NULL, NULL, 0, '2023-09-04 06:42:35', '2023-09-04 06:42:35'),
(14, 1, 'job_offer_letter', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_1/job_offer_letter_1.jpeg', 'jpeg', 1, 'super-admin', NULL, NULL, 0, '2023-08-28 05:03:54', '2023-08-28 05:04:00'),
(16, 3, 'passport', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_3/passport_3.pdf', 'pdf', 1, 'super-admin', 1, 'super-admin', 0, '2023-09-05 10:23:21', '2023-09-05 10:25:48'),
(17, 3, 'drivers_license', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_3/drivers_license_3.png', 'png', 1, 'super-admin', NULL, NULL, 0, '2023-09-05 10:24:16', '2023-09-05 10:24:16'),
(18, 10, 'passport', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_10/passport_10.jpeg', 'jpeg', 23, 'manager', NULL, NULL, 0, '2023-09-12 05:07:18', '2023-09-12 05:07:18'),
(19, 10, 'job_offer_letter', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_10/job_offer_letter_10.jpeg', 'jpeg', 23, 'manager', NULL, NULL, 1, '2023-09-12 05:07:26', '2023-09-12 05:07:28'),
(20, 1, 'marriage_certificate', 'https://apnaorganicstore.in/canjobs/uploads/employer_documents/employer_1/marriage_certificate_1.png', 'png', 1, 'super-admin', NULL, NULL, 0, '2023-09-12 05:40:41', '2023-09-12 05:40:41');

-- --------------------------------------------------------

--
-- Table structure for table `employer_follow_up`
--

CREATE TABLE `employer_follow_up` (
  `id` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `subject` text,
  `remark` text,
  `next_followup_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `type` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employer_follow_up`
--

INSERT INTO `employer_follow_up` (`id`, `company_id`, `subject`, `remark`, `next_followup_date`, `created_by`, `type`, `created_at`) VALUES
(1, 2, 'fghfh', 'gvbhfgh', NULL, 1, 'super-admin', '2023-09-04 06:45:10'),
(2, 2, 'Test Subject', 'Testing', NULL, 1, 'super-admin', '2023-09-05 17:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `employer_setting`
--

CREATE TABLE `employer_setting` (
  `id` int(101) NOT NULL,
  `company_id` int(101) NOT NULL,
  `email_permission` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `follow_up`
--

CREATE TABLE `follow_up` (
  `id` int(101) NOT NULL,
  `job_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `next_followup_date` date NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `type` enum('1','2','3','4') DEFAULT NULL COMMENT '1 = "Employee updated", 2 = "Employee inserted", 3 = "Employee skill inserted", 4 = "Employee education details inserted", 5 = "Employee education details updated", 6 = "Employee career details inserted", 7 = "Employee career details updated", 8 = "Employee document inserted", 9 = "Employee document updated", 10 = "Employee visa inserted", 11 = "Employee visa updated", EMPLOYER API 12 = "Employer details updated", 13 = "Employer details inserted", 14 = "Employer contact details updated", 15 = "Employer kyc details inserted", 16 = "Employer kyc details updated", 17 = "job details updated", 18 = "job details inserted", 19 = "job switch", 20 = "apply on job", 21 = "interview schedule", 22 = "lmia updated", 23 = "lmia inserted", 24 = "Employer document inserted", 25 = "Employer document updated", 26 = "Employee lmia substage added", 27 = "Employee lmia substage updated", 28 = "job lmia substage inserted", 29 = "job lmia substage updated"',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='abandoned(new seperate table for employee and employer created)';

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `job_title` varchar(251) DEFAULT NULL,
  `experience_required` varchar(101) DEFAULT NULL,
  `salary` varchar(101) DEFAULT NULL,
  `location` varchar(251) DEFAULT NULL,
  `industry_type` text,
  `apply_link` varchar(301) DEFAULT NULL,
  `job_description` mediumtext,
  `your_duties` mediumtext,
  `requirement` mediumtext,
  `department` text,
  `job_type` varchar(251) DEFAULT NULL,
  `role_category` text,
  `education` text,
  `language` text,
  `keyskill` text,
  `employement` text,
  `job_category_id` int(101) DEFAULT NULL,
  `lmia_status` text NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `manager_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_admin` int(51) NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `company_id`, `job_title`, `experience_required`, `salary`, `location`, `industry_type`, `apply_link`, `job_description`, `your_duties`, `requirement`, `department`, `job_type`, `role_category`, `education`, `language`, `keyskill`, `employement`, `job_category_id`, `lmia_status`, `is_active`, `manager_id`, `created_at`, `updated_at`, `created_by_admin`, `is_featured`, `is_deleted`) VALUES
(1, 1, 'Data analyst', '3-5 ', '1lac-3lac', 'afghanistan', 'Retail & Wholesale', 'fgfdgvb.com', 'a person who works in a hotel, office, etc., who answers the phone and helps guests or visitors when they arrive: When you get here, the receptionist will direct you to my office. (Definition of receptionist from the Cambridge Business English Dictionary © Cambridge University Press)', 'a person who works in a hotel, office, etc., ', ' answers the phone and helps.', 'Desk', 'casual', '8', 'Other', 'Bengali', 'Organization Operations & Administrative Occupations', 'full-time', 5, 'decision', 1, 14, '2023-08-03 06:08:40', '2023-09-11 10:34:33', 1, 0, 0),
(2, 2, 'Data dATA', '1-3 ', '1lac-3lac', 'albania', 'Construction, Repair & Maintenance Services', 'ddd.comghfvh', 'Analysts review data and determine how to solve problems using data, learn critical insights about a business\'s customers and boost profits. Analysts also communicate this information with key stakeholders, including company leadership.', 'learn critical insights about a business\'s customers and boost profits', ' including company leadership', 'Leadership', 'freelance', '13', 'Bachelor of Arts in Education', 'Basque', 'Healthcare Occupations, Technology Occupations, Healthcare Occupations', 'full-time', 5, 'decision', 1, 15, '2023-08-03 06:43:44', '2023-08-31 00:38:56', 0, 0, 0),
(3, 2, 'Receptionist', '1-3 ', '3lac-5lac', 'albania', 'Restaurants & Food Service', 'fgfdgvb.com', ' including company leadership', ' including company leadership', ' including company leadership', ' including company leadership', 'internship', '6', 'Bachelor of Applied Science', 'Azerbaijani', 'Cleaning & Grounds Maintenance Occupations, Healthcare Occupations, Tally', 'full-time', 5, 'need to start', 1, 16, '2023-08-03 06:44:37', '2023-08-07 06:25:32', 0, 1, 1),
(4, 2, 'React js developer', '0-1 ', '1lac-3lac', 'algeria', 'Manufacturing', 'erfdsrgf.com', 'dfds fghfgh ghg hdfgh', 'gfhdf fghfgh ', 'fghf dfghf ', 'fgh fgh ', 'part-time', NULL, 'Bachelor of Arts', 'Abkhaz', 'Food & Beverage Occupations', 'full-time', 5, '', 1, 17, '2023-08-08 07:39:48', '2023-08-08 07:39:48', 1, 0, 1),
(5, 3, 'Delivery boy', '1-3 ', '1lac-3lac', 'albania', 'Manufacturing', 'www.careerattcs.com', ' dcdscf drrgdvb tg gretgre gvbfg rtgt cgbdfg rtgert dsfdg r5tergdf gdrgr grdgrg fgfg rert erfd e4wrw fferfd rerferff fggg ferdsf sdf df esf s f fefedrffffffffffffffffffffffffffffffffffffffffffffffffffffffdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', ' edrf rf rtfg dg dfg rgrfg vbdfgdfg fg dfg fdfffffffffffffffffffffffffffffffffffffffffffffffffffffff', 'df df fdfsd fesfdsf dfdfffffff', 'Frontend', 'swep', '2', 'Bachelor of Applied Science', 'Bashkir', 'Cleaning & Grounds Maintenance Occupations', 'part-time', 4, 'advertisements', 1, 14, '2023-08-09 06:48:53', '2023-08-28 04:45:10', 1, 0, 0),
(6, 2, 'Delivery boy', '0-1 ', 'below 1 lac', 'india', 'Other', 'amul.com', 'Also known as couriers or delivery men, delivery boys deliver packages, documents, and other items to customers. They answer customers\' questions and investigate any discrepancies with the delivered items', 'Delivery boys deliver packages, documents, and other items to customers', 'Investigate any discrepancies ', 'Delivery ', 'full-time', '5', 'Other', 'Hindi', 'Community & Social Services Occupations', 'full-time', 39, 'decision', 1, NULL, '2023-08-09 23:29:41', '2023-09-01 00:34:52', 1, 0, 0),
(7, 2, 'Receptionist', '0-1 ', '1lac-3lac', 'aland islands', 'Retail & Wholesale', 'www.careerattcs.com', 'tgh ', 'tyhtfgh', 'tghfghb', NULL, 'apprenticeship', '6', NULL, NULL, NULL, NULL, 5, 'onboarding', 1, NULL, '2023-08-10 01:45:44', '2023-08-25 03:47:19', 1, 0, 0),
(8, 1, 'Potmen', 'fresher', NULL, 'albania', 'Construction, Repair & Maintenance Services', 'ddd.com', 'df', 'sdfds', 'sdfsdf', NULL, 'other', '3', NULL, NULL, NULL, NULL, 36, 'decision', 1, NULL, '2023-08-10 01:46:18', '2023-08-31 04:54:24', 1, 0, 0),
(9, 2, 'Postmen', 'fresher', '3lac-5lac', 'albania', 'Manufacturing', 'ddd.com', NULL, NULL, NULL, NULL, 'part-time', '10', NULL, NULL, ', Technology Occupations, Organization Operations & Administrative Occupations, Architecture & Engineering Occupations, Manufacturing & Utilities Occupations, Css', 'full-time', 7, 'onboarding', 1, NULL, '2023-08-10 01:46:55', '2023-08-25 23:53:02', 1, 0, 0),
(10, 1, 'Driver', '1-3 ', '3lac-5lac', 'aland islands', 'Manufacturing', 'ghg.com', NULL, NULL, NULL, NULL, 'apprenticeship', NULL, NULL, NULL, NULL, NULL, 28, 'decision', 1, NULL, '2023-08-10 03:58:27', '2023-08-26 05:57:02', 1, 0, 0),
(11, 3, 'Hr', '1-3 ', '3lac-5lac', 'antarctica', 'Human Resources & Staffing', 'dps.com', 'In simplest terms, the HR (Human Resources) department is a group who is responsible for managing the employee life cycle (i.e., recruiting, hiring, onboarding, training, and firing employees) and administering employee benefits.', 'department is a group who is responsible for managing the employee life cycle', NULL, NULL, 'full-time', '2', NULL, NULL, NULL, NULL, 7, '', 1, NULL, '2023-08-11 00:51:09', '2023-08-11 00:51:09', 1, 0, 1),
(12, 1, 'Raju', '0-1 ', NULL, 'afghanistan', 'Healthcare', 'ddd.com', 'PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP', 'PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP', 'PPPPPPPPPPPPPPPPPPPPPPPPPPPPPP', 'Leadership', 'internship', '4', 'Bachelor of Liberal Arts', 'Abkhaz', 'Sales, Retail, & Customer Support Occupations, Healthcare Occupations, Organization Operations & Administrative Occupations, Food & Beverage Occupations', 'full-time', 2, '', 1, NULL, '2023-08-11 23:49:15', '2023-08-11 23:49:38', 1, 0, 1),
(13, 4, 'Babu bhai', '0-1 ', '3lac-5lac', 'algeria', 'Construction, Repair & Maintenance Services', 'fgfdgvb.com', 'assssssssssssssssssssssssssssasaasasasasasasasasasasasasasasasaasasasasasasasasasasasasasasas asa  asaqa sqas ', 'hggggggggggggggggggggggggggggggggggggggggggggggggggcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfc', 'gffhghhggggggggggggggggggggggg', 'Frontend', 'casual', NULL, 'Bachelor of Architectural Studies', NULL, 'Food & Beverage Occupations, Finance & Accounting Occupations', 'full-time', 2, '', 1, NULL, '2023-08-12 01:14:33', '2023-08-12 01:14:44', 1, 0, 1),
(14, 8, 'Home worker', '0-1 ', 'below 1 lac', 'afghanistan', 'Retail & Wholesale', 'ertwar.com', 'A home worker', 'Cleansing , laundry ', 'Fully skilled', 'home', 'internship', '3', 'Bachelor of Aerospace Engineering', 'Avaric', 'Marketing, Advertising & Public Relations Occupations', 'other', 4, '', 1, NULL, '2023-08-16 01:39:54', '2023-08-16 01:39:54', 0, 0, 0),
(15, 2, 'Bakers ', 'fresher', '1lac-3lac', 'albania', 'Retail & Wholesale', 'ertwar.com', 'yhtyh trhfgh fgh', 'dhdgh fhdfghf', ' dfghdf gh', 'thftghgfh', 'internship', NULL, 'Bachelor of Applied Studies', 'Bashkir', 'Education & Instruction Occupations', 'full-time', 5, '', 1, NULL, '2023-08-16 02:03:34', '2023-08-25 04:02:40', 1, 0, 1),
(16, 8, 'Bussiness Development officer', '0-1 ', '1lac-3lac', 'afghanistan', 'Healthcare', 'ertwar.com', 'sefwef rtergertert', ' ertrdgd ert', 'rter ergrg', 'fgfdgdfg ertdrfg', 'internship', '2', 'Bachelor of Applied Technology', 'Azerbaijani', 'Education & Instruction Occupations', 'part-time', 7, '', 1, NULL, '2023-08-16 02:59:10', '2023-08-16 02:59:10', 0, 0, 0),
(17, 8, 'React Developeer', '1-3 ', '3lac-5lac', 'aland islands', 'Healthcare', 'jhgbh.com', 'tgfhfh', 'fgfddfg', 'fgfgfg', 'gffgf', 'swep', '3', 'Bachelor of Applied Studies', 'Bambara', 'Education & Instruction Occupations', 'part-time', 5, '', 1, NULL, '2023-08-16 03:14:03', '2023-08-16 03:14:03', 0, 0, 0),
(18, 9, 'Manager', '1-3 ', '3lac-5lac', 'guinea', 'Healthcare', 'we2code.com', 'Testing', 'Testing', NULL, NULL, 'internship', '16', 'Bachelor of Liberal Arts', 'Bengali', 'Community & Social Services Occupations', 'full-time', 7, 'advertisements', 1, NULL, '2023-08-19 11:56:11', '2023-08-19 12:02:36', 1, 0, 0),
(19, 2, 'React js developer', '0-1 ', '5lac-10lac', 'afghanistan', 'Manufacturing', 'ddd.com', 'wsdad xasd fgrfgh thfhfgh fthgsg tryhdfgtrt dfg vdfrtrg dfgtgfssa sdfdg drgdgg rg rf er ertet  rgr er rewre rtert rdtrtertrtretret ret t  t rewretrtretr5tyrg r trtrtgrgf5rtrgvv gfbfgrt grthh fghrtfg ftgfgrth fgbvc gffhrthftg hvcb rfgtrfgr ththgfbh tgrtg rththb fggrtgrt yhthgfbh rftgertr ytrhgfbh trgrtgrtyth gfbhfg rtgrytryh', 'adasd', 'dasdasd', NULL, 'freelance', NULL, NULL, NULL, NULL, NULL, 4, '', 1, NULL, '2023-08-25 23:54:13', '2023-08-25 23:54:13', 0, 0, 0),
(20, 2, 'sdsfdsf', '0-1 ', NULL, 'afghanistan', 'Healthcare', 'ddd.com', NULL, NULL, NULL, NULL, 'internship', '4', NULL, NULL, NULL, NULL, 4, '', 1, NULL, '2023-08-26 04:41:50', '2023-08-26 04:43:11', 1, 0, 0),
(21, 2, 'Receptionist', '1-3 ', NULL, 'american samoa', NULL, 'www.careerattcs.com', NULL, NULL, NULL, NULL, 'permanent', '1', NULL, NULL, NULL, NULL, 5, '', 1, NULL, '2023-08-28 05:16:16', '2023-08-28 05:16:16', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_category`
--

CREATE TABLE `job_category` (
  `job_category_id` int(101) NOT NULL,
  `category_name` text,
  `parent_id` int(51) NOT NULL,
  `category_type` text,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job_category`
--

INSERT INTO `job_category` (`job_category_id`, `category_name`, `parent_id`, `category_type`, `is_active`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, NULL, 0, 'Factory', 1, '2023-05-20 05:28:59', '2023-08-10 10:16:05', 0),
(2, 'Driver', 37, 'Law', 1, '2023-05-20 05:29:08', '2023-09-06 04:23:13', 0),
(4, 'Cleaner', 32, 'IT', 1, '2023-05-22 00:14:47', '2023-09-06 04:23:03', 0),
(5, 'Receptionist', 1, 'Factory', 1, '2023-05-22 00:14:55', '2023-05-22 00:14:55', 0),
(7, 'Manager', 27, 'Development ', 1, '2023-05-22 00:15:13', '2023-09-06 04:22:53', 0),
(8, NULL, 0, 'Hospital', 1, '2023-05-22 00:15:20', '2023-05-22 00:15:20', 0),
(9, NULL, 0, 'Hotel', 1, '2023-05-22 00:15:25', '2023-05-22 00:15:25', 0),
(26, NULL, 0, 'Remote', 1, '2023-05-26 00:09:50', '2023-06-05 00:54:52', 0),
(27, NULL, 0, 'Development ', 1, '2023-05-26 01:59:24', '2023-05-26 01:59:39', 0),
(28, 'Frontend Developer', 27, 'Development ', 1, '2023-05-26 01:59:50', '2023-05-26 01:59:50', 1),
(29, NULL, 0, 'management ', 1, '2023-05-27 01:30:49', '2023-08-10 10:37:36', 0),
(32, NULL, 0, 'IT', 1, '2023-05-27 04:32:36', '2023-08-10 10:15:02', 0),
(33, 'Men cloths', 1, 'Factory', 1, '2023-06-05 00:54:22', '2023-08-26 06:37:46', 1),
(35, NULL, 0, 'Fashion', 1, '2023-06-20 04:00:07', '2023-06-20 04:00:16', 0),
(36, 'web developer', 32, 'IT', 1, '2023-08-10 08:35:12', '2023-08-10 08:35:12', 1),
(37, NULL, 0, 'Law', 1, '2023-08-10 08:37:32', '2023-08-10 08:37:32', 0),
(38, 'Web designer', 32, 'IT', 1, '2023-08-10 10:27:35', '2023-08-10 10:27:35', 1),
(39, 'Web designer', 26, 'Remote', 1, '2023-08-10 10:28:03', '2023-08-10 10:28:03', 1),
(40, 'sadsf', 8, 'Hospital', 1, '2023-08-11 09:04:44', '2023-08-11 09:04:44', 1),
(41, 'dfsfs', 9, 'Hotel', 1, '2023-08-11 09:04:48', '2023-08-11 09:04:48', 1),
(42, 'sdfsf', 27, 'Development ', 1, '2023-08-11 09:04:51', '2023-08-11 09:04:51', 1),
(43, 'sdfsf', 9, 'Hotel', 1, '2023-08-11 09:04:54', '2023-08-11 09:04:54', 1),
(44, 'sdfsfs', 9, 'Hotel', 1, '2023-08-11 09:04:57', '2023-08-11 09:04:57', 1),
(45, 'sdsadad', 9, 'Hotel', 1, '2023-08-11 09:05:02', '2023-08-11 09:05:02', 1),
(46, 'cycle', 1, 'Factory', 1, '2023-08-12 07:05:40', '2023-08-12 07:05:40', 1),
(47, 'fgdrgdrgh', 1, 'Factory', 1, '2023-08-12 07:34:05', '2023-08-12 07:34:05', 1),
(48, 'cloths', 26, 'Remote', 1, '2023-08-26 06:38:02', '2023-09-06 04:22:35', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_interviews`
--

CREATE TABLE `job_interviews` (
  `id` int(51) NOT NULL,
  `job_id` int(51) NOT NULL,
  `employee_id` int(51) NOT NULL,
  `interview_date` date NOT NULL,
  `is_reschedule` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `status` varchar(21) NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_admin` int(51) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `list`
--

CREATE TABLE `list` (
  `id` int(101) NOT NULL,
  `item_name` varchar(251) NOT NULL,
  `json` json NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `list`
--

INSERT INTO `list` (`id`, `item_name`, `json`, `created_at`, `updated_at`) VALUES
(1, 'Skill', '{\"1\": \"Sales, Retail, & Customer Support Occupations\", \"2\": \"Healthcare Occupations\", \"3\": \"Organization Operations & Administrative Occupations\", \"4\": \"Food & Beverage Occupations\", \"5\": \"Technology Occupations\", \"6\": \"Finance & Accounting Occupations\", \"7\": \"Repair, Maintenance & Installation Occupations\", \"8\": \"Architecture & Engineering Occupations\", \"9\": \"Construction & Extraction Occupations\", \"10\": \"Supply Chain & Logistics Occupations\", \"11\": \"Manufacturing & Utilities Occupations\", \"12\": \"Marketing, Advertising & Public Relations Occupations\", \"13\": \"Community & Social Services Occupations\", \"14\": \"Education & Instruction Occupations\", \"15\": \"Transportation Occupations\", \"16\": \"Science & Research Occupations\", \"17\": \"Cleaning & Grounds Maintenance Occupations\", \"18\": \"Media, Arts & Design Occupations\", \"19\": \"Safety, Security & Civil Defence Occupations\", \"20\": \"Personal Service Occupations\", \"21\": \"Travel, Attractions & Events Occupations\", \"22\": \"Legal Occupations\", \"23\": \"Farming, Fisheries & Forestry Occupations \", \"25\": \"JavaScript\", \"26\": \"Html\", \"27\": \"Css\", \"28\": \"Bootstrap\", \"29\": \"Typing\", \"30\": \"React js\", \"31\": \"Tally\", \"32\": \"Other\"}', '2023-04-18 05:52:56', '2023-08-26 06:38:22'),
(2, 'Category', '{\"2\": \"Driver\", \"4\": \"Cleaner\", \"5\": \"Receptionist\", \"7\": \"Manager\", \"48\": \"cloths\"}', '2023-04-18 09:02:44', '2023-09-06 04:23:13'),
(3, 'Location', '{}', '2023-04-18 09:03:51', '2023-04-20 12:38:47'),
(4, 'Industry', '{\"1\": \"Retail & Wholesale\", \"2\": \"Healthcare\", \"3\": \"Manufacturing\", \"4\": \"Construction, Repair & Maintenance Services\", \"5\": \"Restaurants & Food Service\", \"6\": \"Finance\", \"7\": \"Human Resources & Staffing\", \"8\": \"Transportation & Logistics\", \"9\": \"Information Technology\", \"10\": \"Energy, Mining, Utilities\", \"11\": \"Management & Consulting\", \"12\": \"Non-profit & NGO\", \"13\": \"Education\", \"14\": \"Insurance\", \"15\": \"Government & Public Administration\", \"16\": \"Telecommunications\", \"17\": \"Aerospace & Defence\", \"18\": \"Hotel & Travel Accommodation\", \"19\": \"Agriculture\", \"20\": \"Legal\", \"21\": \"Real Estate\", \"22\": \"Media & Communication\", \"23\": \"Arts, Entertainment & Recreation\", \"24\": \"Pharmaceutical & Biotechnology\", \"25\": \"Personal Consumer Services\", \"26\": \"Other\"}', '2023-04-18 09:04:56', '2023-05-15 11:18:30'),
(5, 'Education', '{\"1\": \"Bachelor of Liberal Arts\", \"2\": \"Bachelor of Arts\", \"3\": \"Bachelor of Liberal Arts\", \"4\": \"Alternate Entry Master of Science in Nursing\", \"5\": \"Master of Liberal Arts\", \"6\": \"Bachelor of Arts\", \"7\": \"Bachelor of Applied Arts\", \"8\": \"Bachelor of Applied Arts and Sciences\", \"9\": \"Bachelor of Arts in Communication\", \"10\": \"Bachelor of Aerospace Engineering\", \"11\": \"Bachelor of Arts and Economics\", \"12\": \"Bachelor of Economics\", \"13\": \"Bachelor of Arts in Education\", \"14\": \"Bachelor of Applied Studies\", \"15\": \"Bachelor of Applied Science\", \"16\": \"Bachelor of Architectural Studies\", \"17\": \"Bachelor of Applied Science\", \"18\": \"Bachelor of Art & Technology\", \"19\": \"Bachelor of Applied Technology\", \"20\": \"Bachelor of Accountancy\", \"21\": \"Bachelor of Agricultural Science\", \"22\": \"Bachelor of Applied Finance\", \"23\": \"Bachelor of Applied Science\", \"24\": \"Bachelor of Architecture\", \"25\": \"Bachelor of Asian Studies\", \"26\": \"Bachelor of Business Analysis - Financial\", \"27\": \"Bachelor of Business Administration\", \"28\": \"Bachelor of Built Environment\", \"29\": \"Bachelor of Biosystems Engineering\", \"30\": \"Bachelor of Behavioural Neuroscience\", \"31\": \"Bachelor of Business\", \"32\": \"Bachelor of Commerce and Administration\", \"33\": \"Bachelor of Civil Engineering\", \"34\": \"Bachelor of Computer Information Systems\", \"35\": \"Bachelor of Criminal Justice\", \"36\": \"Bachelor of Computer and Mathematical Sciences\", \"37\": \"Bachelor of Computing & Mathematical Sciences\", \"38\": \"Bachelor of Surgery\", \"39\": \"Bachelor of Chemical Engineering\", \"40\": \"Bachelor of Commerce\", \"41\": \"Bachelor of Commerce\", \"42\": \"Bachelor of Communication\", \"43\": \"Bachelor of Computing\", \"44\": \"Bachelor of Computer Operations Technology\", \"45\": \"Bachelor of Communications Studies\", \"46\": \"Bachelor of Design\", \"47\": \"Bachelor of Engineering\", \"48\": \"Bachelor of Electrical Engineering\", \"49\": \"Bachelor of Electronics Engineering Technology\", \"50\": \"Bachelor of Environmental Studies\", \"51\": \"Bachelor of Economics\", \"52\": \"Bachelor of Finance & Economics\", \"53\": \"Bachelor of Economic Science\", \"54\": \"Bachelor of Education\", \"55\": \"Bachelor of Environmental Design\", \"56\": \"Bachelor of Engineering\", \"57\": \"Bachelor of Fine Arts\", \"58\": \"Bachelor of Finance\", \"59\": \"Bachelor of General Studies\", \"60\": \"Bachelor of Game & Simulation Programming\", \"61\": \"Bachelor of Humanities and Arts\", \"62\": \"Bachelor of Hotel Management\", \"63\": \"Bachelor of Health Science\", \"64\": \"Bachelor of Health Sciences\", \"65\": \"Bachelor of Interior Architecture\", \"66\": \"Bachelor of Integrated Studies\", \"67\": \"Bachelor of Interdisciplinary Studies\", \"68\": \"Bachelor of Industrial and Science Engineering\", \"69\": \"Bachelor of Information Technology\", \"70\": \"Bachelor of Industrial Design\", \"71\": \"Bachelor of Information Science\", \"72\": \"Bachelor of Information Technology\", \"73\": \"Bachelor of International Studies\", \"74\": \"Bachelor of Journalism\", \"75\": \"Bachelor of Liberal Arts\", \"76\": \"Bachelor of Landscape Architecture\", \"77\": \"Bachelor of Liberal Studies\", \"78\": \"Bachelor of Languages\", \"79\": \"Bachelor of Music\", \"80\": \"Bachelor of Mechanical Engineering\", \"81\": \"Bachelor of Music Education\", \"82\": \"Bachelor of Materials Engineering\", \"83\": \"Bachelor of Music\", \"84\": \"Bachelor of Public Affairs\", \"85\": \"Bachelor of Polymer and Fiber Engineering\", \"86\": \"Bachelor of Professional Health Science\", \"87\": \"Bachelor of Science\", \"88\": \"Bachelor of Science in Aerospace Engineering\", \"89\": \"Bachelor of Science in Business Administration\", \"90\": \"Bachelor of Science in Biomedical Engineering\", \"91\": \"Bachelor of Science in Commerce Business Administration\", \"92\": \"Bachelor of Science in Civil Engineering\", \"93\": \"Bachelor of Science in Computer & Information Sciences\", \"94\": \"Bachelor of Science in Computer Science\", \"95\": \"Bachelor of Science in Computer Technology\", \"96\": \"Bachelor of Science in Chemical Engineering\", \"97\": \"Bachelor of Science in Chemistry\", \"98\": \"Bachelor of Science in Engineering\", \"99\": \"Bachelor of Science in Electrical Engineering\", \"100\": \"Bachelor of Science in Engineering Technology\", \"101\": \"Bachelor of Science in Education\", \"102\": \"Bachelor of Science in Geology\", \"103\": \"Bachelor of Science in Human Environmental Sciences\", \"104\": \"Bachelor of Science in Mechanical Engineering\", \"105\": \"Bachelor of Science in Manufacturing Engineering Technology\", \"106\": \"Bachelor of Science in Metallurgical Engineering\", \"107\": \"Bachelor of Science in Microbiology\", \"108\": \"Bachelor of Science in Materials Engineering\", \"109\": \"Bachelor of Science in Nursing\", \"110\": \"Bachelor of Science in Social Work\", \"111\": \"Bachelor of Social Work\", \"112\": \"Bachelor of Software Engineering\", \"113\": \"Bachelor of Textile Engineering\", \"114\": \"Bachelor of Technical & Interdisciplinary Studies\", \"115\": \"Bachelor of Textile Management and Technology\", \"116\": \"Bachelor of Wireless Engineering\", \"117\": \"Bachelor of Arts\", \"118\": \"Bachelor of Economics\", \"119\": \"Bachelor of Education\", \"120\": \"Bachelor of Arts and Economics\", \"121\": \"Bachelor of Journalism\", \"122\": \"Bachelor of Architecture\", \"123\": \"Bachelor of Applied Science\", \"124\": \"Bachelor of Applied Studies\", \"125\": \"Bachelor of Applied Science\", \"126\": \"Bachelor of Arts for Teaching\", \"127\": \"Bachelor of Aviation\", \"128\": \"Bachelor of Biomedical Science\", \"129\": \"Bachelor of Business Information Systems\", \"130\": \"Bachelor of Surgery\", \"131\": \"Bachelor of Surgery\", \"132\": \"Bachelor of Dental Surgery\", \"133\": \"Bachelor of Surgery Degree\", \"134\": \"Bachelor of Civil Law\", \"135\": \"Bachelor of Counseling\", \"136\": \"Bachelor of Divinity\", \"137\": \"Bachelor of Divisionnity\", \"138\": \"Bachelor of Design\", \"139\": \"Bachelor of Dental Surgery\", \"140\": \"Bachelor of Dental Science\", \"141\": \"Bachelor of Engineering\", \"142\": \"Bachelor of Economics\", \"143\": \"Bachelor of Economics and Finance\", \"144\": \"Bachelor of Science in Education\", \"145\": \"Bachelor of Engineering\", \"146\": \"Bachelor of Fine Arts\", \"147\": \"Bachelor of Finance\", \"148\": \"Bachelor of General Studies\", \"149\": \"Bachelor of Health & Physical Education\", \"150\": \"Bachelor of Health Science\", \"151\": \"Bachelor of Health Science\", \"152\": \"bachelor of hygiene\", \"153\": \"Bachelor of Information and Communications Technology\", \"154\": \"Bachelor of Integrated Studies\", \"155\": \"Bachelor of Journalism\", \"156\": \"Bachelor of Kinesiology\", \"157\": \"Bachelor of Liberal Arts\", \"158\": \"Bachelor of Landscape Architecture\", \"159\": \"Bachelor of Music (degree)\", \"160\": \"Bachelor of Medicine\", \"161\": \"Bachelor of Biomedical science\", \"162\": \"Bachelor of Medical Science\", \"163\": \"Bachelor of Medical Science\", \"164\": \"Bachelor of Midwifery\", \"165\": \"Bachelor of Ministry\", \"166\": \"Bachelor of Medical Science\", \"167\": \"Bachelor of Biomedical science\", \"168\": \"Bachelor of Medical Science\", \"169\": \"Bachelor of Music\", \"170\": \"Bachelor of Nursing\", \"171\": \"Bachelor of Nursing Science\", \"172\": \"Bachelor of Nursing\", \"173\": \"Bachelor of Physical Education\", \"174\": \"Bachelor of Pharmacy\", \"175\": \"Bachelor of Philosophy\", \"176\": \"bachelor of public health nursing\", \"177\": \"Bachelor of Professional Studies\", \"178\": \"Bachelor of Religious Education\", \"179\": \"Bachelor of Religious Studies\", \"180\": \"Bachelor of Science (clear in education line)\", \"181\": \"Bachelor of Science in Education\", \"182\": \"Bachelor of Science in Business Administration\", \"183\": \"Bachelor of Science (university degree)\", \"184\": \"Bachelor of Science and/with Education\", \"185\": \"Bachelor of Science in Economics\", \"186\": \"Bachelor of Science in Engineering\", \"187\": \"Bachelor of Science in Psychology\", \"188\": \"Bachelor of Nursing Science\", \"189\": \"Bachelor of Science in Education\", \"190\": \"Bachelor of Science in Engineering\", \"191\": \"Bachelor of Science in Education\", \"192\": \"Bachelor of Science in Environmental Health\", \"193\": \"Bachelor of Science in Engineering Technology\", \"194\": \"Bachelor of Science in Family and Consumer Sciences\", \"195\": \"Bachelor of Science in General Studies\", \"196\": \"Bachelor of Journalism\", \"197\": \"Bachelor of Science in Law\", \"198\": \"Bachelor of Science in Medicine\", \"199\": \"Bachelor of Science in Nursing\", \"200\": \"Bachelor of Science in Nuclear Engineering\", \"201\": \"Bachelor of Social Science\", \"202\": \"Bachelor of Science in Public Health\", \"203\": \"Bachelor of Social Work\", \"204\": \"Bachelor of Teaching\", \"205\": \"Bachelor of Technology\", \"206\": \"Bachelor of Theology\", \"207\": \"Bachelor of Theology\", \"208\": \"Bachelor of Veterinary Medicine\", \"209\": \"Bachelor of Veterinary Medicine and Science\", \"210\": \"Bachelor of Surgery\", \"211\": \"Bachelor of Surgery\", \"212\": \"Master in Surgery\", \"213\": \"Bachelor of Education\", \"214\": \"Master of Laws\", \"215\": \"Legum Baccalaureus (Latin: Bachelor Of Laws)\", \"216\": \"Master of Laws\", \"217\": \"Licensed Master of Social Work\", \"218\": \"Master of Arts in Education\", \"219\": \"Master of Education\", \"220\": \"Master of Fine Arts\", \"221\": \"Master of Interdisciplinary Studies\", \"222\": \"Master of Library and Information Science\", \"223\": \"Master of Ministry\", \"224\": \"Master of Music\", \"225\": \"Master of Occupational Therapy\", \"226\": \"Master of Science in Engineering Technology\", \"227\": \"Master of Science in Education\", \"228\": \"Master of Science in Nursing\", \"229\": \"Master of Social Work\", \"230\": \"Master of Urban Planning\", \"231\": \"Master of Arts\", \"232\": \"Master of Arts in Education\", \"233\": \"Master of Applied Anthropology\", \"234\": \"Master of Accountancy\", \"235\": \"Master of Arts in Christian Education\", \"236\": \"Master of Accountancy\", \"237\": \"Master of Arts in international economics and finance\", \"238\": \"Master of Arts in International Hotel Management\", \"239\": \"Master of Arts in Liberal Studies\", \"240\": \"Master of Arts Management\", \"241\": \"Master of Arts in Public Service\", \"242\": \"Master of Arts in Professional Writing\", \"243\": \"Master of Architecture\", \"244\": \"Master of Archival Studies\", \"245\": \"Master of Engineering\", \"246\": \"Master of Applied Sciences\", \"247\": \"Master of Arts and Teaching\", \"248\": \"Bachelor of Medicine\", \"249\": \"Master of Business Administration\", \"250\": \"Medicinae Baccalaureus, Baccalaureus Chirurgiae (Latin: Bachelor of Medicine, Bachelor of Surgery)\", \"251\": \"Master of Biochemistry\", \"252\": \"Master of Biology\", \"253\": \"Master of Biological Science\", \"254\": \"Master of Surgery\", \"255\": \"Master of Surgery\", \"256\": \"Master of Chemistry\", \"257\": \"Master of Criminal Justice\", \"258\": \"Master of Clinical Dentistry\", \"259\": \"Master of Clinical Medical Science\", \"260\": \"Master of Divisionnity\", \"261\": \"Master of Divinity\", \"262\": \"Master of Digital Media\", \"263\": \"Master of Drama\", \"264\": \"Master of Dental Surgery\", \"265\": \"Master of Engineering\", \"266\": \"Master of Electronic Business\", \"267\": \"Master of Economics\", \"268\": \"Master of Education\", \"269\": \"Master of Environmental Design\", \"270\": \"Master of Engineering\", \"271\": \"Master of Environmental Science\", \"272\": \"Master of Environmental Studies\", \"273\": \"Master of Earth Science\", \"274\": \"Master of Educational Technology\", \"275\": \"Master of Fine Art\", \"276\": \"Master of Forensic Sciences\", \"277\": \"Master of Geography\", \"278\": \"Master of Geology\", \"279\": \"Master of Geophysics\", \"280\": \"Master of Health Administration\", \"281\": \"Master of Health Education\", \"282\": \"Master of Health Science\", \"283\": \"Master of Industrial Design\", \"284\": \"Master of International Development\", \"285\": \"Master of Management in the Network Economy\", \"286\": \"Master of Informatics\", \"287\": \"Master of Engineering\", \"288\": \"Master of Information Systems Management\", \"289\": \"Master of Jurisprudence\", \"290\": \"Master of Labor and Human Resources\", \"291\": \"Master of Librarianship\", \"292\": \"Master of Library and Information Science degree\", \"293\": \"Master of Letters\", \"294\": \"Master of Library Science\", \"295\": \"Master of Liberal Studies\", \"296\": \"Master of Music\", \"297\": \"Master of Mathematics\", \"298\": \"Master of Mathematics and Physics\", \"299\": \"Master of Mass Communications\", \"300\": \"Master of Music Education\", \"301\": \"Master of Ministry\", \"302\": \"Master of Mathematics, Operational Research, Statistics and Economics\", \"303\": \"Master of Marketing Research\", \"304\": \"Master of Medical Science\", \"305\": \"Master of Medical Science\", \"306\": \"Master of Management Sciences\", \"307\": \"Master of Music\", \"308\": \"Master of Nursing\", \"309\": \"Master of Natural Science\", \"310\": \"Master of Science in Nursing\", \"311\": \"Master of Nursing Science\", \"312\": \"Master of Oceanography\", \"313\": \"Master of Occupational Therapy\", \"314\": \"Master of Pharmacy Administration\", \"315\": \"Master of Public Administration\", \"316\": \"Master of Professional Accountancy\", \"317\": \"Master of Physician Assistant Studies\", \"318\": \"Master of Pharmacy\", \"319\": \"Master of Public Health\", \"320\": \"master of pharmacy\", \"321\": \"Master of Philosophy\", \"322\": \"Master of Physics\", \"323\": \"Master of Pacific International Affairs\", \"324\": \"Master of Planning\", \"325\": \"Master of Project Management\", \"326\": \"Master of Public Management\", \"327\": \"Master of Public Policy\", \"328\": \"Master of Professional Studies\", \"329\": \"Master of Professional Studies\", \"330\": \"Master of Physical Therapy\", \"331\": \"Master of Radiology\", \"332\": \"Master of Research\", \"333\": \"Master of Science\", \"334\": \"Master of Surgery\", \"335\": \"Master of Science in Education\", \"336\": \"Master of Surgery\", \"337\": \"Master of Science\", \"338\": \"Master in Science\", \"339\": \"Master of Science in Dentistry\", \"340\": \"Master of Science in Engineering\", \"341\": \"Master of Science in Electrical Engineering\", \"342\": \"Master of Science in Environmental Health\", \"343\": \"Master of Science in Finance\", \"344\": \"Master of Science in Information\", \"345\": \"Master of Science in Information Systems\", \"346\": \"Master of Science in Information Studies\", \"347\": \"Master of Criminal Justice\", \"348\": \"Master of Science in Library Science\", \"349\": \"Master of Sacred Music\", \"350\": \"Master Of Science In Nursing\", \"351\": \"Master of Science in Natural Sciences\", \"352\": \"Master of Social Science\", \"353\": \"Master of Science In Organizational Leadership\", \"354\": \"Master of Science in Public Health\", \"355\": \"Master of Social Science\", \"356\": \"Master of Science in Strategic Leadership\", \"357\": \"Master of Science in Social Work\", \"358\": \"Master of Studies\", \"359\": \"Master of Science in Taxation\", \"360\": \"Master of Statistics\", \"361\": \"Master of Surgery\", \"362\": \"Master of Social Work\", \"363\": \"Master of Theology\", \"364\": \"Master of Theology\", \"365\": \"Master of the University\", \"366\": \"Master of Urban Studies\", \"367\": \"Master of Urban and Regional Planning\", \"368\": \"Bachelor of Music\", \"369\": \"Master of Music\", \"370\": \"Post Master\'s Graduate Certificate\", \"371\": \"Bachelor of Science\", \"372\": \"Scientiar Baccalaureus, Bachelor of Science\", \"373\": \"Master of Surgery\", \"374\": \"Master of Theology\", \"375\": \"Bachelor of Theology\", \"376\": \"Master of Theology\", \"379\": \"Other\", \"380\": \"10th\", \"381\": \"12th\", \"382\": \"PCM\", \"383\": \"PCB\", \"384\": \"Commerce\", \"385\": \"Arts\"}', '2023-04-18 09:05:35', '2023-06-05 05:25:45'),
(6, 'Corporation', '{\"1\": \"B2B\", \"2\": \"B2C\", \"3\": \"C2C\", \"4\": \"B2G\", \"5\": \"G2C\", \"6\": \"G2B\", \"7\": \"Other\"}', '2023-04-18 09:06:14', '2023-05-19 09:36:40'),
(7, 'Language', '{\"1\": \"Abkhaz\", \"2\": \"Afar\", \"3\": \"Afrikaans\", \"4\": \"Akan\", \"5\": \"Albanian\", \"6\": \"Amharic\", \"7\": \"Arabic\", \"8\": \"Aragonese\", \"9\": \"Armenian\", \"10\": \"Assamese\", \"11\": \"Avaric\", \"12\": \"Avestan\", \"13\": \"Aymara\", \"14\": \"Azerbaijani\", \"15\": \"Bambara\", \"16\": \"Bashkir\", \"17\": \"Basque\", \"18\": \"Belarusian\", \"19\": \"Bengali\", \"20\": \"Bihari\", \"21\": \"Bislama\", \"22\": \"Bosnian\", \"23\": \"Breton\", \"24\": \"Bulgarian\", \"25\": \"Burmese\", \"26\": \"Catalan- Valencian\", \"27\": \"Chamorro\", \"28\": \"Chechen\", \"29\": \"Chichewa- Chewa- Nyanja\", \"30\": \"Chinese\", \"31\": \"Chuvash\", \"32\": \"Cornish\", \"33\": \"Corsican\", \"34\": \"Cree\", \"35\": \"Croatian\", \"36\": \"Czech\", \"37\": \"Danish\", \"38\": \"Divehi- Dhivehi- Maldivian-\", \"39\": \"Dutch\", \"40\": \"English\", \"41\": \"Esperanto\", \"42\": \"Estonian\", \"43\": \"Ewe\", \"44\": \"Faroese\", \"45\": \"Fijian\", \"46\": \"Finnish\", \"47\": \"French\", \"48\": \"Fula- Fulah- Pulaar- Pular\", \"49\": \"Galician\", \"50\": \"Georgian\", \"51\": \"German\", \"52\": \"Greek, Modern\", \"53\": \"Guaraní\", \"54\": \"Gujarati\", \"55\": \"Haitian- Haitian Creole\", \"56\": \"Hausa\", \"57\": \"Hebrew (modern)\", \"58\": \"Herero\", \"59\": \"Hindi\", \"60\": \"Hiri Motu\", \"61\": \"Hungarian\", \"62\": \"Interlingua\", \"63\": \"Indonesian\", \"64\": \"Interlingue\", \"65\": \"Irish\", \"66\": \"Igbo\", \"67\": \"Inupiaq\", \"68\": \"Ido\", \"69\": \"Icelandic\", \"70\": \"Italian\", \"71\": \"Inuktitut\", \"72\": \"Japanese\", \"73\": \"Javanese\", \"74\": \"Kalaallisut, Greenlandic\", \"75\": \"Kannada\", \"76\": \"Kanuri\", \"77\": \"Kashmiri\", \"78\": \"Kazakh\", \"79\": \"Khmer\", \"80\": \"Kikuyu, Gikuyu\", \"81\": \"Kinyarwanda\", \"82\": \"Kirghiz, Kyrgyz\", \"83\": \"Komi\", \"84\": \"Kongo\", \"85\": \"Korean\", \"86\": \"Kurdish\", \"87\": \"Kwanyama, Kuanyama\", \"88\": \"Latin\", \"89\": \"Luxembourgish, Letzeburgesch\", \"90\": \"Luganda\", \"91\": \"Limburgish\", \"92\": \"Lingala\", \"93\": \"Lao\", \"94\": \"Lithuanian\", \"95\": \"Luba-Katanga\", \"96\": \"Latvian\", \"97\": \"Manx\", \"98\": \"Macedonian\", \"99\": \"Malagasy\", \"100\": \"Malay\", \"101\": \"Malayalam\", \"102\": \"Maltese\", \"103\": \"Māori\", \"104\": \"Marathi (Marāṭhī)\", \"105\": \"Marshallese\", \"106\": \"Mongolian\", \"107\": \"Nauru\", \"108\": \"Navajo, Navaho\", \"109\": \"Norwegian Bokmål\", \"110\": \"North Ndebele\", \"111\": \"Nepali\", \"112\": \"Ndonga\", \"113\": \"Norwegian Nynorsk\", \"114\": \"Norwegian\", \"115\": \"Nuosu\", \"116\": \"South Ndebele\", \"117\": \"Occitan\", \"118\": \"Ojibwe, Ojibwa\", \"119\": \"Old Church Slavonic\", \"120\": \"Oromo\", \"121\": \"Oriya\", \"122\": \"Ossetian, Ossetic\", \"123\": \"Panjabi, Punjabi\", \"124\": \"Pāli\", \"125\": \"Persian\", \"126\": \"Polish\", \"127\": \"Pashto, Pushto\", \"128\": \"Portuguese\", \"129\": \"Quechua\", \"130\": \"Romansh\", \"131\": \"Kirundi\", \"132\": \"Romanian\", \"133\": \"Russian\", \"134\": \"Sanskrit (Saṁskṛta)\", \"135\": \"Sardinian\", \"136\": \"Sindhi\", \"137\": \"Northern Sami\", \"138\": \"Samoan\", \"139\": \"Sango\", \"140\": \"Serbian\", \"141\": \"Scottish Gaelic- Gaelic\", \"142\": \"Shona\", \"143\": \"Sinhala, Sinhalese\", \"144\": \"Slovak\", \"145\": \"Slovene\", \"146\": \"Somali\", \"147\": \"Southern Sotho\", \"148\": \"Spanish- Castilian\", \"149\": \"Sundanese\", \"150\": \"Swahili\", \"151\": \"Swati\", \"152\": \"Swedish\", \"153\": \"Tamil\", \"154\": \"Telugu\", \"155\": \"Tajik\", \"156\": \"Thai\", \"157\": \"Tigrinya\", \"158\": \"Tibetan Standard, Tibetan, Central\", \"159\": \"Turkmen\", \"160\": \"Tagalog\", \"161\": \"Tswana\", \"162\": \"Tonga (Tonga Islands)\", \"163\": \"Turkish\", \"164\": \"Tsonga\", \"165\": \"Tatar\", \"166\": \"Twi\", \"167\": \"Tahitian\", \"168\": \"Uighur, Uyghur\", \"169\": \"Ukrainian\", \"170\": \"Urdu\", \"171\": \"Uzbek\", \"172\": \"Venda\", \"173\": \"Vietnamese\", \"174\": \"Volapük\", \"175\": \"Walloon\", \"176\": \"Welsh\", \"177\": \"Wolof\", \"178\": \"Western Frisian\", \"179\": \"Xhosa\", \"180\": \"Yiddish\", \"181\": \"Yoruba\", \"182\": \"Zhuang, Chuang\", \"183\": \"Other\"}', '2023-04-18 09:06:36', '2023-05-19 09:31:59'),
(8, 'Category_type', '{\"1\": \"Factory\", \"8\": \"Hospital\", \"9\": \"Hotel\", \"26\": \"Remote\", \"27\": \"Development \", \"29\": \"management \", \"32\": \"IT\", \"35\": \"Fashion\", \"37\": \"Law\"}', '2023-05-15 11:27:47', '2023-08-10 10:37:36'),
(9, 'degree', '{}', '2023-05-19 09:16:30', '2023-05-19 09:16:30');

-- --------------------------------------------------------

--
-- Table structure for table `lmia`
--

CREATE TABLE `lmia` (
  `id` bigint(20) NOT NULL,
  `apply_id` bigint(20) NOT NULL,
  `employee_id` int(101) NOT NULL,
  `lmia_status` varchar(51) NOT NULL,
  `expected_time_of_completion` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lmia`
--

INSERT INTO `lmia` (`id`, `apply_id`, `employee_id`, `lmia_status`, `expected_time_of_completion`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 21, 0, 'candidate placement', '0000-00-00', 0, '2023-09-09 09:18:03', '2023-09-09 09:18:23'),
(2, 16, 0, 'candidate placement', '0000-00-00', 0, '2023-09-09 09:18:06', '2023-09-09 09:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `lmia_substages_employee`
--

CREATE TABLE `lmia_substages_employee` (
  `id` bigint(20) NOT NULL,
  `lmia_id` bigint(20) NOT NULL,
  `lmia_status` varchar(51) NOT NULL,
  `lmia_substage` text NOT NULL,
  `info_2` varchar(101) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lmia_substages_employee`
--

INSERT INTO `lmia_substages_employee` (`id`, `lmia_id`, `lmia_status`, `lmia_substage`, `info_2`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 1, 'candidate placement', 'confirm status of candidates', '', 1, 1, 0, '2023-09-08 10:42:29', '2023-09-08 10:42:29'),
(4, 1, 'candidate placement', 'attain information on candidate', '', 1, 1, 0, '2023-09-08 10:42:32', '2023-09-08 10:42:32');

-- --------------------------------------------------------

--
-- Table structure for table `lmia_substages_job`
--

CREATE TABLE `lmia_substages_job` (
  `id` bigint(20) NOT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `lmia_status` varchar(51) DEFAULT NULL,
  `lmia_substage` varchar(51) DEFAULT NULL,
  `info_1` varchar(21) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int(51) DEFAULT NULL,
  `updated_by` int(51) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(101) NOT NULL,
  `from_id` int(101) NOT NULL,
  `type` varchar(21) NOT NULL,
  `subject` varchar(251) NOT NULL,
  `action_id` int(101) NOT NULL,
  `message` varchar(301) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `from_id`, `type`, `subject`, `action_id`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 5, 'manager', 'added_new_job', 21, 'A new job with title-Receptionist has been added successfully', 0, '2023-08-28 10:46:16', '2023-08-28 10:46:16'),
(2, 2, 'company', 'added_new_job', 21, 'A new job with title-Receptionist has been added successfully', 0, '2023-08-28 10:46:16', '2023-08-28 10:46:16'),
(3, 21, 'employee', 'interview_scheduled', 1, 'hello, Gourav choudary you have interview scheduled on 2023-09-07 for job with title - Data analyst you have applied on, scheduled with getse', 0, '2023-08-31 08:52:51', '2023-08-31 08:52:51'),
(4, 1, 'company', 'interview_scheduled', 1, 'hello, getse you have interview scheduled on 2023-09-07 for job with title - Data analyst, scheduled with Gourav choudary', 0, '2023-08-31 08:52:51', '2023-08-31 08:52:51'),
(5, 11, 'employee', 'interview_scheduled', 1, 'hello, Sagar shah you have interview scheduled on 2023-09-05 for job with title - Data analyst you have applied on, scheduled with Money Money ', 0, '2023-09-04 06:38:20', '2023-09-04 06:38:20'),
(6, 2, 'company', 'interview_scheduled', 1, 'hello, Money Money  you have interview scheduled on 2023-09-05 for job with title - Data analyst, scheduled with Sagar shah', 0, '2023-09-04 06:38:20', '2023-09-04 06:38:20'),
(7, 11, 'employee', 'interview_scheduled', 1, 'hello, Sagar shah you have interview scheduled on 2023-09-05 for job with title - Data analyst you have applied on, scheduled with Money Money ', 0, '2023-09-04 06:42:43', '2023-09-04 06:42:43'),
(8, 2, 'company', 'interview_scheduled', 1, 'hello, Money Money  you have interview scheduled on 2023-09-05 for job with title - Data analyst, scheduled with Sagar shah', 0, '2023-09-04 06:42:43', '2023-09-04 06:42:43'),
(9, 5, 'manager', 'new_user_registered', 22, 'A new user sagar.we2code@gmail.com registered successfully', 0, '2023-09-04 11:14:06', '2023-09-04 11:14:06'),
(10, 21, 'employee', 'interview_scheduled', 1, 'hello, Gourav choudary you have interview scheduled on 2023-09-07 for job with title - Data analyst you have applied on, scheduled with Money Money ', 0, '2023-09-04 11:18:21', '2023-09-04 11:18:21'),
(11, 2, 'company', 'interview_scheduled', 1, 'hello, Money Money  you have interview scheduled on 2023-09-07 for job with title - Data analyst, scheduled with Gourav choudary', 0, '2023-09-04 11:18:21', '2023-09-04 11:18:21'),
(12, 5, 'manager', 'new_user_registered', 23, 'A new user sagar.we2code@gmail.com registered successfully', 0, '2023-09-04 11:25:42', '2023-09-04 11:25:42'),
(13, 5, 'manager', 'new_user_registered', 24, 'A new user sagar.we2code@gmail.com registered successfully', 0, '2023-09-04 12:12:55', '2023-09-04 12:12:55'),
(14, 25, 'employee', 'interview_scheduled', 1, 'hello, Pikashoo you have interview scheduled on 2023-09-05 for job with title - Data analyst you have applied on, scheduled with We2code', 0, '2023-09-05 11:21:42', '2023-09-05 11:21:42'),
(15, 3, 'company', 'interview_scheduled', 1, 'hello, We2code you have interview scheduled on 2023-09-05 for job with title - Data analyst, scheduled with Pikashoo', 0, '2023-09-05 11:21:42', '2023-09-05 11:21:42'),
(16, 5, 'manager', 'new_user_registered', 27, 'A new user utkarsh.we2code@gmail.com registered successfully', 0, '2023-09-06 06:56:20', '2023-09-06 06:56:20'),
(17, 5, 'manager', 'added_new_job', 23, 'A new job with title-manager has been added successfully', 0, '2023-09-11 05:08:40', '2023-09-11 05:08:40'),
(18, 2, 'company', 'added_new_job', 23, 'A new job with title-manager has been added successfully', 0, '2023-09-11 05:08:40', '2023-09-11 05:08:40');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(101) NOT NULL,
  `email` varchar(101) NOT NULL,
  `otp` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `email`, `otp`, `created_at`) VALUES
(1, 'aashi.we2code@gmail.com', 301296, '2023-08-03 12:03:20'),
(2, 'aashi.we2code@gmail.com', 490789, '2023-08-03 12:11:10'),
(3, 'nidhi.we2code@gmail.com', 442529, '2023-08-07 11:35:25'),
(4, 'utkarsh.we2code@gmail.com', 723588, '2023-08-08 04:36:54'),
(5, 'utkarsh.we2code@gmail.com', 789145, '2023-08-08 04:40:58'),
(6, 'gouravchoudhary9888@gmail.com', 128506, '2023-08-10 04:25:18'),
(7, 'aashi.we2code@gmail.com', 164682, '2023-08-10 05:34:12'),
(8, 'nidhi.we2code@gmail.com', 447273, '2023-08-11 04:18:10'),
(9, 'aashivyas2001@gmail.com', 442694, '2023-08-11 04:21:20'),
(10, 'nidhisavner843@gmail.com', 643987, '2023-08-11 04:21:21'),
(11, 'nidhisavner843@gmail.com', 432881, '2023-08-11 04:24:27'),
(12, 'sagar.we2code@gmail.com', 892054, '2023-08-11 05:05:15'),
(13, 'aashivyas2001@gmail.com', 732123, '2023-08-16 06:30:39'),
(14, 'apurvavyas3@gmail.com', 409663, '2023-08-16 06:40:41'),
(15, 'apurvavya3@gmail.com', 980267, '2023-08-16 06:49:50'),
(16, 'apurvavyas@3Gmail.com', 915469, '2023-08-16 06:54:42'),
(17, 'aashivyas2001@gmail.com', 401091, '2023-08-16 06:57:21'),
(18, 'aashivyas2001@gmail.com', 676565, '2023-08-16 07:06:18'),
(19, 'aashivyas2001@gmail.com', 319218, '2023-08-16 07:24:23'),
(20, 'aashivyas2001@gmail.com', 253609, '2023-08-16 07:29:03'),
(21, 'aashivyas2001@gmail.com', 364069, '2023-08-16 07:35:19'),
(22, 'aashivyas2001@gmail.com', 665995, '2023-08-16 08:19:51'),
(23, 'sagar.we2code@gmail.com', 224315, '2023-09-04 11:06:51'),
(24, 'sagar.we2code@gmail.com', 275134, '2023-09-04 11:25:01'),
(25, 'sagar.we2code@gmail.com', 776537, '2023-09-04 12:11:16'),
(26, 'utkarsh.we2code@gmail.com', 781604, '2023-09-06 06:54:06');

-- --------------------------------------------------------

--
-- Table structure for table `payment_reciept`
--

CREATE TABLE `payment_reciept` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_role` enum('employee','employer','admin') DEFAULT NULL,
  `payment_id` varchar(51) DEFAULT NULL,
  `payment_mode` text,
  `status` enum('success','pending','failed') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_reciept`
--

INSERT INTO `payment_reciept` (`id`, `user_id`, `user_role`, `payment_id`, `payment_mode`, `status`, `created_at`) VALUES
(1, 5, 'employee', '143AABB56C', 'razorpay', 'success', '2023-09-05 09:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`) VALUES
(1, 'ANDHRA PRADESH', 105),
(2, 'ASSAM', 105),
(3, 'ARUNACHAL PRADESH', 105),
(4, 'BIHAR', 105),
(5, 'GUJRAT', 105),
(6, 'HARYANA', 105),
(7, 'HIMACHAL PRADESH', 105),
(8, 'JAMMU & KASHMIR', 105),
(9, 'KARNATAKA', 105),
(10, 'KERALA', 105),
(11, 'MADHYA PRADESH', 105),
(12, 'MAHARASHTRA', 105),
(13, 'MANIPUR', 105),
(14, 'MEGHALAYA', 105),
(15, 'MIZORAM', 105),
(16, 'NAGALAND', 105),
(17, 'ORISSA', 105),
(18, 'PUNJAB', 105),
(19, 'RAJASTHAN', 105),
(20, 'SIKKIM', 105),
(21, 'TAMIL NADU', 105),
(22, 'TRIPURA', 105),
(23, 'UTTAR PRADESH', 105),
(24, 'WEST BENGAL', 105),
(25, 'DELHI', 105),
(26, 'GOA', 105),
(27, 'PONDICHERY', 105),
(28, 'LAKSHDWEEP', 105),
(29, 'DAMAN & DIU', 105),
(30, 'DADRA & NAGAR', 105),
(31, 'CHANDIGARH', 105),
(32, 'ANDAMAN & NICOBAR', 105),
(33, 'UTTARANCHAL', 105),
(34, 'JHARKHAND', 105),
(35, 'CHATTISGARH', 105);

-- --------------------------------------------------------

--
-- Table structure for table `substages_miscellaneous`
--

CREATE TABLE `substages_miscellaneous` (
  `id` bigint(20) NOT NULL,
  `misc_id` bigint(20) DEFAULT NULL,
  `type` text,
  `status` text,
  `substage` varchar(51) DEFAULT NULL,
  `info_1` varchar(11) DEFAULT NULL,
  `info_2` varchar(11) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_type` enum('super-admin','company','employee') DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_type` enum('super-admin','company','employee') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_applied_employee`
-- (See below for the actual view)
--
CREATE TABLE `view_applied_employee` (
`apply_id` int(101)
,`job_id` int(101)
,`employee_id` int(101)
,`is_viewed` smallint(11)
,`is_reserve` smallint(6)
,`apply_by_admin_id` smallint(6)
,`created_at` timestamp
,`updated_at` timestamp
,`job_title` varchar(251)
,`company_id` bigint(20)
,`company_name` varchar(251)
,`location` varchar(251)
,`job_created_by_admin` int(51)
,`name` text
,`email` varchar(50)
,`contact_no` bigint(15)
,`description` longtext
,`date_of_birth` date
,`gender` varchar(20)
,`marital_status` varchar(55)
,`nationality` text
,`current_location` text
,`currently_located_country` text
,`language` varchar(100)
,`religion` text
,`interested_in` text
,`experience` varchar(100)
,`work_permit_canada` char(100)
,`work_permit_other_country` text
,`employee_status` int(11)
,`message` text
,`is_featured` tinyint(1)
,`job_status` int(11)
,`posted_job_id` int(11)
,`date_of_posting` date
,`designation` varchar(251)
,`resume` varchar(301)
,`profile_photo` varchar(255)
,`created_by_admin` int(51)
,`is_deleted` tinyint(1)
,`education` text
,`specialization` text
,`skill` varchar(256)
,`id` bigint(20)
,`lmia_status` varchar(51)
,`expected_time_of_completion` date
,`lmia_active` tinyint(1)
,`interview_date` date
,`interview_active` tinyint(1)
,`status` varchar(21)
,`employee_created_by_admin` int(51)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_assign_job_count`
-- (See below for the actual view)
--
CREATE TABLE `view_assign_job_count` (
`admin_id` bigint(20)
,`name` text
,`admin_type` varchar(251)
,`assigned_job` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_employee_profile_percentage`
-- (See below for the actual view)
--
CREATE TABLE `view_employee_profile_percentage` (
`employee_id` bigint(20)
,`personal` decimal(18,2)
,`education` int(2)
,`Career` int(2)
,`skill` int(2)
,`created_at` timestamp
,`created_by_admin` int(51)
,`is_deleted` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_employer`
-- (See below for the actual view)
--
CREATE TABLE `view_employer` (
`company_id` int(101)
,`company_name` varchar(251)
,`industry` text
,`corporation` varchar(251)
,`alias` text
,`company_start_date` date
,`company_size` varchar(251)
,`website_url` varchar(251)
,`vacancy_for_post` varchar(251)
,`about` mediumtext
,`contact_person_name` char(251)
,`email` varchar(55)
,`password` varchar(255)
,`contact_no` bigint(20)
,`contact_no_other` bigint(20)
,`address` text
,`pin_code` int(101)
,`city` text
,`state` text
,`country` text
,`designation` char(101)
,`logo` varchar(100)
,`is_active` tinyint(1)
,`created_at` timestamp
,`updated_at` timestamp
,`created_by_admin` int(51)
,`is_deleted` tinyint(1)
,`franchise` varchar(101)
,`token` varchar(301)
,`profile_complete` decimal(21,2)
,`vacancies` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_employer_profile_completion`
-- (See below for the actual view)
--
CREATE TABLE `view_employer_profile_completion` (
`company_id` int(101)
,`profile_complete` decimal(21,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_followup`
-- (See below for the actual view)
--
CREATE TABLE `view_followup` (
`apply_id` int(101)
,`employee_id` bigint(20)
,`name` text
,`gender` varchar(20)
,`date_of_birth` date
,`experience` varchar(100)
,`contact_no` bigint(15)
,`email` varchar(50)
,`current_location` text
,`currently_located_country` text
,`employee_deleted` tinyint(1)
,`company_name` varchar(251)
,`job_id` bigint(20)
,`job_title` varchar(251)
,`job_deleted` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_job_posted`
-- (See below for the actual view)
--
CREATE TABLE `view_job_posted` (
`job_id` bigint(20)
,`company_id` bigint(20)
,`job_title` varchar(251)
,`experience_required` varchar(101)
,`salary` varchar(101)
,`location` varchar(251)
,`industry_type` text
,`apply_link` varchar(301)
,`job_description` mediumtext
,`your_duties` mediumtext
,`requirement` mediumtext
,`department` text
,`job_type` varchar(251)
,`role_category` text
,`education` text
,`language` text
,`keyskill` text
,`employement` text
,`job_category_id` int(101)
,`lmia_status` text
,`is_active` tinyint(1)
,`manager_id` bigint(20)
,`created_at` timestamp
,`updated_at` timestamp
,`created_by_admin` int(51)
,`is_featured` tinyint(1)
,`is_deleted` tinyint(1)
,`category_type` text
,`company_name` varchar(251)
,`email` varchar(55)
,`contact_no_other` bigint(20)
,`industry` text
,`about` mediumtext
,`logo` varchar(100)
,`address` text
,`company_size` varchar(251)
,`corporation` varchar(251)
,`company_deleted` tinyint(1)
,`total_applicants` bigint(21)
,`applied_by_admin` bigint(21)
,`applied_by_self` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `employee_view`
--
DROP TABLE IF EXISTS `employee_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `employee_view`  AS SELECT `e`.`employee_id` AS `employee_id`, `e`.`name` AS `name`, `e`.`email` AS `email`, `e`.`password` AS `password`, `e`.`contact_no` AS `contact_no`, `e`.`description` AS `description`, `e`.`date_of_birth` AS `date_of_birth`, `e`.`gender` AS `gender`, `e`.`marital_status` AS `marital_status`, `e`.`nationality` AS `nationality`, `e`.`current_location` AS `current_location`, `e`.`currently_located_country` AS `currently_located_country`, `e`.`language` AS `language`, `e`.`religion` AS `religion`, `e`.`interested_in` AS `interested_in`, `e`.`experience` AS `experience`, `e`.`work_permit_canada` AS `work_permit_canada`, `e`.`work_permit_other_country` AS `work_permit_other_country`, `e`.`status` AS `status`, `e`.`message` AS `message`, `e`.`is_featured` AS `is_featured`, `e`.`job_status` AS `job_status`, `e`.`posted_job_id` AS `posted_job_id`, `e`.`date_of_posting` AS `date_of_posting`, `e`.`designation` AS `designation`, `e`.`resume` AS `resume`, `e`.`profile_photo` AS `profile_photo`, `e`.`created_at` AS `created_at`, `e`.`created_by_admin` AS `created_by_admin`, `e`.`updated_at` AS `updated_at`, `e`.`is_deleted` AS `is_deleted`, `e`.`token` AS `token`, `e`.`google` AS `google`, `e`.`facebook` AS `facebook`, `e`.`linkedin` AS `linkedin`, (((`epp`.`personal` + `epp`.`education`) + `epp`.`Career`) + `epp`.`skill`) AS `profile_complete`, `education`.`education` AS `education`, `education`.`specialization` AS `specialization`, (select group_concat(`employee_skill`.`skill` separator ',') from `employee_skill` where (`employee_skill`.`employee_id` = `e`.`employee_id`)) AS `skill` FROM ((`employee` `e` left join (select `employee_education`.`employee_id` AS `employee_id`,group_concat(`employee_education`.`course` separator ',') AS `education`,group_concat(`employee_education`.`specialization` separator ',') AS `specialization` from `employee_education` group by `employee_education`.`employee_id`) `education` on((`education`.`employee_id` = `e`.`employee_id`))) left join `view_employee_profile_percentage` `epp` on((`epp`.`employee_id` = `e`.`employee_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_applied_employee`
--
DROP TABLE IF EXISTS `view_applied_employee`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_applied_employee`  AS SELECT `aoj`.`apply_id` AS `apply_id`, `aoj`.`job_id` AS `job_id`, `aoj`.`employee_id` AS `employee_id`, `aoj`.`is_viewed` AS `is_viewed`, `aoj`.`is_reserve` AS `is_reserve`, `aoj`.`apply_by_admin_id` AS `apply_by_admin_id`, `aoj`.`created_at` AS `created_at`, `aoj`.`updated_at` AS `updated_at`, `vjp`.`job_title` AS `job_title`, `vjp`.`company_id` AS `company_id`, `vjp`.`company_name` AS `company_name`, `vjp`.`location` AS `location`, `vjp`.`created_by_admin` AS `job_created_by_admin`, `ev`.`name` AS `name`, `ev`.`email` AS `email`, `ev`.`contact_no` AS `contact_no`, `ev`.`description` AS `description`, `ev`.`date_of_birth` AS `date_of_birth`, `ev`.`gender` AS `gender`, `ev`.`marital_status` AS `marital_status`, `ev`.`nationality` AS `nationality`, `ev`.`current_location` AS `current_location`, `ev`.`currently_located_country` AS `currently_located_country`, `ev`.`language` AS `language`, `ev`.`religion` AS `religion`, `ev`.`interested_in` AS `interested_in`, `ev`.`experience` AS `experience`, `ev`.`work_permit_canada` AS `work_permit_canada`, `ev`.`work_permit_other_country` AS `work_permit_other_country`, `ev`.`status` AS `employee_status`, `ev`.`message` AS `message`, `ev`.`is_featured` AS `is_featured`, `ev`.`job_status` AS `job_status`, `ev`.`posted_job_id` AS `posted_job_id`, `ev`.`date_of_posting` AS `date_of_posting`, `ev`.`designation` AS `designation`, `ev`.`resume` AS `resume`, `ev`.`profile_photo` AS `profile_photo`, `ev`.`created_by_admin` AS `created_by_admin`, `ev`.`is_deleted` AS `is_deleted`, `ev`.`education` AS `education`, `ev`.`specialization` AS `specialization`, `ev`.`skill` AS `skill`, `lmia`.`id` AS `id`, `lmia`.`lmia_status` AS `lmia_status`, `lmia`.`expected_time_of_completion` AS `expected_time_of_completion`, `lmia`.`is_active` AS `lmia_active`, `ji`.`interview_date` AS `interview_date`, `ji`.`is_active` AS `interview_active`, `ji`.`status` AS `status`, `ji`.`created_by_admin` AS `employee_created_by_admin` FROM ((((`apply_on_job` `aoj` join `employee_view` `ev` on((`aoj`.`employee_id` = `ev`.`employee_id`))) join `view_job_posted` `vjp` on((`vjp`.`job_id` = `aoj`.`job_id`))) left join `lmia` on(((`lmia`.`apply_id` = `aoj`.`apply_id`) and (`lmia`.`is_active` = 1)))) left join `job_interviews` `ji` on(((`ji`.`employee_id` = `aoj`.`employee_id`) and (`ji`.`job_id` = `aoj`.`job_id`) and (`ji`.`is_reschedule` <> 1)))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_assign_job_count`
--
DROP TABLE IF EXISTS `view_assign_job_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_assign_job_count`  AS SELECT `admin`.`admin_id` AS `admin_id`, `admin`.`name` AS `name`, `admin`.`admin_type` AS `admin_type`, (select count(0) from `jobs` where (`jobs`.`manager_id` = `admin`.`admin_id`)) AS `assigned_job` FROM `admin` WHERE ((`admin`.`admin_type` = 'manager') AND (`admin`.`is_active` = 1) AND (`admin`.`is_deleted` = 0)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_employee_profile_percentage`
--
DROP TABLE IF EXISTS `view_employee_profile_percentage`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_employee_profile_percentage`  AS SELECT DISTINCT `e`.`employee_id` AS `employee_id`, if((`e`.`experience` = 'fresher'),round(((((((((((((((if((`e`.`name` <> ''),3.0769,0) + if((`e`.`email` <> ''),3.0769,0)) + if((`e`.`contact_no` <> ''),3.0769,0)) + if((`e`.`date_of_birth` <> ''),3.0769,0)) + if((`e`.`gender` <> ''),3.0769,0)) + if((`e`.`marital_status` <> ''),3.0769,0)) + if((`e`.`nationality` <> ''),3.0769,0)) + if((`e`.`current_location` <> ''),3.0769,0)) + if((`e`.`language` <> ''),3.0769,0)) + if((`e`.`interested_in` <> ''),3.0769,0)) + if((`e`.`experience` <> ''),3.0769,0)) + if((`e`.`work_permit_canada` <> ''),3.0769,0)) + if((`e`.`description` <> ''),3.0769,0)) + if((`e`.`profile_photo` <> ''),10,0)) + if((`e`.`resume` <> ''),20,0)),2),round(((((((((((((((if((`e`.`name` <> ''),1.5384,0) + if((`e`.`email` <> ''),1.5384,0)) + if((`e`.`contact_no` <> ''),1.5384,0)) + if((`e`.`date_of_birth` <> ''),1.5384,0)) + if((`e`.`gender` <> ''),1.5384,0)) + if((`e`.`marital_status` <> ''),1.5384,0)) + if((`e`.`nationality` <> ''),1.5384,0)) + if((`e`.`current_location` <> ''),1.5384,0)) + if((`e`.`language` <> ''),1.5384,0)) + if((`e`.`interested_in` <> ''),1.5384,0)) + if((`e`.`experience` <> ''),1.5384,0)) + if((`e`.`work_permit_canada` <> ''),1.5384,0)) + if((`e`.`description` <> ''),1.5384,0)) + if((`e`.`profile_photo` <> ''),10,0)) + if((`e`.`resume` <> ''),20,0)),2)) AS `personal`, round((case when ((select `employee_education`.`employee_id` from `employee_education` where (`employee_education`.`employee_id` = `e`.`employee_id`) limit 1) > 0) then 20 else 0 end),2) AS `education`, round((case when ((select `employee_career`.`employee_id` from `employee_career` where (`employee_career`.`employee_id` = `e`.`employee_id`) limit 1) > 0) then 20 else 0 end),2) AS `Career`, round((case when ((select `employee_skill`.`employee_id` from `employee_skill` where (`employee_skill`.`employee_id` = `e`.`employee_id`) limit 1) > 0) then 10 else 0 end),2) AS `skill`, `e`.`created_at` AS `created_at`, `e`.`created_by_admin` AS `created_by_admin`, `e`.`is_deleted` AS `is_deleted` FROM `employee` AS `e` ;

-- --------------------------------------------------------

--
-- Structure for view `view_employer`
--
DROP TABLE IF EXISTS `view_employer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_employer`  AS SELECT `e`.`company_id` AS `company_id`, `e`.`company_name` AS `company_name`, `e`.`industry` AS `industry`, `e`.`corporation` AS `corporation`, `e`.`alias` AS `alias`, `e`.`company_start_date` AS `company_start_date`, `e`.`company_size` AS `company_size`, `e`.`website_url` AS `website_url`, `e`.`vacancy_for_post` AS `vacancy_for_post`, `e`.`about` AS `about`, `e`.`contact_person_name` AS `contact_person_name`, `e`.`email` AS `email`, `e`.`password` AS `password`, `e`.`contact_no` AS `contact_no`, `e`.`contact_no_other` AS `contact_no_other`, `e`.`address` AS `address`, `e`.`pin_code` AS `pin_code`, `e`.`city` AS `city`, `e`.`state` AS `state`, `e`.`country` AS `country`, `e`.`designation` AS `designation`, `e`.`logo` AS `logo`, `e`.`is_active` AS `is_active`, `e`.`created_at` AS `created_at`, `e`.`updated_at` AS `updated_at`, `e`.`created_by_admin` AS `created_by_admin`, `e`.`is_deleted` AS `is_deleted`, `e`.`franchise` AS `franchise`, `e`.`token` AS `token`, `pc`.`profile_complete` AS `profile_complete`, (select count(`jobs`.`job_id`) from `jobs` where ((`jobs`.`company_id` = `e`.`company_id`) and (`jobs`.`is_deleted` <> 1))) AS `vacancies` FROM (`employer` `e` left join `view_employer_profile_completion` `pc` on((`pc`.`company_id` = `e`.`company_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_employer_profile_completion`
--
DROP TABLE IF EXISTS `view_employer_profile_completion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_employer_profile_completion`  AS SELECT DISTINCT `e`.`company_id` AS `company_id`, round((((((((((((((((((if((`e`.`company_name` <> ''),2.7272,0) + if((`e`.`industry` <> ''),2.7272,0)) + if((`e`.`corporation` <> ''),2.7272,0)) + if((`e`.`company_start_date` <> ''),2.7272,0)) + if((`e`.`company_size` <> ''),2.7272,0)) + if((`e`.`website_url` <> ''),2.7272,0)) + if((`e`.`vacancy_for_post` <> ''),2.7272,0)) + if((`e`.`about` <> ''),2.7272,0)) + if((`e`.`address` <> ''),2.7272,0)) + if((`e`.`city` <> ''),2.7272,0)) + if((`e`.`country` <> ''),2.7272,0)) + if((`e`.`contact_person_name` <> ''),5,0)) + if((`e`.`email` <> ''),5,0)) + if((`e`.`contact_no` <> ''),5,0)) + if((`e`.`designation` <> ''),5,0)) + if((`e`.`logo` <> ''),10,0)) + if((`ck`.`pan_no` <> ''),20,0)) + if((`ck`.`document` <> ''),20,0)),2) AS `profile_complete` FROM (`employer` `e` left join `company_kyc` `ck` on((`e`.`company_id` = `ck`.`company_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_followup`
--
DROP TABLE IF EXISTS `view_followup`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_followup`  AS SELECT `a`.`apply_id` AS `apply_id`, `e`.`employee_id` AS `employee_id`, `e`.`name` AS `name`, `e`.`gender` AS `gender`, `e`.`date_of_birth` AS `date_of_birth`, `e`.`experience` AS `experience`, `e`.`contact_no` AS `contact_no`, `e`.`email` AS `email`, `e`.`current_location` AS `current_location`, `e`.`currently_located_country` AS `currently_located_country`, `e`.`is_deleted` AS `employee_deleted`, `emp`.`company_name` AS `company_name`, `j`.`job_id` AS `job_id`, `j`.`job_title` AS `job_title`, `j`.`is_deleted` AS `job_deleted` FROM (((`employee_view` `e` join `apply_on_job` `a` on((`e`.`employee_id` = `a`.`employee_id`))) join `jobs` `j` on((`a`.`job_id` = `j`.`job_id`))) join `employer` `emp` on((`j`.`company_id` = `emp`.`company_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_job_posted`
--
DROP TABLE IF EXISTS `view_job_posted`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_job_posted`  AS SELECT `j`.`job_id` AS `job_id`, `j`.`company_id` AS `company_id`, `j`.`job_title` AS `job_title`, `j`.`experience_required` AS `experience_required`, `j`.`salary` AS `salary`, `j`.`location` AS `location`, `j`.`industry_type` AS `industry_type`, `j`.`apply_link` AS `apply_link`, `j`.`job_description` AS `job_description`, `j`.`your_duties` AS `your_duties`, `j`.`requirement` AS `requirement`, `j`.`department` AS `department`, `j`.`job_type` AS `job_type`, `j`.`role_category` AS `role_category`, `j`.`education` AS `education`, `j`.`language` AS `language`, `j`.`keyskill` AS `keyskill`, `j`.`employement` AS `employement`, `j`.`job_category_id` AS `job_category_id`, `j`.`lmia_status` AS `lmia_status`, `j`.`is_active` AS `is_active`, `j`.`manager_id` AS `manager_id`, `j`.`created_at` AS `created_at`, `j`.`updated_at` AS `updated_at`, `j`.`created_by_admin` AS `created_by_admin`, `j`.`is_featured` AS `is_featured`, `j`.`is_deleted` AS `is_deleted`, `jc`.`category_type` AS `category_type`, `e`.`company_name` AS `company_name`, `e`.`email` AS `email`, `e`.`contact_no_other` AS `contact_no_other`, `e`.`industry` AS `industry`, `e`.`about` AS `about`, `e`.`logo` AS `logo`, `e`.`address` AS `address`, `e`.`company_size` AS `company_size`, `e`.`corporation` AS `corporation`, `e`.`is_deleted` AS `company_deleted`, count((case when ((`a`.`is_viewed` <> 1) and (`ee`.`is_deleted` = 0)) then `a`.`employee_id` else NULL end)) AS `total_applicants`, count((case when ((`a`.`is_viewed` <> 1) and (`ee`.`is_deleted` = 0) and (`a`.`apply_by_admin_id` >= 1)) then `a`.`employee_id` else NULL end)) AS `applied_by_admin`, count((case when ((`a`.`is_viewed` <> 1) and (`ee`.`is_deleted` = 0) and (`a`.`apply_by_admin_id` = 0)) then `a`.`employee_id` else NULL end)) AS `applied_by_self` FROM ((((`jobs` `j` left join `apply_on_job` `a` on((`j`.`job_id` = `a`.`job_id`))) join `job_category` `jc` on((`j`.`job_category_id` = `jc`.`job_category_id`))) join `employer` `e` on((`j`.`company_id` = `e`.`company_id`))) left join `employee` `ee` on((`ee`.`employee_id` = `a`.`employee_id`))) WHERE ((`j`.`is_active` = 1) AND (`j`.`is_deleted` = 0)) GROUP BY `j`.`job_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `apply_on_job`
--
ALTER TABLE `apply_on_job`
  ADD PRIMARY KEY (`apply_id`);

--
-- Indexes for table `company_kyc`
--
ALTER TABLE `company_kyc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_type` (`email_type`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `employee_career`
--
ALTER TABLE `employee_career`
  ADD PRIMARY KEY (`career_id`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_education`
--
ALTER TABLE `employee_education`
  ADD PRIMARY KEY (`education_id`);

--
-- Indexes for table `employee_follow_up`
--
ALTER TABLE `employee_follow_up`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee_setting`
--
ALTER TABLE `employee_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_skill`
--
ALTER TABLE `employee_skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `employee_visa`
--
ALTER TABLE `employee_visa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `employer_documents`
--
ALTER TABLE `employer_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employer_follow_up`
--
ALTER TABLE `employer_follow_up`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `employer_setting`
--
ALTER TABLE `employer_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow_up`
--
ALTER TABLE `follow_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `FK_manager_id` (`manager_id`);

--
-- Indexes for table `job_category`
--
ALTER TABLE `job_category`
  ADD PRIMARY KEY (`job_category_id`);

--
-- Indexes for table `job_interviews`
--
ALTER TABLE `job_interviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lmia`
--
ALTER TABLE `lmia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`apply_id`);

--
-- Indexes for table `lmia_substages_employee`
--
ALTER TABLE `lmia_substages_employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_lmia_id` (`lmia_id`);

--
-- Indexes for table `lmia_substages_job`
--
ALTER TABLE `lmia_substages_job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_reciept`
--
ALTER TABLE `payment_reciept`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `substages_miscellaneous`
--
ALTER TABLE `substages_miscellaneous`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=803;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `apply_on_job`
--
ALTER TABLE `apply_on_job`
  MODIFY `apply_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `company_kyc`
--
ALTER TABLE `company_kyc`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `employee_career`
--
ALTER TABLE `employee_career`
  MODIFY `career_id` int(251) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `employee_education`
--
ALTER TABLE `employee_education`
  MODIFY `education_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `employee_follow_up`
--
ALTER TABLE `employee_follow_up`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employee_setting`
--
ALTER TABLE `employee_setting`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_skill`
--
ALTER TABLE `employee_skill`
  MODIFY `skill_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `employee_visa`
--
ALTER TABLE `employee_visa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `company_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employer_documents`
--
ALTER TABLE `employer_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `employer_follow_up`
--
ALTER TABLE `employer_follow_up`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employer_setting`
--
ALTER TABLE `employer_setting`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `job_category`
--
ALTER TABLE `job_category`
  MODIFY `job_category_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `job_interviews`
--
ALTER TABLE `job_interviews`
  MODIFY `id` int(51) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `list`
--
ALTER TABLE `list`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lmia`
--
ALTER TABLE `lmia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lmia_substages_employee`
--
ALTER TABLE `lmia_substages_employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lmia_substages_job`
--
ALTER TABLE `lmia_substages_job`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `payment_reciept`
--
ALTER TABLE `payment_reciept`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `substages_miscellaneous`
--
ALTER TABLE `substages_miscellaneous`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `FK_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `admin` (`admin_id`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`apnaorga`@`localhost` EVENT `delete_otp` ON SCHEDULE EVERY 1 SECOND STARTS '2023-05-10 14:08:21' ON COMPLETION PRESERVE ENABLE DO CALL destroyOtp()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
