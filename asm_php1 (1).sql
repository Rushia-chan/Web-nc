-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2023 at 01:00 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php1`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Trà sữa', '2021-07-07 11:50:15', '2021-11-07 08:07:44'),
(2, 'Sinh tố', '2021-07-07 11:50:15', '2021-07-22 16:07:29'),
(3, 'Trà trái cây', '2021-07-07 11:50:15', '2021-07-22 16:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `fullname`, `phone_number`, `email`, `address`, `note`, `order_date`) VALUES
(144, 'DEMO', '03875723232', 'DEMO@gmail.com', 'DEMO', 'DEMO', '2021-11-07 08:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `id_user`, `num`, `price`, `status`) VALUES
(153, 144, 12, 8, 11, 30000, 'Đã nhận hàng');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `number` float NOT NULL,
  `thumbnail` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `id_category` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `price`, `number`, `thumbnail`, `content`, `id_category`, `created_at`, `updated_at`) VALUES
(1, 'Milô Dầm', 25000, 200, 'uploads/milo_dam_fulltopping.jpg', '<ul><li>20gr bột milô</li><li>50gr sữa đặc</li><li>150ml sữa tươi không đường</li><li>40gr đường</li><li>100gr trân châu đường đen</li></ul>', 2, '2021-07-07 17:41:08', '2023-06-06 12:41:51'),
(2, 'Trà Sữa Kem Trứng', 25000, 50, 'uploads/Tra_sua_kem_trung.jpg', '<ul><li style=\"margin: 0px 0px 4px; padding: 0px;\">5 lòng đỏ trứng gà</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">50g đường kính.</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; \">200ml kem&nbsp;whipping.</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; \">200g trân châu đen.</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">100g đường đen.</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">70ml nước.</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">25g trà&nbsp;đen.</li><li class=\"TrT0Xe\" style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">800ml nước nóng.</li></ul>', 1, '2021-07-07 17:41:08', '2023-06-06 12:48:34'),
(4, 'Trà Đào', 25000, 30, 'uploads/Tra_dao.jpg', '<ul><li style=\"margin: 0px 0px 4px; padding: 0px;\">4 – 5 quả đào.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">1 gói trà đào&nbsp;túi lọc Cozy.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">200ml nước nóng.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">15ml syrup đào.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">20ml nước đường.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">100gr đường cát.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">20ml nước cốt chanh.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">2 – 3 lá húng lủi (bạc hà)</li></ul>', 3, '2021-07-07 17:25:47', '2023-06-06 12:08:40'),
(5, 'Sinh tố dưa hấu', 25000, 10, 'uploads/sinh_to_dua_hau.jpg', '<ul><li><font color=\"#53382c\">100gr dưa hấu</font></li><li><font color=\"#53382c\">1 thìa mật ong</font></li><li><font color=\"#53382c\">1 thìa sữa đặc</font></li><li><font color=\"#53382c\">2 quả chuối cắt nhỏ</font></li><li><font color=\"#53382c\">70ml sữa tươi không đường</font></li></ul>', 2, '2021-07-07 18:36:37', '2023-06-06 12:28:40'),
(8, 'Trà sữa trân trâu đen', 25000, 10, 'uploads/sua_tuoi_ctdd_kem_trung.jpg', '<ul><li style=\"margin: 0px 0px 4px; padding: 0px;\">Trà túi lọc: 1 – 2 gói (ngon nhất là dùng trà ô long, trà đen hoặc trà  xanh)</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Sữa đặc có đường: 2 – 4 muỗng.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Bột năng: 30 gr.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Bột ca cao: 15 gr.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Đường cát trắng: 500 gr.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Nước sôi (vừa đủ ấm): khoảng 1 lít.</li></ul>', 1, '2021-07-11 16:07:58', '2023-06-06 12:34:59'),
(9, 'Trà Sữa Khoai Môn', 25000, 46, 'uploads/Tra_sua_khoai_mon.jpg', '<ul><li style=\"margin: 0px 0px 4px; padding: 0px;\">300gr khoai môn.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">200gr bột khoai môn.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">300ml hồng trà.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">400ml sữa&nbsp;tươi.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">120ml syrup đường.</li></ul>', 1, '2021-07-11 16:38:58', '2023-06-06 12:23:41'),
(13, 'Sinh tố Sapoche', 25000, 20, 'uploads/sinh_to_saboche.jpg', '<ul><li style=\"margin: 0px 0px 4px; padding: 0px;\">2 quả sapoche&nbsp;chín.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">40ml sữa đặc.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">20gr đường cát.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Nước cốt cà phê</li></ul>', 2, '2021-07-07 17:41:08', '2023-06-06 12:42:41'),
(14, 'Sinh tố xoài', 25000, 5, 'uploads/sinh_to_xoai.jpg', '<ul><li style=\"margin: 0px 0px 4px; padding: 0px;\">Xoài chín: 200gr.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Đường cát: 20gr.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Sữa đặc: 40ml = 1.3 oz.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Sữa tươi: 20ml = 0.6 oz.</li></ul>', 2, '2021-07-07 17:41:08', '2023-06-06 12:57:41'),
(16, 'Trà Đào Cam Xả', 25000, 30, 'uploads/Tra_dao_cam_xa.jpg', '<ul><li style=\"margin: 0px 0px 4px; padding: 0px;\">1 quả cam&nbsp;vàng.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">40ml siro đào.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">20ml siro cam.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">2 gói trà&nbsp;túi lọc.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">5 cây sả<b>.</b></li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">2 miêng đào&nbsp;hộp.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Syrup đường.</li></ul>', 3, '2021-07-07 17:25:47', '2023-06-06 12:12:42'),
(17, 'Sữa tươi kem trứng', 25000, 10, 'uploads/sua_tuoi_ctdd_kem_trung.jpg', '<ul><li>Sữa tươi không đường: 120ml</li><li>Trân châu đường đen Master: 80gr</li><li>Kem trứng: 40ml</li></ul>', 2, '2021-07-07 18:36:37', '2023-06-06 12:33:42'),
(18, 'Trà Sữa Matcha', 25000, 10, 'uploads/Tra_sua_matcha_kemcheese.jpg', '<ul><li style=\"margin: 0px 0px 4px; padding: 0px;\">2 gói trà&nbsp;xanh túi lọc.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">100gr sữa&nbsp;bột Indo.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">100ml sữa&nbsp;tươi.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">2 muỗng canh bột matcha trà xanh.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">80gr đường cát trắng.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">10gr bột rau câu dẻo.</li></ul><p><br></p>', 1, '2021-07-11 16:07:58', '2023-06-06 12:59:43'),
(19, 'Trà Sữa Truyền Thống', 50000, 46, 'uploads/tra_sua_truyen_thong.jpg', '<ul><li>20g hồng trà (hoặc trà túi lọc, hay bất cứ loại trà nào bạn thích)</li><li>500ml nước lọc</li><li>500ml sữa tươi không đường</li><li>70g đường nâu</li></ul>', 1, '2021-07-11 16:38:58', '2023-06-06 12:43:45'),
(20, 'Trà Sữa Thái Xanh', 35000, 44, 'uploads/Tra_sua_thai_xanh.jpg', '\r\n<ul><li>Trà thái xanh</li><li>Bột Béo B\'one hoặc bột béo Kievit.</li><li>Bột Rau câu dẻo.Sữa Đặc La Rosee.</li><li>Bột Rau câu dẻo.</li></ul>', 1, '2021-07-11 16:12:59', '2023-06-06 12:02:52'),
(21, 'Trà Sen Kem Cheese', 25000, 15, 'uploads/Tra_sen_kem_cheese.jpg', '<ul><li style=\"margin: 0px 0px 4px; padding: 0px;\">70g kem cheese.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">50g sữa đặc.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">60g bột cheese.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">2g muối himalaya.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">100ml sữa nguyên kem.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">150ml whipping.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">300g hạt sen.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">1 khoang đường thốt nốt.</li></ul>', 3, '2021-07-13 10:20:53', '2023-06-06 12:50:48'),
(26, 'Sữa Tươi Matcha', 25000, 100, 'uploads/sua_tuoi_matcha.jpg', '<ul><li>2 thìa cà phê bột matcha</li><li>1 muỗng canh nước sôi</li><li>250ml sữa</li><li>1 thìa cà phê đường﻿</li></ul>', 2, '2021-08-15 08:36:27', '2023-06-06 12:08:50'),
(28, 'Trà Dâu', 25000, 90, 'uploads/tra_Dau.jpg', '<ul><li style=\"margin: 0px 0px 4px; padding: 0px;\">700g dâu&nbsp;tây tươi.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">400g đường cát.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">20g trà&nbsp;nhài.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">500ml nước sôi.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Chanh tươi.</li></ul>', 3, '2021-08-15 08:25:31', '2023-06-06 12:35:50'),
(29, 'Trà tắc', 20000, 20, 'uploads/tra_tac.jpg', '<ul><li style=\"margin: 0px 0px 4px; padding: 0px;\">Trà Lipton túi lọc: 2 túi.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Quả tắc: 5 quả</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Chanh: ½ quả</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Nước đường: 40ml.</li><li style=\"margin: 0px 0px 4px; padding: 0px; list-style-type: disc;\">Nước sôi: 200ml.</li></ul>', 3, '2021-08-15 08:19:32', '2023-06-06 12:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `hoten` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `hoten`, `username`, `password`, `phone`, `email`) VALUES
(1, 'Nguyễn Doãn Tùng', 'admin', 'abc123', '+84348008939', 'abc123@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
