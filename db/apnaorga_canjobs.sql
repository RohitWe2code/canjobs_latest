-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 26, 2023 at 04:03 PM
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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(101) NOT NULL,
  `email` varchar(251) NOT NULL,
  `password` varchar(301) NOT NULL,
  `name` text,
  `contact_no` bigint(21) DEFAULT NULL,
  `admin_type` varchar(251) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email_permission` tinyint(1) NOT NULL DEFAULT '1',
  `token` varchar(151) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`, `name`, `contact_no`, `admin_type`, `is_active`, `is_deleted`, `created_at`, `updated_at`, `email_permission`, `token`) VALUES
(1, 'raj.we2code@gmail.com', 'c13b1fd8824c5577074601c325503a9a', 'raj', NULL, 'super-admin', 1, 0, '2023-05-19 06:40:51', '2023-05-22 05:52:33', 1, ''),
(2, 'gourav.we2code@gmail.com', '3f30aff52f55a2a0c2d7a0e02e7872eb', 'Gourav choudary', NULL, 'manager', 1, 1, '2023-05-20 11:52:02', '2023-05-20 11:52:02', 1, ''),
(3, 'raj@gmail.com', 'c13b1fd8824c5577074601c325503a9a', 'Raj', NULL, 'manager', 1, 0, '2023-05-22 05:52:01', '2023-05-22 05:52:01', 1, ''),
(4, 'ragj.we2code@gmail.com', 'fbfabfa598f91231dac740696a4c34e4', 'dfvx cv', NULL, 'manager', 1, 1, '2023-06-05 06:26:32', '2023-06-05 06:26:32', 1, ''),
(5, 'aashi.we2code@gmail.com', 'c96948cbdaefbff6638d644f7b25b1c4', 'Annu', NULL, 'manager', 1, 1, '2023-06-12 05:22:59', '2023-06-12 05:22:59', 1, ''),
(6, 'rfghgfhaj.we2code@gmail.com', '62aef6cd4c8087f2c38868e155706995', 'tghfghf', NULL, 'manager', 1, 1, '2023-06-20 09:31:09', '2023-06-20 09:31:09', 1, ''),
(7, 'aashi.we2code@gmail.com', 'c96948cbdaefbff6638d644f7b25b1c4', 'Aashi vyas', NULL, 'super-admin', 1, 0, '2023-06-30 07:08:53', '2023-06-30 07:08:53', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `apply_on_job`
--

CREATE TABLE `apply_on_job` (
  `apply_id` int(101) NOT NULL,
  `job_id` int(101) NOT NULL,
  `employee_id` int(101) NOT NULL,
  `is_viewed` smallint(11) NOT NULL DEFAULT '5',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='apply job = 0, view job = 1, connect job = 2, save job = 3';

--
-- Dumping data for table `apply_on_job`
--

INSERT INTO `apply_on_job` (`apply_id`, `job_id`, `employee_id`, `is_viewed`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2023-05-20 11:28:10', '2023-05-20 11:39:28'),
(2, 1, 3, 0, '2023-05-22 05:32:12', '2023-05-22 05:32:12'),
(3, 7, 3, 0, '2023-05-22 06:38:39', '2023-06-05 12:40:10'),
(4, 1, 4, 0, '2023-05-22 08:53:54', '2023-05-22 08:55:58'),
(5, 6, 4, 0, '2023-05-22 08:58:06', '2023-05-22 08:58:10'),
(6, 4, 5, 0, '2023-05-22 09:13:47', '2023-06-06 08:48:33'),
(7, 2, 2, 0, '2023-05-22 12:14:36', '2023-05-22 12:15:03'),
(8, 7, 4, 0, '2023-05-23 06:04:32', '2023-05-23 06:04:35'),
(9, 8, 6, 0, '2023-05-23 11:45:28', '2023-05-23 11:45:28'),
(10, 6, 6, 0, '2023-05-23 11:45:30', '2023-05-23 11:45:30'),
(11, 5, 6, 0, '2023-05-23 11:45:31', '2023-05-23 11:45:31'),
(12, 3, 6, 0, '2023-05-23 11:45:33', '2023-05-23 11:45:33'),
(13, 2, 6, 0, '2023-05-23 11:45:33', '2023-05-23 11:45:33'),
(14, 4, 6, 0, '2023-05-23 11:45:35', '2023-05-23 11:45:35'),
(15, 4, 6, 0, '2023-05-23 11:45:38', '2023-06-05 12:27:29'),
(16, 1, 6, 0, '2023-05-23 11:45:41', '2023-05-23 11:45:41'),
(17, 8, 4, 1, '2023-05-24 09:19:45', '2023-05-24 09:20:14'),
(18, 4, 8, 0, '2023-05-25 15:28:47', '2023-06-05 12:28:56'),
(19, 4, 12, 0, '2023-05-29 06:57:51', '2023-06-05 11:54:16'),
(20, 11, 22, 0, '2023-06-05 07:03:39', '2023-06-05 07:03:39'),
(21, 4, 22, 0, '2023-06-05 07:04:03', '2023-06-05 12:41:08'),
(22, 15, 22, 0, '2023-06-06 08:47:05', '2023-06-06 08:47:05'),
(23, 15, 23, 0, '2023-06-07 10:13:20', '2023-06-07 10:13:20'),
(24, 14, 23, 0, '2023-06-07 10:14:15', '2023-06-07 10:14:15'),
(25, 11, 23, 0, '2023-06-07 10:18:54', '2023-06-07 10:18:58'),
(26, 10, 23, 1, '2023-06-07 10:20:30', '2023-06-07 10:20:30'),
(27, 20, 26, 0, '2023-06-12 10:10:33', '2023-06-12 10:10:33'),
(28, 19, 26, 0, '2023-06-12 10:37:05', '2023-06-12 10:37:05'),
(29, 19, 26, 0, '2023-06-12 10:40:10', '2023-06-20 09:25:09'),
(30, 4, 27, 0, '2023-06-20 07:22:48', '2023-07-24 11:09:00'),
(31, 19, 27, 0, '2023-06-20 07:31:26', '2023-06-20 09:24:59'),
(32, 19, 27, 0, '2023-06-20 07:31:35', '2023-06-20 07:31:37'),
(33, 21, 27, 0, '2023-06-20 08:47:33', '2023-06-30 10:06:37'),
(34, 14, 27, 0, '2023-06-30 10:12:50', '2023-06-30 10:12:50'),
(35, 11, 27, 0, '2023-06-30 10:12:56', '2023-06-30 10:12:56'),
(36, 26, 27, 0, '2023-07-03 12:13:36', '2023-07-03 12:13:36'),
(37, 16, 26, 1, '2023-07-04 04:24:38', '2023-07-04 04:24:38'),
(38, 26, 26, 0, '2023-07-04 04:24:51', '2023-07-04 04:24:53'),
(39, 3, 26, 0, '2023-07-22 07:11:20', '2023-07-22 07:11:20'),
(40, 22, 26, 0, '2023-07-22 07:12:24', '2023-07-22 07:12:24'),
(41, 27, 26, 0, '2023-07-22 07:12:40', '2023-07-22 07:12:40'),
(42, 24, 23, 0, '2023-07-22 17:24:28', '2023-07-22 17:24:28'),
(43, 6, 20, 0, '2023-07-24 12:18:30', '2023-07-24 12:18:30'),
(44, 26, 26, 0, '2023-07-24 12:39:30', '2023-07-24 12:39:30'),
(45, 29, 12, 0, '2023-07-24 12:49:36', '2023-07-24 12:49:36'),
(46, 19, 26, 5, '2023-07-24 13:06:46', '2023-07-24 13:06:46'),
(47, 27, 15, 0, '2023-07-24 13:17:00', '2023-07-24 13:17:00'),
(48, 28, 15, 0, '2023-07-24 13:17:02', '2023-07-24 13:17:02'),
(49, 19, 7, 0, '2023-07-24 13:17:19', '2023-07-24 13:17:19');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 1, 'ABCTY1234D', 'Molly', '1993-02-19', ' Vijay Nagar ', 452010, 'Indore', 'Madhya Pradesh ', 'India', 'AAACC4175D', '123-456-7890', 'PDES03028F', 'https://apnaorganicstore.in/canjobs/uploads/1684580874.pdf', '2023-05-20 11:07:54', '2023-05-20 11:07:54'),
(2, 3, 'ABCTY1234D', 'Priyanshu Gupta', '1995-05-12', 'Ram nagar', 752963, 'indore', 'mp', 'India', 'AAACC4175D', '123-456-7890', 'PDES03028F', 'https://apnaorganicstore.in/canjobs/uploads/1684825382.pdf', '2023-05-23 07:03:02', '2023-05-23 07:03:02'),
(3, 8, 'ABCTY1234D', 'Mayur', '1998-02-20', 'Ram nagar', 752963, 'indore', 'mp', 'India', 'AAACC4175D', '123-456-7890', 'PDES03028F', 'https://apnaorganicstore.in/canjobs/uploads/1685949943.pdf', '2023-06-05 07:25:43', '2023-06-05 07:25:43'),
(4, 14, 'ABCTY1234D', 'Chetn ', '1992-07-16', 'Ram nagar', 4500123, 'indore', ' Madhya Pradesh ', 'India', 'AAACC4175D', '123-456-7890', 'PDES03028F', 'https://apnaorganicstore.in/canjobs/uploads/1687251466.pdf', '2023-06-20 08:57:46', '2023-06-20 08:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `countrycode` char(2) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id`, `email_template_id`, `email_json`, `status`, `group_id`, `created_at`) VALUES
(1, 3, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \"}', 'SENT', 11373, '2023-05-20 11:13:38'),
(2, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \"}', 'SENT', 17184, '2023-05-20 11:28:10'),
(3, 3, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Sanchi\"}', 'SENT', 26521, '2023-05-20 11:34:07'),
(4, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Sanchi\", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-22\"}', 'SENT', 35604, '2023-05-20 11:36:36'),
(5, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-23\"}', 'SENT', 45791, '2023-05-20 11:43:33'),
(6, 7, '{\"to\": \"utkarsh.we2code@gmail.com\", \"otp\": 295107}', 'SENT', 58684, '2023-05-20 12:04:40'),
(7, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 601985}', 'SENT', 63295, '2023-05-20 12:04:45'),
(8, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'SENT', 75493, '2023-05-20 12:05:34'),
(9, 1, '{\"to\": \"utkarsh.we2code@gmail.com\"}', 'SENT', 81060, '2023-05-20 12:05:59'),
(10, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-23\"}', 'SENT', 97036, '2023-05-22 04:17:53'),
(11, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-23\"}', 'SENT', 104261, '2023-05-22 04:18:07'),
(12, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-27\"}', 'SENT', 119455, '2023-05-22 04:19:09'),
(13, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-28\"}', 'SENT', 129325, '2023-05-22 04:24:30'),
(14, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-29\"}', 'SENT', 132219, '2023-05-22 05:08:51'),
(15, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \"}', 'SENT', 145463, '2023-05-22 05:32:12'),
(16, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Vinod\", \"interview_date\": \"2023-05-29\"}', 'SENT', 153554, '2023-05-22 05:34:05'),
(17, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Vinod\", \"interview_date\": \"2023-05-29\"}', 'SENT', 169863, '2023-05-22 05:36:57'),
(18, 3, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Hr\", \"company_name\": \"WE2CODE\"}', 'SENT', 173780, '2023-05-22 07:31:21'),
(19, 7, '{\"to\": \"raj.we2codee@gmail.com\", \"otp\": 533420}', 'SENT', 183426, '2023-05-22 08:31:49'),
(20, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 708711}', 'SENT', 193434, '2023-05-22 08:53:11'),
(21, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'SENT', 208900, '2023-05-22 08:53:45'),
(22, 3, '{\"to\": \"raj@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"WE2CODE\"}', 'SENT', 213144, '2023-05-22 09:05:35'),
(23, 4, '{\"to\": \"raj@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"WE2CODE\"}', 'SENT', 228537, '2023-05-22 09:13:47'),
(24, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Web Developer\", \"company_name\": \"WE2CODE\", \"candidate_name\": \"Vinod\", \"interview_date\": \"2023-05-24\"}', 'SENT', 233182, '2023-05-22 09:31:55'),
(25, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"WE2CODE\", \"candidate_name\": \"Sakshi desai\", \"interview_date\": \"2023-05-25\"}', 'SENT', 246400, '2023-05-22 09:32:07'),
(26, 5, '{\"to\": \"utkarsh.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"WE2CODE\", \"candidate_name\": \"Sakshi desai\", \"interview_date\": \"2023-05-23\"}', 'SENT', 256361, '2023-05-22 09:32:12'),
(27, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Vinod\", \"interview_date\": \"2023-05-24\"}', 'SENT', 229725, '2023-05-23 06:50:40'),
(28, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"WE2CODE\", \"candidate_name\": \"Sakshi desai\", \"interview_date\": \"2023-05-25\"}', 'SENT', 279388, '2023-05-23 06:50:51'),
(29, 7, '{\"to\": \"sagar.we2code@gmail.com\", \"otp\": 315056}', 'SENT', 17981, '2023-05-23 11:28:17'),
(30, 1, '{\"to\": \"sagar.we2code@gmail.com\"}', 'SENT', 13742, '2023-05-23 11:29:48'),
(31, 7, '{\"to\": \"raj.we2code@gmail.com\", \"otp\": 847749}', 'SENT', 12968, '2023-05-25 15:26:59'),
(32, 1, '{\"to\": \"raj.we2code@gmail.com\"}', 'SENT', 19703, '2023-05-25 15:28:12'),
(33, 7, '{\"to\": \"raj.we2code@gmail.com\", \"otp\": 827916}', 'SENT', 16760, '2023-05-27 10:16:59'),
(34, 7, '{\"to\": \"raj.we2code@gmail.com\", \"otp\": 396202}', 'SENT', 13373, '2023-05-27 10:18:02'),
(35, 7, '{\"to\": \"raj.we2code@gmail.com\", \"otp\": 598030}', 'SENT', 16753, '2023-05-27 10:20:08'),
(36, 7, '{\"to\": \"g.choudhary.we2code@gmail.com\", \"otp\": 979496}', 'SENT', 19269, '2023-05-29 04:34:42'),
(37, 7, '{\"to\": \"g.choudhary.we2code@gmail.com\", \"otp\": 502123}', 'SENT', 368068, '2023-05-29 04:34:56'),
(38, 7, '{\"to\": \"g.choudhary.we2code@gmail.com\", \"otp\": 407323}', 'SENT', 17994, '2023-05-29 04:36:54'),
(39, 7, '{\"to\": \"g.choudhary.we2code@gmail.com\", \"otp\": 801475}', 'SENT', 13771, '2023-05-29 04:37:17'),
(40, 1, '{\"to\": \"g.choudhary.we2code@gmail.com\"}', 'SENT', 14654, '2023-05-29 04:38:09'),
(41, 7, '{\"to\": \"g.choudhary.we2code@gmail.com\", \"otp\": 659319}', 'SENT', 18196, '2023-05-29 04:50:11'),
(42, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 555065}', 'SENT', 13702, '2023-05-29 04:55:24'),
(43, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'SENT', 12350, '2023-05-29 04:56:42'),
(44, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"token\": \"587ea74f1e1c1b667fcfa0826f5ac338\", \"reset_link\": \"http://localhost:3000/resetpassword/user\"}', 'SENT', 13489, '2023-06-05 06:46:23'),
(45, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"token\": \"587ea74f1e1c1b667fcfa0826f5ac338\", \"reset_link\": \"http://localhost:3000/resetpassword/user\"}', 'SENT', 18867, '2023-06-05 06:49:18'),
(46, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 250763}', 'SENT', 19905, '2023-06-05 06:59:16'),
(47, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'SENT', 18886, '2023-06-05 07:03:07'),
(48, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"token\": \"587ea74f1e1c1b667fcfa0826f5ac338\", \"reset_link\": \"http://localhost:3000/resetpassword/user\"}', 'SENT', 15518, '2023-06-05 07:07:38'),
(49, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 696595}', 'SENT', 14274, '2023-06-05 07:10:12'),
(50, 7, '{\"to\": \"mayur.we2code@gmail.com\", \"otp\": 126730}', 'SENT', 11392, '2023-06-05 07:12:33'),
(51, 1, '{\"to\": \"mayur.we2code@gmail.com\"}', 'SENT', 19345, '2023-06-05 07:16:03'),
(52, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"token\": \"587ea74f1e1c1b667fcfa0826f5ac338\", \"reset_link\": \"http://localhost:3000/resetpassword/user\"}', 'SENT', 17088, '2023-06-06 04:28:47'),
(53, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"reset_link\": \"http://localhost:3000/resetpassword/user/587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 13334, '2023-06-06 04:42:01'),
(54, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"reset_link\": \"http://localhost:3000/resetpassword/user:587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 14045, '2023-06-06 04:43:15'),
(55, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"reset_link\": \"http://localhost:3000/resetpassword/user:587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 19494, '2023-06-06 08:40:43'),
(56, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"reset_link\": \"http://localhost:3000/resetpassword/user:587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 19769, '2023-06-06 08:41:34'),
(57, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"reset_link\": \"http://localhost:3000/resetpassword/user:587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 11687, '2023-06-06 08:47:35'),
(58, 6, '{\"to\": \"utkarsh.we2code@gmail.com\", \"reset_link\": \"http://localhost:3000/resetpassword/user:716435ac874e7229afdd9007f7b744e2\"}', 'SENT', 11099, '2023-06-06 08:53:53'),
(59, 7, '{\"to\": \"sagar.we2code@gmail.com\", \"otp\": 408517}', 'SENT', 18859, '2023-06-07 09:45:34'),
(60, 7, '{\"to\": \"sagar.we2code@gmail.com\", \"otp\": 806702}', 'SENT', 11992, '2023-06-07 09:50:26'),
(61, 7, '{\"to\": \"mayur.we2cpd@gmail.com\", \"otp\": 953864}', 'SENT', 19437, '2023-06-07 09:53:47'),
(62, 7, '{\"to\": \"mayur.we2code@gmail.com\", \"otp\": 771592}', 'SENT', 17465, '2023-06-07 09:56:27'),
(63, 1, '{\"to\": \"mayur.we2code@gmail.com\"}', 'SENT', 12560, '2023-06-07 09:58:37'),
(64, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 979461}', 'SENT', 11528, '2023-06-12 05:37:38'),
(65, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'SENT', 15029, '2023-06-12 05:39:29'),
(66, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 509581}', 'SENT', 14151, '2023-06-12 06:27:46'),
(67, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'PROCESSING', 19158, '2023-06-12 06:30:33'),
(68, 8, '{\"to\": \"raj.we2code@gmail.com\", \"admin_name\": \"Raj\", \"user_email\": \"aashi.we2code@gmail.com\"}', 'PROCESSING', 19158, '2023-06-12 06:30:33'),
(69, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 908457}', 'SENT', 18137, '2023-06-12 06:39:25'),
(70, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 904783}', 'SENT', 18487, '2023-06-12 06:42:57'),
(71, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 375078}', 'SENT', 17122, '2023-06-12 06:44:59'),
(72, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 198930}', 'SENT', 13174, '2023-06-12 06:47:30'),
(73, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 784267}', 'SENT', 14967, '2023-06-12 06:56:37'),
(74, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'SENT', 16338, '2023-06-12 06:57:23'),
(75, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"aashi.we2code@gmail.com\"}', 'SENT', 16338, '2023-06-12 06:57:23'),
(76, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"name\": null, \"reset_link\": \"http://localhost:3000/resetpassword/user:587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 17338, '2023-06-12 07:13:03'),
(77, 7, '{\"to\": \"aashi.we2codae@gmail.com\", \"otp\": 522048}', 'SENT', 15946, '2023-06-12 07:18:01'),
(78, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 533399}', 'SENT', 13692, '2023-06-12 07:19:04'),
(79, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'SENT', 19774, '2023-06-12 07:20:27'),
(80, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"aashi.we2code@gmail.com\"}', 'SENT', 19774, '2023-06-12 07:20:27'),
(81, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"name\": null, \"reset_link\": \"http://localhost:3000/resetpassword/user:587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 16781, '2023-06-12 08:50:52'),
(82, 3, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Driver\", \"website_url\": \"fgfdgvb.com\", \"company_name\": \"Amul \", \"job_location\": \"American Samoa\", \"job_description\": \"ythdrtyh df ghfgdf \"}', 'SENT', 13433, '2023-06-12 08:58:17'),
(83, 3, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Math\'s Teacher\", \"website_url\": \"ddd.com\", \"company_name\": \"RADISON BLUE\", \"job_location\": \"American Samoa\", \"job_description\": \" yhnjgjngghd ghfg fg\"}', 'SENT', 11152, '2023-06-12 09:08:31'),
(84, 3, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"website_url\": \"dps.com\", \"company_name\": \"Infobeans\", \"job_location\": \"Algeria\", \"job_description\": \"dtggf\"}', 'SENT', 11548, '2023-06-12 09:44:19'),
(85, 9, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Shreestha soni\", \"website_url\": \"ddd.com\", \"company_name\": \"Infobeans\", \"job_location\": \"Albania\", \"job_description\": \"tyhgjgh\"}', 'SENT', 13256, '2023-06-12 09:51:14'),
(86, 9, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"dgfh\", \"admin_name\": \"aAshi\", \"website_url\": \"ddd.comghfvh\", \"company_name\": \"Infobeans\", \"job_location\": \"Åland Islands\", \"job_description\": \"hfghfg\"}', 'SENT', 17778, '2023-06-12 09:56:52'),
(87, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\"}', 'SENT', 19138, '2023-06-12 10:10:33'),
(88, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\"}', 'SENT', 13868, '2023-06-12 10:37:05'),
(89, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Shreestha soni\", \"company_name\": \"Infobeans\"}', 'SENT', 16501, '2023-06-12 10:40:10'),
(90, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-13\"}', 'SENT', 18716, '2023-06-12 10:46:38'),
(91, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-14\"}', 'SENT', 12182, '2023-06-12 10:48:24'),
(92, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-12\"}', 'SENT', 11775, '2023-06-12 10:56:55'),
(93, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-12\"}', 'SENT', 11775, '2023-06-12 10:56:55'),
(94, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-13\"}', 'SENT', 11276, '2023-06-12 11:12:48'),
(95, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-13\"}', 'SENT', 11276, '2023-06-12 11:12:48'),
(96, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-12\"}', 'SENT', 14941, '2023-06-12 11:14:19'),
(97, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-12\"}', 'SENT', 14941, '2023-06-12 11:14:19'),
(98, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-13\"}', 'SENT', 13412, '2023-06-12 11:15:10'),
(99, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-13\"}', 'SENT', 13412, '2023-06-12 11:15:10'),
(100, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-14\"}', 'SENT', 18730, '2023-06-12 11:24:42'),
(101, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-14\"}', 'SENT', 18730, '2023-06-12 11:24:42'),
(102, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-13\"}', 'SENT', 16411, '2023-06-12 12:05:15'),
(103, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-13\"}', 'SENT', 16411, '2023-06-12 12:05:15'),
(104, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-12\"}', 'SENT', 19404, '2023-06-12 12:12:11'),
(105, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-12\"}', 'SENT', 19404, '2023-06-12 12:12:11'),
(106, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-12\"}', 'SENT', 18108, '2023-06-12 12:15:37'),
(107, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-12\"}', 'SENT', 18108, '2023-06-12 12:15:37'),
(108, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-13\"}', 'SENT', 18498, '2023-06-12 12:20:14'),
(109, 10, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-13\"}', 'SENT', 18498, '2023-06-12 12:20:14'),
(110, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-13\"}', 'SENT', 18498, '2023-06-12 12:20:14'),
(114, 12, '{\"to\": \"utkarsh.we2code@gmail.com\", \"lmia_status\": \"Complete\", \"company_name\": \"WE2CODE\", \"employee_name\": \"Rajaram\"}', 'SENT', 15632, '2023-06-13 09:37:36'),
(115, 12, '{\"to\": \"utkarsh.we2code@gmail.com\", \"lmia_status\": \"Reject\", \"company_name\": \"WE2CODE\", \"employee_name\": \"Rajaram\"}', 'SENT', 11071, '2023-06-13 09:39:28'),
(116, 12, '{\"to\": \"utkarsh.we2code@gmail.com\", \"lmia_status\": \"Complete\", \"company_name\": \"WE2CODE\", \"employee_name\": \"Rajaram\"}', 'SENT', 11998, '2023-06-13 09:41:57'),
(117, 6, '{\"to\": \"aashi.we2code@gmail.com\", \"name\": \"Annu\", \"reset_link\": \"http://localhost:3000/resetpassword/user:587ea74f1e1c1b667fcfa0826f5ac338\"}', 'SENT', 13811, '2023-06-20 07:15:16'),
(118, 7, '{\"to\": \"raj.we2code@gmail.com\", \"otp\": 502048}', 'SENT', 15343, '2023-06-20 07:17:31'),
(119, 7, '{\"to\": \"chetan.barod.we2code@gmail.com\", \"otp\": 877988}', 'SENT', 11713, '2023-06-20 07:21:21'),
(120, 1, '{\"to\": \"chetan.barod.we2code@gmail.com\"}', 'SENT', 17394, '2023-06-20 07:22:35'),
(121, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"chetan.barod.we2code@gmail.com\"}', 'SENT', 17394, '2023-06-20 07:22:35'),
(122, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"dgfh\", \"company_name\": \"Infobeans\"}', 'SENT', 1216501, '2023-06-20 07:22:48'),
(123, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\"}', 'SENT', 16684, '2023-06-20 07:31:26'),
(124, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\"}', 'SENT', 1233839, '2023-06-20 07:31:35'),
(125, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\"}', 'SENT', 1244045, '2023-06-20 07:31:37'),
(127, 1, '{\"to\": \"chetan.barod.we2code@gmail.com\"}', 'SENT', 12317, '2023-06-20 07:35:09'),
(126, 7, '{\"to\": \"chetan.barod.we2code@gmail.com\", \"otp\": 947156}', 'SENT', 1237612, '2023-06-20 07:33:06'),
(128, 8, '{\"to\": \"aashi.we2code@gmail.com\", \"admin_name\": \"Aashi\", \"user_email\": \"chetan.barod.we2code@gmail.com\"}', 'SENT', 12317, '2023-06-20 07:35:09'),
(129, 9, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"admin_name\": \"aAshi\", \"website_url\": \"fgfdgvb.com\", \"company_name\": null, \"job_location\": \"India\", \"job_description\": \" the job profile requires four years of experience, your headline can be “4+ years experienced React. js developer.” On the other hand, if you want to highlight your certifications or particular skill in your headline you can use “Redux Certified React\"}', 'SENT', 18207, '2023-06-20 07:36:34'),
(130, 12, '{\"to\": \"aashi.we2code@gmail.com\", \"lmia_status\": \"Reject\", \"company_name\": \"Infobeans\", \"employee_name\": \"Chetan Barod\"}', 'SENT', 17589, '2023-06-20 08:37:14'),
(131, 10, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Shreestha soni\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Chetan Barod\", \"interview_date\": \"2023-06-21\"}', 'SENT', 18242, '2023-06-20 09:21:12'),
(132, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Shreestha soni\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Chetan Barod\", \"interview_date\": \"2023-06-21\"}', 'SENT', 18242, '2023-06-20 09:21:12'),
(133, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Shop worker\", \"company_name\": \"Sention\", \"candidate_name\": \"Warren\", \"interview_date\": \"2023-06-20\"}', 'SENT', 15434, '2023-06-20 09:25:20'),
(134, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Shop worker\", \"company_name\": \"Sention\", \"candidate_name\": \"Warren\", \"interview_date\": \"2023-06-20\"}', 'SENT', 11751, '2023-06-20 10:07:41'),
(135, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Shop worker\", \"company_name\": \"Sention\", \"candidate_name\": \"Warren\", \"interview_date\": \"2023-06-20\"}', 'SENT', 16618, '2023-06-20 10:10:20'),
(136, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Shop worker\", \"company_name\": \"Sention\", \"candidate_name\": \"Warren\", \"interview_date\": \"2023-06-20\"}', 'SENT', 1353555, '2023-06-20 10:10:28'),
(137, 5, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-12\"}', 'SENT', 15518, '2023-06-20 10:26:18'),
(138, 10, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-12\"}', 'SENT', 15518, '2023-06-20 10:26:18'),
(139, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\", \"candidate_name\": \"Annu\", \"interview_date\": \"2023-06-12\"}', 'SENT', 15518, '2023-06-20 10:26:18'),
(140, 7, '{\"to\": \"utkarsh.we2code@gmail.com\", \"otp\": 751741}', 'SENT', 12518, '2023-06-30 06:43:24'),
(141, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Mayur industries \"}', 'SENT', 12726, '2023-06-30 10:12:50'),
(142, 4, '{\"to\": \"utkarsh.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"WE2CODE\"}', 'SENT', 1417280, '2023-06-30 10:12:56'),
(143, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"WE2CODE\"}', 'SENT', 1417280, '2023-06-30 10:12:56'),
(144, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Raju\", \"company_name\": \"Sention\"}', 'SENT', 18176, '2023-07-03 12:13:36'),
(145, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\"}', 'SENT', 13991, '2023-07-04 04:24:38'),
(146, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Shop worker\", \"company_name\": \"Sention\"}', 'PROCESSING', 14127, '2023-07-22 07:11:20'),
(147, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"dgfh\", \"company_name\": \"Infobeans\"}', 'PROCESSING', 16611, '2023-07-22 07:12:24'),
(148, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"dgfh\", \"company_name\": \"Infobeans\"}', 'PROCESSING', 16611, '2023-07-22 07:12:24'),
(149, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"manager\", \"company_name\": \"Sanchi\"}', 'PROCESSING', 1488130, '2023-07-22 07:12:40'),
(150, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Driver\", \"company_name\": \"Amul \"}', 'PROCESSING', 12653, '2023-07-22 17:24:28'),
(151, 10, '{\"to\": \"utkarsh.we2code@gmail.com\", \"job_title\": \"Web Developer\", \"company_name\": \"WE2CODE\", \"candidate_name\": \"Chetan Barod\", \"interview_date\": \"2023-07-25\"}', 'PROCESSING', 18367, '2023-07-24 11:08:42'),
(152, 11, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"Web Developer\", \"company_name\": \"WE2CODE\", \"candidate_name\": \"Chetan Barod\", \"interview_date\": \"2023-07-25\"}', 'PROCESSING', 18367, '2023-07-24 11:08:42'),
(153, 4, '{\"to\": \"utkarsh.we2code@gmail.com\", \"job_title\": \"Hr\", \"company_name\": \"WE2CODE\"}', 'PROCESSING', 18454, '2023-07-24 12:18:30'),
(154, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Hr\", \"company_name\": \"WE2CODE\"}', 'PROCESSING', 18454, '2023-07-24 12:18:30'),
(155, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Driver\", \"company_name\": \"Sanchi\"}', 'PROCESSING', 16951, '2023-07-24 12:49:36'),
(156, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"manager\", \"company_name\": \"Sanchi\"}', 'PROCESSING', 19991, '2023-07-24 13:17:00'),
(157, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"ytujtygjmyj\", \"company_name\": \"Sention\"}', 'PROCESSING', 17743, '2023-07-24 13:17:02'),
(158, 4, '{\"to\": \"aashi.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\"}', 'PROCESSING', 1571773, '2023-07-24 13:17:19'),
(159, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"React js developer\", \"company_name\": \"Infobeans\"}', 'PROCESSING', 1571773, '2023-07-24 13:17:19'),
(160, 7, '{\"to\": \"g.choudhary.we2wcode@gmail.com\", \"otp\": 424971}', 'PROCESSING', 17610, '2023-07-26 04:29:15');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`id`, `email_type`, `subject`, `message`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'employee_signup', 'Registration successfully', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            Congratulations!\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                            <p>Congratulations! We are excited to inform you that your account registration on Canjobs\n                                was\n                                successful.\n                                Welcome to our community!\n                            </p>\n                            <p>\n                                We encourage you to take full advantage of the resources and opportunities available to\n                                you on Canjobs.\n                                If you have any questions, require assistance, or would like guidance on navigating our\n                                platform, please\n                                don\'t hesitate to contact our support team at <b>[Organization Email Address]</b>. We are here to help you\n                                make the most of\n                                your membership.\n                            </p>\n\n                        </div>\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i>\n                      Please take the necessary steps to ensure that the user\'s\n                      account is set up correctly and that they have the appropriate\n                      permissions for their role. If you have any questions or\n                      require any additional information, please don\'t hesitate to\n                      reach out to me. <b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                                <tr>\n                                    <td> © 2023 Canjobs </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>', 1, '2023-05-15 08:39:52', '2023-06-12 07:26:44'),
(2, 'company_sign_up', 'a new company registered', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n  <meta charset=\"UTF-8\">\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <title>Email Template</title>\n</head>\n\n<body>\n  <div\n    style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n    <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n      Congratulations!\n    </div>\n    <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n      style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n      <tbody>\n        <tr>\n          <td>\n            <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n              style=\"min-width:100%;background: transparent;\">\n              <tbody>\n                <tr>\n                  <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                    <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                      <img alt=\"Canjobs\" src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                        style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\" data-bit=\"iit\"\n                        width=\"200\" height=\"auto\"> </a>\n                  </td>\n                </tr>\n              </tbody>\n            </table>\n          </td>\n        </tr>\n        <tr>\n          <td\n            style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n            <div style=\"color: black;font-size:medium;\">\n              <p>Congratulations! We are excited to inform you that your account registration on Canjobs was successful.  Welcome to our community!\n              </p>\n              <p>\n                We encourage you to take full advantage of the resources and opportunities available to you on Canjobs. If you have any questions, require assistance, or would like guidance on navigating our  platform, please  don\'t hesitate to contact our support team at <b>[Organization Email Address]</b>. We are here to help you make the most of your membership.  </p>\n  </div>\n          </td>\n        </tr>\n        <tr>\n          <td style=\"background-color:#f3f2f0;padding:24px\">\n            <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n            <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n              style=\"font-size:16px;text-align: center;\">\n              <tbody>\n                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i>\n                      Please take the necessary steps to ensure that the user\'s\n                      account is set up correctly and that they have the appropriate\n                      permissions for their role. If you have any questions or\n                      require any additional information, please don\'t hesitate to\n                      reach out to me. <b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                <tr>\n                  <td> © 2023 Canjobs </td>\n                </tr>\n              </tbody>\n            </table>\n          </td>\n        </tr>\n      </tbody>\n    </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n      data-bit=\"iit\">\n    <font color=\"#888888\"> </font>\n  </div>\n</body>\n\n</html>', 1, '2023-05-15 08:43:30', '2023-06-12 07:29:50'),
(3, 'add_job_company', 'job posted successfully', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            job alerts !\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                            <p>Dear <b>{postjob_company_name}</b>,</p>\n                            <p>\n                                <br>\n                                We hope this message finds you well. We would like to inform you that a new job has been created on our platform. The details of the job are as follows::\n                                <br>\n                                <br>\n                                Job Title: <b>{postjob_job_title}</b>\n                                <br>\n                                Company: <b>{postjob_company_name}</b>\n                                <br>\n                                Location: <b>{job_location}</b>\n                                <br>\n                                Job Description:\n                                <b>{job_description}</b>\n                                <br><br>\n                                We believe this opportunity could be a great fit for your organization, and we encourage you to review the job posting and consider recommending suitable candidates. Interested individuals can apply directly through our platform or follow the instructions provided in the job posting.\n                            </p>\n                        </div>\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                                <tr>\n                                    <td> © 2023 Canjobs </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>', 1, '2023-05-15 08:46:49', '2023-06-13 09:10:10'),
(4, 'apply_on_job', 'job applied successfully', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            Congratulations!\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                            <p>Dear <b>{applyjob_company_name} Hiring Team</b>,</p>\n                            <p>\n\nA new application has been received for the <b>{applyjob_title}</b> position. Please review and consider the candidate accordingly. Kindly acknowledge the receipt of the application and communicate next steps to the applicant.\n                            </p>\n\n                        </div>\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n<tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                                <tr>\n                                    <td> © 2023 Canjobs </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>', 1, '2023-05-15 08:47:34', '2023-06-12 10:39:28'),
(5, 'interview_schedule_employee', 'new interview scheduled', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            job alerts !\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                           <p>Dear <b>{interview_schedule_name}</b>,</p>\n                            <p>\n                                <br>\n                                We are confirming your scheduled interview for the position of <b>{interview_schedule_job_title} </b>at <b>{interview_schedule_company_name}</b>.\n\n                                <br>\n                                <br>\n\n                                Date: <b>{interview_schedule_interview_date}</b>\n                                <br>\n                                Please arrive on time and come prepared for the interview. If you have any questions or need to reschedule, please let us know.\n                                <br>  <br>\n                                Looking forward to meeting you.\n                            </p>\n                        </div>\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                                <tr>\n                                    <td> © 2023 Canjobs </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>', 1, '2023-05-15 08:48:39', '2023-06-13 09:14:44');
INSERT INTO `email_template` (`id`, `email_type`, `subject`, `message`, `is_active`, `created_at`, `updated_at`) VALUES
(6, 'forget_password', 'reset password', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            Congratulations!\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                            <p>Dear <b>{name}</b>,</p>\n                            <p>\n                             We have received a request to reset your password for your account at Canjobs. To set a new password, please click on the following link: <b>{reset_link}</b>\n                                </p>\n                                </div>\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i>If you did not initiate this request, please disregard this email and ensure the security of your account. If you have any concerns or need assistance, please contact our support team at <b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"font-size: x-small;\"> © 2023 Canjobs </td>\n                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>', 1, '2023-05-15 09:53:18', '2023-06-12 09:10:51'),
(7, 'otp_signup', 'one time password', '<!DOCTYPE html>\n<html lang=\"en\">\n\n  <head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n  </head>\n\n  <body>\n    <div\n      style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n      <div\n        style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n        Congratulations!\n      </div>\n      <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n        cellpadding=\"0\" width=\"512\" align=\"center\"\n        style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n        <tbody>\n          <tr>\n            <td>\n              <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n                cellpadding=\"0\" width=\"100%\"\n                style=\"min-width:100%;background: transparent;\">\n                <tbody>\n                  <tr>\n                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                      <a href style=\"display:inline-block;text-decoration:none;\"\n                        target=\"_blank\">\n                        <img alt=\"Canjobs\"\n                          src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                          style=\"outline:none;text-decoration:none;display:block\"\n                          class=\"CToWUd\"\n                          data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                    </td>\n                  </tr>\n                </tbody>\n              </table>\n            </td>\n          </tr>\n          <tr>\n            <td\n              style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n              <div style=\"color: black;font-size:medium;\">\n                <p>Account Verification OTP\n                </p>\n                <p>\n                  Please use the following One-Time Password (OTP) to verify\n                  your account at Canjobs: <b>{otp}</b>.\n                </div>\n              </td>\n            </tr>\n            <tr>\n              <td style=\"background-color:#f3f2f0;padding:24px\">\n                <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                <table role=\"presentation\" valign=\"top\" border=\"0\"\n                  cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                  style=\"font-size:16px;text-align: center;\">\n                  <tbody>\n                    <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                    <tr>\n                      <td\n                        style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                        <i>If you did not request this OTP or need\n                          assistance,\n                          please contact our support team at <b>[Organisation\n                            Email Address]</b>.\n                        </i>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td> © 2023 Canjobs </td>\n                    </tr>\n                  </tbody>\n                </table>\n              </td>\n            </tr>\n          </tbody>\n        </table> <img alt role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\"\n          height=\"1\" class=\"CToWUd\"\n          data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n      </div>\n    </body>\n\n  </html>', 1, '2023-05-15 09:54:33', '2023-06-12 07:32:30'),
(8, 'new_user_registered', 'New User registered ', '<!DOCTYPE html>\n<html lang=\"en\">\n\n  <head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n  </head>\n\n  <body>\n    <div\n      style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n      <div\n        style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n        Congratulations!\n      </div>\n      <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n        cellpadding=\"0\" width=\"512\" align=\"center\"\n        style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n        <tbody>\n          <tr>\n            <td>\n              <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n                cellpadding=\"0\" width=\"100%\"\n                style=\"min-width:100%;background: transparent;\">\n                <tbody>\n                  <tr>\n                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                      <a href style=\"display:inline-block;text-decoration:none;\"\n                        target=\"_blank\">\n                        <img alt=\"Canjobs\"\n                          src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                          style=\"outline:none;text-decoration:none;display:block\"\n                          class=\"CToWUd\"\n                          data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                    </td>\n                  </tr>\n                </tbody>\n              </table>\n            </td>\n          </tr>\n          <tr>\n            <td\n              style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n              <div style=\"color: black;font-size:medium;\">\n                <p>Dear <b>{admin_name}</b>,</p>\n                <p>I hope this message finds you well. I wanted to inform you\n                  that a new user has been registered on our platform. Below are\n                  the details of the newly created user:\n                </p>\n                <p>\n                  Email Address: <b>{user_email_address}</b>\n                </p>\n                </div>\n            </td>\n          </tr>\n          <tr>\n            <td style=\"background-color:#f3f2f0;padding:24px\">\n              <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n              <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\"\n                cellpadding=\"0\" width=\"100%\"\n                style=\"font-size:16px;text-align: center;\">\n                <tbody>\n                  <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i> Please take the necessary steps to ensure that the user\'s\n                  account is set up correctly and that they have the appropriate\n                  permissions for their role. If you have any questions or\n                  require any additional information, please don\'t hesitate to\n                  reach out to me <b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                  <tr>\n                    <td> © 2023 Canjobs </td>\n                  </tr>\n                </tbody>\n              </table>\n            </td>\n          </tr>\n        </tbody>\n      </table> <img alt role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\"\n        height=\"1\" class=\"CToWUd\"\n        data-bit=\"iit\">\n      <font color=\"#888888\"> </font>\n    </div>\n  </body>\n\n</html>', 1, '2023-05-15 12:13:56', '2023-06-12 07:24:12'),
(9, 'add_job_admin', 'new job posted ', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Email Template</title>\r\n</head>\r\n\r\n<body>\r\n    <div\r\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\r\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\r\n            job alerts !\r\n        </div>\r\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\r\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\r\n            <tbody>\r\n                <tr>\r\n                    <td>\r\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\r\n                            style=\"min-width:100%;background: transparent;\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\r\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\r\n                                            <img alt=\"Canjobs\"\r\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\r\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\r\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\r\n                                    </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td\r\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\r\n                        <div style=\"color: black;font-size:medium;\">\r\n                            <p>Dear <b>{name}</b>,</p>\r\n                            <p>\r\n                                <br>\r\n                                A new job has been created by <b>{postjob_company_name}</b>. Please review the details and take the necessary actions:\r\n                                <br>\r\n                                <br>\r\n                                Job Title: <b>{postjob_job_title}</b>\r\n                                <br>\r\n                                Company: <b>{postjob_company_name}</b>\r\n                                <br>\r\n                                Location: <b>{job_location}</b>\r\n                                <br>\r\n                                <br>\r\n\r\n                                Job Description:\r\n                                <b>{job_description}</b>\r\n                                <br>\r\n                                Please post the job, notify the relevant hiring team, and set up any required accounts.\r\n                            </p>\r\n                        </div>\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\r\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\r\n              <tbody>\r\n                <tr>\r\n                  <td style=\"padding-bottom:16px;text-align:center\">\r\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"text-align:center\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img alt=\"Download on the App Store\"\r\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\r\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\r\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img alt=\"Get it on Google Play\"\r\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\r\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\r\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\r\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\r\n                  </td>\r\n                </tr>\r\n              </tbody>\r\n            </table> -->\r\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\r\n                            style=\"font-size:16px;text-align: center;\">\r\n                            <tbody>\r\n                                <!-- <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\r\n                    Designer, PHP) </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\r\n                      why we included this.</a> </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\r\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\r\n                      target=\"_blank\">Help</a>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img src=\"\" alt=\"LinkedIn\"\r\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\r\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\r\n                </tr> -->\r\n                <tr>\r\n                  <td\r\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\r\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\r\n                    </i>\r\n                  </td>\r\n                </tr>\r\n                                <tr>\r\n                                    <td> © 2023 Canjobs </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </td>\r\n                </tr>\r\n            </tbody>\r\n        </table> <img alt=\"\" role=\"presentation\" src=\"\r\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\r\n            data-bit=\"iit\">\r\n        <font color=\"#888888\"> </font>\r\n    </div>\r\n</body>\r\n\r\n</html>', 1, '2023-05-15 12:15:13', '2023-06-12 09:55:27'),
(10, 'interview_schedule_employer', 'interview confirmation', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            job alerts !\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                           <p>Dear <b>{interview_schedule_company_name}</b>,</p>\n                            <p>\n                                <br>\n                                Confirming the scheduled interview for the position  of <b>{interview_schedule_job_title} </b>at <b>{interview_schedule_company_name}</b>.                              <br>\n                                <br>\n                                Date: <b>{interview_schedule_interview_date}</b>\n                                <br>\n                                Please ensure your representative arrives on time and is prepared. Let us know if there are any changes or questions. \n                            </p>\n                        </div>\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                                <tr>\n                                    <td> © 2023 Canjobs </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>', 1, '2023-06-12 11:21:08', '2023-06-12 12:11:55'),
(11, 'interview_schedule_admin', 'interview confirmation', '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Email Template</title>\n</head>\n\n<body>\n    <div\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\n            job alerts !\n        </div>\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\n            <tbody>\n                <tr>\n                    <td>\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"min-width:100%;background: transparent;\">\n                            <tbody>\n                                <tr>\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\n                                            <img alt=\"Canjobs\"\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\n                                    </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n                <tr>\n                    <td\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\n                        <div style=\"color: black;font-size:medium;\">\n                           <p>Dear <b>{admin_name}</b>,</p>\n                            <p>\n                                <br>\n                                Confirming the scheduled interview for the position  of <b>{interview_schedule_job_title}</b>at <b>{interview_schedule_company_name}</b>.                              <br>\n                                <br>\n                                Date: <b>{interview_schedule_interview_date}</b>\n                                <br>\n                                Please make necessary arrangements for the interview. Let us know if there are any changes or questions.\n                            </p>\n                        </div>\n                    </td>.                   \n                  \n                </tr>\n                <tr>\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n              <tbody>\n                <tr>\n                  <td style=\"padding-bottom:16px;text-align:center\">\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"text-align:center\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Download on the App Store\"\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img alt=\"Get it on Google Play\"\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\n                  </td>\n                </tr>\n              </tbody>\n            </table> -->\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\n                            style=\"font-size:16px;text-align: center;\">\n                            <tbody>\n                                <!-- <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\n                    Designer, PHP) </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\n                      why we included this.</a> </td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\n                </tr>\n                <tr>\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\n                      target=\"_blank\">Help</a>\n                  </td>\n                </tr>\n                <tr>\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\n                      <img src=\"\" alt=\"LinkedIn\"\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\n                </tr> -->\n                <tr>\n                  <td\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\n                    </i>\n                  </td>\n                </tr>\n                                <tr>\n                                    <td> © 2023 Canjobs </td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </td>\n                </tr>\n            </tbody>\n        </table> <img alt=\"\" role=\"presentation\" src=\"\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\n            data-bit=\"iit\">\n        <font color=\"#888888\"> </font>\n    </div>\n</body>\n\n</html>\n', 1, '2023-06-12 11:23:45', '2023-06-12 12:14:41');
INSERT INTO `email_template` (`id`, `email_type`, `subject`, `message`, `is_active`, `created_at`, `updated_at`) VALUES
(12, 'lmia_status_update', 'lmia status updated', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Email Template</title>\r\n</head>\r\n\r\n<body>\r\n    <div\r\n        style=\"margin:0px;width:100%;background-color:#f3f2f0;padding:0px;padding-top:8px;font-family:-apple-system,system-ui,BlinkMacSystemFont,\'Segoe UI\',Roboto,\'Helvetica Neue\',\'Fira Sans\',Ubuntu,Oxygen,\'Oxygen Sans\',Cantarell,\'Droid Sans\',\'Apple Color Emoji\',\'Segoe UI Emoji\',\'Segoe UI Emoji\',\'Segoe UI Symbol\',\'Lucida Grande\',Helvetica,Arial,sans-serif\">\r\n        <div style=\"height:0px;max-height:0;width:0px;overflow:hidden;opacity:0;padding: 20px;\">\r\n            LIMIA Status\r\n        </div>\r\n        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"512\" align=\"center\"\r\n            style=\"margin-left:auto;margin-right:auto;margin-top:0px;margin-bottom:0px;width:512px;max-width:512px;padding:0px\">\r\n            <tbody>\r\n                <tr>\r\n                    <td>\r\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\r\n                            style=\"min-width:100%;background: transparent;\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td align=\"left\" valign=\"middle\" style=\"padding: 5px 0;\">\r\n                                        <a href=\"\" style=\"display:inline-block;text-decoration:none;\" target=\"_blank\">\r\n                                            <img alt=\"Canjobs\"\r\n                                                src=\"https://apnaorganicstore.in/canjobs/filterList/logo-main-black11.png\"\r\n                                                style=\"outline:none;text-decoration:none;display:block\" class=\"CToWUd\"\r\n                                                data-bit=\"iit\" width=\"200\" height=\"auto\"> </a>\r\n                                    </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td\r\n                        style=\"padding-left:24px;padding-right:24px;padding-bottom:24px;background-color: white; border-radius: 5px;\">\r\n                        <div style=\"color: black;font-size:medium;\">\r\n                            <p>Dear <b>{company_name}</b>,</p>\r\n                            <p>\r\n                                <br>\r\n                             Your Applicant\'s <b>{employee_name}</b> LIMA status has been Succesfully changed to <b>{lmia_status}</b>\r\n                                <br>\r\n              \r\n                            </p>\r\n                        </div>\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td style=\"background-color:#f3f2f0;padding:24px\">\r\n                        <!-- <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\r\n              <tbody>\r\n                <tr>\r\n                  <td style=\"padding-bottom:16px;text-align:center\">\r\n                    <h2 style=\"margin:0;font-weight:500;font-size:20px\">Never miss an update with the app</h2>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"text-align:center\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img alt=\"Download on the App Store\"\r\n                        src=\"https://ci6.googleusercontent.com/proxy/HrtBTHlFE3VpRkzLfRwnYbJjCLtCpmKOIV__qk9k9mj7e7PSZF2X0L7mzR63nCIfqbnUujbn-dhiq-LwYUqdcpSLg_ItRhdEQJ0wP438309hcA=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/76yzkd0h5kiv27lrd4yaenylk\"\r\n                        style=\"outline:none;text-decoration:none;height:40px;width:120px;padding-right:8px\" width=\"120\"\r\n                        height=\"40\" class=\"CToWUd\" data-bit=\"iit\"> </a><a\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img alt=\"Get it on Google Play\"\r\n                        src=\"https://ci4.googleusercontent.com/proxy/HO9_iWlKcrB0dwBjkxwmI_XENGKaxTdCz3hYTg8EEfaANhsLV5O5f61PZoWBJ67aU2WPYH0Fi62BGEAYtInwMztgR5OV0aDg3es9eJDYUrhOVw=s0-d-e1-ft#https://static.licdn.com/aero-v1/sc/h/142qudwblp58zwmc9vkqfplug\"\r\n                        style=\"outline:none;text-decoration:none;height:40px;width:134px\" width=\"134\" height=\"40\"\r\n                        class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"padding-top:16px;padding-bottom:16px\">\r\n                    <hr style=\"height:1px;border-style:none;background-color:#e0dfdd\">\r\n                  </td>\r\n                </tr>\r\n              </tbody>\r\n            </table> -->\r\n                        <table role=\"presentation\" valign=\"top\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"\r\n                            style=\"font-size:16px;text-align: center;\">\r\n                            <tbody>\r\n                                <!-- <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> This email was intended for Rajaram Patidar (React, Web\r\n                    Designer, PHP) </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Learn\r\n                      why we included this.</a> </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\">You are receiving notification emails.</td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"margin:0px;padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">Unsubscribe</a>\r\n                    &nbsp;&nbsp;·&nbsp;&nbsp; <a href=\"\" style=\"color:#0a66c2;display:inline-block;text-decoration:none\"\r\n                      target=\"_blank\">Help</a>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"padding-bottom:8px\"> <a href=\"\"\r\n                      style=\"color:#0a66c2;display:inline-block;text-decoration:none\" target=\"_blank\">\r\n                      <img src=\"\" alt=\"LinkedIn\"\r\n                        style=\"outline:none;text-decoration:none;display:block;height:14px;width:56px\" width=\"56\"\r\n                        height=\"14\" class=\"CToWUd\" data-bit=\"iit\"> </a> </td>\r\n                </tr> -->\r\n                <tr>\r\n                  <td\r\n                    style=\"margin:0px;padding-bottom:8px;font-size:x-small;\">\r\n                    <i> If you have any questions or require any further information, please do not hesitate to reach out to us. We are here to assist you throughout the hiring process.<b>[Organization Email Address]</b>.\r\n                    </i>\r\n                  </td>\r\n                </tr>\r\n                                <tr>\r\n                                    <td> © 2023 Canjobs </td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                    </td>\r\n                </tr>\r\n            </tbody>\r\n        </table> <img alt=\"\" role=\"presentation\" src=\"\r\n      style=\" outline:none;text-decoration:none;width:1px;height:1px\" width=\"1\" height=\"1\" class=\"CToWUd\"\r\n            data-bit=\"iit\">\r\n        <font color=\"#888888\"> </font>\r\n    </div>\r\n</body>\r\n\r\n</html>', 1, '2023-06-13 09:31:12', '2023-06-13 09:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(101) NOT NULL,
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
  `status` text NOT NULL,
  `message` text NOT NULL,
  `is_posted` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `posted_company_id` int(51) NOT NULL,
  `date_of_posting` date NOT NULL,
  `designation``` varchar(251) NOT NULL,
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

INSERT INTO `employee` (`employee_id`, `name`, `email`, `password`, `contact_no`, `description`, `date_of_birth`, `gender`, `marital_status`, `nationality`, `current_location`, `currently_located_country`, `language`, `religion`, `interested_in`, `experience`, `work_permit_canada`, `work_permit_other_country`, `status`, `message`, `is_posted`, `is_featured`, `posted_company_id`, `date_of_posting`, `designation``, `resume`, `profile_photo`, `created_at`, `created_by_admin`, `updated_at`, `is_deleted`, `token`, `google`, `facebook`, `linkedin`) VALUES
(1, 'Shayam mohan', 'shayam.@gmail.com', '', 9517862430, 'Add the professional experience section to your scholarship resume. This is where your work and internship experience should go. No professional experience? Focus on your volunteering work, part-time gigs, side jobs, or community service.', '2000-05-02', 'male', 'single', 'indian', 'india', 'India', 'Hindi', NULL, 'swap', '1-3 ', 'no', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1684581729.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1684581729.jpeg', '2023-05-20 11:17:48', 1, '2023-05-20 11:22:09', 0, '', '', '', ''),
(2, 'UV', 'utkarsh.we2code@gmail.com', '836bb04de698e84f5229dee6d9b9c9ec', 9165100000, 'This is sunny day today.', '1883-11-05', 'male', 'single', 'Canadian', 'Alaska', 'USA', 'English', NULL, 'swap', '7+ ', 'yes', NULL, '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1684756863.pdf', NULL, '2023-05-20 12:05:59', 0, '2023-06-06 08:53:53', 0, '716435ac874e7229afdd9007f7b744e2', '', '', ''),
(3, 'Vinod', 'vinod@test.com', '', 1234567890, 'Testing ', '2023-05-01', 'male', 'single', 'indian', 'Indore', 'india', 'Hindi', NULL, 'swap', '5-7 ', 'no', 'Yes', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1684731163.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1684731163.jpeg', '2023-05-22 04:28:36', 1, '2023-05-22 04:52:43', 0, '', '', '', ''),
(4, 'Roshni sharma', 'aashi.we2code@gmail.com', 'cb3defedb4e15498b0b27082c8e59dcd', 9632587410, 'A highly motivated and results-driven professional seeking a challenging position in developing. Offering 1 years of experience in react js with a strong focus on frontend Committed to achieving excellence, exceeding goals, and driving organizational success.', '2001-05-02', 'female', 'single', 'indian', 'india', 'India', 'English', NULL, 'swap', '0-1 ', 'no', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1684822166.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1684822121.jpeg', '2023-05-22 08:53:45', 0, '2023-06-03 10:05:20', 1, '', '107979113144063469587', '111284241984986', ''),
(5, 'Sakshi desai', 'sakshi@gmail.com', '', 9630258741, 'Receptionists may greet visitors, handle incoming and outgoing correspondence, maintain files and records, perform data entry, maintain office calendars and schedules, keep the office clean, safe and organized and keep office supply inventory fully stocked', '2000-05-01', 'female', 'single', 'indian', 'india', 'India', 'English', NULL, 'swap', '1-3 ', 'yes', 'yes', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1684756398.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1684746465.jpeg', '2023-05-22 09:07:45', 3, '2023-05-22 11:53:18', 0, '', '', '', ''),
(7, 'Nakul mehta', 'Nakul@gmail.com', '', 9898989898, 'A typical Professional Actor resume describes responsibilities such as rehearsing, performing character research, wearing costumes and makeup, doing voice-overs for commercials, and performing in front of a camera or of a live audience.', '1995-02-17', 'male', 'married', 'indian', 'india', 'India', 'English', NULL, 'swap', '7+ ', 'yes', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1685168056.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1685168056.jpeg', '2023-05-24 06:22:56', 3, '2023-05-27 06:14:16', 0, '', '', '', ''),
(8, 'Rajaram', 'raj.we2code@gmail.com', '1537c1dea8479ff52bc68336e323385f', 5656575668, 'testing', '2023-05-10', 'male', 'married', 'indian', 'Indore', 'Spain', 'Hindi', NULL, 'swap', '1-3 ', 'yes', 'no', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1685034210.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1685028652.jpeg', '2023-05-25 15:28:12', 0, '2023-07-22 18:57:37', 0, '', '103776226635607600492', '', ''),
(9, 'Gourav choudary', 'g.choudhary.we2code@gmail.com', '', 4544444444, 'fghfgh', '2023-05-10', 'male', 'single', 'indian', 'india', 'India', 'Bashkir', NULL, 'parttime', '0-1 ', 'no', NULL, '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1685089430.pdf', NULL, '2023-05-26 08:23:50', 1, '2023-05-26 08:23:50', 1, '', '', '', ''),
(10, 'Gourav choudary', 'g.choudhary.we2code@gmail.com', '', 7777777888, '77uyihk', '2023-05-10', 'female', 'single', 'indian', 'india', 'India', 'Bashkir', NULL, 'parttime', 'Fresher', 'yes', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1685089458.pdf', NULL, '2023-05-26 08:24:18', 1, '2023-05-26 08:24:18', 1, '', '', '', ''),
(11, 'Gowdsawurav choudary', 'g.choaudhary.we2code@gmail.com', '', 21457896300, 'scdxzdsfcdzfc', '2023-05-12', 'male', 'single', 'indian', 'india', 'India', 'Basque', NULL, 'swap', '0-1 ', 'no', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1685089626.pdf', NULL, '2023-05-26 08:27:06', 1, '2023-05-26 08:27:06', 1, '', '', '', ''),
(12, NULL, 'g.choudhary.we2code@gmail.com', '1409db4b6d1ec9f083528315c9bb4560', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0, 0, 0, '0000-00-00', '', NULL, NULL, '2023-05-29 04:38:09', 0, '2023-05-29 04:38:09', 0, '', '', '', ''),
(14, 'Aashi vyas', 'aashivyas2001@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0, 0, 0, '0000-00-00', '', NULL, 'https://lh3.googleusercontent.com/a/AAcHTtdBR6zly-joPz9RVhKMyt21sy1HveO5PXJISTHe=s96-c', '2023-06-03 05:57:17', 0, '2023-06-03 05:57:17', 1, '', 'Google', '', ''),
(15, 'Aashi vyas', 'aashivyas2001@gmail.com', '', 6266922374, '\nReact. js developers design and implement user interface components for JavaScript-based web and mobile applications using the React open-source library ecosystem. These skilled front-end developers are involved in all stages of interface component design, from conception through to final testing.', '2001-10-07', 'female', 'single', 'indian', 'india', 'India', 'English', 'hindu', 'all', '1-3 ', 'no', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1690258781.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1685944301.jpeg', '2023-06-03 05:58:57', 0, '2023-07-25 04:19:41', 0, '', '103153431810961540185', '', ''),
(18, 'Deepali Rai', 'aashi.we2code@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0, 0, 0, '0000-00-00', '', NULL, 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=111284241984986&height=50&width=50&ext=1688367326&hash=AeQ14XjM4iX9D0TSeZw', '2023-06-03 06:55:25', 0, '2023-06-03 07:26:32', 1, '', '107979113144063469587', '111284241984986', ''),
(19, NULL, 'Google', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0, 0, 0, '0000-00-00', '', NULL, NULL, '2023-06-03 07:12:22', 0, '2023-06-03 07:12:22', 1, '', '', '', ''),
(20, 'Reena solanki', 'reena@gmail.com', '', 9874563210, 'I\'m here to serve your organization with good products.', '1997-03-01', 'female', 'single', 'indian', 'india', 'India', 'English', NULL, 'swap', '1-3 ', 'no', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1685941882.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1685941882.jpeg', '2023-06-05 05:10:32', 1, '2023-06-05 05:11:22', 0, '', '', '', ''),
(21, 'Annu', 'aashi.we2code@gmail.com', 'c96948cbdaefbff6638d644f7b25b1c4', 2587410369, NULL, '2000-01-01', 'male', 'single', 'indian', 'india', 'India', 'English', NULL, 'parttime', '1-3 ', 'no', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1685947564.pdf', NULL, '2023-06-05 06:46:04', 1, '2023-06-12 07:14:59', 1, '587ea74f1e1c1b667fcfa0826f5ac338', '', '', ''),
(22, 'Annu', 'aashi.we2code@gmail.com', 'c96948cbdaefbff6638d644f7b25b1c4', 8745213690, 'hello', '1999-07-13', 'female', 'single', 'indian', 'india', 'India', 'English', NULL, 'swap', '1-3 ', 'no', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1685948833.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1685948823.jpeg', '2023-06-05 07:03:07', 0, '2023-06-12 07:14:59', 1, '587ea74f1e1c1b667fcfa0826f5ac338', '', '', ''),
(23, 'mayur Yadav', 'mayur.we2code@gmail.com', '167b5b0d9cd1650a147abb3d41dba85d', 6985742310, 'Node js developer', '1999-05-31', 'female', 'single', 'indian', 'india', 'India', 'English', NULL, 'parttime', '1-3 ', 'yes', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1686133756.pdf', NULL, '2023-06-07 09:58:37', 0, '2023-06-07 10:29:16', 0, '', '', '', ''),
(26, 'Annu', 'aashi.we2code@gmail.com', 'c96948cbdaefbff6638d644f7b25b1c4', 9632587410, 'sdfdxssd sdgvdxv  sdfv ', '2001-10-07', 'female', 'single', 'indian', 'india', NULL, 'Basque', NULL, 'swap', '0-1 ', 'yes', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1686564623.pdf', NULL, '2023-06-12 06:57:23', 0, '2023-07-04 04:36:57', 0, '587ea74f1e1c1b667fcfa0826f5ac338', '107979113144063469587', '111284241984986', ''),
(27, 'Chetan Barod', 'chetan.barod.we2code@gmail.com', 'a82880e4812a95d15aa1537b96d9ddad', 9874563210, 'Learning full-stack development will help you master a wide set of skills ranging from HTML, CSS, JavaScript, back-end languages (Python, PHP, Ruby), database storage, HTTP, REST, and NPM, along with a good set of Agile project management and soft skills.', '1993-06-07', 'male', 'married', 'indian', 'india', 'India', 'Hindi', NULL, 'swap', '3-5 ', 'yes', 'India', '', '', 0, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1688364942.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1687246149.jpeg', '2023-06-20 07:22:35', 0, '2023-07-03 06:15:42', 0, '', '', '', '');

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
(1, 1, 'Apna Sweet', 'Delivery boy', 'indore', 'Restaurants & Food Service', NULL, NULL, '2021-09-01', '2023-05-20', 1, '2023-05-20 11:21:09', '2023-05-20 11:21:09'),
(2, 5, 'Apna Sweet', 'receptionist ', 'indore', 'Hotel & Travel Accommodation', 'indore', 'good', '2020-05-22', '2023-05-22', 1, '2023-05-22 09:12:50', '2023-05-22 09:13:09'),
(3, 2, 'we2code', 'php developer', 'Indore', 'Information Technology', NULL, NULL, '2023-01-05', '2023-05-22', 1, '2023-05-22 12:02:48', '2023-05-22 12:14:05'),
(4, 4, 'Tech info', 'Internship', 'indore', 'Information Technology', ' Manages the organization\'s technology infrastructure, including network systems, software development, cybersecurity, data management, and IT support services.', ' Entry-Level', '2022-05-23', '2023-01-09', NULL, '2023-05-23 06:14:09', '2023-05-23 06:22:22'),
(5, 7, 'Tv searial ', 'Aditya Kuma', 'mumbai', 'Media & Communication', 'television drama', 'First serial', '2012-01-31', '2015-07-08', NULL, '2023-05-24 10:05:16', '2023-05-24 10:38:25'),
(6, 7, 'Film ', 'Shekhar', 'south india', 'Media & Communication', 'Film', 'Fresher', '2006-01-05', '2007-01-05', NULL, '2023-05-24 10:38:11', '2023-05-27 10:44:29'),
(7, 8, 'Amazon', 'Manager', 'Indore', 'Manufacturing', 'Social Relationship', 'Intermediate', '2023-04-05', '2023-05-24', NULL, '2023-05-25 15:32:25', '2023-05-25 15:32:25'),
(8, 20, 'Apna Sweet', 'receptionist ', NULL, NULL, NULL, NULL, '2020-05-28', '2023-06-05', 1, '2023-06-05 05:12:54', '2023-06-05 05:12:54'),
(9, 15, 'matrimonial', 'data entry ', NULL, 'Other', 'Data entry', 'Fresher', '2020-12-08', '2021-03-31', NULL, '2023-06-05 05:29:44', '2023-06-05 05:48:50'),
(10, 15, 'Tr', 'Internship', 'indore', 'Information Technology', 'Learning', NULL, '2022-05-23', '2022-12-30', NULL, '2023-06-05 05:47:07', '2023-06-05 05:49:02'),
(11, 15, 'we2code', 'React js developer', 'indore', 'Information Technology', 'Development ', NULL, '2023-01-10', '2023-06-05', 1, '2023-06-05 05:47:52', '2023-06-05 05:49:19'),
(12, 22, 'Apna Sweet', 'Delivery boy', 'mumbai', 'Retail & Wholesale', ' Manages the organization\'s technology infrastructure, including network systems, software development, cybersecurity, data management, and IT support services.', '67', '2020-07-09', '2022-01-01', NULL, '2023-06-05 07:06:36', '2023-06-05 07:06:36'),
(13, 27, 'we2code', 'full stack developer', 'indore', 'Information Technology', 'indore', 'experience', '2022-03-15', '2023-06-20', 1, '2023-06-20 07:30:10', '2023-06-20 07:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `type` varchar(51) NOT NULL,
  `document_url` varchar(251) NOT NULL,
  `extension_type` text NOT NULL,
  `is_varify` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(1, 1, 'Metric', 'Oxford ', 'Other', '10th', 'India', 2011, '2023-05-20 11:18:35', '2023-05-20 11:18:47'),
(2, 5, 'Metric', 'Davv', 'Other', 'Customer service', 'India', 2018, '2023-05-22 09:09:17', '2023-05-22 09:09:17'),
(3, 5, 'Post Metric', 'Davv', 'Other', 'Customer service', 'India', 2020, '2023-05-22 09:09:46', '2023-05-22 09:09:46'),
(4, 5, 'Diploma', 'Davv', 'Bachelor of Communication', 'Customer service', 'India', 2021, '2023-05-22 09:10:47', '2023-05-22 09:11:02'),
(5, 2, 'Post Graduate', 'harward', 'Master of Laws', NULL, 'United States', 2018, '2023-05-22 12:05:09', '2023-05-22 12:05:09'),
(6, 4, 'Metric', 'CBSE', 'Other', 'All', 'India', 2017, '2023-05-23 06:17:53', '2023-05-23 06:20:14'),
(7, 4, 'Post Metric', 'CBSE', 'Other', 'Commerce plus PE', 'India', 2019, '2023-05-23 06:18:43', '2023-05-23 06:20:04'),
(8, 4, 'Graduate', 'Davv', 'Bachelor of Commerce', 'Computer', 'India', 2022, '2023-05-23 06:19:37', '2023-05-23 06:19:49'),
(9, 8, 'Post Metric', 'RGPV', 'Bachelor of Arts', 'Computer Science Engineer', 'Azerbaijan', 2016, '2023-05-25 15:32:43', '2023-05-25 15:32:43'),
(10, 7, 'Diploma', 'RGPV', 'Alternate Entry Master of Science in Nursing', 'Computer Science Engineer', 'Bahamas', 2012, '2023-05-26 07:18:26', '2023-05-26 07:18:26'),
(11, 7, 'Graduate', 'Mumbai', 'Bachelor of Commerce and Administration', 'Drams', 'India', 2010, '2023-05-27 06:11:22', '2023-05-27 06:11:22'),
(12, 7, 'Post Graduate', 'Mumbai', 'Master of Commerce', 'Drama', 'India', 2015, '2023-05-27 06:28:18', '2023-05-27 06:28:18'),
(13, 20, 'Metric', 'Davv', 'Bachelor of Liberal Arts', NULL, NULL, 2019, '2023-06-05 05:13:23', '2023-06-05 05:13:23'),
(14, 15, 'Metric', 'Holy spirit ', '10th', 'All', 'India', 2017, '2023-06-05 05:23:30', '2023-06-05 05:50:32'),
(15, 15, 'Post Metric', 'Holy spirit ', '12th', 'PE', 'India', 2019, '2023-06-05 05:24:04', '2023-06-05 05:50:56'),
(16, 15, 'Graduate', 'Davv', 'Bachelor of Commerce', 'Computer Applications', 'India', 2022, '2023-06-05 05:24:54', '2023-06-05 05:24:54'),
(17, 22, 'Post Metric', 'gfhghb', 'Bachelor of Arts', 'ghfghfghf', 'Azerbaijan', 2018, '2023-06-05 07:06:56', '2023-06-05 07:06:56'),
(18, 27, 'Metric', 'Oxford ', '10th', 'computer', 'India', 2005, '2023-06-20 07:31:02', '2023-06-20 07:31:02');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_setting`
--

INSERT INTO `employee_setting` (`id`, `employee_id`, `email_permission`, `created_at`, `updated_at`) VALUES
(1, 26, 1, '2023-06-12 10:56:12', '2023-06-12 10:56:12');

-- --------------------------------------------------------

--
-- Table structure for table `employee_skill`
--

CREATE TABLE `employee_skill` (
  `skill_id` int(101) NOT NULL,
  `employee_id` int(101) DEFAULT NULL,
  `skill` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_skill`
--

INSERT INTO `employee_skill` (`skill_id`, `employee_id`, `skill`) VALUES
(1, 1, 'Other'),
(5, 2, 'Farming, Fisheries & Forestry Occupations '),
(7, 4, 'Technology Occupations'),
(10, 4, 'Legal Occupations'),
(11, 8, 'Healthcare Occupations'),
(12, 7, 'Healthcare Occupations'),
(13, 7, 'Media, Arts & Design Occupations'),
(14, 7, 'Other'),
(16, 20, 'Finance & Accounting Occupations'),
(17, 20, 'Education & Instruction Occupations'),
(18, 20, 'Transportation Occupations'),
(19, 20, 'Organization Operations & Administrative Occupations'),
(20, 20, 'Healthcare Occupations'),
(21, 15, 'Typing'),
(22, 15, 'React js'),
(23, 15, 'Bootstrap'),
(24, 15, 'Css'),
(25, 15, 'Html'),
(26, 15, 'JavaScript'),
(27, 15, 'Tally'),
(28, 22, 'Organization Operations & Administrative Occupations'),
(35, 26, 'Healthcare Occupations'),
(36, 26, 'Sales, Retail, & Customer Support Occupations'),
(38, 15, 'Supply Chain & Logistics Occupations'),
(39, 23, 'Repair, Maintenance & Installation Occupations'),
(40, 23, 'Supply Chain & Logistics Occupations'),
(41, 27, 'Technology Occupations'),
(44, 26, 'Legal Occupations'),
(45, 8, 'Healthcare Occupations'),
(46, 12, 'Construction & Extraction Occupations'),
(47, 3, 'Tally'),
(48, 3, 'Construction & Extraction Occupations'),
(49, 5, 'Construction & Extraction Occupations'),
(50, 5, 'Tally');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_view`
-- (See below for the actual view)
--
CREATE TABLE `employee_view` (
`employee_id` int(101)
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
,`is_posted` tinyint(1)
,`posted_company_id` int(51)
,`date_of_posting` date
,`designation``` varchar(251)
,`resume` varchar(301)
,`profile_photo` varchar(255)
,`created_at` timestamp
,`created_by_admin` int(51)
,`updated_at` timestamp
,`is_deleted` tinyint(1)
,`token` varchar(301)
,`profile_complete` decimal(21,2)
,`education` text
,`specialization` text
,`skill` varchar(256)
);

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
(1, 'Amul ', 'Restaurants & Food Service', 'B2B', 'amul', '2001-02-01', '10000', 'www.amul.com', 'delivery ', 'Anand Milk Union Limited is an Indian state government-owned dairy-based cooperative society officially named the Gujarat Milk Marketing Federation based in Anand, Gujarat. It is under the ownership of Gujarat Cooperative Milk Marketing Federation Limited, Department of Cooperation, Government of Gujarat.', 'Molly Kurien', 'molly@gmail.com', 'sfgdf', 258741030, 6546546565, ' Vijay Nagar', 452010, 'Indore', 'Madhya Pradesh', 'India', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1684580560.png', 0, '2023-05-20 11:02:40', '2023-05-20 11:05:16', 1, 0, 'indore', '', '', '', ''),
(2, 'Sanchi', 'Restaurants & Food Service', 'B2C', 'sanchi', '2010-02-09', '55', 'sachi.com', 'delivery  boy', 'Sanchi is a milk product brand name of Madhya Pradesh State Cooperative Dairy Federation Limited.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1684582375.png', 0, '2023-05-20 11:32:55', '2023-05-20 11:32:55', 1, 0, 'Vijay nagar', '', '', '', ''),
(3, 'Sention', 'Healthcare', 'B2C', 'Sen', '2018-01-03', '9', 'www.sention.com', 'Content writer ', 'Sention is well known for their customer service, and they highlight that in their profile. Their About Us page tells a story of service and growth, all centered around their customers.\n\nFor more insight, they have linked pages dedicated to detailing out more on topics like \"What we live by\" and \"How we work.\"', 'Priyanshu Gupta', 'g.choudhary.we2code@gmail.com', 'b5a99bdaeb247f6b650a75d0a001b708', 9632587410, NULL, 'Ram nagar', 752963, 'indore', 'mp', 'India', 'Manager', 'https://apnaorganicstore.in/canjobs/uploads/1684835736.jpeg', 0, '2023-05-20 12:05:34', '2023-05-23 09:55:36', 0, 0, 'Indore', '', '', '', ''),
(4, 'WE2CODE', 'Information Technology', 'B2B', 'W2C', '2023-02-02', '1000', 'amazon.in', 'Developer', 'We2Code is an imerging web design and development company of India. We have wide range of technical skill to provide better services to our clients.@We2Code, core strength lies in our super energetic and gigantic team, forming an excellent blend of IT minds along with a creative bent. Our endeavor is to continuously improve and deliver maximum – enriching products & solutions. That’s what we mean – We code your dreams.\nOur Web development solutions are most comprehensive and impactful as it include all web based services from establishing conceptual framework, drawing inferential backdrop, web interfaces, programmed system architecture, web services, and system support to database management. Our extremely prolific web development solutions also include content management, custom web development, E commerce website development, payment gateway integration, 3rd party API integration, Web Portal development and Ecommerce shopping cart. We develop websites and web apps to suit your business growth and to get you best leads.', 'Nirantar singh pandy', 'utkarsh.we2code@gmail.com', NULL, 9857412360, NULL, 'Ram nagar', 752963, 'indore', 'mp', 'India', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1685945373.jpeg', 0, '2023-05-22 06:35:46', '2023-06-05 06:15:35', 3, 0, 'Indore', '', '', '', ''),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aashi.we2code@gmail.com', 'f523370044c04615aea88f46e44978cf', 9874563210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-29 04:56:42', '2023-06-03 08:55:34', 0, 1, '', '', '107979113144063469587', '', ''),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aashi Vyas', 'aashi.we2code@gmail.com', '4f1058b235cc3827fb8888a5d1aab930', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/AAcHTteF1y7ML3nJ3laAgbbpdifExtG5L29jwxR_DBzg=s96-c', 0, '2023-06-03 09:04:54', '2023-06-06 08:47:35', 0, 1, '', '587ea74f1e1c1b667fcfa0826f5ac338', '107979113144063469587', '', ''),
(8, 'Mayur industries ', 'Information Technology', 'B2C', 'myi', NULL, '15', 'www.mayurindustries.com', 'Developers', 'company oversees the use of devices storing, retrieving, and sending information.', 'Mayur yadav', 'g.choudhary.we2code@gmail.com', '167b5b0d9cd1650a147abb3d41dba85d', 98745632777777, NULL, 'Ram nagar', 752963, 'indore', 'mp', 'India', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1685949888.jpeg', 0, '2023-06-05 07:16:03', '2023-06-06 11:37:50', 0, 0, 'Indore', '', '', '', ''),
(9, '1wqidah', 'Retail & Wholesale', NULL, NULL, NULL, '1', NULL, 'fgvhb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-06 11:59:37', '2023-06-06 11:59:37', 3, 1, '', '', '', '', ''),
(10, 'greenbay tech', 'Retail & Wholesale', NULL, NULL, NULL, '1', NULL, 'fgvhb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1686056652.png', 0, '2023-06-06 12:40:42', '2023-06-06 13:04:12', 3, 0, '', '', '', '', ''),
(11, 'Cognizant', 'Healthcare', NULL, NULL, NULL, '33', NULL, 'SOFTWARE ENGINEER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1686056638.jpeg', 0, '2023-06-06 12:43:42', '2023-06-06 13:03:58', 3, 0, '', '', '', '', ''),
(12, 'RADISON BLUE', 'Information Technology', 'G2B', NULL, '2007-06-01', '1', 'www.radisonblue.in', 'Developer', 'Web scraping is the automatic process of extracting information from a website. Most of this data is unstructured in an HTML format which is then converted into a structured data in a spreadsheet or a database so that it can be used for other applications. There are several ways to scrape data from websites which include using different tools, particular APIs or even writing your own code for web scraping from scratch.\n\n[Disclaimer: Before beginning, many websites can restrict scraping of data from their pages. How do you know which websites are allowed or not? You can look at the ‘robots.txt’ file of the website. You can simply put robots.txt after the URL that you want to scrape, and you will find the information on whether the website host allows you to scrape the website. The data I have scraped is purely for learning purpose]\n\nFor this project, I was looking to scrape job postings from Indeed using selenium and Java. When I looked up online, I saw that most of them were done using python and could not find enough resources using selenium and Java. This blog is for all those who are looking to scrape data using selenium-Java.\n\nThe challenging part here is identifying the elements in the DOM structure using the different locators. My suggestion would be to use your own customized xpath/css locators instead of relying on the browser tools as it does not work all the time.\n\nWe can use the id, name, className, tagName, linkText, partialLinkText wherever applicable else use the customized xpath/css locators. There are several ways to define xpath and CSS locators.\n\nSyntax for xpath\n\n//tagname[@attribute=’value’] For e.g., //input[@class=’xyz’]\n//*[@attribute=’value’]\n//tagname[contains(@attribute,’value’)]\nSyntax for CSS\n\ntagname[attribute=’value’]\ntagname#id\ntagname.classname\ntagname#attribute\nThere are several other ways to define xpath using the parent child relationship or traversing all the way from the root and identifying the elements as well.\n\nPre-requisites\n\nBefore we get started, the following should be installed in the system:\n\nJava\nMaven\nAn IDE (here I have used eclipse)\nHere we are using Maven to manage our project in terms of generation, packaging, and dependency management. Maven is a POM (project object model) based build automation and project management tool. Maven is widely used for dependency management in Java. It also provides a predefined folder structure to write the code. We can add different plugins and JARs in our project.\n\nEnsure the POM file has all the required dependencies (testng, selenium-java, selenium-chrome-driver, selenium-support, selenium-api, selenium-server, poi-ooxml, poi-ooxml-schemas)\n\nThe following steps is specific to scrape job data from indeed. This could be refined as per the requirement.\n\nSteps to scrape job data from indeed\n\nCreate a testng class under the respective package in the Maven project. Launch the browser and navigate to the URL (indeed.com).\n2. Key in the required job postings and hit on search.\n\n3. Use the pagination logic to traverse through the different pages and get the job details from the job cards.\n\n4. Inspect the required elements and get the data.\n\n5. Write the scraped data into a spreadsheet\n\nStep 1: After creating the class, launch the browser and navigate to the URL\n\n@BeforeTest\npublic void beforeTest() {\nSystem.setProperty(\"webdriver.chrome.driver\",\"C:\\\\Users\\*******\\\\Drivers\\\\chromedriver.exe\");\ndriver = new ChromeDriver();\ndriver.navigate().to(\"https://www.indeed.com/\");\ndriver.manage().window().maximize();\n}\nStep 2: In my script, user input is prompted to look for the job postings for which we are looking to scrape the details. Here I have used the Scanner class for prompting the input.\n\n// Create a Scanner object to prompt for user input\nScanner myObj = new Scanner(System.in);\nSystem.out.println(\"What jobs are you looking for ? \");\njob_Search = myObj.nextLine();\ndriver.findElement(By.id(\"text-input-what\")).sendKeys(job_Search);\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1686055680.jpeg', 0, '2023-06-06 12:47:05', '2023-06-06 12:49:28', 3, 0, 'IT', '', '', '', ''),
(13, 'Infobeans', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aashi.we2code@gmail.com', 'c96948cbdaefbff6638d644f7b25b1c4', 2587410369, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-12 07:20:27', '2023-06-12 07:20:27', 0, 0, '', '', '', '', ''),
(14, 'Yo', 'Construction, Repair & Maintenance Services', 'G2C', 'sanchi', '2018-02-08', '4', 'www.sention.com', 'office boy', 'tg hr hg u ier tgue rgk vjkcf n mfn gbj kjfdkgj dkgg ', 'Ox Factory', 'chetan.barod.we2code@gmail.com', 'a82880e4812a95d15aa1537b96d9ddad', 9874563210, NULL, 'Club Colony, Clerk Colony,', 452011, 'Indore', ' Madhya Pradesh ', 'India', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1687251686.png', 0, '2023-06-20 07:35:09', '2023-06-20 09:06:27', 0, 0, 'Indore', '', '', '', ''),
(15, 'hfghfg', 'Construction, Repair & Maintenance Services', 'B2C', 'amul', '2023-06-15', '55', 'amazon.in', 'fgdfghfhd', 'jygtfh r rt y  f yghtfh ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1687252766.jpeg', 0, '2023-06-20 09:19:26', '2023-06-20 09:19:26', 1, 1, 'Vijay nagar', '', '', '', ''),
(16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rajaram Patidar', 'raj.we2code@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/AAcHTtfW9jXWLCGjpCOMP7tOe386izc7-UMuM75DlHNfx2pRbQ=s96-c', 0, '2023-07-22 18:44:29', '2023-07-22 18:44:29', 0, 0, '', '', '103776226635607600492', '', '');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employer_setting`
--

INSERT INTO `employer_setting` (`id`, `company_id`, `email_permission`, `created_at`, `updated_at`) VALUES
(1, 13, 1, '2023-06-12 09:33:51', '2023-06-12 09:33:51'),
(2, 4, 1, '2023-06-13 09:02:26', '2023-06-13 09:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `follow_up`
--

CREATE TABLE `follow_up` (
  `id` int(101) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `next_followup_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follow_up`
--

INSERT INTO `follow_up` (`id`, `admin_id`, `job_id`, `employee_id`, `remark`, `next_followup_date`, `created_at`) VALUES
(1, 1, 2, 1, 'Scheduled the interview ', '0000-00-00', '2023-05-20 11:37:46'),
(2, 1, 2, 1, 'yjt gyj', '0000-00-00', '2023-05-20 11:38:23'),
(3, 1, 2, 1, 'sdgdfgfc bff\n', '0000-00-00', '2023-05-20 11:38:50'),
(4, 1, 1, 1, 'NEw followup', '2023-05-23', '2023-05-22 04:25:13'),
(5, 1, 7, 5, 'Testung', '2023-05-24', '2023-05-23 04:37:03'),
(6, 1, 4, 3, 'New fiollow up', '2023-05-25', '2023-05-23 04:37:13'),
(7, 1, 1, 4, 'hi testted', '2023-05-25', '2023-05-23 04:37:26'),
(8, 1, 1, 3, 'testing follow', '2023-05-24', '2023-05-23 06:50:19'),
(9, 1, 8, 6, 'test', '2023-05-31', '2023-05-26 07:16:24'),
(10, 1, 11, 12, 'jkjhuhlj', '0000-00-00', '2023-06-05 06:21:29'),
(11, 3, 4, 12, 'sdf', '2023-06-30', '2023-06-05 10:46:22'),
(12, 3, 4, 12, 'fgmklllk', '2023-06-30', '2023-06-05 10:59:03'),
(13, 3, 4, 12, 'aDsfvb', '2023-06-22', '2023-06-05 10:59:17'),
(14, 3, 4, 12, 'fxcgfdsdff', '2023-06-13', '2023-06-05 10:59:31'),
(15, 3, 4, 12, 'fghjmk,mnsdcgvbn', '2023-06-05', '2023-06-05 10:59:47'),
(16, 3, 4, 12, 'rtyguhijikg', '2023-06-15', '2023-06-05 10:59:59'),
(17, 3, 4, 12, 'fghjbnkml,', '2023-06-06', '2023-06-05 11:00:11'),
(18, 3, 4, 12, 'xdcfvhbjnkmkl,', '2023-06-14', '2023-06-05 11:00:19'),
(19, 3, 4, 12, 'dfghjkl', '2023-06-27', '2023-06-05 11:00:27'),
(20, 3, 4, 12, 'zxdcfgvhbjnkml,', '2023-06-27', '2023-06-05 11:00:37'),
(21, 3, 4, 12, 'zsxdfcgfvhbjnkml', '2023-06-13', '2023-06-05 11:00:51'),
(22, 3, 4, 12, 'edrfytguhijkl', '2023-06-14', '2023-06-05 11:01:04'),
(23, 3, 4, 12, 'rdfvgbhnjkml', '2023-06-24', '2023-06-05 11:01:35'),
(24, 3, 4, 12, 'llllllllllllllllllllllllll............', '2023-06-22', '2023-06-05 11:01:45'),
(25, 3, 4, 12, '////////////////////////', '2023-06-29', '2023-06-05 11:01:55'),
(26, 3, 4, 12, '\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'', '2023-06-16', '2023-06-05 11:02:26'),
(27, 3, 4, 12, '\'\'\'\'ppppppppppppp', '2023-06-17', '2023-06-05 11:02:35'),
(28, 3, 4, 12, 'pppppppppppppppp', '2023-06-24', '2023-06-05 11:02:44'),
(29, 3, 4, 12, 'jjjjjpmmmmmmmmmmmm', '2023-06-23', '2023-06-05 11:02:52'),
(30, 3, 4, 12, '20', '2023-06-09', '2023-06-05 11:03:26'),
(31, 3, 4, 12, '21', '2023-06-30', '2023-06-05 11:03:33'),
(32, 3, 4, 12, '22', '2023-06-21', '2023-06-05 11:03:43'),
(33, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:35:44'),
(34, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:35:49'),
(35, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:35:53'),
(36, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:35:58'),
(37, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:03'),
(38, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:07'),
(39, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:12'),
(40, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:16'),
(41, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:21'),
(42, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:26'),
(43, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:31'),
(44, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:35'),
(45, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:40'),
(46, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:44'),
(47, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:49'),
(48, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:53'),
(49, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:36:58'),
(50, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:02'),
(51, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:07'),
(52, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:11'),
(53, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:16'),
(54, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:21'),
(55, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:26'),
(56, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:30'),
(57, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:35'),
(58, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:39'),
(59, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:44'),
(60, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:49'),
(61, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:53'),
(62, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:37:58'),
(63, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:02'),
(64, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:06'),
(65, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:11'),
(66, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:16'),
(67, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:21'),
(68, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:25'),
(69, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:30'),
(70, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:34'),
(71, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:39'),
(72, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:44'),
(73, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:48'),
(74, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:53'),
(75, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:38:57'),
(76, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:02'),
(77, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:06'),
(78, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:11'),
(79, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:16'),
(80, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:20'),
(81, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:25'),
(82, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:30'),
(83, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:34'),
(84, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:39'),
(85, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:43'),
(86, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:48'),
(87, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:52'),
(88, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:39:57'),
(89, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:02'),
(90, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:07'),
(91, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:11'),
(92, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:16'),
(93, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:20'),
(94, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:25'),
(95, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:29'),
(96, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:34'),
(97, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:39'),
(98, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:43'),
(99, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:48'),
(100, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:53'),
(101, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:40:58'),
(102, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:02'),
(103, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:07'),
(104, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:12'),
(105, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:16'),
(106, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:21'),
(107, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:26'),
(108, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:31'),
(109, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:35'),
(110, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:40'),
(111, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:45'),
(112, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:49'),
(113, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:54'),
(114, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:41:59'),
(115, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:03'),
(116, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:08'),
(117, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:13'),
(118, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:17'),
(119, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:22'),
(120, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:27'),
(121, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:31'),
(122, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:36'),
(123, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:41'),
(124, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:45'),
(125, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:50'),
(126, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:54'),
(127, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:42:59'),
(128, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:04'),
(129, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:09'),
(130, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:13'),
(131, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:18'),
(132, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:23'),
(133, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:27'),
(134, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:32'),
(135, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:37'),
(136, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:41'),
(137, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:46'),
(138, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:52'),
(139, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:43:57'),
(140, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:02'),
(141, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:06'),
(142, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:11'),
(143, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:16'),
(144, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:20'),
(145, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:25'),
(146, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:30'),
(147, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:34'),
(148, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:39'),
(149, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:43'),
(150, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:48'),
(151, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:53'),
(152, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:44:57'),
(153, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:45:02'),
(154, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:45:07'),
(155, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:45:11'),
(156, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:45:16'),
(157, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:45:21'),
(158, 3, 7, 22, 'hell', '2012-11-02', '2023-06-05 11:45:25'),
(159, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:45:30'),
(160, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:45:34'),
(161, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:45:40'),
(162, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:45:44'),
(163, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:45:49'),
(164, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:45:53'),
(165, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:45:58'),
(166, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:03'),
(167, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:08'),
(168, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:12'),
(169, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:16'),
(170, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:21'),
(171, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:25'),
(172, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:30'),
(173, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:35'),
(174, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:39'),
(175, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:44'),
(176, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:49'),
(177, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:53'),
(178, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:46:57'),
(179, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:02'),
(180, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:07'),
(181, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:12'),
(182, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:17'),
(183, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:22'),
(184, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:26'),
(185, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:31'),
(186, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:36'),
(187, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:40'),
(188, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:45'),
(189, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:49'),
(190, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:54'),
(191, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:47:58'),
(192, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:03'),
(193, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:07'),
(194, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:12'),
(195, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:17'),
(196, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:22'),
(197, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:26'),
(198, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:31'),
(199, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:35'),
(200, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:40'),
(201, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:45'),
(202, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:49'),
(203, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:54'),
(204, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:48:58'),
(205, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:03'),
(206, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:07'),
(207, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:12'),
(208, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:16'),
(209, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:21'),
(210, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:26'),
(211, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:30'),
(212, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:35'),
(213, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:39'),
(214, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:44'),
(215, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:48'),
(216, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:53'),
(217, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:49:57'),
(218, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:03'),
(219, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:07'),
(220, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:12'),
(221, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:16'),
(222, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:20'),
(223, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:25'),
(224, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:30'),
(225, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:34'),
(226, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:39'),
(227, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:43'),
(228, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:48'),
(229, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:53'),
(230, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:50:57'),
(231, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:02'),
(232, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:06'),
(233, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:11'),
(234, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:15'),
(235, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:20'),
(236, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:24'),
(237, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:29'),
(238, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:34'),
(239, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:38'),
(240, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:43'),
(241, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:47'),
(242, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:52'),
(243, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:51:56'),
(244, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:01'),
(245, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:05'),
(246, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:10'),
(247, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:15'),
(248, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:19'),
(249, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:24'),
(250, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:28'),
(251, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:33'),
(252, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:37'),
(253, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:42'),
(254, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:46'),
(255, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:51'),
(256, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:52:56'),
(257, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:00'),
(258, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:05'),
(259, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:09'),
(260, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:14'),
(261, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:18'),
(262, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:23'),
(263, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:28'),
(264, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:32'),
(265, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:37'),
(266, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:42'),
(267, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:47'),
(268, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:51'),
(269, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:53:56'),
(270, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:54:00'),
(271, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:54:05'),
(272, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:54:09'),
(273, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:54:14'),
(274, 3, 7, 12, 'hell', '2012-11-02', '2023-06-05 11:54:18'),
(275, 3, 7, 8, 'hell', '2012-11-02', '2023-06-05 11:54:23'),
(276, 3, 7, 8, 'hell', '2012-11-02', '2023-06-05 11:54:27'),
(277, 3, 7, 8, 'hell', '2012-11-02', '2023-06-05 11:54:32'),
(278, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:54:36'),
(279, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:54:41'),
(280, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:54:45'),
(281, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:54:49'),
(282, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:54:54'),
(283, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:54:58'),
(284, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:03'),
(285, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:07'),
(286, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:11'),
(287, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:16'),
(288, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:20'),
(289, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:25'),
(290, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:29'),
(291, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:34'),
(292, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:38'),
(293, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:43'),
(294, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:47'),
(295, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:52'),
(296, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:55:56'),
(297, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:01'),
(298, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:05'),
(299, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:09'),
(300, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:14'),
(301, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:19'),
(302, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:23'),
(303, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:28'),
(304, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:32'),
(305, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:36'),
(306, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:41'),
(307, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:46'),
(308, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:50'),
(309, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:55'),
(310, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:56:59'),
(311, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:03'),
(312, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:08'),
(313, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:12'),
(314, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:17'),
(315, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:21'),
(316, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:26'),
(317, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:30'),
(318, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:35'),
(319, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:39'),
(320, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:44'),
(321, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:48'),
(322, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:53'),
(323, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:57:57'),
(324, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:02'),
(325, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:06'),
(326, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:11'),
(327, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:15'),
(328, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:20'),
(329, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:24'),
(330, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:29'),
(331, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:33'),
(332, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:38'),
(333, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:42'),
(334, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:47'),
(335, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:51'),
(336, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:58:56'),
(337, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:00'),
(338, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:05'),
(339, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:09'),
(340, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:14'),
(341, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:18'),
(342, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:23'),
(343, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:27'),
(344, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:32'),
(345, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:36'),
(346, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:41'),
(347, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:45'),
(348, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:50'),
(349, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:54'),
(350, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 11:59:59'),
(351, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:03'),
(352, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:08'),
(353, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:13'),
(354, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:17'),
(355, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:22'),
(356, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:26'),
(357, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:31'),
(358, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:35'),
(359, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:40'),
(360, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:44'),
(361, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:49'),
(362, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:53'),
(363, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:00:58'),
(364, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:02'),
(365, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:07'),
(366, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:11'),
(367, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:16'),
(368, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:21'),
(369, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:25'),
(370, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:30'),
(371, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:34'),
(372, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:39'),
(373, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:43'),
(374, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:48'),
(375, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:53'),
(376, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:01:57'),
(377, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:02'),
(378, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:06'),
(379, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:10'),
(380, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:16'),
(381, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:21'),
(382, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:26'),
(383, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:30'),
(384, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:35'),
(385, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:41'),
(386, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:45'),
(387, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:50'),
(388, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:54'),
(389, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:02:59'),
(390, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:04'),
(391, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:08'),
(392, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:13'),
(393, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:17'),
(394, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:22'),
(395, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:26'),
(396, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:31'),
(397, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:35'),
(398, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:40'),
(399, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:44'),
(400, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:49'),
(401, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:54'),
(402, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:03:58'),
(403, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:03'),
(404, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:07'),
(405, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:12'),
(406, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:16'),
(407, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:21'),
(408, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:26'),
(409, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:30'),
(410, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:34'),
(411, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:39'),
(412, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:43'),
(413, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:48'),
(414, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:53'),
(415, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:04:57'),
(416, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:02'),
(417, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:07'),
(418, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:11'),
(419, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:16'),
(420, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:20'),
(421, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:25'),
(422, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:29'),
(423, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:34'),
(424, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:39'),
(425, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:43'),
(426, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:48'),
(427, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:52'),
(428, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:05:57'),
(429, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:02'),
(430, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:06'),
(431, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:11'),
(432, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:16'),
(433, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:20'),
(434, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:25'),
(435, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:29'),
(436, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:34'),
(437, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:39'),
(438, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:43'),
(439, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:48'),
(440, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:52'),
(441, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:06:57'),
(442, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:07:02'),
(443, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:07:06'),
(444, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:07:11'),
(445, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:07:16'),
(446, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:07:20'),
(447, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:07:25'),
(448, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:07:30'),
(449, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:07:35'),
(450, 3, 7, 6, 'hell', '2012-11-02', '2023-06-05 12:10:52'),
(451, 3, 7, 22, 'ergrdgdfgfdgr', '2023-06-30', '2023-06-05 12:31:52'),
(452, 3, 7, 3, '6525kmkoo', '0000-00-00', '2023-06-05 12:54:27'),
(453, 3, 4, 22, 'ddddddddddddddddddddddd', '2023-06-08', '2023-06-06 08:44:36'),
(454, 3, 4, 22, 'xxxxxxxx', '2023-06-06', '2023-06-06 08:45:04'),
(455, 3, 4, 12, 'ssd', '0000-00-00', '2023-06-06 08:46:49'),
(456, 3, 7, 3, 'hell0', '0000-00-00', '2023-06-06 08:54:51'),
(457, 3, 7, 3, 'hell0', '0000-00-00', '2023-06-06 08:57:01'),
(458, 3, 7, 3, 'hell1', '0000-00-00', '2023-06-06 08:57:05'),
(459, 3, 7, 3, 'hell2', '0000-00-00', '2023-06-06 08:57:09'),
(460, 3, 7, 3, 'hell3', '0000-00-00', '2023-06-06 08:57:12'),
(461, 3, 7, 3, 'hell4', '0000-00-00', '2023-06-06 08:57:16'),
(462, 3, 7, 3, 'hell5', '0000-00-00', '2023-06-06 08:57:19'),
(463, 3, 7, 3, 'hell6', '0000-00-00', '2023-06-06 08:57:23'),
(464, 3, 7, 3, 'hell7', '0000-00-00', '2023-06-06 08:57:26'),
(465, 3, 7, 3, 'hell8', '0000-00-00', '2023-06-06 08:57:29'),
(466, 3, 7, 3, 'hell9', '0000-00-00', '2023-06-06 08:57:33'),
(467, 3, 7, 3, 'hell10', '0000-00-00', '2023-06-06 08:57:36'),
(468, 3, 7, 3, 'hell11', '0000-00-00', '2023-06-06 08:57:40'),
(469, 3, 7, 3, 'hell12', '0000-00-00', '2023-06-06 08:57:43'),
(470, 3, 7, 3, 'hell13', '0000-00-00', '2023-06-06 08:57:47'),
(471, 3, 7, 3, 'hell14', '0000-00-00', '2023-06-06 08:57:50'),
(472, 3, 7, 3, 'hell15', '0000-00-00', '2023-06-06 08:57:53'),
(473, 3, 7, 3, 'hell16', '0000-00-00', '2023-06-06 08:57:57'),
(474, 3, 7, 3, 'hell17', '0000-00-00', '2023-06-06 08:58:00'),
(475, 3, 7, 3, 'hell18', '0000-00-00', '2023-06-06 08:58:04'),
(476, 3, 7, 3, 'hell19', '0000-00-00', '2023-06-06 08:58:07'),
(477, 3, 7, 3, 'hell20', '0000-00-00', '2023-06-06 08:58:10'),
(478, 3, 7, 3, 'hell21', '0000-00-00', '2023-06-06 08:58:14'),
(479, 3, 7, 3, 'hell22', '0000-00-00', '2023-06-06 08:58:17'),
(480, 3, 7, 3, 'hell23', '0000-00-00', '2023-06-06 08:58:21'),
(481, 3, 7, 3, 'hell24', '0000-00-00', '2023-06-06 08:58:24'),
(482, 3, 7, 3, 'hell25', '0000-00-00', '2023-06-06 08:58:27'),
(483, 3, 7, 3, 'hell26', '0000-00-00', '2023-06-06 08:58:31'),
(484, 3, 7, 3, 'hell27', '0000-00-00', '2023-06-06 08:58:34'),
(485, 3, 7, 3, 'hell28', '0000-00-00', '2023-06-06 08:58:37'),
(486, 3, 7, 3, 'hell29', '0000-00-00', '2023-06-06 08:58:41'),
(487, 3, 7, 3, 'hell30', '0000-00-00', '2023-06-06 08:58:44'),
(488, 3, 7, 3, 'hell31', '0000-00-00', '2023-06-06 08:58:48'),
(489, 3, 7, 3, 'hell32', '0000-00-00', '2023-06-06 08:58:51'),
(490, 3, 7, 3, 'hell33', '0000-00-00', '2023-06-06 08:58:54'),
(491, 3, 7, 3, 'hell34', '0000-00-00', '2023-06-06 08:58:58'),
(492, 3, 7, 3, 'hell35', '0000-00-00', '2023-06-06 08:59:01'),
(493, 3, 7, 3, 'hell36', '0000-00-00', '2023-06-06 08:59:05'),
(494, 3, 7, 3, 'hell37', '0000-00-00', '2023-06-06 08:59:08'),
(495, 3, 7, 3, 'hell38', '0000-00-00', '2023-06-06 08:59:12'),
(496, 3, 7, 3, 'hell39', '0000-00-00', '2023-06-06 08:59:16'),
(497, 3, 7, 3, 'hell40', '0000-00-00', '2023-06-06 08:59:19'),
(498, 3, 7, 3, 'hell41', '0000-00-00', '2023-06-06 08:59:23'),
(499, 3, 7, 3, 'hell42', '0000-00-00', '2023-06-06 08:59:26'),
(500, 3, 7, 3, 'hell43', '0000-00-00', '2023-06-06 08:59:29'),
(501, 3, 7, 3, 'hell44', '0000-00-00', '2023-06-06 08:59:33'),
(502, 3, 7, 3, 'hell45', '0000-00-00', '2023-06-06 08:59:36'),
(503, 3, 7, 3, 'hell46', '0000-00-00', '2023-06-06 08:59:40'),
(504, 3, 7, 3, 'hell47', '0000-00-00', '2023-06-06 08:59:44'),
(505, 3, 7, 3, 'hell48', '0000-00-00', '2023-06-06 08:59:47'),
(506, 3, 7, 3, 'hell49', '0000-00-00', '2023-06-06 08:59:50'),
(507, 3, 7, 3, 'hell50', '0000-00-00', '2023-06-06 08:59:53'),
(508, 3, 7, 3, 'hell51', '0000-00-00', '2023-06-06 08:59:57'),
(509, 3, 7, 3, 'hell52', '0000-00-00', '2023-06-06 09:00:00'),
(510, 3, 7, 3, 'hell53', '0000-00-00', '2023-06-06 09:00:03'),
(511, 3, 7, 3, 'hell54', '0000-00-00', '2023-06-06 09:00:07'),
(512, 3, 7, 3, 'hell55', '0000-00-00', '2023-06-06 09:00:10'),
(513, 3, 7, 3, 'hell56', '0000-00-00', '2023-06-06 09:00:14'),
(514, 3, 7, 3, 'hell57', '0000-00-00', '2023-06-06 09:00:17'),
(515, 3, 7, 3, 'hell58', '0000-00-00', '2023-06-06 09:00:21'),
(516, 3, 7, 3, 'hell59', '0000-00-00', '2023-06-06 09:00:24'),
(517, 3, 7, 3, 'hell60', '0000-00-00', '2023-06-06 09:00:28'),
(518, 3, 7, 3, 'hell61', '0000-00-00', '2023-06-06 09:00:31'),
(519, 3, 7, 3, 'hell62', '0000-00-00', '2023-06-06 09:00:34'),
(520, 3, 7, 3, 'hell63', '0000-00-00', '2023-06-06 09:00:38'),
(521, 3, 7, 3, 'hell64', '0000-00-00', '2023-06-06 09:00:41'),
(522, 3, 7, 3, 'hell65', '0000-00-00', '2023-06-06 09:00:45'),
(523, 3, 7, 3, 'hell66', '0000-00-00', '2023-06-06 09:00:48'),
(524, 3, 7, 3, 'hell67', '0000-00-00', '2023-06-06 09:00:51'),
(525, 3, 7, 3, 'hell68', '0000-00-00', '2023-06-06 09:00:55'),
(526, 3, 7, 3, 'hell69', '0000-00-00', '2023-06-06 09:00:58'),
(527, 3, 7, 3, 'hell70', '0000-00-00', '2023-06-06 09:01:02'),
(528, 3, 7, 3, 'hell71', '0000-00-00', '2023-06-06 09:01:05'),
(529, 3, 7, 3, 'hell72', '0000-00-00', '2023-06-06 09:01:08'),
(530, 3, 7, 3, 'hell73', '0000-00-00', '2023-06-06 09:01:12'),
(531, 3, 7, 3, 'hell74', '0000-00-00', '2023-06-06 09:01:15'),
(532, 3, 7, 3, 'hell75', '0000-00-00', '2023-06-06 09:01:19'),
(533, 3, 7, 3, 'hell76', '0000-00-00', '2023-06-06 09:01:22'),
(534, 3, 7, 3, 'hell77', '0000-00-00', '2023-06-06 09:01:26'),
(535, 3, 7, 3, 'hell78', '0000-00-00', '2023-06-06 09:01:29'),
(536, 3, 7, 3, 'hell79', '0000-00-00', '2023-06-06 09:01:32'),
(537, 3, 7, 3, 'hell80', '0000-00-00', '2023-06-06 09:01:36'),
(538, 3, 7, 3, 'hell81', '0000-00-00', '2023-06-06 09:01:39'),
(539, 3, 7, 3, 'hell82', '0000-00-00', '2023-06-06 09:01:43'),
(540, 3, 7, 3, 'hell83', '0000-00-00', '2023-06-06 09:01:46'),
(541, 3, 7, 3, 'hell84', '0000-00-00', '2023-06-06 09:01:50'),
(542, 3, 7, 3, 'hell85', '0000-00-00', '2023-06-06 09:01:53'),
(543, 3, 7, 3, 'hell86', '0000-00-00', '2023-06-06 09:01:56'),
(544, 3, 7, 3, 'hell87', '0000-00-00', '2023-06-06 09:02:00'),
(545, 3, 7, 3, 'hell88', '0000-00-00', '2023-06-06 09:02:03'),
(546, 3, 7, 3, 'hell89', '0000-00-00', '2023-06-06 09:02:07'),
(547, 3, 7, 3, 'hell90', '0000-00-00', '2023-06-06 09:02:10'),
(548, 3, 7, 3, 'hell91', '0000-00-00', '2023-06-06 09:02:13'),
(549, 3, 7, 3, 'hell92', '0000-00-00', '2023-06-06 09:02:17'),
(550, 3, 7, 3, 'hell93', '0000-00-00', '2023-06-06 09:02:21'),
(551, 3, 7, 3, 'hell94', '0000-00-00', '2023-06-06 09:02:24'),
(552, 3, 7, 3, 'hell95', '0000-00-00', '2023-06-06 09:02:27'),
(553, 3, 7, 3, 'hell96', '0000-00-00', '2023-06-06 09:02:31'),
(554, 3, 7, 3, 'hell97', '0000-00-00', '2023-06-06 09:02:34'),
(555, 3, 7, 3, 'hell98', '0000-00-00', '2023-06-06 09:02:37'),
(556, 3, 7, 3, 'hell99', '0000-00-00', '2023-06-06 09:02:41'),
(557, 3, 7, 3, 'hell100', '0000-00-00', '2023-06-06 09:02:44'),
(558, 1, 21, 27, 'Hello chetan', '2023-06-20', '2023-06-20 09:21:01'),
(559, 1, 21, 27, 'This employee having experience ', '2023-07-24', '2023-07-24 11:08:11');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(101) NOT NULL,
  `company_id` int(101) NOT NULL,
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
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_admin` int(51) NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `company_id`, `job_title`, `experience_required`, `salary`, `location`, `industry_type`, `apply_link`, `job_description`, `your_duties`, `requirement`, `department`, `job_type`, `role_category`, `education`, `language`, `keyskill`, `employement`, `job_category_id`, `is_active`, `created_at`, `updated_at`, `created_by_admin`, `is_featured`, `is_deleted`) VALUES
(1, 1, 'Delivery boy', '1-3 ', '5Lac-10Lac', 'India', 'Restaurants & Food Service', 'www.careerattcs.com', 'He/She will be responsible for prospecting, qualifying, negotiating and strategizing business development for given area. His/her success will be measured by the delivery of business critical goals, growth and gain in market share.', 'He/She will be responsible for prospecting, qualifying, negotiating .', ' responsible for prospecting, ', ' responsible for prospecting, ', 'Full-Time', NULL, 'Other', 'Hindi', 'Food & Beverage Occupations', 'Full-Time', 2, 1, '2023-05-20 11:13:38', '2023-05-20 11:14:14', 1, 0, 0),
(2, 2, 'Delivery boy', '1-3 ', '1Lac-3Lac', 'India', 'Restaurants & Food Service', 'www.careerattcs.com', 'Sanchi is a milk product brand name of Madhya Pradesh State Cooperative Dairy Federation Limited', 'Sanchi is a milk product brand name of Madhya Pradesh State Cooperative Dairy Federation Limited', 'Sanchi is a milk product brand', 'Sanchi ', 'Full-Time', NULL, 'Bachelor of Liberal Arts', 'Hindi', '', 'Full-Time', 2, 1, '2023-05-20 11:34:07', '2023-05-20 11:34:07', 1, 0, 0),
(3, 3, 'Shop worker', '0-1 ', 'Below 1 Lac', 'India', 'Retail & Wholesale', 'dps.com', 'Maintains staff by recruiting, selecting, orienting, and training employees. Ensures a safe, secure, and legal work environment. Develops personal growth opportunities. Accomplishes staff results by communicating job expectations; planning, monitoring, and appraising job results.', 'Maintains staff by recruiting, selecting, orienting, and training employees. Ensures a safe, secure,', 'Maintains staff by recruiting,', 'Maintains staff by recruiting,', 'Full-Time', '10', 'Bachelor of Liberal Arts', 'Hindi', 'Sales, Retail, & Customer Support Occupations', 'Full-Time', 2, 1, '2023-05-20 12:08:20', '2023-05-27 09:31:35', 0, 0, 1),
(4, 4, 'Web Developer', '3-5 ', '5Lac-10Lac', 'Antarctica', 'Information Technology', 'we2code.com', 'Tetsting', 'test', 'tes', 'HR', 'Full-Time', NULL, 'Bachelor of Software Engineering', 'English', 'Technology Occupations', 'Full-Time', 7, 1, '2023-05-22 06:37:10', '2023-05-22 06:38:01', 3, 0, 0),
(5, 4, 'Office boy', '1-3 ', 'Below 1 Lac', 'India', 'Information Technology', 'www.we2code.com', 'Job responsibilities will include: Office cleaning and maintenance, Preparing Tea and Serving, Banking work, Filing and deliveries. Local Language, Working knowledge of English, Willingness to travel.', 'Serve Tea and Coffee to Staff and office Visitor.\nClean office kitchen on daily basis.', 'Humane and respectful.', 'office staff', 'Full-Time', '5', 'Other', 'Hindi', 'Cleaning & Grounds Maintenance Occupations', 'Full-Time', 4, 1, '2023-05-22 07:24:21', '2023-05-22 07:24:21', 1, 0, 0),
(6, 4, 'Hr', '1-3 ', '1Lac-3Lac', 'India', 'Information Technology', 'www.we2code.com', 'Human resources (HR) professionals manage, develop and support employees within an organisation. They handle all the issues, policies and processes related to people, such as recruiting and hiring staff, training and developing employees and managing performance, compensation and benefits.', 'Support the development and implementation of HR initiatives and systems.', 'Confidentiality', 'Human Resource Administration.', 'Full-Time', '2', 'Master of Business Administration', 'English', 'Education & Instruction Occupations', 'Full-Time', 7, 1, '2023-05-22 07:31:21', '2023-05-22 07:31:21', 1, 0, 0),
(7, 4, 'Receptionist', '1-3 ', '1Lac-3Lac', 'India', 'Information Technology', 'www.we2code.com', 'A Receptionist\'s duties and responsibilities include greeting visitors, helping them navigate through an office, and supplying them with refreshments as they wait. In addition, they maintain calendars for appointments, sort mail, make copies, and plan travel arrangements.', 'Receptionists may greet visitors, handle incoming and outgoing correspondence, maintain files.', 'Verbal communication ', 'Customer service.', 'Full-Time', '2', 'Other', 'English', 'Community & Social Services Occupations', 'Full-Time', 5, 1, '2023-05-22 09:05:35', '2023-05-22 10:54:50', 3, 0, 0),
(8, 3, 'Content Writer ', '0-1 ', '3Lac-5Lac', 'India', 'Other', 'www.sention.com', 'A Content Writer is a professional who writes informative and engaging articles to help brands showcase their products. They write on a range of subjects and are responsible for creating the best possible written or visual content, from blog posts to press releases.', 'Research industry-related topics (combining online sources, interviews and studies)', 'Portfolio of published article', 'business\' marketing department', 'Casual', '100', 'Bachelor of Languages', 'English', 'Community & Social Services Occupations', 'Full-Time', 7, 1, '2023-05-23 10:00:13', '2023-05-23 11:33:04', 0, 0, 0),
(9, 2, 'Manager ', '1-3 ', '1Lac-3Lac', 'India', 'Retail & Wholesale', 'www.amul.com', 'Maintains staff by recruiting, selecting, orienting, and training employees. Ensures a safe, secure, and legal work environment. Develops personal growth opportunities. Accomplishes staff results by communicating job expectations; planning, monitoring, and appraising job results.', 'Maintains staff by recruiting, selecting, orienting, and training employees.\n', 'Technical skills.\n', 'Recruiting, interviewing.', 'Full-Time', '2', 'Master of Management Sciences', 'English', 'Community & Social Services Occupations', 'Full-Time', 5, 1, '2023-05-26 07:26:44', '2023-05-26 07:26:44', 1, 0, 0),
(10, 1, 'Head Manager', '5-7 ', '5Lac-10Lac', 'India', 'Retail & Wholesale', 'www.amul.com', 'Maintains staff by recruiting, selecting, orienting, and training employees. Ensures a safe, secure, and legal work environment. Develops personal growth opportunities. Accomplishes staff results by communicating job expectations; planning, monitoring, and appraising job results.', 'They are in charge of setting goals and sales targets, establishing guidelines and timelines, delega', 'Leadership', 'Head management ', 'Full-Time', '1', 'Master of Management in the Network Economy', 'English', 'Community & Social Services Occupations', 'Full-Time', 7, 1, '2023-05-26 07:28:49', '2023-05-26 07:28:49', 1, 0, 0),
(11, 4, 'React js developer', '1-3 ', '1Lac-3Lac', 'India', 'Information Technology', 'www.we2code.com', 'Proficient in translating designs & wireframes into high-quality code, and writing application interface code via Javascript and ReactJS workflows. Adept at monitoring & maintaining frontend performance and troubleshooting & debugging the same to bolster overall performance', 'Developing new user-facing features using React.js.\nBuilding reusable components and front-end .', 'Html , Css  , java Script ', 'Frontend', 'Full-Time', '1', 'Other', 'English', 'Technology Occupations', 'Full-Time', 28, 1, '2023-05-26 07:32:51', '2023-05-26 07:32:51', 1, 0, 0),
(12, 5, 'Driver', '0-1 ', 'Below 1 Lac', 'Afghanistan', 'Healthcare', 'ddd.com', 'wadcegv sefdrgv', 'v cb ef xcvxdf ', 'sfdxf edfsdf', 'dfsdfsdf', 'SWAP', '02', 'Bachelor of Applied Studies', 'Avestan', 'Education & Instruction Occupations', 'Full-Time', 2, 1, '2023-05-29 06:58:59', '2023-05-29 06:58:59', 0, 0, 0),
(13, 2, 'Driver', 'Fresher', NULL, 'Algeria', 'Manufacturing', 'ddd.com', 'jgyyyyyyyyyyyyf', 'gtfffffffffffff ', '   gfffff t', '                      bvvvvvvv', 'Internship', '41', 'Bachelor of Architectural Studies', NULL, NULL, NULL, 4, 1, '2023-06-05 06:20:07', '2023-06-05 06:20:07', 1, 0, 1),
(14, 8, 'React js developer', '1-3 ', '1Lac-3Lac', 'India', 'Information Technology', 'www.mayurIndustries.com', 'A React developer is responsible for the design and implementation of user interfaces (UIs) and UI components using React, a front-end JavaScript library. They develop and maintain UIs for web and mobile apps.', 'Developing website ', 'Html,CSS,Bootstrap,Javascript.', 'Frontend', 'Permanent', '05', 'Other', 'English', 'Technology Occupations', 'Part-Time', 28, 1, '2023-06-05 07:22:07', '2023-06-05 07:22:23', 0, 0, 0),
(15, 7, 'Driver', '3-5 ', '1Lac-3Lac', 'Åland Islands', 'Healthcare', 'fg.com', 'hgjhkm', 'hjkjnk', 'hkjhjkj', 'jkjkj', 'Permanent', '8', 'Bachelor of Arts', 'Bashkir', 'Science & Research Occupations', 'Full-Time', 4, 1, '2023-06-06 08:46:47', '2023-06-06 08:46:47', 0, 0, 0),
(16, 13, 'React js developer', '1-3 ', '1Lac-3Lac', 'India', 'Information Technology', 'www.careefrattcs.com', 'Proficient in translating designs & wireframes into high-quality code, and writing application interface code via Javascript and ReactJS workflows. Adept at monitoring & maintaining frontend performance and troubleshooting & debugging the same to bolster overall performance', 'Developing new user-facing features using React.js.', 'Translating designs and wirefr', 'Frontend', 'Temporary', NULL, 'Other', 'Azerbaijani', 'Education & Instruction Occupations', 'Full-Time', 28, 1, '2023-06-12 08:28:48', '2023-06-12 08:28:48', 0, 0, 0),
(17, 1, 'Driver', 'Fresher', '1Lac-3Lac', 'American Samoa', 'Manufacturing', 'fgfdgvb.com', 'ythdrtyh df ghfgdf ', 'tfytr fgfth vbftg', 'h fghfg htfg fhtfg gvb', 'fgf ', 'Internship', '2', 'Bachelor of Applied Science', 'Bashkir', 'Transportation Occupations', 'Part-Time', 4, 1, '2023-06-12 08:58:17', '2023-06-12 08:58:17', 1, 0, 1),
(18, 12, 'Math\'s Teacher', '1-3 ', 'Below 1 Lac', 'American Samoa', 'Manufacturing', 'ddd.com', ' yhnjgjngghd ghfg fg', 'tgdfhfdh dfhfdg ', 'fghfghgh', 'fghfgh', 'Casual', '5', 'Bachelor of Applied Science', 'Azerbaijani', 'Education & Instruction Occupations', 'Part-Time', 2, 1, '2023-06-12 09:08:31', '2023-06-12 09:08:31', 1, 0, 1),
(19, 13, 'React js developer', '3-5 ', '5Lac-10Lac', 'Algeria', 'Restaurants & Food Service', 'dps.com', 'dtggf', 'gffhf', 'fghfh', 'fgh fgh ', 'Permanent', '2', 'Bachelor of Arts', 'Afar', 'Healthcare Occupations', 'Other', 5, 1, '2023-06-12 09:44:19', '2023-06-12 09:44:19', 1, 0, 0),
(20, 13, 'React js developer', '1-3 ', '5Lac-10Lac', 'Afghanistan', 'Construction, Repair & Maintenance Services', 'dps.com', 'sdfdxfg', 'fgfgf', 'fghfgh', 'fgh dgh', 'Permanent', NULL, 'Bachelor of Arts', 'Aymara', 'Science & Research Occupations', 'Part-Time', 5, 1, '2023-06-12 09:46:48', '2023-06-12 09:46:48', 0, 0, 0),
(21, 13, 'Shreestha soni', '0-1 ', '1Lac-3Lac', 'Albania', 'Finance', 'ddd.com', 'tyhgjgh', 'hghgjhg', 'jghjghj', 'jgj', 'Permanent', '2', 'Bachelor of Liberal Arts', 'Afrikaans', 'Food & Beverage Occupations', 'Other', 5, 1, '2023-06-12 09:51:14', '2023-06-12 09:51:14', 0, 0, 0),
(22, 13, 'dgfh', '1-3 ', '1Lac-3Lac', 'Åland Islands', 'Restaurants & Food Service', 'ddd.comghfvh', 'hfghfg', 'ghfhfghb', 'fghfgh', 'fghfgh', 'Internship', NULL, 'Bachelor of Applied Science', 'Aymara', 'Transportation Occupations, Legal Occupations', 'Full-Time', 5, 1, '2023-06-12 09:56:52', '2023-07-03 07:11:59', 0, 0, 0),
(23, 14, 'React js developer', '1-3 ', '3Lac-5Lac', 'India', 'Information Technology', 'fgfdgvb.com', ' the job profile requires four years of experience, your headline can be “4+ years experienced React. js developer.” On the other hand, if you want to highlight your certifications or particular skill in your headline you can use “Redux Certified React', ' the job profile requires four years of experience, your headline can be “4+ years experienced React', ' the job profile requires four', 'Frontend', 'Freelance', '2', 'Bachelor of Applied Science', 'Bambara', 'Transportation Occupations', 'Part-Time', 28, 1, '2023-06-20 07:36:34', '2023-06-20 07:36:38', 0, 0, 0),
(24, 1, 'Driver', '1-3 ', 'Below 1 Lac', 'Albania', 'Manufacturing', 'ddd.com', 'tfgjng', 'ghg', 'ghgh', 'ghgg', 'Internship', '3', 'Bachelor of Applied Studies', 'Aymara', 'Supply Chain & Logistics Occupations', 'Full-Time', 4, 1, '2023-06-20 08:24:58', '2023-06-20 08:25:04', 1, 0, 1),
(25, 14, 'Driver', '1-3 ', '1Lac-3Lac', 'Albania', 'Healthcare', 'www.careerattcs.com', 'fg fgtfd fgfg fgvbf fgbgfv fgbfg gbnfgb gfhf ', 'gfdg fdgfd ', 'fghb fgf', 'gdfg', 'Permanent', '3', 'Bachelor of Liberal Arts', 'Akan', 'Cleaning & Grounds Maintenance Occupations', 'Full-Time', 4, 1, '2023-06-20 09:09:53', '2023-06-20 09:09:59', 1, 0, 1),
(26, 3, 'Raju', '0-1 ', '3Lac-5Lac', 'Algeria', 'Construction, Repair & Maintenance Services', 'fgfdgvb.com', 'dfd', 'dfgdg', 'dfgdfg', 'dfdf', 'Permanent', '4', 'Bachelor of Liberal Arts', 'Afar', 'Healthcare Occupations, Technology Occupations, Cleaning & Grounds Maintenance Occupations', 'Other', 5, 1, '2023-06-30 11:29:16', '2023-07-03 05:36:30', 7, 0, 0),
(27, 2, 'manager', '5+yrs', '1400000', 'banglore', 'IT', 'www.careerattcs.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', ' OIJO FOIJOJASDFVJ I JOJ Okdwjfoj oiho jOSDJFOIH9wrugh JM[- wmc MJDFHVBIU', 'OJOK ojioj 90dfujpjknel; oijcxjiojoHDFVB OIRBFNDC ,ZXMN HG JKDV', 'Bussiness', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo, html, Education & Instruction Occupations, Safety, Security & Civil Defence Occupations, Sales, Retail, & Customer Support Occupations', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-07-03 05:25:58', '2023-07-03 06:04:44', 1, 0, 0),
(28, 3, 'ytujtygjmyj', '1-3 ', 'Below 1 Lac', 'American Samoa', 'Human Resources & Staffing', 'ddd.com', 'ukjkjkj', 'kkjk', 'kjkk', 'jkjkjk', 'Permanent', '7', 'Bachelor of Liberal Arts', 'Akan', 'Repair, Maintenance & Installation Occupations, Supply Chain & Logistics Occupations', 'Part-Time', 5, 1, '2023-07-03 06:05:51', '2023-07-03 06:05:57', 1, 0, 0),
(29, 2, 'Driver', '1-3 ', '3Lac-5Lac', 'Canada', 'Finance', 'www.careerattcs.com', 'j dgh fdh gfgfhrtyh gfhdth bvnfyh ghgh hfth bn', 'ghfg ghfgh th vghfgh gjhgh ghfh ', 'ghfgh fghrt fght hg tht gvh fg', 'gffghfgh', 'SWEP', '15', 'Bachelor of Applied Science', 'Avestan', 'Construction & Extraction Occupations', 'Full-Time', 2, 1, '2023-07-24 12:32:48', '2023-07-24 12:32:48', 1, 0, 0),
(30, 1, 'xcvx', '1-3 ', '1Lac-3Lac', 'Åland Islands', NULL, 'www.careerattcs.com', 'cfvdsv', 'dfcvcv', 'dfsdfc', 'fsdf', 'Freelance', '26', 'Bachelor of Applied Science', 'Azerbaijani', 'Tally', 'Part-Time', 4, 1, '2023-07-24 12:54:36', '2023-07-24 12:54:36', 1, 0, 0);

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
(1, NULL, 0, 'Factory', 1, '2023-05-20 10:58:59', '2023-05-20 10:58:59', 0),
(2, 'Driver', 1, 'Factory', 1, '2023-05-20 10:59:08', '2023-05-22 05:44:39', 0),
(3, 'Mechanic', 1, 'Factory', 1, '2023-05-22 05:44:32', '2023-05-22 05:44:32', 1),
(4, 'Cleaner', 1, 'Factory', 1, '2023-05-22 05:44:47', '2023-05-22 05:44:47', 0),
(5, 'Receptionist', 1, 'Factory', 1, '2023-05-22 05:44:55', '2023-05-22 05:44:55', 0),
(6, 'Superwiser', 1, 'Factory', 1, '2023-05-22 05:45:07', '2023-05-22 05:45:07', 1),
(7, 'Manager', 1, 'Factory', 1, '2023-05-22 05:45:13', '2023-05-22 05:45:13', 0),
(8, NULL, 0, 'Hospital', 1, '2023-05-22 05:45:20', '2023-05-22 05:45:20', 0),
(9, NULL, 0, 'Hotel', 1, '2023-05-22 05:45:25', '2023-05-22 05:45:25', 0),
(10, 'dfgdfg', 1, 'Factory', 1, '2023-05-24 13:02:32', '2023-05-24 13:02:32', 1),
(11, 'dfgdgfdg', 8, 'Hospital', 1, '2023-05-24 13:02:35', '2023-05-24 13:02:35', 1),
(12, 'fggrtsgsf', 1, 'Factory', 1, '2023-05-24 13:02:40', '2023-05-24 13:02:40', 1),
(13, 'dfgfgfdg', 8, 'Hospital', 1, '2023-05-24 13:02:43', '2023-05-24 13:02:43', 1),
(14, 'ghjhuj', 1, 'Factory', 1, '2023-05-26 05:34:09', '2023-05-26 05:34:09', 1),
(15, 'ghjhgjk', 9, 'Hotel', 1, '2023-05-26 05:34:13', '2023-05-26 05:34:13', 1),
(16, 'ghjh', 9, 'Hotel', 1, '2023-05-26 05:34:17', '2023-05-26 05:34:17', 1),
(17, 'hjhk', 1, 'Factory', 1, '2023-05-26 05:34:20', '2023-05-26 05:34:20', 1),
(18, 'hjh', 1, 'Factory', 1, '2023-05-26 05:34:26', '2023-05-26 05:34:26', 1),
(19, 'fcgf', 1, 'Factory', 1, '2023-05-26 05:34:31', '2023-05-26 05:34:31', 1),
(20, 'Flower', 1, 'Factory', 1, '2023-05-26 05:34:49', '2023-05-26 05:34:49', 1),
(21, 'anmol', 9, 'Hotel', 1, '2023-05-26 05:35:04', '2023-05-26 05:35:04', 1),
(22, 'yujhjhjkh', 8, 'Hospital', 1, '2023-05-26 05:39:31', '2023-05-26 05:39:31', 1),
(23, 'hjkhjkhjk', 8, 'Hospital', 1, '2023-05-26 05:39:35', '2023-05-26 05:39:35', 1),
(24, 'jhkhkhkhkhk', 8, 'Hospital', 1, '2023-05-26 05:39:38', '2023-05-26 05:39:38', 1),
(25, 'jhkhjkjk', 1, 'Factory', 1, '2023-05-26 05:39:42', '2023-05-26 05:39:42', 1),
(26, NULL, 0, 'Remote', 1, '2023-05-26 05:39:50', '2023-06-05 06:24:52', 0),
(27, NULL, 0, 'Development ', 1, '2023-05-26 07:29:24', '2023-05-26 07:29:39', 0),
(28, 'Frontend Developer', 27, 'Development ', 1, '2023-05-26 07:29:50', '2023-05-26 07:29:50', 0),
(29, NULL, 0, 'developmentf', 1, '2023-05-27 07:00:49', '2023-05-27 09:57:32', 0),
(30, 'frontend developer', 1, 'Factory', 1, '2023-05-27 07:02:27', '2023-05-27 07:02:27', 1),
(32, NULL, 0, 'IT', 1, '2023-05-27 10:02:36', '2023-06-20 09:30:04', 0),
(33, 'cloths', 1, 'Factory', 1, '2023-06-05 06:24:22', '2023-06-05 06:24:22', 0),
(34, 'clothshh', 1, 'Factory', 1, '2023-06-20 09:29:52', '2023-06-20 09:29:52', 1),
(35, NULL, 0, 'Fashion', 1, '2023-06-20 09:30:07', '2023-06-20 09:30:16', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_interviews`
--

INSERT INTO `job_interviews` (`id`, `job_id`, `employee_id`, `interview_date`, `is_reschedule`, `is_active`, `status`, `created_at`, `created_by_admin`, `updated_at`) VALUES
(1, 7, 8, '2023-05-27', 1, 0, 'PENDING', '2023-05-27 05:37:49', 1, '2023-05-27 05:37:49'),
(2, 3, 6, '2023-05-28', 1, 0, 'PENDING', '2023-05-27 05:37:56', 1, '2023-05-27 05:37:56'),
(3, 7, 5, '2023-05-27', 1, 0, 'PENDING', '2023-05-27 05:38:18', 1, '2023-05-27 05:38:18'),
(4, 7, 5, '2023-05-27', 1, 0, 'COMPLETE', '2023-05-27 05:38:25', 1, '2023-05-27 05:38:25'),
(5, 11, 12, '2023-06-07', 1, 0, 'PENDING', '2023-06-05 06:21:42', 1, '2023-06-05 06:21:42'),
(6, 7, 8, '2023-05-27', 1, 0, 'COMPLETE', '2023-06-05 06:23:02', 1, '2023-06-05 06:23:02'),
(7, 4, 12, '2023-06-29', 1, 0, 'PENDING', '2023-06-05 10:58:22', 3, '2023-06-05 10:58:22'),
(8, 4, 6, '2023-06-29', 0, 1, 'COMPLETE', '2023-06-05 11:44:27', 3, '2023-06-05 11:44:27'),
(9, 7, 22, '2023-06-29', 1, 0, 'PENDING', '2023-06-05 11:45:15', 3, '2023-06-05 11:45:15'),
(10, 7, 12, '2023-06-29', 1, 0, 'PENDING', '2023-06-05 11:47:42', 3, '2023-06-05 11:47:42'),
(11, 7, 8, '2023-06-29', 0, 1, 'COMPLETE', '2023-06-05 11:48:07', 3, '2023-06-05 11:48:07'),
(12, 7, 12, '2023-06-29', 1, 0, 'COMPLETE', '2023-06-05 11:49:27', 3, '2023-06-05 11:49:27'),
(13, 7, 12, '2023-06-29', 1, 0, 'PENDING', '2023-06-05 11:49:34', 3, '2023-06-05 11:49:34'),
(14, 7, 5, '2023-06-16', 1, 0, 'PENDING', '2023-06-05 12:41:16', 3, '2023-06-05 12:41:16'),
(15, 4, 8, '2023-06-29', 1, 0, 'PENDING', '2023-06-06 04:25:58', 3, '2023-06-06 04:25:58'),
(16, 7, 5, '2023-06-17', 1, 0, 'PENDING', '2023-06-06 05:32:58', 3, '2023-06-06 05:32:58'),
(17, 7, 5, '2023-06-23', 1, 0, 'PENDING', '2023-06-06 05:33:56', 3, '2023-06-06 05:33:56'),
(18, 4, 12, '2023-06-29', 1, 0, 'PENDING', '2023-06-06 05:35:11', 3, '2023-06-06 05:35:11'),
(19, 4, 12, '2023-06-08', 1, 0, 'PENDING', '2023-06-06 05:35:28', 3, '2023-06-06 05:35:28'),
(20, 4, 12, '2023-06-08', 1, 0, 'PENDING', '2023-06-06 05:35:36', 3, '2023-06-06 05:35:36'),
(21, 4, 12, '2023-06-08', 1, 0, 'PENDING', '2023-06-06 05:35:45', 3, '2023-06-06 05:35:45'),
(22, 7, 3, '2023-06-07', 1, 0, 'PENDING', '2023-06-06 05:41:54', 3, '2023-06-06 05:41:54'),
(23, 7, 3, '2023-06-29', 1, 0, 'PENDING', '2023-06-06 05:43:44', 3, '2023-06-06 05:43:44'),
(24, 4, 8, '2023-06-07', 1, 0, 'PENDING', '2023-06-06 05:44:55', 3, '2023-06-06 05:44:55'),
(25, 4, 8, '2023-06-29', 1, 0, 'PENDING', '2023-06-06 05:45:05', 3, '2023-06-06 05:45:05'),
(26, 4, 12, '2023-06-09', 1, 0, 'PENDING', '2023-06-06 05:45:25', 3, '2023-06-06 05:45:25'),
(27, 4, 22, '2023-06-23', 1, 0, 'PENDING', '2023-06-06 05:48:20', 3, '2023-06-06 05:48:20'),
(28, 4, 8, '2023-06-08', 1, 0, 'PENDING', '2023-06-06 05:52:02', 3, '2023-06-06 05:52:02'),
(29, 4, 22, '2023-06-08', 0, 1, 'COMPLETE', '2023-06-06 05:52:45', 3, '2023-06-06 05:52:45'),
(30, 4, 8, '2023-06-09', 1, 0, 'PENDING', '2023-06-06 05:53:34', 3, '2023-06-06 05:53:34'),
(31, 4, 12, '2023-06-29', 1, 0, 'PENDING', '2023-06-06 05:55:42', 3, '2023-06-06 05:55:42'),
(32, 4, 12, '2023-06-08', 1, 0, 'PENDING', '2023-06-06 06:02:50', 3, '2023-06-06 06:02:50'),
(33, 4, 12, '2023-06-08', 0, 1, 'COMPLETE', '2023-06-06 06:05:49', 3, '2023-06-06 06:05:49'),
(34, 4, 8, '2023-06-29', 0, 1, 'COMPLETE', '2023-06-06 06:06:55', 3, '2023-06-06 06:06:55'),
(35, 7, 5, '2023-06-16', 1, 0, 'PENDING', '2023-06-06 06:25:48', 3, '2023-06-06 06:25:48'),
(36, 7, 3, '2023-06-24', 1, 0, 'PENDING', '2023-06-06 06:25:54', 3, '2023-06-06 06:25:54'),
(37, 7, 3, '2023-06-17', 1, 0, 'PENDING', '2023-06-06 06:25:59', 3, '2023-06-06 06:25:59'),
(38, 7, 3, '2023-06-24', 1, 0, 'PENDING', '2023-06-06 06:27:18', 3, '2023-06-06 06:27:18'),
(39, 7, 3, '2023-06-14', 1, 0, 'PENDING', '2023-06-06 06:41:38', 3, '2023-06-06 06:41:38'),
(40, 7, 22, '2023-06-07', 1, 0, 'PENDING', '2023-06-06 06:41:53', 3, '2023-06-06 06:41:53'),
(41, 7, 12, '2023-06-17', 1, 0, 'PENDING', '2023-06-06 06:42:11', 3, '2023-06-06 06:42:11'),
(42, 7, 22, '2023-06-09', 1, 0, 'PENDING', '2023-06-06 06:43:08', 3, '2023-06-06 06:43:08'),
(43, 7, 22, '2023-06-17', 1, 0, 'PENDING', '2023-06-06 06:43:26', 3, '2023-06-06 06:43:26'),
(44, 7, 5, '2023-06-10', 1, 0, 'PENDING', '2023-06-06 06:44:21', 3, '2023-06-06 06:44:21'),
(45, 7, 3, '2023-06-09', 1, 0, 'PENDING', '2023-06-06 06:44:30', 3, '2023-06-06 06:44:30'),
(46, 7, 3, '2023-06-23', 1, 0, 'PENDING', '2023-06-06 06:45:11', 3, '2023-06-06 06:45:11'),
(47, 7, 12, '2023-06-08', 1, 0, 'PENDING', '2023-06-06 06:45:24', 3, '2023-06-06 06:45:24'),
(48, 7, 5, '2023-06-08', 1, 0, 'PENDING', '2023-06-06 06:45:36', 3, '2023-06-06 06:45:36'),
(49, 7, 12, '2023-06-17', 1, 0, 'PENDING', '2023-06-06 06:45:40', 3, '2023-06-06 06:45:40'),
(50, 7, 3, '2023-06-09', 0, 1, 'PENDING', '2023-06-06 06:47:08', 3, '2023-06-06 06:47:08'),
(51, 7, 22, '2023-07-05', 0, 1, 'PENDING', '2023-06-06 06:47:29', 3, '2023-06-06 06:47:29'),
(52, 20, 26, '2023-06-12', 1, 0, 'PENDING', '2023-06-12 10:44:52', 1, '2023-06-12 10:44:52'),
(53, 20, 26, '2023-06-13', 1, 0, 'PENDING', '2023-06-12 10:46:38', 1, '2023-06-12 10:46:38'),
(54, 19, 26, '2023-06-14', 1, 0, 'PENDING', '2023-06-12 10:48:24', 1, '2023-06-12 10:48:24'),
(55, 20, 26, '2023-06-12', 1, 0, 'PENDING', '2023-06-12 10:56:55', 1, '2023-06-12 10:56:55'),
(56, 20, 26, '2023-06-13', 1, 0, 'PENDING', '2023-06-12 11:12:48', 1, '2023-06-12 11:12:48'),
(57, 20, 26, '2023-06-12', 1, 0, 'PENDING', '2023-06-12 11:14:19', 1, '2023-06-12 11:14:19'),
(58, 19, 26, '2023-06-13', 1, 0, 'PENDING', '2023-06-12 11:15:10', 1, '2023-06-12 11:15:10'),
(59, 19, 26, '2023-06-14', 1, 0, 'PENDING', '2023-06-12 11:24:41', 1, '2023-06-12 11:24:41'),
(60, 19, 26, '2023-06-13', 1, 0, 'PENDING', '2023-06-12 11:54:11', 1, '2023-06-12 11:54:11'),
(61, 19, 26, '2023-06-12', 1, 0, 'PENDING', '2023-06-12 11:55:45', 1, '2023-06-12 11:55:45'),
(62, 20, 26, '2023-06-13', 1, 0, 'PENDING', '2023-06-12 12:01:58', 1, '2023-06-12 12:01:58'),
(63, 19, 26, '2023-06-13', 1, 0, 'PENDING', '2023-06-12 12:05:15', 1, '2023-06-12 12:05:15'),
(64, 20, 26, '2023-06-12', 1, 0, 'PENDING', '2023-06-12 12:12:11', 1, '2023-06-12 12:12:11'),
(65, 19, 26, '2023-06-12', 1, 0, 'PENDING', '2023-06-12 12:15:37', 1, '2023-06-12 12:15:37'),
(66, 20, 26, '2023-06-13', 0, 1, 'PENDING', '2023-06-12 12:20:14', 1, '2023-06-12 12:20:14'),
(67, 7, 5, '2023-06-08', 1, 0, 'PENDING', '2023-06-20 08:36:32', 1, '2023-06-20 08:36:32'),
(68, 7, 5, '2023-06-08', 1, 0, 'PENDING', '2023-06-20 08:36:44', 1, '2023-06-20 08:36:44'),
(69, 21, 27, '2023-06-21', 1, 0, 'PENDING', '2023-06-20 09:21:12', 1, '2023-06-20 09:21:12'),
(70, 3, 6, '2023-06-20', 1, 0, 'PENDING', '2023-06-20 09:25:20', 1, '2023-06-20 09:25:20'),
(71, 7, 5, '2023-06-20', 0, 1, 'COMPLETE', '2023-06-20 09:25:30', 1, '2023-06-20 09:25:30'),
(72, 11, 12, '2023-06-07', 0, 1, 'COMPLETE', '2023-06-20 09:25:45', 1, '2023-06-20 09:25:45'),
(73, 21, 27, '2023-06-21', 0, 1, 'COMPLETE', '2023-06-20 10:04:14', 1, '2023-06-20 10:04:14'),
(74, 7, 12, '2023-06-20', 1, 0, 'PENDING', '2023-06-20 10:05:16', 1, '2023-06-20 10:05:16'),
(75, 3, 6, '2023-06-20', 1, 0, 'PENDING', '2023-06-20 10:07:41', 1, '2023-06-20 10:07:41'),
(76, 7, 12, '2023-06-20', 0, 1, 'COMPLETE', '2023-06-20 10:07:47', 1, '2023-06-20 10:07:47'),
(77, 3, 6, '2023-06-20', 1, 0, 'PENDING', '2023-06-20 10:10:20', 1, '2023-06-20 10:10:20'),
(78, 3, 6, '2023-06-20', 0, 1, 'COMPLETE', '2023-06-20 10:10:28', 1, '2023-06-20 10:10:28'),
(79, 19, 26, '2023-06-12', 0, 1, 'COMPLETE', '2023-06-20 10:26:18', 1, '2023-06-20 10:26:18'),
(80, 4, 27, '2023-07-25', 0, 1, 'PENDING', '2023-07-24 11:08:42', 1, '2023-07-24 11:08:42');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `list`
--

INSERT INTO `list` (`id`, `item_name`, `json`, `created_at`, `updated_at`) VALUES
(1, 'Skill', '{\"1\": \"Sales, Retail, & Customer Support Occupations\", \"2\": \"Healthcare Occupations\", \"3\": \"Organization Operations & Administrative Occupations\", \"4\": \"Food & Beverage Occupations\", \"5\": \"Technology Occupations\", \"6\": \"Finance & Accounting Occupations\", \"7\": \"Repair, Maintenance & Installation Occupations\", \"8\": \"Architecture & Engineering Occupations\", \"9\": \"Construction & Extraction Occupations\", \"10\": \"Supply Chain & Logistics Occupations\", \"11\": \"Manufacturing & Utilities Occupations\", \"12\": \"Marketing, Advertising & Public Relations Occupations\", \"13\": \"Community & Social Services Occupations\", \"14\": \"Education & Instruction Occupations\", \"15\": \"Transportation Occupations\", \"16\": \"Science & Research Occupations\", \"17\": \"Cleaning & Grounds Maintenance Occupations\", \"18\": \"Media, Arts & Design Occupations\", \"19\": \"Safety, Security & Civil Defence Occupations\", \"20\": \"Personal Service Occupations\", \"21\": \"Travel, Attractions & Events Occupations\", \"22\": \"Legal Occupations\", \"23\": \"Farming, Fisheries & Forestry Occupations \", \"24\": \"Other\", \"25\": \"JavaScript\", \"26\": \"Html\", \"27\": \"Css\", \"28\": \"Bootstrap\", \"29\": \"Typing\", \"30\": \"React js\", \"31\": \"Tally\"}', '2023-04-18 05:52:56', '2023-06-20 09:31:45'),
(2, 'Category', '{\"2\": \"Driver\", \"4\": \"Cleaner\", \"5\": \"Receptionist\", \"7\": \"Manager\", \"28\": \"Frontend Developer\", \"33\": \"cloths\", \"34\": \"clothshh\"}', '2023-04-18 09:02:44', '2023-06-20 09:29:52'),
(3, 'Location', '{}', '2023-04-18 09:03:51', '2023-04-20 12:38:47'),
(4, 'Industry', '{\"1\": \"Retail & Wholesale\", \"2\": \"Healthcare\", \"3\": \"Manufacturing\", \"4\": \"Construction, Repair & Maintenance Services\", \"5\": \"Restaurants & Food Service\", \"6\": \"Finance\", \"7\": \"Human Resources & Staffing\", \"8\": \"Transportation & Logistics\", \"9\": \"Information Technology\", \"10\": \"Energy, Mining, Utilities\", \"11\": \"Management & Consulting\", \"12\": \"Non-profit & NGO\", \"13\": \"Education\", \"14\": \"Insurance\", \"15\": \"Government & Public Administration\", \"16\": \"Telecommunications\", \"17\": \"Aerospace & Defence\", \"18\": \"Hotel & Travel Accommodation\", \"19\": \"Agriculture\", \"20\": \"Legal\", \"21\": \"Real Estate\", \"22\": \"Media & Communication\", \"23\": \"Arts, Entertainment & Recreation\", \"24\": \"Pharmaceutical & Biotechnology\", \"25\": \"Personal Consumer Services\", \"26\": \"Other\"}', '2023-04-18 09:04:56', '2023-05-15 11:18:30'),
(5, 'Education', '{\"1\": \"Bachelor of Liberal Arts\", \"2\": \"Bachelor of Arts\", \"3\": \"Bachelor of Liberal Arts\", \"4\": \"Alternate Entry Master of Science in Nursing\", \"5\": \"Master of Liberal Arts\", \"6\": \"Bachelor of Arts\", \"7\": \"Bachelor of Applied Arts\", \"8\": \"Bachelor of Applied Arts and Sciences\", \"9\": \"Bachelor of Arts in Communication\", \"10\": \"Bachelor of Aerospace Engineering\", \"11\": \"Bachelor of Arts and Economics\", \"12\": \"Bachelor of Economics\", \"13\": \"Bachelor of Arts in Education\", \"14\": \"Bachelor of Applied Studies\", \"15\": \"Bachelor of Applied Science\", \"16\": \"Bachelor of Architectural Studies\", \"17\": \"Bachelor of Applied Science\", \"18\": \"Bachelor of Art & Technology\", \"19\": \"Bachelor of Applied Technology\", \"20\": \"Bachelor of Accountancy\", \"21\": \"Bachelor of Agricultural Science\", \"22\": \"Bachelor of Applied Finance\", \"23\": \"Bachelor of Applied Science\", \"24\": \"Bachelor of Architecture\", \"25\": \"Bachelor of Asian Studies\", \"26\": \"Bachelor of Business Analysis - Financial\", \"27\": \"Bachelor of Business Administration\", \"28\": \"Bachelor of Built Environment\", \"29\": \"Bachelor of Biosystems Engineering\", \"30\": \"Bachelor of Behavioural Neuroscience\", \"31\": \"Bachelor of Business\", \"32\": \"Bachelor of Commerce and Administration\", \"33\": \"Bachelor of Civil Engineering\", \"34\": \"Bachelor of Computer Information Systems\", \"35\": \"Bachelor of Criminal Justice\", \"36\": \"Bachelor of Computer and Mathematical Sciences\", \"37\": \"Bachelor of Computing & Mathematical Sciences\", \"38\": \"Bachelor of Surgery\", \"39\": \"Bachelor of Chemical Engineering\", \"40\": \"Bachelor of Commerce\", \"41\": \"Bachelor of Commerce\", \"42\": \"Bachelor of Communication\", \"43\": \"Bachelor of Computing\", \"44\": \"Bachelor of Computer Operations Technology\", \"45\": \"Bachelor of Communications Studies\", \"46\": \"Bachelor of Design\", \"47\": \"Bachelor of Engineering\", \"48\": \"Bachelor of Electrical Engineering\", \"49\": \"Bachelor of Electronics Engineering Technology\", \"50\": \"Bachelor of Environmental Studies\", \"51\": \"Bachelor of Economics\", \"52\": \"Bachelor of Finance & Economics\", \"53\": \"Bachelor of Economic Science\", \"54\": \"Bachelor of Education\", \"55\": \"Bachelor of Environmental Design\", \"56\": \"Bachelor of Engineering\", \"57\": \"Bachelor of Fine Arts\", \"58\": \"Bachelor of Finance\", \"59\": \"Bachelor of General Studies\", \"60\": \"Bachelor of Game & Simulation Programming\", \"61\": \"Bachelor of Humanities and Arts\", \"62\": \"Bachelor of Hotel Management\", \"63\": \"Bachelor of Health Science\", \"64\": \"Bachelor of Health Sciences\", \"65\": \"Bachelor of Interior Architecture\", \"66\": \"Bachelor of Integrated Studies\", \"67\": \"Bachelor of Interdisciplinary Studies\", \"68\": \"Bachelor of Industrial and Science Engineering\", \"69\": \"Bachelor of Information Technology\", \"70\": \"Bachelor of Industrial Design\", \"71\": \"Bachelor of Information Science\", \"72\": \"Bachelor of Information Technology\", \"73\": \"Bachelor of International Studies\", \"74\": \"Bachelor of Journalism\", \"75\": \"Bachelor of Liberal Arts\", \"76\": \"Bachelor of Landscape Architecture\", \"77\": \"Bachelor of Liberal Studies\", \"78\": \"Bachelor of Languages\", \"79\": \"Bachelor of Music\", \"80\": \"Bachelor of Mechanical Engineering\", \"81\": \"Bachelor of Music Education\", \"82\": \"Bachelor of Materials Engineering\", \"83\": \"Bachelor of Music\", \"84\": \"Bachelor of Public Affairs\", \"85\": \"Bachelor of Polymer and Fiber Engineering\", \"86\": \"Bachelor of Professional Health Science\", \"87\": \"Bachelor of Science\", \"88\": \"Bachelor of Science in Aerospace Engineering\", \"89\": \"Bachelor of Science in Business Administration\", \"90\": \"Bachelor of Science in Biomedical Engineering\", \"91\": \"Bachelor of Science in Commerce Business Administration\", \"92\": \"Bachelor of Science in Civil Engineering\", \"93\": \"Bachelor of Science in Computer & Information Sciences\", \"94\": \"Bachelor of Science in Computer Science\", \"95\": \"Bachelor of Science in Computer Technology\", \"96\": \"Bachelor of Science in Chemical Engineering\", \"97\": \"Bachelor of Science in Chemistry\", \"98\": \"Bachelor of Science in Engineering\", \"99\": \"Bachelor of Science in Electrical Engineering\", \"100\": \"Bachelor of Science in Engineering Technology\", \"101\": \"Bachelor of Science in Education\", \"102\": \"Bachelor of Science in Geology\", \"103\": \"Bachelor of Science in Human Environmental Sciences\", \"104\": \"Bachelor of Science in Mechanical Engineering\", \"105\": \"Bachelor of Science in Manufacturing Engineering Technology\", \"106\": \"Bachelor of Science in Metallurgical Engineering\", \"107\": \"Bachelor of Science in Microbiology\", \"108\": \"Bachelor of Science in Materials Engineering\", \"109\": \"Bachelor of Science in Nursing\", \"110\": \"Bachelor of Science in Social Work\", \"111\": \"Bachelor of Social Work\", \"112\": \"Bachelor of Software Engineering\", \"113\": \"Bachelor of Textile Engineering\", \"114\": \"Bachelor of Technical & Interdisciplinary Studies\", \"115\": \"Bachelor of Textile Management and Technology\", \"116\": \"Bachelor of Wireless Engineering\", \"117\": \"Bachelor of Arts\", \"118\": \"Bachelor of Economics\", \"119\": \"Bachelor of Education\", \"120\": \"Bachelor of Arts and Economics\", \"121\": \"Bachelor of Journalism\", \"122\": \"Bachelor of Architecture\", \"123\": \"Bachelor of Applied Science\", \"124\": \"Bachelor of Applied Studies\", \"125\": \"Bachelor of Applied Science\", \"126\": \"Bachelor of Arts for Teaching\", \"127\": \"Bachelor of Aviation\", \"128\": \"Bachelor of Biomedical Science\", \"129\": \"Bachelor of Business Information Systems\", \"130\": \"Bachelor of Surgery\", \"131\": \"Bachelor of Surgery\", \"132\": \"Bachelor of Dental Surgery\", \"133\": \"Bachelor of Surgery Degree\", \"134\": \"Bachelor of Civil Law\", \"135\": \"Bachelor of Counseling\", \"136\": \"Bachelor of Divinity\", \"137\": \"Bachelor of Divisionnity\", \"138\": \"Bachelor of Design\", \"139\": \"Bachelor of Dental Surgery\", \"140\": \"Bachelor of Dental Science\", \"141\": \"Bachelor of Engineering\", \"142\": \"Bachelor of Economics\", \"143\": \"Bachelor of Economics and Finance\", \"144\": \"Bachelor of Science in Education\", \"145\": \"Bachelor of Engineering\", \"146\": \"Bachelor of Fine Arts\", \"147\": \"Bachelor of Finance\", \"148\": \"Bachelor of General Studies\", \"149\": \"Bachelor of Health & Physical Education\", \"150\": \"Bachelor of Health Science\", \"151\": \"Bachelor of Health Science\", \"152\": \"bachelor of hygiene\", \"153\": \"Bachelor of Information and Communications Technology\", \"154\": \"Bachelor of Integrated Studies\", \"155\": \"Bachelor of Journalism\", \"156\": \"Bachelor of Kinesiology\", \"157\": \"Bachelor of Liberal Arts\", \"158\": \"Bachelor of Landscape Architecture\", \"159\": \"Bachelor of Music (degree)\", \"160\": \"Bachelor of Medicine\", \"161\": \"Bachelor of Biomedical science\", \"162\": \"Bachelor of Medical Science\", \"163\": \"Bachelor of Medical Science\", \"164\": \"Bachelor of Midwifery\", \"165\": \"Bachelor of Ministry\", \"166\": \"Bachelor of Medical Science\", \"167\": \"Bachelor of Biomedical science\", \"168\": \"Bachelor of Medical Science\", \"169\": \"Bachelor of Music\", \"170\": \"Bachelor of Nursing\", \"171\": \"Bachelor of Nursing Science\", \"172\": \"Bachelor of Nursing\", \"173\": \"Bachelor of Physical Education\", \"174\": \"Bachelor of Pharmacy\", \"175\": \"Bachelor of Philosophy\", \"176\": \"bachelor of public health nursing\", \"177\": \"Bachelor of Professional Studies\", \"178\": \"Bachelor of Religious Education\", \"179\": \"Bachelor of Religious Studies\", \"180\": \"Bachelor of Science (clear in education line)\", \"181\": \"Bachelor of Science in Education\", \"182\": \"Bachelor of Science in Business Administration\", \"183\": \"Bachelor of Science (university degree)\", \"184\": \"Bachelor of Science and/with Education\", \"185\": \"Bachelor of Science in Economics\", \"186\": \"Bachelor of Science in Engineering\", \"187\": \"Bachelor of Science in Psychology\", \"188\": \"Bachelor of Nursing Science\", \"189\": \"Bachelor of Science in Education\", \"190\": \"Bachelor of Science in Engineering\", \"191\": \"Bachelor of Science in Education\", \"192\": \"Bachelor of Science in Environmental Health\", \"193\": \"Bachelor of Science in Engineering Technology\", \"194\": \"Bachelor of Science in Family and Consumer Sciences\", \"195\": \"Bachelor of Science in General Studies\", \"196\": \"Bachelor of Journalism\", \"197\": \"Bachelor of Science in Law\", \"198\": \"Bachelor of Science in Medicine\", \"199\": \"Bachelor of Science in Nursing\", \"200\": \"Bachelor of Science in Nuclear Engineering\", \"201\": \"Bachelor of Social Science\", \"202\": \"Bachelor of Science in Public Health\", \"203\": \"Bachelor of Social Work\", \"204\": \"Bachelor of Teaching\", \"205\": \"Bachelor of Technology\", \"206\": \"Bachelor of Theology\", \"207\": \"Bachelor of Theology\", \"208\": \"Bachelor of Veterinary Medicine\", \"209\": \"Bachelor of Veterinary Medicine and Science\", \"210\": \"Bachelor of Surgery\", \"211\": \"Bachelor of Surgery\", \"212\": \"Master in Surgery\", \"213\": \"Bachelor of Education\", \"214\": \"Master of Laws\", \"215\": \"Legum Baccalaureus (Latin: Bachelor Of Laws)\", \"216\": \"Master of Laws\", \"217\": \"Licensed Master of Social Work\", \"218\": \"Master of Arts in Education\", \"219\": \"Master of Education\", \"220\": \"Master of Fine Arts\", \"221\": \"Master of Interdisciplinary Studies\", \"222\": \"Master of Library and Information Science\", \"223\": \"Master of Ministry\", \"224\": \"Master of Music\", \"225\": \"Master of Occupational Therapy\", \"226\": \"Master of Science in Engineering Technology\", \"227\": \"Master of Science in Education\", \"228\": \"Master of Science in Nursing\", \"229\": \"Master of Social Work\", \"230\": \"Master of Urban Planning\", \"231\": \"Master of Arts\", \"232\": \"Master of Arts in Education\", \"233\": \"Master of Applied Anthropology\", \"234\": \"Master of Accountancy\", \"235\": \"Master of Arts in Christian Education\", \"236\": \"Master of Accountancy\", \"237\": \"Master of Arts in international economics and finance\", \"238\": \"Master of Arts in International Hotel Management\", \"239\": \"Master of Arts in Liberal Studies\", \"240\": \"Master of Arts Management\", \"241\": \"Master of Arts in Public Service\", \"242\": \"Master of Arts in Professional Writing\", \"243\": \"Master of Architecture\", \"244\": \"Master of Archival Studies\", \"245\": \"Master of Engineering\", \"246\": \"Master of Applied Sciences\", \"247\": \"Master of Arts and Teaching\", \"248\": \"Bachelor of Medicine\", \"249\": \"Master of Business Administration\", \"250\": \"Medicinae Baccalaureus, Baccalaureus Chirurgiae (Latin: Bachelor of Medicine, Bachelor of Surgery)\", \"251\": \"Master of Biochemistry\", \"252\": \"Master of Biology\", \"253\": \"Master of Biological Science\", \"254\": \"Master of Surgery\", \"255\": \"Master of Surgery\", \"256\": \"Master of Chemistry\", \"257\": \"Master of Criminal Justice\", \"258\": \"Master of Clinical Dentistry\", \"259\": \"Master of Clinical Medical Science\", \"260\": \"Master of Divisionnity\", \"261\": \"Master of Divinity\", \"262\": \"Master of Digital Media\", \"263\": \"Master of Drama\", \"264\": \"Master of Dental Surgery\", \"265\": \"Master of Engineering\", \"266\": \"Master of Electronic Business\", \"267\": \"Master of Economics\", \"268\": \"Master of Education\", \"269\": \"Master of Environmental Design\", \"270\": \"Master of Engineering\", \"271\": \"Master of Environmental Science\", \"272\": \"Master of Environmental Studies\", \"273\": \"Master of Earth Science\", \"274\": \"Master of Educational Technology\", \"275\": \"Master of Fine Art\", \"276\": \"Master of Forensic Sciences\", \"277\": \"Master of Geography\", \"278\": \"Master of Geology\", \"279\": \"Master of Geophysics\", \"280\": \"Master of Health Administration\", \"281\": \"Master of Health Education\", \"282\": \"Master of Health Science\", \"283\": \"Master of Industrial Design\", \"284\": \"Master of International Development\", \"285\": \"Master of Management in the Network Economy\", \"286\": \"Master of Informatics\", \"287\": \"Master of Engineering\", \"288\": \"Master of Information Systems Management\", \"289\": \"Master of Jurisprudence\", \"290\": \"Master of Labor and Human Resources\", \"291\": \"Master of Librarianship\", \"292\": \"Master of Library and Information Science degree\", \"293\": \"Master of Letters\", \"294\": \"Master of Library Science\", \"295\": \"Master of Liberal Studies\", \"296\": \"Master of Music\", \"297\": \"Master of Mathematics\", \"298\": \"Master of Mathematics and Physics\", \"299\": \"Master of Mass Communications\", \"300\": \"Master of Music Education\", \"301\": \"Master of Ministry\", \"302\": \"Master of Mathematics, Operational Research, Statistics and Economics\", \"303\": \"Master of Marketing Research\", \"304\": \"Master of Medical Science\", \"305\": \"Master of Medical Science\", \"306\": \"Master of Management Sciences\", \"307\": \"Master of Music\", \"308\": \"Master of Nursing\", \"309\": \"Master of Natural Science\", \"310\": \"Master of Science in Nursing\", \"311\": \"Master of Nursing Science\", \"312\": \"Master of Oceanography\", \"313\": \"Master of Occupational Therapy\", \"314\": \"Master of Pharmacy Administration\", \"315\": \"Master of Public Administration\", \"316\": \"Master of Professional Accountancy\", \"317\": \"Master of Physician Assistant Studies\", \"318\": \"Master of Pharmacy\", \"319\": \"Master of Public Health\", \"320\": \"master of pharmacy\", \"321\": \"Master of Philosophy\", \"322\": \"Master of Physics\", \"323\": \"Master of Pacific International Affairs\", \"324\": \"Master of Planning\", \"325\": \"Master of Project Management\", \"326\": \"Master of Public Management\", \"327\": \"Master of Public Policy\", \"328\": \"Master of Professional Studies\", \"329\": \"Master of Professional Studies\", \"330\": \"Master of Physical Therapy\", \"331\": \"Master of Radiology\", \"332\": \"Master of Research\", \"333\": \"Master of Science\", \"334\": \"Master of Surgery\", \"335\": \"Master of Science in Education\", \"336\": \"Master of Surgery\", \"337\": \"Master of Science\", \"338\": \"Master in Science\", \"339\": \"Master of Science in Dentistry\", \"340\": \"Master of Science in Engineering\", \"341\": \"Master of Science in Electrical Engineering\", \"342\": \"Master of Science in Environmental Health\", \"343\": \"Master of Science in Finance\", \"344\": \"Master of Science in Information\", \"345\": \"Master of Science in Information Systems\", \"346\": \"Master of Science in Information Studies\", \"347\": \"Master of Criminal Justice\", \"348\": \"Master of Science in Library Science\", \"349\": \"Master of Sacred Music\", \"350\": \"Master Of Science In Nursing\", \"351\": \"Master of Science in Natural Sciences\", \"352\": \"Master of Social Science\", \"353\": \"Master of Science In Organizational Leadership\", \"354\": \"Master of Science in Public Health\", \"355\": \"Master of Social Science\", \"356\": \"Master of Science in Strategic Leadership\", \"357\": \"Master of Science in Social Work\", \"358\": \"Master of Studies\", \"359\": \"Master of Science in Taxation\", \"360\": \"Master of Statistics\", \"361\": \"Master of Surgery\", \"362\": \"Master of Social Work\", \"363\": \"Master of Theology\", \"364\": \"Master of Theology\", \"365\": \"Master of the University\", \"366\": \"Master of Urban Studies\", \"367\": \"Master of Urban and Regional Planning\", \"368\": \"Bachelor of Music\", \"369\": \"Master of Music\", \"370\": \"Post Master\'s Graduate Certificate\", \"371\": \"Bachelor of Science\", \"372\": \"Scientiar Baccalaureus, Bachelor of Science\", \"373\": \"Master of Surgery\", \"374\": \"Master of Theology\", \"375\": \"Bachelor of Theology\", \"376\": \"Master of Theology\", \"379\": \"Other\", \"380\": \"10th\", \"381\": \"12th\", \"382\": \"PCM\", \"383\": \"PCB\", \"384\": \"Commerce\", \"385\": \"Arts\"}', '2023-04-18 09:05:35', '2023-06-05 05:25:45'),
(6, 'Corporation', '{\"1\": \"B2B\", \"2\": \"B2C\", \"3\": \"C2C\", \"4\": \"B2G\", \"5\": \"G2C\", \"6\": \"G2B\", \"7\": \"Other\"}', '2023-04-18 09:06:14', '2023-05-19 09:36:40'),
(7, 'Language', '{\"1\": \"Abkhaz\", \"2\": \"Afar\", \"3\": \"Afrikaans\", \"4\": \"Akan\", \"5\": \"Albanian\", \"6\": \"Amharic\", \"7\": \"Arabic\", \"8\": \"Aragonese\", \"9\": \"Armenian\", \"10\": \"Assamese\", \"11\": \"Avaric\", \"12\": \"Avestan\", \"13\": \"Aymara\", \"14\": \"Azerbaijani\", \"15\": \"Bambara\", \"16\": \"Bashkir\", \"17\": \"Basque\", \"18\": \"Belarusian\", \"19\": \"Bengali\", \"20\": \"Bihari\", \"21\": \"Bislama\", \"22\": \"Bosnian\", \"23\": \"Breton\", \"24\": \"Bulgarian\", \"25\": \"Burmese\", \"26\": \"Catalan- Valencian\", \"27\": \"Chamorro\", \"28\": \"Chechen\", \"29\": \"Chichewa- Chewa- Nyanja\", \"30\": \"Chinese\", \"31\": \"Chuvash\", \"32\": \"Cornish\", \"33\": \"Corsican\", \"34\": \"Cree\", \"35\": \"Croatian\", \"36\": \"Czech\", \"37\": \"Danish\", \"38\": \"Divehi- Dhivehi- Maldivian-\", \"39\": \"Dutch\", \"40\": \"English\", \"41\": \"Esperanto\", \"42\": \"Estonian\", \"43\": \"Ewe\", \"44\": \"Faroese\", \"45\": \"Fijian\", \"46\": \"Finnish\", \"47\": \"French\", \"48\": \"Fula- Fulah- Pulaar- Pular\", \"49\": \"Galician\", \"50\": \"Georgian\", \"51\": \"German\", \"52\": \"Greek, Modern\", \"53\": \"Guaraní\", \"54\": \"Gujarati\", \"55\": \"Haitian- Haitian Creole\", \"56\": \"Hausa\", \"57\": \"Hebrew (modern)\", \"58\": \"Herero\", \"59\": \"Hindi\", \"60\": \"Hiri Motu\", \"61\": \"Hungarian\", \"62\": \"Interlingua\", \"63\": \"Indonesian\", \"64\": \"Interlingue\", \"65\": \"Irish\", \"66\": \"Igbo\", \"67\": \"Inupiaq\", \"68\": \"Ido\", \"69\": \"Icelandic\", \"70\": \"Italian\", \"71\": \"Inuktitut\", \"72\": \"Japanese\", \"73\": \"Javanese\", \"74\": \"Kalaallisut, Greenlandic\", \"75\": \"Kannada\", \"76\": \"Kanuri\", \"77\": \"Kashmiri\", \"78\": \"Kazakh\", \"79\": \"Khmer\", \"80\": \"Kikuyu, Gikuyu\", \"81\": \"Kinyarwanda\", \"82\": \"Kirghiz, Kyrgyz\", \"83\": \"Komi\", \"84\": \"Kongo\", \"85\": \"Korean\", \"86\": \"Kurdish\", \"87\": \"Kwanyama, Kuanyama\", \"88\": \"Latin\", \"89\": \"Luxembourgish, Letzeburgesch\", \"90\": \"Luganda\", \"91\": \"Limburgish\", \"92\": \"Lingala\", \"93\": \"Lao\", \"94\": \"Lithuanian\", \"95\": \"Luba-Katanga\", \"96\": \"Latvian\", \"97\": \"Manx\", \"98\": \"Macedonian\", \"99\": \"Malagasy\", \"100\": \"Malay\", \"101\": \"Malayalam\", \"102\": \"Maltese\", \"103\": \"Māori\", \"104\": \"Marathi (Marāṭhī)\", \"105\": \"Marshallese\", \"106\": \"Mongolian\", \"107\": \"Nauru\", \"108\": \"Navajo, Navaho\", \"109\": \"Norwegian Bokmål\", \"110\": \"North Ndebele\", \"111\": \"Nepali\", \"112\": \"Ndonga\", \"113\": \"Norwegian Nynorsk\", \"114\": \"Norwegian\", \"115\": \"Nuosu\", \"116\": \"South Ndebele\", \"117\": \"Occitan\", \"118\": \"Ojibwe, Ojibwa\", \"119\": \"Old Church Slavonic\", \"120\": \"Oromo\", \"121\": \"Oriya\", \"122\": \"Ossetian, Ossetic\", \"123\": \"Panjabi, Punjabi\", \"124\": \"Pāli\", \"125\": \"Persian\", \"126\": \"Polish\", \"127\": \"Pashto, Pushto\", \"128\": \"Portuguese\", \"129\": \"Quechua\", \"130\": \"Romansh\", \"131\": \"Kirundi\", \"132\": \"Romanian\", \"133\": \"Russian\", \"134\": \"Sanskrit (Saṁskṛta)\", \"135\": \"Sardinian\", \"136\": \"Sindhi\", \"137\": \"Northern Sami\", \"138\": \"Samoan\", \"139\": \"Sango\", \"140\": \"Serbian\", \"141\": \"Scottish Gaelic- Gaelic\", \"142\": \"Shona\", \"143\": \"Sinhala, Sinhalese\", \"144\": \"Slovak\", \"145\": \"Slovene\", \"146\": \"Somali\", \"147\": \"Southern Sotho\", \"148\": \"Spanish- Castilian\", \"149\": \"Sundanese\", \"150\": \"Swahili\", \"151\": \"Swati\", \"152\": \"Swedish\", \"153\": \"Tamil\", \"154\": \"Telugu\", \"155\": \"Tajik\", \"156\": \"Thai\", \"157\": \"Tigrinya\", \"158\": \"Tibetan Standard, Tibetan, Central\", \"159\": \"Turkmen\", \"160\": \"Tagalog\", \"161\": \"Tswana\", \"162\": \"Tonga (Tonga Islands)\", \"163\": \"Turkish\", \"164\": \"Tsonga\", \"165\": \"Tatar\", \"166\": \"Twi\", \"167\": \"Tahitian\", \"168\": \"Uighur, Uyghur\", \"169\": \"Ukrainian\", \"170\": \"Urdu\", \"171\": \"Uzbek\", \"172\": \"Venda\", \"173\": \"Vietnamese\", \"174\": \"Volapük\", \"175\": \"Walloon\", \"176\": \"Welsh\", \"177\": \"Wolof\", \"178\": \"Western Frisian\", \"179\": \"Xhosa\", \"180\": \"Yiddish\", \"181\": \"Yoruba\", \"182\": \"Zhuang, Chuang\", \"183\": \"Other\"}', '2023-04-18 09:06:36', '2023-05-19 09:31:59'),
(8, 'Category_type', '{\"1\": \"Factory\", \"8\": \"Hospital\", \"9\": \"Hotel\", \"26\": \"Remote\", \"27\": \"Development \", \"29\": \"developmentf\", \"32\": \"IT\", \"35\": \"Fashion\"}', '2023-05-15 11:27:47', '2023-06-20 09:30:16'),
(9, 'degree', '{}', '2023-05-19 09:16:30', '2023-05-19 09:16:30');

-- --------------------------------------------------------

--
-- Table structure for table `lmia`
--

CREATE TABLE `lmia` (
  `id` int(51) NOT NULL,
  `job_id` int(51) NOT NULL,
  `employee_id` int(101) NOT NULL,
  `lmia_status` varchar(51) NOT NULL,
  `expected_time_of_completion` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmia`
--

INSERT INTO `lmia` (`id`, `job_id`, `employee_id`, `lmia_status`, `expected_time_of_completion`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Pending', '2023-05-22', 1, '2023-05-20 11:39:10', '2023-05-20 11:39:21'),
(2, 1, 1, 'Pending', '2023-05-31', 1, '2023-05-22 04:25:54', '2023-05-22 04:25:54'),
(3, 1, 3, 'Draft', '2023-07-31', 1, '2023-05-22 05:49:08', '2023-05-22 05:49:08'),
(4, 2, 2, 'Pending', '2023-05-22', 1, '2023-05-22 12:37:12', '2023-05-22 12:37:12'),
(5, 7, 8, 'Pending', '2023-05-25', 1, '2023-05-26 07:09:43', '2023-05-26 07:09:43'),
(6, 3, 6, 'Draft', '2023-05-25', 1, '2023-05-26 07:14:44', '2023-05-26 07:14:44'),
(7, 6, 6, 'Approved', '2023-05-26', 1, '2023-05-26 07:16:08', '2023-05-26 07:16:08'),
(8, 7, 4, 'Approved', '2023-06-10', 1, '2023-05-26 08:58:23', '2023-05-26 08:58:23'),
(9, 11, 12, 'Pending', '2023-06-05', 1, '2023-06-05 06:21:54', '2023-06-05 06:21:54'),
(10, 4, 6, 'Approved', '2023-06-30', 1, '2023-06-05 10:51:42', '2023-06-05 10:51:42'),
(11, 4, 12, 'Pending', '2023-06-29', 1, '2023-06-05 10:58:06', '2023-06-05 10:58:06'),
(12, 7, 22, 'Reject', '2023-06-30', 1, '2023-06-05 11:45:07', '2023-06-05 11:45:07'),
(13, 7, 12, 'Approved', '2023-06-30', 1, '2023-06-05 11:51:24', '2023-06-05 11:53:37'),
(14, 4, 8, 'Complete', '2023-05-05', 1, '2023-06-06 04:26:17', '2023-06-13 09:41:57'),
(15, 7, 5, 'Complete', '2023-05-05', 1, '2023-06-06 07:03:48', '2023-06-13 08:43:14'),
(16, 22, 27, 'Reject', '2023-06-20', 1, '2023-06-20 08:37:14', '2023-06-20 08:37:14'),
(17, 21, 27, 'Approved', '2023-06-20', 1, '2023-06-20 09:21:20', '2023-06-21 06:00:33'),
(18, 16, 27, 'Draft', '2023-06-21', 1, '2023-06-21 05:24:05', '2023-06-21 05:24:05'),
(19, 4, 27, 'Pending', '2023-07-24', 1, '2023-07-24 11:08:52', '2023-07-24 11:08:52');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `from_id`, `type`, `subject`, `action_id`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 1, 'company', 'added_new_job', 1, 'A new job with title-Delivery boy has been added successfully', 0, '2023-05-20 11:13:38', '2023-05-20 11:13:38'),
(2, 1, 'Super-Admin', 'added_new_job', 1, 'A new job with title-Delivery boy has been added successfully', 1, '2023-05-20 11:13:38', '2023-05-26 12:22:24'),
(3, 1, 'company', 'applied_on_job', 1, 'A new user applied on job with title - Delivery boy', 0, '2023-05-20 11:28:10', '2023-05-20 11:28:10'),
(4, 1, 'Super-Admin', 'applied_on_job', 1, 'A new user applied on job with title - Delivery boy', 1, '2023-05-20 11:28:10', '2023-06-05 06:26:53'),
(5, 2, 'company', 'added_new_job', 2, 'A new job with title-Delivery boy has been added successfully', 0, '2023-05-20 11:34:07', '2023-05-20 11:34:07'),
(6, 1, 'Super-Admin', 'added_new_job', 2, 'A new job with title-Delivery boy has been added successfully', 1, '2023-05-20 11:34:07', '2023-05-26 12:22:18'),
(7, 1, 'employee', 'interview_scheduled', 2, 'hello, Shayam mohan you have interview scheduled on 2023-05-22 for job with title - Delivery boy you have applied on, scheduled with Sanchi', 0, '2023-05-20 11:36:36', '2023-05-20 11:36:36'),
(8, 1, 'Super-Admin', 'interview_scheduled', 2, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-22 for job title Delivery boy posted by company Sanchi', 1, '2023-05-20 11:36:36', '2023-05-25 17:54:58'),
(9, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-23 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-20 11:43:33', '2023-05-20 11:43:33'),
(10, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-23 for job title Delivery boy posted by company Amul ', 1, '2023-05-20 11:43:33', '2023-06-23 05:30:50'),
(11, 3, 'company', 'added_new_job', 3, 'A new job with title-Shop worker has been added successfully', 0, '2023-05-20 12:08:20', '2023-05-20 12:08:20'),
(12, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-23 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 04:17:53', '2023-05-22 04:17:53'),
(13, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-23 for job title Delivery boy posted by company Amul ', 1, '2023-05-22 04:17:53', '2023-05-23 11:44:36'),
(14, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-23 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 04:18:07', '2023-05-22 04:18:07'),
(15, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-23 for job title Delivery boy posted by company Amul ', 1, '2023-05-22 04:18:07', '2023-06-20 08:26:25'),
(16, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-27 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 04:19:09', '2023-05-22 04:19:09'),
(17, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-27 for job title Delivery boy posted by company Amul ', 1, '2023-05-22 04:19:09', '2023-05-25 17:54:55'),
(18, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-28 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 04:24:30', '2023-05-22 04:24:30'),
(19, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-28 for job title Delivery boy posted by company Amul ', 1, '2023-05-22 04:24:30', '2023-05-26 12:22:23'),
(20, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-29 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 05:08:51', '2023-05-22 05:08:51'),
(21, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-29 for job title Delivery boy posted by company Amul ', 1, '2023-05-22 05:08:51', '2023-05-25 17:55:06'),
(22, 1, 'company', 'applied_on_job', 1, 'A new user applied on job with title - Delivery boy', 0, '2023-05-22 05:32:12', '2023-05-22 05:32:12'),
(23, 1, 'Super-Admin', 'applied_on_job', 1, 'A new user applied on job with title - Delivery boy', 0, '2023-05-22 05:32:12', '2023-05-22 05:32:12'),
(24, 3, 'employee', 'interview_scheduled', 1, 'hello, Vinod you have interview scheduled on 2023-05-29 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 05:34:05', '2023-05-22 05:34:05'),
(25, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Vinod on date 2023-05-29 for job title Delivery boy posted by company Amul ', 0, '2023-05-22 05:34:05', '2023-05-22 08:52:44'),
(26, 3, 'employee', 'interview_scheduled', 1, 'hello, Vinod you have interview scheduled on 2023-05-29 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 05:36:57', '2023-05-22 05:36:57'),
(27, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Vinod on date 2023-05-29 for job title Delivery boy posted by company Amul ', 0, '2023-05-22 05:36:57', '2023-05-22 05:36:57'),
(28, 4, 'company', 'added_new_job', 6, 'A new job with title-Hr has been added successfully', 0, '2023-05-22 07:31:21', '2023-05-22 07:31:21'),
(29, 1, 'super-admin', 'added_new_job', 6, 'A new job with title-Hr has been added successfully', 0, '2023-05-22 07:31:21', '2023-05-22 07:31:21'),
(30, 1, 'company', 'applied_on_job', 1, 'A new user applied on job with title - Delivery boy', 0, '2023-05-22 08:53:54', '2023-05-22 08:53:54'),
(31, 4, 'company', 'applied_on_job', 6, 'A new user applied on job with title - Hr', 0, '2023-05-22 08:58:06', '2023-05-22 08:58:06'),
(32, 4, 'company', 'applied_on_job', 6, 'A new user applied on job with title - Hr', 0, '2023-05-22 08:58:10', '2023-05-22 08:58:10'),
(33, 4, 'company', 'added_new_job', 7, 'A new job with title-Receptionist has been added successfully', 0, '2023-05-22 09:05:35', '2023-05-22 09:05:35'),
(34, 3, 'manager', 'added_new_job', 7, 'A new job with title-Receptionist has been added successfully', 0, '2023-05-22 09:05:35', '2023-05-22 09:05:35'),
(35, 4, 'company', 'applied_on_job', 7, 'A new user applied on job with title - Receptionist', 0, '2023-05-22 09:13:47', '2023-05-22 09:13:47'),
(36, 3, 'manager', 'applied_on_job', 7, 'A new user applied on job with title - Receptionist', 0, '2023-05-22 09:13:47', '2023-05-22 09:13:47'),
(37, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-22 09:31:55', '2023-05-22 09:31:55'),
(38, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Web Developer posted by company WE2CODE', 0, '2023-05-22 09:31:55', '2023-05-22 09:31:55'),
(39, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-22 09:32:07', '2023-05-22 09:32:07'),
(40, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-05-25 for job title Receptionist posted by company WE2CODE', 0, '2023-05-22 09:32:07', '2023-05-22 09:32:07'),
(41, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-05-23 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-22 09:32:12', '2023-05-22 09:32:12'),
(42, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-05-23 for job title Receptionist posted by company WE2CODE', 0, '2023-05-22 09:32:12', '2023-05-22 09:32:12'),
(43, 2, 'company', 'applied_on_job', 2, 'A new user applied on job with title - Delivery boy', 0, '2023-05-22 12:14:36', '2023-05-22 12:14:36'),
(44, 2, 'company', 'applied_on_job', 2, 'A new user applied on job with title - Delivery boy', 0, '2023-05-22 12:15:03', '2023-05-22 12:15:03'),
(45, 4, 'company', 'applied_on_job', 7, 'A new user applied on job with title - Receptionist', 0, '2023-05-23 06:04:32', '2023-05-23 06:04:32'),
(46, 4, 'company', 'applied_on_job', 7, 'A new user applied on job with title - Receptionist', 0, '2023-05-23 06:04:35', '2023-05-23 06:04:35'),
(47, 3, 'employee', 'interview_scheduled', 1, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-23 06:50:40', '2023-05-23 06:50:40'),
(48, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Delivery boy posted by company Amul ', 0, '2023-05-23 06:50:40', '2023-05-23 06:50:40'),
(49, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-23 06:50:51', '2023-05-23 06:50:51'),
(50, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-05-25 for job title Receptionist posted by company WE2CODE', 0, '2023-05-23 06:50:51', '2023-05-23 06:50:51'),
(51, 3, 'company', 'added_new_job', 8, 'A new job with title-Content Writer  has been added successfully', 0, '2023-05-23 10:00:13', '2023-05-23 10:00:13'),
(52, 3, 'company', 'applied_on_job', 8, 'A new user applied on job with title - Content Writer ', 0, '2023-05-23 11:45:28', '2023-05-23 11:45:28'),
(53, 4, 'company', 'applied_on_job', 6, 'A new user applied on job with title - Hr', 0, '2023-05-23 11:45:30', '2023-05-23 11:45:30'),
(54, 4, 'company', 'applied_on_job', 5, 'A new user applied on job with title - Office boy', 0, '2023-05-23 11:45:31', '2023-05-23 11:45:31'),
(55, 3, 'company', 'applied_on_job', 3, 'A new user applied on job with title - Shop worker', 0, '2023-05-23 11:45:33', '2023-05-23 11:45:33'),
(56, 2, 'company', 'applied_on_job', 2, 'A new user applied on job with title - Delivery boy', 0, '2023-05-23 11:45:33', '2023-05-23 11:45:33'),
(57, 4, 'company', 'applied_on_job', 4, 'A new user applied on job with title - Web Developer', 0, '2023-05-23 11:45:35', '2023-05-23 11:45:35'),
(58, 4, 'company', 'applied_on_job', 7, 'A new user applied on job with title - Receptionist', 0, '2023-05-23 11:45:38', '2023-05-23 11:45:38'),
(59, 1, 'company', 'applied_on_job', 1, 'A new user applied on job with title - Delivery boy', 0, '2023-05-23 11:45:41', '2023-05-23 11:45:41'),
(60, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-23 11:52:04', '2023-05-23 11:52:04'),
(61, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Web Developer posted by company WE2CODE', 0, '2023-05-23 11:52:04', '2023-05-23 11:52:04'),
(62, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-23 11:52:25', '2023-05-23 11:52:25'),
(63, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Web Developer posted by company WE2CODE', 0, '2023-05-23 11:52:25', '2023-05-23 11:52:25'),
(64, 6, 'employee', 'interview_scheduled', 7, 'hello, Warren you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-23 11:53:07', '2023-05-23 11:53:07'),
(65, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Warren on date 2023-05-25 for job title Receptionist posted by company WE2CODE', 0, '2023-05-23 11:53:07', '2023-05-23 11:53:07'),
(66, 4, 'employee', 'interview_scheduled', 7, 'hello, Roshni sharma you have interview scheduled on 2023-05-24 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-23 11:53:21', '2023-05-23 11:53:21'),
(67, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Roshni sharma on date 2023-05-24 for job title Receptionist posted by company WE2CODE', 0, '2023-05-23 11:53:21', '2023-05-23 11:53:21'),
(68, 6, 'employee', 'interview_scheduled', 4, 'hello, Warren you have interview scheduled on 2023-05-25 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-23 12:45:13', '2023-05-23 12:45:13'),
(69, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Warren on date 2023-05-25 for job title Web Developer posted by company WE2CODE', 0, '2023-05-23 12:45:13', '2023-05-23 12:45:13'),
(70, 3, 'company', 'applied_on_job', 8, 'A new user applied on job with title - Content Writer ', 0, '2023-05-24 09:19:45', '2023-05-24 09:19:45'),
(71, 3, 'company', 'applied_on_job', 8, 'A new user applied on job with title - Content Writer ', 0, '2023-05-24 09:19:53', '2023-05-24 09:19:53'),
(72, 3, 'company', 'applied_on_job', 8, 'A new user applied on job with title - Content Writer ', 0, '2023-05-24 09:20:14', '2023-05-24 09:20:14'),
(73, 3, 'employee', 'interview_scheduled', 1, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-24 09:37:27', '2023-05-24 09:37:27'),
(74, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-24 10:18:56', '2023-05-24 10:18:56'),
(75, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-24 10:19:05', '2023-05-24 10:19:05'),
(76, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-24 10:19:08', '2023-05-24 10:19:08'),
(77, 4, 'employee', 'interview_scheduled', 7, 'hello, Roshni sharma you have interview scheduled on 2023-05-23 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-24 10:19:12', '2023-05-24 10:19:12'),
(78, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-24 10:20:08', '2023-05-24 10:20:08'),
(79, 4, 'employee', 'interview_scheduled', 7, 'hello, Roshni sharma you have interview scheduled on 2023-05-23 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:38:25', '2023-05-24 11:38:25'),
(80, 6, 'employee', 'interview_scheduled', 7, 'hello, Warren you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:38:32', '2023-05-24 11:38:32'),
(81, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:38:36', '2023-05-24 11:38:36'),
(82, 4, 'employee', 'interview_scheduled', 7, 'hello, Roshni sharma you have interview scheduled on 2023-05-23 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:38:41', '2023-05-24 11:38:41'),
(83, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-30 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:38:51', '2023-05-24 11:38:51'),
(84, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-06-08 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:38:57', '2023-05-24 11:38:57'),
(85, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:39:06', '2023-05-24 11:39:06'),
(86, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:55:12', '2023-05-24 11:55:12'),
(87, 6, 'employee', 'interview_scheduled', 4, 'hello, Warren you have interview scheduled on 2023-05-25 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:55:15', '2023-05-24 11:55:15'),
(88, 6, 'employee', 'interview_scheduled', 4, 'hello, Warren you have interview scheduled on 2023-05-25 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:55:17', '2023-05-24 11:55:17'),
(89, 6, 'employee', 'interview_scheduled', 8, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Content Writer  you have applied on, scheduled with Sention', 0, '2023-05-24 11:55:23', '2023-05-24 11:55:23'),
(90, 6, 'employee', 'interview_scheduled', 6, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Hr you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:55:31', '2023-05-24 11:55:31'),
(91, 6, 'employee', 'interview_scheduled', 4, 'hello, Warren you have interview scheduled on 2023-05-25 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:55:33', '2023-05-24 11:55:33'),
(92, 6, 'employee', 'interview_scheduled', 5, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Office boy you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:55:41', '2023-05-24 11:55:41'),
(93, 6, 'employee', 'interview_scheduled', 8, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Content Writer  you have applied on, scheduled with Sention', 0, '2023-05-24 11:58:38', '2023-05-24 11:58:38'),
(94, 6, 'employee', 'interview_scheduled', 6, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Hr you have applied on, scheduled with WE2CODE', 0, '2023-05-24 11:58:43', '2023-05-24 11:58:43'),
(95, 6, 'employee', 'interview_scheduled', 5, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Office boy you have applied on, scheduled with WE2CODE', 0, '2023-05-24 12:00:30', '2023-05-24 12:00:30'),
(96, 6, 'employee', 'interview_scheduled', 3, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Shop worker you have applied on, scheduled with Sention', 0, '2023-05-24 12:22:40', '2023-05-24 12:22:40'),
(97, 6, 'employee', 'interview_scheduled', 2, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Sanchi', 0, '2023-05-24 12:22:48', '2023-05-24 12:22:48'),
(98, 6, 'employee', 'interview_scheduled', 1, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-24 12:22:58', '2023-05-24 12:22:58'),
(99, 4, 'employee', 'interview_scheduled', 1, 'hello, Roshni sharma you have interview scheduled on 2023-06-09 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-24 12:23:07', '2023-05-24 12:23:07'),
(100, 6, 'employee', 'interview_scheduled', 3, 'hello, Warren you have interview scheduled on 2023-06-10 for job with title - Shop worker you have applied on, scheduled with Sention', 0, '2023-05-24 12:38:57', '2023-05-24 12:38:57'),
(101, 1, 'super-admin', 'interview_scheduled', 3, 'A new interview scheduled of candidate Warren on date 2023-06-10 for job title Shop worker posted by company Sention', 0, '2023-05-24 12:38:57', '2023-05-24 12:38:57'),
(102, 6, 'employee', 'interview_scheduled', 1, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-24 12:43:38', '2023-05-24 12:43:38'),
(103, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Delivery boy posted by company Amul ', 0, '2023-05-24 12:43:38', '2023-05-24 12:43:38'),
(104, 6, 'employee', 'interview_scheduled', 8, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Content Writer  you have applied on, scheduled with Sention', 0, '2023-05-24 12:44:46', '2023-05-24 12:44:46'),
(105, 1, 'super-admin', 'interview_scheduled', 8, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Content Writer  posted by company Sention', 0, '2023-05-24 12:44:46', '2023-05-24 12:44:46'),
(106, 6, 'employee', 'interview_scheduled', 6, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Hr you have applied on, scheduled with WE2CODE', 0, '2023-05-24 12:44:49', '2023-05-24 12:44:49'),
(107, 1, 'super-admin', 'interview_scheduled', 6, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Hr posted by company WE2CODE', 0, '2023-05-24 12:44:49', '2023-05-24 12:44:49'),
(108, 6, 'employee', 'interview_scheduled', 2, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Sanchi', 0, '2023-05-24 12:44:51', '2023-05-24 12:44:51'),
(109, 1, 'super-admin', 'interview_scheduled', 2, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Delivery boy posted by company Sanchi', 0, '2023-05-24 12:44:51', '2023-05-24 12:44:51'),
(110, 6, 'employee', 'interview_scheduled', 1, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-24 12:45:34', '2023-05-24 12:45:34'),
(111, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Delivery boy posted by company Amul ', 0, '2023-05-24 12:45:34', '2023-05-24 12:45:34'),
(112, 6, 'employee', 'interview_scheduled', 1, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-24 12:47:11', '2023-05-24 12:47:11'),
(113, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Delivery boy posted by company Amul ', 0, '2023-05-24 12:47:11', '2023-05-24 12:47:11'),
(114, 6, 'employee', 'interview_scheduled', 7, 'hello, Warren you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-25 04:42:05', '2023-05-25 04:42:05'),
(115, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Warren on date 2023-05-25 for job title Receptionist posted by company WE2CODE', 0, '2023-05-25 04:42:05', '2023-05-25 04:42:05'),
(116, 4, 'employee', 'interview_scheduled', 7, 'hello, Roshni sharma you have interview scheduled on 2023-05-23 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-25 04:42:16', '2023-05-25 04:42:16'),
(117, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Roshni sharma on date 2023-05-23 for job title Receptionist posted by company WE2CODE', 0, '2023-05-25 04:42:16', '2023-05-25 04:42:16'),
(118, 3, 'employee', 'interview_scheduled', 1, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-25 04:42:24', '2023-05-25 04:42:24'),
(119, 3, 'manager', 'interview_scheduled', 1, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Delivery boy posted by company Amul ', 0, '2023-05-25 04:42:24', '2023-05-25 04:42:24'),
(120, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-25 04:42:30', '2023-05-25 04:42:30'),
(121, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-05-25 for job title Receptionist posted by company WE2CODE', 0, '2023-05-25 04:42:30', '2023-05-25 04:42:30'),
(122, 6, 'employee', 'interview_scheduled', 4, 'hello, Warren you have interview scheduled on 2023-05-25 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-25 04:42:35', '2023-05-25 04:42:35'),
(123, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Warren on date 2023-05-25 for job title Web Developer posted by company WE2CODE', 0, '2023-05-25 04:42:35', '2023-05-25 04:42:35'),
(124, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-25 04:42:39', '2023-05-25 04:42:39'),
(125, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Web Developer posted by company WE2CODE', 0, '2023-05-25 04:42:39', '2023-05-25 04:42:39'),
(126, 6, 'employee', 'interview_scheduled', 5, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Office boy you have applied on, scheduled with WE2CODE', 0, '2023-05-25 04:42:43', '2023-05-25 04:42:43'),
(127, 3, 'manager', 'interview_scheduled', 5, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Office boy posted by company WE2CODE', 0, '2023-05-25 04:42:43', '2023-05-25 04:42:43'),
(128, 6, 'employee', 'interview_scheduled', 7, 'hello, Warren you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-25 05:00:53', '2023-05-25 05:00:53'),
(129, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Warren on date 2023-05-25 for job title Receptionist posted by company WE2CODE', 0, '2023-05-25 05:00:53', '2023-05-25 05:00:53'),
(130, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-25 05:01:00', '2023-05-25 05:01:00'),
(131, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-05-25 for job title Receptionist posted by company WE2CODE', 0, '2023-05-25 05:01:00', '2023-05-25 05:01:00'),
(132, 6, 'employee', 'interview_scheduled', 4, 'hello, Warren you have interview scheduled on 2023-05-25 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-25 05:01:16', '2023-05-25 05:01:16'),
(133, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Warren on date 2023-05-25 for job title Web Developer posted by company WE2CODE', 0, '2023-05-25 05:01:16', '2023-05-25 05:01:16'),
(134, 6, 'employee', 'interview_scheduled', 7, 'hello, Warren you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-25 05:01:41', '2023-05-25 05:01:41'),
(135, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Warren on date 2023-05-25 for job title Receptionist posted by company WE2CODE', 0, '2023-05-25 05:01:41', '2023-05-25 05:01:41'),
(136, 3, 'company', 'applied_on_job', 8, 'A new user applied on job with title - Content Writer ', 0, '2023-05-25 15:28:47', '2023-05-25 15:28:47'),
(137, 4, 'employee', 'interview_scheduled', 7, 'hello, Roshni sharma you have interview scheduled on 2023-05-23 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-26 07:10:44', '2023-05-26 07:10:44'),
(138, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Roshni sharma on date 2023-05-23 for job title Receptionist posted by company WE2CODE', 0, '2023-05-26 07:10:44', '2023-05-26 07:10:44'),
(139, 4, 'employee', 'interview_scheduled', 7, 'hello, Roshni sharma you have interview scheduled on 2023-05-23 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-26 07:10:52', '2023-05-26 07:10:52'),
(140, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Roshni sharma on date 2023-05-23 for job title Receptionist posted by company WE2CODE', 0, '2023-05-26 07:10:52', '2023-05-26 07:10:52'),
(141, 6, 'employee', 'interview_scheduled', 8, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Content Writer  you have applied on, scheduled with Sention', 0, '2023-05-26 07:11:00', '2023-05-26 07:11:00'),
(142, 1, 'super-admin', 'interview_scheduled', 8, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Content Writer  posted by company Sention', 0, '2023-05-26 07:11:00', '2023-05-26 07:11:00'),
(143, 6, 'employee', 'interview_scheduled', 6, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Hr you have applied on, scheduled with WE2CODE', 0, '2023-05-26 07:11:07', '2023-05-26 07:11:07'),
(144, 1, 'super-admin', 'interview_scheduled', 6, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Hr posted by company WE2CODE', 0, '2023-05-26 07:11:07', '2023-05-26 07:11:07'),
(145, 6, 'employee', 'interview_scheduled', 2, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Sanchi', 0, '2023-05-26 07:11:28', '2023-05-26 07:11:28'),
(146, 1, 'super-admin', 'interview_scheduled', 2, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Delivery boy posted by company Sanchi', 0, '2023-05-26 07:11:28', '2023-05-26 07:11:28'),
(147, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-26 07:11:45', '2023-05-26 07:11:45'),
(148, 1, 'super-admin', 'interview_scheduled', 4, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Web Developer posted by company WE2CODE', 0, '2023-05-26 07:11:45', '2023-05-26 07:11:45'),
(149, 6, 'employee', 'interview_scheduled', 1, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-26 07:12:07', '2023-05-26 07:12:07'),
(150, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Delivery boy posted by company Amul ', 0, '2023-05-26 07:12:07', '2023-05-26 07:12:07'),
(151, 4, 'employee', 'interview_scheduled', 7, 'hello, Roshni sharma you have interview scheduled on 2023-05-23 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-26 07:13:23', '2023-05-26 07:13:23'),
(152, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Roshni sharma on date 2023-05-23 for job title Receptionist posted by company WE2CODE', 0, '2023-05-26 07:13:23', '2023-05-26 07:13:23'),
(153, 4, 'employee', 'interview_scheduled', 7, 'hello, Roshni sharma you have interview scheduled on 2023-05-23 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-26 07:13:30', '2023-05-26 07:13:30'),
(154, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Roshni sharma on date 2023-05-23 for job title Receptionist posted by company WE2CODE', 0, '2023-05-26 07:13:30', '2023-05-26 07:13:30'),
(155, 3, 'employee', 'interview_scheduled', 1, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-26 07:13:35', '2023-05-26 07:13:35'),
(156, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Delivery boy posted by company Amul ', 0, '2023-05-26 07:13:35', '2023-05-26 07:13:35'),
(157, 6, 'employee', 'interview_scheduled', 5, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Office boy you have applied on, scheduled with WE2CODE', 0, '2023-05-26 07:13:48', '2023-05-26 07:13:48'),
(158, 1, 'super-admin', 'interview_scheduled', 5, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Office boy posted by company WE2CODE', 0, '2023-05-26 07:13:48', '2023-05-26 07:13:48'),
(159, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-26 07:13:57', '2023-05-26 07:13:57'),
(160, 1, 'super-admin', 'interview_scheduled', 4, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Web Developer posted by company WE2CODE', 0, '2023-05-26 07:13:57', '2023-05-26 07:13:57'),
(161, 6, 'employee', 'interview_scheduled', 1, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-26 07:16:56', '2023-05-26 07:16:56'),
(162, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Delivery boy posted by company Amul ', 0, '2023-05-26 07:16:56', '2023-05-26 07:16:56'),
(163, 6, 'employee', 'interview_scheduled', 2, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Delivery boy you have applied on, scheduled with Sanchi', 0, '2023-05-26 07:17:03', '2023-05-26 07:17:03'),
(164, 1, 'super-admin', 'interview_scheduled', 2, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Delivery boy posted by company Sanchi', 0, '2023-05-26 07:17:03', '2023-05-26 07:17:03'),
(165, 4, 'employee', 'interview_scheduled', 6, 'hello, Roshni sharma you have interview scheduled on 2023-05-27 for job with title - Hr you have applied on, scheduled with WE2CODE', 0, '2023-05-26 07:17:17', '2023-05-26 07:17:17'),
(166, 1, 'super-admin', 'interview_scheduled', 6, 'A new interview scheduled of candidate Roshni sharma on date 2023-05-27 for job title Hr posted by company WE2CODE', 0, '2023-05-26 07:17:17', '2023-05-26 07:17:17'),
(167, 2, 'company', 'added_new_job', 9, 'A new job with title-Manager  has been added successfully', 0, '2023-05-26 07:26:44', '2023-05-26 07:26:44'),
(168, 1, 'super-admin', 'added_new_job', 9, 'A new job with title-Manager  has been added successfully', 0, '2023-05-26 07:26:44', '2023-05-26 07:26:44'),
(169, 1, 'company', 'added_new_job', 10, 'A new job with title-Head Manager has been added successfully', 0, '2023-05-26 07:28:49', '2023-05-26 07:28:49'),
(170, 1, 'super-admin', 'added_new_job', 10, 'A new job with title-Head Manager has been added successfully', 0, '2023-05-26 07:28:49', '2023-05-26 07:28:49'),
(171, 4, 'company', 'added_new_job', 11, 'A new job with title-React js developer has been added successfully', 0, '2023-05-26 07:32:51', '2023-05-26 07:32:51'),
(172, 1, 'super-admin', 'added_new_job', 11, 'A new job with title-React js developer has been added successfully', 0, '2023-05-26 07:32:51', '2023-05-26 07:32:51'),
(173, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-26 08:58:44', '2023-05-26 08:58:44'),
(174, 1, 'super-admin', 'interview_scheduled', 4, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Web Developer posted by company WE2CODE', 0, '2023-05-26 08:58:44', '2023-05-26 08:58:44'),
(175, 6, 'employee', 'interview_scheduled', 3, 'hello, Warren you have interview scheduled on 2023-06-10 for job with title - Shop worker you have applied on, scheduled with Sention', 0, '2023-05-26 11:50:31', '2023-05-26 11:50:31'),
(176, 1, 'super-admin', 'interview_scheduled', 3, 'A new interview scheduled of candidate Warren on date 2023-06-10 for job title Shop worker posted by company Sention', 0, '2023-05-26 11:50:31', '2023-05-26 11:50:31'),
(177, 4, 'employee', 'interview_scheduled', 6, 'hello, Roshni sharma you have interview scheduled on 2023-05-28 for job with title - Hr you have applied on, scheduled with WE2CODE', 0, '2023-05-27 05:25:14', '2023-05-27 05:25:14'),
(178, 1, 'super-admin', 'interview_scheduled', 6, 'A new interview scheduled of candidate Roshni sharma on date 2023-05-28 for job title Hr posted by company WE2CODE', 0, '2023-05-27 05:25:14', '2023-05-27 05:25:14'),
(179, 3, 'employee', 'interview_scheduled', 1, 'hello, Vinod you have interview scheduled on 2023-05-27 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-27 05:25:32', '2023-05-27 05:25:32'),
(180, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Vinod on date 2023-05-27 for job title Delivery boy posted by company Amul ', 0, '2023-05-27 05:25:32', '2023-05-27 05:25:32'),
(181, 8, 'employee', 'interview_scheduled', 7, 'hello, Rajaram you have interview scheduled on 2023-05-27 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-27 05:34:33', '2023-05-27 05:34:33'),
(182, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Rajaram on date 2023-05-27 for job title Receptionist posted by company WE2CODE', 0, '2023-05-27 05:34:33', '2023-05-27 05:34:33'),
(183, 6, 'employee', 'interview_scheduled', 5, 'hello, Warren you have interview scheduled on 2023-05-24 for job with title - Office boy you have applied on, scheduled with WE2CODE', 0, '2023-05-27 05:35:06', '2023-05-27 05:35:06'),
(184, 1, 'super-admin', 'interview_scheduled', 5, 'A new interview scheduled of candidate Warren on date 2023-05-24 for job title Office boy posted by company WE2CODE', 0, '2023-05-27 05:35:06', '2023-05-27 05:35:06'),
(185, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-27 05:35:10', '2023-05-27 05:35:10'),
(186, 1, 'super-admin', 'interview_scheduled', 4, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Web Developer posted by company WE2CODE', 0, '2023-05-27 05:35:10', '2023-05-27 05:35:10'),
(187, 3, 'employee', 'interview_scheduled', 4, 'hello, Vinod you have interview scheduled on 2023-05-24 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-05-27 05:35:13', '2023-05-27 05:35:13'),
(188, 1, 'super-admin', 'interview_scheduled', 4, 'A new interview scheduled of candidate Vinod on date 2023-05-24 for job title Web Developer posted by company WE2CODE', 0, '2023-05-27 05:35:13', '2023-05-27 05:35:13'),
(189, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-27 05:35:15', '2023-05-27 05:35:15'),
(190, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-05-25 for job title Receptionist posted by company WE2CODE', 0, '2023-05-27 05:35:15', '2023-05-27 05:35:15'),
(191, 3, 'employee', 'interview_scheduled', 1, 'hello, Vinod you have interview scheduled on 2023-05-27 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-27 05:35:19', '2023-05-27 05:35:19'),
(192, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Vinod on date 2023-05-27 for job title Delivery boy posted by company Amul ', 0, '2023-05-27 05:35:19', '2023-05-27 05:35:19'),
(193, 3, 'employee', 'interview_scheduled', 1, 'hello, Vinod you have interview scheduled on 2023-05-27 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-27 05:35:23', '2023-05-27 05:35:23'),
(194, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Vinod on date 2023-05-27 for job title Delivery boy posted by company Amul ', 0, '2023-05-27 05:35:23', '2023-05-27 05:35:23'),
(195, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-05-25 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-27 05:35:29', '2023-05-27 05:35:29'),
(196, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-05-25 for job title Receptionist posted by company WE2CODE', 0, '2023-05-27 05:35:29', '2023-05-27 05:35:29'),
(197, 4, 'employee', 'interview_scheduled', 6, 'hello, Roshni sharma you have interview scheduled on 2023-05-28 for job with title - Hr you have applied on, scheduled with WE2CODE', 0, '2023-05-27 05:35:32', '2023-05-27 05:35:32'),
(198, 1, 'super-admin', 'interview_scheduled', 6, 'A new interview scheduled of candidate Roshni sharma on date 2023-05-28 for job title Hr posted by company WE2CODE', 0, '2023-05-27 05:35:32', '2023-05-27 05:35:32'),
(199, 4, 'employee', 'interview_scheduled', 1, 'hello, Roshni sharma you have interview scheduled on 2023-06-09 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-27 05:35:35', '2023-05-27 05:35:35'),
(200, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Roshni sharma on date 2023-06-09 for job title Delivery boy posted by company Amul ', 0, '2023-05-27 05:35:35', '2023-05-27 05:35:35'),
(201, 4, 'employee', 'interview_scheduled', 1, 'hello, Roshni sharma you have interview scheduled on 2023-06-09 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-27 05:35:38', '2023-05-27 05:35:38'),
(202, 1, 'super-admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Roshni sharma on date 2023-06-09 for job title Delivery boy posted by company Amul ', 0, '2023-05-27 05:35:38', '2023-05-27 05:35:38'),
(203, 6, 'employee', 'interview_scheduled', 3, 'hello, Warren you have interview scheduled on 2023-06-10 for job with title - Shop worker you have applied on, scheduled with Sention', 0, '2023-05-27 05:35:42', '2023-05-27 05:35:42'),
(204, 1, 'super-admin', 'interview_scheduled', 3, 'A new interview scheduled of candidate Warren on date 2023-06-10 for job title Shop worker posted by company Sention', 0, '2023-05-27 05:35:42', '2023-05-27 05:35:42'),
(205, 8, 'employee', 'interview_scheduled', 7, 'hello, Rajaram you have interview scheduled on 2023-05-27 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-27 05:37:49', '2023-05-27 05:37:49'),
(206, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Rajaram on date 2023-05-27 for job title Receptionist posted by company WE2CODE', 0, '2023-05-27 05:37:49', '2023-05-27 05:37:49'),
(207, 6, 'employee', 'interview_scheduled', 3, 'hello, Warren you have interview scheduled on 2023-05-28 for job with title - Shop worker you have applied on, scheduled with Sention', 0, '2023-05-27 05:37:56', '2023-05-27 05:37:56'),
(208, 1, 'super-admin', 'interview_scheduled', 3, 'A new interview scheduled of candidate Warren on date 2023-05-28 for job title Shop worker posted by company Sention', 0, '2023-05-27 05:37:56', '2023-05-27 05:37:56'),
(209, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-05-27 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-27 05:38:18', '2023-05-27 05:38:18'),
(210, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-05-27 for job title Receptionist posted by company WE2CODE', 0, '2023-05-27 05:38:18', '2023-05-27 05:38:18'),
(211, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-05-27 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-05-27 05:38:25', '2023-05-27 05:38:25'),
(212, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-05-27 for job title Receptionist posted by company WE2CODE', 0, '2023-05-27 05:38:25', '2023-05-27 05:38:25'),
(213, 4, 'company', 'applied_on_job', 11, 'A new user applied on job with title - React js developer', 0, '2023-05-29 06:57:51', '2023-05-29 06:57:51'),
(214, 5, 'company', 'added_new_job', 12, 'A new job with title-Driver has been added successfully', 0, '2023-05-29 06:58:59', '2023-05-29 06:58:59'),
(215, 2, 'company', 'added_new_job', 13, 'A new job with title-Driver has been added successfully', 0, '2023-06-05 06:20:07', '2023-06-05 06:20:07'),
(216, 1, 'super-admin', 'added_new_job', 13, 'A new job with title-Driver has been added successfully', 0, '2023-06-05 06:20:07', '2023-06-05 06:20:07'),
(217, 12, 'employee', 'interview_scheduled', 11, 'hello,  you have interview scheduled on 2023-06-07 for job with title - React js developer you have applied on, scheduled with WE2CODE', 0, '2023-06-05 06:21:42', '2023-06-05 06:21:42'),
(218, 1, 'super-admin', 'interview_scheduled', 11, 'A new interview scheduled of candidate  on date 2023-06-07 for job title React js developer posted by company WE2CODE', 0, '2023-06-05 06:21:42', '2023-06-05 06:21:42'),
(219, 8, 'employee', 'interview_scheduled', 7, 'hello, Rajaram you have interview scheduled on 2023-05-27 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-05 06:23:02', '2023-06-05 06:23:02'),
(220, 1, 'super-admin', 'interview_scheduled', 7, 'A new interview scheduled of candidate Rajaram on date 2023-05-27 for job title Receptionist posted by company WE2CODE', 0, '2023-06-05 06:23:02', '2023-06-05 06:23:02'),
(221, 4, 'company', 'applied_on_job', 11, 'A new user applied on job with title - React js developer', 0, '2023-06-05 07:03:39', '2023-06-05 07:03:39'),
(222, 4, 'company', 'applied_on_job', 7, 'A new user applied on job with title - Receptionist', 0, '2023-06-05 07:04:03', '2023-06-05 07:04:03'),
(223, 4, 'company', 'applied_on_job', 7, 'A new user applied on job with title - Receptionist', 0, '2023-06-05 07:04:06', '2023-06-05 07:04:06'),
(224, 8, 'company', 'added_new_job', 14, 'A new job with title-React js developer has been added successfully', 0, '2023-06-05 07:22:07', '2023-06-05 07:22:07'),
(225, 12, 'employee', 'interview_scheduled', 4, 'hello,  you have interview scheduled on 2023-06-29 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-05 10:58:22', '2023-06-05 10:58:22'),
(226, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate  on date 2023-06-29 for job title Web Developer posted by company WE2CODE', 0, '2023-06-05 10:58:22', '2023-06-05 10:58:22'),
(227, 6, 'employee', 'interview_scheduled', 4, 'hello, Warren you have interview scheduled on 2023-06-29 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-05 11:44:27', '2023-06-05 11:44:27'),
(228, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Warren on date 2023-06-29 for job title Web Developer posted by company WE2CODE', 0, '2023-06-05 11:44:27', '2023-06-05 11:44:27'),
(229, 22, 'employee', 'interview_scheduled', 7, 'hello, Annu you have interview scheduled on 2023-06-29 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-05 11:45:15', '2023-06-05 11:45:15'),
(230, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Annu on date 2023-06-29 for job title Receptionist posted by company WE2CODE', 0, '2023-06-05 11:45:15', '2023-06-05 11:45:15'),
(231, 12, 'employee', 'interview_scheduled', 7, 'hello,  you have interview scheduled on 2023-06-29 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-05 11:47:42', '2023-06-05 11:47:42'),
(232, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate  on date 2023-06-29 for job title Receptionist posted by company WE2CODE', 0, '2023-06-05 11:47:42', '2023-06-05 11:47:42'),
(233, 8, 'employee', 'interview_scheduled', 7, 'hello, Rajaram you have interview scheduled on 2023-06-29 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-05 11:48:07', '2023-06-05 11:48:07'),
(234, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Rajaram on date 2023-06-29 for job title Receptionist posted by company WE2CODE', 0, '2023-06-05 11:48:07', '2023-06-05 11:48:07'),
(235, 12, 'employee', 'interview_scheduled', 7, 'hello,  you have interview scheduled on 2023-06-29 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-05 11:49:27', '2023-06-05 11:49:27'),
(236, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate  on date 2023-06-29 for job title Receptionist posted by company WE2CODE', 0, '2023-06-05 11:49:27', '2023-06-05 11:49:27'),
(237, 12, 'employee', 'interview_scheduled', 7, 'hello,  you have interview scheduled on 2023-06-29 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-05 11:49:34', '2023-06-05 11:49:34');
INSERT INTO `notification` (`id`, `from_id`, `type`, `subject`, `action_id`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(238, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate  on date 2023-06-29 for job title Receptionist posted by company WE2CODE', 0, '2023-06-05 11:49:34', '2023-06-05 11:49:34'),
(239, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-06-16 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-05 12:41:16', '2023-06-05 12:41:16'),
(240, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-06-16 for job title Receptionist posted by company WE2CODE', 0, '2023-06-05 12:41:16', '2023-06-05 12:41:16'),
(241, 8, 'employee', 'interview_scheduled', 4, 'hello, Rajaram you have interview scheduled on 2023-06-29 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 04:25:58', '2023-06-06 04:25:58'),
(242, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Rajaram on date 2023-06-29 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 04:25:58', '2023-06-06 04:25:58'),
(243, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-06-17 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:32:58', '2023-06-06 05:32:58'),
(244, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-06-17 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 05:32:58', '2023-06-06 05:32:58'),
(245, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-06-23 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:33:56', '2023-06-06 05:33:56'),
(246, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-06-23 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 05:33:56', '2023-06-06 05:33:56'),
(247, 12, 'employee', 'interview_scheduled', 4, 'hello,  you have interview scheduled on 2023-06-29 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:35:11', '2023-06-06 05:35:11'),
(248, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate  on date 2023-06-29 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:35:11', '2023-06-06 05:35:11'),
(249, 12, 'employee', 'interview_scheduled', 4, 'hello,  you have interview scheduled on 2023-06-08 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:35:28', '2023-06-06 05:35:28'),
(250, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate  on date 2023-06-08 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:35:28', '2023-06-06 05:35:28'),
(251, 12, 'employee', 'interview_scheduled', 4, 'hello,  you have interview scheduled on 2023-06-08 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:35:36', '2023-06-06 05:35:36'),
(252, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate  on date 2023-06-08 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:35:36', '2023-06-06 05:35:36'),
(253, 12, 'employee', 'interview_scheduled', 4, 'hello,  you have interview scheduled on 2023-06-08 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:35:45', '2023-06-06 05:35:45'),
(254, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate  on date 2023-06-08 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:35:45', '2023-06-06 05:35:45'),
(255, 3, 'employee', 'interview_scheduled', 7, 'hello, Vinod you have interview scheduled on 2023-06-07 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:41:54', '2023-06-06 05:41:54'),
(256, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Vinod on date 2023-06-07 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 05:41:54', '2023-06-06 05:41:54'),
(257, 3, 'employee', 'interview_scheduled', 7, 'hello, Vinod you have interview scheduled on 2023-06-29 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:43:44', '2023-06-06 05:43:44'),
(258, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Vinod on date 2023-06-29 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 05:43:44', '2023-06-06 05:43:44'),
(259, 8, 'employee', 'interview_scheduled', 4, 'hello, Rajaram you have interview scheduled on 2023-06-07 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:44:55', '2023-06-06 05:44:55'),
(260, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Rajaram on date 2023-06-07 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:44:55', '2023-06-06 05:44:55'),
(261, 8, 'employee', 'interview_scheduled', 4, 'hello, Rajaram you have interview scheduled on 2023-06-29 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:45:05', '2023-06-06 05:45:05'),
(262, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Rajaram on date 2023-06-29 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:45:05', '2023-06-06 05:45:05'),
(263, 12, 'employee', 'interview_scheduled', 4, 'hello,  you have interview scheduled on 2023-06-09 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:45:25', '2023-06-06 05:45:25'),
(264, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate  on date 2023-06-09 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:45:25', '2023-06-06 05:45:25'),
(265, 22, 'employee', 'interview_scheduled', 4, 'hello, Annu you have interview scheduled on 2023-06-23 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:48:20', '2023-06-06 05:48:20'),
(266, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Annu on date 2023-06-23 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:48:20', '2023-06-06 05:48:20'),
(267, 8, 'employee', 'interview_scheduled', 4, 'hello, Rajaram you have interview scheduled on 2023-06-08 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:52:02', '2023-06-06 05:52:02'),
(268, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Rajaram on date 2023-06-08 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:52:02', '2023-06-06 05:52:02'),
(269, 22, 'employee', 'interview_scheduled', 4, 'hello, Annu you have interview scheduled on 2023-06-08 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:52:45', '2023-06-06 05:52:45'),
(270, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Annu on date 2023-06-08 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:52:45', '2023-06-06 05:52:45'),
(271, 8, 'employee', 'interview_scheduled', 4, 'hello, Rajaram you have interview scheduled on 2023-06-09 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:53:34', '2023-06-06 05:53:34'),
(272, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Rajaram on date 2023-06-09 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:53:34', '2023-06-06 05:53:34'),
(273, 12, 'employee', 'interview_scheduled', 4, 'hello,  you have interview scheduled on 2023-06-29 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 05:55:42', '2023-06-06 05:55:42'),
(274, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate  on date 2023-06-29 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 05:55:42', '2023-06-06 05:55:42'),
(275, 12, 'employee', 'interview_scheduled', 4, 'hello,  you have interview scheduled on 2023-06-08 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:02:50', '2023-06-06 06:02:50'),
(276, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate  on date 2023-06-08 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 06:02:50', '2023-06-06 06:02:50'),
(277, 12, 'employee', 'interview_scheduled', 4, 'hello,  you have interview scheduled on 2023-06-08 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:05:49', '2023-06-06 06:05:49'),
(278, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate  on date 2023-06-08 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 06:05:49', '2023-06-06 06:05:49'),
(279, 8, 'employee', 'interview_scheduled', 4, 'hello, Rajaram you have interview scheduled on 2023-06-29 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:06:55', '2023-06-06 06:06:55'),
(280, 3, 'manager', 'interview_scheduled', 4, 'A new interview scheduled of candidate Rajaram on date 2023-06-29 for job title Web Developer posted by company WE2CODE', 0, '2023-06-06 06:06:55', '2023-06-06 06:06:55'),
(281, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-06-16 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:25:48', '2023-06-06 06:25:48'),
(282, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-06-16 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 06:25:48', '2023-06-06 06:25:48'),
(283, 3, 'employee', 'interview_scheduled', 7, 'hello, Vinod you have interview scheduled on 2023-06-24 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:25:54', '2023-06-06 06:25:54'),
(284, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Vinod on date 2023-06-24 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 06:25:54', '2023-06-06 06:25:54'),
(285, 3, 'employee', 'interview_scheduled', 7, 'hello, Vinod you have interview scheduled on 2023-06-17 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:25:59', '2023-06-06 06:25:59'),
(286, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Vinod on date 2023-06-17 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 06:25:59', '2023-06-06 06:25:59'),
(287, 3, 'employee', 'interview_scheduled', 7, 'hello, Vinod you have interview scheduled on 2023-06-24 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:27:18', '2023-06-06 06:27:18'),
(288, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Vinod on date 2023-06-24 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 06:27:18', '2023-06-06 06:27:18'),
(289, 3, 'employee', 'interview_scheduled', 7, 'hello, Vinod you have interview scheduled on 2023-06-14 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:41:38', '2023-06-06 06:41:38'),
(290, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Vinod on date 2023-06-14 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 06:41:38', '2023-06-06 06:41:38'),
(291, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-06-10 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:44:21', '2023-06-06 06:44:21'),
(292, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-06-10 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 06:44:21', '2023-06-06 06:44:21'),
(293, 3, 'employee', 'interview_scheduled', 7, 'hello, Vinod you have interview scheduled on 2023-06-09 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:44:30', '2023-06-06 06:44:30'),
(294, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Vinod on date 2023-06-09 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 06:44:30', '2023-06-06 06:44:30'),
(295, 3, 'employee', 'interview_scheduled', 7, 'hello, Vinod you have interview scheduled on 2023-06-23 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:45:11', '2023-06-06 06:45:11'),
(296, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Vinod on date 2023-06-23 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 06:45:11', '2023-06-06 06:45:11'),
(297, 5, 'employee', 'interview_scheduled', 7, 'hello, Sakshi desai you have interview scheduled on 2023-06-08 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:45:36', '2023-06-06 06:45:36'),
(298, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Sakshi desai on date 2023-06-08 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 06:45:36', '2023-06-06 06:45:36'),
(299, 3, 'employee', 'interview_scheduled', 7, 'hello, Vinod you have interview scheduled on 2023-06-09 for job with title - Receptionist you have applied on, scheduled with WE2CODE', 0, '2023-06-06 06:47:08', '2023-06-06 06:47:08'),
(300, 3, 'manager', 'interview_scheduled', 7, 'A new interview scheduled of candidate Vinod on date 2023-06-09 for job title Receptionist posted by company WE2CODE', 0, '2023-06-06 06:47:08', '2023-06-06 06:47:08'),
(301, 7, 'company', 'added_new_job', 15, 'A new job with title-Driver has been added successfully', 0, '2023-06-06 08:46:47', '2023-06-06 08:46:47'),
(302, 7, 'company', 'applied_on_job', 15, 'A new user applied on job with title - Driver', 0, '2023-06-06 08:47:05', '2023-06-06 08:47:05'),
(303, 7, 'company', 'applied_on_job', 15, 'A new user applied on job with title - Driver', 0, '2023-06-07 10:13:20', '2023-06-07 10:13:20'),
(304, 8, 'company', 'applied_on_job', 14, 'A new user applied on job with title - React js developer', 0, '2023-06-07 10:14:15', '2023-06-07 10:14:15'),
(305, 4, 'company', 'applied_on_job', 11, 'A new user applied on job with title - React js developer', 0, '2023-06-07 10:18:54', '2023-06-07 10:18:54'),
(306, 4, 'company', 'applied_on_job', 11, 'A new user applied on job with title - React js developer', 0, '2023-06-07 10:18:58', '2023-06-07 10:18:58'),
(307, 1, 'company', 'applied_on_job', 10, 'A new user applied on job with title - Head Manager', 0, '2023-06-07 10:20:30', '2023-06-07 10:20:30'),
(308, 5, 'manager', 'new_user_registered', 0, 'A new user aashi.we2code@gmail.com registered successfully', 0, '2023-06-12 06:57:23', '2023-06-12 06:57:23'),
(309, 5, 'manager', 'new_employer_registered', 13, 'A new employer aashi.we2code@gmail.com registered successfully', 0, '2023-06-12 07:20:27', '2023-06-12 07:20:27'),
(310, 13, 'company', 'added_new_job', 16, 'A new job with title-React js developer has been added successfully', 0, '2023-06-12 08:28:48', '2023-06-12 08:28:48'),
(311, 1, 'company', 'added_new_job', 17, 'A new job with title-Driver has been added successfully', 0, '2023-06-12 08:58:17', '2023-06-12 08:58:17'),
(312, 1, 'super-admin', 'added_new_job', 17, 'A new job with title-Driver has been added successfully', 0, '2023-06-12 08:58:17', '2023-06-12 08:58:17'),
(313, 12, 'company', 'added_new_job', 18, 'A new job with title-Math\'s Teacher has been added successfully', 0, '2023-06-12 09:08:31', '2023-06-12 09:08:31'),
(314, 1, 'super-admin', 'added_new_job', 18, 'A new job with title-Math\'s Teacher has been added successfully', 0, '2023-06-12 09:08:31', '2023-06-12 09:08:31'),
(315, 13, 'company', 'added_new_job', 19, 'A new job with title-React js developer has been added successfully', 0, '2023-06-12 09:44:19', '2023-06-12 09:44:19'),
(316, 5, 'manager', 'added_new_job', 21, 'A new job with title-Shreestha soni has been added successfully', 0, '2023-06-12 09:51:14', '2023-06-12 09:51:14'),
(317, 5, 'manager', 'added_new_job', 22, 'A new job with title-dgfh has been added successfully', 0, '2023-06-12 09:56:52', '2023-06-12 09:56:52'),
(318, 13, 'company', 'applied_on_job', 20, 'A new user applied on job with title - React js developer', 0, '2023-06-12 10:10:33', '2023-06-12 10:10:33'),
(319, 13, 'company', 'applied_on_job', 19, 'A new user applied on job with title - React js developer', 0, '2023-06-12 10:37:05', '2023-06-12 10:37:05'),
(320, 13, 'company', 'applied_on_job', 21, 'A new user applied on job with title - Shreestha soni', 0, '2023-06-12 10:40:10', '2023-06-12 10:40:10'),
(321, 26, 'employee', 'interview_scheduled', 20, 'hello, Annu you have interview scheduled on 2023-06-12 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 10:44:52', '2023-06-12 10:44:52'),
(322, 1, 'super-admin', 'interview_scheduled', 20, 'A new interview scheduled of candidate Annu on date 2023-06-12 for job title React js developer posted by company Infobeans', 0, '2023-06-12 10:44:52', '2023-06-12 10:44:52'),
(323, 26, 'employee', 'interview_scheduled', 20, 'hello, Annu you have interview scheduled on 2023-06-13 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 10:46:38', '2023-06-12 10:46:38'),
(324, 1, 'super-admin', 'interview_scheduled', 20, 'A new interview scheduled of candidate Annu on date 2023-06-13 for job title React js developer posted by company Infobeans', 0, '2023-06-12 10:46:38', '2023-06-12 10:46:38'),
(325, 26, 'employee', 'interview_scheduled', 19, 'hello, Annu you have interview scheduled on 2023-06-14 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 10:48:24', '2023-06-12 10:48:24'),
(326, 1, 'super-admin', 'interview_scheduled', 19, 'A new interview scheduled of candidate Annu on date 2023-06-14 for job title React js developer posted by company Infobeans', 0, '2023-06-12 10:48:24', '2023-06-12 10:48:24'),
(327, 26, 'employee', 'interview_scheduled', 20, 'hello, Annu you have interview scheduled on 2023-06-12 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 10:56:55', '2023-06-12 10:56:55'),
(328, 1, 'super-admin', 'interview_scheduled', 20, 'A new interview scheduled of candidate Annu on date 2023-06-12 for job title React js developer posted by company Infobeans', 0, '2023-06-12 10:56:55', '2023-06-12 10:56:55'),
(329, 26, 'employee', 'interview_scheduled', 20, 'hello, Annu you have interview scheduled on 2023-06-13 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 11:12:48', '2023-06-12 11:12:48'),
(330, 1, 'super-admin', 'interview_scheduled', 20, 'A new interview scheduled of candidate Annu on date 2023-06-13 for job title React js developer posted by company Infobeans', 0, '2023-06-12 11:12:48', '2023-06-12 11:12:48'),
(331, 26, 'employee', 'interview_scheduled', 20, 'hello, Annu you have interview scheduled on 2023-06-12 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 11:14:19', '2023-06-12 11:14:19'),
(332, 1, 'super-admin', 'interview_scheduled', 20, 'A new interview scheduled of candidate Annu on date 2023-06-12 for job title React js developer posted by company Infobeans', 0, '2023-06-12 11:14:19', '2023-06-12 11:14:19'),
(333, 26, 'employee', 'interview_scheduled', 19, 'hello, Annu you have interview scheduled on 2023-06-13 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 11:15:10', '2023-06-12 11:15:10'),
(334, 1, 'super-admin', 'interview_scheduled', 19, 'A new interview scheduled of candidate Annu on date 2023-06-13 for job title React js developer posted by company Infobeans', 0, '2023-06-12 11:15:10', '2023-06-12 11:15:10'),
(335, 26, 'employee', 'interview_scheduled', 19, 'hello, Annu you have interview scheduled on 2023-06-14 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 11:24:42', '2023-06-12 11:24:42'),
(336, 1, 'super-admin', 'interview_scheduled', 19, 'A new interview scheduled of candidate Annu on date 2023-06-14 for job title React js developer posted by company Infobeans', 0, '2023-06-12 11:24:42', '2023-06-12 11:24:42'),
(337, 26, 'employee', 'interview_scheduled', 19, 'hello, Annu you have interview scheduled on 2023-06-13 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 12:05:15', '2023-06-12 12:05:15'),
(338, 13, 'company', 'interview_scheduled', 19, 'hello, Infobeans you have interview scheduled on 2023-06-13 for job with title - React js developer, scheduled with Annu', 0, '2023-06-12 12:05:15', '2023-06-12 12:05:15'),
(339, 1, 'super-admin', 'interview_scheduled', 19, 'A new interview scheduled of candidate Annu on date 2023-06-13 for job title React js developer posted by company Infobeans', 0, '2023-06-12 12:05:15', '2023-06-12 12:05:15'),
(340, 26, 'employee', 'interview_scheduled', 20, 'hello, Annu you have interview scheduled on 2023-06-12 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 12:12:11', '2023-06-12 12:12:11'),
(341, 13, 'company', 'interview_scheduled', 20, 'hello, Infobeans you have interview scheduled on 2023-06-12 for job with title - React js developer, scheduled with Annu', 0, '2023-06-12 12:12:11', '2023-06-12 12:12:11'),
(342, 1, 'super-admin', 'interview_scheduled', 20, 'A new interview scheduled of candidate Annu on date 2023-06-12 for job title React js developer posted by company Infobeans', 0, '2023-06-12 12:12:11', '2023-06-12 12:12:11'),
(343, 26, 'employee', 'interview_scheduled', 19, 'hello, Annu you have interview scheduled on 2023-06-12 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 12:15:37', '2023-06-12 12:15:37'),
(344, 13, 'company', 'interview_scheduled', 19, 'hello, Infobeans you have interview scheduled on 2023-06-12 for job with title - React js developer, scheduled with Annu', 0, '2023-06-12 12:15:37', '2023-06-12 12:15:37'),
(345, 1, 'super-admin', 'interview_scheduled', 19, 'A new interview scheduled of candidate Annu on date 2023-06-12 for job title React js developer posted by company Infobeans', 0, '2023-06-12 12:15:37', '2023-06-12 12:15:37'),
(346, 26, 'employee', 'interview_scheduled', 20, 'hello, Annu you have interview scheduled on 2023-06-13 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-12 12:20:14', '2023-06-12 12:20:14'),
(347, 13, 'company', 'interview_scheduled', 20, 'hello, Infobeans you have interview scheduled on 2023-06-13 for job with title - React js developer, scheduled with Annu', 0, '2023-06-12 12:20:14', '2023-06-12 12:20:14'),
(348, 1, 'super-admin', 'interview_scheduled', 20, 'A new interview scheduled of candidate Annu on date 2023-06-13 for job title React js developer posted by company Infobeans', 0, '2023-06-12 12:20:14', '2023-06-12 12:20:14'),
(349, 4, 'company', 'Lmia status changed', 5, 'Lmia status changed.', 0, '2023-06-13 09:00:27', '2023-06-13 09:00:27'),
(350, 4, 'company', 'Lmia status changed', 5, 'Lmia status changed.', 0, '2023-06-13 09:02:40', '2023-06-13 09:02:40'),
(351, 4, 'company', 'Lmia status changed', 5, 'Lmia status changed to Complete for employee Rajaram', 0, '2023-06-13 09:10:16', '2023-06-13 09:10:16'),
(352, 4, 'company', 'Lmia status changed', 8, 'Lmia status changed to Reject for employee Rajaram', 0, '2023-06-13 09:12:10', '2023-06-13 09:12:10'),
(353, 4, 'company', 'Lmia status changed', 8, 'Lmia status changed to Complete for employee Rajaram', 0, '2023-06-13 09:37:36', '2023-06-13 09:37:36'),
(354, 4, 'company', 'Lmia status changed', 8, 'Lmia status changed to Reject for employee Rajaram', 0, '2023-06-13 09:39:28', '2023-06-13 09:39:28'),
(355, 4, 'company', 'Lmia status changed', 8, 'Lmia status changed to Complete for employee Rajaram', 0, '2023-06-13 09:41:57', '2023-06-13 09:41:57'),
(356, 5, 'manager', 'new_user_registered', 27, 'A new user chetan.barod.we2code@gmail.com registered successfully', 0, '2023-06-20 07:22:35', '2023-06-20 07:22:35'),
(357, 13, 'company', 'applied_on_job', 22, 'A new user applied on job with title - dgfh', 0, '2023-06-20 07:22:48', '2023-06-20 07:22:48'),
(358, 13, 'company', 'applied_on_job', 20, 'A new user applied on job with title - React js developer', 0, '2023-06-20 07:31:26', '2023-06-20 07:31:26'),
(359, 13, 'company', 'applied_on_job', 19, 'A new user applied on job with title - React js developer', 0, '2023-06-20 07:31:35', '2023-06-20 07:31:35'),
(360, 13, 'company', 'applied_on_job', 19, 'A new user applied on job with title - React js developer', 0, '2023-06-20 07:31:37', '2023-06-20 07:31:37'),
(361, 5, 'manager', 'new_employer_registered', 14, 'A new employer chetan.barod.we2code@gmail.com registered successfully', 0, '2023-06-20 07:35:09', '2023-06-20 07:35:09'),
(362, 5, 'manager', 'added_new_job', 23, 'A new job with title-React js developer has been added successfully', 0, '2023-06-20 07:36:34', '2023-06-20 07:36:34'),
(363, 1, 'company', 'added_new_job', 24, 'A new job with title-Driver has been added successfully', 0, '2023-06-20 08:24:58', '2023-06-20 08:24:58'),
(364, 13, 'company', 'Lmia status changed', 27, 'Lmia status changed to Reject for employee Chetan Barod', 0, '2023-06-20 08:37:14', '2023-06-20 08:37:14'),
(365, 14, 'company', 'applied_on_job', 23, 'A new user applied on job with title - React js developer', 0, '2023-06-20 08:47:33', '2023-06-20 08:47:33'),
(366, 14, 'company', 'applied_on_job', 23, 'A new user applied on job with title - React js developer', 0, '2023-06-20 08:47:36', '2023-06-20 08:47:36'),
(367, 14, 'company', 'added_new_job', 25, 'A new job with title-Driver has been added successfully', 0, '2023-06-20 09:09:53', '2023-06-20 09:09:53'),
(368, 27, 'employee', 'interview_scheduled', 21, 'hello, Chetan Barod you have interview scheduled on 2023-06-21 for job with title - Shreestha soni you have applied on, scheduled with Infobeans', 0, '2023-06-20 09:21:12', '2023-06-20 09:21:12'),
(369, 13, 'company', 'interview_scheduled', 21, 'hello, Infobeans you have interview scheduled on 2023-06-21 for job with title - Shreestha soni, scheduled with Chetan Barod', 0, '2023-06-20 09:21:12', '2023-06-20 09:21:12'),
(370, 1, 'super-admin', 'interview_scheduled', 21, 'A new interview scheduled of candidate Chetan Barod on date 2023-06-21 for job title Shreestha soni posted by company Infobeans', 0, '2023-06-20 09:21:12', '2023-06-20 09:21:12'),
(371, 6, 'employee', 'interview_scheduled', 3, 'hello, Warren you have interview scheduled on 2023-06-20 for job with title - Shop worker you have applied on, scheduled with Sention', 0, '2023-06-20 09:25:20', '2023-06-20 09:25:20'),
(372, 3, 'company', 'interview_scheduled', 3, 'hello, Sention you have interview scheduled on 2023-06-20 for job with title - Shop worker, scheduled with Warren', 0, '2023-06-20 09:25:20', '2023-06-20 09:25:20'),
(373, 1, 'super-admin', 'interview_scheduled', 3, 'A new interview scheduled of candidate Warren on date 2023-06-20 for job title Shop worker posted by company Sention', 0, '2023-06-20 09:25:20', '2023-06-20 09:25:20'),
(374, 6, 'employee', 'interview_scheduled', 3, 'hello, Warren you have interview scheduled on 2023-06-20 for job with title - Shop worker you have applied on, scheduled with Sention', 0, '2023-06-20 10:07:41', '2023-06-20 10:07:41'),
(375, 3, 'company', 'interview_scheduled', 3, 'hello, Sention you have interview scheduled on 2023-06-20 for job with title - Shop worker, scheduled with Warren', 0, '2023-06-20 10:07:41', '2023-06-20 10:07:41'),
(376, 1, 'super-admin', 'interview_scheduled', 3, 'A new interview scheduled of candidate Warren on date 2023-06-20 for job title Shop worker posted by company Sention', 0, '2023-06-20 10:07:41', '2023-06-20 10:07:41'),
(377, 6, 'employee', 'interview_scheduled', 3, 'hello, Warren you have interview scheduled on 2023-06-20 for job with title - Shop worker you have applied on, scheduled with Sention', 0, '2023-06-20 10:10:20', '2023-06-20 10:10:20'),
(378, 3, 'company', 'interview_scheduled', 3, 'hello, Sention you have interview scheduled on 2023-06-20 for job with title - Shop worker, scheduled with Warren', 0, '2023-06-20 10:10:20', '2023-06-20 10:10:20'),
(379, 1, 'super-admin', 'interview_scheduled', 3, 'A new interview scheduled of candidate Warren on date 2023-06-20 for job title Shop worker posted by company Sention', 0, '2023-06-20 10:10:20', '2023-06-20 10:10:20'),
(380, 6, 'employee', 'interview_scheduled', 3, 'hello, Warren you have interview scheduled on 2023-06-20 for job with title - Shop worker you have applied on, scheduled with Sention', 0, '2023-06-20 10:10:28', '2023-06-20 10:10:28'),
(381, 3, 'company', 'interview_scheduled', 3, 'hello, Sention you have interview scheduled on 2023-06-20 for job with title - Shop worker, scheduled with Warren', 0, '2023-06-20 10:10:28', '2023-06-20 10:10:28'),
(382, 1, 'super-admin', 'interview_scheduled', 3, 'A new interview scheduled of candidate Warren on date 2023-06-20 for job title Shop worker posted by company Sention', 0, '2023-06-20 10:10:28', '2023-06-20 10:10:28'),
(383, 26, 'employee', 'interview_scheduled', 19, 'hello, Annu you have interview scheduled on 2023-06-12 for job with title - React js developer you have applied on, scheduled with Infobeans', 0, '2023-06-20 10:26:18', '2023-06-20 10:26:18'),
(384, 13, 'company', 'interview_scheduled', 19, 'hello, Infobeans you have interview scheduled on 2023-06-12 for job with title - React js developer, scheduled with Annu', 0, '2023-06-20 10:26:18', '2023-06-20 10:26:18'),
(385, 1, 'super-admin', 'interview_scheduled', 19, 'A new interview scheduled of candidate Annu on date 2023-06-12 for job title React js developer posted by company Infobeans', 0, '2023-06-20 10:26:18', '2023-06-20 10:26:18'),
(386, 8, 'company', 'applied_on_job', 14, 'A new user applied on job with title - React js developer', 0, '2023-06-30 10:12:50', '2023-06-30 10:12:50'),
(387, 7, 'super-admin', 'applied_on_job', 14, 'A new user applied on job with title - React js developer', 0, '2023-06-30 10:12:50', '2023-06-30 10:12:50'),
(388, 4, 'company', 'applied_on_job', 11, 'A new user applied on job with title - React js developer', 0, '2023-06-30 10:12:56', '2023-06-30 10:12:56'),
(389, 7, 'super-admin', 'applied_on_job', 11, 'A new user applied on job with title - React js developer', 0, '2023-06-30 10:12:56', '2023-06-30 10:12:56'),
(390, 3, 'company', 'added_new_job', 26, 'A new job with title-Raju has been added successfully', 0, '2023-06-30 11:29:16', '2023-06-30 11:29:16'),
(391, 2, 'company', 'added_new_job', 27, 'A new job with title-manager has been added successfully', 0, '2023-07-03 05:25:58', '2023-07-03 05:25:58'),
(392, 3, 'company', 'added_new_job', 28, 'A new job with title-ytujtygjmyj has been added successfully', 0, '2023-07-03 06:05:51', '2023-07-03 06:05:51'),
(393, 3, 'company', 'applied_on_job', 26, 'A new user applied on job with title - Raju', 0, '2023-07-03 12:13:36', '2023-07-03 12:13:36'),
(394, 1, 'super-admin', 'applied_on_job', 26, 'A new user applied on job with title - Raju', 0, '2023-07-03 12:13:36', '2023-07-03 12:13:36'),
(395, 13, 'company', 'applied_on_job', 16, 'A new user applied on job with title - React js developer', 0, '2023-07-04 04:24:38', '2023-07-04 04:24:38'),
(396, 3, 'company', 'applied_on_job', 26, 'A new user applied on job with title - Raju', 0, '2023-07-04 04:24:52', '2023-07-04 04:24:52'),
(397, 3, 'company', 'applied_on_job', 26, 'A new user applied on job with title - Raju', 0, '2023-07-04 04:24:53', '2023-07-04 04:24:53'),
(398, 3, 'company', 'applied_on_job', 3, 'A new user applied on job with title - Shop worker', 0, '2023-07-22 07:11:20', '2023-07-22 07:11:20'),
(399, 1, 'super-admin', 'applied_on_job', 3, 'A new user applied on job with title - Shop worker', 0, '2023-07-22 07:11:20', '2023-07-22 07:11:20'),
(400, 13, 'company', 'applied_on_job', 22, 'A new user applied on job with title - dgfh', 0, '2023-07-22 07:12:24', '2023-07-22 07:12:24'),
(401, 1, 'super-admin', 'applied_on_job', 22, 'A new user applied on job with title - dgfh', 0, '2023-07-22 07:12:24', '2023-07-22 07:12:24'),
(402, 2, 'company', 'applied_on_job', 27, 'A new user applied on job with title - manager', 0, '2023-07-22 07:12:40', '2023-07-22 07:12:40'),
(403, 1, 'super-admin', 'applied_on_job', 27, 'A new user applied on job with title - manager', 0, '2023-07-22 07:12:40', '2023-07-22 07:12:40'),
(404, 1, 'company', 'applied_on_job', 24, 'A new user applied on job with title - Driver', 0, '2023-07-22 17:24:28', '2023-07-22 17:24:28'),
(405, 1, 'super-admin', 'applied_on_job', 24, 'A new user applied on job with title - Driver', 0, '2023-07-22 17:24:28', '2023-07-22 17:24:28'),
(406, 27, 'employee', 'interview_scheduled', 4, 'hello, Chetan Barod you have interview scheduled on 2023-07-25 for job with title - Web Developer you have applied on, scheduled with WE2CODE', 0, '2023-07-24 11:08:42', '2023-07-24 11:08:42'),
(407, 4, 'company', 'interview_scheduled', 4, 'hello, WE2CODE you have interview scheduled on 2023-07-25 for job with title - Web Developer, scheduled with Chetan Barod', 0, '2023-07-24 11:08:42', '2023-07-24 11:08:42'),
(408, 1, 'super-admin', 'interview_scheduled', 4, 'A new interview scheduled of candidate Chetan Barod on date 2023-07-25 for job title Web Developer posted by company WE2CODE', 0, '2023-07-24 11:08:42', '2023-07-24 11:08:42'),
(409, 4, 'company', 'applied_on_job', 6, 'A new user applied on job with title - Hr', 0, '2023-07-24 12:18:30', '2023-07-24 12:18:30'),
(410, 1, 'super-admin', 'applied_on_job', 6, 'A new user applied on job with title - Hr', 0, '2023-07-24 12:18:30', '2023-07-24 12:18:30'),
(411, 2, 'company', 'added_new_job', 29, 'A new job with title-Driver has been added successfully', 0, '2023-07-24 12:32:48', '2023-07-24 12:32:48'),
(412, 2, 'company', 'applied_on_job', 29, 'A new user applied on job with title - Driver', 0, '2023-07-24 12:49:36', '2023-07-24 12:49:36'),
(413, 1, 'super-admin', 'applied_on_job', 29, 'A new user applied on job with title - Driver', 0, '2023-07-24 12:49:36', '2023-07-24 12:49:36'),
(414, 1, 'company', 'added_new_job', 30, 'A new job with title-xcvx has been added successfully', 0, '2023-07-24 12:54:36', '2023-07-24 12:54:36'),
(415, 2, 'company', 'applied_on_job', 27, 'A new user applied on job with title - manager', 0, '2023-07-24 13:17:00', '2023-07-24 13:17:00'),
(416, 1, 'super-admin', 'applied_on_job', 27, 'A new user applied on job with title - manager', 0, '2023-07-24 13:17:00', '2023-07-24 13:17:00'),
(417, 3, 'company', 'applied_on_job', 28, 'A new user applied on job with title - ytujtygjmyj', 0, '2023-07-24 13:17:02', '2023-07-24 13:17:02'),
(418, 1, 'super-admin', 'applied_on_job', 28, 'A new user applied on job with title - ytujtygjmyj', 0, '2023-07-24 13:17:02', '2023-07-24 13:17:02'),
(419, 13, 'company', 'applied_on_job', 19, 'A new user applied on job with title - React js developer', 0, '2023-07-24 13:17:19', '2023-07-24 13:17:19'),
(420, 1, 'super-admin', 'applied_on_job', 19, 'A new user applied on job with title - React js developer', 0, '2023-07-24 13:17:19', '2023-07-24 13:17:19');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(101) NOT NULL,
  `email` varchar(101) NOT NULL,
  `otp` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `email`, `otp`, `created_at`) VALUES
(1, 'utkarsh.we2code@gmail.com', 295107, '2023-05-20 12:04:40'),
(2, 'aashi.we2code@gmail.com', 601985, '2023-05-20 12:04:45'),
(3, 'raj.we2codee@gmail.com', 533420, '2023-05-22 08:31:49'),
(4, 'aashi.we2code@gmail.com', 708711, '2023-05-22 08:53:11'),
(5, 'sagar.we2code@gmail.com', 315056, '2023-05-23 11:28:17'),
(6, 'raj.we2code@gmail.com', 847749, '2023-05-25 15:26:59'),
(7, 'raj.we2code@gmail.com', 827916, '2023-05-27 10:16:59'),
(8, 'raj.we2code@gmail.com', 396202, '2023-05-27 10:18:02'),
(9, 'raj.we2code@gmail.com', 598030, '2023-05-27 10:20:08'),
(10, 'g.choudhary.we2code@gmail.com', 979496, '2023-05-29 04:34:42'),
(11, 'g.choudhary.we2code@gmail.com', 502123, '2023-05-29 04:34:56'),
(12, 'g.choudhary.we2code@gmail.com', 407323, '2023-05-29 04:36:54'),
(13, 'g.choudhary.we2code@gmail.com', 801475, '2023-05-29 04:37:17'),
(14, 'g.choudhary.we2code@gmail.com', 659319, '2023-05-29 04:50:11'),
(15, 'aashi.we2code@gmail.com', 555065, '2023-05-29 04:55:24'),
(16, 'aashi.we2code@gmail.com', 250763, '2023-06-05 06:59:16'),
(17, 'aashi.we2code@gmail.com', 696595, '2023-06-05 07:10:12'),
(18, 'mayur.we2code@gmail.com', 126730, '2023-06-05 07:12:33'),
(19, 'sagar.we2code@gmail.com', 408517, '2023-06-07 09:45:34'),
(20, 'sagar.we2code@gmail.com', 806702, '2023-06-07 09:50:26'),
(21, 'mayur.we2cpd@gmail.com', 953864, '2023-06-07 09:53:47'),
(22, 'mayur.we2code@gmail.com', 771592, '2023-06-07 09:56:27'),
(23, 'aashi.we2code@gmail.com', 979461, '2023-06-12 05:37:38'),
(24, 'aashi.we2code@gmail.com', 509581, '2023-06-12 06:27:46'),
(25, 'aashi.we2code@gmail.com', 908457, '2023-06-12 06:39:25'),
(26, 'aashi.we2code@gmail.com', 904783, '2023-06-12 06:42:57'),
(27, 'aashi.we2code@gmail.com', 375078, '2023-06-12 06:44:59'),
(28, 'aashi.we2code@gmail.com', 198930, '2023-06-12 06:47:30'),
(29, 'aashi.we2code@gmail.com', 784267, '2023-06-12 06:56:37'),
(30, 'aashi.we2codae@gmail.com', 522048, '2023-06-12 07:18:01'),
(31, 'aashi.we2code@gmail.com', 533399, '2023-06-12 07:19:04'),
(32, 'raj.we2code@gmail.com', 502048, '2023-06-20 07:17:31'),
(33, 'chetan.barod.we2code@gmail.com', 877988, '2023-06-20 07:21:21'),
(34, 'chetan.barod.we2code@gmail.com', 947156, '2023-06-20 07:33:06'),
(35, 'utkarsh.we2code@gmail.com', 751741, '2023-06-30 06:43:24'),
(36, 'g.choudhary.we2wcode@gmail.com', 424971, '2023-07-26 04:29:15');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Stand-in structure for view `view_applied_employee`
-- (See below for the actual view)
--
CREATE TABLE `view_applied_employee` (
`apply_id` int(101)
,`job_id` int(101)
,`employee_id` int(101)
,`is_viewed` smallint(11)
,`created_at` timestamp
,`updated_at` timestamp
,`job_title` varchar(251)
,`company_id` int(101)
,`company_name` varchar(251)
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
,`resume` varchar(301)
,`profile_photo` varchar(255)
,`created_by_admin` int(51)
,`is_deleted` tinyint(1)
,`education` text
,`specialization` text
,`skill` varchar(256)
,`id` int(51)
,`lmia_status` varchar(51)
,`expected_time_of_completion` date
,`interview_date` date
,`is_active` tinyint(1)
,`status` varchar(21)
,`employee_created_by_admin` int(51)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_employee_profile_percentage`
-- (See below for the actual view)
--
CREATE TABLE `view_employee_profile_percentage` (
`employee_id` int(101)
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
,`employee_id` int(101)
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
,`job_id` int(101)
,`job_title` varchar(251)
,`job_deleted` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_job_posted`
-- (See below for the actual view)
--
CREATE TABLE `view_job_posted` (
`job_id` int(101)
,`company_id` int(101)
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
,`is_active` tinyint(1)
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
);

-- --------------------------------------------------------

--
-- Structure for view `employee_view`
--
DROP TABLE IF EXISTS `employee_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `employee_view`  AS SELECT `e`.`employee_id` AS `employee_id`, `e`.`name` AS `name`, `e`.`email` AS `email`, `e`.`password` AS `password`, `e`.`contact_no` AS `contact_no`, `e`.`description` AS `description`, `e`.`date_of_birth` AS `date_of_birth`, `e`.`gender` AS `gender`, `e`.`marital_status` AS `marital_status`, `e`.`nationality` AS `nationality`, `e`.`current_location` AS `current_location`, `e`.`currently_located_country` AS `currently_located_country`, `e`.`language` AS `language`, `e`.`religion` AS `religion`, `e`.`interested_in` AS `interested_in`, `e`.`experience` AS `experience`, `e`.`work_permit_canada` AS `work_permit_canada`, `e`.`work_permit_other_country` AS `work_permit_other_country`, `e`.`is_posted` AS `is_posted`, `e`.`posted_company_id` AS `posted_company_id`, `e`.`date_of_posting` AS `date_of_posting`, `e`.`designation``` AS `designation```, `e`.`resume` AS `resume`, `e`.`profile_photo` AS `profile_photo`, `e`.`created_at` AS `created_at`, `e`.`created_by_admin` AS `created_by_admin`, `e`.`updated_at` AS `updated_at`, `e`.`is_deleted` AS `is_deleted`, `e`.`token` AS `token`, (((`epp`.`personal` + `epp`.`education`) + `epp`.`Career`) + `epp`.`skill`) AS `profile_complete`, `education`.`education` AS `education`, `education`.`specialization` AS `specialization`, (select group_concat(`employee_skill`.`skill` separator ',') from `employee_skill` where (`employee_skill`.`employee_id` = `e`.`employee_id`)) AS `skill` FROM ((`employee` `e` left join (select `employee_education`.`employee_id` AS `employee_id`,group_concat(`employee_education`.`course` separator ',') AS `education`,group_concat(`employee_education`.`specialization` separator ',') AS `specialization` from `employee_education` group by `employee_education`.`employee_id`) `education` on((`education`.`employee_id` = `e`.`employee_id`))) left join `view_employee_profile_percentage` `epp` on((`epp`.`employee_id` = `e`.`employee_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_applied_employee`
--
DROP TABLE IF EXISTS `view_applied_employee`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_applied_employee`  AS SELECT `aoj`.`apply_id` AS `apply_id`, `aoj`.`job_id` AS `job_id`, `aoj`.`employee_id` AS `employee_id`, `aoj`.`is_viewed` AS `is_viewed`, `aoj`.`created_at` AS `created_at`, `aoj`.`updated_at` AS `updated_at`, `vjp`.`job_title` AS `job_title`, `vjp`.`company_id` AS `company_id`, `vjp`.`company_name` AS `company_name`, `vjp`.`created_by_admin` AS `job_created_by_admin`, `ev`.`name` AS `name`, `ev`.`email` AS `email`, `ev`.`contact_no` AS `contact_no`, `ev`.`description` AS `description`, `ev`.`date_of_birth` AS `date_of_birth`, `ev`.`gender` AS `gender`, `ev`.`marital_status` AS `marital_status`, `ev`.`nationality` AS `nationality`, `ev`.`current_location` AS `current_location`, `ev`.`currently_located_country` AS `currently_located_country`, `ev`.`language` AS `language`, `ev`.`religion` AS `religion`, `ev`.`interested_in` AS `interested_in`, `ev`.`experience` AS `experience`, `ev`.`work_permit_canada` AS `work_permit_canada`, `ev`.`work_permit_other_country` AS `work_permit_other_country`, `ev`.`resume` AS `resume`, `ev`.`profile_photo` AS `profile_photo`, `ev`.`created_by_admin` AS `created_by_admin`, `ev`.`is_deleted` AS `is_deleted`, `ev`.`education` AS `education`, `ev`.`specialization` AS `specialization`, `ev`.`skill` AS `skill`, `lmia`.`id` AS `id`, `lmia`.`lmia_status` AS `lmia_status`, `lmia`.`expected_time_of_completion` AS `expected_time_of_completion`, `ji`.`interview_date` AS `interview_date`, `ji`.`is_active` AS `is_active`, `ji`.`status` AS `status`, `ji`.`created_by_admin` AS `employee_created_by_admin` FROM ((((`apply_on_job` `aoj` join `employee_view` `ev` on((`aoj`.`employee_id` = `ev`.`employee_id`))) join `view_job_posted` `vjp` on((`vjp`.`job_id` = `aoj`.`job_id`))) left join `lmia` on(((`lmia`.`employee_id` = `aoj`.`employee_id`) and (`lmia`.`job_id` = `aoj`.`job_id`)))) left join `job_interviews` `ji` on(((`ji`.`employee_id` = `aoj`.`employee_id`) and (`ji`.`job_id` = `aoj`.`job_id`) and (`ji`.`is_reschedule` <> 1)))) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_job_posted`  AS SELECT `j`.`job_id` AS `job_id`, `j`.`company_id` AS `company_id`, `j`.`job_title` AS `job_title`, `j`.`experience_required` AS `experience_required`, `j`.`salary` AS `salary`, `j`.`location` AS `location`, `j`.`industry_type` AS `industry_type`, `j`.`apply_link` AS `apply_link`, `j`.`job_description` AS `job_description`, `j`.`your_duties` AS `your_duties`, `j`.`requirement` AS `requirement`, `j`.`department` AS `department`, `j`.`job_type` AS `job_type`, `j`.`role_category` AS `role_category`, `j`.`education` AS `education`, `j`.`language` AS `language`, `j`.`keyskill` AS `keyskill`, `j`.`employement` AS `employement`, `j`.`job_category_id` AS `job_category_id`, `j`.`is_active` AS `is_active`, `j`.`created_at` AS `created_at`, `j`.`updated_at` AS `updated_at`, `j`.`created_by_admin` AS `created_by_admin`, `j`.`is_featured` AS `is_featured`, `j`.`is_deleted` AS `is_deleted`, `jc`.`category_type` AS `category_type`, `e`.`company_name` AS `company_name`, `e`.`email` AS `email`, `e`.`contact_no_other` AS `contact_no_other`, `e`.`industry` AS `industry`, `e`.`about` AS `about`, `e`.`logo` AS `logo`, `e`.`address` AS `address`, `e`.`company_size` AS `company_size`, `e`.`corporation` AS `corporation`, `e`.`is_deleted` AS `company_deleted`, count((case when ((`a`.`is_viewed` <> 1) and (`ee`.`is_deleted` = 0)) then `a`.`employee_id` else NULL end)) AS `total_applicants` FROM ((((`jobs` `j` left join `apply_on_job` `a` on((`j`.`job_id` = `a`.`job_id`))) join `job_category` `jc` on((`j`.`job_category_id` = `jc`.`job_category_id`))) join `employer` `e` on((`j`.`company_id` = `e`.`company_id`))) left join `employee` `ee` on((`ee`.`employee_id` = `a`.`employee_id`))) GROUP BY `j`.`job_id` ;

--
-- Indexes for dumped tables
--

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
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`company_id`);

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
  ADD PRIMARY KEY (`job_id`);

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
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `apply_on_job`
--
ALTER TABLE `apply_on_job`
  MODIFY `apply_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `company_kyc`
--
ALTER TABLE `company_kyc`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `employee_career`
--
ALTER TABLE `employee_career`
  MODIFY `career_id` int(251) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_education`
--
ALTER TABLE `employee_education`
  MODIFY `education_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `employee_setting`
--
ALTER TABLE `employee_setting`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_skill`
--
ALTER TABLE `employee_skill`
  MODIFY `skill_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `company_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employer_setting`
--
ALTER TABLE `employer_setting`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=560;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `job_category`
--
ALTER TABLE `job_category`
  MODIFY `job_category_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `job_interviews`
--
ALTER TABLE `job_interviews`
  MODIFY `id` int(51) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `list`
--
ALTER TABLE `list`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lmia`
--
ALTER TABLE `lmia`
  MODIFY `id` int(51) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=421;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
