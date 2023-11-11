-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 12, 2023 at 12:52 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covid19`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_statistics` ()   BEGIN
    DECLARE diagnosed_count INT;
    DECLARE encounter_count INT;
    DECLARE vaccinated_count INT;
    DECLARE minor_count INT;
    DECLARE adult_count INT;
    DECLARE foreigner_count INT;

    -- Count diagnosed cases
    SELECT COUNT(id) INTO diagnosed_count
    FROM covidform
    WHERE diagnosed = "yes";

    -- Count encounters
    SELECT COUNT(id) INTO encounter_count
    FROM covidform
    WHERE encounter = "yes";

    -- Count vaccinated cases
    SELECT COUNT(id) INTO vaccinated_count
    FROM covidform
    WHERE vaccinated = "yes";

    -- Count minors (age 1-18)
    SELECT COUNT(id) INTO minor_count
    FROM covidform
    WHERE age BETWEEN 1 AND 18;

    -- Count adults (age 19 and above)
    SELECT COUNT(id) INTO adult_count
    FROM covidform
    WHERE age >= 19;

      -- Count foreigner 
    SELECT COUNT(id) INTO foreigner_count
    FROM covidform
    WHERE nationality != "Filipino";

    -- Return counts
    SELECT diagnosed_count AS diagnosed_count, 
           encounter_count AS encounter_count, 
           vaccinated_count AS vaccinated_count,
           minor_count AS minor_count,
           adult_count AS adult_count,
           foreigner_count as foreigner_count;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_proc` (IN `par_name` VARCHAR(50), IN `par_gender` VARCHAR(10), IN `par_age` INT(2), IN `par_mobile_no` VARCHAR(13), IN `par_body_temp` VARCHAR(50), IN `par_diagnosed` VARCHAR(3), IN `par_encounter` VARCHAR(3), IN `par_vaccinated` VARCHAR(3), IN `par_nationality` VARCHAR(50))   BEGIN
    INSERT INTO `covidform` (`name`, `gender`, `age`, `mobile_no`, `body_temp`, `diagnosed`, `encounter`, `vaccinated`, `nationality`)
    VALUES
        (par_name, par_gender, par_age, par_mobile_no, par_body_temp, par_diagnosed,  par_encounter, par_vaccinated, par_nationality);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `covidform`
--

CREATE TABLE `covidform` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(2) NOT NULL,
  `mobile_no` varchar(13) NOT NULL,
  `body_temp` varchar(50) NOT NULL,
  `diagnosed` varchar(3) NOT NULL,
  `encounter` varchar(3) NOT NULL,
  `vaccinated` varchar(3) NOT NULL,
  `nationality` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `covidform`
--

INSERT INTO `covidform` (`id`, `name`, `gender`, `age`, `mobile_no`, `body_temp`, `diagnosed`, `encounter`, `vaccinated`, `nationality`) VALUES
(1, 'norhata', 'f', 12, '091025', '39', 'yes', 'yes', 'yes', 'filipino'),
(2, 'norhata', 'f', 20, '091025', '39', 'yes', 'yes', 'yes', 'filipino'),
(3, 'norhata', 'f', 12, '091025', '39', 'yes', 'yes', 'yes', 'filipino'),
(4, 'norhata', 'f', 30, '091025', '39', 'yes', 'yes', 'yes', 'filipino'),
(5, 'norhata', 'f', 12, '091025', '39', 'yes', 'yes', 'yes', 'filipino'),
(6, 'norhata', 'f', 40, '091025', '39', 'yes', 'yes', 'yes', 'filipino'),
(7, 'norhata', 'f', 12, '091025', '39', 'no', 'no', 'yes', 'morocco'),
(8, 'norhata', 'f', 12, '091025', '39', 'no', 'yes', 'yes', 'Filipino');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `covidform`
--
ALTER TABLE `covidform`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `covidform`
--
ALTER TABLE `covidform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
