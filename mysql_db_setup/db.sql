-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 29, 2016 at 09:11 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `educational_institutions`
--

CREATE TABLE `educational_institutions` (
  `institute_id` int(11) NOT NULL,
  `Institution` varchar(24) DEFAULT NULL,
  `2016 Rank` int(3) DEFAULT NULL,
  `Teaching Quality` decimal(3,1) DEFAULT NULL,
  `Student Experience` decimal(3,1) DEFAULT NULL,
  `Research quality` varchar(3) DEFAULT NULL,
  `Entry standards` int(3) DEFAULT NULL,
  `Graduate prospects` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `educational_institutions`
--

INSERT INTO `educational_institutions` (`institute_id`, `Institution`, `2016 Rank`, `Teaching Quality`, `Student Experience`, `Research quality`, `Entry standards`, `Graduate prospects`) VALUES
(1, 'Cambridge', 1, '83.8', '86.3', '57', 602, '89.3'),
(2, 'Oxford', 2, '83.1', '86.8', '53', 573, '87.1'),
(3, 'Imperial College', 3, '79.8', '87.8', '56', 568, '91.1'),
(4, 'St Andrews', 4, '83.2', '86.8', '40', 517, '83.3'),
(5, 'Durham', 5, '81.9', '86.7', '39', 523, '84.4'),
(6, 'Warwick', 6, '79.6', '85.0', '45', 482, '79.8'),
(7, 'Exeter', 7, '82.6', '87.7', '38', 463, '79.8'),
(8, 'Surrey', 8, '86.9', '90.3', '30', 424, '78.8'),
(9, 'LSE', 9, '72.1', '78.4', '53', 533, '78.5'),
(10, 'UCL', 10, '74.2', '81.3', '51', 502, '83.1'),
(11, 'Lancaster', 11, '82.3', '85.4', '39', 436, '82.5'),
(12, 'Bath', 12, '82.7', '87.0', '37', 479, '85.2'),
(13, 'Loughborough', 13, '84.5', '89.3', '36', 397, '83.7'),
(14, 'Leeds', 14, '83.7', '88.0', '37', 431, '78.4'),
(15, 'York', 15, '81.7', '86.6', '38', 437, '76.0'),
(16, 'Southampton', 16, '79.3', '86.5', '45', 411, '78.1'),
(17, 'Birmingham', 17, '80.8', '84.2', '37', 426, '86.7'),
(18, 'East Anglia', 18, '83.2', '88.8', '36', 408, '70.3'),
(19, 'Sussex', 19, '78.6', '85.0', '32', 386, '84.1'),
(20, 'Bristol', 20, '75.5', '81.5', '47', 487, '79.6'),
(21, 'Sheffield', 21, '81.3', '87.2', '38', 428, '75.7'),
(22, 'Edinburgh', 22, '74.5', '82.4', '44', 484, '78.6'),
(23, 'Kent', 23, '81.5', '85.4', '35', 363, '76.7'),
(24, 'Newcastle', 23, '82.0', '88.4', '38', 424, '79.1'),
(25, 'Nottingham', 25, '79.5', '83.9', '38', 428, '81.3'),
(26, 'Glasgow', 26, '80.0', '86.9', '40', 470, '79.3'),
(27, 'King''s College', 27, '73.9', '79.7', '44', 455, '85.7'),
(28, 'Leicester', 28, '77.5', '84.4', '32', 386, '72.1'),
(29, 'Manchester', 28, '79.0', '84.7', '40', 435, '78.5'),
(30, 'Aston', 30, '83.3', '87.9', '26', 369, '78.8'),
(31, 'Queen''s Belfast', 31, '81.6', '87.3', '40', 385, '78.7'),
(32, 'Reading', 32, '80.5', '85.8', '37', 373, '70.3'),
(33, 'Cardiff', 33, '80.7', '86.0', '35', 426, '80.1'),
(34, 'Queen Mary', 34, '80.5', '83.3', '38', 411, '73.3'),
(35, 'Essex', 35, '83.7', '88.0', '37', 313, '64.1'),
(36, 'Royal Holloway', 36, '82.6', '84.1', '36', 398, '62.7'),
(37, 'Dundee', 37, '84.4', '87.1', '31', 410, '80.0'),
(38, 'Buckingham', 38, '88.0', '88.4', 'n/a', 304, '83.4'),
(39, 'Heriot-Watt', 38, '80.8', '84.2', '37', 413, '78.1'),
(40, 'Liverpool', 38, '77.9', '83.4', '32', 404, '76.1'),
(41, 'City', 41, '82.7', '85.6', '21', 379, '78.9'),
(42, 'Swansea', 41, '82.6', '86.5', '34', 326, '81.4'),
(43, 'Keele', 43, '87.0', '90.2', '22', 358, '76.1'),
(44, 'SOAS', 44, '75.2', '80.8', '28', 407, '68.3'),
(45, 'Aberdeen', 45, '77.4', '83.7', '30', 446, '76.2'),
(46, 'Strathclyde', 46, '76.2', '85.6', '38', 476, '72.0'),
(47, 'Coventry', 47, '87.6', '89.3', '4', 310, '74.2'),
(48, 'St George''s', 48, '78.7', '81.6', '22', 418, '93.4'),
(49, 'Harper Adams', 49, '82.6', '89.3', '6', 331, '73.3'),
(50, 'Stirling', 50, '78.7', '82.3', '31', 375, '73.3'),
(51, 'Royal Agricultural Uni', 51, '79.3', '85.6', '1', 307, '69.7'),
(52, 'Bangor', 52, '85.8', '87.8', '27', 321, '67.7'),
(53, 'De Montfort', 53, '82.4', '84.6', '9', 307, '76.9'),
(54, 'Nottingham Trent', 54, '83.6', '85.8', '7', 310, '67.6'),
(55, 'Oxford Brookes', 55, '83.2', '85.7', '11', 348, '69.2'),
(56, 'Falmouth', 56, '83.7', '83.5', '5', 309, '74.5'),
(57, 'Ulster', 57, '82.9', '87.0', '32', 306, '63.6'),
(58, 'Bath Spa', 58, '85.8', '85.8', '8', 318, '55.1'),
(59, 'Portsmouth', 59, '83.4', '85.9', '9', 310, '66.9'),
(60, 'Brunel', 60, '78.2', '83.8', '25', 352, '63.4'),
(61, 'Norwich Arts', 61, '83.8', '83.5', '6', 357, '63.4'),
(62, 'Creative Arts', 62, '82.7', '81.5', '3', 332, '52.0'),
(63, 'Lincoln', 62, '81.1', '84.6', '10', 335, '70.7'),
(64, 'Northumbria', 64, '82.9', '85.1', '9', 363, '66.3'),
(65, 'Winchester', 64, '84.2', '85.0', '6', 307, '60.7'),
(66, 'Goldsmiths', 66, '76.6', '76.3', '33', 360, '56.0'),
(67, 'Hull', 67, '80.0', '83.8', '17', 332, '66.7'),
(68, 'Edge Hill', 68, '83.2', '83.5', '5', 319, '63.8'),
(69, 'Chichester', 69, '84.0', '85.3', '6', 310, '57.5'),
(70, 'Huddersfield', 69, '82.2', '84.0', '9', 333, '74.1'),
(71, 'Robert Gordon', 69, '80.6', '83.5', '4', 385, '83.1'),
(72, 'Sheffield Hallam', 72, '80.9', '83.9', '5', 319, '64.7'),
(73, 'West of England', 73, '80.0', '82.5', '9', 324, '70.8'),
(74, 'Liverpool John Moores', 74, '81.6', '85.0', '9', 344, '63.3'),
(75, 'Bradford', 75, '78.8', '84.4', '9', 314, '75.2'),
(76, 'Hertfordshire', 76, '78.6', '82.8', '6', 318, '75.3'),
(77, 'Manchester Metropolitan', 77, '81.0', '82.2', '8', 347, '63.0'),
(78, 'Roehampton', 78, '78.0', '79.9', '25', 286, '60.9'),
(79, 'Aberystwyth', 79, '78.4', '80.4', '28', 312, '62.5'),
(80, 'Liverpool Hope', 79, '86.8', '86.4', '9', 304, '53.9'),
(81, 'Arts, Bournemouth', 81, '81.4', '80.0', '2', 322, '61.4'),
(82, 'Bournemouth', 82, '75.2', '78.8', '9', 329, '66.4'),
(83, 'Northampton', 82, '82.3', '84.1', '3', 283, '60.7'),
(84, 'Derby', 84, '84.4', '85.3', '3', 290, '60.0'),
(85, 'Middlesex', 85, '78.7', '81.8', '10', 270, '64.9'),
(86, 'Plymouth', 85, '82.3', '84.1', '16', 312, '60.2'),
(87, 'Chester', 87, '82.7', '83.7', '4', 299, '63.6'),
(88, 'Gloucestershire', 88, '79.8', '82.6', '4', 317, '55.7'),
(89, 'York St John', 89, '82.4', '83.0', '4', 292, '65.3'),
(90, 'Brighton', 90, '78.6', '80.9', '8', 321, '66.9'),
(91, 'Leeds Trinity', 91, '83.5', '82.3', '2', 284, '65.8'),
(92, 'Central Lancashire', 92, '80.4', '83.5', '6', 315, '62.4'),
(93, 'Edinburgh Napier', 93, '80.2', '83.7', '5', 347, '69.1'),
(94, 'Glasgow Caledonian', 94, '77.0', '82.5', '7', 372, '70.2'),
(95, 'Staffordshire', 95, '81.8', '82.8', '17', 274, '58.4'),
(96, 'Queen Margaret', 96, '78.9', '82.3', '7', 341, '59.6'),
(97, 'Abertay Dundee', 97, '80.0', '83.1', '5', 338, '65.6'),
(98, 'Salford', 98, '80.1', '80.9', '8', 334, '59.5'),
(99, 'Arts, London', 99, '75.9', '74.5', '8', 320, '59.2'),
(100, 'St Mary''s, Twickenham', 100, '80.5', '84.8', '4', 289, '66.7'),
(101, 'Worcester', 100, '81.4', '84.5', '4', 301, '63.9'),
(102, 'Teesside', 102, '82.9', '84.3', '4', 306, '59.8'),
(103, 'Cardiff Metropolitan', 103, '79.1', '81.8', '4', 317, '59.8'),
(104, 'Sunderland', 104, '82.5', '84.2', '6', 294, '62.3'),
(105, 'Birmingham City', 105, '78.0', '79.3', '4', 300, '64.8'),
(106, 'Greenwich', 106, '79.2', '82.4', '5', 315, '58.2'),
(107, 'Canterbury Christ Church', 107, '80.7', '81.9', '5', 279, '57.8'),
(108, 'Anglia Ruskin', 108, '82.5', '83.9', '5', 254, '65.0'),
(109, 'Buckinghamshire New', 109, '81.5', '81.1', '2', 257, '57.6'),
(110, 'Bedfordshire', 110, '80.4', '82.7', '7', 229, '58.3'),
(111, 'Kingston', 111, '76.1', '79.9', '5', 299, '60.7'),
(112, 'Bishop Grosseteste', 112, '80.9', '80.6', '2', 284, '69.1'),
(113, 'South Wales', 112, '77.5', '78.3', '4', 322, '59.0'),
(114, 'Leeds Beckett', 114, '78.5', '82.7', '4', 288, '58.5'),
(115, 'Newman, Birmingham', 115, '83.1', '84.6', '3', 293, '54.6'),
(116, 'Southampton Solent', 115, '79.5', '82.1', '1', 276, '54.6'),
(117, 'Westminster', 115, '72.9', '80.6', '10', 311, '55.1'),
(118, 'West of Scotland', 118, '81.8', '81.8', '4', 305, '65.7'),
(119, 'Cumbria', 119, '76.9', '77.6', '1', 299, '64.9'),
(120, 'London South Bank', 120, '77.0', '81.3', '9', 248, '67.9'),
(121, 'West London', 121, '76.9', '77.5', '2', 259, '60.5'),
(122, 'Glyndŵr', 122, '80.5', '79.3', '2', 257, '66.3'),
(123, 'Bolton', 123, '81.6', '80.8', '3', 287, '60.1'),
(124, 'UCP Marjon', 123, '76.3', '77.3', 'n/a', 319, '60.4'),
(125, 'London Metropolitan', 125, '76.0', '78.6', '4', 239, '47.7'),
(126, 'Highlands and Islands', 126, '78.8', '76.5', 'n/a', 272, '56.0'),
(127, 'Bolton', 127, '81.6', '80.8', '3', 287, '60.1');

-- --------------------------------------------------------

--
-- Table structure for table `institute_qualification`
--

CREATE TABLE `institute_qualification` (
  `fk_institute_id` int(11) NOT NULL,
  `fk_qualification_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(100) NOT NULL,
  `job_description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qualifications`
--

CREATE TABLE `qualifications` (
  `qualification_id` int(11) NOT NULL,
  `qualification_name` varchar(124) DEFAULT NULL,
  `short_title` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qualifications`
--

INSERT INTO `qualifications` (`qualification_id`, `qualification_name`, `short_title`) VALUES
(2, 'Bachelor of Science (Hons) in Combined Studies', 'BSc Combined Studies'),
(3, 'Bachelor of Science in Combined Studies', 'BSc Combined Studies'),
(4, 'Doctor of Philosophy', 'PhD Physics'),
(5, 'Bachelor of Science (Hons) in Chemistry', 'BSc (Hons) Chemistry'),
(8, 'Master of Science in Malting and Brewing', 'MSc in Malt & Brew'),
(13, 'Doctor of Philosophy', 'PhD Chemical Eng'),
(14, 'Master of Philosophy', 'MPhil Building'),
(231, 'Bachelor of Science in Chemistry with Pharmaceutical Chemistry', 'BSc Chemistry with Pharm Chem'),
(232, 'Master of Chemistry in Chemistry with Pharmaceutical Chemistry', 'MChem Chemistry w Pharm Chem'),
(1195, 'Master of Science in Housing Studies (Asia Pacific)', 'MSc Housing Studies AP'),
(1196, 'Postgraduate Certificate in Real Estate Investment and Finance', 'PgCert Real Est Invest & Fin'),
(1197, 'Postgraduate Diploma in Real Estate Investment and Finance', 'PgDip Real Est Invest & Fin'),
(1198, 'Master of Science in Real Estate Investment and Finance', 'MSc Real Est Invest & Fin'),
(1241, 'Bachelor of Arts in Fashion Design for Industry', 'BA Fashion Design for Industry'),
(1242, 'Bachelor of Science in Textiles and Fashion Design Management', 'BSc Tex & Fashion Des Mgt'),
(1243, 'Bachelor of Science in Clothing Design and Manufacture', 'BSc Clothing Design & Manu'),
(1246, 'Associate Student in Design for Textiles (Weave)', 'Associate Student in D & T (W)'),
(1251, 'Master of Science in Ethics in Fashion (Consumerism, Communication and Sustainability)', 'MSc Ethics in Fashion (CCS)'),
(1252, 'Postgraduate Diploma in Ethics in Fashion (Consumerism, Communication and Sustainability)', 'PgDip Ethics in Fashion (CCS)'),
(1257, 'Textiles and Design Exchange Student', 'Textiles & Design Ex Student'),
(1269, 'Bachelor of Arts in Fashion', 'BA in Fashion'),
(1270, 'Bachelor of Arts in Fashion Womenswear', 'BA in Fashion Womenswear'),
(1278, 'Bachelor of Arts in Fashion Design', 'BA in Fashion Design'),
(1331, 'Bachelor of Science in Mathematics with Computer Science', 'BSc Mathematics with Comp Sc'),
(1340, 'Postgraduate Certificate in Computational Mathematics', 'PgCert Computational Maths');

-- --------------------------------------------------------

--
-- Table structure for table `qualification_subject`
--

CREATE TABLE `qualification_subject` (
  `fk_qualification_id` int(11) NOT NULL,
  `fk_subject_id` int(11) NOT NULL,
  `grade` enum('A','B','C','D','E','F') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request_pending`
--

CREATE TABLE `request_pending` (
  `fk_sender_user_id` int(11) NOT NULL,
  `fk_acceptor_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(50) NOT NULL,
  `skill_description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `subject_description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `subject_description`) VALUES
(1, 'Accounting & Finance', ''),
(2, 'Art & Design', ''),
(3, 'Biological Sciences', ''),
(4, 'Building', ''),
(5, 'Business Studies', ''),
(6, 'Chemical Engineering', ''),
(7, 'Chemistry', ''),
(8, 'Civil Engineering', ''),
(9, 'Computer Science', ''),
(10, 'Economics', ''),
(11, 'Electrical & Electronic Engineering', ''),
(12, 'Food Science', ''),
(13, 'French', ''),
(14, 'General Engineering', ''),
(15, 'German', ''),
(16, 'Iberian Languages', ''),
(17, 'Law', ''),
(18, 'Mathematics', ''),
(19, 'Mechanical Engineering', ''),
(20, 'Physics', ''),
(21, 'Astronomy', ''),
(22, 'Psycology', ''),
(23, 'Sports Science', ''),
(24, 'Town & Country Plan & Landscape', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_username` varchar(15) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_email` varchar(20) NOT NULL,
  `user_valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_username`, `user_password`, `user_email`, `user_valid`) VALUES
(2, 'username', '$2y$10$/NGeamAqSZo/OLKgsOf6Huv40QE9wkgoAnTFYEJuzlQapRzKchaK2', 'username@email.com', 0),
(3, 'saeed', 'anything', 'bkcwewl', 0),
(4, 'username2', '$2y$10$ooXw.0KFr0PF0kwU9Keni.gN.kcGuOcepvc0f5UkI5i5.hol4PUt.', 'username2@gmail.com', 0),
(5, 'username3', '$2y$10$kLeethvv8Xq2wYkeokoWv.asoanGrH0zyXicBuGQoaXZawP31sduu', 'username3@gmail.com', 0),
(6, 'balraj', '$2y$10$hkntwdU7sexv3dYcBrAJFuyltxb93u2UqriU/X3fs6QzJhDhijRcG', 'balraj@gmail.com', 0),
(7, 'tats', '$2y$10$uljwLiFlbg66CoPl9iUQIeF4yAv6F5ERtsasuLhkFAsr6Vl1WmqBm', 'tats@gmail.com', 0),
(8, 'hani', '$2y$10$AyP95p0hJoh3alCG7GJepOxQ/8z11IdP3nkT/Y.Kek7cCegyWsMly', 'h.ragabhassen@hw.ac.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `userdetail`
--

CREATE TABLE `userdetail` (
  `userDetail_id` int(11) NOT NULL,
  `userDetail_firstName` varchar(30) NOT NULL,
  `userDetail_lastName` varchar(30) NOT NULL,
  `userDetail_profilePicture` varchar(64) NOT NULL,
  `userDetail_DOB` date NOT NULL,
  `userDetail_minQualification` enum('School','High School','Bachelor','Masters','PhD') NOT NULL,
  `userDetail_nationality` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdetail`
--

INSERT INTO `userdetail` (`userDetail_id`, `userDetail_firstName`, `userDetail_lastName`, `userDetail_profilePicture`, `userDetail_DOB`, `userDetail_minQualification`, `userDetail_nationality`) VALUES
(2, 'user', 'name', '', '2016-03-24', 'Bachelor', 'albanian'),
(4, 'Von', 'Eric', '', '2016-03-16', 'School', 'french'),
(5, 'Bart', 'Simpson', '', '2013-06-17', 'Bachelor', 'american'),
(6, 'Balraj', 'Bains', '', '1994-11-02', 'Bachelor', 'indian'),
(8, 'Hani', 'Mee', '', '1981-03-27', 'PhD', 'afghan');

-- --------------------------------------------------------

--
-- Table structure for table `userMentor`
--

CREATE TABLE `userMentor` (
  `fk_mentor_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_qualification`
--

CREATE TABLE `user_qualification` (
  `user_qualification_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_qualification_id` int(11) NOT NULL,
  `overallGrade` enum('A','B','C','D','E','F') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_qualification`
--

INSERT INTO `user_qualification` (`user_qualification_id`, `fk_user_id`, `fk_qualification_id`, `overallGrade`) VALUES
(1, 2, 2, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `user_school_qualification`
--

CREATE TABLE `user_school_qualification` (
  `id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `school_name` text NOT NULL,
  `grad_year` date NOT NULL,
  `qualification` enum('GCSE or similar','AS levels or similar','A levels or similar','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_school_qualification`
--

INSERT INTO `user_school_qualification` (`id`, `fk_user_id`, `school_name`, `grad_year`, `qualification`) VALUES
(2, 2, 'Cambridge School', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_school_qualification_subjects`
--

CREATE TABLE `user_school_qualification_subjects` (
  `fk_user_school_qualification_id` int(11) NOT NULL,
  `fk_subject_id` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_school_qualification_subjects`
--

INSERT INTO `user_school_qualification_subjects` (`fk_user_school_qualification_id`, `fk_subject_id`, `score`) VALUES
(2, 3, 50);

-- --------------------------------------------------------

--
-- Table structure for table `user_skill`
--

CREATE TABLE `user_skill` (
  `userSkill_id` int(11) NOT NULL,
  `userSkill_fk_user_id` int(11) NOT NULL,
  `userSkill_fk_skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workexperience`
--

CREATE TABLE `workexperience` (
  `workExperience_id` int(11) NOT NULL,
  `workExperience_fk_user_id` int(11) NOT NULL,
  `workExperience_fk_job_id` int(11) NOT NULL,
  `workExperience_startDate` date NOT NULL,
  `workExperience_endDate` date NOT NULL,
  `workExperience_position` varchar(50) NOT NULL,
  `workExperience_salary` decimal(65,30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `educational_institutions`
--
ALTER TABLE `educational_institutions`
  ADD PRIMARY KEY (`institute_id`);

--
-- Indexes for table `institute_qualification`
--
ALTER TABLE `institute_qualification`
  ADD KEY `FK_myKey11` (`fk_institute_id`),
  ADD KEY `FK_myKey12` (`fk_qualification_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`qualification_id`);

--
-- Indexes for table `qualification_subject`
--
ALTER TABLE `qualification_subject`
  ADD KEY `FK_myKey8` (`fk_subject_id`),
  ADD KEY `FK_myKey13` (`fk_qualification_id`);

--
-- Indexes for table `request_pending`
--
ALTER TABLE `request_pending`
  ADD UNIQUE KEY `fk_sender_user_id` (`fk_sender_user_id`,`fk_acceptor_user_id`),
  ADD KEY `acceptor id` (`fk_acceptor_user_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `userdetail`
--
ALTER TABLE `userdetail`
  ADD PRIMARY KEY (`userDetail_id`);

--
-- Indexes for table `userMentor`
--
ALTER TABLE `userMentor`
  ADD UNIQUE KEY `userMentor_mentor_fk_user_id` (`fk_mentor_id`),
  ADD UNIQUE KEY `userMentor_user_fk_user_id` (`fk_user_id`);

--
-- Indexes for table `user_qualification`
--
ALTER TABLE `user_qualification`
  ADD PRIMARY KEY (`user_qualification_id`),
  ADD KEY `FK_myKey5` (`fk_user_id`),
  ADD KEY `FK_myKey10` (`fk_qualification_id`);

--
-- Indexes for table `user_school_qualification`
--
ALTER TABLE `user_school_qualification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_school_qualification_subjects`
--
ALTER TABLE `user_school_qualification_subjects`
  ADD UNIQUE KEY `fk_user_school_qualification_id` (`fk_user_school_qualification_id`),
  ADD KEY `fk_subject_id` (`fk_subject_id`);

--
-- Indexes for table `user_skill`
--
ALTER TABLE `user_skill`
  ADD PRIMARY KEY (`userSkill_id`),
  ADD KEY `FK_myKey` (`userSkill_fk_user_id`),
  ADD KEY `FK_myKey2` (`userSkill_fk_skill_id`);

--
-- Indexes for table `workexperience`
--
ALTER TABLE `workexperience`
  ADD PRIMARY KEY (`workExperience_id`),
  ADD KEY `FK_myKey3` (`workExperience_fk_job_id`),
  ADD KEY `FK_myKey4` (`workExperience_fk_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `educational_institutions`
--
ALTER TABLE `educational_institutions`
  MODIFY `institute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `qualification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1341;
--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `userdetail`
--
ALTER TABLE `userdetail`
  MODIFY `userDetail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user_qualification`
--
ALTER TABLE `user_qualification`
  MODIFY `user_qualification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_school_qualification`
--
ALTER TABLE `user_school_qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_skill`
--
ALTER TABLE `user_skill`
  MODIFY `userSkill_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `workexperience`
--
ALTER TABLE `workexperience`
  MODIFY `workExperience_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `institute_qualification`
--
ALTER TABLE `institute_qualification`
  ADD CONSTRAINT `FK_myKey11` FOREIGN KEY (`fk_institute_id`) REFERENCES `educational_institutions` (`institute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_myKey12` FOREIGN KEY (`fk_qualification_id`) REFERENCES `qualifications` (`qualification_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `qualification_subject`
--
ALTER TABLE `qualification_subject`
  ADD CONSTRAINT `FK_myKey13` FOREIGN KEY (`fk_qualification_id`) REFERENCES `qualifications` (`qualification_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_myKey8` FOREIGN KEY (`fk_subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request_pending`
--
ALTER TABLE `request_pending`
  ADD CONSTRAINT `acceptor id` FOREIGN KEY (`fk_acceptor_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sender id` FOREIGN KEY (`fk_sender_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userdetail`
--
ALTER TABLE `userdetail`
  ADD CONSTRAINT `userdetail_ibfk_1` FOREIGN KEY (`userDetail_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_qualification`
--
ALTER TABLE `user_qualification`
  ADD CONSTRAINT `FK_myKey10` FOREIGN KEY (`fk_qualification_id`) REFERENCES `qualifications` (`qualification_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_myKey5` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_school_qualification`
--
ALTER TABLE `user_school_qualification`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_school_qualification_subjects`
--
ALTER TABLE `user_school_qualification_subjects`
  ADD CONSTRAINT `fk_subject_id` FOREIGN KEY (`fk_subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_user_school_qualification_id` FOREIGN KEY (`fk_user_school_qualification_id`) REFERENCES `user_school_qualification` (`id`);

--
-- Constraints for table `user_skill`
--
ALTER TABLE `user_skill`
  ADD CONSTRAINT `FK_myKey` FOREIGN KEY (`userSkill_fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_myKey2` FOREIGN KEY (`userSkill_fk_skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workexperience`
--
ALTER TABLE `workexperience`
  ADD CONSTRAINT `FK_myKey3` FOREIGN KEY (`workExperience_fk_job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_myKey4` FOREIGN KEY (`workExperience_fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
