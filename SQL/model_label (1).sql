-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-12-16 10:06:22
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
('50082382', '0'),
('50083566', '1'),
('50099400', '2'),
('50099596', '3'),
('50105590', '4'),
('50105662', '5'),
('50106054', '6'),
('50106866', '7'),
('50106926', '8'),
('50108334', '9'),
('50108922', '10'),
('50116870', '11'),
('50124222', '12'),
('50125546', '13'),
('50129334', '14'),
('50134130', '15'),
('50134278', '16'),
('50139960', '17'),
('50140972', '18'),
('50141280', '19'),
('50142448', '20'),
('50142544', '21'),
('50143780', '22'),
('50149782', '23'),
('50151900', '24'),
('50174742', '25'),
('50175146', '26'),
('50188560', '27'),
('50188848', '28'),
('50188936', '29'),
('50189244', '30'),
('50191328', '31'),
('50191748', '32'),
('50206908', '33'),
('50208548', '34'),
('50209628', '35'),
('50209852', '36'),
('50209920', '37'),
('50219396', '38'),
('50219804', '39'),
('50224644', '40'),
('50224852', '41'),
('50234336', '42'),
('50234584', '43'),
('50234676', '44'),
('50237088', '45'),
('50237188', '46'),
('50237232', '47'),
('50237732', '48'),
('50237800', '49');

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
