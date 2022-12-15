-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-12-15 04:05:01
-- 伺服器版本： 10.4.25-MariaDB
-- PHP 版本： 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `colourme`
--

-- --------------------------------------------------------

--
-- 資料表結構 `model_label`
--

CREATE TABLE `model_label` (
  `numbers` char(8) NOT NULL,
  `label` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `model_label`
--

INSERT INTO `model_label` (`numbers`, `label`) VALUES
('50106054', '0'),
('50106858', '1'),
('50106926', '2'),
('50107234', '3'),
('50108334', '4'),
('50108918', '5'),
('50116870', '6'),
('50124206', '7'),
('50125266', '8'),
('50125546', '9'),
('50128810', '10'),
('50129334', '11'),
('50134130', '12'),
('50134278', '13'),
('50139956', '14'),
('50140976', '15'),
('50141060', '16'),
('50141244', '17'),
('50141920', '18'),
('50142448', '19'),
('50143776', '20'),
('50149300', '21'),
('50162666', '22'),
('50162730', '23'),
('50162782', '24'),
('50174722', '25'),
('50175146', '26'),
('50175270', '27'),
('50188204', '28'),
('50188528', '29'),
('50188848', '30'),
('50188936', '31'),
('50189240', '32'),
('50191184', '33'),
('50191324', '34'),
('50191748', '35'),
('50199182', '36'),
('50200284', '37'),
('50206900', '38'),
('50208548', '39'),
('50209624', '40'),
('50209824', '41'),
('50209912', '42'),
('50219392', '43'),
('50219804', '44'),
('50224644', '45'),
('50224852', '46'),
('50234336', '47'),
('50237188', '48'),
('50237232', '49');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `model_label`
--
ALTER TABLE `model_label`
  ADD PRIMARY KEY (`numbers`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
