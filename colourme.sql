-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-12-06 09:16:57
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
-- 資料表結構 `df50`
--

CREATE TABLE `df50` (
  `numbers` char(8) NOT NULL,
  `id` char(6) NOT NULL,
  `imgURL` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `df50`
--

INSERT INTO `df50` (`numbers`, `id`, `imgURL`) VALUES
('50124546', 'GX6390', 'https://images.adidas.com.tw/85/imageQC2000030985_2000_1.jpg'),
('50125266', 'GX6320', 'https://images.adidas.com.tw/63/imageQC2000031163_2000_1.jpg'),
('50125546', 'GW0562', 'https://images.adidas.com.tw/21/imageQC2000031221_2000_1.jpg'),
('50128810', 'GW3958', 'https://images.adidas.com.tw/41/imageQC2000032041_2000_1.jpg'),
('50129334', 'GY0362', 'https://images.adidas.com.tw/75/imageQC2000032175_2000_1.jpg'),
('50134130', 'GZ1603', 'https://images.adidas.com.tw/78/imageQC2000033378_2000_1.jpg'),
('50134278', 'GZ1604', 'https://images.adidas.com.tw/14/imageQC2000033414_2000_1.jpg'),
('50134654', 'GZ2204', 'https://images.adidas.com.tw/08/imageQC2000033508_2000_1.jpg'),
('50135218', 'GZ1893', 'https://images.adidas.com.tw/48/imageQC2000033648_2000_1.jpg'),
('50139956', 'GZ6422', 'https://images.adidas.com.tw/78/imageQC2000048678_2000_1.jpg'),
('50141060', 'HQ6334', 'https://images.adidas.com.tw/73/imageQC2000035173_2000_1.jpg'),
('50141244', 'GW9354', 'https://images.adidas.com.tw/22/imageQC2000035222_2000_1.jpg'),
('50141920', 'GW6776', 'https://images.adidas.com.tw/92/imageQC2000035392_2000_1.jpg'),
('50143776', 'HP5500', 'https://images.adidas.com.tw/57/imageQC2000035857_2000_1.jpg'),
('50149300', 'GW0490', 'https://images.adidas.com.tw/37/imageQC2000037237_2000_1.jpg'),
('50162666', 'FZ6152', 'https://images.adidas.com.tw/87/imageQC2000040587_2000_1.jpg'),
('50162730', 'FZ6153', 'https://images.adidas.com.tw/02/imageQC2000040602_2000_1.jpg'),
('50162782', 'FZ6154', 'https://images.adidas.com.tw/16/imageQC2000040616_2000_1.jpg'),
('50174718', 'GY4586', 'https://images.adidas.com.tw/19/imageQC2000043619_2000_1.jpg'),
('50175146', 'GX9406', 'https://images.adidas.com.tw/27/imageQC2000043727_2000_1.jpg'),
('50188204', 'GX7087', 'https://images.adidas.com.tw/00/imageQC2000047000_2000_1.jpg'),
('50188528', 'GW9358', 'https://images.adidas.com.tw/81/imageQC2000047081_2000_1.jpg'),
('50188752', 'GX9513', 'https://images.adidas.com.tw/37/imageQC2000047137_2000_1.jpg'),
('50188848', 'GY7006', 'https://images.adidas.com.tw/55/imageQC2000047155_2000_1.jpg'),
('50188936', 'GY7005', 'https://images.adidas.com.tw/77/imageQC2000047177_2000_1.jpg'),
('50189240', 'GW9367', 'https://images.adidas.com.tw/59/imageQC2000047259_2000_1.jpg'),
('50191032', 'HP5578', 'https://images.adidas.com.tw/07/imageQC2000047707_2000_1.jpg'),
('50191184', 'HP7833', 'https://images.adidas.com.tw/45/imageQC2000047745_2000_1.jpg'),
('50191324', 'HP5498', 'https://images.adidas.com.tw/80/imageQC2000047780_2000_1.jpg'),
('50191824', 'HP5587', 'https://images.adidas.com.tw/05/imageQC2000047905_2000_1.jpg'),
('50191896', 'HP5580', 'https://images.adidas.com.tw/23/imageQC2000047923_2000_1.jpg'),
('50199158', 'GX4582', 'https://images.adidas.com.tw/43/imageQC2000049743_2000_1.jpg'),
('50199466', 'GX9507', 'https://images.adidas.com.tw/21/imageQC2000049821_2000_1.jpg'),
('50200284', 'GW4354', 'https://images.adidas.com.tw/51/imageQC2000056151_2000_1.jpg'),
('50206900', 'FZ5594', 'https://images.adidas.com.tw/84/imageQC2000051684_2000_1.jpg'),
('50208548', 'HP8021', 'https://images.adidas.com.tw/96/imageQC2000052096_2000_1.jpg'),
('50209624', 'HP9845', 'https://images.adidas.com.tw/65/imageQC2000052365_2000_1.jpg'),
('50209824', 'GX2215', 'https://images.adidas.com.tw/13/imageQC2000052413_2000_1.jpg'),
('50209912', 'GX2214', 'https://images.adidas.com.tw/31/imageQC2000052431_2000_1.jpg'),
('50219392', 'GY4559', 'https://images.adidas.com.tw/04/imageQC2000054804_2000_1.jpg'),
('50219804', 'HR1481', 'https://images.adidas.com.tw/07/imageQC2000054907_2000_1.jpg'),
('50220480', 'HP6699', 'https://images.adidas.com.tw/76/imageQC2000055076_2000_1.jpg'),
('50220604', 'HP6697', 'https://images.adidas.com.tw/04/imageQC2000055104_2000_1.jpg'),
('50221810', 'HQ8874', 'https://images.adidas.com.tw/70/imageQC2000054870_2000_1.jpg'),
('50224272', 'GY2505', 'https://images.adidas.com.tw/22/imageQC2000056022_2000_1.jpg'),
('50224644', 'GX7330', 'https://images.adidas.com.tw/15/imageQC2000056115_2000_1.jpg'),
('50224804', 'GW2012', 'https://images.adidas.com.tw/59/imageQC2000052459_2000_1.jpg'),
('50224852', 'GZ5230', 'https://images.adidas.com.tw/90/imageQC2000029290_2000_1.jpg'),
('50236824', 'HP5501', 'https://images.adidas.com.tw/55/imageQC2000059155_2000_1.jpg'),
('50237188', 'H03424', 'https://images.adidas.com.tw/46/imageQC2000059246_2000_1.jpg'),
('50237232', 'GY4656', 'https://images.adidas.com.tw/57/imageQC2000059257_2000_1.jpg');

-- --------------------------------------------------------

--
-- 資料表結構 `text`
--

CREATE TABLE `text` (
  `numbers` char(8) NOT NULL,
  `id` char(6) NOT NULL,
  `name` varchar(15) NOT NULL,
  `text` varchar(50) DEFAULT NULL,
  `price` int(5) NOT NULL,
  `url` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `text`
--

INSERT INTO `text` (`numbers`, `id`, `name`, `text`, `price`, `url`) VALUES
('50124546', 'GX6390', 'Pride X Campus ', '\'鞋帶設計\', \'皮革鞋面\', \'皮革內裡\', \'橡膠大底\'', 2199, 'https://www.adidas.com.tw/product/50124546'),
('50125266', 'GX6320', 'Superstar 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'經典皮革鞋款\', \'橡膠大底\'', 1799, 'https://www.adidas.com.tw/product/50125266'),
('50125546', 'GW0562', 'Retropy E5 經典鞋', '\'鞋帶設計\', \'網布鞋面搭配車縫麂皮表層\', \'網布內裡\', \'Boost 中底\', \'橡膠大底\'', 2559, 'https://www.adidas.com.tw/product/50125546'),
('50128810', 'GW3958', 'OZWEEGO 經典鞋', '\'鞋帶設計\', \'網布鞋面\', \'網布內裡\', \'Adiprene 避震科技\', \'橡膠大底\', \'', 2559, 'https://www.adidas.com.tw/product/50128810'),
('50129334', 'GY0362', 'Agent Gil Resto', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'Boost 中底\', \'Formotion 結構\'', 2999, 'https://www.adidas.com.tw/product/50129334'),
('50134130', 'GZ1603', 'Superstar 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'反光拼接設計\'', 2559, 'https://www.adidas.com.tw/product/50134130'),
('50134278', 'GZ1604', 'Superstar 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'反光拼接設計\'', 2559, 'https://www.adidas.com.tw/product/50134278'),
('50134654', 'GZ2204', 'Andre Saraiva x', '\'鞋帶設計\', \'網布鞋面\', \'網布內裡\', \'橡膠大底\', \'鞋面採用超過 50% 的再生材質\'', 2299, 'https://www.adidas.com.tw/product/50134654'),
('50135218', 'GZ1893', 'Forum 84 LG 經典鞋', '\'一般版型\', \'皮革鞋面\', \'合成皮革內裡\', \'網布鞋墊\', \'橡膠大底\'', 3259, 'https://www.adidas.com.tw/product/50135218'),
('50139956', 'GZ6422', 'Agent Gil Resto', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'Boost 中底\', \'Formotion 結構\'', 2999, 'https://www.adidas.com.tw/product/50139956'),
('50141060', 'HQ6334', 'Forum Low 經典鞋', '\'鞋帶設計，搭配黏扣帶\', \'合成材質鞋面\', \'網布內裡\', \'橡膠大底\', \'鞋面採用超過 50', 2299, 'https://www.adidas.com.tw/product/50141060'),
('50141244', 'GW9354', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面，搭配車縫麂皮和網布表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大', 2159, 'https://www.adidas.com.tw/product/50141244'),
('50141920', 'GW6776', 'Retropy E5 經典鞋', '\'鞋帶設計\', \'Monomesh 鞋面搭配縫線麂皮表層\', \'網布內裡\', \'BOOST 中底\',', 4290, 'https://www.adidas.com.tw/product/50141920'),
('50143776', 'HP5500', 'Superstar 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% ', 2299, 'https://www.adidas.com.tw/product/50143776'),
('50149300', 'GW0490', 'Stan Smith 經典鞋', '\'一般版型\', \'鞋帶設計\', \'合成皮鞋面\', \'包覆腳感\', \'合成皮革內裡\', \'橡膠大底\',', 1999, 'https://www.adidas.com.tw/product/50149300'),
('50162666', 'FZ6152', 'Campus 80s 經典鞋', '\'鞋帶設計\', \'磨砂革鞋面\', \'皮革內裡\', \'橡膠大底\'', 3690, 'https://www.adidas.com.tw/product/50162666'),
('50162730', 'FZ6153', 'Campus 80s 經典鞋', '\'鞋帶設計\', \'磨砂革鞋面\', \'皮革內裡\', \'橡膠大底\'', 3690, 'https://www.adidas.com.tw/product/50162730'),
('50162782', 'FZ6154', 'Campus 80s 經典鞋', '\'鞋帶設計\', \'磨砂革鞋面\', \'皮革內裡\', \'橡膠大底\'', 3690, 'https://www.adidas.com.tw/product/50162782'),
('50174718', 'GY4586', 'Campus 80s 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'皮革內裡\', \'橡膠大底\'', 2699, 'https://www.adidas.com.tw/product/50174718'),
('50175146', 'GX9406', 'Campus 80s 經典鞋', '\'麂皮鞋面\', \'橡膠大底\'', 2199, 'https://www.adidas.com.tw/product/50175146'),
('50188204', 'GX7087', 'Niteball 2.0 經典', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50%', 4290, 'https://www.adidas.com.tw/product/50188204'),
('50188528', 'GW9358', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面，搭配車縫麂皮和網布表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大', 3090, 'https://www.adidas.com.tw/product/50188528'),
('50188752', 'GX9513', 'Disney Kermit 科', '\'一般版型\', \'鞋帶設計\', \'合成皮鞋面\', \'圖案鞋墊\', \'橡膠大底\', \'迪士尼版權所有\'', 3690, 'https://www.adidas.com.tw/product/50188752'),
('50188848', 'GY7006', 'COOK x Campus 8', '\'一般版型\', \'鞋帶設計\', \'麂皮和皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'25% ', 3890, 'https://www.adidas.com.tw/product/50188848'),
('50188936', 'GY7005', 'COOK x Campus 8', '\'一般版型\', \'鞋帶設計\', \'麂皮和皮革鞋面\', \'合成材質內裡\', \'橡膠大底\', \'25% ', 3890, 'https://www.adidas.com.tw/product/50188936'),
('50189240', 'GW9367', 'Retropy F2 經典鞋', '\'鞋帶設計\', \'網布鞋面，搭配車縫麂皮和網布表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大', 3090, 'https://www.adidas.com.tw/product/50189240'),
('50191032', 'HP5578', 'Disney 公主與青蛙 x ', '\'一般版型\', \'鞋帶設計\', \'合成皮鞋面\', \'網布內裡\', \'圖案鞋墊\', \'橡膠大底\', \'', 3690, 'https://www.adidas.com.tw/product/50191032'),
('50191184', 'HP7833', 'OZWEEGO Meta 經典', '\'鞋帶設計\', \'網布搭配皮革鞋面\', \'Adiprene 和 Adiprene+ 避震科技\', \'', 4290, 'https://www.adidas.com.tw/product/50191184'),
('50191324', 'HP5498', 'Superstar 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% ', 3490, 'https://www.adidas.com.tw/product/50191324'),
('50191824', 'HP5587', 'Disney Cruella ', '\'一般版型\', \'鞋帶設計\', \'合成材質鞋面\', \'合成材質內裡\', \'橡膠大底\', \'鞋面採用超', 3690, 'https://www.adidas.com.tw/product/50191824'),
('50191896', 'HP5580', 'Disney 木偶奇遇記 x ', '\'一般版型\', \'鞋帶設計\', \'合成皮鞋面\', \'圖案鞋墊\', \'橡膠大底\', \'迪士尼版權所有\'', 3690, 'https://www.adidas.com.tw/product/50191896'),
('50199158', 'GX4582', 'USA 84 經典鞋', '\'鞋帶設計\', \'網布鞋面搭配車縫合成麂皮表層\', \'網布內裡\', \'EVA 中底\', \'橡膠大底\'', 2690, 'https://www.adidas.com.tw/product/50199158'),
('50199466', 'GX9507', 'Disney 烏蘇拉 x St', '\'一般版型\', \'鞋帶設計\', \'合成皮鞋面\', \'合成材質內裡\', \'圖案鞋墊\', \'橡膠大底\',', 3690, 'https://www.adidas.com.tw/product/50199466'),
('50200284', 'GW4354', 'Forum Luxe 經典鞋', '\'鞋帶設計\', \'網布鞋面\', \'皮革內裡\', \'橡膠大底\', \'25% 的鞋面原料含有至少 50%', 4290, 'https://www.adidas.com.tw/product/50200284'),
('50206900', 'FZ5594', 'Gazelle 85 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'皮革內裡\', \'橡膠大底\'', 3890, 'https://www.adidas.com.tw/product/50206900'),
('50208548', 'HP8021', 'Retropy F90 經典鞋', '\'鞋帶設計\', \'網布鞋面\', \'EVA 中底\', \'Torsion System\', \'橡膠大底\'', 3690, 'https://www.adidas.com.tw/product/50208548'),
('50209624', 'HP9845', 'Superstar 經典鞋', '\'一般版型\', \'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\'', 3690, 'https://www.adidas.com.tw/product/50209624'),
('50209824', 'GX2215', 'Centennial 85 經', '\'鞋帶設計\', \'網布和磨砂革鞋面\', \'網布內裡\', \'橡膠大底\'', 3490, 'https://www.adidas.com.tw/product/50209824'),
('50209912', 'GX2214', 'Centennial 85 經', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% ', 3490, 'https://www.adidas.com.tw/product/50209912'),
('50219392', 'GY4559', 'Puffylette 運動拖鞋', '\'一般版型\', \'套穿式設計\', \'尼龍鞋面\', \'網布內裡\', \'合成材質大底\', \'鞋面含再生材', 2690, 'https://www.adidas.com.tw/product/50219392'),
('50219804', 'HR1481', 'Puffylette 運動拖鞋', '\'一般版型\', \'套穿式設計\', \'尼龍鞋面\', \'支持瑞士良好棉花發展協會\', \'EVA 中底和大', 2890, 'https://www.adidas.com.tw/product/50219804'),
('50220480', 'HP6699', 'Atmos x Puffyle', '\'套穿式設計\', \'尼龍鞋面\', \'合成材質大底\', \'鞋面採用超過 50% 的再生材質\'', 3090, 'https://www.adidas.com.tw/product/50220480'),
('50220604', 'HP6697', 'Atmos x Puffyle', '\'套穿式設計\', \'尼龍鞋面\', \'合成材質大底\', \'鞋面採用超過 50% 的再生材質\'', 3090, 'https://www.adidas.com.tw/product/50220604'),
('50221810', 'HQ8874', 'Descendant x Ca', '\'鞋帶設計\', \'合成麂皮鞋面\', \'合成皮革內裡\', \'橡膠大底\', \'鞋面含再生材質\'', 3690, 'https://www.adidas.com.tw/product/50221810'),
('50224272', 'GY2505', 'Jeremy Scott x ', '\'套穿式設計\', \'皮革鞋面\', \'合成材質內裡\', \'合成材質大底\'', 3090, 'https://www.adidas.com.tw/product/50224272'),
('50224644', 'GX7330', 'Campus 80s 經典鞋', '\'皮革鞋面\', \'皮革內裡\', \'橡膠大底\'', 3690, 'https://www.adidas.com.tw/product/50224644'),
('50224804', 'GW2012', 'Forum Luxe 經典鞋', '\'鞋帶設計\', \'軟呢、麂皮和皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至', 4290, 'https://www.adidas.com.tw/product/50224804'),
('50224852', 'GZ5230', 'OZWEEGO CELOX 經', '\'襪套式設計\', \'鞋帶設計\', \'織物鞋面\', \'包覆腳感\', \'合成皮內裡\', \'橡膠大底\', ', 3099, 'https://www.adidas.com.tw/product/50224852'),
('50236824', 'HP5501', 'Superstar 經典鞋', '\'鞋帶設計\', \'皮革鞋面\', \'網布內裡\', \'橡膠大底\', \'25% 的鞋面結構以至少 50% ', 3090, 'https://www.adidas.com.tw/product/50236824'),
('50237188', 'H03424', 'Forum 經典鞋', '\'鞋帶設計搭配可調式黏扣帶\', \'合成鞋面\', \'網布內裡\', \'橡膠外底\', \'鞋面含再生材質\'', 3690, 'https://www.adidas.com.tw/product/50237188'),
('50237232', 'GY4656', 'Superstar Vegan', '\'鞋帶設計\', \'合成材質鞋面\', \'合成材質內裡\', \'橡膠大底\', \'純素替代材質：含有 25%', 3490, 'https://www.adidas.com.tw/product/50237232');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `df50`
--
ALTER TABLE `df50`
  ADD PRIMARY KEY (`numbers`);

--
-- 資料表索引 `text`
--
ALTER TABLE `text`
  ADD PRIMARY KEY (`numbers`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
