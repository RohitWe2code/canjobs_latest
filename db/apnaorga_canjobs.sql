-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 25, 2023 at 10:37 AM
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`, `name`, `contact_no`, `admin_type`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'virat.we2code@gmail.com', '5156798cabc8a6f2563192d1a40495d4', 'virat', NULL, 'super-admin', 1, 0, '2023-04-01 09:54:18', '2023-04-01 09:54:18'),
(2, 'mayur.we2code@gmail.com', '0af5c9de59e048c54feb9a06c93d7d6e', 'Jack', NULL, 'sub-admin', 1, 0, '2023-04-01 09:54:35', '2023-04-01 09:54:35'),
(3, 'jhon.we2code@gmail.com', '4f1058b235cc3827fb8888a5d1aab930', 'Jhon', NULL, 'manager', 1, 0, '2023-04-01 09:55:35', '2023-04-04 11:43:18'),
(7, 'jyotish.we2code@gmail.com', '3c125bbfb7336d1b48aab3478f786e04', 'don', NULL, 'manager', 1, 0, '2023-04-06 11:43:48', '2023-04-07 11:41:27'),
(9, 'myur.we2code@gmail.com', '4f1058b235cc3827fb8888a5d1aab930', 'ww', NULL, 'manager', 1, 1, '2023-04-08 06:52:06', '2023-04-08 06:52:06'),
(10, 'aashi.we2code@gmail.com', 'f523370044c04615aea88f46e44978cf', 'Aashi', NULL, 'super-admin', 1, 0, '2023-04-11 11:31:20', '2023-04-22 05:35:36'),
(12, 'ram.we2code@gmail.com', '3db66ceb605c1bcb779c63e180c4f2d0', 'Rama', NULL, 'admin', 1, 0, '2023-04-11 12:24:04', '2023-04-24 13:07:29'),
(16, 'shivani.we2code@gmail.com', 'd54eb6798656cb9723cdfa2a5f882960', 'shivani', NULL, 'admin', 1, 1, '2023-04-12 13:01:49', '2023-04-22 10:15:03'),
(23, 'rajul@gmail.com', '0e04a9c1149c5c665e63b6f335b99129', 'Rajul', NULL, 'admin', 1, 1, '2023-04-15 05:37:42', '2023-04-15 05:37:57'),
(24, 'customer@fashion.com', '18fcdde322e9b6fdde227dde7930570c', 'jyotish', NULL, 'super-admin', 1, 1, '2023-04-20 10:06:43', '2023-04-20 10:09:35'),
(25, 'aashish.we2code@gmail.com', 'd318b513924075fa03dfcda86928b79e', 'Sakshi', NULL, 'manager', 1, 1, '2023-04-22 11:30:49', '2023-04-22 11:31:26'),
(26, 'Shekar.we2code@gmail.com', 'ad01db0762274016495050a704cf879a', 'Shekar', NULL, 'admin', 1, 1, '2023-04-24 06:32:10', '2023-04-24 06:32:10');

-- --------------------------------------------------------

--
-- Table structure for table `apply_on_job`
--

CREATE TABLE `apply_on_job` (
  `apply_id` int(101) NOT NULL,
  `job_id` int(101) NOT NULL,
  `employee_id` int(101) NOT NULL,
  `is_viewed` int(101) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apply_on_job`
--

INSERT INTO `apply_on_job` (`apply_id`, `job_id`, `employee_id`, `is_viewed`, `created_at`, `updated_at`) VALUES
(1, 0, 2, 1, '2023-04-05 12:24:58', '2023-04-20 10:50:23'),
(2, 11, 1, 0, '2023-04-05 12:53:24', '2023-04-20 11:25:05'),
(3, 0, 2, 0, '2023-04-06 08:29:37', '2023-04-22 07:07:20'),
(4, 13, 4, 1, '2023-04-19 05:07:53', '2023-04-19 12:41:07'),
(5, 2, 7, 0, '2023-04-19 10:45:08', '2023-04-24 06:25:57'),
(6, 14, 1, 0, '2023-04-19 11:17:36', '2023-04-20 06:05:08'),
(7, 11, 4, 0, '2023-04-20 06:05:21', '2023-04-20 11:26:17'),
(8, 2, 5, 0, '2023-04-20 06:11:36', '2023-04-22 07:07:09'),
(9, 14, 6, 0, '2023-04-20 06:12:29', '2023-04-20 06:12:51'),
(10, 13, 7, 0, '2023-04-20 06:13:00', '2023-04-24 09:53:35'),
(11, 0, 8, 0, '2023-04-20 06:15:07', '2023-04-20 11:00:16'),
(12, 0, 9, 0, '2023-04-20 06:15:48', '2023-04-20 11:05:56'),
(13, 14, 10, 0, '2023-04-20 06:16:26', '2023-04-20 06:16:39'),
(14, 14, 11, 0, '2023-04-20 06:18:28', '2023-04-20 11:12:00');

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
(1, 1, 'ADTRP4521L', 'Niranter', '1989-02-16', 'PU4 45 Universal Tower 2nd Floor Indore Madhya Pradesh ', 789654, 'indore', 'mp', 'india', '29GGGGG1314R9Z6', '+524-582-4100', 'AAAA99009A', NULL, '2023-04-05 12:03:51', '2023-04-11 10:08:43'),
(2, 2, 'LKJHG2236P', 'Ram', '2023-04-06', 'Ram nagar', 450001, 'Khandwa', 'mp', 'india', '29GGGGG1314R9Z6', '555-852-6985', 'GBHI78654P', 'https://apnaorganicstore.in/canjobs/uploads/1681203987.pdf', '2023-04-06 11:12:45', '2023-04-11 09:06:27'),
(4, 5, 'ASDFS0987Y', 'Gopal desai', '1985-02-07', 'Rajwada', 852147, 'Indore', 'Madhya Pradesh', 'India', '29GGGGG1314R9Z6', '123-456-7890', 'PDES03028F', NULL, '2023-04-12 04:23:17', '2023-04-13 06:43:37'),
(5, 7, 'LKJHG2236P', 'Aashi', '2023-04-03', 'Ram nagar', 456321, 'indore', 'mp', 'india', NULL, NULL, NULL, NULL, '2023-04-13 07:11:59', '2023-04-13 07:11:59'),
(6, 9, 'LKJHG2236P', 'Ram', '2023-03-30', '555442', 222555, 'indore', 'goa', 'USA', NULL, NULL, NULL, NULL, '2023-04-13 09:56:24', '2023-04-13 09:56:24'),
(7, 12, 'LKJHG2236P', 'Ram', '2000-01-01', '44begum pet ', 525825, 'indore', 'mp', 'india', '29GGGGG1314R9Z6', NULL, NULL, NULL, '2023-04-14 12:52:48', '2023-04-14 12:52:48'),
(8, 20, 'LKJHG2236P', 'Ram', '2019-02-07', 'Ram nagar', 222222, 'indore', 'mp', 'india', NULL, NULL, NULL, NULL, '2023-04-15 05:54:25', '2023-04-15 05:54:25'),
(9, 33, 'BAJPC4350M', 'jatin tiwari', '2023-04-20', 'indore', 452020, 'indore', 'india', 'India', NULL, NULL, NULL, NULL, '2023-04-20 06:04:28', '2023-04-20 06:04:28'),
(10, 31, 'BAJPC4350M', 'jatin tiwari', '2023-04-20', 'indore', 452020, 'indore', 'india', 'India', NULL, NULL, NULL, NULL, '2023-04-20 06:22:41', '2023-04-20 06:22:41'),
(11, 34, 'LKJHG2236S', 'Ram', '2023-03-29', 'Ram nagar', 456321, 'indore', 'mp', 'india', '07AAGFF2194N1Z1', NULL, NULL, NULL, '2023-04-21 10:24:56', '2023-04-22 09:07:25'),
(12, 35, 'LKJHG2236P', 'FF', '2023-04-21', 'Ram nagar', 159951, 'indore', 'mp', 'india', NULL, NULL, NULL, NULL, '2023-04-24 07:00:12', '2023-04-24 07:00:12');

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
  `posted` varchar(251) NOT NULL,
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

