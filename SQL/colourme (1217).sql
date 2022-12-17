-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-12-17 09:22:07
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
-- 資料表結構 `category`
--

CREATE TABLE `category` (
  `numbers` char(8) NOT NULL,
  `id` char(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `text` varchar(500) DEFAULT NULL,
  `price` int(5) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `category`
--

INSERT INTO `category` (`numbers`, `id`, `name`, `text`, `price`, `url`, `category`) VALUES
('50082382', 'GY1034', 'Retropy E5 經典鞋', '\'鞋帶設計\', \'網布鞋面搭配車縫麂皮表層\', \'合成皮內裡\', \'Boost 中底\', \'橡膠大底\'', 2099, 'https://www.adidas.com.tw/product/50082382', 'Retropy'),
('50083566', 'GY6058', 'NMD_R1 經典鞋', '\'鞋帶設計\', \'彈性針織鞋面\', \'包覆腳感\', \'網布內裡\', \'Boost 中底\', \'橡膠大底\', \'鞋面中的紗線含有至少 50% Parley Ocean Plastic 和 50% 再生聚酯\'', 3699, 'https://www.adidas.com.tw/product/50083566', 'NMD'),
('50099400', 'GZ5231', 'OZWEEGO Celox 經典鞋', '\'襪套式設計\', \'鞋帶設計\', \'網布鞋面\', \'包覆腳感\', \'合成皮內裡\', \'EVA 中底搭配 Adiprene 和 Adiprene+ 避震設計\', \'橡膠大底\'', 3099, 'https://www.adidas.com.tw/product/50099400', 'Ozweego'),
('50099596', 'GW0559', 'Retropy E5 經典鞋', '\'鞋帶設計\', \'織物鞋面配縫製絨面革飾面\', \'織物襯裡\', \'Boost中底\', \'橡膠外底\'', 2559, 'https://www.adidas.com.tw/product/50099596', 'Retropy'),
('50105590', 'GW5472', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面搭配車縫麂皮表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\'', 2472, 'https://www.adidas.com.tw/product/50105590', 'Retropy'),
('50105662', 'GW5473', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面搭配車縫麂皮表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\'', 2472, 'https://www.adidas.com.tw/product/50105662', 'Retropy'),
('50106054', 'GW9740', 'OZWEEGO Meta 經典鞋', '\'鞋帶設計\', \'鞋面採用麂皮和網布拼接而成\', \'網布內裡\', \'Adiprene 避震科技\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2559, 'https://www.adidas.com.tw/product/50106054', 'Ozweego'),
('50106866', 'GV7615', 'Superstar Parley 經典鞋', '\'鞋帶設計\', \'合成材質鞋面\', \'BOOST 中底\', \'網布內裡\', \'橡膠大底\', \'鞋面採用超過 50% 的再生材質\'', 2559, 'https://www.adidas.com.tw/product/50106866', 'Superstar'),
('50106926', 'GV7610', 'Superstar PARLEY 經典鞋', '\'一般版型\', \'鞋帶設計\', \'合成材質鞋面\', \'網布內裡\', \'橡膠大底\', \'鞋面採用超過 50% 的再生材質\'', 2299, 'https://www.adidas.com.tw/product/50106926', 'Superstar'),
('50108334', 'GY6067', 'NMD_R1 PARLEY 經典鞋', '\'鞋帶設計\', \'彈性針織鞋面\', \'包覆腳感\', \'網布內裡\', \'BOOST 中底\', \'橡膠大底\', \'鞋面中的紗線含有至少 50% Parley Ocean Plastic 和 50% 再生聚酯纖維\'', 3699, 'https://www.adidas.com.tw/product/50108334', 'NMD'),
('50108922', 'GY6697', 'ZX 22 BOOST 經典鞋', '\'一般版型\', \'鞋帶設計\', \'網布鞋面搭配麂皮表層\', \'EVA 中底搭配 JET BOOST 科技\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2799, 'https://www.adidas.com.tw/product/50108922', 'Others'),
('50116870', 'FX5119', 'Multix 經典鞋', '\'一般版型\', \'鞋帶設計\', \'網布鞋面\', \'EVA 中底\', \'橡膠大底\'', 2890, 'https://www.adidas.com.tw/product/50116870', 'Others'),
('50124222', 'GV9116', 'Pride X Retropy E5 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'BOOST 中底\', \'橡膠大底\'', 2999, 'https://www.adidas.com.tw/product/50124222', 'Retropy'),
('50125546', 'GW0562', 'Retropy E5 經典鞋', '\'鞋帶設計\', \'網布鞋面搭配車縫麂皮表層\', \'網布內裡\', \'Boost 中底\', \'橡膠大底\'', 2559, 'https://www.adidas.com.tw/product/50125546', 'Retropy'),
('50129334', 'GY0362', 'Agent Gil Restomod 籃球鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'Boost 中底\', \'Formotion 結構\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 2999, 'https://www.adidas.com.tw/product/50129334', 'Sneaker'),
('50134130', 'GZ1603', 'Superstar 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'反光拼接設計\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2559, 'https://www.adidas.com.tw/product/50134130', 'Superstar'),
('50134278', 'GZ1604', 'Superstar 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'反光拼接設計\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2559, 'https://www.adidas.com.tw/product/50134278', 'Superstar'),
('50139960', 'GZ6422', 'Agent Gil Restomod 籃球鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'Boost 中底\', \'Formotion 結構\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 2999, 'https://www.adidas.com.tw/product/50139960', 'Sneaker'),
('50140972', 'GX4499', 'OZELIA 經典鞋', '\'舒適貼合\', \'鞋帶設計\', \'網布熔接鞋面\', \'網布內裡\', \'Adiprene 避震科技\', \'橡膠大底\'', 2699, 'https://www.adidas.com.tw/product/50140972', 'Others'),
('50141280', 'GW9354', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面，搭配車縫麂皮和網布表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 2159, 'https://www.adidas.com.tw/product/50141280', 'Retropy'),
('50142448', 'GZ2202', 'Andre Saraiva x Stan Smith 經典鞋', '\'鞋帶設計\', \'合成材質鞋面\', \'網布內裡\', \'橡膠大底\', \'鞋面採用超過 50% 的再生材質\'', 2699, 'https://www.adidas.com.tw/product/50142448', 'Others'),
('50142544', 'GY7136', 'Abaca 經典鞋', '\'鞋帶設計\', \'網布鞋面\', \'硫化橡膠大底\'', 1992, 'https://www.adidas.com.tw/product/50142544', 'Abaca'),
('50143780', 'HP5500', 'Superstar 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2299, 'https://www.adidas.com.tw/product/50143780', 'Superstar'),
('50149782', 'GW6822', 'Swift Run 22 經典鞋', '\'舒適貼合\', \'鞋帶設計\', \'針織網布鞋面\', \'包覆腳感\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\', \'鞋面採用超過 50% 的再生材質\'', 2792, 'https://www.adidas.com.tw/product/50149782', 'Others'),
('50151900', 'GY7135', 'Abaca 經典鞋', '\'鞋帶設計\', \'網布鞋面\', \'硫化橡膠大底\'', 1992, 'https://www.adidas.com.tw/product/50151900', 'Abaca'),
('50174742', 'GY4586', 'Campus 80s 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'皮革內裡\', \'橡膠大底\'', 2699, 'https://www.adidas.com.tw/product/50174742', 'Campus'),
('50175146', 'GX9406', 'Campus 80s 經典鞋', '\'麂皮鞋面\', \'橡膠大底\'', 2199, 'https://www.adidas.com.tw/product/50175146', 'Campus'),
('50188560', 'GW9358', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面，搭配車縫麂皮和網布表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 2472, 'https://www.adidas.com.tw/product/50188560', 'Retropy'),
('50188848', 'GY7006', 'COOK x Campus 80s 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮和皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 3890, 'https://www.adidas.com.tw/product/50188848', 'Campus'),
('50188936', 'GY7005', 'COOK x Campus 80s 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮和皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 3890, 'https://www.adidas.com.tw/product/50188936', 'Campus'),
('50189244', 'GW9367', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面，搭配車縫麂皮和網布表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 2472, 'https://www.adidas.com.tw/product/50189244', 'Retropy'),
('50191328', 'HP5498', 'Superstar 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2792, 'https://www.adidas.com.tw/product/50191328', 'Superstar'),
('50191748', 'HP5501', 'Superstar 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2472, 'https://www.adidas.com.tw/product/50191748', 'Superstar'),
('50206908', 'FZ5594', 'Gazelle 85 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'皮革內裡\', \'橡膠大底\'', 3890, 'https://www.adidas.com.tw/product/50206908', 'Gazelle'),
('50208548', 'HP8021', 'Retropy F90 經典鞋', '\'鞋帶設計\', \'網布鞋面\', \'EVA 中底\', \'Torsion System\', \'橡膠大底\', \'矽膠結構\'', 2952, 'https://www.adidas.com.tw/product/50208548', 'Retropy'),
('50209628', 'HP9845', 'Superstar 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\'', 2952, 'https://www.adidas.com.tw/product/50209628', 'Superstar'),
('50209852', 'GX2215', 'Centennial 85 經典鞋', '\'鞋帶設計\', \'網布和磨砂革鞋面\', \'網布內裡\', \'橡膠大底\'', 2792, 'https://www.adidas.com.tw/product/50209852', 'Centennial'),
('50209920', 'GX2214', 'Centennial 85 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2792, 'https://www.adidas.com.tw/product/50209920', 'Centennial'),
('50219396', 'GY4559', 'Puffylette 運動拖鞋', '\'一般版型\', \'套穿式設計\', \'尼龍鞋面\', \'網布內裡\', \'合成材質大底\', \'鞋面含再生材質\'', 2690, 'https://www.adidas.com.tw/product/50219396', 'Puffylette'),
('50219804', 'HR1481', 'Puffylette 運動拖鞋', '\'一般版型\', \'套穿式設計\', \'尼龍鞋面\', \'支持瑞士良好棉花發展協會\', \'EVA 中底和大底\', \'鞋面含再生材質\'', 2890, 'https://www.adidas.com.tw/product/50219804', 'Puffylette'),
('50224644', 'GX7330', 'Campus 80s 經典鞋', '\'皮革鞋面\', \'皮革內裡\', \'橡膠大底\'', 3690, 'https://www.adidas.com.tw/product/50224644', 'Campus'),
('50224852', 'GZ5230', 'OZWEEGO CELOX 經典鞋', '\'襪套式設計\', \'鞋帶設計\', \'織物鞋面\', \'包覆腳感\', \'合成皮內裡\', \'橡膠大底\', \'EVA 中底搭配 Adiprene 和 Adiprene+ 避震設計\'', 3099, 'https://www.adidas.com.tw/product/50224852', 'Ozweego'),
('50234336', 'GY0025', 'Superstar 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\'', 3890, 'https://www.adidas.com.tw/product/50234336', 'Superstar'),
('50234584', 'GY7338', 'Gazelle 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮鞋面\', \'合成材質內裡\', \'橡膠大底\'', 3490, 'https://www.adidas.com.tw/product/50234584', 'Gazelle'),
('50234676', 'GY7339', 'Gazelle 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮鞋面\', \'合成材質內裡\', \'橡膠大底\'', 3490, 'https://www.adidas.com.tw/product/50234676', 'Gazelle'),
('50237088', 'GY2395', 'T-Mac 3 Restomod 籃球鞋', '\'一般版型\', \'鞋帶設計\', \'合成材質鞋面\', \'Bounce 中底\', \'網布內裡\', \'橡膠大底\'', 3259, 'https://www.adidas.com.tw/product/50237088', 'Sneaker'),
('50237188', 'H03424', 'Forum 經典鞋', '\'鞋帶設計搭配可調式黏扣帶\', \'合成鞋面\', \'網布內裡\', \'橡膠外底\', \'鞋面含再生材質\'', 2952, 'https://www.adidas.com.tw/product/50237188', 'Others'),
('50237232', 'GY4656', 'Superstar Vegan 經典鞋', '\'鞋帶設計\', \'合成材質鞋面\', \'合成材質內裡\', \'橡膠大底\', \'純素替代材質：含有 25% 以上再生成分\'', 2792, 'https://www.adidas.com.tw/product/50237232', 'Superstar'),
('50237732', 'HQ6433', 'Adiease 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮鞋面\', \'網布內裡\', \'橡膠大底\'', 2490, 'https://www.adidas.com.tw/product/50237732', 'Adiease'),
('50237800', 'HQ6432', 'Adiease 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮鞋面\', \'網布內裡\', \'橡膠大底\'', 2490, 'https://www.adidas.com.tw/product/50237800', 'Adiease');

-- --------------------------------------------------------

--
-- 資料表結構 `category_label_12`
--

CREATE TABLE `category_label_12` (
  `category` char(20) NOT NULL,
  `category_num` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `category_label_12`
--

INSERT INTO `category_label_12` (`category`, `category_num`) VALUES
('Retropy', '9'),
('NMD', '5'),
('Ozweego', '7'),
('Superstar', '11'),
('Others', '6'),
('Sneaker', '10'),
('Abaca', '0'),
('Campus', '2'),
('Gazelle', '4'),
('Centennial', '3'),
('Puffylette', '8'),
('Adiease', '1');

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `hot_list`
-- (請參考以下實際畫面)
--
CREATE TABLE `hot_list` (
`numbers` char(8)
,`id` char(6)
,`name` varchar(30)
,`Hot` int(10)
,`imgURL` varchar(150)
);

-- --------------------------------------------------------

--
-- 資料表結構 `model_label_50`
--

CREATE TABLE `model_label_50` (
  `numbers` char(8) NOT NULL,
  `label` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `model_label_50`
--

INSERT INTO `model_label_50` (`numbers`, `label`) VALUES
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

-- --------------------------------------------------------

--
-- 資料表結構 `parser_hot_list`
--

CREATE TABLE `parser_hot_list` (
  `numbers` char(10) NOT NULL,
  `id` char(10) NOT NULL,
  `hot` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `parser_hot_list`
--

INSERT INTO `parser_hot_list` (`numbers`, `id`, `hot`) VALUES
('50237800', 'HQ6432', 160),
('50237732', 'HQ6433', 140),
('50237232', 'GY4656', 0),
('50237188', 'H03424', 0),
('50237088', 'GY2395', 0),
('50234676', 'GY7339', 420),
('50234584', 'GY7338', 570),
('50234336', 'GY0025', 95),
('50224852', 'GZ5230', 0),
('50224644', 'GX7330', 105),
('50219804', 'HR1481', 980),
('50219396', 'GY4559', 0),
('50209920', 'GX2214', 0),
('50209852', 'GX2215', 0),
('50209628', 'HP9845', 0),
('50208548', 'HP8021', 0),
('50206908', 'FZ5594', 210),
('50191748', 'HP5501', 0),
('50191328', 'HP5498', 0),
('50189244', 'GW9367', 0),
('50188936', 'GY7005', 75),
('50188848', 'GY7006', 100),
('50188560', 'GW9358', 0),
('50175146', 'GX9406', 0),
('50174742', 'GY4586', 0),
('50151900', 'GY7135', 0),
('50149782', 'GW6822', 0),
('50143780', 'HP5500', 0),
('50142544', 'GY7136', 0),
('50142448', 'GZ2202', 0),
('50141280', 'GW9354', 0),
('50140972', 'GX4499', 0),
('50139960', 'GZ6422', 0),
('50134278', 'GZ1604', 0),
('50134130', 'GZ1603', 0),
('50129334', 'GY0362', 0),
('50125546', 'GW0562', 0),
('50124222', 'GV9116', 0),
('50116870', 'FX5119', 45),
('50108922', 'GY6697', 0),
('50108334', 'GY6067', 0),
('50106926', 'GV7610', 0),
('50106866', 'GV7615', 0),
('50106054', 'GW9740', 0),
('50105662', 'GW5473', 0),
('50105590', 'GW5472', 0),
('50099596', 'GW0559', 0),
('50099400', 'GZ5231', 0),
('50083566', 'GY6058', 0),
('50082382', 'GY1034', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `parser_text`
--

CREATE TABLE `parser_text` (
  `numbers` char(8) NOT NULL,
  `id` char(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `text` varchar(500) DEFAULT NULL,
  `price` int(5) NOT NULL,
  `url` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `parser_text`
--

INSERT INTO `parser_text` (`numbers`, `id`, `name`, `text`, `price`, `url`) VALUES
('50237800', 'HQ6432', 'Adiease 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮鞋面\', \'網布內裡\', \'橡膠大底\'', 2490, 'https://www.adidas.com.tw/product/50237800'),
('50237732', 'HQ6433', 'Adiease 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮鞋面\', \'網布內裡\', \'橡膠大底\'', 2490, 'https://www.adidas.com.tw/product/50237732'),
('50237232', 'GY4656', 'Superstar Vegan 經典鞋', '\'鞋帶設計\', \'合成材質鞋面\', \'合成材質內裡\', \'橡膠大底\', \'純素替代材質：含有 25% 以上再生成分\'', 2792, 'https://www.adidas.com.tw/product/50237232'),
('50237188', 'H03424', 'Forum 經典鞋', '\'鞋帶設計搭配可調式黏扣帶\', \'合成鞋面\', \'網布內裡\', \'橡膠外底\', \'鞋面含再生材質\'', 2952, 'https://www.adidas.com.tw/product/50237188'),
('50237088', 'GY2395', 'T-Mac 3 Restomod 籃球鞋', '\'一般版型\', \'鞋帶設計\', \'合成材質鞋面\', \'Bounce 中底\', \'網布內裡\', \'橡膠大底\'', 3259, 'https://www.adidas.com.tw/product/50237088'),
('50234676', 'GY7339', 'Gazelle 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮鞋面\', \'合成材質內裡\', \'橡膠大底\'', 3490, 'https://www.adidas.com.tw/product/50234676'),
('50234584', 'GY7338', 'Gazelle 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮鞋面\', \'合成材質內裡\', \'橡膠大底\'', 3490, 'https://www.adidas.com.tw/product/50234584'),
('50234336', 'GY0025', 'Superstar 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\'', 3890, 'https://www.adidas.com.tw/product/50234336'),
('50224852', 'GZ5230', 'OZWEEGO CELOX 經典鞋', '\'襪套式設計\', \'鞋帶設計\', \'織物鞋面\', \'包覆腳感\', \'合成皮內裡\', \'橡膠大底\', \'EVA 中底搭配 Adiprene 和 Adiprene+ 避震設計\'', 3099, 'https://www.adidas.com.tw/product/50224852'),
('50224644', 'GX7330', 'Campus 80s 經典鞋', '\'皮革鞋面\', \'皮革內裡\', \'橡膠大底\'', 3690, 'https://www.adidas.com.tw/product/50224644'),
('50219804', 'HR1481', 'Puffylette 運動拖鞋', '\'一般版型\', \'套穿式設計\', \'尼龍鞋面\', \'支持瑞士良好棉花發展協會\', \'EVA 中底和大底\', \'鞋面含再生材質\'', 2890, 'https://www.adidas.com.tw/product/50219804'),
('50219396', 'GY4559', 'Puffylette 運動拖鞋', '\'一般版型\', \'套穿式設計\', \'尼龍鞋面\', \'網布內裡\', \'合成材質大底\', \'鞋面含再生材質\'', 2690, 'https://www.adidas.com.tw/product/50219396'),
('50209920', 'GX2214', 'Centennial 85 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2792, 'https://www.adidas.com.tw/product/50209920'),
('50209852', 'GX2215', 'Centennial 85 經典鞋', '\'鞋帶設計\', \'網布和磨砂革鞋面\', \'網布內裡\', \'橡膠大底\'', 2792, 'https://www.adidas.com.tw/product/50209852'),
('50209628', 'HP9845', 'Superstar 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\'', 2952, 'https://www.adidas.com.tw/product/50209628'),
('50208548', 'HP8021', 'Retropy F90 經典鞋', '\'鞋帶設計\', \'網布鞋面\', \'EVA 中底\', \'Torsion System\', \'橡膠大底\', \'矽膠結構\'', 2952, 'https://www.adidas.com.tw/product/50208548'),
('50206908', 'FZ5594', 'Gazelle 85 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'皮革內裡\', \'橡膠大底\'', 3890, 'https://www.adidas.com.tw/product/50206908'),
('50191748', 'HP5501', 'Superstar 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2472, 'https://www.adidas.com.tw/product/50191748'),
('50191328', 'HP5498', 'Superstar 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2792, 'https://www.adidas.com.tw/product/50191328'),
('50189244', 'GW9367', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面，搭配車縫麂皮和網布表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 2472, 'https://www.adidas.com.tw/product/50189244'),
('50188936', 'GY7005', 'COOK x Campus 80s 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮和皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 3890, 'https://www.adidas.com.tw/product/50188936'),
('50188848', 'GY7006', 'COOK x Campus 80s 經典鞋', '\'一般版型\', \'鞋帶設計\', \'麂皮和皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 3890, 'https://www.adidas.com.tw/product/50188848'),
('50188560', 'GW9358', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面，搭配車縫麂皮和網布表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 2472, 'https://www.adidas.com.tw/product/50188560'),
('50175146', 'GX9406', 'Campus 80s 經典鞋', '\'麂皮鞋面\', \'橡膠大底\'', 2199, 'https://www.adidas.com.tw/product/50175146'),
('50174742', 'GY4586', 'Campus 80s 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'皮革內裡\', \'橡膠大底\'', 2699, 'https://www.adidas.com.tw/product/50174742'),
('50151900', 'GY7135', 'Abaca 經典鞋', '\'鞋帶設計\', \'網布鞋面\', \'硫化橡膠大底\'', 1992, 'https://www.adidas.com.tw/product/50151900'),
('50149782', 'GW6822', 'Swift Run 22 經典鞋', '\'舒適貼合\', \'鞋帶設計\', \'針織網布鞋面\', \'包覆腳感\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\', \'鞋面採用超過 50% 的再生材質\'', 2792, 'https://www.adidas.com.tw/product/50149782'),
('50143780', 'HP5500', 'Superstar 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2299, 'https://www.adidas.com.tw/product/50143780'),
('50142544', 'GY7136', 'Abaca 經典鞋', '\'鞋帶設計\', \'網布鞋面\', \'硫化橡膠大底\'', 1992, 'https://www.adidas.com.tw/product/50142544'),
('50142448', 'GZ2202', 'Andre Saraiva x Stan Smith 經典鞋', '\'鞋帶設計\', \'合成材質鞋面\', \'網布內裡\', \'橡膠大底\', \'鞋面採用超過 50% 的再生材質\'', 2699, 'https://www.adidas.com.tw/product/50142448'),
('50141280', 'GW9354', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面，搭配車縫麂皮和網布表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 2159, 'https://www.adidas.com.tw/product/50141280'),
('50140972', 'GX4499', 'OZELIA 經典鞋', '\'舒適貼合\', \'鞋帶設計\', \'網布熔接鞋面\', \'網布內裡\', \'Adiprene 避震科技\', \'橡膠大底\'', 2699, 'https://www.adidas.com.tw/product/50140972'),
('50139960', 'GZ6422', 'Agent Gil Restomod 籃球鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'Boost 中底\', \'Formotion 結構\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 2999, 'https://www.adidas.com.tw/product/50139960'),
('50134278', 'GZ1604', 'Superstar 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'反光拼接設計\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2559, 'https://www.adidas.com.tw/product/50134278'),
('50134130', 'GZ1603', 'Superstar 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'反光拼接設計\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2559, 'https://www.adidas.com.tw/product/50134130'),
('50129334', 'GY0362', 'Agent Gil Restomod 籃球鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'Boost 中底\', \'Formotion 結構\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50% 的再生成分\'', 2999, 'https://www.adidas.com.tw/product/50129334'),
('50125546', 'GW0562', 'Retropy E5 經典鞋', '\'鞋帶設計\', \'網布鞋面搭配車縫麂皮表層\', \'網布內裡\', \'Boost 中底\', \'橡膠大底\'', 2559, 'https://www.adidas.com.tw/product/50125546'),
('50124222', 'GV9116', 'Pride X Retropy E5 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'BOOST 中底\', \'橡膠大底\'', 2999, 'https://www.adidas.com.tw/product/50124222'),
('50116870', 'FX5119', 'Multix 經典鞋', '\'一般版型\', \'鞋帶設計\', \'網布鞋面\', \'EVA 中底\', \'橡膠大底\'', 2890, 'https://www.adidas.com.tw/product/50116870'),
('50108922', 'GY6697', 'ZX 22 BOOST 經典鞋', '\'一般版型\', \'鞋帶設計\', \'網布鞋面搭配麂皮表層\', \'EVA 中底搭配 JET BOOST 科技\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2799, 'https://www.adidas.com.tw/product/50108922'),
('50108334', 'GY6067', 'NMD_R1 PARLEY 經典鞋', '\'鞋帶設計\', \'彈性針織鞋面\', \'包覆腳感\', \'網布內裡\', \'BOOST 中底\', \'橡膠大底\', \'鞋面中的紗線含有至少 50% Parley Ocean Plastic 和 50% 再生聚酯纖維\'', 3699, 'https://www.adidas.com.tw/product/50108334'),
('50106926', 'GV7610', 'Superstar PARLEY 經典鞋', '\'一般版型\', \'鞋帶設計\', \'合成材質鞋面\', \'網布內裡\', \'橡膠大底\', \'鞋面採用超過 50% 的再生材質\'', 2299, 'https://www.adidas.com.tw/product/50106926'),
('50106866', 'GV7615', 'Superstar Parley 經典鞋', '\'鞋帶設計\', \'合成材質鞋面\', \'BOOST 中底\', \'網布內裡\', \'橡膠大底\', \'鞋面採用超過 50% 的再生材質\'', 2559, 'https://www.adidas.com.tw/product/50106866'),
('50106054', 'GW9740', 'OZWEEGO Meta 經典鞋', '\'鞋帶設計\', \'鞋面採用麂皮和網布拼接而成\', \'網布內裡\', \'Adiprene 避震科技\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% 的再生材質製成\'', 2559, 'https://www.adidas.com.tw/product/50106054'),
('50105662', 'GW5473', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面搭配車縫麂皮表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\'', 2472, 'https://www.adidas.com.tw/product/50105662'),
('50105590', 'GW5472', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面搭配車縫麂皮表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\'', 2472, 'https://www.adidas.com.tw/product/50105590'),
('50099596', 'GW0559', 'Retropy E5 經典鞋', '\'鞋帶設計\', \'織物鞋面配縫製絨面革飾面\', \'織物襯裡\', \'Boost中底\', \'橡膠外底\'', 2559, 'https://www.adidas.com.tw/product/50099596'),
('50099400', 'GZ5231', 'OZWEEGO Celox 經典鞋', '\'襪套式設計\', \'鞋帶設計\', \'網布鞋面\', \'包覆腳感\', \'合成皮內裡\', \'EVA 中底搭配 Adiprene 和 Adiprene+ 避震設計\', \'橡膠大底\'', 3099, 'https://www.adidas.com.tw/product/50099400'),
('50083566', 'GY6058', 'NMD_R1 經典鞋', '\'鞋帶設計\', \'彈性針織鞋面\', \'包覆腳感\', \'網布內裡\', \'Boost 中底\', \'橡膠大底\', \'鞋面中的紗線含有至少 50% Parley Ocean Plastic 和 50% 再生聚酯\'', 3699, 'https://www.adidas.com.tw/product/50083566'),
('50082382', 'GY1034', 'Retropy E5 經典鞋', '\'鞋帶設計\', \'網布鞋面搭配車縫麂皮表層\', \'合成皮內裡\', \'Boost 中底\', \'橡膠大底\'', 2099, 'https://www.adidas.com.tw/product/50082382');

-- --------------------------------------------------------

--
-- 資料表結構 `productid_imgurl`
--

CREATE TABLE `productid_imgurl` (
  `numbers` char(8) NOT NULL,
  `id` char(6) NOT NULL,
  `imgURL` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `productid_imgurl`
--

INSERT INTO `productid_imgurl` (`numbers`, `id`, `imgURL`) VALUES
('50082382', 'GY1034', 'https://images.adidas.com.tw/80/imageQC2000020480_2000_1.jpg'),
('50083566', 'GY6058', 'https://images.adidas.com.tw/86/imageQC2000020786_2000_1.jpg'),
('50099400', 'GZ5231', 'https://images.adidas.com.tw/31/imageQC2000005131_2000_1.jpg'),
('50099596', 'GW0559', 'https://images.adidas.com.tw/81/imageQC2000024781_2000_1.jpg'),
('50105590', 'GW5472', 'https://images.adidas.com.tw/72/imageQC2000026272_2000_1.jpg'),
('50105662', 'GW5473', 'https://images.adidas.com.tw/91/imageQC2000026291_2000_1.jpg'),
('50106054', 'GW9740', 'https://images.adidas.com.tw/90/imageQC2000026390_2000_1.jpg'),
('50106866', 'GV7615', 'https://images.adidas.com.tw/90/imageQC2000026590_2000_1.jpg'),
('50106926', 'GV7610', 'https://images.adidas.com.tw/08/imageQC2000026608_2000_1.jpg'),
('50108334', 'GY6067', 'https://images.adidas.com.tw/60/imageQC2000026960_2000_1.jpg'),
('50108922', 'GY6697', 'https://images.adidas.com.tw/04/imageQC2000027104_2000_1.jpg'),
('50116870', 'FX5119', 'https://images.adidas.com.tw/63/imageQC2000029063_2000_1.jpg'),
('50124222', 'GV9116', 'https://images.adidas.com.tw/90/imageQC2000030890_2000_1.jpg'),
('50125546', 'GW0562', 'https://images.adidas.com.tw/21/imageQC2000031221_2000_1.jpg'),
('50129334', 'GY0362', 'https://images.adidas.com.tw/75/imageQC2000032175_2000_1.jpg'),
('50134130', 'GZ1603', 'https://images.adidas.com.tw/78/imageQC2000033378_2000_1.jpg'),
('50134278', 'GZ1604', 'https://images.adidas.com.tw/14/imageQC2000033414_2000_1.jpg'),
('50139960', 'GZ6422', 'https://images.adidas.com.tw/78/imageQC2000048678_2000_1.jpg'),
('50140972', 'GX4499', 'https://images.adidas.com.tw/55/imageQC2000035155_2000_1.jpg'),
('50141280', 'GW9354', 'https://images.adidas.com.tw/22/imageQC2000035222_2000_1.jpg'),
('50142448', 'GZ2202', 'https://images.adidas.com.tw/24/imageQC2000035524_2000_1.jpg'),
('50142544', 'GY7136', 'https://images.adidas.com.tw/49/imageQC2000035549_2000_1.jpg'),
('50143780', 'HP5500', 'https://images.adidas.com.tw/57/imageQC2000035857_2000_1.jpg'),
('50149782', 'GW6822', 'https://images.adidas.com.tw/58/imageQC2000037358_2000_1.jpg'),
('50151900', 'GY7135', 'https://images.adidas.com.tw/94/imageQC2000037894_2000_1.jpg'),
('50174742', 'GY4586', 'https://images.adidas.com.tw/19/imageQC2000043619_2000_1.jpg'),
('50175146', 'GX9406', 'https://images.adidas.com.tw/27/imageQC2000043727_2000_1.jpg'),
('50188560', 'GW9358', 'https://images.adidas.com.tw/81/imageQC2000047081_2000_1.jpg'),
('50188848', 'GY7006', 'https://images.adidas.com.tw/55/imageQC2000047155_2000_1.jpg'),
('50188936', 'GY7005', 'https://images.adidas.com.tw/77/imageQC2000047177_2000_1.jpg'),
('50189244', 'GW9367', 'https://images.adidas.com.tw/59/imageQC2000047259_2000_1.jpg'),
('50191328', 'HP5498', 'https://images.adidas.com.tw/80/imageQC2000047780_2000_1.jpg'),
('50191748', 'HP5501', 'https://images.adidas.com.tw/55/imageQC2000059155_2000_1.jpg'),
('50206908', 'FZ5594', 'https://images.adidas.com.tw/84/imageQC2000051684_2000_1.jpg'),
('50208548', 'HP8021', 'https://images.adidas.com.tw/96/imageQC2000052096_2000_1.jpg'),
('50209628', 'HP9845', 'https://images.adidas.com.tw/65/imageQC2000052365_2000_1.jpg'),
('50209852', 'GX2215', 'https://images.adidas.com.tw/13/imageQC2000052413_2000_1.jpg'),
('50209920', 'GX2214', 'https://images.adidas.com.tw/31/imageQC2000052431_2000_1.jpg'),
('50219396', 'GY4559', 'https://images.adidas.com.tw/04/imageQC2000054804_2000_1.jpg'),
('50219804', 'HR1481', 'https://images.adidas.com.tw/07/imageQC2000054907_2000_1.jpg'),
('50224644', 'GX7330', 'https://images.adidas.com.tw/15/imageQC2000056115_2000_1.jpg'),
('50224852', 'GZ5230', 'https://images.adidas.com.tw/90/imageQC2000029290_2000_1.jpg'),
('50234336', 'GY0025', 'https://images.adidas.com.tw/33/imageQC2000058533_2000_1.jpg'),
('50234584', 'GY7338', 'https://images.adidas.com.tw/95/imageQC2000058595_2000_1.jpg'),
('50234676', 'GY7339', 'https://images.adidas.com.tw/18/imageQC2000058618_2000_1.jpg'),
('50237088', 'GY2395', 'https://images.adidas.com.tw/21/imageQC2000059221_2000_1.jpg'),
('50237188', 'H03424', 'https://images.adidas.com.tw/46/imageQC2000059246_2000_1.jpg'),
('50237232', 'GY4656', 'https://images.adidas.com.tw/57/imageQC2000059257_2000_1.jpg'),
('50237732', 'HQ6433', 'https://images.adidas.com.tw/82/imageQC2000059382_2000_1.jpg'),
('50237800', 'HQ6432', 'https://images.adidas.com.tw/99/imageQC2000059399_2000_1.jpg');

-- --------------------------------------------------------

--
-- 檢視表結構 `hot_list`
--
DROP TABLE IF EXISTS `hot_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hot_list`  AS SELECT `parser_text`.`numbers` AS `numbers`, `parser_text`.`id` AS `id`, `parser_text`.`name` AS `name`, `parser_hot_list`.`hot` AS `Hot`, `productid_imgurl`.`imgURL` AS `imgURL` FROM ((`parser_text` join `productid_imgurl` on(`parser_text`.`numbers` = `productid_imgurl`.`numbers`)) join `parser_hot_list` on(`parser_text`.`numbers` = `parser_hot_list`.`numbers`)) ORDER BY `parser_hot_list`.`hot` AS `DESCdesc` ASC  ;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`numbers`);

--
-- 資料表索引 `model_label_50`
--
ALTER TABLE `model_label_50`
  ADD PRIMARY KEY (`numbers`);

--
-- 資料表索引 `productid_imgurl`
--
ALTER TABLE `productid_imgurl`
  ADD PRIMARY KEY (`numbers`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
