-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 23, 2023 at 09:59 AM
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
(1, 'raj.we2code@gmail.com', 'c13b1fd8824c5577074601c325503a9a', 'raj', NULL, 'super-admin', 1, 0, '2023-05-19 06:40:51', '2023-05-22 05:52:33', 1, ''),
(2, 'gourav.we2code@gmail.com', '3f30aff52f55a2a0c2d7a0e02e7872eb', 'Gourav choudary', NULL, 'manager', 1, 1, '2023-05-20 11:52:02', '2023-05-20 11:52:02', 1, ''),
(3, 'raj@gmail.com', 'c13b1fd8824c5577074601c325503a9a', 'Raj', NULL, 'manager', 1, 0, '2023-05-22 05:52:01', '2023-05-22 05:52:01', 1, '');

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
(1, 1, 1, 0, '2023-05-20 11:28:10', '2023-05-20 11:39:28'),
(2, 1, 3, 0, '2023-05-22 05:32:12', '2023-05-22 05:32:12'),
(3, 4, 3, 0, '2023-05-22 06:38:39', '2023-05-22 06:38:39'),
(4, 1, 4, 0, '2023-05-22 08:53:54', '2023-05-22 08:55:58'),
(5, 6, 4, 0, '2023-05-22 08:58:06', '2023-05-22 08:58:10'),
(6, 7, 5, 0, '2023-05-22 09:13:47', '2023-05-22 09:13:47'),
(7, 2, 2, 0, '2023-05-22 12:14:36', '2023-05-22 12:15:03');

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
(1, 1, 'ABCTY1234D', 'Molly', '1993-02-19', ' Vijay Nagar ', 452010, 'Indore', 'Madhya Pradesh ', 'India', 'AAACC4175D', '123-456-7890', 'PDES03028F', 'https://apnaorganicstore.in/canjobs/uploads/1684580874.pdf', '2023-05-20 11:07:54', '2023-05-20 11:07:54');

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
(1, 3, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \"}', 'PENDING', 11373, '2023-05-20 11:13:38'),
(2, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \"}', 'PENDING', 17184, '2023-05-20 11:28:10'),
(3, 3, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Sanchi\"}', 'PENDING', 26521, '2023-05-20 11:34:07'),
(4, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Sanchi\", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-22\"}', 'PENDING', 35604, '2023-05-20 11:36:36'),
(5, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-23\"}', 'PENDING', 45791, '2023-05-20 11:43:33'),
(6, 7, '{\"to\": \"utkarsh.we2code@gmail.com\", \"otp\": 295107}', 'PENDING', 58684, '2023-05-20 12:04:40'),
(7, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 601985}', 'PENDING', 63295, '2023-05-20 12:04:45'),
(8, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'PENDING', 75493, '2023-05-20 12:05:34'),
(9, 1, '{\"to\": \"utkarsh.we2code@gmail.com\"}', 'PENDING', 81060, '2023-05-20 12:05:59'),
(10, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-23\"}', 'PENDING', 97036, '2023-05-22 04:17:53'),
(11, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-23\"}', 'PENDING', 104261, '2023-05-22 04:18:07'),
(12, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-27\"}', 'PENDING', 119455, '2023-05-22 04:19:09'),
(13, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-28\"}', 'PENDING', 129325, '2023-05-22 04:24:30'),
(14, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Shayam mohan\", \"interview_date\": \"2023-05-29\"}', 'PENDING', 132219, '2023-05-22 05:08:51'),
(15, 4, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \"}', 'PENDING', 145463, '2023-05-22 05:32:12'),
(16, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Vinod\", \"interview_date\": \"2023-05-29\"}', 'PENDING', 153554, '2023-05-22 05:34:05'),
(17, 5, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Delivery boy\", \"company_name\": \"Amul \", \"candidate_name\": \"Vinod\", \"interview_date\": \"2023-05-29\"}', 'PENDING', 169863, '2023-05-22 05:36:57'),
(18, 3, '{\"to\": \"raj.we2code@gmail.com\", \"job_title\": \"Hr\", \"company_name\": \"WE2CODE\"}', 'PENDING', 173780, '2023-05-22 07:31:21'),
(19, 7, '{\"to\": \"raj.we2codee@gmail.com\", \"otp\": 533420}', 'PENDING', 183426, '2023-05-22 08:31:49'),
(20, 7, '{\"to\": \"aashi.we2code@gmail.com\", \"otp\": 708711}', 'PENDING', 193434, '2023-05-22 08:53:11'),
(21, 1, '{\"to\": \"aashi.we2code@gmail.com\"}', 'PENDING', 208900, '2023-05-22 08:53:45'),
(22, 3, '{\"to\": \"raj@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"WE2CODE\"}', 'PENDING', 213144, '2023-05-22 09:05:35'),
(23, 4, '{\"to\": \"raj@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"WE2CODE\"}', 'PENDING', 228537, '2023-05-22 09:13:47'),
(24, 5, '{\"to\": \"raj@gmail.com\", \"job_title\": \"Web Developer\", \"company_name\": \"WE2CODE\", \"candidate_name\": \"Vinod\", \"interview_date\": \"2023-05-24\"}', 'PENDING', 233182, '2023-05-22 09:31:55'),
(25, 5, '{\"to\": \"raj@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"WE2CODE\", \"candidate_name\": \"Sakshi desai\", \"interview_date\": \"2023-05-25\"}', 'PENDING', 246400, '2023-05-22 09:32:07'),
(26, 5, '{\"to\": \"raj@gmail.com\", \"job_title\": \"Receptionist\", \"company_name\": \"WE2CODE\", \"candidate_name\": \"Sakshi desai\", \"interview_date\": \"2023-05-23\"}', 'PENDING', 256361, '2023-05-22 09:32:12');

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
(8, 'New Template', 'Test Subject', 'JKjkjskdkkl ksjj dsjkldjaskldjklsj dklasjkl das d', 0, '2023-05-15 12:13:56', '2023-05-15 12:13:56'),
(9, 'Test', 'test', 'test', 0, '2023-05-15 12:15:13', '2023-05-15 12:15:13');

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
(1, 'Shayam mohan', 'shayam.@gmail.com', '', 9517862430, 'Add the professional experience section to your scholarship resume. This is where your work and internship experience should go. No professional experience? Focus on your volunteering work, part-time gigs, side jobs, or community service.', '2000-05-02', 'male', 'single', 'indian', 'india', 'India', 'Hindi', NULL, 'swap', '1-3 ', 'no', 'India', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1684581729.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1684581729.jpeg', '2023-05-20 11:17:48', 1, '2023-05-20 11:22:09', 0, ''),
(2, 'UV', 'utkarsh.we2code@gmail.com', '836bb04de698e84f5229dee6d9b9c9ec', 9165100000, 'This is sunny day today.', '1883-11-05', 'male', 'single', 'Canadian', 'Alaska', 'USA', 'English', NULL, 'swap', '7+ ', 'yes', NULL, 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1684756863.pdf', NULL, '2023-05-20 12:05:59', 0, '2023-05-22 12:01:03', 0, ''),
(3, 'Vinod', 'vinod@test.com', '', 1234567890, 'Testing ', '2023-05-01', 'male', 'single', 'indian', 'Indore', 'india', 'Hindi', NULL, 'swap', '5-7 ', 'no', 'Yes', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1684731163.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1684731163.jpeg', '2023-05-22 04:28:36', 1, '2023-05-22 04:52:43', 0, ''),
(4, NULL, 'aashi.we2code@gmail.com', 'cb3defedb4e15498b0b27082c8e59dcd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00', '', NULL, NULL, '2023-05-22 08:53:45', 0, '2023-05-22 08:53:45', 0, ''),
(5, 'Sakshi desai', 'sakshi@gmail.com', '', 9630258741, 'Receptionists may greet visitors, handle incoming and outgoing correspondence, maintain files and records, perform data entry, maintain office calendars and schedules, keep the office clean, safe and organized and keep office supply inventory fully stocked', '2000-05-01', 'female', 'single', 'indian', 'india', 'India', 'English', NULL, 'swap', '1-3 ', 'yes', 'yes', 0, 0, '0000-00-00', '', 'https://apnaorganicstore.in/canjobs/uploads/1684756398.pdf', 'https://apnaorganicstore.in/canjobs/uploads/1684746465.jpeg', '2023-05-22 09:07:45', 3, '2023-05-22 11:53:18', 0, '');

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
(3, 2, 'we2code', 'php developer', 'Indore', 'Information Technology', NULL, NULL, '2023-01-05', '2023-05-22', 1, '2023-05-22 12:02:48', '2023-05-22 12:14:05');

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
(5, 2, 'Post Graduate', 'harward', 'Master of Laws', NULL, 'United States', 2018, '2023-05-22 12:05:09', '2023-05-22 12:05:09');

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
(1, 1, 'Other'),
(2, 5, 'Food & Beverage Occupations'),
(3, 5, 'Community & Social Services Occupations'),
(4, 5, 'Personal Service Occupations'),
(5, 2, 'Farming, Fisheries & Forestry Occupations ');

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
  `token` varchar(301) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`company_id`, `company_name`, `industry`, `corporation`, `alias`, `company_start_date`, `company_size`, `website_url`, `vacancy_for_post`, `about`, `contact_person_name`, `email`, `password`, `contact_no`, `contact_no_other`, `address`, `pin_code`, `city`, `state`, `country`, `designation`, `logo`, `is_active`, `created_at`, `updated_at`, `created_by_admin`, `is_deleted`, `franchise`, `token`) VALUES
(1, 'Amul ', 'Restaurants & Food Service', 'B2B', 'amul', '2001-02-01', '10000', 'www.amul.com', 'delivery ', 'Anand Milk Union Limited is an Indian state government-owned dairy-based cooperative society officially named the Gujarat Milk Marketing Federation based in Anand, Gujarat. It is under the ownership of Gujarat Cooperative Milk Marketing Federation Limited, Department of Cooperation, Government of Gujarat.', 'Molly Kurien', 'molly@gmail.com', 'sfgdf', 258741030, 6546546565, ' Vijay Nagar', 452010, 'Indore', 'Madhya Pradesh', 'India', 'CEO', 'https://apnaorganicstore.in/canjobs/uploads/1684580560.png', 0, '2023-05-20 11:02:40', '2023-05-20 11:05:16', 1, 0, 'indore', ''),
(2, 'Sanchi', 'Restaurants & Food Service', 'B2C', 'sanchi', '2010-02-09', '55', 'sachi.com', 'delivery  boy', 'Sanchi is a milk product brand name of Madhya Pradesh State Cooperative Dairy Federation Limited.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1684582375.png', 0, '2023-05-20 11:32:55', '2023-05-20 11:32:55', 1, 0, 'Vijay nagar', ''),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aashi.we2code@gmail.com', 'cb3defedb4e15498b0b27082c8e59dcd', 9632587410, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-20 12:05:34', '2023-05-20 12:05:34', 0, 0, '', ''),
(4, 'WE2CODE', 'Information Technology', 'B2B', 'W2C', '2023-02-02', '1000', 'amazon.in', 'Developer', 'testing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://apnaorganicstore.in/canjobs/uploads/1684737346.png', 0, '2023-05-22 06:35:46', '2023-05-22 06:35:46', 3, 0, 'Indore', '');

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
(1, 1, 2, 1, 'Scheduled the interview ', '0000-00-00', '2023-05-20 11:37:46'),
(2, 1, 2, 1, 'yjt gyj', '0000-00-00', '2023-05-20 11:38:23'),
(3, 1, 2, 1, 'sdgdfgfc bff\n', '0000-00-00', '2023-05-20 11:38:50'),
(4, 1, 1, 1, 'NEw followup', '2023-05-23', '2023-05-22 04:25:13');

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
(2, 2, 'Delivery boy', '1-3 ', '1Lac-3Lac', 'India', 'Restaurants & Food Service', 'www.careerattcs.com', 'Sanchi is a milk product brand name of Madhya Pradesh State Cooperative Dairy Federation Limited', 'Sanchi is a milk product brand name of Madhya Pradesh State Cooperative Dairy Federation Limited', 'Sanchi is a milk product brand', 'Sanchi ', 'Full-Time', NULL, 'Bachelor of Liberal Arts', 'Hindi', 'Farming, Fisheries & Forestry Occupations ', 'Full-Time', 2, 1, '2023-05-20 11:34:07', '2023-05-20 11:34:07', 1, 0, 0),
(3, 3, 'Shop worker', '0-1 ', 'Below 1 Lac', 'India', 'Retail & Wholesale', 'dps.com', 'Maintains staff by recruiting, selecting, orienting, and training employees. Ensures a safe, secure, and legal work environment. Develops personal growth opportunities. Accomplishes staff results by communicating job expectations; planning, monitoring, and appraising job results.', 'Maintains staff by recruiting, selecting, orienting, and training employees. Ensures a safe, secure,', 'Maintains staff by recruiting,', 'Maintains staff by recruiting,', 'Full-Time', NULL, 'Bachelor of Liberal Arts', 'Hindi', 'Sales, Retail, & Customer Support Occupations', 'Full-Time', 2, 1, '2023-05-20 12:08:20', '2023-05-20 12:08:20', 0, 0, 0),
(4, 4, 'Web Developer', '3-5 ', '5Lac-10Lac', 'Antarctica', 'Information Technology', 'we2code.com', 'Tetsting', 'test', 'tes', 'HR', 'Full-Time', NULL, 'Bachelor of Software Engineering', 'English', 'Technology Occupations', 'Full-Time', 7, 1, '2023-05-22 06:37:10', '2023-05-22 06:38:01', 3, 0, 0),
(5, 4, 'Office boy', '1-3 ', 'Below 1 Lac', 'India', 'Information Technology', 'www.we2code.com', 'Job responsibilities will include: Office cleaning and maintenance, Preparing Tea and Serving, Banking work, Filing and deliveries. Local Language, Working knowledge of English, Willingness to travel.', 'Serve Tea and Coffee to Staff and office Visitor.\nClean office kitchen on daily basis.', 'Humane and respectful.', 'office staff', 'Full-Time', '5', 'Other', 'Hindi', 'Cleaning & Grounds Maintenance Occupations', 'Full-Time', 4, 1, '2023-05-22 07:24:21', '2023-05-22 07:24:21', 1, 0, 0),
(6, 4, 'Hr', '1-3 ', '1Lac-3Lac', 'India', 'Information Technology', 'www.we2code.com', 'Human resources (HR) professionals manage, develop and support employees within an organisation. They handle all the issues, policies and processes related to people, such as recruiting and hiring staff, training and developing employees and managing performance, compensation and benefits.', 'Support the development and implementation of HR initiatives and systems.', 'Confidentiality', 'Human Resource Administration.', 'Full-Time', '2', 'Master of Business Administration', 'English', 'Education & Instruction Occupations', 'Full-Time', 7, 1, '2023-05-22 07:31:21', '2023-05-22 07:31:21', 1, 0, 0),
(7, 4, 'Receptionist', '1-3 ', '1Lac-3Lac', 'India', 'Information Technology', 'www.we2code.com', 'A Receptionist\'s duties and responsibilities include greeting visitors, helping them navigate through an office, and supplying them with refreshments as they wait. In addition, they maintain calendars for appointments, sort mail, make copies, and plan travel arrangements.', 'Receptionists may greet visitors, handle incoming and outgoing correspondence, maintain files.', 'Verbal communication ', 'Customer service.', 'Full-Time', '2', 'Other', 'English', 'Community & Social Services Occupations', 'Full-Time', 5, 1, '2023-05-22 09:05:35', '2023-05-22 10:54:50', 3, 0, 0);

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
(3, 'Mechanic', 1, 'Factory', 1, '2023-05-22 05:44:32', '2023-05-22 05:44:32', 0),
(4, 'Cleaner', 1, 'Factory', 1, '2023-05-22 05:44:47', '2023-05-22 05:44:47', 0),
(5, 'Receptionist', 1, 'Factory', 1, '2023-05-22 05:44:55', '2023-05-22 05:44:55', 0),
(6, 'Superwiser', 1, 'Factory', 1, '2023-05-22 05:45:07', '2023-05-22 05:45:07', 0),
(7, 'Manager', 1, 'Factory', 1, '2023-05-22 05:45:13', '2023-05-22 05:45:13', 0),
(8, NULL, 0, 'Hospital', 1, '2023-05-22 05:45:20', '2023-05-22 05:45:20', 0),
(9, NULL, 0, 'Hotel', 1, '2023-05-22 05:45:25', '2023-05-22 05:45:25', 0);

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
(1, 1, 1, '2023-05-28', 1, 0, 'pending', '2023-05-22 05:07:39', 1, '2023-05-22 05:07:39'),
(2, 1, 1, '2023-05-29', 0, 1, 'complete', '2023-05-22 05:08:51', 1, '2023-05-22 05:08:51'),
(3, 1, 3, '2023-05-29', 1, 0, 'pending', '2023-05-22 05:34:05', 1, '2023-05-22 05:34:05'),
(4, 1, 3, '2023-05-29', 0, 1, 'pending', '2023-05-22 05:36:57', 1, '2023-05-22 05:36:57'),
(5, 4, 3, '2023-05-24', 0, 1, 'pending', '2023-05-22 09:31:55', 3, '2023-05-22 09:31:55'),
(6, 7, 5, '2023-05-25', 1, 0, 'pending', '2023-05-22 09:32:07', 3, '2023-05-22 09:32:07'),
(7, 7, 5, '2023-05-23', 0, 1, 'pending', '2023-05-22 09:32:12', 3, '2023-05-22 09:32:12');

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
(1, 'Skill', '{\"1\": \"Sales, Retail, & Customer Support Occupations\", \"2\": \"Healthcare Occupations\", \"3\": \"Organization Operations & Administrative Occupations\", \"4\": \"Food & Beverage Occupations\", \"5\": \"Technology Occupations\", \"6\": \"Finance & Accounting Occupations\", \"7\": \"Repair, Maintenance & Installation Occupations\", \"8\": \"Architecture & Engineering Occupations\", \"9\": \"Construction & Extraction Occupations\", \"10\": \"Supply Chain & Logistics Occupations\", \"11\": \"Manufacturing & Utilities Occupations\", \"12\": \"Marketing, Advertising & Public Relations Occupations\", \"13\": \"Community & Social Services Occupations\", \"14\": \"Education & Instruction Occupations\", \"15\": \"Transportation Occupations\", \"16\": \"Science & Research Occupations\", \"17\": \"Cleaning & Grounds Maintenance Occupations\", \"18\": \"Media, Arts & Design Occupations\", \"19\": \"Safety, Security & Civil Defence Occupations\", \"20\": \"Personal Service Occupations\", \"21\": \"Travel, Attractions & Events Occupations\", \"22\": \"Legal Occupations\", \"23\": \"Farming, Fisheries & Forestry Occupations \", \"24\": \"Other\"}', '2023-04-18 05:52:56', '2023-05-20 05:03:59'),
(2, 'Category', '{\"2\": \"Driver\", \"3\": \"Mechanic\", \"4\": \"Cleaner\", \"5\": \"Receptionist\", \"6\": \"Superwiser\", \"7\": \"Manager\"}', '2023-04-18 09:02:44', '2023-05-22 05:45:13'),
(3, 'Location', '{}', '2023-04-18 09:03:51', '2023-04-20 12:38:47'),
(4, 'Industry', '{\"1\": \"Retail & Wholesale\", \"2\": \"Healthcare\", \"3\": \"Manufacturing\", \"4\": \"Construction, Repair & Maintenance Services\", \"5\": \"Restaurants & Food Service\", \"6\": \"Finance\", \"7\": \"Human Resources & Staffing\", \"8\": \"Transportation & Logistics\", \"9\": \"Information Technology\", \"10\": \"Energy, Mining, Utilities\", \"11\": \"Management & Consulting\", \"12\": \"Non-profit & NGO\", \"13\": \"Education\", \"14\": \"Insurance\", \"15\": \"Government & Public Administration\", \"16\": \"Telecommunications\", \"17\": \"Aerospace & Defence\", \"18\": \"Hotel & Travel Accommodation\", \"19\": \"Agriculture\", \"20\": \"Legal\", \"21\": \"Real Estate\", \"22\": \"Media & Communication\", \"23\": \"Arts, Entertainment & Recreation\", \"24\": \"Pharmaceutical & Biotechnology\", \"25\": \"Personal Consumer Services\", \"26\": \"Other\"}', '2023-04-18 09:04:56', '2023-05-15 11:18:30'),
(5, 'Education', '{\"1\": \"Bachelor of Liberal Arts\", \"2\": \"Bachelor of Arts\", \"3\": \"Bachelor of Liberal Arts\", \"4\": \"Alternate Entry Master of Science in Nursing\", \"5\": \"Master of Liberal Arts\", \"6\": \"Bachelor of Arts\", \"7\": \"Bachelor of Applied Arts\", \"8\": \"Bachelor of Applied Arts and Sciences\", \"9\": \"Bachelor of Arts in Communication\", \"10\": \"Bachelor of Aerospace Engineering\", \"11\": \"Bachelor of Arts and Economics\", \"12\": \"Bachelor of Economics\", \"13\": \"Bachelor of Arts in Education\", \"14\": \"Bachelor of Applied Studies\", \"15\": \"Bachelor of Applied Science\", \"16\": \"Bachelor of Architectural Studies\", \"17\": \"Bachelor of Applied Science\", \"18\": \"Bachelor of Art & Technology\", \"19\": \"Bachelor of Applied Technology\", \"20\": \"Bachelor of Accountancy\", \"21\": \"Bachelor of Agricultural Science\", \"22\": \"Bachelor of Applied Finance\", \"23\": \"Bachelor of Applied Science\", \"24\": \"Bachelor of Architecture\", \"25\": \"Bachelor of Asian Studies\", \"26\": \"Bachelor of Business Analysis - Financial\", \"27\": \"Bachelor of Business Administration\", \"28\": \"Bachelor of Built Environment\", \"29\": \"Bachelor of Biosystems Engineering\", \"30\": \"Bachelor of Behavioural Neuroscience\", \"31\": \"Bachelor of Business\", \"32\": \"Bachelor of Commerce and Administration\", \"33\": \"Bachelor of Civil Engineering\", \"34\": \"Bachelor of Computer Information Systems\", \"35\": \"Bachelor of Criminal Justice\", \"36\": \"Bachelor of Computer and Mathematical Sciences\", \"37\": \"Bachelor of Computing & Mathematical Sciences\", \"38\": \"Bachelor of Surgery\", \"39\": \"Bachelor of Chemical Engineering\", \"40\": \"Bachelor of Commerce\", \"41\": \"Bachelor of Commerce\", \"42\": \"Bachelor of Communication\", \"43\": \"Bachelor of Computing\", \"44\": \"Bachelor of Computer Operations Technology\", \"45\": \"Bachelor of Communications Studies\", \"46\": \"Bachelor of Design\", \"47\": \"Bachelor of Engineering\", \"48\": \"Bachelor of Electrical Engineering\", \"49\": \"Bachelor of Electronics Engineering Technology\", \"50\": \"Bachelor of Environmental Studies\", \"51\": \"Bachelor of Economics\", \"52\": \"Bachelor of Finance & Economics\", \"53\": \"Bachelor of Economic Science\", \"54\": \"Bachelor of Education\", \"55\": \"Bachelor of Environmental Design\", \"56\": \"Bachelor of Engineering\", \"57\": \"Bachelor of Fine Arts\", \"58\": \"Bachelor of Finance\", \"59\": \"Bachelor of General Studies\", \"60\": \"Bachelor of Game & Simulation Programming\", \"61\": \"Bachelor of Humanities and Arts\", \"62\": \"Bachelor of Hotel Management\", \"63\": \"Bachelor of Health Science\", \"64\": \"Bachelor of Health Sciences\", \"65\": \"Bachelor of Interior Architecture\", \"66\": \"Bachelor of Integrated Studies\", \"67\": \"Bachelor of Interdisciplinary Studies\", \"68\": \"Bachelor of Industrial and Science Engineering\", \"69\": \"Bachelor of Information Technology\", \"70\": \"Bachelor of Industrial Design\", \"71\": \"Bachelor of Information Science\", \"72\": \"Bachelor of Information Technology\", \"73\": \"Bachelor of International Studies\", \"74\": \"Bachelor of Journalism\", \"75\": \"Bachelor of Liberal Arts\", \"76\": \"Bachelor of Landscape Architecture\", \"77\": \"Bachelor of Liberal Studies\", \"78\": \"Bachelor of Languages\", \"79\": \"Bachelor of Music\", \"80\": \"Bachelor of Mechanical Engineering\", \"81\": \"Bachelor of Music Education\", \"82\": \"Bachelor of Materials Engineering\", \"83\": \"Bachelor of Music\", \"84\": \"Bachelor of Public Affairs\", \"85\": \"Bachelor of Polymer and Fiber Engineering\", \"86\": \"Bachelor of Professional Health Science\", \"87\": \"Bachelor of Science\", \"88\": \"Bachelor of Science in Aerospace Engineering\", \"89\": \"Bachelor of Science in Business Administration\", \"90\": \"Bachelor of Science in Biomedical Engineering\", \"91\": \"Bachelor of Science in Commerce Business Administration\", \"92\": \"Bachelor of Science in Civil Engineering\", \"93\": \"Bachelor of Science in Computer & Information Sciences\", \"94\": \"Bachelor of Science in Computer Science\", \"95\": \"Bachelor of Science in Computer Technology\", \"96\": \"Bachelor of Science in Chemical Engineering\", \"97\": \"Bachelor of Science in Chemistry\", \"98\": \"Bachelor of Science in Engineering\", \"99\": \"Bachelor of Science in Electrical Engineering\", \"100\": \"Bachelor of Science in Engineering Technology\", \"101\": \"Bachelor of Science in Education\", \"102\": \"Bachelor of Science in Geology\", \"103\": \"Bachelor of Science in Human Environmental Sciences\", \"104\": \"Bachelor of Science in Mechanical Engineering\", \"105\": \"Bachelor of Science in Manufacturing Engineering Technology\", \"106\": \"Bachelor of Science in Metallurgical Engineering\", \"107\": \"Bachelor of Science in Microbiology\", \"108\": \"Bachelor of Science in Materials Engineering\", \"109\": \"Bachelor of Science in Nursing\", \"110\": \"Bachelor of Science in Social Work\", \"111\": \"Bachelor of Social Work\", \"112\": \"Bachelor of Software Engineering\", \"113\": \"Bachelor of Textile Engineering\", \"114\": \"Bachelor of Technical & Interdisciplinary Studies\", \"115\": \"Bachelor of Textile Management and Technology\", \"116\": \"Bachelor of Wireless Engineering\", \"117\": \"Bachelor of Arts\", \"118\": \"Bachelor of Economics\", \"119\": \"Bachelor of Education\", \"120\": \"Bachelor of Arts and Economics\", \"121\": \"Bachelor of Journalism\", \"122\": \"Bachelor of Architecture\", \"123\": \"Bachelor of Applied Science\", \"124\": \"Bachelor of Applied Studies\", \"125\": \"Bachelor of Applied Science\", \"126\": \"Bachelor of Arts for Teaching\", \"127\": \"Bachelor of Aviation\", \"128\": \"Bachelor of Biomedical Science\", \"129\": \"Bachelor of Business Information Systems\", \"130\": \"Bachelor of Surgery\", \"131\": \"Bachelor of Surgery\", \"132\": \"Bachelor of Dental Surgery\", \"133\": \"Bachelor of Surgery Degree\", \"134\": \"Bachelor of Civil Law\", \"135\": \"Bachelor of Counseling\", \"136\": \"Bachelor of Divinity\", \"137\": \"Bachelor of Divisionnity\", \"138\": \"Bachelor of Design\", \"139\": \"Bachelor of Dental Surgery\", \"140\": \"Bachelor of Dental Science\", \"141\": \"Bachelor of Engineering\", \"142\": \"Bachelor of Economics\", \"143\": \"Bachelor of Economics and Finance\", \"144\": \"Bachelor of Science in Education\", \"145\": \"Bachelor of Engineering\", \"146\": \"Bachelor of Fine Arts\", \"147\": \"Bachelor of Finance\", \"148\": \"Bachelor of General Studies\", \"149\": \"Bachelor of Health & Physical Education\", \"150\": \"Bachelor of Health Science\", \"151\": \"Bachelor of Health Science\", \"152\": \"bachelor of hygiene\", \"153\": \"Bachelor of Information and Communications Technology\", \"154\": \"Bachelor of Integrated Studies\", \"155\": \"Bachelor of Journalism\", \"156\": \"Bachelor of Kinesiology\", \"157\": \"Bachelor of Liberal Arts\", \"158\": \"Bachelor of Landscape Architecture\", \"159\": \"Bachelor of Music (degree)\", \"160\": \"Bachelor of Medicine\", \"161\": \"Bachelor of Biomedical science\", \"162\": \"Bachelor of Medical Science\", \"163\": \"Bachelor of Medical Science\", \"164\": \"Bachelor of Midwifery\", \"165\": \"Bachelor of Ministry\", \"166\": \"Bachelor of Medical Science\", \"167\": \"Bachelor of Biomedical science\", \"168\": \"Bachelor of Medical Science\", \"169\": \"Bachelor of Music\", \"170\": \"Bachelor of Nursing\", \"171\": \"Bachelor of Nursing Science\", \"172\": \"Bachelor of Nursing\", \"173\": \"Bachelor of Physical Education\", \"174\": \"Bachelor of Pharmacy\", \"175\": \"Bachelor of Philosophy\", \"176\": \"bachelor of public health nursing\", \"177\": \"Bachelor of Professional Studies\", \"178\": \"Bachelor of Religious Education\", \"179\": \"Bachelor of Religious Studies\", \"180\": \"Bachelor of Science (clear in education line)\", \"181\": \"Bachelor of Science in Education\", \"182\": \"Bachelor of Science in Business Administration\", \"183\": \"Bachelor of Science (university degree)\", \"184\": \"Bachelor of Science and/with Education\", \"185\": \"Bachelor of Science in Economics\", \"186\": \"Bachelor of Science in Engineering\", \"187\": \"Bachelor of Science in Psychology\", \"188\": \"Bachelor of Nursing Science\", \"189\": \"Bachelor of Science in Education\", \"190\": \"Bachelor of Science in Engineering\", \"191\": \"Bachelor of Science in Education\", \"192\": \"Bachelor of Science in Environmental Health\", \"193\": \"Bachelor of Science in Engineering Technology\", \"194\": \"Bachelor of Science in Family and Consumer Sciences\", \"195\": \"Bachelor of Science in General Studies\", \"196\": \"Bachelor of Journalism\", \"197\": \"Bachelor of Science in Law\", \"198\": \"Bachelor of Science in Medicine\", \"199\": \"Bachelor of Science in Nursing\", \"200\": \"Bachelor of Science in Nuclear Engineering\", \"201\": \"Bachelor of Social Science\", \"202\": \"Bachelor of Science in Public Health\", \"203\": \"Bachelor of Social Work\", \"204\": \"Bachelor of Teaching\", \"205\": \"Bachelor of Technology\", \"206\": \"Bachelor of Theology\", \"207\": \"Bachelor of Theology\", \"208\": \"Bachelor of Veterinary Medicine\", \"209\": \"Bachelor of Veterinary Medicine and Science\", \"210\": \"Bachelor of Surgery\", \"211\": \"Bachelor of Surgery\", \"212\": \"Master in Surgery\", \"213\": \"Bachelor of Education\", \"214\": \"Master of Laws\", \"215\": \"Legum Baccalaureus (Latin: Bachelor Of Laws)\", \"216\": \"Master of Laws\", \"217\": \"Licensed Master of Social Work\", \"218\": \"Master of Arts in Education\", \"219\": \"Master of Education\", \"220\": \"Master of Fine Arts\", \"221\": \"Master of Interdisciplinary Studies\", \"222\": \"Master of Library and Information Science\", \"223\": \"Master of Ministry\", \"224\": \"Master of Music\", \"225\": \"Master of Occupational Therapy\", \"226\": \"Master of Science in Engineering Technology\", \"227\": \"Master of Science in Education\", \"228\": \"Master of Science in Nursing\", \"229\": \"Master of Social Work\", \"230\": \"Master of Urban Planning\", \"231\": \"Master of Arts\", \"232\": \"Master of Arts in Education\", \"233\": \"Master of Applied Anthropology\", \"234\": \"Master of Accountancy\", \"235\": \"Master of Arts in Christian Education\", \"236\": \"Master of Accountancy\", \"237\": \"Master of Arts in international economics and finance\", \"238\": \"Master of Arts in International Hotel Management\", \"239\": \"Master of Arts in Liberal Studies\", \"240\": \"Master of Arts Management\", \"241\": \"Master of Arts in Public Service\", \"242\": \"Master of Arts in Professional Writing\", \"243\": \"Master of Architecture\", \"244\": \"Master of Archival Studies\", \"245\": \"Master of Engineering\", \"246\": \"Master of Applied Sciences\", \"247\": \"Master of Arts and Teaching\", \"248\": \"Bachelor of Medicine\", \"249\": \"Master of Business Administration\", \"250\": \"Medicinae Baccalaureus, Baccalaureus Chirurgiae (Latin: Bachelor of Medicine, Bachelor of Surgery)\", \"251\": \"Master of Biochemistry\", \"252\": \"Master of Biology\", \"253\": \"Master of Biological Science\", \"254\": \"Master of Surgery\", \"255\": \"Master of Surgery\", \"256\": \"Master of Chemistry\", \"257\": \"Master of Criminal Justice\", \"258\": \"Master of Clinical Dentistry\", \"259\": \"Master of Clinical Medical Science\", \"260\": \"Master of Divisionnity\", \"261\": \"Master of Divinity\", \"262\": \"Master of Digital Media\", \"263\": \"Master of Drama\", \"264\": \"Master of Dental Surgery\", \"265\": \"Master of Engineering\", \"266\": \"Master of Electronic Business\", \"267\": \"Master of Economics\", \"268\": \"Master of Education\", \"269\": \"Master of Environmental Design\", \"270\": \"Master of Engineering\", \"271\": \"Master of Environmental Science\", \"272\": \"Master of Environmental Studies\", \"273\": \"Master of Earth Science\", \"274\": \"Master of Educational Technology\", \"275\": \"Master of Fine Art\", \"276\": \"Master of Forensic Sciences\", \"277\": \"Master of Geography\", \"278\": \"Master of Geology\", \"279\": \"Master of Geophysics\", \"280\": \"Master of Health Administration\", \"281\": \"Master of Health Education\", \"282\": \"Master of Health Science\", \"283\": \"Master of Industrial Design\", \"284\": \"Master of International Development\", \"285\": \"Master of Management in the Network Economy\", \"286\": \"Master of Informatics\", \"287\": \"Master of Engineering\", \"288\": \"Master of Information Systems Management\", \"289\": \"Master of Jurisprudence\", \"290\": \"Master of Labor and Human Resources\", \"291\": \"Master of Librarianship\", \"292\": \"Master of Library and Information Science degree\", \"293\": \"Master of Letters\", \"294\": \"Master of Library Science\", \"295\": \"Master of Liberal Studies\", \"296\": \"Master of Music\", \"297\": \"Master of Mathematics\", \"298\": \"Master of Mathematics and Physics\", \"299\": \"Master of Mass Communications\", \"300\": \"Master of Music Education\", \"301\": \"Master of Ministry\", \"302\": \"Master of Mathematics, Operational Research, Statistics and Economics\", \"303\": \"Master of Marketing Research\", \"304\": \"Master of Medical Science\", \"305\": \"Master of Medical Science\", \"306\": \"Master of Management Sciences\", \"307\": \"Master of Music\", \"308\": \"Master of Nursing\", \"309\": \"Master of Natural Science\", \"310\": \"Master of Science in Nursing\", \"311\": \"Master of Nursing Science\", \"312\": \"Master of Oceanography\", \"313\": \"Master of Occupational Therapy\", \"314\": \"Master of Pharmacy Administration\", \"315\": \"Master of Public Administration\", \"316\": \"Master of Professional Accountancy\", \"317\": \"Master of Physician Assistant Studies\", \"318\": \"Master of Pharmacy\", \"319\": \"Master of Public Health\", \"320\": \"master of pharmacy\", \"321\": \"Master of Philosophy\", \"322\": \"Master of Physics\", \"323\": \"Master of Pacific International Affairs\", \"324\": \"Master of Planning\", \"325\": \"Master of Project Management\", \"326\": \"Master of Public Management\", \"327\": \"Master of Public Policy\", \"328\": \"Master of Professional Studies\", \"329\": \"Master of Professional Studies\", \"330\": \"Master of Physical Therapy\", \"331\": \"Master of Radiology\", \"332\": \"Master of Research\", \"333\": \"Master of Science\", \"334\": \"Master of Surgery\", \"335\": \"Master of Science in Education\", \"336\": \"Master of Surgery\", \"337\": \"Master of Science\", \"338\": \"Master in Science\", \"339\": \"Master of Science in Dentistry\", \"340\": \"Master of Science in Engineering\", \"341\": \"Master of Science in Electrical Engineering\", \"342\": \"Master of Science in Environmental Health\", \"343\": \"Master of Science in Finance\", \"344\": \"Master of Science in Information\", \"345\": \"Master of Science in Information Systems\", \"346\": \"Master of Science in Information Studies\", \"347\": \"Master of Criminal Justice\", \"348\": \"Master of Science in Library Science\", \"349\": \"Master of Sacred Music\", \"350\": \"Master Of Science In Nursing\", \"351\": \"Master of Science in Natural Sciences\", \"352\": \"Master of Social Science\", \"353\": \"Master of Science In Organizational Leadership\", \"354\": \"Master of Science in Public Health\", \"355\": \"Master of Social Science\", \"356\": \"Master of Science in Strategic Leadership\", \"357\": \"Master of Science in Social Work\", \"358\": \"Master of Studies\", \"359\": \"Master of Science in Taxation\", \"360\": \"Master of Statistics\", \"361\": \"Master of Surgery\", \"362\": \"Master of Social Work\", \"363\": \"Master of Theology\", \"364\": \"Master of Theology\", \"365\": \"Master of the University\", \"366\": \"Master of Urban Studies\", \"367\": \"Master of Urban and Regional Planning\", \"368\": \"Bachelor of Music\", \"369\": \"Master of Music\", \"370\": \"Post Master\'s Graduate Certificate\", \"371\": \"Bachelor of Science\", \"372\": \"Scientiar Baccalaureus, Bachelor of Science\", \"373\": \"Master of Surgery\", \"374\": \"Master of Theology\", \"375\": \"Bachelor of Theology\", \"376\": \"Master of Theology\", \"377\": \"Other\"}', '2023-04-18 09:05:35', '2023-05-20 05:04:14'),
(6, 'Corporation', '{\"1\": \"B2B\", \"2\": \"B2C\", \"3\": \"C2C\", \"4\": \"B2G\", \"5\": \"G2C\", \"6\": \"G2B\", \"7\": \"Other\"}', '2023-04-18 09:06:14', '2023-05-19 09:36:40'),
(7, 'Language', '{\"1\": \"Abkhaz\", \"2\": \"Afar\", \"3\": \"Afrikaans\", \"4\": \"Akan\", \"5\": \"Albanian\", \"6\": \"Amharic\", \"7\": \"Arabic\", \"8\": \"Aragonese\", \"9\": \"Armenian\", \"10\": \"Assamese\", \"11\": \"Avaric\", \"12\": \"Avestan\", \"13\": \"Aymara\", \"14\": \"Azerbaijani\", \"15\": \"Bambara\", \"16\": \"Bashkir\", \"17\": \"Basque\", \"18\": \"Belarusian\", \"19\": \"Bengali\", \"20\": \"Bihari\", \"21\": \"Bislama\", \"22\": \"Bosnian\", \"23\": \"Breton\", \"24\": \"Bulgarian\", \"25\": \"Burmese\", \"26\": \"Catalan- Valencian\", \"27\": \"Chamorro\", \"28\": \"Chechen\", \"29\": \"Chichewa- Chewa- Nyanja\", \"30\": \"Chinese\", \"31\": \"Chuvash\", \"32\": \"Cornish\", \"33\": \"Corsican\", \"34\": \"Cree\", \"35\": \"Croatian\", \"36\": \"Czech\", \"37\": \"Danish\", \"38\": \"Divehi- Dhivehi- Maldivian-\", \"39\": \"Dutch\", \"40\": \"English\", \"41\": \"Esperanto\", \"42\": \"Estonian\", \"43\": \"Ewe\", \"44\": \"Faroese\", \"45\": \"Fijian\", \"46\": \"Finnish\", \"47\": \"French\", \"48\": \"Fula- Fulah- Pulaar- Pular\", \"49\": \"Galician\", \"50\": \"Georgian\", \"51\": \"German\", \"52\": \"Greek, Modern\", \"53\": \"Guaraní\", \"54\": \"Gujarati\", \"55\": \"Haitian- Haitian Creole\", \"56\": \"Hausa\", \"57\": \"Hebrew (modern)\", \"58\": \"Herero\", \"59\": \"Hindi\", \"60\": \"Hiri Motu\", \"61\": \"Hungarian\", \"62\": \"Interlingua\", \"63\": \"Indonesian\", \"64\": \"Interlingue\", \"65\": \"Irish\", \"66\": \"Igbo\", \"67\": \"Inupiaq\", \"68\": \"Ido\", \"69\": \"Icelandic\", \"70\": \"Italian\", \"71\": \"Inuktitut\", \"72\": \"Japanese\", \"73\": \"Javanese\", \"74\": \"Kalaallisut, Greenlandic\", \"75\": \"Kannada\", \"76\": \"Kanuri\", \"77\": \"Kashmiri\", \"78\": \"Kazakh\", \"79\": \"Khmer\", \"80\": \"Kikuyu, Gikuyu\", \"81\": \"Kinyarwanda\", \"82\": \"Kirghiz, Kyrgyz\", \"83\": \"Komi\", \"84\": \"Kongo\", \"85\": \"Korean\", \"86\": \"Kurdish\", \"87\": \"Kwanyama, Kuanyama\", \"88\": \"Latin\", \"89\": \"Luxembourgish, Letzeburgesch\", \"90\": \"Luganda\", \"91\": \"Limburgish\", \"92\": \"Lingala\", \"93\": \"Lao\", \"94\": \"Lithuanian\", \"95\": \"Luba-Katanga\", \"96\": \"Latvian\", \"97\": \"Manx\", \"98\": \"Macedonian\", \"99\": \"Malagasy\", \"100\": \"Malay\", \"101\": \"Malayalam\", \"102\": \"Maltese\", \"103\": \"Māori\", \"104\": \"Marathi (Marāṭhī)\", \"105\": \"Marshallese\", \"106\": \"Mongolian\", \"107\": \"Nauru\", \"108\": \"Navajo, Navaho\", \"109\": \"Norwegian Bokmål\", \"110\": \"North Ndebele\", \"111\": \"Nepali\", \"112\": \"Ndonga\", \"113\": \"Norwegian Nynorsk\", \"114\": \"Norwegian\", \"115\": \"Nuosu\", \"116\": \"South Ndebele\", \"117\": \"Occitan\", \"118\": \"Ojibwe, Ojibwa\", \"119\": \"Old Church Slavonic\", \"120\": \"Oromo\", \"121\": \"Oriya\", \"122\": \"Ossetian, Ossetic\", \"123\": \"Panjabi, Punjabi\", \"124\": \"Pāli\", \"125\": \"Persian\", \"126\": \"Polish\", \"127\": \"Pashto, Pushto\", \"128\": \"Portuguese\", \"129\": \"Quechua\", \"130\": \"Romansh\", \"131\": \"Kirundi\", \"132\": \"Romanian\", \"133\": \"Russian\", \"134\": \"Sanskrit (Saṁskṛta)\", \"135\": \"Sardinian\", \"136\": \"Sindhi\", \"137\": \"Northern Sami\", \"138\": \"Samoan\", \"139\": \"Sango\", \"140\": \"Serbian\", \"141\": \"Scottish Gaelic- Gaelic\", \"142\": \"Shona\", \"143\": \"Sinhala, Sinhalese\", \"144\": \"Slovak\", \"145\": \"Slovene\", \"146\": \"Somali\", \"147\": \"Southern Sotho\", \"148\": \"Spanish- Castilian\", \"149\": \"Sundanese\", \"150\": \"Swahili\", \"151\": \"Swati\", \"152\": \"Swedish\", \"153\": \"Tamil\", \"154\": \"Telugu\", \"155\": \"Tajik\", \"156\": \"Thai\", \"157\": \"Tigrinya\", \"158\": \"Tibetan Standard, Tibetan, Central\", \"159\": \"Turkmen\", \"160\": \"Tagalog\", \"161\": \"Tswana\", \"162\": \"Tonga (Tonga Islands)\", \"163\": \"Turkish\", \"164\": \"Tsonga\", \"165\": \"Tatar\", \"166\": \"Twi\", \"167\": \"Tahitian\", \"168\": \"Uighur, Uyghur\", \"169\": \"Ukrainian\", \"170\": \"Urdu\", \"171\": \"Uzbek\", \"172\": \"Venda\", \"173\": \"Vietnamese\", \"174\": \"Volapük\", \"175\": \"Walloon\", \"176\": \"Welsh\", \"177\": \"Wolof\", \"178\": \"Western Frisian\", \"179\": \"Xhosa\", \"180\": \"Yiddish\", \"181\": \"Yoruba\", \"182\": \"Zhuang, Chuang\", \"183\": \"Other\"}', '2023-04-18 09:06:36', '2023-05-19 09:31:59'),
(8, 'Category_type', '{\"1\": \"Factory\", \"8\": \"Hospital\", \"9\": \"Hotel\"}', '2023-05-15 11:27:47', '2023-05-22 05:45:25'),
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
(4, 2, 2, 'Pending', '2023-05-22', 1, '2023-05-22 12:37:12', '2023-05-22 12:37:12');

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
(2, 1, 'Super-Admin', 'added_new_job', 1, 'A new job with title-Delivery boy has been added successfully', 1, '2023-05-20 11:13:38', '2023-05-22 07:10:41'),
(3, 1, 'company', 'applied_on_job', 1, 'A new user applied on job with title - Delivery boy', 0, '2023-05-20 11:28:10', '2023-05-20 11:28:10'),
(4, 1, 'Super-Admin', 'applied_on_job', 1, 'A new user applied on job with title - Delivery boy', 1, '2023-05-20 11:28:10', '2023-05-22 07:06:48'),
(5, 2, 'company', 'added_new_job', 2, 'A new job with title-Delivery boy has been added successfully', 0, '2023-05-20 11:34:07', '2023-05-20 11:34:07'),
(6, 1, 'Super-Admin', 'added_new_job', 2, 'A new job with title-Delivery boy has been added successfully', 1, '2023-05-20 11:34:07', '2023-05-22 07:06:08'),
(7, 1, 'employee', 'interview_scheduled', 2, 'hello, Shayam mohan you have interview scheduled on 2023-05-22 for job with title - Delivery boy you have applied on, scheduled with Sanchi', 0, '2023-05-20 11:36:36', '2023-05-20 11:36:36'),
(8, 1, 'Super-Admin', 'interview_scheduled', 2, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-22 for job title Delivery boy posted by company Sanchi', 1, '2023-05-20 11:36:36', '2023-05-22 07:03:47'),
(9, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-23 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-20 11:43:33', '2023-05-20 11:43:33'),
(10, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-23 for job title Delivery boy posted by company Amul ', 1, '2023-05-20 11:43:33', '2023-05-22 07:06:10'),
(11, 3, 'company', 'added_new_job', 3, 'A new job with title-Shop worker has been added successfully', 0, '2023-05-20 12:08:20', '2023-05-20 12:08:20'),
(12, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-23 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 04:17:53', '2023-05-22 04:17:53'),
(13, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-23 for job title Delivery boy posted by company Amul ', 1, '2023-05-22 04:17:53', '2023-05-22 07:07:41'),
(14, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-23 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 04:18:07', '2023-05-22 04:18:07'),
(15, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-23 for job title Delivery boy posted by company Amul ', 1, '2023-05-22 04:18:07', '2023-05-22 07:10:36'),
(16, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-27 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 04:19:09', '2023-05-22 04:19:09'),
(17, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-27 for job title Delivery boy posted by company Amul ', 0, '2023-05-22 04:19:09', '2023-05-22 04:19:09'),
(18, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-28 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 04:24:30', '2023-05-22 04:24:30'),
(19, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-28 for job title Delivery boy posted by company Amul ', 0, '2023-05-22 04:24:30', '2023-05-22 04:24:30'),
(20, 1, 'employee', 'interview_scheduled', 1, 'hello, Shayam mohan you have interview scheduled on 2023-05-29 for job with title - Delivery boy you have applied on, scheduled with Amul ', 0, '2023-05-22 05:08:51', '2023-05-22 05:08:51'),
(21, 1, 'Super-Admin', 'interview_scheduled', 1, 'A new interview scheduled of candidate Shayam mohan on date 2023-05-29 for job title Delivery boy posted by company Amul ', 0, '2023-05-22 05:08:51', '2023-05-22 05:08:51'),
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
(44, 2, 'company', 'applied_on_job', 2, 'A new user applied on job with title - Delivery boy', 0, '2023-05-22 12:15:03', '2023-05-22 12:15:03');

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
(4, 'aashi.we2code@gmail.com', 708711, '2023-05-22 08:53:11');

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
  MODIFY `admin_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `apply_on_job`
--
ALTER TABLE `apply_on_job`
  MODIFY `apply_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `company_kyc`
--
ALTER TABLE `company_kyc`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_career`
--
ALTER TABLE `employee_career`
  MODIFY `career_id` int(251) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_education`
--
ALTER TABLE `employee_education`
  MODIFY `education_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_setting`
--
ALTER TABLE `employee_setting`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_skill`
--
ALTER TABLE `employee_skill`
  MODIFY `skill_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `company_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employer_setting`
--
ALTER TABLE `employer_setting`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `job_category`
--
ALTER TABLE `job_category`
  MODIFY `job_category_id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `job_interviews`
--
ALTER TABLE `job_interviews`
  MODIFY `id` int(51) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `list`
--
ALTER TABLE `list`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lmia`
--
ALTER TABLE `lmia`
  MODIFY `id` int(51) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(101) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
