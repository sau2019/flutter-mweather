-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 01, 2020 at 02:38 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mweather`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback_report`
--

CREATE TABLE `feedback_report` (
  `feedback_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback_report`
--

INSERT INTO `feedback_report` (`feedback_id`, `name`, `email`, `message`) VALUES
(1, 'dedefr', 'deff', 'feefe'),
(2, 'dedefr', 'deff', 'feefe'),
(3, 'saurabh', 'ranjan', 'kumar'),
(4, 'fkrhfrgfuygruygr', 'saurabh', 'ranjan k'),
(5, 'saurabh', 'ranjan', 'kumar'),
(6, 'saurabh', 'ranjan', 'kumar'),
(7, 'saurabhhghefdhjtdfetyfd', 'dsrkit28@gmail.jhcje', 'hello'),
(8, 'saurabhhghefdhjtdfetyfd', 'dsrkit28@gmail.jhcje', 'hello'),
(9, 'saurabhhghefdhjtdfetyfd', 'dsrkit28@gmail.jhcje', 'hello'),
(10, 'saurabhhghefdhjtdfetyfd', 'dsrkit28@gmail.jhcje', 'hello'),
(11, 'saurabh', 'raj', 'kjh'),
(12, '', '', ''),
(13, '', '', ''),
(14, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback_report`
--
ALTER TABLE `feedback_report`
  ADD PRIMARY KEY (`feedback_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback_report`
--
ALTER TABLE `feedback_report`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