INSERT INTO `employee` (`employee_id`, `name`, `email`, `password`, `contact_no`, `description`, `date_of_birth`, `gender`, `marital_status`, `nationality`, `current_location`, `currently_located_country`, `language`, `religion`, `interested_in`, `experience`, `work_permit_canada`, `work_permit_other_country`, `posted`, `posted_company_id`, `date_of_posting`, `designation``, `resume`, `profile_photo`, `created_at`, `created_by_admin`, `updated_at`, `is_deleted`, `token`) VALUES
(1, 'shivam', 'shivam.canjobs@gmail.com', '', 8699357000, 'dfvgdxfzc', '2001-03-29', 'male', 'married', 'indian', 'india', 'india', 'hindi english,', 'hindu', 'swap', '1-3', 'no', 'no', '', 0, '0000-00-00', '', NULL, NULL, '2023-04-05 11:48:20', 10, '2023-04-06 09:31:20', 0, ''),
(2, 'UV', 'utkarsh.we2code@gmail.com', '6d15ce9fd7a85016907876466c36f353', 9876543201, 'dfcdxfgvdfxvdxv', '2014-02-06', 'male', 'married', 'indian', 'indore', 'india', 'hindi', 'hindu', 'swap', '3-5', 'yes', 'Yes', '', 0, '0000-00-00', '', NULL, NULL, '2023-04-05 11:56:03', 16, '2023-04-14 12:58:57', 0, '716435ac874e7229afdd9007f7b744e2'),
(3, 'shivani', 'shivanik.we2code@gmail.com', '', 7470920540, 'fgsgasfg', '2023-04-06', 'male', 'single', 'sagfasdf', 'sadfsd', 'India', 'asdfasd', 'asdf', 'swap', '1-3', 'no', 'sadfsd', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1680782989.pdf', NULL, '2023-04-06 10:03:13', 10, '2023-04-11 10:16:06', 0, '00152015ec917ccd79197f0d64c2c49c'),
(4, 'testing', 'jyotish.we2code@gmail.m', '', 7470925044, 'gfhjukl', '2023-04-06', 'other', 'single', 'asdfads', 'asdfasf', 'fdasad', 'English', 'asfdfasf', 'swap', '1-3', 'yes', 'India', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1682069614.pdf', NULL, '2023-04-06 10:05:24', 10, '2023-04-21 09:33:34', 0, ''),
(5, 'Aashu', 'mayur.we2code@gmail.com', '', 8521449630, 'Good boy', '2002-02-02', 'male', 'married', 'indian', 'indore', 'india', 'English', 'marathi', 'all', '1-3', 'no', 'no', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1680842524.pdf', NULL, '2023-04-06 12:16:01', 0, '2023-04-07 04:42:04', 0, ''),
(6, 'Employee', 'abc@b.com', 'cccf82fe07cfb1c5ef48bd3973633b75', 7410258963, 'cdxcfzjhnsudyurejhfdjnvfvg', '2023-03-30', 'female', 'single', 'indian', 'india', 'india', 'English', 'asdf', 'swap', '0-1', 'no', 'Yes', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1681187603.pdf', NULL, '2023-04-07 04:57:54', 0, '2023-04-11 04:33:23', 1, ''),
(7, 'jhon', 'abcs@b.com', '', 9998885552, 'akljsd klqjhndf lsda joidjv oidjasckjkodas poijdsj asdjvcolikjdocv adsrfgv', '1990-12-12', 'male', 'married', 'American', 'ibiza', 'span', 'english', 'hindu', 'development', '5+ yrs', 'Yes', 'Yes', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1681898757.pdf', NULL, '2023-04-07 05:11:00', 16, '2023-04-19 10:05:57', 0, ''),
(8, 'dwayne rock', 'rock@gmail.com', '', 9165100000, 'Today is a beautiful day.', '1995-01-01', 'male', 'unmarried', 'American', 'bankok', 'thailand', 'English', 'christian', 'hr', '0-1', 'Yes', 'Yes', 'Yes', 1, '2022-05-07', '', 'https://apnaorganicstore.in/canjobs/uploads/1681289312.pdf', NULL, '2023-04-08 10:46:27', 0, '2023-04-12 08:48:32', 0, ''),
(9, 'Ganesh ji', 'fdvf@gmail.om', '', 1010101005, 'dscdscx', '2000-04-02', 'female', 'married', 'insian', 'india', 'span', 'French', 'hindu', 'swap', '1-3', 'no', 'Yes', 'Yes', 5, '2023-04-12', '', 'https://apnaorganicstore.in/canjobs/uploads/1681290031.pdf', NULL, '2023-04-11 04:39:24', 10, '2023-04-12 09:00:31', 0, ''),
(11, 'moh', 'mohini@gmail.com', '', 85202556545133, 'Required a hopility job', '1995-02-24', 'female', 'married', 'Indian', 'Indore', 'India', 'English', 'Hindu', 'swap', '0-1', 'no', 'no', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1681290204.pdf', NULL, '2023-04-12 04:44:30', 0, '2023-04-12 09:03:24', 1, ''),
(13, NULL, 'hr@we2code.com', '5a675c782fb5afb8d8e90035e236fe25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '0000-00-00', '', NULL, NULL, '2023-04-12 06:28:32', 0, '2023-04-12 06:28:32', 1, ''),
(14, NULL, 'aashi.we2code@gmail.com', '47b6fb0b99ab1fce1d5459c9e82e2efc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', 4, '2023-04-30', '', NULL, NULL, '2023-04-12 06:50:22', 0, '2023-04-12 09:01:56', 1, ''),
(15, NULL, 'kane@gmail.com', '73d341f10897b327379a906c8aca7a0f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '0000-00-00', '', NULL, NULL, '2023-04-12 06:51:46', 0, '2023-04-12 06:51:46', 1, ''),
(16, 'ghftyuijkl', 'jason@gmail.com', 'aec25e64f5a233007bb732979e603467', 1747092054, 'describtion', '2019-02-06', 'female', 'single', 'indian', 'indore', 'India', 'English', 'hindu', 'parttime', '0-1', 'no', 'India', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1681296805.pdf', NULL, '2023-04-12 09:23:12', 0, '2023-04-12 10:53:25', 1, ''),
(17, 'Rajaram Patidar', 'jyotish.we2code@gmail.com', '', 7470920481, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2023-04-12', 'female', 'married', 'Indian', 'Indore', 'India', 'Hindi', 'Hindu', 'parttime', '1-3', 'no', 'India', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1681967103.pdf', NULL, '2023-04-12 10:57:31', 0, '2023-04-20 05:05:03', 0, ''),
(18, 'fgbdf', 'dhruti@gmail.com', '', 8520147963, 'bdfgvdg', '2023-03-30', 'female', 'single', 'indian', 'india', 'india', 'Hindi', 'marathi', 'swap', '0-1', 'yes', 'sadfsd', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1681297615.pdf', NULL, '2023-04-12 11:04:13', 0, '2023-04-12 11:06:55', 1, ''),
(24, 'virat', 'roger@gmail.com', '018e1818f30ebeff399883e2ed930981', 8520147963, 'dsfdzvfdxfvg', '2023-04-07', 'female', 'single', 'American', 'india', 'span', 'Hindi', 'asdf', 'swap', '0-1', 'no', 'India', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1681389847.pdf', NULL, '2023-04-12 13:00:07', 0, '2023-04-13 12:44:07', 0, ''),
(25, 'ddsfdvg', 'fgfgvf@gmail.com', '', 8520147896, 'sdczgfvdxg', '2023-03-29', 'male', 'single', 'asdfads', 'ddsda', 'canada', 'English', 'asdf', 'swap', '0-1', 'no', 'Yes', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1681361343.pdf', NULL, '2023-04-13 04:48:39', 0, '2023-04-13 04:49:03', 1, ''),
(26, NULL, 'pantagon@gmail.com', '744c8c20120d2e784d3764630389abfd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '0000-00-00', '', NULL, NULL, '2023-04-14 04:47:17', 0, '2023-04-14 04:47:17', 1, ''),
(27, 'Raj', 'ranjitsingh@gmail.com', '62371239a535ebc274788f1e6590f507', 1234456789, 'New Live test', '2023-03-30', 'male', 'single', 'indian', 'hawai', 'span', 'Hindi', 'hindu', 'swap', '0-1', 'no', 'Yes', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1681494197.pdf', NULL, '2023-04-14 05:12:11', 0, '2023-04-14 17:43:17', 0, ''),
(28, 'jatin tiwari', 'jyotish.we2code@gmail.com', '', 7470920481, 'sdfghj@#$%1556', '2023-04-20', 'male', 'single', 'Indian', 'Indore', 'India', 'Hindi', 'Hindu', 'swap', '1-3', 'no', 'India', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1681983225.pdf', NULL, '2023-04-20 08:51:28', 0, '2023-04-20 09:33:45', 1, ''),
(29, 'Aashi vyas', 'aashi.we2code@gmail.com', '', 6266987373, 'A frontend developer with thr technical skills of HTML, CSS ,BOOTSTRAP, JAVASCRIPT and REACT JS', '2001-10-07', 'female', 'single', 'indian', 'indore', 'India', 'English', 'hindu', 'parttime', '0-1', 'no', 'no', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1682148591.pdf', NULL, '2023-04-20 10:11:47', 0, '2023-04-22 07:29:51', 0, ''),
(30, 'Ram', 'ram@gmail.com', '', 9685741033, 'gdtrhrftgdsyregthjygkyhujm rdtjhfghb thfgb ', '0001-03-29', 'male', 'single', 'American', 'ayodha', 'india', 'Other', 'hindu', 'all', '5+', 'yes', 'Yes', '', 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1682068025.pdf', NULL, '2023-04-21 09:07:05', 0, '2023-04-21 09:07:05', 1, '');

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
(2, 5, 'tcs', 'senior developer', 'mumbai', 'IT', 'Product Design', 'hard', '2010-08-07', '2021-12-31', NULL, '2023-04-08 04:42:15', '2023-04-08 04:49:16'),
(6, 7, 'Base', 'Office Boy', 'indore', 'call', 'fresh graduate', 'fresh graduate', '2013-04-06', '2023-05-07', NULL, '2023-04-08 04:47:58', '2023-04-08 04:47:58'),
(11, 9, 'sysko', 'auditor', 'indore', 'accounting', 'intern', 'entry level', '2022-12-06', '2023-11-15', NULL, '2023-04-11 05:49:44', '2023-04-11 05:49:44'),
(13, 11, 'appy', 'junior manager', 'indore', 'accounting', 'fresh graduate', 'fresh graduate', '2022-06-09', '2023-08-26', NULL, '2023-04-12 04:46:47', '2023-04-12 04:46:47'),
(14, 13, 'rtfgyuhij', 'ftgyhujiko', 'drtfgyuhji', 'accounting', 'fresh graduate', 'intern', '2023-04-07', '2023-04-07', NULL, '2023-04-12 06:44:20', '2023-04-12 06:44:20'),
(15, 17, 'Zooka', 'Accountant', 'Indore', 'accounting', 'fresh graduate', 'fresh graduate', '2023-03-27', '2023-05-07', NULL, '2023-04-13 04:55:56', '2023-04-14 12:45:43'),
(16, 24, 'Zooka', 'CEO', 'indore', 'accounting', 'intern', 'intern', '2023-03-27', '2023-05-07', NULL, '2023-04-13 12:44:38', '2023-04-13 12:44:38'),
(17, 17, 'DLF', 'Accountant', 'Indore', 'accounting', 'fresh graduate', 'fresh graduate', '2023-04-01', '2023-04-13', 1, '2023-04-14 12:46:13', '2023-04-14 12:46:13'),
(18, 8, 'Zooka', 'CEO', 'ffc', 'bank', 'fresh graduate', 'intern', '2023-03-27', '2023-05-07', NULL, '2023-04-20 10:07:56', '2023-04-20 10:07:56');

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
(2, 2, 'Post graduate', 'rgpv', 'MA', 'Maths', 'India', 2027, '2023-04-05 11:56:48', '2023-04-05 11:56:48'),
(4, 3, 'PHD', 'sfgsdgf', 'B.com', 'Bio', 'USA', 20014, '2023-04-06 10:19:17', '2023-04-06 10:19:17'),
(8, 5, 'PHD', 'rgpv', 'CPCT', 'Bio', 'USA', 2022, '2023-04-07 04:40:14', '2023-04-07 04:40:14'),
(9, 2, 'graduate', 'columbia', 'ms', 'science', 'usa', 2018, '2023-04-07 06:01:28', '2023-04-07 06:01:28'),
(12, 7, 'Graduate', 'davv', 'B.com', 'Social Studies', 'USA', 2010, '2023-04-07 10:11:05', '2023-04-19 12:47:58'),
(14, 5, 'Graduate', 'davv', 'CA', 'Bio', 'UK', 1, '2023-04-07 10:14:46', '2023-04-07 10:14:46'),
(15, 7, 'PHD', 'davv', 'M.com', 'Bio', 'Canada', 2022, '2023-04-07 12:46:51', '2023-04-07 12:46:51'),
(23, 9, 'Graduate', 'rgpv', 'B.com', 'Bio', 'USA', 1, '2023-04-11 05:28:33', '2023-04-11 05:28:33'),
(25, 8, 'Graduate', 'davv', 'B.com', 'core', 'India', 2022, '2023-04-11 05:54:45', '2023-04-11 05:54:45'),
(28, 11, 'Post graduate', 'sfgsdgf', 'B.tech', 'Maths', 'Russia', 1, '2023-04-12 05:44:52', '2023-04-12 05:44:52'),
(30, 7, '12th Pass', 'rgpv', 'M.com', 'phy', 'India', 2002, '2023-04-12 10:10:15', '2023-04-12 10:12:03'),
(32, 17, 'Post graduate', 'DAVV', 'Post Metric', 'Bio', 'India', 2017, '2023-04-12 11:26:32', '2023-04-19 12:24:54'),
(33, 25, '12th Pass', 'kv', 'CPCT', 'Social studies', 'India', 2019, '2023-04-13 04:49:35', '2023-04-13 04:49:53'),
(35, 24, 'Graduate', 'rgpv', 'BA', 'Social studies', 'USA', 2011, '2023-04-14 04:51:42', '2023-04-14 04:51:42'),
(36, 17, 'Graduate', 'RGPV', 'Graduate', 'Social Studies', 'India', 2015, '2023-04-19 12:24:36', '2023-04-19 12:24:36'),
(38, 30, 'PHD', 'rgpv', 'Other', 'Other', 'India', 1, '2023-04-21 09:10:24', '2023-04-21 09:10:24'),
(39, 29, 'Graduate', 'davv', 'Metric', 'Maths', 'Canada', 2018, '2023-04-22 07:13:41', '2023-04-22 07:13:41');

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
(1, 1, 'Good communication'),
(2, 2, 'criket'),
(3, 4, 'd'),
(4, 3, 'fzfgsd'),
(5, 4, 'html'),
(6, 3, 'html'),
(7, 7, 'Reacy Native'),
(8, 7, 'Java'),
(9, 2, 'a'),
(10, 6, 'd'),
(12, 7, 'Next js'),
(13, 7, 'Reacy Native'),
(14, 7, 'Good communication'),
(16, 9, 'Reacy Native'),
(17, 9, 'java script'),
(18, 9, 'java script'),
(21, 13, 'fghujkl'),
(23, 25, 'Cpct'),
(25, 17, 'PHP'),
(26, 17, 'Java script'),
(27, 5, 'PHP'),
(28, 5, 'REACT'),
(29, 17, 'REACT'),
(30, 17, 'JAVA'),
(31, 17, 'CodeIgniter'),
(32, 17, 'Html'),
(33, 27, 'Reacy Native'),
(39, 28, 'java'),
(40, 8, 'PHP'),
(41, 8, 'Reacy Native'),
(42, 8, 'Good communication'),
(44, 17, 'React js'),
(46, 17, 'Css'),
(47, 30, 'archrey'),
(48, 29, 'PHP');

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
,`posted` varchar(251)
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
(1, 'We2code', 'IT', ' Director of employee experience', 'W2c', '2018-01-14', '20', 'we2code.com', 'business executive', 'We2Code is an imerging web design and development company of India. We have wide range of technical skill to provide better services to our clients.@We2Code, core strength lies in our super energetic and gigantic team, forming an excellent blend of IT minds along with a creative bent. Our endeavor is to continuously improve and deliver maximum – enriching products & solutions. That’s what we mean – We code your dreams.\nOur Web development solutions are most comprehensive and impactful as it include all web based services from establishing conceptual framework, drawing inferential backdrop, web interfaces, programmed system architecture, web services, and system support to database management. Our extremely prolific web development solutions also include content management, custom web development, E commerce website development, payment gateway integration, 3rd party API integration, Web Portal development and Ecommerce shopping cart. We develop websites and web apps to suit your business growth and to get you best leads.', 'Niranter sing pandya', 'niranter.we2code@gmail.com', NULL, 9632587410, NULL, 'PU4  45 Universal Tower 2nd Floor  Indore Madhya Pradesh 4', 789654, 'indore', 'mp', 'india', 'CEO', NULL, 0, '2023-04-05 12:01:38', '2023-04-11 09:48:51', 16, 0, '', ''),
(2, 'Techlog', 'IT', 'G2C', 'info', '2023-04-06', '5', 'infosys.com', 'Tele caller', 'Our organisation is to serve you', 'utk', 'utkarsh.we2code@gmail.com', '4fddc644e3fe073e6e6a6f80f2da4124', 7410255555, NULL, 'd', 8, 'indore', 'mp', 'india', NULL, NULL, 0, '2023-04-06 05:01:51', '2023-04-18 10:00:31', 16, 0, 'vijay nagar', '716435ac874e7229afdd9007f7b744e2'),
(3, 'Punjab national bank', 'Bank', ' Human resource assistant', 'PNB', '1978-02-08', '500000', 'pnb.com', 'recovery boy', 'Urgent recovery boy needed', 'd', 'd@gmail.xcom', NULL, 2145879632, NULL, 'rajwada', 33, 'panji', 'goa', 'India', NULL, NULL, 0, '2023-04-07 07:04:56', '2023-04-11 06:28:39', 10, 0, '', ''),
(4, 'szzz', 'szzz', 'B2G', 'sx', '2023-04-02', 'szz', 'szz.com', 'szzz', 'szz', 'dx', 'mayusdasdxr.we2code@gmail.com', NULL, 8741256390, NULL, 'dxfvgfcv', 147852, 'indore', 'california', 'earth', 'vc', NULL, 0, '2023-04-11 09:14:42', '2023-04-13 07:00:14', 0, 0, '', ''),
(5, 'Apollo', 'Hospital', 'C2C', 'ollo', '2001-01-01', '10000', 'apollo.com', 'nurse', 'Registered nurses are required to have at least an associates degree which typically takes less time and costs less than other educational options However RNs who earn a bachelors or advanced degree have a higher earning potential and an advantage when applying for jobs', 'Gopal desai', 'Gopal2@gmail.com', NULL, 9517538426, NULL, 'Sector D Scheme No 74C Vijay Nagar Indore  Madhya Pradesh', 456987, 'Indore', 'Madhya Pradesh', 'India', 'Management', NULL, 0, '2023-04-12 04:18:40', '2023-04-13 07:00:11', 0, 1, '', ''),
(6, 'redtfgyhujk', 'Ikj', 'Chief accounting officer (CAO)', 'ghjkl', '2023-04-12', '50', 'wipr.com', 'rtyui', 'erdtfgyhujkl', 'Rakesh', 'aasdfgdfbgvi.we2code@gmail.com', NULL, 7539518246, NULL, 'Ram nagar', 741025, 'hyderabad', 'california', 'USA', 'dfvd', NULL, 0, '2023-04-12 07:00:04', '2023-04-13 06:31:37', 0, 1, '', ''),
(7, 'Aashi electronics', 'agency', 'B2B', 'it', '2020-07-25', '20', 'aashie.com', 'business executive', 'Consumer electronics devices include those used for. entertainment (flatscreen TVs, television sets, MP3 players, video recorders, DVD players, radio receivers, etc.) communications (telephones, cell phones, e-mail-capable personal computers, desktop computers, laptops, printers, paper shredders, etc.)', 'Aashi vyas', 'aashi.we2cod@gmail.com', NULL, 9632587410, NULL, 'Ram nagar', 456321, 'indore', 'mp', 'india', 'manager', NULL, 0, '2023-04-13 07:10:05', '2023-04-13 07:11:33', 10, 0, '', ''),
(8, 'sikah center', 'Hospitality', 'B2B', 'id', '2002-02-02', '6', '55iuhkj.hjuk', 'khj', 'jnbknjkhjygjhykl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 08:59:15', '2023-04-13 08:59:15', 0, 0, '', ''),
(9, 'Hp Gas', 'Other', 'B2C', 'indore road', '2023-03-28', '5', NULL, 'Delivery boy', 'db t5cv hvtrgf cv', 'Rakesh', 'mayur.we2code@gmail.com', NULL, 88888888888, 99999999999, 'andher nagari chor gali kholi no 420', 888999, 'san fransisco', 'mp', 'earth', 'Junior developer', NULL, 0, '2023-04-13 09:55:00', '2023-04-13 09:56:54', 0, 0, '', ''),
(10, 'cfdscfwesdc', 'Tourism', 'B2B', NULL, '2023-04-01', '20', 'we2code.com', 'delivery boy', 'dcfsfc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:41:42', '2023-04-13 12:41:42', 0, 0, '', ''),
(11, 'Apollo', 'Transport', 'B2C', NULL, '2019-06-12', '5', NULL, 'Delivery boy', 'dddddd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:42:38', '2023-04-13 12:42:38', 0, 1, '', ''),
(12, 'WIPRO', 'IT', 'B2G', NULL, '2000-04-08', '10000', NULL, 'business executive', 'Our organization is to serve you the best', 'Shivraj', 'shiv.we2code@gmail.com', 'f523370044c04615aea88f46e44978cf', 6266987300, NULL, 'Ram nagar', 456321, 'indore', 'mp', 'india', NULL, NULL, 0, '2023-04-14 06:01:39', '2023-04-14 12:57:32', 16, 0, '', ''),
(13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aash.we2code@gmail.com', 'f523370044c04615aea88f46e44978cf', 6266987374, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-14 06:05:16', '2023-04-14 06:05:16', 0, 1, '', ''),
(14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aashiwe2code@gmail.com', 'f523370044c04615aea88f46e44978cf', 9632587410, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-14 06:15:53', '2023-04-14 06:15:53', 0, 1, '', ''),
(15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aawe2code@gmail.com', 'f523370044c04615aea88f46e44978cf', 9632587410, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-14 06:18:15', '2023-04-14 06:18:15', 0, 1, '', ''),
(16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aawee@gmail.com', 'f523370044c04615aea88f46e44978cf', 9632587410, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-14 06:19:15', '2023-04-14 06:19:15', 0, 1, '', ''),
(17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aashi@gmail.com', 'f523370044c04615aea88f46e44978cf', 9632587410, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-14 06:19:34', '2023-04-14 06:19:34', 0, 1, '', ''),
(18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lllaashi@gmail.com', '3208a3497eb38368d049eb592d33dc35', 9977884455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-14 06:20:39', '2023-04-14 06:20:39', 0, 1, '', ''),
(19, 'WE2CODE', 'Hospitality', 'B2C', 'W2C', '2023-04-06', '11', 'chat.openai.com', 'Driver', 'Consumer electronics devices include those used for. entertainment (flatscreen TVs, television sets, MP3 players, video recorders, DVD players, radio receivers, etc.) communications (telephones, cell phones, e-mail-capable personal computers, desktop computers, laptops, printers, paper shredders, etc.)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-14 13:00:37', '2023-04-14 13:00:37', 0, 0, '', ''),
(20, 'HIreNshare', 'IT', 'B2G', 'HNS', '2023-04-06', '20', 'ocalhost.com', 'Driver', 'THis is testing', 'Rakesh', 'kkk.we2code@gmail.com', NULL, 7895401236, NULL, 'Ram nagar', 222222, 'indore', 'mp', 'india', NULL, NULL, 0, '2023-04-14 17:21:21', '2023-04-15 05:53:57', 0, 1, '', ''),
(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'apple@gmail.com', '1f3870be274f6c49b3e31a0c6728957f', 9977884455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-15 06:01:01', '2023-04-15 06:01:01', 0, 0, '', ''),
(22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sevphal@gmail.com', 'b3182bf98ed6bd382961494c89f59864', 9977884455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-15 06:06:06', '2023-04-15 06:06:06', 0, 1, '', ''),
(23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'abc@gmail.com', '900150983cd24fb0d6963f7d28e17f72', 9977884455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-15 06:11:35', '2023-04-15 06:11:35', 0, 1, '', ''),
(24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rashi@gmail.com', '2d841879342d2b31b3b569165f2c8bd7', 9977884455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-15 06:12:44', '2023-04-15 06:12:44', 0, 1, '', ''),
(25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aashi01@gmail.com', 'd7c3b6020c30e8bbab33b07d05a88646', 96362587410, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-15 10:05:41', '2023-04-15 10:05:41', 0, 1, '', ''),
(26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uv@gmail.com', 'a99c7cc994bd438b0c3bb53790cd9621', 8520025800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-15 10:08:51', '2023-04-15 10:08:51', 0, 1, '', ''),
(27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aashi.we2code@gmail.com', 'f523370044c04615aea88f46e44978cf', 8521479630, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-15 10:51:51', '2023-04-15 12:21:51', 0, 0, '', '587ea74f1e1c1b667fcfa0826f5ac338'),
(28, 'Hp Gas', 'Other', 'C2C', NULL, '2019-01-02', '20', NULL, 'Office boy', 'Need a office boy', 'Rakesh', 'Rakesh@gmail.com', NULL, 8520147963, NULL, 'Ram nagar', 852025, 'indore', 'mp', 'india', NULL, NULL, 0, '2023-04-17 12:19:39', '2023-04-17 12:22:44', 0, 0, 'Ram nagar', ''),
(29, 'Shushil academy', 'Health', 'C2C', NULL, '2023-03-27', '20', NULL, 'manager', 'The Dance Academy, established since October 1988 aims to provide students with a professional dance curriculum exposing them to well structured training programmes in the various dance disciplines. Students are encouraged to develop their dance skills and performance qualities to the maximum.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-17 12:24:39', '2023-04-17 12:27:09', 0, 0, 'LIG', ''),
(30, 'Poonam academy', 'Health', 'C2C', NULL, '2023-03-27', '20', NULL, 'manager', 'The Dance Academy, established since October 1988 aims to provide students with a professional dance curriculum exposing them to well structured training programmes in the various dance disciplines. Students are encouraged to develop their dance skills and performance qualities to the maximum.', 'jatin tiwari', 'jyotish.we2code@gmail.m', NULL, 7471031820, NULL, 'indore', 452020, 'indore', 'india', 'India', NULL, NULL, 0, '2023-04-17 12:27:23', '2023-04-20 06:30:15', 0, 0, '', ''),
(31, 'Teach radix pvt.ltd', 'IT', 'B2C', 'radix', '2021-10-15', '35', 'tech-radix.com', 'python develop', 'We at Tech Radix are an employee-first new age software product and services company that delivers innovative and custom-built technology solutions for Start-ups and SMB companies across the world. We offer a variety of time-tested engagement, delivery and partnership models to help our customers ideate, create, road test, launch and grow their business. \n\nWe employ business-first approach, innovative thinking and platform & product mindset to build the right digital solutions which are meaningful, flexible, scalable and easy to maintain.\n\nOur founding team consists of industry veterans and Gen Z newbies. The veteran founders bring in more than 100 man-years of experience building technology products & business solutions. They have worked across the world and have served hundreds of customers across various geographies. While our newbies, the Gen Z workforce bring in the energy, enthusiasm, disruptive thinking and the dare-to-dream attitude', 'jatin tiwari', 'tanmay@techradix.com', NULL, 8956327410, 852014796, 'indore', 452020, 'indore', 'india', 'India', 'Manager', NULL, 0, '2023-04-18 04:45:42', '2023-04-20 06:26:14', 0, 0, 'bicholi mardana', ''),
(32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'jatin tiwari', 'aashi010@gmail.com', 'f523370044c04615aea88f46e44978cf', 8520147963, NULL, 'indore', 452020, 'indore', 'india', 'India', NULL, NULL, 0, '2023-04-18 09:51:37', '2023-04-20 06:25:48', 0, 1, '', ''),
(33, 'eeee', 'Transport', 'G2C', NULL, '2023-04-20', '5', '1254565', 'tyghjlk', 'wertyuiop[\';lkmjnbvcdsa', 'jatin tiwari', 'jish.we2code@gmail.com', NULL, 7470920482, 799913836, 'indore', 452022, 'indore', 'india', 'India', 'qa', NULL, 0, '2023-04-20 05:44:20', '2023-04-20 06:13:41', 0, 1, '#$%^', ''),
(34, 'Basics and off beat', 'Other', 'B2C', NULL, '2019-01-09', '22', NULL, 'delivery boy', 'A cloths company to serve you the best with your outfit.', 'Ram lal', 'ramlal@gmail.com', NULL, 8520147963, NULL, 'Ram nagar', 456321, 'indore', 'mp', 'india', NULL, NULL, 0, '2023-04-21 10:12:31', '2023-04-22 06:37:53', 0, 0, 'indore', ''),
(35, 'ff', 'Transport', 'B2B', 'ff', '2023-04-16', '5', NULL, 'ff ff ', 'ff ff ff ff ff ff ff ff ff ff ', 'Rakesh', 'fdgfb.wgfh@gmail.com', NULL, 8528528520, NULL, 'Ram nagar', 951753, 'hyderabad', 'comma', 'earth', NULL, NULL, 0, '2023-04-24 06:42:10', '2023-04-24 07:01:14', 0, 0, 'ff', ''),
(36, 'Infosys', 'IT', 'B2C', 'Info', '2010-02-01', '50000', NULL, 'business executive', 'We Create Best Digital gifts for you.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 06:51:29', '2023-04-24 06:54:29', 0, 1, '', '');

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
(1, 3, 1, 2, 'meet soon', '0000-00-00', '2023-04-05 12:45:39'),
(2, 3, 1, 2, 'meeting', '0000-00-00', '2023-04-05 12:48:08'),
(3, 2, 1, 1, 'Agreement', '0000-00-00', '2023-04-05 12:58:25'),
(4, 2, 1, 1, 'Hello Your Interview is schedule at 10th april ', '0000-00-00', '2023-04-07 05:54:41'),
(5, 2, 1, 2, 'Salary decision ', '0000-00-00', '2023-04-11 10:33:57'),
(6, 2, 1, 2, 's', '0000-00-00', '2023-04-11 10:34:11'),
(7, 2, 2, 2, 'xx', '0000-00-00', '2023-04-11 10:35:16'),
(8, 10, 1, 2, 'hello', '0000-00-00', '2023-04-11 12:28:32'),
(9, 10, 1, 2, 'Next will be the last round', '0000-00-00', '2023-04-11 12:30:42'),
(10, 10, 1, 2, '!@#^%$', '0000-00-00', '2023-04-12 07:10:07'),
(11, 10, 1, 2, 'dfghjkl;', '0000-00-00', '2023-04-12 07:10:26'),
(12, 10, 1, 2, 'gfhjgjyygu', '0000-00-00', '2023-04-12 07:13:38'),
(13, 10, 1, 2, 'ygjfj', '0000-00-00', '2023-04-12 07:17:31'),
(14, 10, 2, 2, 'Happy customer', '0000-00-00', '2023-04-13 10:44:00'),
(15, 10, 2, 2, 'Time', '0000-00-00', '2023-04-13 10:44:10'),
(16, 10, 2, 2, 'cdfsdfcs d', '0000-00-00', '2023-04-13 10:45:36'),
(17, 10, 1, 1, 'sfczdsf', '0000-00-00', '2023-04-13 10:46:26'),
(18, 10, 2, 2, 'dfgfdgfchb', '0000-00-00', '2023-04-13 10:47:21'),
(19, 10, 2, 2, 'zzzzzzzz', '0000-00-00', '2023-04-13 10:47:53'),
(20, 10, 2, 2, 'xxxxxx', '0000-00-00', '2023-04-13 10:48:26'),
(21, 10, 2, 2, 'sxdzfc ', '0000-00-00', '2023-04-13 10:48:55'),
(22, 10, 2, 2, 'zzzzzzzzzzzzzzz', '0000-00-00', '2023-04-13 10:49:29'),
(23, 10, 2, 2, 'op', '0000-00-00', '2023-04-13 10:50:12'),
(24, 10, 1, 1, 'Joining on 15', '0000-00-00', '2023-04-13 10:52:19'),
(25, 10, 1, 2, 'hkjhk', '0000-00-00', '2023-04-13 10:54:27'),
(26, 21, 1, 2, 'Job assigned', '0000-00-00', '2023-04-14 17:45:37'),
(27, 10, 1, 2, 'hello', '0000-00-00', '2023-04-15 05:51:34'),
(28, 10, 1, 2, 'hhhhhh', '0000-00-00', '2023-04-15 08:53:59'),
(29, 10, 1, 2, 'SDCFD', '0000-00-00', '2023-04-15 08:55:07'),
(30, 10, 1, 1, 'gggggggggggggggggggggggggggg', '0000-00-00', '2023-04-15 08:55:47'),
(31, 10, 1, 1, 'Rahul', '2023-04-25', '2023-04-15 08:59:07'),
(32, 21, 1, 2, 'dasd', '2023-04-20', '2023-04-17 11:13:50'),
(33, 21, 1, 1, 'dasdasd', '2023-04-18', '2023-04-17 11:14:51'),
(34, 21, 5, 5, 'dadadaD', '2023-04-22', '2023-04-21 11:40:31'),
(35, 10, 5, 7, 'hello', '0000-00-00', '2023-04-22 06:44:19'),
(36, 10, 5, 7, 'Meeting', '2023-04-27', '2023-04-24 04:30:32'),
(37, 10, 5, 7, 'Meeting On Saturday At 5:00 Pm', '2023-04-29', '2023-04-24 06:19:50'),
(38, 10, 2, 5, 'kjhguj', '0000-00-00', '2023-04-24 07:52:09'),
(39, 10, 16, 7, 'ggggg', '2023-04-28', '2023-04-24 08:40:02'),
(40, 10, 2, 5, 'xsccc ', '2023-04-27', '2023-04-24 09:32:44'),
(41, 10, 2, 5, 'ggggggggg', '0000-00-00', '2023-04-24 09:33:05'),
(42, 10, 2, 5, 'Hello', '0000-00-00', '2023-04-24 09:35:28'),
(43, 10, 16, 7, 'hello ', '0000-00-00', '2023-04-24 09:50:53'),
(44, 10, 2, 7, 'sss', '0000-00-00', '2023-04-24 11:28:48');

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
(1, 1, 'Bussiness Development officer', '0-1 Year', '9Lac-10Lac', 'ukrain', 'IT', 'we2code.com', 'Required a good bussiness development....', 'htbytnbhjbn', 'hello', 'yhjbhybv', 'Full Time with SWAP', NULL, 'Graduate', 'english', 'Other', 'Full Time', 1, 1, '2023-04-05 12:10:19', '2023-04-15 05:08:41', 16, 0, 0),
(2, 12, 'manager', '5+yrs', '1400000', 'banglore', 'IT', 'www.careerattcs.com', 'hello', 'helo', 'hello', 'Bussiness', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-04-06 06:13:51', '2023-04-14 12:37:20', 0, 0, 0),
(3, 2, 'developer', 'Fresher', '3', 'India', 'IT', 'd', 'eWDa', 'adfaSD', 'ads', 'Adas', 'Full Time with SWAP', NULL, 'Post Metric', 'hindi', 'eWDd', 'Full Time', 1, 1, '2023-04-06 08:36:58', '2023-04-06 08:36:58', 0, 0, 1),
(4, 2, 'erwtwq', '3-5 Year', '5Lac-8Lac', 'India', 'Transport', 'jhgbh.com', 'sdfgasfg', 'dsfgsfdg', 'sdgsadfd', 'sfgadsg', 'SWAP Only', NULL, 'Graduate', 'sfgasgd', 'hindi', 'Part Time', 2, 1, '2023-04-06 09:54:26', '2023-04-12 10:32:06', 0, 0, 1),
(5, 2, 'React Developeer', '0-1 Year', '5Lac-8Lac', 'India', 'IT', 'www.careerattcs.com', 'Frontend', 'Development', 'HTML CSS JAVASCRIPT', 'Frontend', 'Full Time', NULL, 'Graduate', 'HTML CSS JAVASCRIPT', 'java', 'Full Time', 3, 1, '2023-04-06 10:53:36', '2023-04-13 09:48:20', 10, 0, 0),
(6, 1, 'Developer', '0-1 Year', 'Below 1 Lac', 'India', 'IT', '1234.com', '@#$%^&*', 'sss', 'sss', 'its', 'Other than SWAP', NULL, 'Post Metric', 'English', 'aaas', 'Full Time', 2, 1, '2023-04-07 09:39:13', '2023-04-13 04:22:46', 0, 0, 1),
(7, 1, 'tttttt', '0-1 Year', '3', 'UK', 'Transport', 'www.canjobs.com', 'tyrrt', 'rtrt', 'werwer', 'ewrer', 'Part Time with SWAP', NULL, 'Post Metric', 'wrwer', 'wrwer', 'Part Time', 3, 1, '2023-04-07 09:50:24', '2023-04-07 09:50:24', 0, 0, 1),
(8, 1, 'developer', '0-1 Year', '0', 'Canada', 'Hospitality', 'ertwar.com', 'ncfjncghnc', 'gvhnvghncf', 'fbghvhjgvnhcf', 'rawtwe', 'Part Time', NULL, 'Metric', 'English', 'artwet', 'Full Time', 2, 1, '2023-04-11 13:01:09', '2023-04-12 07:16:29', 0, 0, 1),
(9, 5, 'Nursedfgh', '5+ Year', '0', 'India', 'Transport', 'apollo.com', 'Identifying patients care requirements focus on their needs and act on them Nurturing a compassion', 'bed making changing of bed sheets  mouth care  back care etc', 'Identifying patients ', 'fdghjk', 'Full Time', NULL, 'Diploma', 'English', 'certified@^%$', 'Full Time', 6, 1, '2023-04-12 04:30:11', '2023-04-12 05:03:44', 0, 0, 1),
(10, 5, 'erfghjm', '1-3 Year', '0', 'UK', 'Transport', 'www.c', '!@#$%^sdfghjkl4523651', 'dfgh', '.......', 'Alfghjk', 'Part Time', NULL, 'Other', 'English', '!@#', 'Other', 1, 1, '2023-04-12 04:47:39', '2023-04-12 04:53:54', 0, 0, 1),
(11, 1, 'developer', '1-3 ', '9Lac-10Lac', 'Mexico', 'Tourism', 'www.c', 'ertyuio', 'dfghjk', 'dgfhjkl', 'dtghjijuug', 'SWAP Only', NULL, 'Other', 'Gujrati', 'python', 'Full Time', 5, 1, '2023-04-12 09:29:50', '2023-04-14 12:36:18', 0, 0, 0),
(12, 5, 'developer', '3-5 Year', 'Not Disclosed', 'UK', 'Tourism', 'www.careerattcs.com', 'sdfghjkl', 'sdfghjk', 'sdfghjk', 'typing', 'Full Time with SWAP', NULL, 'Graduate', 'Gujrati', 'react,html,css', 'Part Time', 5, 1, '2023-04-12 10:21:06', '2023-04-13 09:44:59', 0, 0, 0),
(13, 5, 'BDO', '5+yrs', '5Lac-8Lac', 'banglore', 'IT', 'www.careerattcs.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', 'Hello sir ', 'Good morning', 'Bussiness', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'html,css', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-04-12 10:29:27', '2023-04-13 09:44:32', 0, 0, 0),
(14, 2, 'php developer', '1-3 Year', 'Below 1 Lac', 'India', 'IT', 'www.canjobs.com', 'safhgyythytyth ynbyuhty n yutn', 'nyhnbytbh ynyuhb yunjht', 'yhtyb gyunyh uhh gyuh ', 'Backend', 'Full Time with SWAP', NULL, 'Graduate', 'English', 'php,sql', 'Full Time', 3, 1, '2023-04-12 10:33:39', '2023-04-13 04:51:08', 0, 0, 0),
(15, 2, 'developer', '1-3 Year', 'Below 1 Lac', 'Canada', 'IT', '1234.com', 'xcvgxv ', 'dfxfcfdf', 'dfdfc ', 'Frontend', 'Part Time with SWAP', NULL, 'Post Metric', 'Hindi', 'b.tech', 'Full Time', 3, 1, '2023-04-13 04:39:49', '2023-04-13 04:40:08', 0, 0, 1),
(16, 1, 'Office boy', '3-5 Year', 'Below 1 Lac', 'India', 'Other', '1234.com', 'safdx dbfcfdb ', 'fcv  sdjvlg jdsvl djdv jdv skokdcshfhxjv  :d\'Jx ', 'jdjkjkd dhd jdkck ', 'its', 'Full Time', NULL, 'Metric', 'English', 'html', 'Full Time', 13, 1, '2023-04-13 09:38:54', '2023-04-13 09:43:48', 0, 0, 0),
(17, 12, 'Developer', 'Fresher', '3Lac-5Lac', 'USA', 'Hospitality', 'www.careerattcs.com', 'ghn g', 'hjyunyu', 'unyujh', 'njuyhn', 'Part Time', NULL, 'Metric', 'Marathi', 'php,sql,react,android', 'Part Time', 2, 1, '2023-04-14 12:33:25', '2023-04-14 12:33:25', 0, 0, 0),
(18, 12, 'developer', '3-5 ', '1Lac-3Lac', 'USA', 'IT', '1234.com', 'asfdgd', 'fghdfhgfh', 'dfghfdh', 'hyrtfh', 'Part Time', NULL, 'Metric', 'Marathi', 'b.tech', 'Full Time', 3, 1, '2023-04-14 12:40:44', '2023-04-14 12:40:44', 0, 0, 0),
(19, 20, 'Web Developer', '1-3 ', '3Lac-5Lac', 'Mexico', 'IT', 'we2code.com', 'Testing', 'Testig', 'testing', 'HR', 'Other than SWAP', NULL, 'Post Graduate', 'French', 'Driving', 'Full Time', 14, 1, '2023-04-14 17:36:37', '2023-04-14 17:36:37', 0, 0, 0),
(20, 1, 'Manager', '0-1 ', 'Below 1 Lac', 'USA', 'Other', 'www.careerattcs.com', 'kkkkkkkkkkkkkkkkkkybbbbhyg', 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'kkkkkkkkkkkkkkkkkkkkkkkkk', 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'Full Time with SWAP', NULL, 'Metric', 'English', 'certified', 'Full Time', 1, 1, '2023-04-15 05:57:11', '2023-04-21 06:26:25', 0, 0, 0),
(21, 5, 'developer', '5+yrs', '140000', 'hyderabad', 'IT', 'www.careerattcs.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', ' OIJO FOIJOJASDFVJ I JOJ Okdwjfoj oiho jOSDJFOIH9wrugh JM[- wmc MJDFHVBIU', 'OJOK ojioj 90dfujpjknel; oijcxjiojoHDFVB OIRBFNDC ,ZXMN HG JKDV', 'Bussiness', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-04-15 09:40:17', '2023-04-15 09:40:17', 0, 0, 1),
(22, 12, 'legal advisor', '7+yrs', '140000', 'pune', 'legal', 'www.legaleagle.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', ' OIJO FOIJOJASDFVJ I JOJ Okdwjfoj oiho jOSDJFOIH9wrugh JM[- wmc MJDFHVBIU', 'OJOK ojioj 90dfujpjknel; oijcxjiojoHDFVB OIRBFNDC ,ZXMN HG JKDV', 'legal', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-04-15 09:47:04', '2023-04-15 09:47:04', 0, 0, 1),
(23, 12, 'legal advisor', '7+yrs', '140000', 'pune', 'legal', 'www.legaleagle.com', ' hhsiod  oijos oijoj iojh DOIIJ OIJd oh oSDJO OIsdjioj oiSCFJOIJIO', ' OIJO FOIJOJASDFVJ I JOJ Okdwjfoj oiho jOSDJFOIH9wrugh JM[- wmc MJDFHVBIU', 'OJOK ojioj 90dfujpjknel; oijcxjiojoHDFVB OIRBFNDC ,ZXMN HG JKDV', 'legal', 'qefgvqdfv', NULL, 'POST-GRADUATE', 'English,spanish', 'koqdv kja  jio okjoa jojoqjdo', 'adfdv refgvefrv eqarfvrtg qev', 3, 1, '2023-04-15 09:48:18', '2023-04-15 09:48:18', 0, 0, 0),
(24, 17, 'Delivery boy', 'Fresher', 'Below 1 Lac', 'Canada', 'Hospitality', 'www.careerattcs.com', ';KISJFDC DKJHGVKD GJF JKJhdigjl jg jothjyfhn jglkfujkhjerweg vrge begb ', 'fdhbgjnh bfgn g', 'dfhbfgc fgn fhgb', 'ppopikj', 'Full Time', NULL, 'Metric', 'English', 'certified', 'Full Time', 15, 1, '2023-04-15 09:55:55', '2023-04-21 10:52:42', 0, 0, 0),
(25, 1, 'Sweaper', '0-1 ', 'Below 1 Lac', 'India', 'IT', 'we2code.com', 'Want a sweeper to clean the office.', 'Clean the office very nicely', 'A good sweeper', 'Hospility', 'Part Time', NULL, 'Metric', 'Hindi', 'certified', 'Part Time', 47, 1, '2023-04-17 06:55:32', '2023-04-17 06:55:32', 0, 0, 0),
(26, 1, 'Sweaper', '0-1 ', 'Below 1 Lac', 'India', 'IT', 'we2code.com', 'Want a sweeper to clean the office.', 'Clean the office very nicely', 'A good sweeper', 'Hospility', 'Part Time', NULL, 'Metric', 'Hindi', 'certified', 'Part Time', 47, 1, '2023-04-17 06:55:39', '2023-04-17 06:55:39', 0, 0, 0),
(27, 4, 'home', '1-3 ', '1Lac-3Lac', 'Japan', 'Tourism', 'www.c', 'dsfdghjj@#', 'dfgfhjkl;\'#$', 'dfgh#$', 'Alfghjk', 'Other', NULL, 'Other', 'Other', 'hghjk', 'Other', 12, 1, '2023-04-20 04:49:54', '2023-04-20 04:49:54', 0, 0, 1),
(28, 2, 'home', 'Fresher', '9Lac-10Lac', 'Nepal', 'Other', 'www.caattcs.com', 'dsfdghjj@#', 'dfgfhjkl;\'#$', 'dfgh#$', 'Alfghjk', 'SWAP Only', NULL, 'Post Graduate', 'Marathi', 'hghjk', 'Full Time', 47, 1, '2023-04-20 04:49:57', '2023-04-22 06:33:08', 0, 0, 0),
(29, 1, 'ho', 'Other', 'Other', 'Other', 'Other', 'www.caattcs.com', 'dfi', 'ertyu', 'ertyui', 'ewr', 'Other', NULL, 'Other', 'Other', '!@#@', 'Other', 49, 1, '2023-04-20 04:51:01', '2023-04-20 05:14:46', 0, 0, 1),
(30, 1, 'UI and UX developer', '1-3 ', 'Below 1 Lac', 'India', 'IT', 'ertwar.com', 'Required a ui/ux developer.', 'Creating ui designs of all language', 'professional designer  ', 'Frontend', 'Full Time', NULL, 'Graduate', 'English', 'HTML,CSS,Javacript', 'Full Time', 3, 1, '2023-04-21 06:49:33', '2023-04-22 06:34:02', 0, 0, 0);

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
(1, 'Assistant manager', 0, 'Domestic', 1, '2023-04-05 11:58:05', '2023-04-05 11:58:20', 0),
(2, 'FLutter developer', 0, 'Frontend developer', 1, '2023-04-05 11:58:33', '2023-04-05 11:58:33', 0),
(3, 'DEVELOPER', 0, 'Devops developer', 1, '2023-04-05 11:58:52', '2023-04-13 04:45:53', 0),
(4, 'Driver', 0, 'Computer Operator', 1, '2023-04-06 08:48:19', '2023-04-06 08:48:19', 1),
(5, 'Driver', 0, 'Computer Operator', 1, '2023-04-06 08:48:20', '2023-04-06 08:48:20', 1),
(6, 'Nurse', 0, 'Nurse', 1, '2023-04-06 10:57:46', '2023-04-13 04:46:36', 0),
(7, 'fg', 0, 'Devops developer', 1, '2023-04-06 11:03:04', '2023-04-06 11:03:18', 1),
(8, 'Hr', 0, 'Hr', 1, '2023-04-06 11:04:42', '2023-04-06 11:04:42', 1),
(9, 'skljk', 0, 'Recepection', 1, '2023-04-07 11:43:03', '2023-04-07 11:43:03', 1),
(10, 'UI Ux designer', 0, 'Frontend developer', 1, '2023-04-12 10:07:50', '2023-04-12 10:07:50', 1),
(11, 'ajkj', 0, 'House', 1, '2023-04-12 10:08:28', '2023-04-12 10:08:28', 1),
(12, 'Hr', 0, 'Hr', 1, '2023-04-12 10:27:05', '2023-04-13 04:47:34', 0),
(13, 'Hospitility', 0, 'Doctor', 1, '2023-04-13 06:56:59', '2023-04-13 06:56:59', 0),
(14, 'Driver', 0, 'House', 1, '2023-04-14 17:17:08', '2023-04-14 17:17:08', 1),
(15, 'Delivery boy', 0, 'Domestic', 1, '2023-04-15 05:42:06', '2023-04-15 05:42:23', 1),
(25, 'IT', 0, 'Devops developer', 1, '2023-04-15 11:28:55', '2023-04-15 12:53:41', 1),
(27, 'Developer', 25, 'php developer', 1, '2023-04-15 11:30:02', '2023-04-15 11:30:02', 0),
(29, 'Testing', 25, 'Teacher', 1, '2023-04-15 11:34:23', '2023-04-15 12:53:13', 0),
(30, 'aaaa', 0, 'Typing', 1, '2023-04-17 04:36:54', '2023-04-17 04:37:36', 1),
(31, 'aaaa', 0, 'Hr', 1, '2023-04-17 04:40:01', '2023-04-17 04:40:01', 1),
(32, 'aaaa', 0, 'pharma', 1, '2023-04-17 04:43:38', '2023-04-17 04:46:20', 1),
(33, 'FLutter developer', 0, NULL, 1, '2023-04-17 04:46:46', '2023-04-17 04:46:46', 1),
(34, 'Hello hello', 0, NULL, 1, '2023-04-17 04:47:25', '2023-04-17 04:47:25', 1),
(35, 'aaaa', 0, 'It', 1, '2023-04-17 04:51:45', '2023-04-17 04:58:21', 1),
(36, 'aaaa', 35, 'Hello', 1, '2023-04-17 04:58:37', '2023-04-17 04:58:37', 1),
(37, NULL, 0, 'It', 1, '2023-04-17 05:26:34', '2023-04-17 05:26:34', 1),
(38, 'aaaa', 0, 'Computer Operator', 1, '2023-04-17 05:26:42', '2023-04-17 05:26:42', 1),
(39, 'aaaa', 35, 'Hello', 1, '2023-04-17 05:31:38', '2023-04-17 05:31:38', 1),
(40, 'automatic tester', 0, '3', 1, '2023-04-17 05:39:47', '2023-04-17 05:39:47', 1),
(41, NULL, 0, 'Hotel', 1, '2023-04-17 05:40:44', '2023-04-17 05:40:44', 1),
(42, NULL, 0, 'Computer ', 1, '2023-04-17 05:44:30', '2023-04-17 05:44:30', 1),
(43, NULL, 0, 'legal', 1, '2023-04-17 05:51:25', '2023-04-17 05:51:25', 1),
(44, NULL, 0, 'Hotel', 1, '2023-04-17 05:59:56', '2023-04-17 05:59:56', 0),
(45, 'Sweeper', 0, '44', 1, '2023-04-17 06:00:12', '2023-04-17 06:00:12', 1),
(46, 'Watchmen', 0, 'Hotel', 1, '2023-04-17 06:02:32', '2023-04-17 06:02:32', 0),
(47, 'ku', 0, 'p', 1, '2023-04-17 06:03:20', '2023-04-20 09:56:18', 1),
(48, NULL, 0, 'Computer ', 1, '2023-04-17 06:27:58', '2023-04-17 06:27:58', 0),
(49, 'computer operator', 0, 'Computer ', 1, '2023-04-17 06:28:36', '2023-04-22 08:24:54', 0),
(50, NULL, 0, 'Telecome', 1, '2023-04-17 06:30:36', '2023-04-17 06:30:36', 0),
(51, NULL, 0, 'f', 1, '2023-04-20 09:54:15', '2023-04-20 09:54:15', 0),
(52, NULL, 0, 'f', 1, '2023-04-20 09:55:31', '2023-04-20 09:55:31', 0),
(53, 'aaaa', 0, 'Nurse', 1, '2023-04-22 08:27:11', '2023-04-22 08:27:11', 0),
(54, 'FLutter developer', 0, 'It', 1, '2023-04-22 08:27:37', '2023-04-22 08:27:37', 1),
(55, 'FLutter developer', 0, 'f', 1, '2023-04-22 08:27:45', '2023-04-22 08:27:45', 1),
(56, 'vegetables seller', 0, 'Domestic', 1, '2023-04-24 06:27:10', '2023-04-24 06:27:10', 0);

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_admin` int(51) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_interviews`
--

INSERT INTO `job_interviews` (`id`, `job_id`, `employee_id`, `interview_date`, `is_reschedule`, `is_active`, `created_at`, `created_by_admin`, `updated_at`) VALUES
(1, 1, 2, '2023-04-30', 0, 1, '2023-04-19 09:08:20', 1, '2023-04-19 09:08:20'),
(2, 1, 1, '2023-05-02', 0, 1, '2023-04-19 09:08:52', 1, '2023-04-19 09:08:52'),
(3, 2, 2, '2023-04-28', 1, 0, '2023-04-19 09:09:10', 2, '2023-04-19 09:09:10'),
(4, 4, 4, '2023-05-15', 1, 1, '2023-04-19 09:09:27', 2, '2023-04-19 09:09:27'),
(5, 2, 2, '2023-04-30', 1, 0, '2023-04-19 12:40:23', 10, '2023-04-19 12:40:23'),
(6, 4, 4, '2023-05-19', 1, 0, '2023-04-19 12:41:23', 10, '2023-04-19 12:41:23'),
(7, 4, 4, '2023-05-20', 0, 1, '2023-04-19 12:41:34', 10, '2023-04-19 12:41:34'),
(8, 2, 2, '2023-04-29', 1, 0, '2023-04-20 10:58:23', 10, '2023-04-20 10:58:23'),
(9, 2, 2, '2023-04-25', 1, 0, '2023-04-20 10:58:35', 10, '2023-04-20 10:58:35'),
(10, 2, 2, '2023-04-27', 1, 0, '2023-04-21 09:42:55', 10, '2023-04-21 09:42:55'),
(11, 5, 7, '2023-04-23', 1, 0, '2023-04-22 06:49:43', 10, '2023-04-22 06:49:43'),
(12, 5, 7, '2023-04-23', 1, 0, '2023-04-22 06:53:44', 10, '2023-04-22 06:53:44'),
(13, 5, 7, '2023-04-29', 1, 0, '2023-04-22 08:30:56', 10, '2023-04-22 08:30:56'),
(14, 5, 7, '2023-04-28', 1, 0, '2023-04-24 06:20:00', 10, '2023-04-24 06:20:00'),
(15, 5, 7, '2023-04-25', 1, 0, '2023-04-24 06:23:25', 10, '2023-04-24 06:23:25'),
(16, 5, 7, '2023-04-25', 1, 0, '2023-04-24 06:23:43', 10, '2023-04-24 06:23:43'),
(17, 2, 2, '2023-04-28', 1, 0, '2023-04-24 06:34:23', 10, '2023-04-24 06:34:23'),
(18, 5, 7, '2023-05-06', 0, 1, '2023-04-24 06:34:28', 10, '2023-04-24 06:34:28'),
(19, 2, 2, '2023-04-29', 0, 1, '2023-04-24 09:19:20', 10, '2023-04-24 09:19:20'),
(20, 16, 7, '2023-04-26', 0, 1, '2023-04-24 09:53:13', 10, '2023-04-24 09:53:13'),
(21, 2, 5, '2023-04-27', 1, 0, '2023-04-24 10:29:39', 10, '2023-04-24 10:29:39'),
(22, 2, 7, '2023-04-26', 0, 1, '2023-04-24 11:15:36', 10, '2023-04-24 11:15:36'),
(23, 2, 5, '2023-04-27', 1, 0, '2023-04-24 11:22:09', 10, '2023-04-24 11:22:09'),
(24, 2, 5, '2023-04-26', 0, 1, '2023-04-24 13:08:02', 10, '2023-04-24 13:08:02');

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
(1, 'Skill', '{\"4\": \"css\", \"5\": \"Html\", \"7\": \"Typing\"}', '2023-04-18 05:52:56', '2023-04-24 08:51:49'),
(2, 'Category', '[]', '2023-04-18 09:02:44', '2023-04-22 04:55:43'),
(3, 'Location', '{\"1\": \"Indore\", \"2\": \"Ujjain\", \"4\": \"Dewas\", \"5\": \"Khandwa\", \"6\": \"Bhilai\"}', '2023-04-18 09:03:51', '2023-04-20 12:38:47'),
(4, 'Industry', '{\"1\": \"Petroleum\", \"2\": \"IT\", \"3\": \"House Holds\"}', '2023-04-18 09:04:56', '2023-04-20 12:37:31'),
(5, 'Education', '[]', '2023-04-18 09:05:35', '2023-04-22 04:55:52'),
(6, 'Corporation ', '{\"1\": \"B2B\", \"2\": \"C2C\"}', '2023-04-18 09:06:14', '2023-04-20 12:38:37'),
(7, 'Language', '{\"1\": \"Hindi\", \"2\": \"English\"}', '2023-04-18 09:06:36', '2023-04-20 12:38:22');

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
(1, 1, 2, 'positive', '2023-07-05', 1, '2023-04-18 10:09:16', '2023-04-18 10:18:58'),
(2, 1, 1, 'Approved', '2023-04-20', 1, '2023-04-18 11:51:19', '2023-04-18 11:51:19'),
(3, 2, 2, 'Pending', '2023-04-09', 1, '2023-04-18 11:52:48', '2023-04-18 11:52:48'),
(4, 4, 4, 'negative', '2023-07-19', 1, '2023-04-19 09:04:53', '2023-04-19 09:04:53'),
(5, 17, 2, 'Reject', '2023-04-07', 1, '2023-04-19 13:00:20', '2023-04-19 13:00:20'),
(6, 2, 2, 'Approved', '2023-03-30', 1, '2023-04-20 05:10:39', '2023-04-20 05:10:39'),
(7, 5, 5, 'Reject', '2023-04-21', 1, '2023-04-21 12:23:15', '2023-04-21 12:23:15'),
(8, 5, 7, 'Pending', '2023-04-30', 1, '2023-04-21 12:23:23', '2023-04-21 12:23:23'),
(9, 16, 7, 'Approved', '2023-04-27', 1, '2023-04-21 12:23:30', '2023-04-21 12:23:30'),
(10, 13, 4, 'Other', '2023-04-27', 1, '2023-04-21 12:23:42', '2023-04-21 12:23:42'),
(11, 11, 4, 'Draft', '2023-04-16', 1, '2023-04-21 12:23:56', '2023-04-21 12:23:56'),
(12, 14, 2, 'Pending', '2023-04-29', 1, '2023-04-21 12:24:03', '2023-04-21 12:24:03'),
(13, 11, 1, 'Draft', '2023-04-29', 1, '2023-04-21 12:24:13', '2023-04-21 12:24:13'),
(14, 14, 1, 'Pending', '2023-04-28', 1, '2023-04-21 12:24:19', '2023-04-21 12:24:19'),
(15, 5, 5, 'Pending', '2023-04-16', 1, '2023-04-22 06:59:30', '2023-04-22 06:59:30'),
(16, 12, 7, 'Draft', '2023-04-14', 1, '2023-04-24 07:25:38', '2023-04-24 07:25:38'),
(17, 16, 7, 'Approved', '2023-04-22', 1, '2023-04-24 09:53:29', '2023-04-24 09:53:29'),
(18, 13, 7, 'Pending', '2023-04-22', 1, '2023-04-24 10:55:14', '2023-04-24 10:55:14'),
(19, 2, 7, 'Approved', '2222-02-22', 1, '2023-04-24 11:05:08', '2023-04-24 11:05:08'),
(20, 2, 5, 'Complete', '2023-04-09', 1, '2023-04-24 11:05:24', '2023-04-24 11:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(101) NOT NULL,
  `from_id` int(101) NOT NULL,
  `type` varchar(21) NOT NULL,
  `message` varchar(101) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `from_id`, `type`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 1, 'super-admin', 'New user kane@gmail.com added', 0, '2023-04-12 06:51:46', '2023-04-12 06:51:46'),
(2, 1, 'super-admin', 'New candidate jason@gmail.com added', 0, '2023-04-12 09:23:12', '2023-04-12 09:23:12'),
(3, 1, 'Super-admin', 'New candidate roger@gmail.com added', 0, '2023-04-12 12:55:14', '2023-04-12 12:55:14'),
(4, 1, 'Super-admin', 'New candidate roger@gmail.com added', 0, '2023-04-12 13:00:07', '2023-04-12 13:00:07'),
(5, 1, 'Super-admin', 'New candidate pantagon@gmail.com added', 0, '2023-04-14 04:47:17', '2023-04-14 04:47:17'),
(6, 1, 'Super-admin', ' A new user ranjitsingh@gmail.com has been added successfully ', 0, '2023-04-14 05:12:11', '2023-04-14 05:12:11'),
(7, 1, 'Super-admin', 'A new company  has been added successfully', 0, '2023-04-15 06:01:01', '2023-04-15 06:01:01'),
(8, 1, 'Super-admin', 'A new company rashi@gmail.com has been added successfully', 0, '2023-04-15 06:12:44', '2023-04-15 06:12:44'),
(9, 1, 'Super-admin', 'A new job with title legal advisor has been added successfully by WIPRO', 0, '2023-04-15 09:48:18', '2023-04-15 09:48:18'),
(10, 1, 'Super-admin', 'A new job with title-Delivery boy has been added successfully by ', 0, '2023-04-15 09:55:55', '2023-04-15 09:55:55'),
(11, 1, 'Super-admin', 'A new company aashi01@gmail.com has been added successfully', 0, '2023-04-15 10:05:41', '2023-04-15 10:05:41'),
(12, 1, 'Super-admin', 'A new company uv@gmail.com has been added successfully', 0, '2023-04-15 10:08:51', '2023-04-15 10:08:51'),
(13, 1, 'Super-admin', 'A new company aashi.we2code@gmail.com has been added successfully', 0, '2023-04-15 10:51:51', '2023-04-15 10:51:51'),
(14, 1, 'Super-admin', 'A new job with title-Sweaper has been added successfully by We2code', 0, '2023-04-17 06:55:32', '2023-04-17 06:55:32'),
(15, 1, 'Super-admin', 'A new job with title-Sweaper has been added successfully by We2code', 0, '2023-04-17 06:55:39', '2023-04-17 06:55:39'),
(16, 1, 'Super-admin', 'A new company aashi010@gmail.com has been added successfully', 0, '2023-04-18 09:51:37', '2023-04-18 09:51:37'),
(17, 1, 'Super-admin', 'A new job with title-home has been added successfully by szzz', 0, '2023-04-20 04:49:54', '2023-04-20 04:49:54'),
(18, 1, 'Super-admin', 'A new job with title-home has been added successfully by szzz', 0, '2023-04-20 04:49:57', '2023-04-20 04:49:57'),
(19, 1, 'Super-admin', 'A new job with title-house has been added successfully by sikah center', 0, '2023-04-20 04:51:01', '2023-04-20 04:51:01'),
(20, 1, 'Super-admin', 'A new job with title-UI UX developer has been added successfully by We2code', 0, '2023-04-21 06:49:33', '2023-04-21 06:49:33');

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
,`is_viewed` int(101)
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
,`contact_no_other` bigint(20)
,`industry` text
,`about` mediumtext
,`logo` varchar(100)
,`address` text
,`company_size` varchar(251)
,`corporation` varchar(251)
,`total_applicants` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `employee_view`
--
DROP TABLE IF EXISTS `employee_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `employee_view`  AS SELECT `e`.`employee_id` AS `employee_id`, `e`.`name` AS `name`, `e`.`email` AS `email`, `e`.`password` AS `password`, `e`.`contact_no` AS `contact_no`, `e`.`description` AS `description`, `e`.`date_of_birth` AS `date_of_birth`, `e`.`gender` AS `gender`, `e`.`marital_status` AS `marital_status`, `e`.`nationality` AS `nationality`, `e`.`current_location` AS `current_location`, `e`.`currently_located_country` AS `currently_located_country`, `e`.`language` AS `language`, `e`.`religion` AS `religion`, `e`.`interested_in` AS `interested_in`, `e`.`experience` AS `experience`, `e`.`work_permit_canada` AS `work_permit_canada`, `e`.`work_permit_other_country` AS `work_permit_other_country`, `e`.`posted` AS `posted`, `e`.`posted_company_id` AS `posted_company_id`, `e`.`date_of_posting` AS `date_of_posting`, `e`.`designation``` AS `designation```, `e`.`resume` AS `resume`, `e`.`profile_photo` AS `profile_photo`, `e`.`created_at` AS `created_at`, `e`.`created_by_admin` AS `created_by_admin`, `e`.`updated_at` AS `updated_at`, `e`.`is_deleted` AS `is_deleted`, `e`.`token` AS `token`, `education`.`education` AS `education`, `education`.`specialization` AS `specialization`, (select group_concat(`employee_skill`.`skill` separator ',') from `employee_skill` where (`employee_skill`.`employee_id` = `e`.`employee_id`)) AS `skill` FROM (`employee` `e` left join (select `employee_education`.`employee_id` AS `employee_id`,group_concat(`employee_education`.`course` separator ',') AS `education`,group_concat(`employee_education`.`specialization` separator ',') AS `specialization` from `employee_education` group by `employee_education`.`employee_id`) `education` on((`education`.`employee_id` = `e`.`employee_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_applied_employee`
--
DROP TABLE IF EXISTS `view_applied_employee`;

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_applied_employee`  AS SELECT `aoj`.`apply_id` AS `apply_id`, `aoj`.`job_id` AS `job_id`, `aoj`.`employee_id` AS `employee_id`, `aoj`.`is_viewed` AS `is_viewed`, `aoj`.`created_at` AS `created_at`, `aoj`.`updated_at` AS `updated_at`, `vjp`.`job_title` AS `job_title`, `vjp`.`company_id` AS `company_id`, `vjp`.`company_name` AS `company_name`, `ev`.`name` AS `name`, `ev`.`email` AS `email`, `ev`.`contact_no` AS `contact_no`, `ev`.`description` AS `description`, `ev`.`date_of_birth` AS `date_of_birth`, `ev`.`gender` AS `gender`, `ev`.`marital_status` AS `marital_status`, `ev`.`nationality` AS `nationality`, `ev`.`current_location` AS `current_location`, `ev`.`currently_located_country` AS `currently_located_country`, `ev`.`language` AS `language`, `ev`.`religion` AS `religion`, `ev`.`interested_in` AS `interested_in`, `ev`.`experience` AS `experience`, `ev`.`work_permit_canada` AS `work_permit_canada`, `ev`.`work_permit_other_country` AS `work_permit_other_country`, `ev`.`resume` AS `resume`, `ev`.`profile_photo` AS `profile_photo`, `ev`.`created_by_admin` AS `created_by_admin`, `ev`.`is_deleted` AS `is_deleted`, `ev`.`education` AS `education`, `ev`.`specialization` AS `specialization`, `ev`.`skill` AS `skill`, `lmia`.`id` AS `id`, `lmia`.`lmia_status` AS `lmia_status`, `lmia`.`expected_time_of_completion` AS `expected_time_of_completion` FROM (((`apply_on_job` `aoj` join `employee_view` `ev` on((`aoj`.`employee_id` = `ev`.`employee_id`))) join `view_job_posted` `vjp` on((`vjp`.`job_id` = `aoj`.`job_id`))) left join `lmia` on(((`lmia`.`employee_id` = `aoj`.`employee_id`) and (`lmia`.`job_id` = `aoj`.`job_id`)))) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`apnaorga`@`localhost` SQL SECURITY DEFINER VIEW `view_job_posted`  AS SELECT `j`.`job_id` AS `job_id`, `j`.`company_id` AS `company_id`, `j`.`job_title` AS `job_title`, `j`.`experience_required` AS `experience_required`, `j`.`salary` AS `salary`, `j`.`location` AS `location`, `j`.`industry_type` AS `industry_type`, `j`.`apply_link` AS `apply_link`, `j`.`job_description` AS `job_description`, `j`.`your_duties` AS `your_duties`, `j`.`requirement` AS `requirement`, `j`.`department` AS `department`, `j`.`job_type` AS `job_type`, `j`.`role_category` AS `role_category`, `j`.`education` AS `education`, `j`.`language` AS `language`, `j`.`keyskill` AS `keyskill`, `j`.`employement` AS `employement`, `j`.`job_category_id` AS `job_category_id`, `j`.`is_active` AS `is_active`, `j`.`created_at` AS `created_at`, `j`.`updated_at` AS `updated_at`, `j`.`created_by_admin` AS `created_by_admin`, `j`.`is_featured` AS `is_featured`, `j`.`is_deleted` AS `is_deleted`, `jc`.`category_type` AS `category_type`, `e`.`company_name` AS `company_name`, `e`.`contact_no_other` AS `contact_no_other`, `e`.`industry` AS `industry`, `e`.`about` AS `about`, `e`.`logo` AS `logo`, `e`.`address` AS `address`, `e`.`company_size` AS `company_size`, `e`.`corporation` AS `corporation`, count(`a`.`employee_id`) AS `total_applicants` FROM (((`jobs` `j` left join `apply_on_job` `a` on((`j`.`job_id` = `a`.`job_id`))) join `job_category` `jc` on((`j`.`job_category_id` = `jc`.`job_category_id`))) join `employer` `e` on((`j`.`company_id` = `e`.`company_id`))) WHERE (`j`.`is_deleted` <> 1) GROUP BY `j`.`job_id` ;

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `apply_on_job`
--
ALTER TABLE `apply_on_job`
  MODIFY `apply_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `company_kyc`
--
ALTER TABLE `company_kyc`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `employee_career`
--
ALTER TABLE `employee_career`
  MODIFY `career_id` int(251) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `employee_education`
--
ALTER TABLE `employee_education`
  MODIFY `education_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `employee_skill`
--
ALTER TABLE `employee_skill`
  MODIFY `skill_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `company_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `job_category`
--
ALTER TABLE `job_category`
  MODIFY `job_category_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `job_interviews`
--
ALTER TABLE `job_interviews`
  MODIFY `id` int(51) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `list`
--
ALTER TABLE `list`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lmia`
--
ALTER TABLE `lmia`
  MODIFY `id` int(51) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
