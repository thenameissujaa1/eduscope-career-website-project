-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 28, 2016 at 08:05 AM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eduscope`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobDB`
--

CREATE TABLE `jobDB` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `job_description` varchar(250) NOT NULL,
  `job_fk_qualification_id` int(11) NOT NULL,
  `job_fk_skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mentorCommentDB`
--

CREATE TABLE `mentorCommentDB` (
  `mentorComment_id` int(11) NOT NULL,
  `mentorComment_fk_userMentor_id` int(11) NOT NULL,
  `mentorComment_userDetail_id` int(11) NOT NULL,
  `mentorComment_comment` varchar(5) NOT NULL,
  `mentorComment_like` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qualificationDB`
--

CREATE TABLE `qualificationDB` (
  `qualification_id` int(11) NOT NULL,
  `qualification_name` varchar(50) NOT NULL,
  `qualification_description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qualificationSubjectDB`
--

CREATE TABLE `qualificationSubjectDB` (
  `qualificationSubject_id` int(11) NOT NULL,
  `qualificationSubject_fk_qualification_id` int(11) NOT NULL,
  `QualificationSubject_fk_subject_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skillDB`
--

CREATE TABLE `skillDB` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(50) NOT NULL,
  `skill_description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subjectDB`
--

CREATE TABLE `subjectDB` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `subject_description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `universityDB`
--

CREATE TABLE `universityDB` (
  `university_id` int(11) NOT NULL,
  `university_name` varchar(50) NOT NULL,
  `university_description` varchar(250) NOT NULL,
  `univserity_fk_subject_id` int(11) NOT NULL,
  `university_gpa` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `universityQualificationDB`
--

CREATE TABLE `universityQualificationDB` (
  `universityQualification_id` int(11) NOT NULL,
  `universityQualifcation_fk_university_id` int(11) NOT NULL,
  `qualification_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userdb`
--

CREATE TABLE `userdb` (
  `user_id` int(11) NOT NULL,
  `user_username` varchar(50) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdb`
--

INSERT INTO `userdb` (`user_id`, `user_username`, `user_password`, `user_email`, `user_valid`) VALUES
(1, 'username', '$2y$10$3VIZiLjfvr.4NMsUndrykOHim0Uxw.3EG8cIHNcQqEC81lodZzKce', 'username@gmail.com', 0),
(2, 'username2', '$2y$10$WI1l.9p3fuqfA44KjVxz1.LUp52jqcFtjGmUYI2dJFVbEcxyZ6e5C', 'username2@gmail.com', 0),
(3, 'username3', '$2y$10$xkj.FOCPxe8jaO7Wbw7qz.o0E7m1PK5h6sS8CxBc1Hc.S9AddPTKG', 'username3@gmail.com', 0),
(4, 'username4', '$2y$10$rpXFBcLOL4RZ.OzLTiqGFO7jZKXWJRkCYCAUsj4BFfm5bBLTZdmLu', 'username4@gmail.com', 0),
(5, 'username5', '$2y$10$2l1oroSa86L6BoQ1yCBKZOqX.21ZKNgiU6THR5RirJ9mtfyFOVfJC', 'username5@gmail.com', 0),
(6, 'username6', '$2y$10$NEe8Z4S9uHyEluTUzW7Qw.6JAc/Xi3qBLirEwjOT2lJH8Id68GbIW', 'username6@gmail.com', 0),
(7, 'username7', '$2y$10$45YDkiFyVR9ccaLMld2edOS5A42DpgrI6Fizy5YlVaZ4Ko5f4ZZGu', 'username7@gmail.com', 0),
(8, 'rsureen', '$2y$10$yYo2zYMRJ375UHMJ1Qcbz.QC7I8.ZOzSI/o4ZSD/jMUQIclPBQPri', 'rsureen@yahoo.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `userDetailDB`
--

CREATE TABLE `userDetailDB` (
  `userDetail_id` int(11) NOT NULL,
  `userDetail_firstName` text NOT NULL,
  `userDetail_lastName` text NOT NULL,
  `userDetail_nationality` text NOT NULL,
  `userDetail_status` enum('High School Student','Under Graduate Student','Post Graduate Student','Unemployed','Employed') NOT NULL,
  `userDetail_fk_user_id` int(11) NOT NULL,
  `userDetail_dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userDetailDB`
--

INSERT INTO `userDetailDB` (`userDetail_id`, `userDetail_firstName`, `userDetail_lastName`, `userDetail_nationality`, `userDetail_status`, `userDetail_fk_user_id`, `userDetail_dob`) VALUES
(1, 'aCOOL', 'asds', 'algerian', 'Under Graduate Student', 1, '2016-02-03');

-- --------------------------------------------------------

--
-- Table structure for table `userGradeDB`
--

CREATE TABLE `userGradeDB` (
  `userGrade_id` int(11) NOT NULL,
  `userGrade_fk_userQualification_id` int(11) NOT NULL,
  `userGrade_fk_userDetail_id` int(11) NOT NULL,
  `userGrade_fk_subject_id` int(11) NOT NULL,
  `userGrade_grade` enum('A (or more than A)','B','C','D','E','less than E') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usermentorDB`
--

CREATE TABLE `usermentorDB` (
  `userMentor_id` int(11) NOT NULL,
  `userMentor_mentor_fk_userDetail_id` int(11) NOT NULL,
  `userMentor_user_fk_userDetail_id` int(11) NOT NULL,
  `userMentor_valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userQualificationDB`
--

CREATE TABLE `userQualificationDB` (
  `userQualification_id` int(11) NOT NULL,
  `userQualification_fk_userDetail_id` int(11) NOT NULL,
  `userQualification_fk_qualification_id` int(11) NOT NULL,
  `userQualification_overallGrade` enum('A (or more than A)','B','C','D','E','less than E') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userskillDB`
--

CREATE TABLE `userskillDB` (
  `userSkill_id` int(11) NOT NULL,
  `userSkill_fk_userDetail_id` int(11) NOT NULL,
  `userSkill_fk_skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userSubjectDB`
--

CREATE TABLE `userSubjectDB` (
  `userSubject_id` int(11) NOT NULL,
  `userDetail_id_fk` int(11) NOT NULL,
  `subject_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workExpDB`
--

CREATE TABLE `workExpDB` (
  `workExp_id` int(11) NOT NULL,
  `workExp_fk_userDetail_id` int(11) NOT NULL,
  `workExp_fk_job_id` int(11) NOT NULL,
  `workExp_startDate` date NOT NULL,
  `workExp_endDate` date NOT NULL,
  `workExp_position` varchar(150) NOT NULL,
  `workExp_salary` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `userdb`
--
ALTER TABLE `userdb`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `userDetailDB`
--
ALTER TABLE `userDetailDB`
  ADD PRIMARY KEY (`userDetail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `userdb`
--
ALTER TABLE `userdb`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `userDetailDB`
--
ALTER TABLE `userDetailDB`
  MODIFY `userDetail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
