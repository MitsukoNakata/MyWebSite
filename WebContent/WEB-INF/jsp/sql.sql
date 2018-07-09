SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `pc_robin` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `pc_robin`;

CREATE TABLE `m_delivery_method` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `price` int(11) NOT NULL
);

CREATE TABLE `m_item` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `detail` text,
  `price` int(11) DEFAULT NULL,
  `file_name` varchar(256) DEFAULT NULL
);

-- テーブルの構造 `t_buy`
--

CREATE TABLE `t_buy` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `delivery_method_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL
);

-- --------------------------------------------------------

--
-- テーブルの構造 `t_buy_detail`
--

CREATE TABLE `t_buy_detail` (
  `id` int(11) NOT NULL,
  `buy_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- テーブルの構造 `t_user`
--

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` date DEFAULT NULL
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_delivery_method`
--
ALTER TABLE `m_delivery_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_item`
--
ALTER TABLE `m_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_buy`
--
ALTER TABLE `t_buy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_buy_detail`
--
ALTER TABLE `t_buy_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_delivery_method`
--
ALTER TABLE `m_delivery_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `m_item`
--
ALTER TABLE `m_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;
--
-- AUTO_INCREMENT for table `t_buy`
--
ALTER TABLE `t_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_buy_detail`
--
ALTER TABLE `t_buy_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
