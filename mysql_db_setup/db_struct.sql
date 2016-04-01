-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 01, 2016 at 02:13 PM
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
-- Table structure for table `case_study`
--

CREATE TABLE `case_study` (
  `id` int(11) NOT NULL,
  `fk_qualification_id` int(11) NOT NULL,
  `company_name` text NOT NULL,
  `company_location` text NOT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  `fk_job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext,
  `fk_subject_id` int(11) NOT NULL,
  `est_salary` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qualifications`
--

CREATE TABLE `qualifications` (
  `id` int(11) NOT NULL,
  `name` varchar(124) DEFAULT NULL,
  `short_title` varchar(32) DEFAULT NULL,
  `type` text NOT NULL,
  `fk_subject_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `subject_description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `id` int(11) NOT NULL,
  `name` varchar(24) DEFAULT NULL,
  `2016 Rank` int(3) DEFAULT NULL,
  `Teaching Quality` decimal(3,1) DEFAULT NULL,
  `Student Experience` decimal(3,1) DEFAULT NULL,
  `Research quality` varchar(3) DEFAULT NULL,
  `Entry standards` int(3) DEFAULT NULL,
  `Graduate prospects` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `university_requirements`
--

CREATE TABLE `university_requirements` (
  `fk_unversity_id` int(11) NOT NULL,
  `fk_subject_id` int(11) NOT NULL,
  `entryPoints` int(11) NOT NULL,
  `subjectRanking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `user_jobs`
--

CREATE TABLE `user_jobs` (
  `fk_user_id` int(11) NOT NULL,
  `fk_job_id` int(11) NOT NULL,
  `company_name` text NOT NULL,
  `company_location` text NOT NULL,
  `salary` decimal(10,0) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_school_qualification`
--

CREATE TABLE `user_school_qualification` (
  `id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `school_name` text NOT NULL,
  `grad_year` year(4) NOT NULL,
  `qualification` enum('GCSE/S4','AS Levels','A Levels','Scottish Highers','Advance Scottish Highers') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_school_qualification_subjects`
--

CREATE TABLE `user_school_qualification_subjects` (
  `fk_user_school_qualification_id` int(11) NOT NULL,
  `fk_subject_id` int(11) NOT NULL,
  `score` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `user_subject_score`
--

CREATE TABLE `user_subject_score` (
  `fk_user_id` int(11) NOT NULL,
  `fk_subject_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `universities` int(11) NOT NULL,
  `jobs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_uni_qualification`
--

CREATE TABLE `user_uni_qualification` (
  `fk_user_id` int(11) NOT NULL,
  `fk_qualification_id` int(11) NOT NULL,
  `fk_uni_id` int(11) NOT NULL,
  `grad_year` year(4) NOT NULL
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
-- Indexes for table `case_study`
--
ALTER TABLE `case_study`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`fk_qualification_id`,`fk_job_id`),
  ADD KEY `qualifications` (`fk_qualification_id`),
  ADD KEY `jobs` (`fk_job_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`fk_subject_id`),
  ADD KEY `subjects` (`fk_subject_id`);

--
-- Indexes for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_subject_id` (`fk_subject_id`);

--
-- Indexes for table `request_pending`
--
ALTER TABLE `request_pending`
  ADD UNIQUE KEY `fk_sender_user_id` (`fk_sender_user_id`,`fk_acceptor_user_id`),
  ADD KEY `acceptor id` (`fk_acceptor_user_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `user_jobs`
--
ALTER TABLE `user_jobs`
  ADD UNIQUE KEY `fk_user_id` (`fk_user_id`,`fk_job_id`,`start_date`),
  ADD KEY `job` (`fk_job_id`);

--
-- Indexes for table `user_school_qualification`
--
ALTER TABLE `user_school_qualification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_user_id_2` (`fk_user_id`,`qualification`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `user_school_qualification_subjects`
--
ALTER TABLE `user_school_qualification_subjects`
  ADD UNIQUE KEY `fk_user_school_qualification_i_2` (`fk_user_school_qualification_id`,`fk_subject_id`),
  ADD KEY `subject` (`fk_subject_id`);

--
-- Indexes for table `user_skill`
--
ALTER TABLE `user_skill`
  ADD PRIMARY KEY (`userSkill_id`),
  ADD KEY `FK_myKey` (`userSkill_fk_user_id`),
  ADD KEY `FK_myKey2` (`userSkill_fk_skill_id`);

--
-- Indexes for table `user_subject_score`
--
ALTER TABLE `user_subject_score`
  ADD UNIQUE KEY `fk_user_id` (`fk_user_id`,`fk_subject_id`);

--
-- Indexes for table `user_uni_qualification`
--
ALTER TABLE `user_uni_qualification`
  ADD UNIQUE KEY `fk_user_id` (`fk_user_id`,`fk_qualification_id`,`fk_uni_id`);

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
-- AUTO_INCREMENT for table `case_study`
--
ALTER TABLE `case_study`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;
--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
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
-- AUTO_INCREMENT for table `user_school_qualification`
--
ALTER TABLE `user_school_qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
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
-- Constraints for table `case_study`
--
ALTER TABLE `case_study`
  ADD CONSTRAINT `jobs` FOREIGN KEY (`fk_job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qualifications` FOREIGN KEY (`fk_qualification_id`) REFERENCES `qualifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `subjects` FOREIGN KEY (`fk_subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `user_jobs`
--
ALTER TABLE `user_jobs`
  ADD CONSTRAINT `job` FOREIGN KEY (`fk_job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_school_qualification`
--
ALTER TABLE `user_school_qualification`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_school_qualification_subjects`
--
ALTER TABLE `user_school_qualification_subjects`
  ADD CONSTRAINT `qualification` FOREIGN KEY (`fk_user_school_qualification_id`) REFERENCES `user_school_qualification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject` FOREIGN KEY (`fk_subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_skill`
--
ALTER TABLE `user_skill`
  ADD CONSTRAINT `FK_myKey` FOREIGN KEY (`userSkill_fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_myKey2` FOREIGN KEY (`userSkill_fk_skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_subject_score`
--
ALTER TABLE `user_subject_score`
  ADD CONSTRAINT `user` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_uni_qualification`
--
ALTER TABLE `user_uni_qualification`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workexperience`
--
ALTER TABLE `workexperience`
  ADD CONSTRAINT `FK_myKey3` FOREIGN KEY (`workExperience_fk_job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_myKey4` FOREIGN KEY (`workExperience_fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
