-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 17, 2023 at 09:56 AM
-- Server version: 5.7.41
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
CREATE DEFINER=`apnaorga`@`localhost` PROCEDURE `otp` ()   BEGIN
    DELETE FROM otp WHERE created_at < (NOW() - INTERVAL 2 MINUTE);
END$$

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
(1, 'aashi.we2code@gmail.com', '4ea66a6c68cde0ae7c4a157b4738fbb6', 'Aashi', 9977445566, 'super-admin', 1, 0, '2023-04-27 10:13:38', '2023-05-13 06:06:09', 1, '587ea74f1e1c1b667fcfa0826f5ac338'),
(2, 'raj.we2code@gmail.com', '4ea66a6c68cde0ae7c4a157b4738fbb6', 'Raj', NULL, 'super-admin', 1, 0, '2023-04-27 11:17:23', '2023-05-15 06:05:50', 1, ''),
(3, 'ram.we2code@gmail.com', '3db66ceb605c1bcb779c63e180c4f2d0', 'virat ', 9977445566, 'admin', 1, 0, '2023-04-28 09:11:19', '2023-05-10 09:42:06', 1, ''),
(4, 'raj.wfdfgfe2code@gmail.com', 'c8722562fc46b2842f7e398ec32913d9', 'Ramghhgj', NULL, 'manager', 1, 1, '2023-04-28 12:01:24', '2023-05-02 05:55:27', 1, ''),
(5, 'raj.fghgh@fdgg.com', 'd040a933f0b7ce5ecae1788af24495e2', 'Ram', NULL, 'manager', 1, 1, '2023-05-02 05:55:49', '2023-05-02 05:55:49', 1, ''),
(6, 'raj.w@gmail.com', 'cef3716fbd0b7899de14c932929339b7', 'Raj', NULL, 'manager', 1, 1, '2023-05-03 10:10:28', '2023-05-03 10:10:28', 1, ''),
(7, 'Manager@gmail.com', 'b17190ac27bd85559a39b822e2eaf824', 'Manager', NULL, 'manager', 1, 0, '2023-05-04 08:42:07', '2023-05-04 08:42:07', 1, ''),
(8, 'Manafgbfhbger@gmail.com', '6b524aa1d9b1433febdf751e93376b31', 'fg', NULL, 'manager', 1, 1, '2023-05-04 09:14:10', '2023-05-04 09:14:10', 1, ''),
(9, 'utkarsh.we2code@gmail.com', 'fe6717eb62ed9eef1de1163f02b6e1b1', 'Ut', NULL, 'admin', 1, 0, '2023-05-05 10:12:08', '2023-05-10 06:15:15', 1, '716435ac874e7229afdd9007f7b744e2'),
(10, 'sagar.we2code@gmail.com', '4ff691f69007c66f2c03e45a0ed6b760', 'Ra', NULL, 'manager', 1, 1, '2023-05-09 08:49:05', '2023-05-10 05:38:56', 1, ''),
(11, 'Rajsagar@we2codegmail.com', '6effc401334e7778f051166be2bc7d93', 'Rajsagar', NULL, 'manager', 1, 1, '2023-05-10 05:35:46', '2023-05-10 05:35:46', 1, ''),
(12, 'sagar.we2code@gmail.com', '4ff691f69007c66f2c03e45a0ed6b760', 'Sagar sah', NULL, 'manager', 1, 1, '2023-05-10 06:36:36', '2023-05-10 06:36:36', 1, ''),
(13, 'sagar.we2code@gmail.com', '4ff691f69007c66f2c03e45a0ed6b760', 'Sagar shah', NULL, 'super-admin', 1, 0, '2023-05-10 06:41:57', '2023-05-11 04:59:26', 1, ''),
(14, 'Rajsagar@we2codegmail.com', 'f96c8f8c5ac4dc823f20967f5153d0d7', 'Rajsagar', NULL, 'sub-admin', 1, 0, '2023-05-11 05:54:18', '2023-05-11 05:54:18', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `apply_on_job`
--

CREATE TABLE `apply_on_job` (
  `apply_id` int(101) NOT NULL,
  `job_id` int(101) NOT NULL,
  `employee_id` int(101) NOT NULL,
  `is_viewed` smallint(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apply_on_job`
--

INSERT INTO `apply_on_job` (`apply_id`, `job_id`, `employee_id`, `is_viewed`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 0, '2023-04-28 07:28:57', '2023-05-02 11:27:41'),
(2, 8, 4, 0, '2023-04-29 07:29:19', '2023-05-06 06:05:36'),
(3, 5, 4, 0, '2023-04-29 07:32:43', '2023-04-29 07:34:26'),
(4, 5, 6, 2, '2023-04-29 08:39:18', '2023-04-29 08:39:30'),
(6, 1, 4, 0, '2023-05-01 07:21:50', '2023-05-01 07:21:50'),
(7, 9, 4, 0, '2023-05-01 08:46:59', '2023-05-06 06:09:53'),
(8, 6, 4, 1, '2023-05-02 05:03:11', '2023-05-02 11:27:49'),
(9, 2, 6, 1, '2023-05-03 10:38:48', '2023-05-03 10:38:48'),
(10, 3, 6, 1, '2023-05-03 10:53:19', '2023-05-03 10:53:19'),
(23, 14, 12, 0, '2023-05-06 04:22:48', '2023-05-08 11:05:23'),
(24, 7, 12, 0, '2023-05-06 04:30:39', '2023-05-06 06:08:47'),
(25, 15, 12, 0, '2023-05-06 04:37:32', '2023-05-06 10:06:30'),
(26, 15, 12, 0, '2023-05-06 04:39:25', '2023-05-08 10:37:09'),
(27, 21, 12, 3, '2023-05-08 04:35:06', '2023-05-08 04:37:08'),
(28, 14, 11, 3, '2023-05-08 04:45:31', '2023-05-08 04:45:31'),
(29, 9, 13, 3, '2023-05-08 04:55:31', '2023-05-08 04:55:31'),
(30, 9, 14, 0, '2023-05-08 04:59:30', '2023-05-11 10:10:28'),
(31, 10, 12, 0, '2023-05-08 08:58:58', '2023-05-08 08:58:58'),
(32, 14, 18, 0, '2023-05-08 11:38:21', '2023-05-08 11:38:21'),
(33, 15, 17, 0, '2023-05-08 11:39:08', '2023-05-08 11:39:08'),
(34, 3, 18, 0, '2023-05-09 06:46:20', '2023-05-09 06:46:20'),
(35, 3, 17, 0, '2023-05-09 06:46:43', '2023-05-09 06:46:43'),
(36, 15, 18, 0, '2023-05-09 06:47:14', '2023-05-09 06:47:14'),
(37, 12, 18, 0, '2023-05-09 06:54:49', '2023-05-09 06:54:49'),
(38, 12, 12, 0, '2023-05-09 06:55:04', '2023-05-09 06:55:04'),
(39, 12, 31, 0, '2023-05-11 06:57:18', '2023-05-11 06:57:18'),
(40, 10, 31, 0, '2023-05-11 06:57:20', '2023-05-11 06:57:20');

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
(1, 2, 'LKJHG2236P', 'Gourav choudhary', '1998-04-13', 'Ram nagar', 2147483647, 'indore', 'mp', 'india', '37AADCS0472N1Z1', '123-456-7890', 'PDES03028F', 'https://apnaorganicstore.in/canjobs/uploads/1683537447.pdf', '2023-04-28 06:56:24', '2023-05-08 09:17:27'),
(2, 13, 'ABCTY1234D', 'Gourav choudary', '1998-05-02', 'Ram nagar', 752963, 'indore', 'mp', 'India', NULL, NULL, NULL, NULL, '2023-05-04 09:04:51', '2023-05-11 10:57:08'),
(3, 15, 'ABCTY1234D', 'Gourav choudary', '1999-04-30', 'Ram nagar', 752963, 'indore', 'mp', 'India', NULL, NULL, NULL, NULL, '2023-05-06 09:25:59', '2023-05-06 09:25:59'),
(4, 23, 'ABCTY1234D', 'Gourav choudary', '1999-02-02', 'Ram nagar', 752963, 'indore', 'mp', 'India', NULL, NULL, NULL, NULL, '2023-05-06 09:46:26', '2023-05-06 09:46:48');

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
(1, 0, '{\"to\": \"raj.we2code@gmail.com\", \"message\": \"hello, Raj you have interview scheduled on 2023-05-15                  for job with title - Driver you have applied on, scheduled with Gourav Agency \", \"subject\": \"new interview scheduled\"}', 'SENT', 13810, '2023-05-12 06:32:06'),
(2, 0, '{\"to\": \"aashi.we2code@gmail.com\", \"message\": \"new interview scheduled on 2023-05-15 of candidate name Raj with Gourav Agency \", \"subject\": \"new interview scheduled\"}', 'SENT', 13810, '2023-05-12 06:32:06'),
(3, 0, '{\"to\": \"raj.we2code@gmail.com\", \"message\": \"hello, Raj you have interview scheduled on 2023-05-15                  for job with title - Driver you have applied on, scheduled with Gourav Agency \", \"subject\": \"new interview scheduled\"}', 'SENT', 13912, '2023-05-12 06:43:59'),
(4, 0, '{\"to\": \"aashi.we2code@gmail.com\", \"message\": \"new interview scheduled on 2023-05-15 of candidate name Raj with Gourav Agency \", \"subject\": \"new interview scheduled\"}', 'SENT', 13912, '2023-05-12 06:43:59'),
(5, 0, '{\"to\": \"raj.we2code@gmail.com\", \"message\": \"hello, Raj you have interview scheduled on 2023-05-15                  for job with title - Driver you have applied on, scheduled with Gourav Agency \", \"subject\": \"new interview scheduled\"}', 'SENT', 41675, '2023-05-12 06:44:30'),
(6, 0, '{\"to\": \"aashi.we2code@gmail.com\", \"message\": \"new interview scheduled on 2023-05-15 of candidate name Raj with Gourav Agency \", \"subject\": \"new interview scheduled\"}', 'SENT', 41675, '2023-05-12 06:44:30'),
(7, 4, '{\"to\": \"utkarsh.we2code@gmail.com\", \"job_title\": \"Driver\", \"company_name\": \"Gourav Agency \", \"candidate_name\": \"Utkarsh\", \"interview_date\": \"2023-05-25\"}', 'PENDING', 12812, '2023-05-15 06:11:54'),
(8, 5, '{\"to\": \"Babulal@gmail.com\", \"job_title\": \"Driver\", \"company_name\": \"Gourav Agency \", \"candidate_name\": \"Babu\", \"interview_date\": \"2023-05-25\"}', 'PENDING', 71913, '2023-05-15 09:01:46'),
(9, 5, '{\"to\": null, \"job_title\": null, \"company_name\": null, \"candidate_name\": null, \"interview_date\": null}', 'PENDING', 81435, '2023-05-16 07:16:12'),
(10, 5, '{\"to\": \"utkarsh.we2code@gmail.com\", \"job_title\": \"Driver\", \"company_name\": \"Gourav Agency \", \"candidate_name\": \"UV\", \"interview_date\": \"2023-05-25\"}', 'PENDING', 97322, '2023-05-16 07:26:58');

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
(1, 'employee_signup', 'a new user registered', ' <!doctype html>\r\n<html>\r\n  <head>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <title>Simple Transactional Email</title>\r\n    <style>\r\n@media only screen and (max-width: 620px) {\r\n  table.body h1 {\r\n    font-size: 28px !important;\r\n    margin-bottom: 10px !important;\r\n  }\r\n\r\n  table.body p,\r\ntable.body ul,\r\ntable.body ol,\r\ntable.body td,\r\ntable.body span,\r\ntable.body a {\r\n    font-size: 16px !important;\r\n  }\r\n\r\n  table.body .wrapper,\r\ntable.body .article {\r\n    padding: 10px !important;\r\n  }\r\n\r\n  table.body .content {\r\n    padding: 0 !important;\r\n  }\r\n\r\n  table.body .container {\r\n    padding: 0 !important;\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .main {\r\n    border-left-width: 0 !important;\r\n    border-radius: 0 !important;\r\n    border-right-width: 0 !important;\r\n  }\r\n\r\n  table.body .btn table {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .btn a {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .img-responsive {\r\n    height: auto !important;\r\n    max-width: 100% !important;\r\n    width: auto !important;\r\n  }\r\n}\r\n@media all {\r\n  .ExternalClass {\r\n    width: 100%;\r\n  }\r\n\r\n  .ExternalClass,\r\n.ExternalClass p,\r\n.ExternalClass span,\r\n.ExternalClass font,\r\n.ExternalClass td,\r\n.ExternalClass div {\r\n    line-height: 100%;\r\n  }\r\n\r\n  .apple-link a {\r\n    color: inherit !important;\r\n    font-family: inherit !important;\r\n    font-size: inherit !important;\r\n    font-weight: inherit !important;\r\n    line-height: inherit !important;\r\n    text-decoration: none !important;\r\n  }\r\n\r\n  #MessageViewBody a {\r\n    color: inherit;\r\n    text-decoration: none;\r\n    font-size: inherit;\r\n    font-family: inherit;\r\n    font-weight: inherit;\r\n    line-height: inherit;\r\n  }\r\n\r\n  .btn-primary table td:hover {\r\n    background-color: #34495e !important;\r\n  }\r\n\r\n  .btn-primary a:hover {\r\n    background-color: #34495e !important;\r\n    border-color: #34495e !important;\r\n  }\r\n}\r\n</style>\r\n  </head>\r\n  <body style=\"background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\">\r\n    <span class=\"preheader\" style=\"color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;\">This is preheader text. Some clients will show this text as a preview.</span>\r\n    <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f6f6f6; width: 100%;\" width=\"100%\" bgcolor=\"#f6f6f6\">\r\n      <tr>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n        <td class=\"container\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; margin: 0 auto;\" width=\"580\" valign=\"top\">\r\n          <div class=\"content\" style=\"box-sizing: border-box; display: block; margin: 0 auto; max-width: 580px; padding: 10px;\">\r\n\r\n            <!-- START CENTERED WHITE CONTAINER -->\r\n            <table role=\"presentation\" class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background: #ffffff; border-radius: 3px; width: 100%;\" width=\"100%\">\r\n\r\n              <!-- START MAIN CONTENT AREA -->\r\n              <tr>\r\n                <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\" valign=\"top\">\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                    <tr>\r\n                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Hi there,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">{job_message_body}</p>\r\n                        <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; box-sizing: border-box; width: 100%;\" width=\"100%\">\r\n                          <tbody>\r\n                            <tr>\r\n                              <td align=\"left\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;\" valign=\"top\">\r\n                                <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;\">\r\n                                 \r\n                                </table>\r\n                              </td>\r\n                            </tr>\r\n                          </tbody>\r\n                        </table>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">This is a really simple email template. Its sole purpose is to get the recipient to click the button with no distractions.</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Good luck! Hope it works.</p>\r\n                      </td>\r\n                    </tr>\r\n                  </table>\r\n                </td>\r\n              </tr>\r\n\r\n            <!-- END MAIN CONTENT AREA -->\r\n            </table>\r\n            <!-- END CENTERED WHITE CONTAINER -->\r\n\r\n            <!-- START FOOTER -->\r\n            <div class=\"footer\" style=\"clear: both; margin-top: 10px; text-align: center; width: 100%;\">\r\n              <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                <tr>\r\n                  <td class=\"content-block\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    <span class=\"apple-link\" style=\"color: #999999; font-size: 12px; text-align: center;\">Canjobs Inc, 3 Abbey Road, Montreal CA 94102</span>\r\n                    <br> Don\'t like these emails? <a href=\"http://i.imgur.com/CScmqnj.gif\" style=\"text-decoration: underline; color: #999999; font-size: 12px; text-align: center;\">Unsubscribe</a>.\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class=\"content-block powered-by\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    Powered by <a href=\"http://htmlemail.io\" style=\"color: #999999; font-size: 12px; text-align: center; text-decoration: none;\">HTMLemail</a>.\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </div>\r\n            <!-- END FOOTER -->\r\n\r\n          </div>\r\n        </td>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>\r\n', 1, '2023-05-15 08:39:52', '2023-05-15 11:49:55'),
(2, 'company_sign_up', 'a new company registered', ' <!doctype html>\r\n<html>\r\n  <head>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <title>Simple Transactional Email</title>\r\n    <style>\r\n@media only screen and (max-width: 620px) {\r\n  table.body h1 {\r\n    font-size: 28px !important;\r\n    margin-bottom: 10px !important;\r\n  }\r\n\r\n  table.body p,\r\ntable.body ul,\r\ntable.body ol,\r\ntable.body td,\r\ntable.body span,\r\ntable.body a {\r\n    font-size: 16px !important;\r\n  }\r\n\r\n  table.body .wrapper,\r\ntable.body .article {\r\n    padding: 10px !important;\r\n  }\r\n\r\n  table.body .content {\r\n    padding: 0 !important;\r\n  }\r\n\r\n  table.body .container {\r\n    padding: 0 !important;\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .main {\r\n    border-left-width: 0 !important;\r\n    border-radius: 0 !important;\r\n    border-right-width: 0 !important;\r\n  }\r\n\r\n  table.body .btn table {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .btn a {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .img-responsive {\r\n    height: auto !important;\r\n    max-width: 100% !important;\r\n    width: auto !important;\r\n  }\r\n}\r\n@media all {\r\n  .ExternalClass {\r\n    width: 100%;\r\n  }\r\n\r\n  .ExternalClass,\r\n.ExternalClass p,\r\n.ExternalClass span,\r\n.ExternalClass font,\r\n.ExternalClass td,\r\n.ExternalClass div {\r\n    line-height: 100%;\r\n  }\r\n\r\n  .apple-link a {\r\n    color: inherit !important;\r\n    font-family: inherit !important;\r\n    font-size: inherit !important;\r\n    font-weight: inherit !important;\r\n    line-height: inherit !important;\r\n    text-decoration: none !important;\r\n  }\r\n\r\n  #MessageViewBody a {\r\n    color: inherit;\r\n    text-decoration: none;\r\n    font-size: inherit;\r\n    font-family: inherit;\r\n    font-weight: inherit;\r\n    line-height: inherit;\r\n  }\r\n\r\n  .btn-primary table td:hover {\r\n    background-color: #34495e !important;\r\n  }\r\n\r\n  .btn-primary a:hover {\r\n    background-color: #34495e !important;\r\n    border-color: #34495e !important;\r\n  }\r\n}\r\n</style>\r\n  </head>\r\n  <body style=\"background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\">\r\n    <span class=\"preheader\" style=\"color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;\">This is preheader text. Some clients will show this text as a preview.</span>\r\n    <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f6f6f6; width: 100%;\" width=\"100%\" bgcolor=\"#f6f6f6\">\r\n      <tr>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n        <td class=\"container\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; margin: 0 auto;\" width=\"580\" valign=\"top\">\r\n          <div class=\"content\" style=\"box-sizing: border-box; display: block; margin: 0 auto; max-width: 580px; padding: 10px;\">\r\n\r\n            <!-- START CENTERED WHITE CONTAINER -->\r\n            <table role=\"presentation\" class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background: #ffffff; border-radius: 3px; width: 100%;\" width=\"100%\">\r\n\r\n              <!-- START MAIN CONTENT AREA -->\r\n              <tr>\r\n                <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\" valign=\"top\">\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                    <tr>\r\n                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Hi there,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">{job_message_body}</p>\r\n                        <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; box-sizing: border-box; width: 100%;\" width=\"100%\">\r\n                          <tbody>\r\n                            <tr>\r\n                              <td align=\"left\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;\" valign=\"top\">\r\n                                <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;\">\r\n                                 \r\n                                </table>\r\n                              </td>\r\n                            </tr>\r\n                          </tbody>\r\n                        </table>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">This is a really simple email template. Its sole purpose is to get the recipient to click the button with no distractions.</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Good luck! Hope it works.</p>\r\n                      </td>\r\n                    </tr>\r\n                  </table>\r\n                </td>\r\n              </tr>\r\n\r\n            <!-- END MAIN CONTENT AREA -->\r\n            </table>\r\n            <!-- END CENTERED WHITE CONTAINER -->\r\n\r\n            <!-- START FOOTER -->\r\n            <div class=\"footer\" style=\"clear: both; margin-top: 10px; text-align: center; width: 100%;\">\r\n              <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                <tr>\r\n                  <td class=\"content-block\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    <span class=\"apple-link\" style=\"color: #999999; font-size: 12px; text-align: center;\">Canjobs Inc, 3 Abbey Road, Montreal CA 94102</span>\r\n                    <br> Don\'t like these emails? <a href=\"http://i.imgur.com/CScmqnj.gif\" style=\"text-decoration: underline; color: #999999; font-size: 12px; text-align: center;\">Unsubscribe</a>.\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class=\"content-block powered-by\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    Powered by <a href=\"http://htmlemail.io\" style=\"color: #999999; font-size: 12px; text-align: center; text-decoration: none;\">HTMLemail</a>.\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </div>\r\n            <!-- END FOOTER -->\r\n\r\n          </div>\r\n        </td>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>\r\n', 1, '2023-05-15 08:43:30', '2023-05-15 11:50:12'),
(3, 'post_job', 'job posted successfully', ' <!doctype html>\r\n<html>\r\n  <head>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <title>Simple Transactional Email</title>\r\n    <style>\r\n@media only screen and (max-width: 620px) {\r\n  table.body h1 {\r\n    font-size: 28px !important;\r\n    margin-bottom: 10px !important;\r\n  }\r\n\r\n  table.body p,\r\ntable.body ul,\r\ntable.body ol,\r\ntable.body td,\r\ntable.body span,\r\ntable.body a {\r\n    font-size: 16px !important;\r\n  }\r\n\r\n  table.body .wrapper,\r\ntable.body .article {\r\n    padding: 10px !important;\r\n  }\r\n\r\n  table.body .content {\r\n    padding: 0 !important;\r\n  }\r\n\r\n  table.body .container {\r\n    padding: 0 !important;\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .main {\r\n    border-left-width: 0 !important;\r\n    border-radius: 0 !important;\r\n    border-right-width: 0 !important;\r\n  }\r\n\r\n  table.body .btn table {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .btn a {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .img-responsive {\r\n    height: auto !important;\r\n    max-width: 100% !important;\r\n    width: auto !important;\r\n  }\r\n}\r\n@media all {\r\n  .ExternalClass {\r\n    width: 100%;\r\n  }\r\n\r\n  .ExternalClass,\r\n.ExternalClass p,\r\n.ExternalClass span,\r\n.ExternalClass font,\r\n.ExternalClass td,\r\n.ExternalClass div {\r\n    line-height: 100%;\r\n  }\r\n\r\n  .apple-link a {\r\n    color: inherit !important;\r\n    font-family: inherit !important;\r\n    font-size: inherit !important;\r\n    font-weight: inherit !important;\r\n    line-height: inherit !important;\r\n    text-decoration: none !important;\r\n  }\r\n\r\n  #MessageViewBody a {\r\n    color: inherit;\r\n    text-decoration: none;\r\n    font-size: inherit;\r\n    font-family: inherit;\r\n    font-weight: inherit;\r\n    line-height: inherit;\r\n  }\r\n\r\n  .btn-primary table td:hover {\r\n    background-color: #34495e !important;\r\n  }\r\n\r\n  .btn-primary a:hover {\r\n    background-color: #34495e !important;\r\n    border-color: #34495e !important;\r\n  }\r\n}\r\n</style>\r\n  </head>\r\n  <body style=\"background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\">\r\n    <span class=\"preheader\" style=\"color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;\">This is preheader text. Some clients will show this text as a preview.</span>\r\n    <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f6f6f6; width: 100%;\" width=\"100%\" bgcolor=\"#f6f6f6\">\r\n      <tr>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n        <td class=\"container\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; margin: 0 auto;\" width=\"580\" valign=\"top\">\r\n          <div class=\"content\" style=\"box-sizing: border-box; display: block; margin: 0 auto; max-width: 580px; padding: 10px;\">\r\n\r\n            <!-- START CENTERED WHITE CONTAINER -->\r\n            <table role=\"presentation\" class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background: #ffffff; border-radius: 3px; width: 100%;\" width=\"100%\">\r\n\r\n              <!-- START MAIN CONTENT AREA -->\r\n              <tr>\r\n                <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\" valign=\"top\">\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                    <tr>\r\n                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Hi there,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">{postjob_job_title}\r\n                        {postjob_company_name}</p>\r\n                        <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; box-sizing: border-box; width: 100%;\" width=\"100%\">\r\n                          <tbody>\r\n                            <tr>\r\n                              <td align=\"left\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;\" valign=\"top\">\r\n                                <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;\">\r\n                                 \r\n                                </table>\r\n                              </td>\r\n                            </tr>\r\n                          </tbody>\r\n                        </table>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">This is a really simple email template. Its sole purpose is to get the recipient to click the button with no distractions.</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Good luck! Hope it works.</p>\r\n                      </td>\r\n                    </tr>\r\n                  </table>\r\n                </td>\r\n              </tr>\r\n\r\n            <!-- END MAIN CONTENT AREA -->\r\n            </table>\r\n            <!-- END CENTERED WHITE CONTAINER -->\r\n\r\n            <!-- START FOOTER -->\r\n            <div class=\"footer\" style=\"clear: both; margin-top: 10px; text-align: center; width: 100%;\">\r\n              <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                <tr>\r\n                  <td class=\"content-block\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    <span class=\"apple-link\" style=\"color: #999999; font-size: 12px; text-align: center;\">Canjobs Inc, 3 Abbey Road, Montreal CA 94102</span>\r\n                    <br> Don\'t like these emails? <a href=\"http://i.imgur.com/CScmqnj.gif\" style=\"text-decoration: underline; color: #999999; font-size: 12px; text-align: center;\">Unsubscribe</a>.\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class=\"content-block powered-by\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    Powered by <a href=\"http://htmlemail.io\" style=\"color: #999999; font-size: 12px; text-align: center; text-decoration: none;\">HTMLemail</a>.\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </div>\r\n            <!-- END FOOTER -->\r\n\r\n          </div>\r\n        </td>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>\r\n\r\n\r\n', 1, '2023-05-15 08:46:49', '2023-05-15 08:46:49'),
(4, 'apply_on_job', 'job applied successfully', ' <!doctype html>\r\n<html>\r\n  <head>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <title>Simple Transactional Email</title>\r\n    <style>\r\n@media only screen and (max-width: 620px) {\r\n  table.body h1 {\r\n    font-size: 28px !important;\r\n    margin-bottom: 10px !important;\r\n  }\r\n\r\n  table.body p,\r\ntable.body ul,\r\ntable.body ol,\r\ntable.body td,\r\ntable.body span,\r\ntable.body a {\r\n    font-size: 16px !important;\r\n  }\r\n\r\n  table.body .wrapper,\r\ntable.body .article {\r\n    padding: 10px !important;\r\n  }\r\n\r\n  table.body .content {\r\n    padding: 0 !important;\r\n  }\r\n\r\n  table.body .container {\r\n    padding: 0 !important;\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .main {\r\n    border-left-width: 0 !important;\r\n    border-radius: 0 !important;\r\n    border-right-width: 0 !important;\r\n  }\r\n\r\n  table.body .btn table {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .btn a {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .img-responsive {\r\n    height: auto !important;\r\n    max-width: 100% !important;\r\n    width: auto !important;\r\n  }\r\n}\r\n@media all {\r\n  .ExternalClass {\r\n    width: 100%;\r\n  }\r\n\r\n  .ExternalClass,\r\n.ExternalClass p,\r\n.ExternalClass span,\r\n.ExternalClass font,\r\n.ExternalClass td,\r\n.ExternalClass div {\r\n    line-height: 100%;\r\n  }\r\n\r\n  .apple-link a {\r\n    color: inherit !important;\r\n    font-family: inherit !important;\r\n    font-size: inherit !important;\r\n    font-weight: inherit !important;\r\n    line-height: inherit !important;\r\n    text-decoration: none !important;\r\n  }\r\n\r\n  #MessageViewBody a {\r\n    color: inherit;\r\n    text-decoration: none;\r\n    font-size: inherit;\r\n    font-family: inherit;\r\n    font-weight: inherit;\r\n    line-height: inherit;\r\n  }\r\n\r\n  .btn-primary table td:hover {\r\n    background-color: #34495e !important;\r\n  }\r\n\r\n  .btn-primary a:hover {\r\n    background-color: #34495e !important;\r\n    border-color: #34495e !important;\r\n  }\r\n}\r\n</style>\r\n  </head>\r\n  <body style=\"background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\">\r\n    <span class=\"preheader\" style=\"color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;\">This is preheader text. Some clients will show this text as a preview.</span>\r\n    <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f6f6f6; width: 100%;\" width=\"100%\" bgcolor=\"#f6f6f6\">\r\n      <tr>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n        <td class=\"container\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; margin: 0 auto;\" width=\"580\" valign=\"top\">\r\n          <div class=\"content\" style=\"box-sizing: border-box; display: block; margin: 0 auto; max-width: 580px; padding: 10px;\">\r\n\r\n            <!-- START CENTERED WHITE CONTAINER -->\r\n            <table role=\"presentation\" class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background: #ffffff; border-radius: 3px; width: 100%;\" width=\"100%\">\r\n\r\n              <!-- START MAIN CONTENT AREA -->\r\n              <tr>\r\n                <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\" valign=\"top\">\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                    <tr>\r\n                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Hi there,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">{apply_on_job_job_title}\r\n                        {apply_on_job_company_name}</p>\r\n                        <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; box-sizing: border-box; width: 100%;\" width=\"100%\">\r\n                          <tbody>\r\n                            <tr>\r\n                              <td align=\"left\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;\" valign=\"top\">\r\n                                <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;\">\r\n                                 \r\n                                </table>\r\n                              </td>\r\n                            </tr>\r\n                          </tbody>\r\n                        </table>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">This is a really simple email template. Its sole purpose is to get the recipient to click the button with no distractions.</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Good luck! Hope it works.</p>\r\n                      </td>\r\n                    </tr>\r\n                  </table>\r\n                </td>\r\n              </tr>\r\n\r\n            <!-- END MAIN CONTENT AREA -->\r\n            </table>\r\n            <!-- END CENTERED WHITE CONTAINER -->\r\n\r\n            <!-- START FOOTER -->\r\n            <div class=\"footer\" style=\"clear: both; margin-top: 10px; text-align: center; width: 100%;\">\r\n              <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                <tr>\r\n                  <td class=\"content-block\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    <span class=\"apple-link\" style=\"color: #999999; font-size: 12px; text-align: center;\">Canjobs Inc, 3 Abbey Road, Montreal CA 94102</span>\r\n                    <br> Don\'t like these emails? <a href=\"http://i.imgur.com/CScmqnj.gif\" style=\"text-decoration: underline; color: #999999; font-size: 12px; text-align: center;\">Unsubscribe</a>.\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class=\"content-block powered-by\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    Powered by <a href=\"http://htmlemail.io\" style=\"color: #999999; font-size: 12px; text-align: center; text-decoration: none;\">HTMLemail</a>.\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </div>\r\n            <!-- END FOOTER -->\r\n\r\n          </div>\r\n        </td>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>\r\n\r\n\r\n', 1, '2023-05-15 08:47:34', '2023-05-15 08:47:34'),
(5, 'interview_schedule', 'new interview scheduled', ' <!doctype html>\r\n<html>\r\n  <head>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <title>Simple Transactional Email</title>\r\n    <style>\r\n@media only screen and (max-width: 620px) {\r\n  table.body h1 {\r\n    font-size: 28px !important;\r\n    margin-bottom: 10px !important;\r\n  }\r\n\r\n  table.body p,\r\ntable.body ul,\r\ntable.body ol,\r\ntable.body td,\r\ntable.body span,\r\ntable.body a {\r\n    font-size: 16px !important;\r\n  }\r\n\r\n  table.body .wrapper,\r\ntable.body .article {\r\n    padding: 10px !important;\r\n  }\r\n\r\n  table.body .content {\r\n    padding: 0 !important;\r\n  }\r\n\r\n  table.body .container {\r\n    padding: 0 !important;\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .main {\r\n    border-left-width: 0 !important;\r\n    border-radius: 0 !important;\r\n    border-right-width: 0 !important;\r\n  }\r\n\r\n  table.body .btn table {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .btn a {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .img-responsive {\r\n    height: auto !important;\r\n    max-width: 100% !important;\r\n    width: auto !important;\r\n  }\r\n}\r\n@media all {\r\n  .ExternalClass {\r\n    width: 100%;\r\n  }\r\n\r\n  .ExternalClass,\r\n.ExternalClass p,\r\n.ExternalClass span,\r\n.ExternalClass font,\r\n.ExternalClass td,\r\n.ExternalClass div {\r\n    line-height: 100%;\r\n  }\r\n\r\n  .apple-link a {\r\n    color: inherit !important;\r\n    font-family: inherit !important;\r\n    font-size: inherit !important;\r\n    font-weight: inherit !important;\r\n    line-height: inherit !important;\r\n    text-decoration: none !important;\r\n  }\r\n\r\n  #MessageViewBody a {\r\n    color: inherit;\r\n    text-decoration: none;\r\n    font-size: inherit;\r\n    font-family: inherit;\r\n    font-weight: inherit;\r\n    line-height: inherit;\r\n  }\r\n\r\n  .btn-primary table td:hover {\r\n    background-color: #34495e !important;\r\n  }\r\n\r\n  .btn-primary a:hover {\r\n    background-color: #34495e !important;\r\n    border-color: #34495e !important;\r\n  }\r\n}\r\n</style>\r\n  </head>\r\n  <body style=\"background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\">\r\n    <span class=\"preheader\" style=\"color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;\">This is preheader text. Some clients will show this text as a preview.</span>\r\n    <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f6f6f6; width: 100%;\" width=\"100%\" bgcolor=\"#f6f6f6\">\r\n      <tr>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n        <td class=\"container\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; margin: 0 auto;\" width=\"580\" valign=\"top\">\r\n          <div class=\"content\" style=\"box-sizing: border-box; display: block; margin: 0 auto; max-width: 580px; padding: 10px;\">\r\n\r\n            <!-- START CENTERED WHITE CONTAINER -->\r\n            <table role=\"presentation\" class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background: #ffffff; border-radius: 3px; width: 100%;\" width=\"100%\">\r\n\r\n              <!-- START MAIN CONTENT AREA -->\r\n              <tr>\r\n                <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\" valign=\"top\">\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                    <tr>\r\n                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Hi there,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">{interview_schedule_name}\r\n                        {interview_schedule_interview_date}\r\n                        {interview_schedule_job_title}\r\n                        {interview_schedule_company_name}</p>\r\n                        <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; box-sizing: border-box; width: 100%;\" width=\"100%\">\r\n                          <tbody>\r\n                            <tr>\r\n                              <td align=\"left\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;\" valign=\"top\">\r\n                                <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;\">\r\n                                 \r\n                                </table>\r\n                              </td>\r\n                            </tr>\r\n                          </tbody>\r\n                        </table>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">This is a really simple email template. Its sole purpose is to get the recipient to click the button with no distractions.</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Good luck! Hope it works.</p>\r\n                      </td>\r\n                    </tr>\r\n                  </table>\r\n                </td>\r\n              </tr>\r\n\r\n            <!-- END MAIN CONTENT AREA -->\r\n            </table>\r\n            <!-- END CENTERED WHITE CONTAINER -->\r\n\r\n            <!-- START FOOTER -->\r\n            <div class=\"footer\" style=\"clear: both; margin-top: 10px; text-align: center; width: 100%;\">\r\n              <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                <tr>\r\n                  <td class=\"content-block\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    <span class=\"apple-link\" style=\"color: #999999; font-size: 12px; text-align: center;\">Canjobs Inc, 3 Abbey Road, Montreal CA 94102</span>\r\n                    <br> Don\'t like these emails? <a href=\"http://i.imgur.com/CScmqnj.gif\" style=\"text-decoration: underline; color: #999999; font-size: 12px; text-align: center;\">Unsubscribe</a>.\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class=\"content-block powered-by\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    Powered by <a href=\"http://htmlemail.io\" style=\"color: #999999; font-size: 12px; text-align: center; text-decoration: none;\">HTMLemail</a>.\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </div>\r\n            <!-- END FOOTER -->\r\n\r\n          </div>\r\n        </td>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>\r\n\r\n\r\n', 1, '2023-05-15 08:48:39', '2023-05-15 08:48:39'),
(6, 'forget_password', 'reset password', ' <!doctype html>\r\n<html>\r\n  <head>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <title>Simple Transactional Email</title>\r\n    <style>\r\n@media only screen and (max-width: 620px) {\r\n  table.body h1 {\r\n    font-size: 28px !important;\r\n    margin-bottom: 10px !important;\r\n  }\r\n\r\n  table.body p,\r\ntable.body ul,\r\ntable.body ol,\r\ntable.body td,\r\ntable.body span,\r\ntable.body a {\r\n    font-size: 16px !important;\r\n  }\r\n\r\n  table.body .wrapper,\r\ntable.body .article {\r\n    padding: 10px !important;\r\n  }\r\n\r\n  table.body .content {\r\n    padding: 0 !important;\r\n  }\r\n\r\n  table.body .container {\r\n    padding: 0 !important;\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .main {\r\n    border-left-width: 0 !important;\r\n    border-radius: 0 !important;\r\n    border-right-width: 0 !important;\r\n  }\r\n\r\n  table.body .btn table {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .btn a {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .img-responsive {\r\n    height: auto !important;\r\n    max-width: 100% !important;\r\n    width: auto !important;\r\n  }\r\n}\r\n@media all {\r\n  .ExternalClass {\r\n    width: 100%;\r\n  }\r\n\r\n  .ExternalClass,\r\n.ExternalClass p,\r\n.ExternalClass span,\r\n.ExternalClass font,\r\n.ExternalClass td,\r\n.ExternalClass div {\r\n    line-height: 100%;\r\n  }\r\n\r\n  .apple-link a {\r\n    color: inherit !important;\r\n    font-family: inherit !important;\r\n    font-size: inherit !important;\r\n    font-weight: inherit !important;\r\n    line-height: inherit !important;\r\n    text-decoration: none !important;\r\n  }\r\n\r\n  #MessageViewBody a {\r\n    color: inherit;\r\n    text-decoration: none;\r\n    font-size: inherit;\r\n    font-family: inherit;\r\n    font-weight: inherit;\r\n    line-height: inherit;\r\n  }\r\n\r\n  .btn-primary table td:hover {\r\n    background-color: #34495e !important;\r\n  }\r\n\r\n  .btn-primary a:hover {\r\n    background-color: #34495e !important;\r\n    border-color: #34495e !important;\r\n  }\r\n}\r\n</style>\r\n  </head>\r\n  <body style=\"background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\">\r\n    <span class=\"preheader\" style=\"color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;\">This is preheader text. Some clients will show this text as a preview.</span>\r\n    <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f6f6f6; width: 100%;\" width=\"100%\" bgcolor=\"#f6f6f6\">\r\n      <tr>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n        <td class=\"container\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; margin: 0 auto;\" width=\"580\" valign=\"top\">\r\n          <div class=\"content\" style=\"box-sizing: border-box; display: block; margin: 0 auto; max-width: 580px; padding: 10px;\">\r\n\r\n            <!-- START CENTERED WHITE CONTAINER -->\r\n            <table role=\"presentation\" class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background: #ffffff; border-radius: 3px; width: 100%;\" width=\"100%\">\r\n\r\n              <!-- START MAIN CONTENT AREA -->\r\n              <tr>\r\n                <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\" valign=\"top\">\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                    <tr>\r\n                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Hi there,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">{token} {reset_link}</p>\r\n                        <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; box-sizing: border-box; width: 100%;\" width=\"100%\">\r\n                          <tbody>\r\n                            <tr>\r\n                              <td align=\"left\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;\" valign=\"top\">\r\n                                <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;\">\r\n                                 \r\n                                </table>\r\n                              </td>\r\n                            </tr>\r\n                          </tbody>\r\n                        </table>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">This is a really simple email template. Its sole purpose is to get the recipient to click the button with no distractions.</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Good luck! Hope it works.</p>\r\n                      </td>\r\n                    </tr>\r\n                  </table>\r\n                </td>\r\n              </tr>\r\n\r\n            <!-- END MAIN CONTENT AREA -->\r\n            </table>\r\n            <!-- END CENTERED WHITE CONTAINER -->\r\n\r\n            <!-- START FOOTER -->\r\n            <div class=\"footer\" style=\"clear: both; margin-top: 10px; text-align: center; width: 100%;\">\r\n              <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                <tr>\r\n                  <td class=\"content-block\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    <span class=\"apple-link\" style=\"color: #999999; font-size: 12px; text-align: center;\">Canjobs Inc, 3 Abbey Road, Montreal CA 94102</span>\r\n                    <br> Don\'t like these emails? <a href=\"http://i.imgur.com/CScmqnj.gif\" style=\"text-decoration: underline; color: #999999; font-size: 12px; text-align: center;\">Unsubscribe</a>.\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class=\"content-block powered-by\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    Powered by <a href=\"http://htmlemail.io\" style=\"color: #999999; font-size: 12px; text-align: center; text-decoration: none;\">HTMLemail</a>.\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </div>\r\n            <!-- END FOOTER -->\r\n\r\n          </div>\r\n        </td>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>\r\n', 1, '2023-05-15 09:53:18', '2023-05-15 09:53:18');
INSERT INTO `email_template` (`id`, `email_type`, `subject`, `message`, `is_active`, `created_at`, `updated_at`) VALUES
(7, 'otp_signup', 'one time password', ' <!doctype html>\r\n<html>\r\n  <head>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <title>Simple Transactional Email</title>\r\n    <style>\r\n@media only screen and (max-width: 620px) {\r\n  table.body h1 {\r\n    font-size: 28px !important;\r\n    margin-bottom: 10px !important;\r\n  }\r\n\r\n  table.body p,\r\ntable.body ul,\r\ntable.body ol,\r\ntable.body td,\r\ntable.body span,\r\ntable.body a {\r\n    font-size: 16px !important;\r\n  }\r\n\r\n  table.body .wrapper,\r\ntable.body .article {\r\n    padding: 10px !important;\r\n  }\r\n\r\n  table.body .content {\r\n    padding: 0 !important;\r\n  }\r\n\r\n  table.body .container {\r\n    padding: 0 !important;\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .main {\r\n    border-left-width: 0 !important;\r\n    border-radius: 0 !important;\r\n    border-right-width: 0 !important;\r\n  }\r\n\r\n  table.body .btn table {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .btn a {\r\n    width: 100% !important;\r\n  }\r\n\r\n  table.body .img-responsive {\r\n    height: auto !important;\r\n    max-width: 100% !important;\r\n    width: auto !important;\r\n  }\r\n}\r\n@media all {\r\n  .ExternalClass {\r\n    width: 100%;\r\n  }\r\n\r\n  .ExternalClass,\r\n.ExternalClass p,\r\n.ExternalClass span,\r\n.ExternalClass font,\r\n.ExternalClass td,\r\n.ExternalClass div {\r\n    line-height: 100%;\r\n  }\r\n\r\n  .apple-link a {\r\n    color: inherit !important;\r\n    font-family: inherit !important;\r\n    font-size: inherit !important;\r\n    font-weight: inherit !important;\r\n    line-height: inherit !important;\r\n    text-decoration: none !important;\r\n  }\r\n\r\n  #MessageViewBody a {\r\n    color: inherit;\r\n    text-decoration: none;\r\n    font-size: inherit;\r\n    font-family: inherit;\r\n    font-weight: inherit;\r\n    line-height: inherit;\r\n  }\r\n\r\n  .btn-primary table td:hover {\r\n    background-color: #34495e !important;\r\n  }\r\n\r\n  .btn-primary a:hover {\r\n    background-color: #34495e !important;\r\n    border-color: #34495e !important;\r\n  }\r\n}\r\n</style>\r\n  </head>\r\n  <body style=\"background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\">\r\n    <span class=\"preheader\" style=\"color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;\">This is preheader text. Some clients will show this text as a preview.</span>\r\n    <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f6f6f6; width: 100%;\" width=\"100%\" bgcolor=\"#f6f6f6\">\r\n      <tr>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n        <td class=\"container\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; margin: 0 auto;\" width=\"580\" valign=\"top\">\r\n          <div class=\"content\" style=\"box-sizing: border-box; display: block; margin: 0 auto; max-width: 580px; padding: 10px;\">\r\n\r\n            <!-- START CENTERED WHITE CONTAINER -->\r\n            <table role=\"presentation\" class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background: #ffffff; border-radius: 3px; width: 100%;\" width=\"100%\">\r\n\r\n              <!-- START MAIN CONTENT AREA -->\r\n              <tr>\r\n                <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\" valign=\"top\">\r\n                  <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                    <tr>\r\n                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Hi there,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">{otp}</p>\r\n                        <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; box-sizing: border-box; width: 100%;\" width=\"100%\">\r\n                          <tbody>\r\n                            <tr>\r\n                              <td align=\"left\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;\" valign=\"top\">\r\n                                <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;\">\r\n                                 \r\n                                </table>\r\n                              </td>\r\n                            </tr>\r\n                          </tbody>\r\n                        </table>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">This is a really simple email template. Its sole purpose is to get the recipient to click the button with no distractions.</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;\">Good luck! Hope it works.</p>\r\n                      </td>\r\n                    </tr>\r\n                  </table>\r\n                </td>\r\n              </tr>\r\n\r\n            <!-- END MAIN CONTENT AREA -->\r\n            </table>\r\n            <!-- END CENTERED WHITE CONTAINER -->\r\n\r\n            <!-- START FOOTER -->\r\n            <div class=\"footer\" style=\"clear: both; margin-top: 10px; text-align: center; width: 100%;\">\r\n              <table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\" width=\"100%\">\r\n                <tr>\r\n                  <td class=\"content-block\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    <span class=\"apple-link\" style=\"color: #999999; font-size: 12px; text-align: center;\">Canjobs Inc, 3 Abbey Road, Montreal CA 94102</span>\r\n                    <br> Don\'t like these emails? <a href=\"http://i.imgur.com/CScmqnj.gif\" style=\"text-decoration: underline; color: #999999; font-size: 12px; text-align: center;\">Unsubscribe</a>.\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class=\"content-block powered-by\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;\" valign=\"top\" align=\"center\">\r\n                    Powered by <a href=\"http://htmlemail.io\" style=\"color: #999999; font-size: 12px; text-align: center; text-decoration: none;\">HTMLemail</a>.\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </div>\r\n            <!-- END FOOTER -->\r\n\r\n          </div>\r\n        </td>\r\n        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\" valign=\"top\">&nbsp;</td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>\r\n', 1, '2023-05-15 09:54:33', '2023-05-15 09:54:33'),
(8, 'New Template', 'Test Subject', 'JKjkjskdkkl ksjj dsjkldjaskldjklsj dklasjkl das d', 1, '2023-05-15 12:13:56', '2023-05-15 12:13:56'),
(9, 'Test', 'test', 'test', 1, '2023-05-15 12:15:13', '2023-05-15 12:15:13');

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
  `is_posted` tinyint(1) NOT NULL DEFAULT '0',
  `posted_company_id` int(51) NOT NULL,
  `date_of_posting` date NOT NULL,
  `designation``` varchar(251) NOT NULL,
  `resume` varchar(301) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_admin` int(51) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL,
  `token` varchar(301) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `name`, `email`, `password`, `contact_no`, `description`, `date_of_birth`, `gender`, `marital_status`, `nationality`, `current_location`, `currently_located_country`, `language`, `religion`, `interested_in`, `experience`, `work_permit_canada`, `work_permit_other_country`, `is_posted`, `posted_company_id`, `date_of_posting`, `designation``, `resume`, `profile_photo`, `created_at`, `created_by_admin`, `updated_at`, `is_deleted`, `token`) VALUES
(1, 'UV', 'utkarsh.we2code@gmail.com', '88bfe17c1492f6fd173127b33099403c', 1234556789, 'testing', '2023-04-01', 'male', 'single', 'Indian', 'Indore', 'india', 'Hindi', 'Hindu', 'swap', '0-1', 'no', 'Yes', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1682672246.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1682672246.jpeg', '2023-04-28 05:49:18', 0, '2023-04-28 08:57:26', 0, ''),
(2, 'darbar', 'darbar.we2code@gmail.com', 'fd93edd5b0aa948a7fd39fbf9a7b9aab', 1234556789, 'testing two', '1923-04-01', 'male', 'single', 'Indian', 'Indore', 'india', 'Hindi', 'Hindu', 'swap', 'fresher', 'no', 'Yes', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1682672236.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1682672236.jpeg', '2023-04-28 05:49:18', 0, '2023-04-28 08:57:16', 0, ''),
(3, 'Shefali dubey', 'shefali@gmail.com', '', 7539518246, 'A job description is a useful, plain-language tool that explains the tasks, duties, function and responsibilities of a position. It details who performs a specific type of work, how that work is to be completed, and the frequency and the purpose of the work as it relates to the organization\'s mission and goals.', '1996-04-12', 'female', 'married', 'indian', 'indore', 'india', 'Hindi', 'hindu', 'parttime', '1-3', 'no', 'India', 1, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1682744173.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1682744173.jpeg', '2023-04-29 04:50:16', 0, '2023-04-29 04:56:13', 0, ''),
(5, 'kkkk', 'fgdfgdf@gmail.com', '', 4985741360, 'fdsf fr sdf dfdgfg dfgdfg ', '2023-05-01', 'other', 'single', 'dasasdds', 'ddsda', 'ddsadasd', 'Gujrati', 'snatani', 'parttime', '3-5', 'no', 'n44', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1683006832.pdf', NULL, '2023-05-02 05:37:33', 0, '2023-05-02 05:53:52', 1, ''),
(6, NULL, 'gourav.we2code@gmail.com', '3f30aff52f55a2a0c2d7a0e02e7872eb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00', '', NULL, NULL, '2023-05-03 06:54:02', 0, '2023-05-03 06:54:02', 1, ''),
(8, NULL, 'rarne@gmail.com', '5276a0ea81f3dd1c7c8ae8ed1d016a84', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00', '', NULL, NULL, '2023-05-04 05:05:39', 0, '2023-05-04 05:05:39', 1, ''),
(9, NULL, 'rffffe@gmail.com', '355f3867467c25667be8d53f4b39d86c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00', '', NULL, NULL, '2023-05-04 05:07:12', 0, '2023-05-04 05:07:12', 1, ''),
(11, NULL, 'Babulal@gmail.com', '0a10371b30b5e68f5448ce81a1f7aaeb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00', '', NULL, NULL, '2023-05-04 05:47:58', 0, '2023-05-04 05:47:58', 1, ''),
(12, 'Babu', 'Babulal@gmail.com', 'ee9512dae61bfe84fb87a39c7f31ccf4', 9517532683, 'stfd bfhf ghghf t ghbg tghbtg ', '2005-02-03', 'male', 'single', 'korean', 'india', 'India', 'English', 'korean', 'swap', '1-3', 'yes', 'India', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1683346956.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1683289585.jpeg', '2023-05-04 06:04:08', 0, '2023-05-08 11:20:44', 0, ''),
(13, 'Gourav choudary', 'fgfhfoudhary.we2code@gmail.com', '', 87459634516, 'fghfh sg sfgh sfgh', '1996-06-05', 'male', 'single', ' rtg gf fg ', 'g fg fg ', 'India', 'English', ' fg fg ', 'swap', '0-1', 'no', 'India', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1683287284.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1683287284.jpeg', '2023-05-04 09:12:15', 0, '2023-05-05 11:48:04', 0, ''),
(14, 'Sham choudary', 'fhgfhghary.we2code@gmail.com', '', 5555555524, 'ftghfghfg', '2023-05-02', 'male', 'married', ' rtg gf fg ', 'g fg fg ', 'India', 'English', ' fg fg ', 'parttime', '0-1', 'no', 'gh', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1683369023.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1683289574.jpeg', '2023-05-04 09:17:34', 7, '2023-05-06 10:30:23', 1, ''),
(15, NULL, 'Managxxxxer@gmail.com', '5cef673115809572ec103ad16f33b304', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00', '', NULL, NULL, '2023-05-04 09:25:54', 0, '2023-05-04 09:25:54', 1, ''),
(16, NULL, 'Manager00@gmail.com', '6cac7180ed50312d2f3597fa0265e029', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00', '', NULL, NULL, '2023-05-04 09:26:42', 0, '2023-05-04 09:26:42', 1, ''),
(17, 'Ram', 'Ram@gmail.com', '', 98745631118, 'dsfd dfghdfgb fdghfgbhth fghfgbh gfhfgbh tfyh hgghnghj gdhghn fghyhvgh fgthfghfgtjh ghfgjhgjghj gyhjgv fghgfhg ghfgjhfg fghgh fgh fghgh ', '2023-04-30', 'male', 'single', ' rtg gf fg ', 'india', 'India', 'English', 'hindu', 'parttime', '1-3', 'no', 'India', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1683369251.pdf', NULL, '2023-05-06 10:34:11', 2, '2023-05-06 10:34:11', 0, ''),
(18, 'Gourav choudary', 'g.choudhary.we2code@gmail.com', '', 5741133692, 'sdfsfdfsc', '2023-05-03', 'female', 'single', 'korean', 'india', 'India', 'Hindi', 'korean', 'all', '1-3', 'yes', 'India', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1683369291.pdf', NULL, '2023-05-06 10:34:51', 2, '2023-05-06 10:34:51', 0, ''),
(30, NULL, 'utkarsh.we2code@gmail.com', '88bfe17c1492f6fd173127b33099403c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00', '', NULL, NULL, '2023-05-10 11:15:53', 0, '2023-05-10 11:15:53', 1, ''),
(31, 'Sagar sah', 'sagar.we2code@gmail.com', 'f96c8f8c5ac4dc823f20967f5153d0d7', 1234567890, 'asdzf', '2023-05-04', 'male', 'single', 'afsd', 'sdfa', 'asdfdf', 'English', 'dfsa', 'parttime', '7+ ', 'no', 'fdzsg', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1683788060.pdf', NULL, '2023-05-11 06:46:23', 0, '2023-05-11 06:54:20', 0, '');

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
(1, 1, 'tcs', 'developer', 'mumbai', 'IT', NULL, NULL, '2021-04-01', '2022-12-31', 0, '2023-04-28 09:18:47', '2023-04-28 09:18:47'),
(2, 4, 'Tr', 'CEO', 'indore', 'accounting', 'intern', 'intern', '2021-01-08', '2023-04-30', NULL, '2023-05-08 09:09:41', '2023-05-08 09:09:41');

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
(1, 1, 'Graduate', 'RGPV', 'BE', 'Information Technology', 'Indore', 2018, '2023-04-28 09:21:16', '2023-04-28 10:04:06'),
(2, 1, 'Post-Graduate', 'IIT-M', 'ME', 'AI', 'Mumbai', 2020, '2023-04-28 09:21:16', '2023-04-28 09:21:16'),
(3, 1, 'Graduate', 'RGPV', 'B. Tech', 'Computer Science Engineer', 'India', 2012, '2023-04-28 09:29:46', '2023-04-28 10:03:41'),
(4, 3, 'Metric', 'ssm', 'Other', '10th', 'India', 2010, '2023-04-29 05:10:04', '2023-04-29 05:10:04'),
(5, 3, 'Post Metric', 'ssm', 'Other', '12th', 'India', 2012, '2023-04-29 05:10:37', '2023-04-29 05:10:37'),
(7, 14, 'Post Metric', 'gfhghb', 'Bsc', 'ghfghfghf', 'USA', 20016, '2023-05-04 09:17:44', '2023-05-04 09:17:44');

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
(1, 1, 'REACT'),
(2, 1, 'PHP'),
(3, 1, 'JAVA'),
(4, 1, 'CodeIgniter'),
(5, 2, 'REACT'),
(6, 2, 'PHP'),
(7, 3, 'Good communication'),
(8, 3, 'Tally ERP nine'),
(9, 4, 'Good communication'),
(10, 4, 'React js'),
(11, 4, 'HTML'),
(12, 4, 'CSS'),
(15, 14, 'jhhjghj'),
(16, 14, 'ghgjgj'),
(18, 17, 'Html'),
(20, 12, 'Html'),
(21, 12, 'Css'),
(22, 18, 'REACT'),
(23, 18, 'PHP'),
(24, 18, 'JAVA'),
(25, 18, 'Html'),
(26, 18, 'java');

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
,`profile_complete` decimal(23,2)
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
  `token` varchar(301) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`company_id`, `company_name`, `industry`, `corporation`, `alias`, `company_start_date`, `company_size`, `website_url`, `vacancy_for_post`, `about`, `contact_person_name`, `email`, `password`, `contact_no`, `contact_no_other`, `address`, `pin_code`, `city`, `state`, `country`, `designation`, `logo`, `is_active`, `created_at`, `updated_at`, `created_by_admin`, `is_deleted`, `franchise`, `token`) VALUES
(1, 'We2code', 'IT', 'B2C', 'w2c', '2021-11-03', '15', 'we2code.com', 'business executive', '\"We are Web Development, Design company. We offer various service like Web Development, Web Design, E commerce Development, Graphics Design, Web Service, Web Portal Development etc.\"', 'Niranter sing pandya', 'nirantar.we2code@gmail.com', NULL, 9517538246, 8526547539, '2nd Floor, 45 Universal Tower, P. U. 4, Scheme 54 PU4,', 452001, 'indore', 'mp', 'india', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1682593173.png', 0, '2023-04-27 10:59:33', '2023-04-27 11:04:03', 0, 1, '', ''),
(2, 'Gourav Agency ', 'Tourism', 'B2C', 'GOR', '2020-02-20', '20', 'ghfg.com', 'driver ', 'The primary role of a travel agent is to help people make travel arrangements, which might include booking flights, hotels, sightseeing tours, and making dining recommendations. A travel agent assesses each customer\'s unique needs, preferences, and budget to ensure their trip goes as smoothly as possible.', 'Gourav choudary', 'g.choudhary.we2code@gmail.com', 'f1ed9271ef2e3edadb24e6b73689b918', 7247395400, 7519532684, 'Ram nagar', 752963, 'indore', 'mp', 'india', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1682665145.jpeg', 0, '2023-04-28 05:13:42', '2023-05-08 09:47:39', 0, 0, 'Indore', '25d6e76919563bf280487934df5fcd37'),
(3, 'Microsoft', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sham mohe', 'utkarsh.we2code@gmail.com', 'fe6717eb62ed9eef1de1163f02b6e1b1', 9632587410, 857412369, 'gvjhk', 555555, 'indore', 'mp', 'india', NULL, NULL, 0, '2023-04-28 08:51:49', '2023-05-09 07:22:08', 0, 0, '', '716435ac874e7229afdd9007f7b744e2'),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'raj.we2code@gmail.com', 'cef3716fbd0b7899de14c932929339b7', 1234567890, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-28 09:00:47', '2023-04-28 09:00:47', 0, 0, '', ''),
(7, 'Shreeji jwellers', 'Other', 'B2C', NULL, '1991-01-07', '15', NULL, 'office boy', 'asdfg fdg bjdfh dgh gh', 'Shreeji', 'shree.we2code@gmail.com', '87a2261bfb7915eeb1903942466091aa', 1574268935, 8965412370, 'Ram nagar', 752963, 'indore', 'mp', 'India', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1683346845.jpeg', 0, '2023-05-03 09:10:30', '2023-05-09 05:03:04', 0, 0, '', ''),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'raj.we2codee@gmail.com', 'cef3716fbd0b7899de14c932929339b7', 9993266886, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-03 09:14:04', '2023-05-03 09:14:04', 0, 0, '', ''),
(12, 'hhhhhhhhhhhhhh', 'It', 'B2B', NULL, '2001-01-01', '55', 'ghfg.com', 'fgdfghfhd', ' ngh sfghvb dfh fd', 'Gourav choudary', 'g.choudhary.we2code@gmail.com', NULL, 555555555555555555, 55555555555555555, 'Ram nagar', 752963, 'indore', 'mp', 'India', NULL, NULL, 0, '2023-05-04 08:43:23', '2023-05-11 11:16:36', 7, 0, 'gfgh', ''),
(13, 'Dezzy', 'GY', 'C2C', NULL, '2005-05-05', '9', NULL, 'tyh bnth', 'teb rtfyb ertyr bntyu byerty brtytyu u ntyu tyu ', 'Gourav choudary', 'g.choudhary.we2code@gmail.com', NULL, 78965412154, 8520147963, 'Ram nagar', 752963, 'indore', 'mp', 'India', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1683290351.png', 0, '2023-05-04 09:02:24', '2023-05-11 11:16:28', 7, 0, '', ''),
(15, 'hululululu@', 'Transport', 'B2C', NULL, '2015-04-30', '9', NULL, 'office boy', 'dfg btfrgftg fdyh fb', 'Gourav choudary', 'g.choudhary.we2code@gmail.com', NULL, 1547823687, NULL, 'Ram nagar', 752963, 'indore', 'mp', 'India', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1683365081.png', 0, '2023-05-06 09:24:41', '2023-05-13 11:00:05', 2, 0, '', ''),
(22, 'lala', 'IT', 'B2C', NULL, '2019-05-28', 'cvbvb', NULL, 'vbvbcvb', 'cvbcvb', 'Gourav choudary', 'g.choudhary.we2code@gmail.com', NULL, 9998567412, NULL, 'Ram nagar', 752963, 'indore', 'mp', 'India', NULL, NULL, 0, '2023-05-06 09:35:09', '2023-05-06 09:50:54', 2, 1, '', ''),
(23, 'yoyoyo', 'Transport', 'B2C', NULL, '2020-02-04', 'ttttt', NULL, 'ttttttt', 'Testtttting ', 'Gourav choudary', 'g.choudhary.we2code@gmail.com', NULL, 9517426283, NULL, 'Ram nagar', 752963, 'indore', 'mp', 'India', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1683366513.png', 0, '2023-05-06 09:36:27', '2023-05-06 09:48:33', 2, 1, '', ''),
(24, 'Amazon India@', 'Hospitality', 'B2B', NULL, '2023-02-02', 'uuuuuuu', NULL, 'Manager', 'uuu', 'Shivam', 'aaa@cc.com', NULL, 1221212221, NULL, '121. Alok Nagar', 452001, 'Indore', 'MP', 'India', 'Manager', 'https://apnaorganicstore.in/canjobs/uploads/1683367558.png', 0, '2023-05-06 09:36:53', '2023-05-13 10:59:50', 2, 0, '', ''),
(25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gourav.we2code@gmail.com', '3f30aff52f55a2a0c2d7a0e02e7872eb', 9874563210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-09 06:37:01', '2023-05-09 06:37:01', 0, 0, '', ''),
(29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aashi.we2code@gmail.com', '4f1058b235cc3827fb8888a5d1aab930', 8974563210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-10 12:06:07', '2023-05-10 12:06:07', 0, 0, '', ''),
(30, 'greenbay tech', 'GE', 'C2B', 'fcgvhbjn', '2023-05-11', 'sdfgh', NULL, 'fgvhb', 'zsxdcgvhbnm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1683802889.png', 0, '2023-05-11 11:01:29', '2023-05-11 11:01:29', 7, 0, '', ''),
(31, 'Cognizant', 'GE', '@#$%^', 'fcgvhbjn', '2023-05-01', 'wearfs', NULL, 'werfdweafsdweasfd', 'wersdfg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-11 11:18:03', '2023-05-11 11:18:03', 7, 0, '', ''),
(32, '1wqidah', 'GY', 'B2B', NULL, '2023-05-10', 'sdfgh', NULL, 'fgvhb', 'dasf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-11 12:23:14', '2023-05-11 12:23:14', 7, 0, '', ''),
(33, 'greenbay tech', 'GY', 'B2B', NULL, '2023-05-12', 'sdfgh', 'WWW.GOO@!GLS12E.COM', 'aaaaaaaaaaaaaaaaa', 'Introduction\nDuring 2016, employment in the EU finally returned to\nthe same level as before the global financial crisis. The\nrecovery that began in 2013 has resulted in the net\ncreation of eight million new jobs. Most of this net new\nemployment has been created in services, but there has\nalso been a marked rebound in manufacturing\nemployment, with around 1.5 million new jobs.\nThis, the sixth annual European Jobs Monitor report,\nlooks in more detail at recent shifts (from the second\nquarter (Q2) of 2011 to 2016 Q2) in employment at\nMember State and aggregate EU levels. Part 1 of the\nreport applies a ‘jobs-based approach’ to describe\nemployment shifts quantitatively (how many jobs were\ncreated or destroyed and in what sectors) and\nqualitatively (what kinds of jobs they were, primarily in\nterms of average hourly pay). Part 2, a more analytical\nsection, discusses the role that occupations play in\nstructuring European wage inequality, and to what\nextent the observed patterns of job polarisation and\nupgrading have contributed to wage inequality trends\nin the last decade.\nPolicy context\nThe EU’s Europe 2020 strategy for smart, sustainable\nand inclusive growth includes a commitment to\nfostering high levels of employment and productivity.\nThis implies a renewed focus on the goals of the earlier\nLisbon Agenda, ‘more and better jobs’. More jobs are\nneeded to address the problem of unacceptably high\nunemployment rates. But Europe also needs better and\nmore productive jobs if it is to succeed once again in\nimproving living standards for its citizens in an\nexpanding, integrated global economy. The European\nCommission’s 2012 Employment Package (‘Towards a\njob-rich recovery’) identifies some sectors in which\nemployment growth is considered most likely: health\nservices, information and communications technology,\nand personal and household services, as well as the\npromising if hard-to-define category of ‘green jobs’. The\njobs-based approach adopted in this report provides\nup-to-date data about employment levels and job\nquality in growing and declining sectors and\noccupations.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-12 08:37:50', '2023-05-12 09:19:16', 13, 0, '', '');

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
(1, 2, 3, 1, 'Have to scheduled interview next week.', '2023-05-01', '2023-04-28 11:03:06'),
(2, 2, 3, 1, 'Interview is preponderate tomorrow.', '2023-04-29', '2023-04-28 11:03:56'),
(3, 3, 1, 1, 'Interview tomorrow.', '2023-04-30', '2023-04-28 11:03:56'),
(4, 3, 1, 1, 'Interview tomorrow.', '0000-00-00', '2023-04-28 11:03:56'),
(5, 2, 2, 1, 'Testing', '2023-05-02', '2023-05-02 10:15:32'),
(6, 2, 2, 1, 'dadasd', '2023-05-17', '2023-05-02 10:15:42'),
(7, 2, 2, 4, 'Hello', '2023-05-02', '2023-05-02 10:33:03'),
(8, 2, 2, 1, 'Testing0000987654321', '0000-00-00', '2023-05-02 10:34:11'),
(9, 2, 12, 12, 'fddgdgv', '2023-05-17', '2023-05-06 10:03:00'),
(10, 2, 12, 12, 'ftghgfhfghfg', '0000-00-00', '2023-05-06 10:06:21'),
(11, 2, 21, 12, 'New Followw up', '2023-05-10', '2023-05-08 10:36:44'),
(12, 2, 9, 4, 'new stattuususk ', '2023-05-11', '2023-05-08 11:15:18'),
(13, 2, 21, 12, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', '2023-05-10', '2023-05-08 11:16:12'),
(14, 2, 15, 17, 'thfgjhnfghn', '2023-05-19', '2023-05-08 13:01:01'),
(15, 2, 21, 12, 'tgdfgv', '2023-05-20', '2023-05-08 13:01:59'),
(16, 13, 15, 18, 'Testing', '2023-05-13', '2023-05-12 05:52:34');

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
(1, 1, 'develo', '0-1 ', '1Lac-3Lac', 'Turkey', 'IT', 'www.c', 'hjkdfghjkl', 'jhgffgh', 'dfgh', 'Al', 'Other than SWAP', NULL, 'Metric', 'French', 'artwet', 'Part Time', 3, 1, '2023-04-27 11:38:22', '2023-04-27 11:38:55', 0, 0, 1),
(2, 1, 'developer', '1-3 ', '3Lac-5Lac', 'Russia', 'Hospitality', 'www.caattcs.com', 'dfghbjnk', 'jthrgfe', 'rhtgfds', 'rawtwe', 'Part Time with SWAP', NULL, 'Diploma', 'Marathi', '!@#', 'Part Time', 2, 1, '2023-04-27 12:09:01', '2023-04-27 12:19:34', 0, 0, 0),
(3, 2, 'Driver', '1-3 ', '3Lac-5Lac', 'India', 'Transport', 'www.careerattcs.com', '\nThe primary role of a travel agent is to help people make travel arrangements, which might include booking flights, hotels, sightseeing tours, and making dining recommendations. A travel agent assesses each customer\'s unique needs, preferences, and budget to ensure their trip goes as smoothly as possible.', '\nThe primary role of a travel agent is to help people make travel arrangements, which might include ', '\nThe primary role of a travel ', ' The primary role of a travel ', 'Full Time', NULL, 'Metric', 'English', 'aaas', 'Full Time', 5, 1, '2023-04-28 07:05:03', '2023-04-28 07:05:03', 0, 0, 0),
(4, 5, 'developer', '0-1 ', 'Below 1 Lac', 'India', 'IT', 'www.canjobs.com', 'gfhgn ghjghj ghjh ghjg ghjhg fthytuytgkm ', 'ghjgh ghj j hgjj', 'ghjghj y fghjghjgjh fgjh', ' yh hy yh', 'Full Time with SWAP', NULL, 'M. Tech', 'Hindi', 'koqdv kja  jio okjoa jojoqjdo', 'Full Time', 3, 1, '2023-05-01 07:19:45', '2023-05-01 07:19:45', 0, 0, 0),
(5, 1, 'php developer', '0-1 ', '3Lac-5Lac', 'UK', 'IT', 'apollo.com', 'fgbr dhrthg ydyt hft dt rtgty th th', 'fghfh fhfh fgfgh wtt ', 'gtf ty tyh ', 'fhfgh gfh g dfhg ', 'Full Time', NULL, 'Msc', 'French', 'artwet', 'Full Time', 3, 1, '2023-05-01 08:36:05', '2023-05-01 08:36:05', 0, 0, 0),
(6, 2, 'Sweaper ', '1-3 ', '5Lac-10Lac', 'India', 'Tourism', 'cdsvdfv.com', 'sdgdfb dfg dgdg ', 'dfg dfg fgdf dgb fg ', 'fgfdg gf  fgfdghfb dfhf fghf g', 'gf fgf gfh', 'Part Time', NULL, 'M. Tech', 'French', 'metric', 'Other', 5, 1, '2023-05-01 08:40:06', '2023-05-01 08:40:06', 0, 0, 0),
(7, 5, 'Watchmen', '7+ ', 'Above 10Lac', 'UK', 'Transport', 'cdsvdfv.com', 'dfg fgdfg  ', 'fgfdg fgfdb fghf ', 'dfgfb fgf hf fgf g ', ' rtdf ', 'Full Time with SWAP', NULL, 'Msc', 'Hindi', 'fgdfg', 'Full Time', 3, 1, '2023-05-01 08:44:56', '2023-05-01 08:44:56', 0, 0, 0),
(8, 11, 'fgbhvfgh ', '0-1 ', 'Below 1 Lac', 'India', 'Transport', 'fg.com', 'gh thy fdgh hj dghjnbvhjtyj ghj tyhvb ghnbngfhjg hfghhn ghvngmg fghfg ghnht gnv fghfh hnvnvbfhf hgyhjm fgvc fhj gh', 'fhf fgh ftghfh fgh fgjh', ' yhfgh nmgh g jnfghf ', 'hfg fghfgh ', 'Full Time with SWAP', NULL, 'Bsc', 'Hindi', 'fgh fgh ', 'Full Time', 3, 1, '2023-05-04 09:07:44', '2023-05-04 09:07:44', 0, 0, 0),
(9, 3, 'mjhm', '0-1 ', 'Below 1 Lac', 'India', 'IT', 'fgfdgvb.com', 'fgdfhg', 'h bsfrtgh tyhb jn', 'fgh drtghf ', 'hfg fghfgh hb', 'Full Time', NULL, 'Bsc', 'Hindi', 'fgh fgh ', 'Other', 4, 1, '2023-05-04 09:08:51', '2023-05-04 09:08:51', 0, 0, 0),
(10, 11, 'hhhhhhhhhhhhh', 'Fresher', '5Lac-10Lac', 'Canada', 'Hospitality', 'ghg.com', 'df df df dsf sdf ', 'sdf sdf sdf sdf sdf ', 'sdf zdrfgv df df rdsfre dfgvrd', 'dfsd f df', 'Full Time', NULL, 'Msc', 'French', 'fgh fgh ', 'Full Time', 4, 1, '2023-05-04 09:13:03', '2023-05-04 09:16:26', 7, 0, 1),
(11, 7, 'Delivery boy', '0-1 ', '1Lac-3Lac', 'USA', 'Other', 'ddd.com', 'cfghcvh xfgvfgb dfg shg dgh ', 'fghfh fgh gh dgyh', ' dfgh dfgh dfh dfgh fh dgh ', 'fgh fgh ', 'Full Time with SWAP', NULL, 'M. Tech', 'English', 'fgh fgh ', 'Part Time', 7, 1, '2023-05-04 09:45:01', '2023-05-06 06:52:47', 0, 0, 0),
(12, 13, 'Drawing ', '0-1 ', '1Lac-3Lac', 'India', 'Transport', 'ddd.com', 'dfd gf', 'dfghfhfgh', 'fgfgh', 'fgdfgh', 'Full Time', NULL, 'Mcom', 'Gujrati', 'fgh fgh ', 'Full Time', 7, 1, '2023-05-04 10:10:49', '2023-05-06 08:36:33', 7, 0, 0),
(13, 6, 'Shristha soni', 'Fresher', '1Lac-3Lac', 'India', 'IT', 'fgfdgvb.com', 'dfgd dg dffg ', 'sdf g dfg fg', 'fdg fgdfg ', 'hfg fghfgh ', 'Full Time with SWAP', NULL, 'B. Tech', 'Hindi', 'fgh fgh ', 'Part Time', 4, 1, '2023-05-06 08:55:56', '2023-05-06 09:02:49', 2, 0, 0),
(14, 6, 'Driver', '0-1 ', 'Below 1 Lac', 'Canada', 'Hospitality', 'ghg.com', 'fgdfg fg sfg sfg', 'dfgdf g', ' fgfdgf fgfg ', 'ffg fg fg', 'Part Time', NULL, 'Bsc', 'Hindi', 'fgh fgh ', 'Part Time', 4, 1, '2023-05-06 09:03:20', '2023-05-06 09:03:20', 2, 0, 0),
(15, 7, 'Shreestha soni', '0-1 ', '3Lac-5Lac', 'India', 'Other', 'ddd.com', 'drtyhy btgh f', 'gf hdfghf gnh ', 'fgf h', 'fghg', 'Full Time with SWAP', NULL, 'B. Tech', 'English', 'fgh fgh ', 'Part Time', 7, 1, '2023-05-06 09:05:15', '2023-05-06 09:41:21', 2, 0, 0),
(16, 6, 'Driver', 'Fresher', '1Lac-3Lac', 'Canada', 'Transport', 'ghg.com', 'fdg ftgh fgh fgb fgh ', 'fghf fgfgh fgh fghfg ', 'gfhgh fghyhfg gvfh htg', 'fgh h', 'Full Time', NULL, 'Bsc', 'Hindi', 'fgh fgh ', 'Full Time', 4, 1, '2023-05-06 09:06:57', '2023-05-06 09:06:57', 2, 0, 1),
(17, 6, 'jeweler ', '0-1 ', '1Lac-3Lac', 'USA', 'Transport', 'fgfdgvb.com', 'sedf dtgh ', 'fghfg g', 'h fghf ghfh ', 'fgh dgh', 'Part Time', NULL, 'Msc', 'Hindi', 'fgh fgh ', 'Full Time', 5, 1, '2023-05-06 09:09:07', '2023-05-06 09:12:10', 2, 0, 1),
(18, 2, 'Shristha soni', '0-1 ', 'Below 1 Lac', 'USA', 'Tourism', 'ghg.com', 'cvgdfgvdf ', 'edfeg', 'redfvVDCVcv', 'FWFF', 'Full Time', NULL, 'Bsc', 'English', 'fgh fgh ', 'Full Time', 5, 1, '2023-05-06 09:11:40', '2023-05-06 09:11:40', 2, 0, 1),
(19, 5, 'PANDIT', '0-1 ', 'Below 1 Lac', 'Canada', 'Transport', 'ghg.com', 'GHFGH F', 'fgfdgf', 'f dfgfhdf ', 'fgh gdhdfh ', 'Full Time', NULL, 'Msc', 'Hindi', 'fgh fgh ', 'Full Time', 3, 1, '2023-05-06 09:12:43', '2023-05-06 09:12:43', 2, 0, 1),
(20, 6, 'gfdf ghdfgdfgdfgdfg ghfghdfhfg', '0-1 ', 'Below 1 Lac', 'Canada', 'IT', 'fg.com', 'fgfd hhfghd gghdgfbn ', 'fgh hfgbfgh fgbfh hgf', 'g fdg rtg gdfx ', 'fg fg ', 'Full Time with SWAP', NULL, 'B. Tech', 'Hindi', 'fgh fgh ', 'Other', 4, 1, '2023-05-06 09:13:58', '2023-05-06 09:13:58', 2, 0, 1),
(21, 2, 'Driver', '0-1 ', '1Lac-3Lac', 'USA', 'Transport', 'ghg.com', 'ghfgh f dfgh ', ' fghfg hdfgh fth', 'tygtry hfghftgh ', 'fgh fgh ', 'Part Time', NULL, 'Msc', 'French', 'fgh fgh ', 'Other', 5, 1, '2023-05-06 09:14:59', '2023-05-06 09:14:59', 2, 0, 0),
(22, 7, 'rajsoni', '1-3 ', 'Below 1 Lac', 'USA', 'Transport', 'ghg.com', 'fdvdvfdgvb', 'fvdfvdfvdf', 'vdfvdfdfdfdfvsdfv', 'dfvdsvsdv', 'Part Time with SWAP', NULL, 'B. Tech', 'Hindi', 'fgh fgh ', 'Full Time', 5, 1, '2023-05-06 09:38:27', '2023-05-06 09:38:27', 2, 0, 1),
(24, 2, 'manager', '5+yrs', '1400000', 'banglore', 'IT', 'www.careerattcs.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', ' OIJO FOIJOJASDFVJ I JOJ Okdwjfoj oiho jOSDJFOIH9wrugh JM[- wmc MJDFHVBIU', 'OJOK ojioj 90dfujpjknel; oijcxjiojoHDFVB OIRBFNDC ,ZXMN HG JKDV', 'Bussiness', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-05-11 07:10:04', '2023-05-11 07:10:04', 0, 0, 0),
(25, 2, 'manager', '5+yrs', '1400000', 'banglore', 'IT', 'www.careerattcs.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', ' OIJO FOIJOJASDFVJ I JOJ Okdwjfoj oiho jOSDJFOIHwrugh JM[- wmc MJDFHVBIU', 'OJOK ojioj dfujpjknel; oijcxjiojoHDFVB OIRBFNDC ,ZXMN HG JKDV', 'Bussiness', 'qefgvqdfv', NULL, 'Graduate', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-05-11 08:52:59', '2023-05-15 07:17:46', 0, 0, 0),
(26, 2, 'manager', '5+yrs', '1400000', 'banglore', 'IT', 'www.careerattcs.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', ' OIJO FOIJOJASDFVJ I JOJ Okdwjfoj oiho jOSDJFOIH9wrugh JM[- wmc MJDFHVBIU', 'OJOK ojioj 90dfujpjknel; oijcxjiojoHDFVB OIRBFNDC ,ZXMN HG JKDV', 'Bussiness', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-05-11 09:12:07', '2023-05-11 09:12:07', 0, 0, 0),
(27, 2, 'manager', '5+yrs', '1400000', 'banglore', 'IT', 'www.careerattcs.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', ' OIJO FOIJOJASDFVJ I JOJ Okdwjfoj oiho jOSDJFOIH9wrugh JM[- wmc MJDFHVBIU', 'OJOK ojioj 90dfujpjknel; oijcxjiojoHDFVB OIRBFNDC ,ZXMN HG JKDV', 'Bussiness', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-05-11 09:13:25', '2023-05-11 09:13:25', 0, 0, 0),
(28, 2, 'manager', '5+yrs', '1400000', 'banglore', 'IT', 'www.careerattcs.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', ' OIJO FOIJOJASDFVJ I JOJ Okdwjfoj oiho jOSDJFOIH9wrugh JM[- wmc MJDFHVBIU', 'OJOK ojioj 90dfujpjknel; oijcxjiojoHDFVB OIRBFNDC ,ZXMN HG JKDV', 'Bussiness', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-05-11 09:25:28', '2023-05-11 09:25:28', 0, 0, 0),
(29, 2, 'manager', '5+yrs', '1400000', 'banglore', 'IT', 'www.careerattcs.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', ' OIJO FOIJOJASDFVJ I JOJ Okdwjfoj oiho jOSDJFOIH9wrugh JM[- wmc MJDFHVBIU', 'OJOK ojioj 90dfujpjknel; oijcxjiojoHDFVB OIRBFNDC ,ZXMN HG JKDV', 'Bussiness', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-05-11 09:25:50', '2023-05-11 09:25:50', 0, 0, 0),
(30, 2, 'manager', '5+yrs', '1400000', 'banglore', 'IT', 'www.careerattcs.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', ' OIJO FOIJOJASDFVJ I JOJ Okdwjfoj oiho jOSDJFOIH9wrugh JM[- wmc MJDFHVBIU', 'OJOK ojioj 90dfujpjknel; oijcxjiojoHDFVB OIRBFNDC ,ZXMN HG JKDV', 'Bussiness', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-05-11 09:27:25', '2023-05-11 09:27:25', 0, 0, 0);

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
(1, NULL, 0, 'IT', 1, '2023-04-28 04:29:36', '2023-04-28 04:29:36', 0),
(2, NULL, 0, 'Medical', 1, '2023-04-28 04:30:20', '2023-04-28 04:30:20', 0),
(3, 'Front end Developer', 1, 'IT', 1, '2023-04-28 04:30:46', '2023-04-28 04:30:46', 0),
(4, 'Back end developer', 1, 'IT', 1, '2023-04-28 04:31:26', '2023-04-28 04:31:26', 0),
(5, 'Engineering Professor', 2, 'Medical', 1, '2023-04-28 04:32:02', '2023-05-08 10:24:56', 0),
(6, NULL, 0, 'Education', 1, '2023-05-02 05:23:10', '2023-05-02 05:23:10', 0),
(7, 'Teacher', 6, 'Education', 1, '2023-05-02 05:24:16', '2023-05-02 05:24:16', 1),
(8, NULL, 2, 'Medical', 1, '2023-05-02 05:54:14', '2023-05-02 05:54:14', 1),
(9, NULL, 6, 'Education', 1, '2023-05-02 05:54:29', '2023-05-02 05:54:29', 1),
(10, NULL, 1, 'IT', 1, '2023-05-02 05:54:48', '2023-05-02 05:54:48', 1),
(11, NULL, 2, 'Medical', 1, '2023-05-02 05:55:00', '2023-05-02 05:55:00', 1),
(12, NULL, 2, 'Medical', 1, '2023-05-02 05:55:06', '2023-05-02 05:55:06', 1),
(13, NULL, 6, 'Education', 1, '2023-05-02 06:01:41', '2023-05-02 06:01:41', 1),
(14, 'Teacher', 2, 'Medical', 1, '2023-05-02 06:10:07', '2023-05-02 06:11:00', 1),
(15, NULL, 0, 'Hello', 1, '2023-05-04 09:14:35', '2023-05-04 09:14:35', 0),
(16, 'gjygj', 1, 'IT', 1, '2023-05-04 09:14:41', '2023-05-04 09:14:46', 1),
(17, NULL, 0, 'Hey', 1, '2023-05-08 10:19:20', '2023-05-08 10:19:20', 0),
(18, NULL, 0, '1Hellllllllo', 1, '2023-05-08 10:25:23', '2023-05-10 11:47:36', 0),
(19, NULL, 0, 'ssss112345678', 1, '2023-05-08 10:26:52', '2023-05-10 11:43:59', 0),
(20, NULL, 18, 'oooooooooooooooooooo', 1, '2023-05-08 10:34:39', '2023-05-08 10:34:39', 1),
(21, NULL, 18, '252525', 1, '2023-05-08 10:34:51', '2023-05-08 10:34:51', 1),
(22, NULL, 19, 'pop', 1, '2023-05-08 10:35:05', '2023-05-08 10:35:05', 1),
(23, NULL, 15, 'llllklk', 1, '2023-05-08 10:36:26', '2023-05-08 10:36:26', 1),
(25, NULL, 19, 'Anmol', 1, '2023-05-08 11:11:13', '2023-05-08 11:11:13', 1),
(26, NULL, 0, 'Hotel', 1, '2023-05-09 06:22:46', '2023-05-09 06:22:46', 0),
(27, 'hdafkjshk', 26, 'Hotel', 1, '2023-05-10 10:11:29', '2023-05-10 10:11:29', 1),
(28, 'sdac', 1, 'IT', 1, '2023-05-10 10:12:21', '2023-05-10 10:12:21', 0),
(29, 'dafs', 17, 'Hey', 1, '2023-05-10 10:12:29', '2023-05-10 10:12:29', 1),
(30, 'dfashjhjfdljsah', 18, 'Hellllllllo', 1, '2023-05-10 10:31:49', '2023-05-10 10:31:49', 1),
(31, 'hdafkjshk', 2, 'Medical', 1, '2023-05-10 10:43:45', '2023-05-10 10:43:45', 0),
(32, 'hdafkjshk', 1, 'IT', 1, '2023-05-10 10:43:51', '2023-05-10 10:43:51', 0),
(33, 'hdafkjshk', 15, 'Hello', 1, '2023-05-10 10:43:57', '2023-05-10 10:43:57', 1),
(34, NULL, 0, 'IT', 1, '2023-05-10 11:28:03', '2023-05-10 11:28:03', 0),
(35, NULL, 0, 'IT', 1, '2023-05-10 11:52:42', '2023-05-10 11:52:42', 0),
(36, NULL, 0, 'ssss112345678', 1, '2023-05-10 11:52:48', '2023-05-10 11:52:48', 0),
(37, NULL, 0, '1Hellllllllo', 1, '2023-05-10 11:52:52', '2023-05-10 11:52:52', 0),
(38, NULL, 0, 'IT', 1, '2023-05-10 11:52:55', '2023-05-10 11:52:55', 0),
(39, NULL, 0, 'ssss112345678', 1, '2023-05-10 11:52:59', '2023-05-10 11:52:59', 0),
(40, NULL, 0, '1Hellllllllo', 1, '2023-05-10 11:53:03', '2023-05-10 11:53:03', 0),
(41, NULL, 0, 'ssss112345678', 1, '2023-05-10 11:59:38', '2023-05-10 11:59:38', 0),
(42, NULL, 0, '1Hellllllllo', 1, '2023-05-10 11:59:42', '2023-05-10 11:59:42', 0),
(43, NULL, 0, 'IT', 1, '2023-05-10 11:59:46', '2023-05-10 11:59:46', 0),
(44, NULL, 0, 'ssss112345678', 1, '2023-05-10 11:59:49', '2023-05-10 11:59:49', 0),
(45, NULL, 0, '1Hellllllllo', 1, '2023-05-10 11:59:54', '2023-05-10 11:59:54', 0),
(46, NULL, 0, '1Hellllllllo', 1, '2023-05-10 11:59:57', '2023-05-10 11:59:57', 0),
(47, NULL, 0, 'ssss112345678', 1, '2023-05-10 12:00:03', '2023-05-10 12:00:03', 0),
(48, NULL, 0, '1Hellllllllo', 1, '2023-05-10 12:00:09', '2023-05-10 12:00:09', 0),
(49, NULL, 0, 'ssss112345678', 1, '2023-05-10 12:00:14', '2023-05-10 12:00:14', 0),
(50, NULL, 0, 'ssss112345678', 1, '2023-05-10 12:00:18', '2023-05-10 12:00:18', 0),
(51, NULL, 0, 'Hello', 1, '2023-05-13 08:53:40', '2023-05-13 08:53:40', 0),
(52, NULL, 0, 'Hello', 1, '2023-05-13 08:54:49', '2023-05-13 08:54:49', 0),
(53, NULL, 0, 'ppl', 1, '2023-05-13 08:56:23', '2023-05-13 08:56:23', 0),
(54, NULL, 0, '4444', 1, '2023-05-13 09:05:21', '2023-05-13 09:05:21', 0),
(55, 'sdac', 1, 'IT', 1, '2023-05-16 05:31:40', '2023-05-16 05:31:40', 1),
(56, NULL, 0, 'AAAAAAAAlo', 1, '2023-05-16 05:32:07', '2023-05-16 05:32:07', 0),
(57, NULL, 0, 'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu', 1, '2023-05-16 05:45:29', '2023-05-16 05:45:29', 0),
(58, NULL, 0, 'pppplplplpl', 1, '2023-05-16 09:21:02', '2023-05-16 09:21:02', 0),
(59, 'pZZZZZZZZ', 58, 'pppplplplpl', 1, '2023-05-16 09:21:22', '2023-05-16 09:21:22', 0),
(60, NULL, 0, 'ghjgjghj', 1, '2023-05-16 09:21:51', '2023-05-16 09:21:51', 0),
(61, 'yjhgjfgjhn', 60, 'ghjgjghj', 1, '2023-05-16 09:21:58', '2023-05-16 09:21:58', 0),
(62, 'hiilloooooo', 17, 'Hey', 1, '2023-05-16 09:25:00', '2023-05-16 09:25:00', 0),
(63, 'ggggyhtyhyf', 17, 'Hey', 1, '2023-05-16 10:13:04', '2023-05-16 10:13:04', 0);

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
  `status` varchar(21) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_admin` int(51) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_interviews`
--

INSERT INTO `job_interviews` (`id`, `job_id`, `employee_id`, `interview_date`, `is_reschedule`, `is_active`, `status`, `created_at`, `created_by_admin`, `updated_at`) VALUES
(1, 3, 1, '2023-04-29', 1, 1, 'pending', '2023-04-28 11:06:19', 2, '2023-04-28 11:06:19'),
(2, 3, 1, '2023-04-29', 1, 0, 'complete', '2023-04-28 11:06:19', 2, '2023-04-28 11:06:19'),
(3, 3, 1, '2023-05-11', 1, 0, '', '2023-05-02 06:31:35', 2, '2023-05-02 06:31:35'),
(4, 2, 1, '2023-05-12', 1, 0, '', '2023-05-02 10:15:55', 2, '2023-05-02 10:15:55'),
(5, 5, 4, '2023-05-18', 1, 0, '', '2023-05-02 10:16:03', 2, '2023-05-02 10:16:03'),
(6, 2, 4, '2023-05-04', 0, 1, '', '2023-05-02 10:32:51', 2, '2023-05-02 10:32:51'),
(7, 2, 1, '2023-05-04', 1, 0, '', '2023-05-02 10:38:17', 2, '2023-05-02 10:38:17'),
(8, 2, 1, '2023-05-17', 0, 1, '', '2023-05-02 10:39:54', 2, '2023-05-02 10:39:54'),
(9, 7, 4, '2023-05-02', 1, 0, '', '2023-05-02 10:44:43', 2, '2023-05-02 10:44:43'),
(10, 4, 1, '2023-05-03', 1, 0, '', '2023-05-02 10:46:11', 2, '2023-05-02 10:46:11'),
(11, 7, 4, '2023-05-04', 1, 0, '', '2023-05-02 10:46:21', 2, '2023-05-02 10:46:21'),
(12, 4, 4, '2023-06-02', 1, 0, '', '2023-05-02 10:47:00', 2, '2023-05-02 10:47:00'),
(13, 3, 4, '2023-05-01', 0, 1, '', '2023-05-02 10:48:25', 2, '2023-05-02 10:48:25'),
(14, 5, 4, '2023-05-02', 0, 1, '', '2023-05-02 10:48:32', 2, '2023-05-02 10:48:32'),
(15, 4, 4, '2023-05-04', 1, 0, '', '2023-05-02 10:48:38', 2, '2023-05-02 10:48:38'),
(16, 4, 4, '2023-05-05', 1, 0, '', '2023-05-02 10:48:42', 2, '2023-05-02 10:48:42'),
(17, 7, 4, '2023-05-06', 1, 0, '', '2023-05-02 10:48:47', 2, '2023-05-02 10:48:47'),
(18, 4, 1, '2023-05-07', 1, 0, '', '2023-05-02 10:48:57', 2, '2023-05-02 10:48:57'),
(19, 4, 4, '2023-05-03', 1, 0, '', '2023-05-02 10:52:03', 2, '2023-05-02 10:52:03'),
(20, 4, 4, '2023-05-04', 1, 0, '', '2023-05-02 10:52:09', 2, '2023-05-02 10:52:09'),
(21, 4, 4, '2023-05-04', 1, 0, '', '2023-05-05 10:18:29', 9, '2023-05-05 10:18:29'),
(22, 4, 1, '2023-05-07', 1, 0, '', '2023-05-05 10:18:31', 9, '2023-05-05 10:18:31'),
(23, 7, 4, '2023-05-06', 0, 1, '', '2023-05-05 10:18:33', 9, '2023-05-05 10:18:33'),
(24, 12, 12, '2023-05-08', 1, 0, '', '2023-05-06 10:03:44', 2, '2023-05-06 10:03:44'),
(25, 12, 12, '2023-05-06', 1, 0, '', '2023-05-06 10:06:10', 2, '2023-05-06 10:06:10'),
(26, 21, 12, '2023-05-10', 1, 0, '', '2023-05-08 11:05:46', 2, '2023-05-08 11:05:46'),
(27, 4, 1, '2023-05-08', 1, 0, '', '2023-05-08 13:03:46', 2, '2023-05-08 13:03:46'),
(28, 4, 1, '2023-05-08', 0, 1, '', '2023-05-08 13:07:21', 2, '2023-05-08 13:07:21'),
(29, 12, 12, '2023-05-08', 0, 1, 'complete', '2023-05-08 13:08:50', 2, '2023-05-08 13:08:50'),
(35, 5, 5, '2023-05-15', 0, 1, '', '2023-05-11 11:02:48', 5, '2023-05-11 11:02:48'),
(34, 5, 5, '2023-05-15', 1, 0, '', '2023-05-11 10:54:41', 5, '2023-05-11 10:54:41'),
(33, 5, 5, '2023-05-13', 1, 0, '', '2023-05-11 10:53:42', 5, '2023-05-11 10:53:42'),
(36, 3, 1, '2023-05-15', 1, 0, '', '2023-05-11 11:08:08', 5, '2023-05-11 11:08:08'),
(37, 3, 1, '2023-05-15', 1, 0, '', '2023-05-11 12:03:31', 5, '2023-05-11 12:03:31'),
(38, 3, 1, '2023-05-15', 1, 0, '', '2023-05-11 12:17:37', 5, '2023-05-11 12:17:37'),
(39, 3, 1, '2023-05-15', 1, 0, '', '2023-05-11 12:20:20', 5, '2023-05-11 12:20:20'),
(40, 3, 1, '2023-05-15', 1, 0, '', '2023-05-12 05:16:00', 5, '2023-05-12 05:16:00'),
(41, 3, 1, '2023-05-15', 1, 0, '', '2023-05-12 05:27:30', 5, '2023-05-12 05:27:30'),
(42, 15, 18, '2023-05-13', 0, 1, 'pending', '2023-05-12 05:52:53', 13, '2023-05-12 05:52:53'),
(43, 3, 1, '2023-05-15', 1, 0, '', '2023-05-12 06:25:18', 5, '2023-05-12 06:25:18'),
(44, 3, 1, '2023-05-15', 1, 0, '', '2023-05-12 06:30:29', 5, '2023-05-12 06:30:29'),
(45, 3, 1, '2023-05-15', 1, 0, '', '2023-05-12 06:32:06', 5, '2023-05-12 06:32:06'),
(46, 3, 1, '2023-05-15', 1, 0, '', '2023-05-12 06:43:59', 5, '2023-05-12 06:43:59'),
(47, 3, 1, '2023-05-15', 1, 0, '', '2023-05-12 06:44:30', 5, '2023-05-12 06:44:30'),
(48, 4, 4, '2023-04-25', 1, 0, '', '2023-05-15 05:38:59', 1, '2023-05-15 05:38:59'),
(49, 4, 4, '2023-04-25', 1, 0, '', '2023-05-15 05:42:25', 1, '2023-05-15 05:42:25'),
(50, 4, 4, '2023-04-25', 0, 1, '', '2023-05-15 05:46:09', 1, '2023-05-15 05:46:09'),
(51, 21, 12, '2023-05-25', 1, 0, '', '2023-05-15 05:48:24', 1, '2023-05-15 05:48:24'),
(52, 21, 12, '2023-05-25', 1, 0, '', '2023-05-15 05:49:03', 1, '2023-05-15 05:49:03'),
(53, 21, 12, '2023-05-25', 1, 0, '', '2023-05-15 06:03:07', 1, '2023-05-15 06:03:07'),
(54, 21, 12, '2023-05-25', 1, 0, '', '2023-05-15 06:08:45', 1, '2023-05-15 06:08:45'),
(55, 21, 12, '2023-05-25', 1, 0, '', '2023-05-15 06:09:10', 1, '2023-05-15 06:09:10'),
(56, 21, 12, '2023-05-25', 1, 0, '', '2023-05-15 06:11:54', 1, '2023-05-15 06:11:54'),
(57, 21, 12, '2023-05-25', 0, 1, '', '2023-05-15 09:01:46', 1, '2023-05-15 09:01:46'),
(58, 21, 1, '2023-05-25', 1, 0, '', '2023-05-16 07:16:12', 1, '2023-05-16 07:16:12'),
(59, 21, 1, '2023-05-25', 1, 0, '', '2023-05-16 07:19:00', 1, '2023-05-16 07:19:00'),
(60, 21, 1, '2023-05-25', 0, 1, '', '2023-05-16 07:19:05', 1, '2023-05-16 07:19:05'),
(61, 1, 1, '2023-05-25', 1, 0, '', '2023-05-16 07:20:40', 1, '2023-05-16 07:20:40'),
(62, 1, 1, '2023-05-25', 1, 0, '', '2023-05-16 07:21:21', 1, '2023-05-16 07:21:21'),
(63, 1, 1, '2023-05-25', 0, 1, '', '2023-05-16 07:23:57', 1, '2023-05-16 07:23:57'),
(64, 3, 1, '2023-05-25', 1, 0, '', '2023-05-16 07:25:50', 1, '2023-05-16 07:25:50'),
(65, 3, 1, '2023-05-25', 1, 0, '', '2023-05-16 07:26:58', 1, '2023-05-16 07:26:58'),
(66, 3, 1, '2023-05-25', 0, 1, '', '2023-05-16 07:30:41', 1, '2023-05-16 07:30:41');

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
(1, 'Skill', '{\"4\": \"css\", \"5\": \"Html\", \"6\": \"java\", \"10\": \"Html\", \"11\": \"communication\", \"12\": \"kotlin\", \"13\": \"c++\", \"14\": \"c\"}', '2023-04-18 05:52:56', '2023-05-16 13:05:27'),
(2, 'Category', '{\"3\": \"Front end Developer\", \"4\": \"Back end developer\", \"5\": \"Engineering Professor\"}', '2023-04-18 09:02:44', '2023-05-09 12:33:23'),
(3, 'Location', '{\"1\": \"Indore\", \"2\": \"Ujjain\", \"4\": \"Dewas\", \"5\": \"Khandwa\", \"6\": \"Bhilai\"}', '2023-04-18 09:03:51', '2023-04-20 12:38:47'),
(4, 'Industry', '{\"1\": \"GY\", \"2\": \"It\", \"4\": \"GE\", \"5\": \"it\", \"6\": \"IT\"}', '2023-04-18 09:04:56', '2023-05-15 11:18:30'),
(5, 'Education', '{\"1\": \"Post Graduate\", \"2\": \"Graduate\", \"7\": \"B.com\"}', '2023-04-18 09:05:35', '2023-05-15 08:31:18'),
(6, 'Corporation', '{\"1\": \"B2B\", \"2\": \"C2C\", \"4\": \"C2B\", \"5\": \"@#$%^\"}', '2023-04-18 09:06:14', '2023-05-15 08:31:23'),
(7, 'Language', '{\"1\": \"Hindi\", \"2\": \"English\"}', '2023-04-18 09:06:36', '2023-05-15 08:31:27'),
(8, 'Category_type', '[\"IT\", \"Medical\", \"Education\", \"Hello\", \"Hey\", \"1Hellllllllo\", \"ssss112345678\", \"Hotel\", \"ppl\", \"4444\", \"AAAAAAAAlo\", \"uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu\", \"pppplplplpl\", \"ghjgjghj\"]', '2023-05-15 11:27:47', '2023-05-16 13:00:33');

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
(1, 3, 1, 'Other', '2023-05-05', 1, '2023-04-28 11:09:08', '2023-05-02 12:01:42'),
(2, 2, 4, 'Reject', '2023-05-13', 1, '2023-05-02 06:31:58', '2023-05-02 10:33:22'),
(3, 3, 4, 'Reject', '2023-05-21', 1, '2023-05-02 06:32:06', '2023-05-02 06:32:06'),
(4, 5, 4, 'Draft', '2023-05-03', 1, '2023-05-02 10:14:52', '2023-05-02 11:43:33'),
(5, 4, 4, 'Approved', '2023-05-03', 1, '2023-05-02 10:36:11', '2023-05-02 10:36:11'),
(6, 7, 4, 'Complete', '2023-05-03', 1, '2023-05-02 10:36:40', '2023-05-02 11:45:42'),
(7, 6, 4, 'Pending', '2023-05-24', 1, '2023-05-02 11:47:02', '2023-05-02 11:47:02'),
(8, 12, 12, 'Reject', '2023-05-11', 1, '2023-05-06 10:04:34', '2023-05-06 10:06:01'),
(9, 21, 12, 'Complete', '2023-05-18', 1, '2023-05-08 10:32:02', '2023-05-08 11:05:54'),
(10, 9, 13, 'Approved', '2023-05-09', 1, '2023-05-08 10:32:18', '2023-05-08 10:32:18'),
(11, 9, 4, 'Reject', '2023-05-09', 1, '2023-05-08 11:13:51', '2023-05-08 11:14:14'),
(12, 15, 17, 'Approved', '2023-05-10', 1, '2023-05-08 13:00:42', '2023-05-08 13:00:42'),
(13, 15, 12, 'Pending', '2023-05-03', 1, '2023-05-08 13:00:52', '2023-05-08 13:01:20'),
(14, 15, 18, 'Approved', '2023-05-09', 1, '2023-05-12 05:53:04', '2023-05-12 05:53:04');

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
(1, 1, 'Super-admin', '', 0, 'A new job with title-developer has been added successfully by We2code', 0, '2023-04-27 11:38:22', '2023-04-27 11:38:22'),
(2, 1, 'Super-admin', '', 0, 'A new job with title-developer has been added successfully by We2code', 0, '2023-04-27 12:09:01', '2023-04-27 12:09:01'),
(3, 1, 'Super-admin', '', 0, 'A new company gourav.we2code@gmail.com has been added successfully', 0, '2023-04-28 05:13:42', '2023-04-28 05:13:42'),
(4, 1, 'Super-admin', '', 0, 'A new job with title-Driver has been added successfully by Gourav Agency ', 0, '2023-04-28 07:05:03', '2023-04-28 07:05:03'),
(5, 1, 'Super-admin', '', 0, 'A new company utkarsh.we2code@gmail.com has been added successfully', 0, '2023-04-28 08:51:49', '2023-04-28 08:51:49'),
(6, 1, 'Super-admin', '', 0, 'A new company raj.we2code@gmail.com has been added successfully', 0, '2023-04-28 09:00:47', '2023-04-28 09:00:47'),
(7, 1, 'Super-admin', '', 0, 'A new candidate aashi.we2code@gmail.com has been added successfully', 0, '2023-04-29 06:09:15', '2023-04-29 06:09:15'),
(8, 1, 'Super-admin', '', 0, 'A new job with title-developer has been added successfully by Wipro', 0, '2023-05-01 07:19:45', '2023-05-01 07:19:45'),
(9, 1, 'Super-admin', '', 0, 'A new job with title-php developer has been added successfully by We2code', 0, '2023-05-01 08:36:05', '2023-05-01 08:36:05'),
(10, 1, 'Super-admin', '', 0, 'A new job with title-Sweaper  has been added successfully by Gourav Agency ', 0, '2023-05-01 08:40:06', '2023-05-01 08:40:06'),
(11, 1, 'Super-admin', '', 0, 'A new job with title-Watchmen has been added successfully by Wipro', 0, '2023-05-01 08:44:56', '2023-05-01 08:44:56'),
(12, 1, 'Super-admin', '', 0, 'A new candidate gourav.we2code@gmail.com has been added successfully', 0, '2023-05-03 06:54:02', '2023-05-03 06:54:02'),
(13, 13, 'Super-admin', '', 0, 'A new company shree.we2code@gmail.com has been added successfully', 0, '2023-05-03 09:10:30', '2023-05-03 09:10:30'),
(14, 1, 'Super-admin', '', 0, 'A new company raj.we2codee@gmail.com has been added successfully', 0, '2023-05-03 09:14:04', '2023-05-03 09:14:04'),
(15, 1, 'Super-admin', '', 0, 'A new candidate Babulal@gmail.com has been added successfully', 0, '2023-05-04 04:49:39', '2023-05-04 04:49:39'),
(16, 1, 'Super-admin', '', 0, 'A new candidate rarne@gmail.com has been added successfully', 0, '2023-05-04 05:05:39', '2023-05-04 05:05:39'),
(17, 1, 'Super-admin', '', 0, 'A new candidate rffffe@gmail.com has been added successfully', 0, '2023-05-04 05:07:12', '2023-05-04 05:07:12'),
(18, 1, 'Super-admin', '', 0, 'A new candidate Babulal@gmail.com has been added successfully', 0, '2023-05-04 05:39:46', '2023-05-04 05:39:46'),
(19, 1, 'Super-admin', '', 0, 'A new candidate Babulal@gmail.com has been added successfully', 0, '2023-05-04 05:47:58', '2023-05-04 05:47:58'),
(20, 13, 'Super-admin', '', 0, 'A new candidate Babulal@gmail.com has been added successfully', 0, '2023-05-04 06:04:08', '2023-05-04 06:04:08'),
(21, 13, 'Super-admin', '', 0, 'A new job with title-fgbhvfgh  has been added successfully by decfdgvb ', 0, '2023-05-04 09:07:44', '2023-05-04 09:07:44'),
(22, 1, 'Super-admin', '', 0, 'A new job with title-mjhm has been added successfully by decfdgvb ', 0, '2023-05-04 09:08:51', '2023-05-04 09:08:51'),
(23, 1, 'Super-admin', '', 0, 'A new job with title-fgbhvfgh  has been added successfully by decfdgvb ', 0, '2023-05-04 09:13:03', '2023-05-04 09:13:03'),
(24, 1, 'Super-admin', '', 0, 'A new candidate Managxxxxer@gmail.com has been added successfully', 0, '2023-05-04 09:25:54', '2023-05-04 09:25:54'),
(25, 13, 'Super-admin', '', 0, 'A new candidate Manager00@gmail.com has been added successfully', 0, '2023-05-04 09:26:42', '2023-05-04 09:26:42'),
(26, 1, 'Super-admin', '', 0, 'A new job with title-Driver has been added successfully by Shreeji jwellers', 0, '2023-05-04 09:45:01', '2023-05-04 09:45:01'),
(27, 1, 'Super-admin', '', 0, 'A new job with title-Driver has been added successfully by rtfgsvdrtyevb', 0, '2023-05-04 10:10:49', '2023-05-04 10:10:49'),
(28, 1, 'Super-admin', '', 0, 'A new job with title-asdfs  has been added successfully by Shreeji jwellers', 0, '2023-05-06 08:55:56', '2023-05-06 08:55:56'),
(29, 1, 'Super-admin', '', 0, 'A new job with title-Driver has been added successfully by Delhi public school ', 0, '2023-05-06 09:03:20', '2023-05-06 09:03:20'),
(30, 1, 'Super-admin', '', 0, 'A new job with title-Shreestha soni has been added successfully by Shreeji jwellers', 0, '2023-05-06 09:05:15', '2023-05-06 09:05:15'),
(31, 1, 'Super-admin', '', 0, 'A new job with title-Driver has been added successfully by Delhi public school ', 0, '2023-05-06 09:06:57', '2023-05-06 09:06:57'),
(32, 1, 'Super-admin', '', 0, 'A new job with title-jeweler  has been added successfully by Delhi public school ', 0, '2023-05-06 09:09:07', '2023-05-06 09:09:07'),
(33, 1, 'Super-admin', '', 0, 'A new job with title-Shristha soni has been added successfully by Gourav Agency ', 0, '2023-05-06 09:11:40', '2023-05-06 09:11:40'),
(34, 1, 'Super-admin', '', 0, 'A new job with title-PANDIT has been added successfully by Wipro', 0, '2023-05-06 09:12:43', '2023-05-06 09:12:43'),
(35, 1, 'Super-admin', '', 0, 'A new job with title-gfdf ghdfgdfgdfgdfg ghfghdfhfg has been added successfully by Delhi public schoo', 0, '2023-05-06 09:13:58', '2023-05-06 09:13:58'),
(36, 1, 'Super-admin', '', 0, 'A new job with title-Driver has been added successfully by Gourav Agency ', 0, '2023-05-06 09:14:59', '2023-05-06 09:14:59'),
(37, 1, 'Super-admin', '', 0, 'A new job with title-rajsoni has been added successfully by Shreeji jwellers', 0, '2023-05-06 09:38:27', '2023-05-06 09:38:27'),
(38, 1, 'Super-admin', '', 0, 'A new company gourav.we2code@gmail.com has been added successfully', 0, '2023-05-09 06:37:01', '2023-05-09 06:37:01'),
(39, 1, 'Super-admin', '', 0, 'A new candidate utkarsh.we2code@gmail.com has been added successfully', 0, '2023-05-10 10:45:14', '2023-05-10 10:45:14'),
(40, 1, 'Super-admin', '', 0, 'A new candidate aashi.we2code@gmail.com has been added successfully', 0, '2023-05-10 10:54:16', '2023-05-10 10:54:16'),
(41, 1, 'Super-admin', '', 0, 'hey,  welcome onboard.', 0, '2023-05-10 11:00:15', '2023-05-10 11:00:15'),
(42, 1, 'Super-admin', '', 0, 'hey, utkarsh.we2code@gmail.com welcome onboard.', 0, '2023-05-10 11:02:55', '2023-05-10 11:02:55'),
(43, 29, 'employee', '', 0, 'hey, utkarsh.we2code@gmail.com welcome onboard.', 0, '2023-05-10 11:12:53', '2023-05-10 11:12:53'),
(44, 30, 'employee', '', 0, 'hey, utkarsh.we2code@gmail.com welcome onboard.', 0, '2023-05-10 11:15:53', '2023-05-10 11:15:53'),
(45, 26, 'employer', '', 0, 'A new company aashi.we2code@gmail.com has been added successfully', 0, '2023-05-10 11:20:37', '2023-05-10 11:20:37'),
(46, 27, 'employer', '', 0, 'Hey aashi.we2code@gmail.com welcome onboard explore our pool of talent.', 0, '2023-05-10 11:31:14', '2023-05-10 11:31:14'),
(47, 28, 'employer', '', 0, 'Hey aashi.we2code@gmail.com welcome onboard explore our pool of talent.', 0, '2023-05-10 11:42:58', '2023-05-10 11:42:58'),
(48, 29, 'employer', '', 0, 'Hey aashi.we2code@gmail.com welcome onboard explore our pool of talent.', 0, '2023-05-10 12:06:07', '2023-05-10 12:06:07'),
(49, 11, 'employee', '', 0, 'A user applied on job mjhm you have posted.', 0, '2023-05-10 12:44:02', '2023-05-10 12:44:02'),
(50, 31, 'employee', '', 0, 'hey, sagar.we2code@gmail.com welcome onboard.', 0, '2023-05-11 06:46:23', '2023-05-11 06:46:23'),
(51, 1, 'Super-admin', '', 0, 'A new job with title- has been added successfully by ', 0, '2023-05-11 08:25:56', '2023-05-11 08:25:56'),
(52, 1, 'Super-admin', '', 0, 'A new job with title- has been added successfully by ', 0, '2023-05-11 08:25:57', '2023-05-11 08:25:57'),
(53, 2, 'company', '', 0, 'A new job with title-manager has been added successfully by Gourav Agency ', 0, '2023-05-11 09:13:25', '2023-05-11 09:13:25'),
(54, 2, 'company', '', 0, 'A new job with title-manager has been added successfully by Gourav Agency ', 0, '2023-05-11 09:25:50', '2023-05-11 09:25:50'),
(55, 2, 'company', '', 0, 'A new job with title-manager has been added successfully by Gourav Agency ', 0, '2023-05-11 09:25:50', '2023-05-11 09:25:50'),
(56, 2, 'company', '', 0, 'A new job with title-manager has been added successfully by Gourav Agency ', 0, '2023-05-11 09:27:25', '2023-05-11 09:27:25'),
(57, 1, 'Super-Admin', '', 0, 'A new job with title-manager has been added successfully by Gourav Agency ', 0, '2023-05-11 09:27:25', '2023-05-11 09:27:25'),
(58, 11, 'employee', '', 0, 'A new user applied on job with title - mjhm. you have posted.', 0, '2023-05-11 09:37:23', '2023-05-11 09:37:23'),
(59, 1, 'Super-Admin', '', 0, 'A new user applied on job with title - mjhm posted bydecfdgvb ', 0, '2023-05-11 09:37:23', '2023-05-11 09:37:23'),
(60, 11, 'employee', '', 0, 'A new user applied on job with title - mjhm. you have posted.', 0, '2023-05-11 09:38:09', '2023-05-11 09:38:09'),
(61, 1, 'Super-Admin', '', 0, 'A new user applied on job with title - mjhm posted bydecfdgvb ', 0, '2023-05-11 09:38:09', '2023-05-11 09:38:09'),
(62, 3, 'employee', '', 0, 'A new user applied on job with title - mjhm. you have posted.', 0, '2023-05-11 10:10:28', '2023-05-11 10:10:28'),
(63, 1, 'Super-Admin', '', 0, 'A new user applied on job with title - mjhm posted by Microsoft', 0, '2023-05-11 10:10:28', '2023-05-11 10:10:28'),
(64, 1, 'employee', '', 0, 'hello, Rajyou have interview scheduled on 2023-05-15 for job with title - Driver you have applied sch', 0, '2023-05-11 12:17:37', '2023-05-11 12:17:37'),
(65, 1, 'Super-Admin', '', 0, 'new interview scheduled on 2023-05-15 by Gourav Agency  for candidate name Raj', 0, '2023-05-11 12:17:37', '2023-05-11 12:17:37'),
(66, 1, 'employee', '', 0, 'hello, Raj you have interview scheduled on 2023-05-15 for job with title - Driver you have applied sc', 0, '2023-05-11 12:20:20', '2023-05-11 12:20:20'),
(67, 1, 'Super-Admin', '', 0, 'new interview scheduled on 2023-05-15 of candidate name Raj with Gourav Agency ', 0, '2023-05-11 12:20:20', '2023-05-11 12:20:20'),
(68, 1, 'employee', '', 0, 'hello, Raj you have interview scheduled on 2023-05-15                  for job with title - Driver you have applied on, scheduled with Gourav Agency ', 0, '2023-05-12 05:16:00', '2023-05-12 05:16:00'),
(69, 1, 'Super-Admin', '', 0, 'new interview scheduled on 2023-05-15 of candidate name Raj with Gourav Agency ', 0, '2023-05-12 05:16:00', '2023-05-12 05:16:00'),
(70, 1, 'employee', '', 0, 'hello, Raj you have interview scheduled on 2023-05-15                  for job with title - Driver you have applied on, scheduled with Gourav Agency ', 0, '2023-05-12 05:27:30', '2023-05-12 05:27:30'),
(71, 1, 'Super-Admin', '', 0, 'new interview scheduled on 2023-05-15 of candidate name Raj with Gourav Agency ', 0, '2023-05-12 05:27:30', '2023-05-12 05:27:30'),
(72, 18, 'employee', '', 0, 'hello, Gourav choudary you have interview scheduled on 2023-05-13                  for job with title - Shreestha soni you have applied on, scheduled with Shreeji jwellers', 0, '2023-05-12 05:52:53', '2023-05-12 05:52:53'),
(73, 1, 'Super-Admin', '', 0, 'new interview scheduled on 2023-05-13 of candidate name Gourav choudary with Shreeji jwellers', 0, '2023-05-12 05:52:53', '2023-05-12 05:52:53'),
(74, 1, 'employee', '', 0, 'hello, Raj you have interview scheduled on 2023-05-15                  for job with title - Driver you have applied on, scheduled with Gourav Agency ', 0, '2023-05-12 06:25:18', '2023-05-12 06:25:18'),
(75, 1, 'Super-Admin', '', 0, 'new interview scheduled on 2023-05-15 of candidate name Raj with Gourav Agency ', 0, '2023-05-12 06:25:18', '2023-05-12 06:25:18'),
(76, 1, 'employee', '', 0, 'hello, Raj you have interview scheduled on 2023-05-15                  for job with title - Driver you have applied on, scheduled with Gourav Agency ', 0, '2023-05-12 06:30:29', '2023-05-12 06:30:29'),
(77, 1, 'Super-Admin', '', 0, 'new interview scheduled on 2023-05-15 of candidate name Raj with Gourav Agency ', 0, '2023-05-12 06:30:29', '2023-05-12 06:30:29'),
(78, 1, 'employee', '', 0, 'hello, Raj you have interview scheduled on 2023-05-15                  for job with title - Driver you have applied on, scheduled with Gourav Agency ', 0, '2023-05-12 06:32:06', '2023-05-12 06:32:06'),
(79, 1, 'Super-Admin', '', 0, 'new interview scheduled on 2023-05-15 of candidate name Raj with Gourav Agency ', 0, '2023-05-12 06:32:06', '2023-05-12 06:32:06'),
(80, 1, 'employee', '', 0, 'hello, Raj you have interview scheduled on 2023-05-15                  for job with title - Driver you have applied on, scheduled with Gourav Agency ', 0, '2023-05-12 06:43:59', '2023-05-12 06:43:59'),
(81, 1, 'Super-Admin', '', 0, 'new interview scheduled on 2023-05-15 of candidate name Raj with Gourav Agency ', 0, '2023-05-12 06:43:59', '2023-05-12 06:43:59'),
(82, 1, 'employee', '', 0, 'hello, Raj you have interview scheduled on 2023-05-15                  for job with title - Driver you have applied on, scheduled with Gourav Agency ', 1, '2023-05-12 06:44:30', '2023-05-12 06:44:30'),
(83, 1, 'Super-Admin', '', 0, 'new interview scheduled on 2023-05-15 of candidate name Raj with Gourav Agency ', 0, '2023-05-12 06:44:30', '2023-05-12 06:44:30'),
(84, 12, 'employee', '', 0, 'hello, Babu you have interview scheduled on 2023-05-25 for job with title - Driver you have applied on,          scheduled with Gourav Agency ', 0, '2023-05-15 09:01:46', '2023-05-15 09:01:46'),
(85, 1, 'employee', '', 0, 'hello, UV you have interview scheduled on 2023-05-25 for job with title - Driver you have applied on, scheduled with Gourav Agency ', 0, '2023-05-16 07:26:58', '2023-05-16 07:26:58'),
(86, 1, 'employee', 'interview_scheduled', 3, 'hello, UV you have interview scheduled on 2023-05-25 for job with title - Driver you have applied on, scheduled with Gourav Agency ', 0, '2023-05-16 07:30:41', '2023-05-16 07:30:41');

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
(1, 'utkarsh.we2code@gmail.com', 192384, '2023-05-10 05:46:13'),
(2, 'utkarsh.we2code@gmail.com', 572662, '2023-05-10 05:50:25'),
(3, 'utkarsh.we2code@gmail.com', 326348, '2023-05-10 06:03:59'),
(4, 'utkarsh.we2code@gmail.com', 791292, '2023-05-10 06:08:14'),
(5, 'utkarsh.we2code@gmail.com', 958540, '2023-05-10 06:09:27'),
(6, 'utkarsh.we2code@gmail.com', 474741, '2023-05-10 06:16:10'),
(7, 'utkarsh.we2code@gmail.com', 308911, '2023-05-10 06:16:14'),
(8, 'utkarsh.we2code@gmail.com', 181976, '2023-05-10 06:37:08'),
(9, 'utkarsh.we2code@gmail.com', 102665, '2023-05-10 06:39:57'),
(10, 'utkarsh.we2code@gmail.com', 474812, '2023-05-10 06:40:44'),
(11, 'utkarsh.we2code@gmail.com', 137763, '2023-05-10 06:42:14'),
(12, 'utkarsh.we2code@gmail.com', 342013, '2023-05-10 06:44:18'),
(13, 'utkarsh.we2code@gmail.com', 280938, '2023-05-10 06:46:14'),
(14, 'utkarsh.we2code@gmail.com', 171140, '2023-05-10 07:07:03'),
(15, 'utkarsh.we2code@gmail.com', 459614, '2023-05-10 07:08:41'),
(16, 'aashi.we2code@gmail.com', 927662, '2023-05-10 10:02:50'),
(17, 'aashi.we2code@gmail.com', 360983, '2023-05-10 10:16:29'),
(18, 'aashi.we2code@gmail.com', 346665, '2023-05-10 10:18:50'),
(19, 'aashi.we2code@gmail.com', 798177, '2023-05-10 10:20:37'),
(20, 'aashi.we2code@gmail.com', 913220, '2023-05-10 10:21:04'),
(21, 'aashi.we2code@gmail.com', 605429, '2023-05-10 10:23:16'),
(22, 'aashi.we2code@gmail.com', 339794, '2023-05-10 10:25:06'),
(23, 'utkarsh.we2code@gmail.com', 195807, '2023-05-10 10:25:24'),
(24, 'aashi.we2code@gmail.com', 381482, '2023-05-10 10:26:23'),
(25, 'utkarsh.we2code@gmail.com', 234556, '2023-05-10 10:27:32'),
(26, 'aashi.we2code@gmail.com', 867918, '2023-05-10 10:28:02'),
(27, 'aashi.we2code@gmail.com', 866874, '2023-05-10 10:28:57'),
(28, 'utkarsh.we2code@gmail.com', 426695, '2023-05-10 10:29:36'),
(29, 'aashi.we2code@gmail.com', 101786, '2023-05-10 10:30:00'),
(30, 'aashi.we2code@gmail.com', 257209, '2023-05-10 10:30:32'),
(31, 'utkarsh.we2code@gmail.com', 259544, '2023-05-10 10:30:49'),
(32, 'aashi.we2code@gmail.com', 228287, '2023-05-10 10:31:56'),
(33, 'aashi.we2code@gmail.com', 112830, '2023-05-10 10:33:17'),
(34, 'aashi.we2code@gmail.com', 253378, '2023-05-10 10:34:43'),
(35, 'aashi.we2code@gmail.com', 419947, '2023-05-10 10:35:42'),
(36, 'utkarsh.we2code@gmail.com', 255638, '2023-05-10 10:36:50'),
(37, 'aashi.we2code@gmail.com', 102371, '2023-05-10 10:37:46'),
(38, 'aashi.we2code@gmail.com', 400046, '2023-05-10 10:53:55'),
(39, 'aashi.we2code@gmail.com', 478445, '2023-05-10 11:03:48'),
(40, 'aashi.we2code@gmail.com', 657167, '2023-05-10 11:04:29'),
(41, 'aashi.we2code@gmail.com', 625085, '2023-05-10 11:08:52'),
(42, 'aashi.we2code@gmail.com', 155399, '2023-05-10 11:09:10'),
(43, 'aashi.we2code@gmail.com', 140807, '2023-05-10 11:12:16'),
(44, 'aashi.we2code@gmail.com', 855107, '2023-05-10 11:13:35'),
(45, 'aashi.we2code@gmail.com', 491343, '2023-05-10 11:14:41'),
(46, 'aashi.we2code@gmail.com', 439840, '2023-05-10 11:15:05'),
(47, 'aashi.we2code@gmail.com', 772371, '2023-05-10 11:17:11'),
(48, 'aashi.we2code@gmail.com', 441155, '2023-05-10 11:18:35'),
(49, 'aashi.we2code@gmail.com', 276471, '2023-05-10 11:22:07'),
(50, 'aashi.we2code@gmail.com', 288345, '2023-05-10 11:24:09'),
(51, 'aashi.we2code@gmail.com', 402390, '2023-05-10 11:26:00'),
(52, 'aashi.we2code@gmail.com', 662915, '2023-05-10 11:30:49'),
(53, 'aashi.we2code@gmail.com', 728255, '2023-05-10 11:36:00'),
(54, 'aashi.we2code@gmail.com', 316676, '2023-05-10 11:39:37'),
(55, 'aashi.we2code@gmail.com', 383532, '2023-05-10 11:40:53'),
(56, 'aashi.we2code@gmail.com', 615148, '2023-05-10 11:41:53'),
(57, 'aashi.we2code@gmail.com', 919809, '2023-05-10 12:04:26'),
(58, 'aashi.we2code@gmail.com', 254003, '2023-05-10 12:05:20'),
(59, 'aashi.we2code@gmail.com', 561306, '2023-05-10 12:08:03'),
(60, 'aashi.we2code@gmail.com', 523873, '2023-05-10 12:10:13'),
(61, 'aasdfdfhi.we2code@gmail.com', 501130, '2023-05-10 12:15:02'),
(62, 'aashi.wddse2code@gmail.com', 545247, '2023-05-10 12:17:04'),
(63, 'aashi.wedsfdsf2code@gmail.com', 562733, '2023-05-10 12:17:56'),
(64, 'aashiszx.we2code@gmail.com', 952203, '2023-05-10 12:19:03'),
(65, 'aashi.we2mncode@gmail.com', 618814, '2023-05-10 12:33:19'),
(66, 'aas2code@gmail.com', 877021, '2023-05-10 12:36:22'),
(67, 'aashi.we2code@gmail.com', 815499, '2023-05-10 12:36:56'),
(68, 'aashi.we2cxxode@gmail.com', 695390, '2023-05-10 12:38:49'),
(69, 'aaswe2code@gmail.com', 211447, '2023-05-10 12:41:27'),
(70, 'aa2code@gmail.com', 263012, '2023-05-10 12:42:19'),
(71, 'aascode@gmail.com', 918905, '2023-05-10 12:43:43'),
(72, 'ode@gmail.com', 718768, '2023-05-10 12:44:13'),
(73, 'aa2code@gmail.com', 697013, '2023-05-10 12:44:52'),
(74, 'sagar.we2code@gmail.com', 921834, '2023-05-11 06:46:04'),
(75, 'Rajsagar@we2codegmail.com', 787766, '2023-05-11 06:59:00');

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
,`interview_created_by_admin` int(51)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_employee_profile_percentage`
-- (See below for the actual view)
--
CREATE TABLE `view_employee_profile_percentage` (
`employee_id` int(101)
,`personal` decimal(20,2)
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
,`profile_complete` decimal(23,2)
,`vacancies` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_employer_profile_completion`
-- (See below for the actual view)
--
CREATE TABLE `view_employer_profile_completion` (
`company_id` int(101)
,`profile_complete` decimal(23,2)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_applied_employee`  AS SELECT `aoj`.`apply_id` AS `apply_id`, `aoj`.`job_id` AS `job_id`, `aoj`.`employee_id` AS `employee_id`, `aoj`.`is_viewed` AS `is_viewed`, `aoj`.`created_at` AS `created_at`, `aoj`.`updated_at` AS `updated_at`, `vjp`.`job_title` AS `job_title`, `vjp`.`company_id` AS `company_id`, `vjp`.`company_name` AS `company_name`, `ev`.`name` AS `name`, `ev`.`email` AS `email`, `ev`.`contact_no` AS `contact_no`, `ev`.`description` AS `description`, `ev`.`date_of_birth` AS `date_of_birth`, `ev`.`gender` AS `gender`, `ev`.`marital_status` AS `marital_status`, `ev`.`nationality` AS `nationality`, `ev`.`current_location` AS `current_location`, `ev`.`currently_located_country` AS `currently_located_country`, `ev`.`language` AS `language`, `ev`.`religion` AS `religion`, `ev`.`interested_in` AS `interested_in`, `ev`.`experience` AS `experience`, `ev`.`work_permit_canada` AS `work_permit_canada`, `ev`.`work_permit_other_country` AS `work_permit_other_country`, `ev`.`resume` AS `resume`, `ev`.`profile_photo` AS `profile_photo`, `ev`.`created_by_admin` AS `created_by_admin`, `ev`.`is_deleted` AS `is_deleted`, `ev`.`education` AS `education`, `ev`.`specialization` AS `specialization`, `ev`.`skill` AS `skill`, `lmia`.`id` AS `id`, `lmia`.`lmia_status` AS `lmia_status`, `lmia`.`expected_time_of_completion` AS `expected_time_of_completion`, `ji`.`interview_date` AS `interview_date`, `ji`.`is_active` AS `is_active`, `ji`.`status` AS `status`, `ji`.`created_by_admin` AS `interview_created_by_admin` FROM ((((`apply_on_job` `aoj` join `employee_view` `ev` on((`aoj`.`employee_id` = `ev`.`employee_id`))) join `view_job_posted` `vjp` on((`vjp`.`job_id` = `aoj`.`job_id`))) left join `lmia` on(((`lmia`.`employee_id` = `aoj`.`employee_id`) and (`lmia`.`job_id` = `aoj`.`job_id`)))) left join `job_interviews` `ji` on(((`ji`.`employee_id` = `aoj`.`employee_id`) and (`ji`.`job_id` = `aoj`.`job_id`) and (`ji`.`is_reschedule` <> 1)))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_employee_profile_percentage`
--
DROP TABLE IF EXISTS `view_employee_profile_percentage`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_employee_profile_percentage`  AS SELECT DISTINCT `e`.`employee_id` AS `employee_id`, if((`e`.`experience` = 'fresher'),round((((((((((((((((((if((`e`.`name` <> ''),2.5,0) + if((`e`.`email` <> ''),2.5,0)) + if((`e`.`contact_no` <> ''),2.5,0)) + if((`e`.`date_of_birth` <> ''),2.5,0)) + if((`e`.`gender` <> ''),2.5,0)) + if((`e`.`marital_status` <> ''),2.5,0)) + if((`e`.`nationality` <> ''),2.5,0)) + if((`e`.`current_location` <> ''),2.5,0)) + if((`e`.`currently_located_country` <> ''),2.5,0)) + if((`e`.`language` <> ''),2.5,0)) + if((`e`.`religion` <> ''),2.5,0)) + if((`e`.`interested_in` <> ''),2.5,0)) + if((`e`.`experience` <> ''),2.5,0)) + if((`e`.`work_permit_canada` <> ''),2.5,0)) + if((`e`.`work_permit_other_country` <> ''),2.5,0)) + if((`e`.`description` <> ''),2.5,0)) + if((`e`.`profile_photo` <> ''),10,0)) + if((`e`.`resume` <> ''),20,0)),2),round((((((((((((((((((if((`e`.`name` <> ''),1.25,0) + if((`e`.`email` <> ''),1.25,0)) + if((`e`.`contact_no` <> ''),1.25,0)) + if((`e`.`date_of_birth` <> ''),1.25,0)) + if((`e`.`gender` <> ''),1.25,0)) + if((`e`.`marital_status` <> ''),1.25,0)) + if((`e`.`nationality` <> ''),1.25,0)) + if((`e`.`current_location` <> ''),1.25,0)) + if((`e`.`currently_located_country` <> ''),1.25,0)) + if((`e`.`language` <> ''),1.25,0)) + if((`e`.`religion` <> ''),1.25,0)) + if((`e`.`interested_in` <> ''),1.25,0)) + if((`e`.`experience` <> ''),1.25,0)) + if((`e`.`work_permit_canada` <> ''),1.25,0)) + if((`e`.`work_permit_other_country` <> ''),1.25,0)) + if((`e`.`description` <> ''),1.25,0)) + if((`e`.`profile_photo` <> ''),10,0)) + if((`e`.`resume` <> ''),20,0)),2)) AS `personal`, round((case when ((select `employee_education`.`employee_id` from `employee_education` where (`employee_education`.`employee_id` = `e`.`employee_id`) limit 1) > 0) then 20 else 0 end),2) AS `education`, round((case when ((select `employee_career`.`employee_id` from `employee_career` where (`employee_career`.`employee_id` = `e`.`employee_id`) limit 1) > 0) then 20 else 0 end),2) AS `Career`, round((case when ((select `employee_skill`.`employee_id` from `employee_skill` where (`employee_skill`.`employee_id` = `e`.`employee_id`) limit 1) > 0) then 10 else 0 end),2) AS `skill`, `e`.`created_at` AS `created_at`, `e`.`created_by_admin` AS `created_by_admin`, `e`.`is_deleted` AS `is_deleted` FROM `employee` AS `e` ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_employer_profile_completion`  AS SELECT DISTINCT `e`.`company_id` AS `company_id`, round(((((((((((((((((((((if((`e`.`company_name` <> ''),2.14,0) + if((`e`.`industry` <> ''),2.14,0)) + if((`e`.`corporation` <> ''),2.14,0)) + if((`e`.`company_start_date` <> ''),2.14,0)) + if((`e`.`company_size` <> ''),2.14,0)) + if((`e`.`website_url` <> ''),2.14,0)) + if((`e`.`vacancy_for_post` <> ''),2.14,0)) + if((`e`.`about` <> ''),2.14,0)) + if((`e`.`contact_no_other` <> ''),2.14,0)) + if((`e`.`address` <> ''),2.14,0)) + if((`e`.`pin_code` <> ''),2.14,0)) + if((`e`.`city` <> ''),2.14,0)) + if((`e`.`state` <> ''),2.14,0)) + if((`e`.`country` <> ''),2.14,0)) + if((`e`.`contact_person_name` <> ''),5,0)) + if((`e`.`email` <> ''),5,0)) + if((`e`.`contact_no` <> ''),5,0)) + if((`e`.`designation` <> ''),5,0)) + if((`e`.`logo` <> ''),10,0)) + if((`ck`.`pan_no` <> ''),20,0)) + if((`ck`.`document` <> ''),20,0)),2) AS `profile_complete` FROM (`employer` `e` left join `company_kyc` `ck` on((`e`.`company_id` = `ck`.`company_id`))) ;

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
  MODIFY `admin_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `apply_on_job`
--
ALTER TABLE `apply_on_job`
  MODIFY `apply_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `employee_career`
--
ALTER TABLE `employee_career`
  MODIFY `career_id` int(251) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_education`
--
ALTER TABLE `employee_education`
  MODIFY `education_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee_setting`
--
ALTER TABLE `employee_setting`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_skill`
--
ALTER TABLE `employee_skill`
  MODIFY `skill_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `company_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `employer_setting`
--
ALTER TABLE `employer_setting`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `job_category`
--
ALTER TABLE `job_category`
  MODIFY `job_category_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `job_interviews`
--
ALTER TABLE `job_interviews`
  MODIFY `id` int(51) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `list`
--
ALTER TABLE `list`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lmia`
--
ALTER TABLE `lmia`
  MODIFY `id` int(51) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
