-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2016 at 08:03 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

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
-- Table structure for table `jobs`
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
-- Table structure for table `mentorcommentdb`
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
-- Table structure for table `qualificationdb`
--

CREATE TABLE `qualificationDB` (
  `qualification_id` int(11) NOT NULL,
  `qualification_name` varchar(50) NOT NULL,
  `qualification_description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qualification_subject`
--

CREATE TABLE `qualificationSubjectDB` (
  `qualificationSubject_id` int(11) NOT NULL,
  `qualificationSubject_fk_qualification_id` int(11) NOT NULL,
  `QualificationSubject_fk_subject_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skilldb`
--

CREATE TABLE `skillDB` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(50) NOT NULL,
  `skill_description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subjectdb`
--

CREATE TABLE `subjectDB` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `subject_description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `university`
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
-- Table structure for table `university_qualification`
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

CREATE TABLE `userDB` (
  `user_id` int(11) NOT NULL,
  `user_username` varchar(50) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userdetaildb`
--

CREATE TABLE `userDetailDB` (
  `userDetail_id` int(11) NOT NULL,
  `userDetail_firstName` varchar(50) NOT NULL,
  `userDetail_lastName` varchar(50) NOT NULL,
  `userDetail_profilePicture` date NOT NULL,
  `userDetail_nationality` enum('UK','USA','ASIA','AFRICA','this is not how its done') NOT NULL,
  `userDetail_age` int(11) NOT NULL,
  `userDetail_occupation` enum('High School Student','College Student','Employed','Unemployed') NOT NULL,
  `userDetail_gpa` decimal(3,2)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usergradedb`
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
-- Table structure for table `usermentordb`
--

CREATE TABLE `usermentorDB` (
  `userMentor_id` int(11) NOT NULL,
  `userMentor_mentor_fk_userDetail_id` int(11) NOT NULL,
  `userMentor_user_fk_userDetail_id` int(11) NOT NULL,
  `userMentor_valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userqualificationdb`
--

CREATE TABLE `userQualificationDB` (
  `userQualification_id` int(11) NOT NULL,
  `userQualification_fk_userDetail_id` int(11) NOT NULL,
  `userQualification_fk_qualification_id` int(11) NOT NULL,
  `userQualification_overallGrade` enum('A (or more than A)','B','C','D','E','less than E') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userskilldb`
--

CREATE TABLE `userskillDB` (
  `userSkill_id` int(11) NOT NULL,
  `userSkill_fk_userDetail_id` int(11) NOT NULL,
  `userSkill_fk_skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_subject`
--

CREATE TABLE `userSubjectDB` (
  `userSubject_id` int(11) NOT NULL,
  `userDetail_id_fk` int(11) NOT NULL,
  `subject_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workexp`
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
ALTER TABLE `userDB`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `userdb`
--
ALTER TABLE `userdb`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
