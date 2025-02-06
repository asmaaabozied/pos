-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 31, 2025 at 11:46 AM
-- Server version: 10.4.34-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_salepro`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_no` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'Bank Account',
  `parent_account_id` int(11) DEFAULT NULL,
  `is_payment` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_no`, `name`, `initial_balance`, `total_balance`, `note`, `is_default`, `is_active`, `created_at`, `updated_at`, `code`, `type`, `parent_account_id`, `is_payment`) VALUES
(1, '11111', 'Sales Accounts', 1000, 1000, 'this is first account', 1, 1, '2018-12-18 02:58:02', '2024-03-12 07:57:50', NULL, 'Bank Account', NULL, 1),
(3, '21211', 'Sa', NULL, 0, NULL, 0, 1, '2018-12-18 02:58:56', '2019-01-20 09:59:06', NULL, 'Bank Account', NULL, 1),
(5, 'bank-1', 'zuhair', 100000, 100000, NULL, NULL, 0, '2022-11-28 05:58:18', '2025-01-27 13:37:00', NULL, 'Bank Account', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(255) NOT NULL,
  `checkout` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `date`, `employee_id`, `user_id`, `checkin`, `checkout`, `status`, `note`, `created_at`, `updated_at`) VALUES
(1, '2025-01-27', 1, 1, '10:00am', '6:00pm', 1, NULL, '2025-01-27 13:26:50', '2025-01-27 13:26:50'),
(2, '2025-01-27', 2, 1, '10:00am', '6:00pm', 1, NULL, '2025-01-27 13:27:02', '2025-01-27 13:27:02'),
(3, '2025-01-26', 1, 1, '10:00am', '6:00pm', 1, NULL, '2025-01-27 13:27:13', '2025-01-27 13:27:13'),
(5, '2025-01-26', 2, 1, '10:00am', '6:00pm', 1, NULL, '2025-01-27 13:28:13', '2025-01-27 13:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `is_custom` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `is_custom`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, 1.5000, 2.0000, 8.2700, 11.6900, 0.5000, 0.5000, 0.2500, 0.5000, 3, 1, 0, 10, 1, '2025-01-28 09:57:47', '2025-01-28 10:16:18');

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'John Watson', NULL, 'The solution', NULL, 'john@gmail.com', '312313', '36 housing road', 'london', NULL, NULL, 'England', 1, '2024-01-19 13:30:23', '2024-01-19 13:30:23');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `og_title` varchar(255) DEFAULT NULL,
  `og_image` varchar(255) DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `slug`, `title`, `description`, `thumbnail`, `youtube`, `meta_title`, `meta_description`, `og_title`, `og_image`, `og_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'sell-online-with-optimal-pos-ecommerce', 'Sell online with Optimal POS eCommerce', '<p><a href=\"https://codecanyon.net/item/lims-stock-manager-pro-with-pos/22256829\" target=\"_blank\" rel=\"noopener\">Buy Optimal POS</a> Unleash the potential of your online business with <strong>eCommerce Optimal POS</strong>. Leverage the power of eCommerce alongside your existing shop setup. Connect and manage both your offline POS and online eCommerce store from within one simple, yet powerful admin panel. Our eCommerce add-on offers all the options available in any comparable eCommerce php script, if not more. From dynamic menus, pages, collections to sliders, page widgets, drag &amp; drop layout builder; it has it all. We are committed to bring in more features to make it the best option for eCommerce php script. eCommerce add-on along with Optimal POS will help you realize the true potential of your multichannel business.</p>', NULL, NULL, 'Sell online with eCommerce Optimal POS', 'Sell online with eCommerce Optimal POS', 'Sell online with eCommerce Optimal POS', NULL, 'Sell online with eCommerce Optimal POS', '2025-01-20 09:53:01', '2025-01-20 09:53:01'),
(2, 1, 'how-ecommerce-compliments-your-online-sales', 'How eCommerce compliments your online sales', '<p><a href=\"https://codecanyon.net/item/lims-stock-manager-pro-with-pos/22256829\" target=\"_blank\" rel=\"noopener\">Buy Optimal POS</a> Unleash the potential of your offline business with <strong>eCommerce Optimal POS</strong>. Leverage the power of eCommerce alongside your existing shop setup. Connect and manage both your offline POS and online eCommerce store from within one simple, yet powerful admin panel. Our eCommerce add-on offers all the options available in any comparable eCommerce php script, if not more. From dynamic menus, pages, collections to sliders, page widgets, drag &amp; drop layout builder; it has it all. We are committed to bring in more features to make it the best option for eCommerce php script. eCommerce add-on along with Optimal POS will help you realize the true potential of your multichannel business.</p>', NULL, NULL, 'Sell online with eCommerce Optimal POS', 'Sell online with eCommerce Optimal POS', 'Sell online with eCommerce Optimal POS', NULL, 'Sell online with eCommerce Optimal POS', '2025-01-20 09:54:11', '2025-01-20 09:54:11'),
(3, 1, 'why-you-should-sell-online-in-2025', 'Why you should sell online in 2025', '<p>Why you should sell online in 2025</p>', NULL, NULL, 'Why you should sell online in 2025', 'Why you should sell online in 2025', 'Why you should sell online in 2025', NULL, 'Why you should sell online in 2025', '2025-01-20 09:54:47', '2025-01-20 09:54:47');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `image`, `page_title`, `short_description`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Apple', '20250127110737.jpg', NULL, NULL, 'apple', 1, '2024-01-08 05:25:12', '2025-01-27 10:07:37'),
(2, 'Samsung', '20250127110708.jpg', NULL, NULL, 'samsung', 1, '2024-01-08 05:25:12', '2025-01-27 10:07:08'),
(3, 'Huawei', '20250127110604.jpg', NULL, NULL, 'huawei', 1, '2024-01-08 05:25:12', '2025-01-27 10:06:04'),
(4, 'Xiaomi', '20250127110809.jpg', NULL, NULL, 'xiaomi', 1, '2024-01-08 05:25:12', '2025-01-27 10:08:09'),
(5, 'Whirlpool', '20240114103701.png', NULL, NULL, 'whirlpool', 1, '2024-01-08 05:25:12', '2024-09-25 12:01:46'),
(6, 'Nestle', '20250127110434.jpg', NULL, NULL, 'nestle', 1, '2024-01-08 05:25:12', '2025-01-27 10:04:34'),
(7, 'Kraft', '20240114103851.png', NULL, NULL, 'kraft', 1, '2024-01-08 05:25:12', '2024-09-25 12:01:46'),
(8, 'Kellogs', '20250127110847.jpg', NULL, NULL, 'kellogs', 1, '2024-01-08 05:25:12', '2025-01-27 10:08:47'),
(9, 'Unilever', '20250127110915.jpg', NULL, NULL, 'unilever', 1, '2024-01-08 05:25:12', '2025-01-27 10:09:15'),
(10, 'LG', '20250127111206.jpg', NULL, NULL, 'lg', 1, '2024-01-08 05:25:12', '2025-01-27 10:12:06'),
(11, 'Haier', '20250127111251.jpg', NULL, NULL, 'haier', 1, '2024-01-08 05:25:12', '2025-01-27 10:12:51'),
(12, 'Bosch', '20250127111514.jpg', NULL, NULL, 'bosch', 1, '2024-01-08 05:25:12', '2025-01-27 10:15:14'),
(13, 'Siemens', '20250127111957.jpg', NULL, NULL, 'siemens', 1, '2024-01-08 05:25:12', '2025-01-27 10:19:57'),
(14, 'Philips', '20250127112132.jpg', NULL, NULL, 'philips', 1, '2024-01-08 05:25:12', '2025-01-27 10:21:32'),
(15, 'Nike', '20250127112207.jpg', NULL, NULL, 'nike', 1, '2024-01-08 05:25:12', '2025-01-27 10:22:07'),
(16, 'Adidas', '20240114104112.png', NULL, NULL, 'adidas', 1, '2024-01-08 05:25:12', '2024-09-25 12:01:46'),
(17, 'Canon', '20250127110124.png', NULL, NULL, 'canon', 1, '2024-01-14 09:48:15', '2025-01-27 10:01:24'),
(18, 'Omega', '20250127112249.jpg', NULL, NULL, 'omega', 1, '2024-01-19 13:13:54', '2025-01-27 10:22:49'),
(19, 'jhakanaka', '20240119071354.jpg', NULL, NULL, 'jhakanaka', 0, '2024-04-29 12:28:31', '2025-01-27 10:22:22');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `cash_in_hand`, `user_id`, `warehouse_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 100, 1, 2, 1, '2024-01-19 14:46:52', '2024-01-19 14:46:52'),
(2, 150, 1, 1, 1, '2024-01-19 14:47:08', '2024-01-19 14:47:08'),
(3, 1000, 47, 1, 1, '2025-01-30 07:53:51', '2025-01-30 07:53:51');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `page_title`, `short_description`, `slug`, `icon`, `featured`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Smartphone & Gadges', NULL, NULL, NULL, NULL, 'smartphone-gadges', '20250123031517.png', 1, 1, '2024-01-04 19:22:14', '2024-09-25 12:01:46'),
(2, 'Phone Accessories', NULL, 1, NULL, NULL, 'phone-accessories', '20250123102843.png', 1, 1, '2024-01-04 19:22:14', '2024-09-25 12:01:46'),
(3, 'iPhone', NULL, 1, NULL, NULL, 'iphone', '20250123102914.png', 1, 1, '2024-01-04 19:22:14', '2024-09-25 12:01:46'),
(4, 'Samsung', NULL, 1, NULL, NULL, 'samsung', '20250123102954.png', 1, 1, '2024-01-04 19:22:14', '2024-09-25 12:01:46'),
(5, 'Phone Cases', NULL, 1, NULL, NULL, 'phone-cases', '20250123103040.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(6, 'Laptops & Computers', NULL, NULL, NULL, NULL, 'laptops-computers', '20250123031616.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(7, 'Keyboards', NULL, 6, NULL, NULL, 'keyboards', '20250123103205.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(8, 'Laptop Bags', NULL, 6, NULL, NULL, 'laptop-bags', '20250123103236.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(9, 'Mouses', NULL, 6, NULL, NULL, 'mouses', '20250123103311.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(10, 'Webcams', NULL, 6, NULL, NULL, 'webcams', '20250123103353.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(11, 'Monitors', NULL, 6, NULL, NULL, 'monitors', '20250123103516.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(12, 'Smartwatches', NULL, NULL, NULL, NULL, 'smartwatches', '20250123101624.png', 0, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(13, 'Sport Watches', NULL, 12, NULL, NULL, 'sport-watches', '20250123103612.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(14, 'Kids Watches', NULL, 12, NULL, NULL, 'kids-watches', '20250123103656.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(15, 'Women Watches', NULL, 12, NULL, NULL, 'women-watches', '20250123103826.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(16, 'Men Watches', NULL, 12, NULL, NULL, 'men-watches', '20250123103837.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(17, 'Appliances', '20240117121109.png', NULL, NULL, NULL, 'appliances', '20250120113129.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(18, 'Dishwashers', NULL, 17, NULL, NULL, 'dishwashers', '20250123100130.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(19, 'Dryers', NULL, 17, NULL, NULL, 'dryers', '20250123103956.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(20, 'Washing machine', NULL, 17, NULL, NULL, 'washing-machine', '20250123103935.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(21, 'Refrigerators', NULL, 17, NULL, NULL, 'refrigerators', '20250123104018.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(22, 'Vacuum cleaners', NULL, 17, NULL, NULL, 'vacuum-cleaners', '20250123104123.png', 1, 1, '2024-01-04 19:22:15', '2024-09-25 12:01:46'),
(23, 'TVs, Audio & Video', NULL, NULL, NULL, NULL, 'tvs-audio-video', '20250123101924.png', 0, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(24, 'Television Accessories', NULL, 23, NULL, NULL, 'television-accessories', '20250123030927.png', 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(25, 'HD, DVD Players', NULL, 23, NULL, NULL, 'hd-dvd-players', '20250123031004.png', 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(26, 'TV-DVD Combos', NULL, 23, NULL, NULL, 'tv-dvd-combos', NULL, 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(27, 'Projectors', NULL, 23, NULL, NULL, 'projectors', NULL, 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(28, 'Projection Screen', NULL, 23, NULL, NULL, 'projection-screen', NULL, 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(29, 'Fruits & Vegetables', NULL, NULL, NULL, NULL, 'fruits-vegetables', '20250123100945.png', 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(30, 'Dairy & Egg', NULL, NULL, NULL, NULL, 'dairy-egg', '20250123100034.png', 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(31, 'Meat & Fish', NULL, NULL, NULL, NULL, 'meat-fish', '20250123101535.png', 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(32, 'Sauces & Pickles', NULL, NULL, NULL, NULL, 'sauces-pickles', NULL, 1, 0, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(33, 'Candy & Chocolates', NULL, NULL, NULL, NULL, 'candy-chocolates', '20250123095931.png', 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(34, 'Foods', NULL, NULL, NULL, NULL, 'foods', '20250123100924.png', 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(35, 'Cooking', NULL, 34, NULL, NULL, 'cooking', '20250123031958.png', 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(36, 'Breakfast', NULL, 34, NULL, NULL, 'breakfast', '20250123095617.png', 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(37, 'Beverages', NULL, 34, NULL, NULL, 'beverages', '20250123095517.png', 1, 1, '2024-01-04 19:22:16', '2024-09-25 12:01:46'),
(38, 'BackPack', '20240119070653.jpg', NULL, NULL, NULL, 'backpack', '20250123095310.png', 0, 1, NULL, '2024-09-25 12:01:46'),
(40, 'spices', NULL, NULL, NULL, NULL, 'spices', '20250123101513.png', 0, 1, '2024-04-29 12:28:15', '2024-09-25 12:01:46'),
(41, 'Clothes', NULL, NULL, NULL, NULL, 'clothes', '20250123095947.png', 1, 1, '2024-09-18 15:20:22', '2024-09-25 12:01:46'),
(42, 'testing', NULL, NULL, NULL, NULL, 'testing', NULL, 1, 0, '2024-09-20 11:09:47', '2025-01-23 09:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `challans`
--

CREATE TABLE `challans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `courier_id` int(11) NOT NULL,
  `packing_slip_list` longtext NOT NULL,
  `amount_list` longtext NOT NULL,
  `cash_list` longtext DEFAULT NULL,
  `online_payment_list` longtext DEFAULT NULL,
  `cheque_list` longtext DEFAULT NULL,
  `delivery_charge_list` longtext DEFAULT NULL,
  `status_list` longtext DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `challans`
--

INSERT INTO `challans` (`id`, `reference_no`, `status`, `courier_id`, `packing_slip_list`, `amount_list`, `cash_list`, `online_payment_list`, `cheque_list`, `delivery_charge_list`, `status_list`, `closing_date`, `created_by_id`, `closed_by_id`, `created_at`, `updated_at`) VALUES
(1, '1001', 'Close', 1, '1', '577', '500', '', '77', '50', 'Delivered', '2024-08-11', 1, 1, '2024-08-11 05:27:04', '2024-08-11 05:28:06'),
(2, '1002', 'Active', 1, '2', '599', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2024-08-11 05:39:22', '2024-08-11 05:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `products` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `name`, `image`, `page_title`, `short_description`, `slug`, `products`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New Products', NULL, 'New Products at Optimal POS eCommerce', 'New Products at Optimal POS eCommerce', 'new-products', '', 1, NULL, NULL),
(2, 'Sale', NULL, 'Products on Sale', 'Products on Sale', 'sale', '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`id`, `name`, `phone_number`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Fedex', '3122312', 'london,uk', 1, '2024-08-11 05:26:49', '2024-08-11 05:26:49');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `symbol` varchar(2) DEFAULT NULL,
  `exchange_rate` double NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `exchange_rate`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', NULL, 1, 1, '2020-11-01 00:22:58', '2023-04-02 09:51:28'),
(2, 'EGP', 'EGP', NULL, 50, 1, '2020-11-01 01:29:12', '2025-01-21 09:05:22'),
(3, 'Bangladeshi Taka', 'BDT', NULL, 110, 0, '2023-09-06 07:05:29', '2023-09-06 07:05:46'),
(4, 'Lebanese', 'L.L.', NULL, 89000, 1, '2025-01-23 15:22:07', '2025-01-23 15:22:07');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) NOT NULL,
  `tax_no` varchar(191) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `points` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `wishlist` longtext DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ecom` varchar(255) DEFAULT NULL,
  `dsf` varchar(255) DEFAULT 'df',
  `arabic_name` varchar(255) DEFAULT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `franchise_location` varchar(255) DEFAULT NULL,
  `customer_type` varchar(255) DEFAULT 'Same as Customer',
  `customer_assigned_to` varchar(255) DEFAULT 'Advocate',
  `assigned` varchar(255) DEFAULT 'Advocate',
  `aaaaaaaa` varchar(255) DEFAULT 'aa',
  `district` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `user_id`, `name`, `company_name`, `email`, `phone_number`, `tax_no`, `address`, `city`, `state`, `postal_code`, `country`, `points`, `deposit`, `expense`, `wishlist`, `is_active`, `created_at`, `updated_at`, `ecom`, `dsf`, `arabic_name`, `admin`, `franchise_location`, `customer_type`, `customer_assigned_to`, `assigned`, `aaaaaaaa`, `district`) VALUES
(1, 1, 44, 'James Bond', 'MI6', NULL, '313131', NULL, '221 Baker Street', 'London', NULL, NULL, 'England', 26, 20, 0, NULL, 1, '2024-01-19 13:23:29', '2024-07-11 06:28:52', NULL, 'df', NULL, NULL, NULL, 'Same as Customer', 'Advocate', 'Advocate', 'aa', NULL),
(2, 1, 44, 'Walk in Customer', NULL, NULL, '231313', NULL, 'Halishahar', 'chittagong', NULL, NULL, 'Bangladesh', 396, NULL, NULL, NULL, 1, '2024-01-19 13:31:51', '2025-01-31 08:53:53', NULL, 'df', NULL, NULL, NULL, 'Same as Customer', 'Advocate', 'Advocate', 'aa', NULL),
(4, 1, 46, 'bkk', NULL, 'bkk@bkk.com', '87897', NULL, 'jhkjh', 'gjhgh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-06-10 10:40:15', '2024-06-10 10:40:15', NULL, 'df', NULL, NULL, NULL, 'Same as Customer', 'Advocate', 'Advocate', 'aa', NULL),
(5, 1, NULL, 'Omar fayez', NULL, 'omarf@optimalsolutions.it', '81627347', NULL, 'Beirut', 'Beirut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-01-30 09:28:42', '2025-01-30 09:28:42', NULL, 'df', NULL, NULL, NULL, 'Same as Customer', 'Advocate', 'Advocate', 'aa', NULL),
(6, 1, 49, 'alaa test', NULL, 'alaak@optimalsolutions.it', '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-01-31 10:08:13', '2025-01-31 10:08:13', NULL, 'df', NULL, NULL, NULL, 'Same as Customer', 'Advocate', 'Advocate', 'aa', NULL),
(7, 1, 50, 'alaa', NULL, 'alaa.k@optimalsolutions.it', '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-01-31 10:41:02', '2025-01-31 10:41:02', NULL, 'df', NULL, NULL, NULL, 'Same as Customer', 'Advocate', 'Advocate', 'aa', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `percentage` varchar(191) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `percentage`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Regular', '0', 1, '2024-01-19 13:19:29', '2024-01-19 13:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `belongs_to` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `default_value` text DEFAULT NULL,
  `option_value` text DEFAULT NULL,
  `grid_value` int(11) NOT NULL,
  `is_table` tinyint(1) NOT NULL,
  `is_invoice` tinyint(1) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_disable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `packing_slip_ids` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `address` text NOT NULL,
  `delivered_by` varchar(191) DEFAULT NULL,
  `recieved_by` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `reference_no`, `sale_id`, `packing_slip_ids`, `user_id`, `courier_id`, `address`, `delivered_by`, `recieved_by`, `file`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'dr-20240811-112542', 42, '1', 1, 1, 'Halishahar', NULL, NULL, NULL, NULL, '3', '2024-08-11 05:25:42', '2024-08-11 05:28:06'),
(2, 'dr-20240811-113738', 43, '2', 1, 1, 'Halishahar', NULL, NULL, NULL, NULL, '2', '2024-08-11 05:37:38', '2024-08-11 05:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Sales Department', 1, '2025-01-27 13:09:57', '2025-01-27 13:09:57'),
(2, 'Accounting Department', 1, '2025-01-27 13:10:06', '2025-01-27 13:10:06'),
(3, 'Stock Department', 1, '2025-01-27 13:10:32', '2025-01-27 13:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `amount`, `customer_id`, `user_id`, `note`, `created_at`, `updated_at`) VALUES
(1, 20, 1, 1, NULL, '2024-07-08 05:54:31', '2024-07-08 05:54:31');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `applicable_for` varchar(191) NOT NULL,
  `product_list` longtext DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `type` varchar(191) NOT NULL,
  `value` double NOT NULL,
  `minimum_qty` double NOT NULL,
  `maximum_qty` double NOT NULL,
  `days` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plans`
--

CREATE TABLE `discount_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_customers`
--

CREATE TABLE `discount_plan_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_discounts`
--

CREATE TABLE `discount_plan_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` int(11) NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dso_alerts`
--

CREATE TABLE `dso_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_info` longtext NOT NULL,
  `number_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ecommerce_settings`
--

CREATE TABLE `ecommerce_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `theme` varchar(255) NOT NULL DEFAULT 'default',
  `theme_font` varchar(255) NOT NULL DEFAULT 'Inter',
  `theme_color` varchar(255) NOT NULL DEFAULT '#fa9928',
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `store_phone` varchar(255) DEFAULT NULL,
  `store_email` varchar(255) DEFAULT NULL,
  `store_address` varchar(255) DEFAULT NULL,
  `home_page` bigint(20) DEFAULT NULL,
  `is_rtl` int(11) NOT NULL DEFAULT 0,
  `search` int(11) NOT NULL DEFAULT 0,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `contact_form_email` varchar(255) DEFAULT NULL,
  `free_shipping_from` double DEFAULT NULL,
  `flat_rate_shipping` double DEFAULT NULL,
  `checkout_pages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`checkout_pages`)),
  `gift_card` tinyint(4) NOT NULL DEFAULT 0,
  `custom_css` longtext DEFAULT NULL,
  `custom_js` longtext DEFAULT NULL,
  `chat_code` text DEFAULT NULL,
  `analytics_code` text DEFAULT NULL,
  `fb_pixel_code` text DEFAULT NULL,
  `sell_without_stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ecommerce_settings`
--

INSERT INTO `ecommerce_settings` (`id`, `site_title`, `theme`, `theme_font`, `theme_color`, `logo`, `favicon`, `store_phone`, `store_email`, `store_address`, `home_page`, `is_rtl`, `search`, `warehouse_id`, `biller_id`, `contact_form_email`, `free_shipping_from`, `flat_rate_shipping`, `checkout_pages`, `gift_card`, `custom_css`, `custom_js`, `chat_code`, `analytics_code`, `fb_pixel_code`, `sell_without_stock`, `created_at`, `updated_at`) VALUES
(1, 'pro', 'default', 'Inter', '#fa9928', NULL, NULL, '01090766553', 'admin@admin.com', 'egypt', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `staff_id` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone_number`, `department_id`, `user_id`, `staff_id`, `image`, `address`, `city`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '1', 'example@gmail.com', '81818181', 1, NULL, NULL, NULL, 'lebanon beirut', 'Beirut', 'Lebanon', 1, '2025-01-27 13:24:41', '2025-01-27 13:24:41'),
(2, '2', 'example2@gmail.com', '81818181', 1, NULL, NULL, NULL, 'lebanon beirut', 'Beirut', 'Lebanon', 1, '2025-01-27 13:25:25', '2025-01-27 13:25:37');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `reference_no`, `expense_category_id`, `warehouse_id`, `account_id`, `user_id`, `cash_register_id`, `amount`, `note`, `created_at`, `updated_at`) VALUES
(1, 'er-20240119-085023', 1, 1, 1, 1, 2, 200, NULL, '2024-01-19 14:50:23', '2024-01-19 14:50:23'),
(2, 'er-20240119-085046', 1, 2, 1, 1, 1, 120, NULL, '2024-01-19 14:50:46', '2024-01-19 14:50:46');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `code`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Electric Bill', 'Electric Bill', 1, '2024-01-19 14:50:02', '2024-01-19 14:50:02'),
(2, 'Rent', 'Shop', 1, '2025-01-27 13:41:24', '2025-01-27 13:42:02'),
(3, 'Payroll', 'Employees Salary', 1, '2025-01-27 13:41:36', '2025-01-27 13:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `external_services`
--

CREATE TABLE `external_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `module_status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`module_status`)),
  `active` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `external_services`
--

INSERT INTO `external_services` (`id`, `name`, `type`, `details`, `module_status`, `active`, `created_at`, `updated_at`) VALUES
(1, 'PayPal', 'payment', 'Client ID,Client Secret;abcd1234,wxyz5678', '{\"ecommerce\":false}', 1, NULL, NULL),
(2, 'Stripe', 'payment', 'Public Key,Private Key;efgh1234,stuv5678', '{\"ecommerce\":false}', 1, NULL, NULL),
(3, 'Razorpay', 'payment', 'Key,Secret;rzp_test_Y4MCcpHfZNU6rR,3Hr7SDqaZ0G5waN0jsLgsiLx', '{\"ecommerce\":true,\"salepro\":true}', 1, '2025-01-30 07:47:54', '2025-01-30 07:47:54'),
(4, 'Paystack', 'payment', 'public_Key,Secret_Key;pk_test_e8d220b7463d64569f0053e78534f38e6b10cf4a,sk_test_6d62cb976e1e0ab43f1e48b2934b0dfc7f32a1fe', '{\"ecommerce\":true,\"salepro\":true}', 1, '2025-01-30 07:47:54', '2025-01-30 07:47:54'),
(5, 'Mollie', 'payment', 'api_key;test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM', '{\"ecommerce\":true,\"salepro\":true}', 1, '2025-01-30 07:47:54', '2025-01-30 07:47:54'),
(6, 'Xendit', 'payment', 'secret_key,callback_token;xnd_development_aKJVKYbc4lHkEjcCLzWLrBsKs6jF6nbM6WaCMfnJerP3JW57CLis553XNRdDU,YPZxND92Mt8tdXntTYIEkRX802onZ5OcdKBUzycebuqYvN4n', '{\"ecommerce\":true,\"salepro\":true}', 1, '2025-01-30 07:47:54', '2025-01-30 07:47:54'),
(7, 'bkash', 'payment', 'Mode,app_key,app_secret,username,password;sandbox,0vWQuCRGiUX7EPVjQDr0EUAYtc,jcUNPBgbcqEDedNKdvE4G1cAK7D3hCjmJccNPZZBq96QIxxwAMEx,01770618567,D7DaC<*E*eG', '{\"ecommerce\":true,\"salepro\":true}', 1, '2025-01-30 07:47:54', '2025-01-30 07:47:54'),
(8, 'sslcommerz', 'payment', 'appkey,appsecret;12341234,asdfa23423', '{\"ecommerce\":true,\"salepro\":true}', 1, '2025-01-30 07:47:54', '2025-01-30 07:47:54'),
(9, 'Mpesa', 'payment', 'consumer_Key,consumer_Secret;fhfgkj,dtrddhd', '{\"ecommerce\":true,\"salepro\":true}', 1, '2025-01-30 07:47:54', '2025-01-30 07:47:54'),
(10, 'Pesapal', 'payment', 'Mode,Consumer Key,Consumer Secret;sandbox,qkio1BGGYAXTu2JOfm7XSXNruoZsrqEW,osGQ364R49cXKeOYSpaOnT++rHs=', '{\"ecommerce\":true,\"salepro\":true}', 1, '2025-01-30 07:47:54', '2025-01-30 07:47:54'),
(11, 'Moneipoint', 'payment', 'Mode,client_id,client_secret,terminal_serial;sandbox,api-client-3956952-7e1279e2-95d2-45e1-825a-3a28e0a35168,ZtH02Q%jQ$Imcf%W^B%q,C42P008D01909830', '{\"ecommerce\":true,\"salepro\":true}', 1, '2025-01-30 07:47:54', '2025-01-30 07:47:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `order` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `category_id`, `order`, `created_at`, `updated_at`) VALUES
(1, 'What Shipping Methods Are Available?', 'You can avail flat rate shipping, region & weight based shipping methods while shopping with Optimal POS eCommerce', 1, '0', NULL, NULL),
(2, 'Do You Ship Internationally?', 'We have plans to initiate international shipping in near future', 1, '1', NULL, NULL),
(3, 'How Long Will It Take To Get My Product?', 'It usually takes between 3-5 business days. It may take longer in holiday season though', 1, '2', NULL, NULL),
(4, 'Is Buying Online Safe?', 'Our payment system is fully safe and secure.', 2, '0', NULL, NULL),
(5, 'What Payment Methods Are Accepted?', 'We accept online payments, and cash on delivery etc. New payment methods will be added in future.', 2, '1', NULL, NULL),
(6, 'How do I place an Order?', 'You can place order through our website and you can call us as well', 1, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `order` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Shipping', '0', NULL, NULL),
(2, 'Payment', '1', NULL, NULL),
(3, 'Order & Returns', '2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(191) NOT NULL,
  `site_logo` varchar(191) DEFAULT NULL,
  `is_rtl` tinyint(1) DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `subscription_type` varchar(255) DEFAULT NULL,
  `staff_access` varchar(191) NOT NULL,
  `without_stock` varchar(255) NOT NULL DEFAULT 'no',
  `date_format` varchar(191) NOT NULL,
  `developed_by` varchar(191) DEFAULT NULL,
  `invoice_format` varchar(191) DEFAULT NULL,
  `decimal` int(11) DEFAULT 2,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) NOT NULL,
  `modules` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `expiry_type` varchar(255) NOT NULL DEFAULT 'days',
  `expiry_value` varchar(255) NOT NULL DEFAULT '0',
  `is_zatca` tinyint(1) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `vat_registration_number` varchar(191) DEFAULT NULL,
  `is_packing_slip` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `is_rtl`, `currency`, `package_id`, `subscription_type`, `staff_access`, `without_stock`, `date_format`, `developed_by`, `invoice_format`, `decimal`, `state`, `theme`, `modules`, `created_at`, `updated_at`, `currency_position`, `expiry_date`, `expiry_type`, `expiry_value`, `is_zatca`, `company_name`, `vat_registration_number`, `is_packing_slip`) VALUES
(1, 'Optimal POS', '20240924054634.png', 0, '1', NULL, NULL, 'all', 'yes', 'd-m-Y', 'Optimal Solutions', 'standard', 2, 1, 'default.css', 'ecommerce', '2018-07-06 06:13:11', '2025-01-19 10:35:53', 'prefix', NULL, 'days', '0', 0, 'Optimal Solutions', '98098007', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `card_no` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_recharges`
--

CREATE TABLE `gift_card_recharges` (
  `id` int(10) UNSIGNED NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `user_id`, `from_date`, `to_date`, `note`, `is_approved`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-02-02', '2025-02-02', 'Closed', 1, '2025-01-27 13:36:38', '2025-01-27 13:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `hrm_settings`
--

CREATE TABLE `hrm_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `checkin` varchar(191) NOT NULL,
  `checkout` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrm_settings`
--

INSERT INTO `hrm_settings` (`id`, `checkin`, `checkout`, `created_at`, `updated_at`) VALUES
(1, '10:00am', '6:00pm', '2019-01-02 02:20:08', '2019-01-02 04:20:53');

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `income_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incomes`
--

INSERT INTO `incomes` (`id`, `reference_no`, `income_category_id`, `warehouse_id`, `account_id`, `user_id`, `cash_register_id`, `amount`, `note`, `created_at`, `updated_at`) VALUES
(1, 'ir-20240811-105709', 1, 1, 1, 1, 2, 100, NULL, '2024-08-11 04:57:09', '2024-08-11 04:57:09');

-- --------------------------------------------------------

--
-- Table structure for table `income_categories`
--

CREATE TABLE `income_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `income_categories`
--

INSERT INTO `income_categories` (`id`, `code`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '99903833', 'Foreign investment', 1, '2024-08-11 04:56:46', '2024-08-11 04:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, 'en', '2018-07-07 22:59:17', '2019-12-24 17:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(50) NOT NULL,
  `link` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `widget_title` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_settings`
--

CREATE TABLE `mail_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver` varchar(191) NOT NULL,
  `host` varchar(191) NOT NULL,
  `port` varchar(191) NOT NULL,
  `from_address` varchar(191) NOT NULL,
  `from_name` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `encryption` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_settings`
--

INSERT INTO `mail_settings` (`id`, `driver`, `host`, `port`, `from_address`, `from_name`, `username`, `password`, `encryption`, `created_at`, `updated_at`) VALUES
(1, 'smtp', 'smtp.gmail.com', '587', 'ashfaqdev.php@gmail.com', 'SalePro', 'ashfaqdev.php@gmail.com', 'hxhtuucxmrjpetgv', 'tls', '2024-01-08 05:32:23', '2024-05-28 07:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `title`, `location`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Main Nav', '1', '[[{\"id\":\"1\"},{\"id\":\"2\"},{\"id\":\"3\"},{\"id\":\"4\"},{\"id\":\"5\"},{\"id\":\"6\"}]]', '2025-01-20 09:08:34', '2025-01-23 08:38:23'),
(2, 'Footer menu 1', '0', '[[{\"id\":\"10\"},{\"id\":\"9\"},{\"id\":\"8\"},{\"id\":\"7\"}]]', '2025-01-20 09:08:47', '2025-01-23 08:39:29'),
(3, 'Footer menu 2', '0', '[[{\"id\":\"11\"},{\"id\":\"12\"},{\"id\":\"13\"}]]', '2025-01-20 09:08:56', '2025-01-23 08:40:01'),
(4, 'Footer menu 3', '0', '[[{\"id\":\"14\"},{\"id\":\"15\"},{\"id\":\"16\"}]]', '2025-01-20 09:09:05', '2025-01-23 08:44:40');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `title`, `name`, `slug`, `type`, `target`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 'Home', NULL, 'home', 'page', NULL, 1, '2025-01-23 08:36:50', NULL),
(2, 'Laptops & Computers', NULL, 'laptops-computers', 'category', NULL, 1, '2025-01-23 08:37:56', NULL),
(3, 'Appliances', NULL, 'appliances', 'category', NULL, 1, '2025-01-23 08:37:56', NULL),
(4, 'FAQ', NULL, 'faq', 'page', NULL, 1, '2025-01-23 08:38:05', NULL),
(5, 'Blog', NULL, 'https://pos.azaruserp.com/salepro/blog', 'custom', NULL, 1, '2025-01-23 08:38:10', NULL),
(6, 'Contact Us', NULL, 'contact', 'page', NULL, 1, '2025-01-23 08:38:20', NULL),
(7, 'Contact Us', NULL, 'contact-us', 'page', NULL, 2, '2025-01-23 08:38:54', NULL),
(8, 'FAQ', NULL, 'faq', 'page', NULL, 2, '2025-01-23 08:38:54', NULL),
(9, 'Privacy Policy', NULL, 'privacy-policy', 'page', NULL, 2, '2025-01-23 08:38:54', NULL),
(10, 'Terms & Conditions', NULL, 'terms-conditions', 'page', NULL, 2, '2025-01-23 08:38:54', NULL),
(11, 'About Optimal POS eCommerce', NULL, 'about-optimal-pos-ecommerce', 'page', NULL, 3, '2025-01-23 08:39:57', NULL),
(12, 'Contact Us', NULL, 'contact-us', 'page', NULL, 3, '2025-01-23 08:39:57', NULL),
(13, 'FAQ', NULL, 'faq', 'page', NULL, 3, '2025-01-23 08:39:57', NULL),
(14, ' My Account ', 'My Account', 'https://pos.azaruserp.com/salepro/', 'custom', '_blank', 4, '2025-01-23 08:42:53', '2025-01-23 08:43:03'),
(15, 'Cart', NULL, 'pos.azaruserp.com/salepro/', 'custom', NULL, 4, '2025-01-23 08:44:14', NULL),
(16, 'Shop', 'Shop', 'https://pos.azaruserp.com/salepro/shop/', 'custom', NULL, 4, '2025-01-23 08:44:27', '2025-01-23 09:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_17_060412_create_categories_table', 1),
(4, '2018_02_20_035727_create_brands_table', 1),
(5, '2018_02_25_100635_create_suppliers_table', 1),
(6, '2018_02_27_101619_create_warehouse_table', 1),
(7, '2018_03_03_040448_create_units_table', 1),
(8, '2018_03_04_041317_create_taxes_table', 1),
(9, '2018_03_10_061915_create_customer_groups_table', 1),
(10, '2018_03_10_090534_create_customers_table', 1),
(11, '2018_03_11_095547_create_billers_table', 1),
(12, '2018_04_05_054401_create_products_table', 1),
(13, '2018_04_06_133606_create_purchases_table', 1),
(14, '2018_04_06_154600_create_product_purchases_table', 1),
(15, '2018_04_06_154915_create_product_warhouse_table', 1),
(16, '2018_04_10_085927_create_sales_table', 1),
(17, '2018_04_10_090133_create_product_sales_table', 1),
(18, '2018_04_10_090254_create_payments_table', 1),
(19, '2018_04_10_090341_create_payment_with_cheque_table', 1),
(20, '2018_04_10_090509_create_payment_with_credit_card_table', 1),
(21, '2018_04_13_121436_create_quotation_table', 1),
(22, '2018_04_13_122324_create_product_quotation_table', 1),
(23, '2018_04_14_121802_create_transfers_table', 1),
(24, '2018_04_14_121913_create_product_transfer_table', 1),
(25, '2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table', 2),
(26, '2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table', 3),
(27, '2018_05_20_054532_create_adjustments_table', 4),
(28, '2018_05_20_054859_create_product_adjustments_table', 4),
(29, '2018_05_21_163419_create_returns_table', 5),
(30, '2018_05_21_163443_create_product_returns_table', 5),
(31, '2018_06_02_050905_create_roles_table', 6),
(32, '2018_06_02_073430_add_columns_to_users_table', 7),
(33, '2018_06_03_053738_create_permission_tables', 8),
(36, '2018_06_21_063736_create_pos_setting_table', 9),
(37, '2018_06_21_094155_add_user_id_to_sales_table', 10),
(38, '2018_06_21_101529_add_user_id_to_purchases_table', 11),
(39, '2018_06_21_103512_add_user_id_to_transfers_table', 12),
(40, '2018_06_23_061058_add_user_id_to_quotations_table', 13),
(41, '2018_06_23_082427_add_is_deleted_to_users_table', 14),
(42, '2018_06_25_043308_change_email_to_users_table', 15),
(43, '2018_07_06_115449_create_general_settings_table', 16),
(44, '2018_07_08_043944_create_languages_table', 17),
(45, '2018_07_11_102144_add_user_id_to_returns_table', 18),
(46, '2018_07_11_102334_add_user_id_to_payments_table', 18),
(47, '2018_07_22_130541_add_digital_to_products_table', 19),
(49, '2018_07_24_154250_create_deliveries_table', 20),
(50, '2018_08_16_053336_create_expense_categories_table', 21),
(51, '2018_08_17_115415_create_expenses_table', 22),
(55, '2018_08_18_050418_create_gift_cards_table', 23),
(56, '2018_08_19_063119_create_payment_with_gift_card_table', 24),
(57, '2018_08_25_042333_create_gift_card_recharges_table', 25),
(58, '2018_08_25_101354_add_deposit_expense_to_customers_table', 26),
(59, '2018_08_26_043801_create_deposits_table', 27),
(60, '2018_09_02_044042_add_keybord_active_to_pos_setting_table', 28),
(61, '2018_09_09_092713_create_payment_with_paypal_table', 29),
(62, '2018_09_10_051254_add_currency_to_general_settings_table', 30),
(63, '2018_10_22_084118_add_biller_and_store_id_to_users_table', 31),
(65, '2018_10_26_034927_create_coupons_table', 32),
(66, '2018_10_27_090857_add_coupon_to_sales_table', 33),
(67, '2018_11_07_070155_add_currency_position_to_general_settings_table', 34),
(68, '2018_11_19_094650_add_combo_to_products_table', 35),
(69, '2018_12_09_043712_create_accounts_table', 36),
(70, '2018_12_17_112253_add_is_default_to_accounts_table', 37),
(71, '2018_12_19_103941_add_account_id_to_payments_table', 38),
(72, '2018_12_20_065900_add_account_id_to_expenses_table', 39),
(73, '2018_12_20_082753_add_account_id_to_returns_table', 40),
(74, '2018_12_26_064330_create_return_purchases_table', 41),
(75, '2018_12_26_144210_create_purchase_product_return_table', 42),
(76, '2018_12_26_144708_create_purchase_product_return_table', 43),
(77, '2018_12_27_110018_create_departments_table', 44),
(78, '2018_12_30_054844_create_employees_table', 45),
(79, '2018_12_31_125210_create_payrolls_table', 46),
(80, '2018_12_31_150446_add_department_id_to_employees_table', 47),
(81, '2019_01_01_062708_add_user_id_to_expenses_table', 48),
(82, '2019_01_02_075644_create_hrm_settings_table', 49),
(83, '2019_01_02_090334_create_attendances_table', 50),
(84, '2019_01_27_160956_add_three_columns_to_general_settings_table', 51),
(85, '2019_02_15_183303_create_stock_counts_table', 52),
(86, '2019_02_17_101604_add_is_adjusted_to_stock_counts_table', 53),
(87, '2019_04_13_101707_add_tax_no_to_customers_table', 54),
(89, '2019_10_14_111455_create_holidays_table', 55),
(90, '2019_11_13_145619_add_is_variant_to_products_table', 56),
(91, '2019_11_13_150206_create_product_variants_table', 57),
(92, '2019_11_13_153828_create_variants_table', 57),
(93, '2019_11_25_134041_add_qty_to_product_variants_table', 58),
(94, '2019_11_25_134922_add_variant_id_to_product_purchases_table', 58),
(95, '2019_11_25_145341_add_variant_id_to_product_warehouse_table', 58),
(96, '2019_11_29_182201_add_variant_id_to_product_sales_table', 59),
(97, '2019_12_04_121311_add_variant_id_to_product_quotation_table', 60),
(98, '2019_12_05_123802_add_variant_id_to_product_transfer_table', 61),
(100, '2019_12_08_114954_add_variant_id_to_product_returns_table', 62),
(101, '2019_12_08_203146_add_variant_id_to_purchase_product_return_table', 63),
(102, '2020_02_28_103340_create_money_transfers_table', 64),
(103, '2020_07_01_193151_add_image_to_categories_table', 65),
(105, '2020_09_26_130426_add_user_id_to_deliveries_table', 66),
(107, '2020_10_11_125457_create_cash_registers_table', 67),
(108, '2020_10_13_155019_add_cash_register_id_to_sales_table', 68),
(109, '2020_10_13_172624_add_cash_register_id_to_returns_table', 69),
(110, '2020_10_17_212338_add_cash_register_id_to_payments_table', 70),
(111, '2020_10_18_124200_add_cash_register_id_to_expenses_table', 71),
(112, '2020_10_21_121632_add_developed_by_to_general_settings_table', 72),
(113, '2019_08_19_000000_create_failed_jobs_table', 73),
(114, '2020_10_30_135557_create_notifications_table', 73),
(115, '2020_11_01_044954_create_currencies_table', 74),
(116, '2020_11_01_140736_add_price_to_product_warehouse_table', 75),
(117, '2020_11_02_050633_add_is_diff_price_to_products_table', 76),
(118, '2020_11_09_055222_add_user_id_to_customers_table', 77),
(119, '2020_11_17_054806_add_invoice_format_to_general_settings_table', 78),
(120, '2021_02_10_074859_add_variant_id_to_product_adjustments_table', 79),
(121, '2021_03_07_093606_create_product_batches_table', 80),
(122, '2021_03_07_093759_add_product_batch_id_to_product_warehouse_table', 80),
(123, '2021_03_07_093900_add_product_batch_id_to_product_purchases_table', 80),
(124, '2021_03_11_132603_add_product_batch_id_to_product_sales_table', 81),
(127, '2021_03_25_125421_add_is_batch_to_products_table', 82),
(128, '2021_05_19_120127_add_product_batch_id_to_product_returns_table', 82),
(130, '2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table', 83),
(131, '2021_05_23_124848_add_product_batch_id_to_product_transfer_table', 84),
(132, '2021_05_26_153106_add_product_batch_id_to_product_quotation_table', 85),
(133, '2021_06_08_213007_create_reward_point_settings_table', 86),
(134, '2021_06_16_104155_add_points_to_customers_table', 87),
(135, '2021_06_17_101057_add_used_points_to_payments_table', 88),
(136, '2021_07_06_132716_add_variant_list_to_products_table', 89),
(137, '2021_09_27_161141_add_is_imei_to_products_table', 90),
(138, '2021_09_28_170052_add_imei_number_to_product_warehouse_table', 91),
(139, '2021_09_28_170126_add_imei_number_to_product_purchases_table', 91),
(140, '2021_10_03_170652_add_imei_number_to_product_sales_table', 92),
(141, '2021_10_10_145214_add_imei_number_to_product_returns_table', 93),
(142, '2021_10_11_104504_add_imei_number_to_product_transfer_table', 94),
(143, '2021_10_12_160107_add_imei_number_to_purchase_product_return_table', 95),
(144, '2021_10_12_205146_add_is_rtl_to_general_settings_table', 96),
(145, '2021_10_23_142451_add_is_approve_to_payments_table', 97),
(146, '2022_01_13_191242_create_discount_plans_table', 97),
(147, '2022_01_14_174318_create_discount_plan_customers_table', 97),
(148, '2022_01_14_202439_create_discounts_table', 98),
(149, '2022_01_16_153506_create_discount_plan_discounts_table', 98),
(150, '2022_02_05_174210_add_order_discount_type_and_value_to_sales_table', 99),
(154, '2022_05_26_195506_add_daily_sale_objective_to_products_table', 100),
(155, '2022_05_28_104209_create_dso_alerts_table', 101),
(156, '2022_06_01_112100_add_is_embeded_to_products_table', 102),
(157, '2022_06_14_130505_add_sale_id_to_returns_table', 103),
(159, '2022_07_19_115504_add_variant_data_to_products_table', 104),
(160, '2022_07_25_194300_add_additional_cost_to_product_variants_table', 104),
(161, '2022_09_04_195610_add_purchase_id_to_return_purchases_table', 105),
(162, '2023_01_18_123842_alter_table_pos_setting', 106),
(164, '2023_01_18_125040_alter_table_general_settings', 107),
(165, '2023_01_18_133701_alter_table_pos_setting', 108),
(166, '2023_01_25_145309_add_expiry_date_to_general_settings_table', 109),
(167, '2023_02_23_125656_alter_table_sales', 110),
(168, '2023_02_26_124100_add_package_id_to_general_settings_table', 111),
(169, '2023_03_04_120325_create_custom_fields_table', 111),
(170, '2023_03_22_174352_add_currency_id_and_exchange_rate_to_returns_table', 112),
(171, '2023_03_27_114320_add_currency_id_and_exchange_rate_to_purchases_table', 113),
(172, '2023_03_27_132747_add_currency_id_and_exchange_rate_to_return_purchases_table', 114),
(173, '2023_04_25_150236_create_mail_settings_table', 115),
(174, '2023_05_13_125424_add_zatca_to_general_settings_table', 116),
(175, '2023_05_28_155540_create_tables_table', 117),
(176, '2023_05_29_115039_add_is_table_to_pos_setting_table', 117),
(177, '2023_05_29_115301_add_table_id_to_sales_table', 117),
(178, '2023_05_31_165049_add_queue_no_to_sales_table', 117),
(190, '2023_08_12_124016_add_staff_id_to_employees_table', 121),
(192, '2023_07_23_160254_create_couriers_table', 122),
(193, '2023_07_23_174343_add_courier_id_to_deliveries_table', 122),
(194, '2023_08_14_142608_add_is_active_to_currencies_table', 122),
(195, '2023_08_24_130203_change_columns_to_attendances_table', 122),
(196, '2023_09_10_134503_add_without_stock_to_general_settings_table', 123),
(204, '2023_09_26_211542_add_modules_to_general_settings_table', 125),
(217, '2023_10_15_124306_add_return_qty_to_product_sales_table', 129),
(219, '2023_12_03_235606_crete_external_services_table', 131),
(221, '2023_03_14_174658_add_subscription_type_to_general_setting_table', 130),
(222, '2024_02_04_131826_add_unit_cost_to_product_adjustments_table', 132),
(223, '2024_02_13_173126_change_modules_to_general_settings_table', 133),
(224, '2024_05_02_114215_add_payment_receiver_to_payments', 134),
(225, '2024_05_06_132553_create_sms_templates_table', 135),
(226, '2024_05_07_102225_add_send_sms_to_pos_setting_table', 135),
(227, '2024_05_07_132625_add_is_default_to_sms_templates_table', 135),
(228, '2024_05_08_112211_change_address_and_city_field_to_nullable_in_customers_table', 135),
(229, '2024_05_08_151050_add_is_default_ecommerce_columne_to_sms_templates_table', 135),
(230, '2024_05_20_182757_add_wholesale_price_to_products_table', 136),
(231, '2024_05_21_170500_add_is_sent_to_transfers_table', 137),
(232, '2023_02_05_132001_add_change_to_payments_table', 138),
(233, '2024_06_04_225113_create_income_categories_table', 138),
(234, '2024_06_04_225128_create_incomes_table', 138),
(235, '2024_06_29_131917_add_is_packing_slip_to_general_settings_table', 138),
(236, '2024_07_05_192531_create_packing_slips_table', 138),
(237, '2024_07_05_193002_create_packing_slip_products_table', 138),
(238, '2024_07_05_194501_add_is_packing_and_delivered_to_product_sales_table', 138),
(239, '2024_07_14_122245_add_delivery_id_to_packing_slips_table', 138),
(240, '2024_07_14_122415_add_variant_id_to_packing_slip_products_table', 138),
(241, '2024_07_14_122519_add_packing_slip_ids_to_deliveries_table', 138),
(242, '2024_07_16_125908_create_challans_table', 138),
(243, '2024_08_12_112830_add_thermal_invoice_size_to_pos_setting', 139),
(244, '2024_08_14_133351_add_expiry_type_value_to_general_settings', 139),
(245, '2022_09_05_213845_create_sliders_table', 140),
(246, '2022_09_05_214402_create_pages_table', 140),
(247, '2022_09_05_235844_add_multiple_column_to_categories_table', 140),
(248, '2022_09_06_215257_add_symbol_to_currencies_table', 140),
(249, '2022_09_13_194813_create_links_table', 140),
(250, '2022_09_14_151339_add_widget_title_to_links_table', 140),
(251, '2022_09_14_151904_add_multiple_column_to_products_table', 140),
(252, '2023_10_05_190729_create_ecommerce_settings_table', 140),
(253, '2023_10_05_201640_create_social_links_table', 140),
(254, '2023_10_08_211633_crete_menus_table', 140),
(255, '2023_10_08_211806_crete_menu_items_table', 140),
(256, '2023_10_12_101855_crete_widgets_table', 140),
(257, '2023_10_19_211003_crete_page_widgets_table', 140),
(258, '2023_11_09_110943_crete_collections_table', 140),
(259, '2023_11_09_113224_crete_customer_addresses_table', 140),
(260, '2023_11_09_113237_crete_faqs_table', 140),
(261, '2023_11_09_114154_add_multiple_columns_to_brands_table', 140),
(262, '2023_11_09_125124_crete_faq_categories_table', 140),
(263, '2023_11_14_155545_crete_newsletter_table', 140),
(264, '2023_12_01_110636_add_multiple_columns_to_sales_table', 140),
(265, '2024_01_27_185652_add_multiple_columns_to_ecommerce_settings_table', 140),
(266, '2024_02_03_183124_add_multiple_columns_to_products_table', 140),
(267, '2024_02_06_133230_edi_sales_table', 140),
(268, '2024_02_12_235611_change_page_widgets_table', 140),
(269, '2024_02_18_175556_add_columns_to_customers_table', 140),
(270, '2024_03_03_231218_add_gift_card_to_ecommerce_settings_table', 140),
(271, '2024_03_18_150001_crete_blogs_table', 140),
(272, '2024_06_09_155352_add_theme_color_to_ecommerce_settings_table', 140),
(273, '2024_06_12_222658_edit_page_widgets_table', 140),
(274, '2024_07_22_235454_add_search_to_ecommerce_settings_table', 140),
(275, '2024_09_11_151744_add_return_qty_to_product_purchases_table', 141),
(276, '2024_09_12_162309_create_barcodes_table', 141),
(277, '2024_10_10_121312_add_data_to_payment_with_credit_card_table', 141),
(278, '2024_10_10_212501_alter_attendances_table', 141),
(279, '2024_10_10_213757_alter_attendances_table', 141),
(280, '2024_10_14_144917_change_column_to_nullable_to_payment_with_credit_card_table', 141),
(281, '2024_11_10_121521_add_code_and_type_to_accounts_table', 141),
(282, '2024_11_24_100926_add_module_status_to_external_services_table', 141),
(283, '2024_10_10_102444_add_is_rtl_to_ecommerce_settings_table', 142),
(284, '2024_10_25_202721_alter_ecommerce_settings_table', 142),
(285, '2024_11_11_170940_alter_page_widgets_table', 142),
(286, '2024_11_23_225726_change_ecommerce_settings_table', 142),
(287, '2024_12_10_201131_add_columns_to_tables_table', 143),
(288, '2025_01_20_121127_add_warranty_and_guarantee_to_products_table', 143);

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `money_transfers`
--

INSERT INTO `money_transfers` (`id`, `reference_no`, `from_account_id`, `to_account_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 'mtr-20250128-112704', 1, 3, 120, '2025-01-28 10:27:04', '2025-01-28 10:27:04');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packing_slips`
--

CREATE TABLE `packing_slips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packing_slips`
--

INSERT INTO `packing_slips` (`id`, `reference_no`, `sale_id`, `delivery_id`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, '1001', 42, 1, 577, 'Delivered', '2024-08-11 05:25:41', '2024-08-11 05:28:06'),
(2, '1002', 43, 2, 599, 'In Transit', '2024-08-11 05:37:38', '2024-08-11 05:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `packing_slip_products`
--

CREATE TABLE `packing_slip_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `packing_slip_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packing_slip_products`
--

INSERT INTO `packing_slip_products` (`id`, `packing_slip_id`, `product_id`, `variant_id`, `created_at`, `updated_at`) VALUES
(1, 1, 23, NULL, '2024-08-11 05:25:41', '2024-08-11 05:25:41'),
(2, 2, 18, NULL, '2024-08-11 05:37:38', '2024-08-11 05:37:38');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `og_title` varchar(255) DEFAULT NULL,
  `og_image` varchar(255) DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `template` varchar(255) NOT NULL DEFAULT 'Default',
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_name`, `description`, `slug`, `meta_title`, `meta_description`, `og_title`, `og_image`, `og_description`, `template`, `status`, `created_at`, `updated_at`) VALUES
(1, 'About Optimal POS eCommerce', NULL, 'about-optimal-pos-ecommerce', 'Optimal POS eCommerce', 'Optimal POS eCommerce', 'Optimal POS eCommerce', NULL, NULL, 'home', 1, '2025-01-20 09:14:53', '2025-01-20 09:14:53'),
(2, 'Contact Us', NULL, 'contact', 'Contact Us', 'Contact Us', '', NULL, NULL, 'contact', 1, '2025-01-20 09:15:39', '2025-01-31 12:41:51'),
(3, 'FAQ', NULL, 'faq', 'Frequently Asked Questions | Optimal POS eCommerce FAQ', 'Frequently Asked Questions | Optimal POS eCommerce FAQ', NULL, NULL, NULL, 'faq', 1, '2025-01-20 09:17:35', '2025-01-20 09:17:35'),
(4, 'Home', NULL, 'home', 'eCommerce for Optimal POS, inventory management Laravel application', 'eCommerce for Optimal POS, inventory management Laravel application', 'Optimal POS eCommerce', NULL, NULL, 'home', 1, '2025-01-20 09:23:29', '2025-01-20 09:43:27'),
(5, 'Privacy Policy', '<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>\r\n<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>\r\n<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>\r\n<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>\r\n<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>\r\n<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>', 'privacy-policy', NULL, NULL, NULL, NULL, NULL, 'default', 1, '2025-01-20 09:38:59', '2025-01-20 09:38:59'),
(6, 'Terms & Conditions', '<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>\r\n<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>\r\n<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>\r\n<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>\r\n<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>\r\n<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>\r\n<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.</p>\r\n<p>Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>', 'terms-conditions', NULL, NULL, NULL, NULL, NULL, 'default', 1, '2025-01-20 09:39:26', '2025-01-20 09:39:26');

-- --------------------------------------------------------

--
-- Table structure for table `page_widgets`
--

CREATE TABLE `page_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `page_id` varchar(255) NOT NULL,
  `order` varchar(255) NOT NULL,
  `product_category_title` varchar(255) DEFAULT NULL,
  `product_category_id` varchar(255) DEFAULT NULL,
  `product_category_type` varchar(255) DEFAULT NULL,
  `product_category_slider_loop` varchar(255) DEFAULT NULL,
  `product_category_slider_autoplay` varchar(255) DEFAULT NULL,
  `product_category_limit` varchar(255) DEFAULT NULL,
  `tab_product_collection_id` varchar(255) DEFAULT NULL,
  `tab_product_collection_type` varchar(255) DEFAULT NULL,
  `tab_product_collection_slider_loop` varchar(255) DEFAULT NULL,
  `tab_product_collection_slider_autoplay` varchar(255) DEFAULT NULL,
  `tab_product_collection_limit` varchar(255) DEFAULT NULL,
  `product_collection_title` varchar(255) DEFAULT NULL,
  `product_collection_id` varchar(255) DEFAULT NULL,
  `product_collection_type` varchar(255) DEFAULT NULL,
  `product_collection_slider_loop` varchar(255) DEFAULT NULL,
  `product_collection_slider_autoplay` varchar(255) DEFAULT NULL,
  `product_collection_limit` varchar(255) DEFAULT NULL,
  `category_slider_title` varchar(255) DEFAULT NULL,
  `category_slider_loop` varchar(255) DEFAULT NULL,
  `category_slider_autoplay` varchar(255) DEFAULT NULL,
  `category_slider_ids` varchar(255) DEFAULT NULL,
  `brand_slider_title` varchar(255) DEFAULT NULL,
  `brand_slider_loop` varchar(255) DEFAULT NULL,
  `brand_slider_autoplay` varchar(255) DEFAULT NULL,
  `brand_slider_ids` varchar(255) DEFAULT NULL,
  `three_c_banner_link1` varchar(255) DEFAULT NULL,
  `three_c_banner_image1` varchar(255) DEFAULT NULL,
  `three_c_banner_link2` varchar(255) DEFAULT NULL,
  `three_c_banner_image2` varchar(255) DEFAULT NULL,
  `three_c_banner_link3` varchar(255) DEFAULT NULL,
  `three_c_banner_image3` varchar(255) DEFAULT NULL,
  `two_c_banner_link1` varchar(255) DEFAULT NULL,
  `two_c_banner_image1` varchar(255) DEFAULT NULL,
  `two_c_banner_link2` varchar(255) DEFAULT NULL,
  `two_c_banner_image2` varchar(255) DEFAULT NULL,
  `one_c_banner_link1` varchar(255) DEFAULT NULL,
  `one_c_banner_image1` varchar(255) DEFAULT NULL,
  `text_title` varchar(255) DEFAULT NULL,
  `text_content` varchar(255) DEFAULT NULL,
  `slider_images` text DEFAULT NULL,
  `slider_links` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_widgets`
--

INSERT INTO `page_widgets` (`id`, `name`, `page_id`, `order`, `product_category_title`, `product_category_id`, `product_category_type`, `product_category_slider_loop`, `product_category_slider_autoplay`, `product_category_limit`, `tab_product_collection_id`, `tab_product_collection_type`, `tab_product_collection_slider_loop`, `tab_product_collection_slider_autoplay`, `tab_product_collection_limit`, `product_collection_title`, `product_collection_id`, `product_collection_type`, `product_collection_slider_loop`, `product_collection_slider_autoplay`, `product_collection_limit`, `category_slider_title`, `category_slider_loop`, `category_slider_autoplay`, `category_slider_ids`, `brand_slider_title`, `brand_slider_loop`, `brand_slider_autoplay`, `brand_slider_ids`, `three_c_banner_link1`, `three_c_banner_image1`, `three_c_banner_link2`, `three_c_banner_image2`, `three_c_banner_link3`, `three_c_banner_image3`, `two_c_banner_link1`, `two_c_banner_image1`, `two_c_banner_link2`, `two_c_banner_image2`, `one_c_banner_link1`, `one_c_banner_image1`, `text_title`, `text_content`, `slider_images`, `slider_links`, `created_at`, `updated_at`) VALUES
(1, 'category-slider-widget', '1', '0', 'Browse By categories', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Browse By categories', 'yes', NULL, '1,6,12,23,29,30,33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:23:29', '2025-01-20 09:43:28'),
(2, 'product-category-widget', '1', '1', 'Laptops for everyday', '6', 'gallery', 'true', NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:23:29', '2025-01-20 09:23:29'),
(3, 'brand-slider-widget', '4', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:23:29', '2025-01-20 09:23:29'),
(4, 'text-widget', '4', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:23:29', '2025-01-20 09:23:29'),
(5, 'text-widget', '4', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:23:29', '2025-01-20 09:23:29'),
(6, 'three-c-banner-widget', '4', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:40:42', '2025-01-20 09:40:42'),
(7, 'three-c-banner-widget', '4', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:40:42', '2025-01-20 09:40:42'),
(9, 'two-c-banner-widget', '4', '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:40:53', '2025-01-20 09:40:53'),
(10, 'product-collection-widget', '4', '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'gallery', 'true', NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:40:55', '2025-01-20 09:40:55'),
(11, 'product-category-widget', '1', '8', 'Smartphones & Gadgets', '1', 'gallery', 'yes', NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:41:03', '2025-01-20 09:41:03'),
(17, 'three-c-banner-widget', '4', '9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:42:37', '2025-01-20 09:42:37'),
(18, 'product-collection-widget', '4', '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'gallery', 'true', NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:42:41', '2025-01-20 09:42:41'),
(19, 'brand-slider-widget', '4', '11', 'Browse By Brands\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:42:56', '2025-01-20 09:42:56'),
(20, 'brand-slider-widget', '1', '12', 'Browse By Brands\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Browse By Brands\n', 'yes', NULL, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:42:57', '2025-01-20 09:42:57'),
(21, 'two-c-banner-widget', '4', '13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:43:05', '2025-01-20 09:43:05'),
(22, 'tab-product-collection-widget', '4', '14', '', NULL, NULL, NULL, NULL, NULL, '25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40', 'gallery', 'true', NULL, '10', NULL, '25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:43:06', '2025-01-20 09:43:06'),
(23, 'town-category-widget', '1', '10', 'New In Town', '1', NULL, NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:17:27', '2025-01-06 12:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ashfaqdev.php@gmail.com', '$2y$10$plxHOMxChJlHd9t6FQkoN.4dXMdtZ9fE5tXBBItzjxB1R5JF9OpbO', '2023-07-15 11:31:30');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_reference` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `payment_receiver` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `used_points` varchar(255) DEFAULT NULL,
  `change` double DEFAULT NULL,
  `paying_method` varchar(191) NOT NULL,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cash_received` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_reference`, `user_id`, `purchase_id`, `sale_id`, `cash_register_id`, `account_id`, `payment_receiver`, `amount`, `used_points`, `change`, `paying_method`, `payment_note`, `created_at`, `updated_at`, `cash_received`, `currency`) VALUES
(63, 'spr-20250130-092624', 1, NULL, 70, 2, 1, 'fdfsfsf', 1000, NULL, 0, 'Cash', 'dsfdsfds', '2025-01-30 08:26:24', '2025-01-30 08:26:24', '1000', 'US Dollar'),
(64, 'spr-20250130-092624', 1, NULL, 70, 2, 1, 'fdfsfsf', 2000, NULL, 0, 'Cash', 'dsfdsfds', '2025-01-30 08:26:24', '2025-01-30 08:26:24', '2000', 'EGP'),
(65, 'spr-20250130-092659', 1, NULL, 71, 2, 1, 'fdsfsfdsf', 990, NULL, 0, 'Credit Card', 'sdfsf', '2025-01-30 08:26:59', '2025-01-30 08:26:59', '990', 'EGP'),
(68, 'spr-20250130-103123', 1, NULL, 73, 2, 1, NULL, 75, NULL, 0, 'Cash', NULL, '2025-01-30 09:31:23', '2025-01-30 09:31:23', '75.00', 'US Dollar'),
(69, 'spr-20250130-103823', 47, NULL, 74, 3, 1, NULL, 109, NULL, 0, 'Cash', NULL, '2025-01-30 09:38:23', '2025-01-30 09:38:23', '109.00', 'US Dollar'),
(70, 'spr-20250130-105137', 47, NULL, 76, 3, 1, NULL, 1111.99, NULL, 0, 'Cash', NULL, '2025-01-30 09:51:37', '2025-01-30 09:51:37', '1111.99', 'US Dollar'),
(71, 'spr-20250131-083925', 1, NULL, 77, 2, 1, NULL, 2054, NULL, 0, 'Cash', NULL, '2025-01-31 07:39:25', '2025-01-31 07:39:25', '2054', 'US Dollar'),
(72, 'spr-20250131-083925', 1, NULL, 77, 2, 1, NULL, 146.07, NULL, 12999853.93, 'Cash', NULL, '2025-01-31 07:39:25', '2025-01-31 07:39:25', '13000000', 'Lebanese'),
(73, 'spr-20250131-083925', 1, NULL, 77, 2, 1, NULL, 100, NULL, 4900, 'Cash', NULL, '2025-01-31 07:39:25', '2025-01-31 07:39:25', '5000', 'EGP'),
(74, 'spr-20250131-092732', 1, NULL, 78, 2, 1, 'sadsadaad', 1000, NULL, 0, 'Cash', 'sadsadsad', '2025-01-31 08:27:32', '2025-01-31 08:27:32', '1000', 'US Dollar'),
(75, 'spr-20250131-092732', 1, NULL, 78, 2, 1, 'sadsadaad', 80, NULL, 3920, 'Cash', 'sadsadsad', '2025-01-31 08:27:32', '2025-01-31 08:27:32', '4000', 'EGP'),
(76, 'spr-20250131-094501', 1, NULL, 79, 2, 1, NULL, 1049.99, NULL, 0, 'Cash', NULL, '2025-01-31 08:45:01', '2025-01-31 08:45:01', '1049.99', 'US Dollar'),
(77, 'spr-20250131-094501', 1, NULL, 79, 2, 1, NULL, 300, NULL, 14700, 'Cash', NULL, '2025-01-31 08:45:01', '2025-01-31 08:45:01', '15000', 'EGP'),
(78, 'spr-20250131-094639', 1, NULL, 80, 2, 1, NULL, 300, NULL, 0, 'Cash', NULL, '2025-01-31 08:46:39', '2025-01-31 08:46:39', '300', 'US Dollar'),
(79, 'spr-20250131-094848', 1, NULL, 81, 2, 1, NULL, 547, NULL, 0, 'Cash', NULL, '2025-01-31 08:48:48', '2025-01-31 08:48:48', '547.00', 'US Dollar'),
(80, 'spr-20250131-094910', 1, NULL, 82, 2, 1, NULL, 340, NULL, 0, 'Cash', NULL, '2025-01-31 08:49:10', '2025-01-31 08:49:10', '340.00', 'US Dollar'),
(81, 'spr-20250131-094927', 1, NULL, 83, 2, 1, NULL, 300, NULL, 0, 'Cash', NULL, '2025-01-31 08:49:27', '2025-01-31 08:49:27', '300.00', 'US Dollar'),
(82, 'spr-20250131-095122', 1, NULL, 84, 2, 1, NULL, 1150.99, NULL, 0, 'Cash', NULL, '2025-01-31 08:51:22', '2025-01-31 08:51:22', '1150.99', 'US Dollar'),
(83, 'spr-20250131-095353', 1, NULL, 85, 2, 1, 'dsfsfsfs', 1000, NULL, 0, 'Cash', 'fdsfdsfs', '2025-01-31 08:53:53', '2025-01-31 08:53:53', '1000', 'US Dollar'),
(84, 'spr-20250131-095353', 1, NULL, 85, 2, 1, 'dsfsfsfs', 40, NULL, 1960, 'Cash', 'fdsfdsfs', '2025-01-31 08:53:53', '2025-01-31 08:53:53', '2000', 'EGP');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_cheque`
--

CREATE TABLE `payment_with_cheque` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_with_cheque`
--

INSERT INTO `payment_with_cheque` (`id`, `payment_id`, `cheque_no`, `created_at`, `updated_at`) VALUES
(1, 21, '34242423', '2024-06-03 06:29:06', '2024-06-03 06:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_credit_card`
--

CREATE TABLE `payment_with_credit_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) DEFAULT NULL,
  `charge_id` varchar(191) NOT NULL,
  `data` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_with_credit_card`
--

INSERT INTO `payment_with_credit_card` (`id`, `payment_id`, `customer_id`, `customer_stripe_id`, `charge_id`, `data`, `created_at`, `updated_at`) VALUES
(1, 55, 2, NULL, '12345', '{\"card_number\":\"379187047423106\",\"card_holder_name\":\"Toufic Yasmine\",\"card_type\":\"Visa\"}', '2025-01-28 08:57:13', '2025-01-28 08:57:13'),
(2, 65, 2, NULL, '12345', '{\"card_number\":\"dfdss\",\"card_holder_name\":\"fdsfs\",\"card_type\":\"Visa\"}', '2025-01-30 08:26:59', '2025-01-30 08:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_gift_card`
--

CREATE TABLE `payment_with_gift_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_paypal`
--

CREATE TABLE `payment_with_paypal` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `reference_no`, `employee_id`, `account_id`, `user_id`, `amount`, `paying_method`, `note`, `created_at`, `updated_at`) VALUES
(1, 'payroll-20250127-023258', 1, 1, 1, 300, '0', 'December Salary', '2024-12-31 23:00:00', '2025-01-27 13:34:12'),
(2, 'payroll-20250127-023319', 2, 1, 1, 300, '0', 'December Salary', '2024-12-31 23:00:00', '2025-01-27 13:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'products-edit', 'web', '2018-06-03 01:00:09', '2018-06-03 01:00:09'),
(5, 'products-delete', 'web', '2018-06-03 22:54:22', '2018-06-03 22:54:22'),
(6, 'products-add', 'web', '2018-06-04 00:34:14', '2018-06-04 00:34:14'),
(7, 'products-index', 'web', '2018-06-04 03:34:27', '2018-06-04 03:34:27'),
(8, 'purchases-index', 'web', '2018-06-04 08:03:19', '2018-06-04 08:03:19'),
(9, 'purchases-add', 'web', '2018-06-04 08:12:25', '2018-06-04 08:12:25'),
(10, 'purchases-edit', 'web', '2018-06-04 09:47:36', '2018-06-04 09:47:36'),
(11, 'purchases-delete', 'web', '2018-06-04 09:47:36', '2018-06-04 09:47:36'),
(12, 'sales-index', 'web', '2018-06-04 10:49:08', '2018-06-04 10:49:08'),
(13, 'sales-add', 'web', '2018-06-04 10:49:52', '2018-06-04 10:49:52'),
(14, 'sales-edit', 'web', '2018-06-04 10:49:52', '2018-06-04 10:49:52'),
(15, 'sales-delete', 'web', '2018-06-04 10:49:53', '2018-06-04 10:49:53'),
(16, 'quotes-index', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(17, 'quotes-add', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(18, 'quotes-edit', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(19, 'quotes-delete', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(20, 'transfers-index', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(21, 'transfers-add', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(22, 'transfers-edit', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(23, 'transfers-delete', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(24, 'returns-index', 'web', '2018-06-04 22:50:24', '2018-06-04 22:50:24'),
(25, 'returns-add', 'web', '2018-06-04 22:50:24', '2018-06-04 22:50:24'),
(26, 'returns-edit', 'web', '2018-06-04 22:50:25', '2018-06-04 22:50:25'),
(27, 'returns-delete', 'web', '2018-06-04 22:50:25', '2018-06-04 22:50:25'),
(28, 'customers-index', 'web', '2018-06-04 23:15:54', '2018-06-04 23:15:54'),
(29, 'customers-add', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(30, 'customers-edit', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(31, 'customers-delete', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(32, 'suppliers-index', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(33, 'suppliers-add', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(34, 'suppliers-edit', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(35, 'suppliers-delete', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(36, 'product-report', 'web', '2018-06-24 23:05:33', '2018-06-24 23:05:33'),
(37, 'purchase-report', 'web', '2018-06-24 23:24:56', '2018-06-24 23:24:56'),
(38, 'sale-report', 'web', '2018-06-24 23:33:13', '2018-06-24 23:33:13'),
(39, 'customer-report', 'web', '2018-06-24 23:36:51', '2018-06-24 23:36:51'),
(40, 'due-report', 'web', '2018-06-24 23:39:52', '2018-06-24 23:39:52'),
(41, 'users-index', 'web', '2018-06-25 00:00:10', '2018-06-25 00:00:10'),
(42, 'users-add', 'web', '2018-06-25 00:00:10', '2018-06-25 00:00:10'),
(43, 'users-edit', 'web', '2018-06-25 00:01:30', '2018-06-25 00:01:30'),
(44, 'users-delete', 'web', '2018-06-25 00:01:30', '2018-06-25 00:01:30'),
(45, 'profit-loss', 'web', '2018-07-14 21:50:05', '2018-07-14 21:50:05'),
(46, 'best-seller', 'web', '2018-07-14 22:01:38', '2018-07-14 22:01:38'),
(47, 'daily-sale', 'web', '2018-07-14 22:24:21', '2018-07-14 22:24:21'),
(48, 'monthly-sale', 'web', '2018-07-14 22:30:41', '2018-07-14 22:30:41'),
(49, 'daily-purchase', 'web', '2018-07-14 22:36:46', '2018-07-14 22:36:46'),
(50, 'monthly-purchase', 'web', '2018-07-14 22:48:17', '2018-07-14 22:48:17'),
(51, 'payment-report', 'web', '2018-07-14 23:10:41', '2018-07-14 23:10:41'),
(52, 'warehouse-stock-report', 'web', '2018-07-14 23:16:55', '2018-07-14 23:16:55'),
(53, 'product-qty-alert', 'web', '2018-07-14 23:33:21', '2018-07-14 23:33:21'),
(54, 'supplier-report', 'web', '2018-07-30 03:00:01', '2018-07-30 03:00:01'),
(55, 'expenses-index', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(56, 'expenses-add', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(57, 'expenses-edit', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(58, 'expenses-delete', 'web', '2018-09-05 01:07:11', '2018-09-05 01:07:11'),
(59, 'general_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(60, 'mail_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(61, 'pos_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(62, 'hrm_setting', 'web', '2019-01-02 10:30:23', '2019-01-02 10:30:23'),
(63, 'purchase-return-index', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(64, 'purchase-return-add', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(65, 'purchase-return-edit', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(66, 'purchase-return-delete', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(67, 'account-index', 'web', '2019-01-02 22:06:13', '2019-01-02 22:06:13'),
(68, 'balance-sheet', 'web', '2019-01-02 22:06:14', '2019-01-02 22:06:14'),
(69, 'account-statement', 'web', '2019-01-02 22:06:14', '2019-01-02 22:06:14'),
(70, 'department', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(71, 'attendance', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(72, 'payroll', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(73, 'employees-index', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(74, 'employees-add', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(75, 'employees-edit', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(76, 'employees-delete', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(77, 'user-report', 'web', '2019-01-16 06:48:18', '2019-01-16 06:48:18'),
(78, 'stock_count', 'web', '2019-02-17 10:32:01', '2019-02-17 10:32:01'),
(79, 'adjustment', 'web', '2019-02-17 10:32:02', '2019-02-17 10:32:02'),
(80, 'sms_setting', 'web', '2019-02-22 05:18:03', '2019-02-22 05:18:03'),
(81, 'create_sms', 'web', '2019-02-22 05:18:03', '2019-02-22 05:18:03'),
(82, 'print_barcode', 'web', '2019-03-07 05:02:19', '2019-03-07 05:02:19'),
(83, 'empty_database', 'web', '2019-03-07 05:02:19', '2019-03-07 05:02:19'),
(84, 'customer_group', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(85, 'unit', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(86, 'tax', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(87, 'gift_card', 'web', '2019-03-07 06:29:38', '2019-03-07 06:29:38'),
(88, 'coupon', 'web', '2019-03-07 06:29:38', '2019-03-07 06:29:38'),
(89, 'holiday', 'web', '2019-10-19 08:57:15', '2019-10-19 08:57:15'),
(90, 'warehouse-report', 'web', '2019-10-22 06:00:23', '2019-10-22 06:00:23'),
(91, 'warehouse', 'web', '2020-02-26 06:47:32', '2020-02-26 06:47:32'),
(92, 'brand', 'web', '2020-02-26 06:59:59', '2020-02-26 06:59:59'),
(93, 'billers-index', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(94, 'billers-add', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(95, 'billers-edit', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(96, 'billers-delete', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(97, 'money-transfer', 'web', '2020-03-02 05:41:48', '2020-03-02 05:41:48'),
(98, 'category', 'web', '2020-07-13 12:13:16', '2020-07-13 12:13:16'),
(99, 'delivery', 'web', '2020-07-13 12:13:16', '2020-07-13 12:13:16'),
(100, 'send_notification', 'web', '2020-10-31 06:21:31', '2020-10-31 06:21:31'),
(101, 'today_sale', 'web', '2020-10-31 06:57:04', '2020-10-31 06:57:04'),
(102, 'today_profit', 'web', '2020-10-31 06:57:04', '2020-10-31 06:57:04'),
(103, 'currency', 'web', '2020-11-09 00:23:11', '2020-11-09 00:23:11'),
(104, 'backup_database', 'web', '2020-11-15 00:16:55', '2020-11-15 00:16:55'),
(105, 'reward_point_setting', 'web', '2021-06-27 04:34:42', '2021-06-27 04:34:42'),
(106, 'revenue_profit_summary', 'web', '2022-02-08 13:57:21', '2022-02-08 13:57:21'),
(107, 'cash_flow', 'web', '2022-02-08 13:57:22', '2022-02-08 13:57:22'),
(108, 'monthly_summary', 'web', '2022-02-08 13:57:22', '2022-02-08 13:57:22'),
(109, 'yearly_report', 'web', '2022-02-08 13:57:22', '2022-02-08 13:57:22'),
(110, 'discount_plan', 'web', '2022-02-16 09:12:26', '2022-02-16 09:12:26'),
(111, 'discount', 'web', '2022-02-16 09:12:38', '2022-02-16 09:12:38'),
(112, 'product-expiry-report', 'web', '2022-03-30 05:39:20', '2022-03-30 05:39:20'),
(113, 'purchase-payment-index', 'web', '2022-06-05 14:12:27', '2022-06-05 14:12:27'),
(114, 'purchase-payment-add', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(115, 'purchase-payment-edit', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(116, 'purchase-payment-delete', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(117, 'sale-payment-index', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(118, 'sale-payment-add', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(119, 'sale-payment-edit', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(120, 'sale-payment-delete', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(121, 'all_notification', 'web', '2022-06-05 14:12:29', '2022-06-05 14:12:29'),
(122, 'sale-report-chart', 'web', '2022-06-05 14:12:29', '2022-06-05 14:12:29'),
(123, 'dso-report', 'web', '2022-06-05 14:12:29', '2022-06-05 14:12:29'),
(124, 'product_history', 'web', '2022-08-25 14:04:05', '2022-08-25 14:04:05'),
(125, 'supplier-due-report', 'web', '2022-08-31 09:46:33', '2022-08-31 09:46:33'),
(126, 'custom_field', 'web', '2023-05-02 07:41:35', '2023-05-02 07:41:35'),
(127, 'incomes-index', 'web', '2024-08-11 04:50:59', '2024-08-11 04:50:59'),
(128, 'incomes-add', 'web', '2024-08-11 04:50:59', '2024-08-11 04:50:59'),
(129, 'incomes-edit', 'web', '2024-08-11 04:50:59', '2024-08-11 04:50:59'),
(130, 'incomes-delete', 'web', '2024-08-11 04:50:59', '2024-08-11 04:50:59'),
(131, 'packing_slip_challan', 'web', '2024-08-11 04:51:00', '2024-08-11 04:51:00'),
(132, 'biller-report', 'web', '2025-01-30 07:53:26', '2025-01-30 07:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `pos_setting`
--

CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `is_table` tinyint(1) NOT NULL DEFAULT 0,
  `send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_public_key` varchar(191) DEFAULT NULL,
  `stripe_secret_key` varchar(191) DEFAULT NULL,
  `paypal_live_api_username` varchar(191) DEFAULT NULL,
  `paypal_live_api_password` varchar(191) DEFAULT NULL,
  `paypal_live_api_secret` varchar(191) DEFAULT NULL,
  `payment_options` text DEFAULT NULL,
  `invoice_option` varchar(10) DEFAULT NULL,
  `thermal_invoice_size` varchar(255) NOT NULL DEFAULT '80',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_setting`
--

INSERT INTO `pos_setting` (`id`, `customer_id`, `warehouse_id`, `biller_id`, `product_number`, `keybord_active`, `is_table`, `send_sms`, `stripe_public_key`, `stripe_secret_key`, `paypal_live_api_username`, `paypal_live_api_password`, `paypal_live_api_secret`, `payment_options`, `invoice_option`, `thermal_invoice_size`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 4, 0, 0, 0, NULL, NULL, 'admin', 'admin', NULL, 'cash,card,cheque,gift_card,deposit', 'thermal', '80', '2018-09-02 03:17:04', '2025-01-23 15:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `barcode_symbology` varchar(191) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `wholesale_price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `daily_sale_objective` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(191) DEFAULT NULL,
  `starting_date` varchar(200) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `is_embeded` tinyint(1) DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `is_imei` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `is_online` tinyint(4) DEFAULT NULL,
  `in_stock` tinyint(4) DEFAULT NULL,
  `track_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `product_list` varchar(191) DEFAULT NULL,
  `variant_list` varchar(191) DEFAULT NULL,
  `qty_list` varchar(191) DEFAULT NULL,
  `price_list` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `specification` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `related_products` longtext DEFAULT NULL,
  `variant_option` text DEFAULT NULL,
  `variant_value` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `guarantee` int(11) DEFAULT NULL,
  `warranty` int(11) DEFAULT NULL,
  `guarantee_type` varchar(255) DEFAULT NULL,
  `warranty_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `code`, `type`, `barcode_symbology`, `brand_id`, `category_id`, `unit_id`, `purchase_unit_id`, `sale_unit_id`, `cost`, `price`, `wholesale_price`, `qty`, `alert_quantity`, `daily_sale_objective`, `promotion`, `promotion_price`, `starting_date`, `last_date`, `tax_id`, `tax_method`, `image`, `file`, `is_embeded`, `is_variant`, `is_batch`, `is_diffPrice`, `is_imei`, `featured`, `is_online`, `in_stock`, `track_inventory`, `product_list`, `variant_list`, `qty_list`, `price_list`, `product_details`, `short_description`, `specification`, `meta_title`, `meta_description`, `related_products`, `variant_option`, `variant_value`, `is_active`, `guarantee`, `warranty`, `guarantee_type`, `warranty_type`, `created_at`, `updated_at`) VALUES
(1, 'Zenbook 14 OLED (UX3402)｜Laptops For Home – ASUS', 'zenbook-14-oled-ux3402laptops-for-home-asus', NULL, '59028109', 'standard', 'C128', 2, 6, 1, 1, 1, 1099.99, 1299.99, NULL, 1, NULL, NULL, 1, '1050.99', '2024-01-08', NULL, 1, 2, '202401081146401.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-08 05:46:42', '2025-01-31 08:53:53'),
(2, '2021 Apple 12.9-inch iPad Pro Wi-Fi 512GB', '2021-apple-129-inch-ipad-pro-wi-fi-512gb', NULL, '2035892312345', 'standard', 'C128', 3, 6, 1, 1, 1, 1000, 1250, 1230, 18, NULL, NULL, 1, '1200.00', '2024-01-08', NULL, 1, 2, '202401081246041.png,202401081246062.png,202401081246063.png,202401081246064.png', NULL, 0, NULL, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor. Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>', NULL, NULL, NULL, NULL, '[]', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-08 06:46:07', '2025-01-28 09:44:40'),
(3, 'Apple iPhone 11 (4GB-64GB) Black', 'apple-iphone-11-4gb-64gb-black', NULL, '49251814', 'standard', 'C128', 1, 1, 1, 1, 1, 300, 350, NULL, 10, NULL, NULL, 1, NULL, '2024-01-08', NULL, 1, 2, '202401081255081.png,202401081255112.png,202401081255123.png,202401081255134.png,202401081255135.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-08 06:55:14', '2025-01-31 08:49:27'),
(4, 'Samsung Galaxy Chromebook Go, 14″ HD LED, Intel Celeron N4500', 'samsung-galaxy-chromebook-go-14-hd-led-intel-celeron-n4500', NULL, '28090345', 'standard', 'C128', 2, 6, 1, 1, 1, 900, 1050, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '202401080121221.png,202401080121242.png,202401080121243.png,202401080121254.png', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, '<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor. Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-08 07:21:25', '2025-01-23 14:20:40'),
(5, 'SAMSUNG Galaxy Book Pro 15.6 Laptop – Intel Core i5', 'samsung-galaxy-book-pro-156-laptop-intel-core-i5', NULL, '67015642', 'standard', 'C128', 2, 6, 1, 1, 1, 950.99, 1150.99, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '202401080124321.png,202401080124342.png,202401080124353.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-08 07:24:36', '2025-01-31 08:51:22'),
(6, 'Microsoft – Surface Laptop 4 13.5” Touch-Screen – AMD Ryzen 5', 'microsoft-surface-laptop-4-135-touch-screen-amd-ryzen-5', NULL, '24005329', 'standard', 'C128', 3, 6, 1, 1, 1, 999.99, 1111.99, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401080127451.png,202401080127462.png,202401080127473.jpg,202401080127484.jpg,202401080127485.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-08 07:27:49', '2025-01-30 09:51:37'),
(7, 'Acer Chromebook 315, 15.6 HD – Intel Celeron N4000', 'acer-chromebook-315-156-hd-intel-celeron-n4000', NULL, '30798200', 'standard', 'C128', 4, 6, 1, 1, 1, 899.99, 999.99, 950, 21, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '202401080130241.png,202401080130242.png,202401080130253.png', NULL, 0, NULL, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-08 07:30:25', '2025-01-31 08:45:01'),
(8, 'HP Victus 16-e00244AX GTX 1650 Gaming Laptop 16.1” FHD 144Hz', 'hp-victus-16-e00244ax-gtx-1650-gaming-laptop-161-fhd-144hz', NULL, '81526930', 'standard', 'C128', 4, 6, 1, 1, 1, 1199, 1300, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '202401080134061.png,202401080134072.png,202401080134073.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-08 07:34:08', '2025-01-23 14:20:40'),
(9, 'Epson Inkjet WorkForce Pro WF-3820DWF', 'epson-inkjet-workforce-pro-wf-3820dwf', NULL, '20142029', 'standard', 'C128', 2, 6, 1, 1, 1, 399, 559, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401080141091.png,202401080141102.png,202401080141103.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-08 07:41:11', '2025-01-23 14:20:40'),
(10, 'iPhone 14 Pro 256GB Gold', 'iphone-14-pro-256gb-gold', NULL, '29733132', 'standard', 'C128', 1, 1, 1, 1, 1, 990, 1250, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401080143591.png,202401080144002.png,202401080144013.png,202401080144014.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-08 07:44:02', '2025-01-28 09:53:22'),
(11, 'Electrolux EW6F449ST PerfectCare 9 Kg Washing Machine', 'electrolux-ew6f449st-perfectcare-9-kg-washing-machine', NULL, '23279148', 'standard', 'C128', 5, 20, 1, 1, 1, 1500, 1750, NULL, 20, NULL, NULL, 1, '1650', '2024-01-13', NULL, 1, 2, '202401130329581.png,202401130330002.png,202401130330013.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-13 09:30:02', '2025-01-23 14:20:40'),
(12, 'GORENJE Waschmaschine WHP74EPS Waschmaschine', 'gorenje-waschmaschine-whp74eps-waschmaschine', NULL, '43879312', 'standard', 'C128', 2, 20, 1, 1, 1, 999, 1250, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '202401130338301.png,202401130338322.png,202401130338323.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-13 09:38:33', '2025-01-23 14:20:40'),
(13, 'iRobot Roomba E6 (6199) Robot Vacuum', 'irobot-roomba-e6-6199-robot-vacuum', NULL, '56858702', 'standard', 'C128', 4, 22, 1, 1, 1, 250, 349, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '202401130343221.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-13 09:43:24', '2025-01-23 14:20:40'),
(14, 'Sony Bravia 55X90J 4K Ultra HD 55″ 140 Screen Google Smart LED TV', 'sony-bravia-55x90j-4k-ultra-hd-55-140-screen-google-smart-led-tv', NULL, '16530612', 'standard', 'C128', 3, 23, 1, 1, 1, 350, 499, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-13 09:53:32', '2025-01-27 09:38:31'),
(15, 'Samsung 43AU7000 4K Ultra HD 43″ 109 Screen Smart LED TV', 'samsung-43au7000-4k-ultra-hd-43-109-screen-smart-led-tv', NULL, '73189124', 'standard', 'C128', 2, 23, 1, 1, 1, 499, 547, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401130357131.png,202401130357152.png,202401130357153.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-13 09:57:16', '2025-01-31 08:48:48'),
(16, 'Apple TV HD 32GB (2nd Generation)', 'apple-tv-hd-32gb-2nd-generation', NULL, '71493353', 'standard', 'C128', 1, 23, 1, 1, 1, 79, 109, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401130401491.png,202401130401522.png,202401130401533.png,202401130401544.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-13 10:01:55', '2025-01-30 09:38:22'),
(17, 'Apple Watch SE GPS + Cellular 40mm Space Gray', 'apple-watch-se-gps-cellular-40mm-space-gray', NULL, '92178104', 'standard', 'C128', 1, 12, 1, 1, 1, 349, 499, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401130410191.png,202401130410222.jpg,202401130410233.jpg', NULL, 0, NULL, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-13 10:10:24', '2025-01-23 14:20:40'),
(18, 'Xbox One Wireless Controller Black Color', 'xbox-one-wireless-controller-black-color', NULL, '93060790', 'standard', 'C128', NULL, 1, 1, 1, 1, 459, 599, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '202401150808421.jpg,202401150808432.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '\r\nQuisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 14:08:43', '2025-01-23 14:20:40'),
(19, 'Apple iPhone XS Max-64GB -white', 'apple-iphone-xs-max-64gb-white', NULL, '22061536', 'standard', 'C128', 1, 1, 1, 1, 1, 899, 1059, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '202401150814131.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '\r\nQuisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 14:14:14', '2025-01-23 14:20:40'),
(20, 'Apple Watch Series 8 GPS 45mm Midnight Aluminum Case', 'apple-watch-series-8-gps-45mm-midnight-aluminum-case', NULL, '31429623', 'standard', 'C128', 1, 12, 1, 1, 1, 399, 499, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401151009571.png,202401151009582.png,202401151009583.jpg', NULL, 0, NULL, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '<p>Quisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor. Morbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.</p>', NULL, NULL, NULL, NULL, '[]', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 16:09:59', '2025-01-27 11:37:15'),
(21, 'Huawei Watch GT 2 Sport Stainless Steel 46mm', 'huawei-watch-gt-2-sport-stainless-steel-46mm', NULL, '02456392', 'standard', 'C128', 3, 12, 1, 1, 1, 369, 599, NULL, 20, NULL, NULL, 1, '499', '2024-01-15', NULL, NULL, 1, '202401151013061.png,202401151013062.png,202401151013073.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '\r\nQuisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 16:13:07', '2025-01-23 14:20:40'),
(22, 'Samsung Galaxy Active 2 R835U Smartwatch 40mm', 'samsung-galaxy-active-2-r835u-smartwatch-40mm', NULL, '10203743', 'standard', 'C128', 2, 12, 1, 1, 1, 275, 399, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401151019301.png,202401151019302.png,202401151019313.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '\r\nQuisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 16:19:31', '2025-01-23 14:20:40'),
(23, 'Canon EOS R10 RF-S 18-45 IS STM', 'canon-eos-r10-rf-s-18-45-is-stm', NULL, '13929367', 'standard', 'C128', 17, 1, 1, 1, 1, 439, 577, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401151024231.png,202401151024232.png,202401151024233.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '\r\nQuisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 16:24:24', '2025-01-23 14:20:40'),
(24, 'Sony A7 III Mirrorless Camera Body Only', 'sony-a7-iii-mirrorless-camera-body-only', NULL, '99421096', 'standard', 'C128', 2, 1, 1, 1, 1, 299, 379, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '202401151026581.png,202401151026592.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '\r\nQuisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 16:27:00', '2025-01-23 14:20:40'),
(25, 'WOLFANG GA420 Action Camera 4K 60FPS 24MP', 'wolfang-ga420-action-camera-4k-60fps-24mp', NULL, '99218280', 'standard', 'C128', 4, 1, 1, 1, 1, 130, 157.99, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401151029321.png,202401151029332.jpg,202401151029343.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '\r\nQuisque varius diam vel metus mattis, id aliquam diam rhoncus. Proin vitae magna in dui finibus malesuada et at nulla. Morbi elit ex, viverra vitae ante vel, blandit feugiat ligula. Fusce fermentum iaculis nibh, at sodales leo maximus a. Nullam ultricies sodales nunc, in pellentesque lorem mattis quis. Cras imperdiet est in nunc tristique lacinia. Nullam aliquam mauris eu accumsan tincidunt. Suspendisse velit ex, aliquet vel ornare vel, dignissim a tortor.\r\nMorbi ut sapien vitae odio accumsan gravida. Morbi vitae erat auctor, eleifend nunc a, lobortis neque. Praesent aliquam dignissim viverra. Maecenas lacus odio, feugiat eu nunc sit amet, maximus sagittis dolor. Vivamus nisi sapien, elementum sit amet eros sit amet, ultricies cursus ipsum. Sed consequat luctus ligula. Curabitur laoreet rhoncus blandit. Aenean vel diam ut arcu pharetra dignissim ut sed leo. Vivamus faucibus, ipsum in vestibulum vulputate, lorem orci convallis quam, sit amet consequat nulla felis pharetra lacus. Duis semper erat mauris, sed egestas purus commodo vel.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 16:29:34', '2025-01-23 14:20:40'),
(26, 'Fresh Organic Navel Orange', 'fresh-organic-navel-orange', NULL, '33887520', 'standard', 'C128', NULL, 29, 4, 4, 4, 2.99, 3.99, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401151115301.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Fresh Organic Navel Orange', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 17:15:32', '2025-01-23 14:20:40'),
(27, 'Banana (pack of 12)', 'banana-pack-of-12', NULL, '27583341', 'standard', 'C128', NULL, 29, 1, 1, 1, 0.89, 1.29, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401151118271.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 17:18:28', '2025-01-23 14:20:40'),
(28, 'Water Melon ~ 3KG', 'water-melon-3kg', NULL, '19186147', 'standard', 'C128', NULL, 29, 1, 1, 1, 2.39, 3.3, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401151142511.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Water Melon ~ 3KG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 17:42:53', '2025-01-23 14:20:40'),
(29, 'Gala Original Apple - 1KG', 'gala-original-apple-1kg', NULL, '80912386', 'standard', 'C128', NULL, 29, 1, 1, 1, 2.39, 3.19, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202401151144271.png', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 'Gala Original Apple - 1KG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-15 17:44:27', '2025-01-23 14:20:40'),
(30, 'Apple Smart Watch', 'apple-smart-watch', NULL, '12010761', 'standard', 'C128', 1, 12, 1, 1, 1, 100, 200, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '202401190429592.jpg', NULL, 0, NULL, NULL, 0, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-01-19 09:43:44', '2025-01-23 14:20:40'),
(31, 'Alpha Cheese', 'alpha-cheese', NULL, '33357221', 'standard', 'C128', NULL, 34, 1, 1, 1, 120, 200, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2024-04-14 06:15:06', '2025-01-27 11:35:53'),
(32, 'green spice', 'green-spice', NULL, '61226895', 'standard', 'C128', 19, 40, 1, 1, 1, 10, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-29 12:29:17', '2025-01-23 14:20:40'),
(33, 'Samsung Adapter', 'samsung-adapter', NULL, '99767039', 'standard', 'C128', 2, 6, 1, 1, 1, 100, 250, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-07-18 07:39:33', '2025-01-23 14:20:40'),
(34, 'test toufic', 'test-toufic', NULL, '93030169', 'standard', 'EAN13', 8, 8, 1, 1, 1, 900, 1200, NULL, -11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202501241111022.png,202501241111422.png', NULL, 0, 1, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '[]', '[\"color\",\"size\"]', '[\"red,meduim\",\"large\"]', 0, NULL, NULL, NULL, NULL, '2024-09-19 12:00:57', '2025-01-27 11:34:29'),
(35, 'product', 'product', NULL, '63164322', 'standard', 'C128', 1, 1, 4, 4, 4, 344, 3445, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"color\"]', '[\"green,blue\"]', 0, NULL, NULL, NULL, NULL, '2024-09-19 12:11:11', '2025-01-27 11:35:18'),
(36, 'tshirt', 'tshirt', NULL, '90857211', 'standard', 'C128', NULL, 1, 1, 1, 1, 80, 100, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '<p>this is just a product details test</p>', NULL, NULL, NULL, NULL, NULL, '[\"size\",\"Color\"]', '[\"M,L\",\"Red,Blue\"]', 0, NULL, NULL, NULL, NULL, '2024-09-19 12:31:00', '2024-09-25 12:01:46'),
(37, 'shirts', 'shirts', NULL, '39101927', 'standard', 'C128', 1, 2, 1, 1, 1, 50, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"Size\",\"Color\"]', '[\"Small,Medium,Large\",\"White,Black,Green\"]', 0, NULL, NULL, NULL, NULL, '2024-09-19 13:47:33', '2024-09-25 12:01:46'),
(38, 'tshirts', 'tshirts', NULL, '46408793', 'standard', 'C128', 1, 2, 1, 1, 1, 50, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"Size\",\"Color\"]', '[\"Small,Medium,Large\",\"White,Black,Green\"]', 0, NULL, NULL, NULL, NULL, '2024-09-19 13:49:08', '2024-09-25 12:01:46'),
(39, 'testre', 'testre', NULL, '68110574', 'standard', 'C128', 1, 1, 1, 1, 1, 34, 234, NULL, -8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409190636281.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2024-09-19 16:36:29', '2025-01-27 11:34:37'),
(40, 'PMS Store', 'pms-store', NULL, '05624894', 'standard', 'C128', 8, 2, 1, 1, 1, 344, 500, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409201206161.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-09-20 10:06:16', '2025-01-23 14:20:40'),
(41, 'test product', 'test-product', NULL, '09732522', 'standard', 'C128', 8, 8, 1, 1, 1, 233, 355, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409201250161.jpg,202409201250162.jpeg', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"color\",\"size\",\"color\",\"size\"]', '[\"red,blue\",\"M,L,S\",\"red,blue\",\"M,L,S\"]', 0, NULL, NULL, NULL, NULL, '2024-09-20 10:50:16', '2025-01-27 11:34:14'),
(42, 'shirt', 'shirt', NULL, '13990714', 'standard', 'C128', 1, 2, 1, 1, 1, 5, 10, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409200104541.jpg', NULL, 0, 1, NULL, 0, NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"size\",\"color\"]', '[\"small,medium,large\",\"white,black,green\"]', 0, NULL, NULL, NULL, NULL, '2024-09-20 11:04:54', '2024-09-25 12:53:41'),
(43, 'tshirts', 'tshirts', NULL, '91983805', 'standard', 'C128', 1, 41, 1, 1, 1, 5, 10, NULL, -45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409200115521.jpg,202409200115522.jpg,202409200115523.jpg', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"size\",\"color\",\"size\",\"color\",\"size\",\"color\"]', '[\"small,medium,large\",\"white,black,green\",\"small,medium,large\",\"white,black,green\",\"small,medium,large\",\"white,black,green\"]', 0, NULL, NULL, NULL, NULL, '2024-09-20 11:15:52', '2024-09-25 12:01:46'),
(44, 'Samsung phone', 'samsung-phone', NULL, '10983943', 'standard', 'C128', 2, 4, 1, 1, 1, 4500, 5000, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409200240111.jpeg', NULL, NULL, 1, NULL, NULL, 1, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"color\"]', '[\"black,white\"]', 1, NULL, NULL, NULL, NULL, '2024-09-20 12:40:11', '2025-01-23 14:20:40'),
(45, 'admin', 'admin', NULL, '03041523', 'standard', 'C128', 1, 2, 1, 1, 1, 55555, 7777777, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409240530301.jpeg', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"color\"]', '[\"red\"]', 0, NULL, NULL, NULL, NULL, '2024-09-24 15:30:30', '2025-01-27 11:35:47'),
(46, 'tshirts', 'tshirts', NULL, '35101582', 'standard', 'C128', 2, 41, 1, 1, 1, 10, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409250255421.jpg,202409250255422.jpg,202409250255423.jpg', NULL, 0, 1, NULL, 0, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '[]', '[\"size\",\"color\",null,null,null,null]', '[\"small,medium,large\",\"black,white,green\",null,null,null,null]', 0, NULL, NULL, NULL, NULL, '2024-09-25 12:55:43', '2024-09-25 13:03:52'),
(47, 'thsirts', 'thsirts', NULL, '19273003', 'standard', 'C128', 1, 41, 1, 1, 1, 10, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409250305411.jpg,202409250305422.jpg,202409250305423.jpg', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"size\",\"color\",\"size\",\"color\",\"size\",\"color\"]', '[\"S,M,L\",\"Black,White,Green\",\"S,M,L\",\"Black,White,Green\",\"S,M,L\",\"Black,White,Green\"]', 1, NULL, NULL, NULL, NULL, '2024-09-25 13:05:42', '2025-01-23 14:20:40'),
(48, 'shirts', 'shirts', NULL, '07394561', 'standard', 'C128', 1, 41, 1, 1, 1, 10, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409250310571.jpg,202409250310572.jpg,202409250310573.jpg', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"size\",\"color\",\"size\",\"color\",\"size\",\"color\"]', '[\"l,m,s\",\"white,black,green\",\"l,m,s\",\"white,black,green\",\"l,m,s\",\"white,black,green\"]', 0, NULL, NULL, NULL, NULL, '2024-09-25 13:10:57', '2025-01-27 11:36:03'),
(49, 'test shirt', 'test-shirt', NULL, '43226111', 'standard', 'C128', 1, 1, 1, 1, 1, 10, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409270115341.png,202409270115342.png', NULL, 0, 1, NULL, 0, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, '<p>test</p>', NULL, NULL, 'test meta title', 'test meta desc', '[]', '[\"size\",\"color\"]', '[\"1,2,3\",\"r,b,w\"]', 0, NULL, NULL, NULL, NULL, '2024-09-27 11:15:35', '2025-01-27 11:34:22'),
(50, 'Tshirts', 'tshirts', NULL, '29310144', 'standard', 'C128', 1, 41, 1, 1, 1, 10, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409270150431.jpg,202409270150432.jpg,202409270150433.jpg', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"size\",\"color\",\"size\",\"color\",\"size\",\"color\"]', '[\"large,medium,small\",\"black,white,green\",\"large,medium,small\",\"black,white,green\",\"large,medium,small\",\"black,white,green\"]', 0, NULL, NULL, NULL, NULL, '2024-09-27 11:50:43', '2025-01-27 11:36:11');
INSERT INTO `products` (`id`, `name`, `slug`, `tags`, `code`, `type`, `barcode_symbology`, `brand_id`, `category_id`, `unit_id`, `purchase_unit_id`, `sale_unit_id`, `cost`, `price`, `wholesale_price`, `qty`, `alert_quantity`, `daily_sale_objective`, `promotion`, `promotion_price`, `starting_date`, `last_date`, `tax_id`, `tax_method`, `image`, `file`, `is_embeded`, `is_variant`, `is_batch`, `is_diffPrice`, `is_imei`, `featured`, `is_online`, `in_stock`, `track_inventory`, `product_list`, `variant_list`, `qty_list`, `price_list`, `product_details`, `short_description`, `specification`, `meta_title`, `meta_description`, `related_products`, `variant_option`, `variant_value`, `is_active`, `guarantee`, `warranty`, `guarantee_type`, `warranty_type`, `created_at`, `updated_at`) VALUES
(51, 'toufic', 'toufic', NULL, '30225478', 'standard', 'C128', 1, 1, 1, 1, 1, 10, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"Size\",\"Color\"]', '[\"L,M,S\",\"White,Red,Orange\"]', 0, NULL, NULL, NULL, NULL, '2024-09-30 11:21:44', '2025-01-27 11:35:06'),
(52, 'Tshirts New', 'tshirts-new', NULL, '24682930', 'standard', 'C128', 1, 41, 1, 1, 1, 10, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409300129571.jpg,202409300129572.jpg,202409300129583.jpg', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"size\",\"color\",\"size\",\"color\",\"size\",\"color\"]', '[\"small,medium,large\",\"black,white,green\",\"small,medium,large\",\"black,white,green\",\"small,medium,large\",\"black,white,green\"]', 0, NULL, NULL, NULL, NULL, '2024-09-30 11:29:58', '2025-01-27 11:36:18'),
(53, 'alaa', 'alaa', NULL, '94264831', 'standard', 'C128', 1, 41, 1, 1, 1, 10, 20, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202409300134181.jpg,202409300134182.jpg', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '[\"size\",\"color\",\"size\",\"color\"]', '[\"L,M,S\",\"Black,Green,white\",\"L,M,S\",\"Black,Green,white\"]', 0, NULL, NULL, NULL, NULL, '2024-09-30 11:34:19', '2025-01-27 11:35:26'),
(54, 'Optimal Samsung Phones', 'optimal-samsung-phones', NULL, '21208959', 'standard', 'C128', 2, 1, 1, 1, 1, 100, 150, 120, 60, 1, 5, NULL, NULL, NULL, NULL, NULL, 2, '202501200149531.jpg', NULL, 0, 1, NULL, 0, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '[]', '[\"color\",\"GB\"]', '[\"red,white,green\",\"64,128,256\"]', 1, NULL, NULL, NULL, NULL, '2025-01-20 12:49:54', '2025-01-23 15:06:45'),
(55, 'test', 'test', NULL, '92683035', 'standard', 'C128', NULL, 1, 1, 1, 1, 20, 25, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-01-30 09:27:57', '2025-01-30 09:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_adjustments`
--

CREATE TABLE `product_adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_batches`
--

CREATE TABLE `product_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(191) NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_purchases`
--

CREATE TABLE `product_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `return_qty` double NOT NULL DEFAULT 0,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_purchases`
--

INSERT INTO `product_purchases` (`id`, `purchase_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `recieved`, `return_qty`, `purchase_unit_id`, `net_unit_cost`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 23, NULL, NULL, NULL, 10, 10, 0, 1, 439, 0, 0, 0, 4390, '2024-01-19 13:46:04', '2024-01-19 13:46:04'),
(2, 1, 27, NULL, NULL, NULL, 10, 10, 0, 1, 0.89, 0, 0, 0, 8.9, '2024-01-19 13:46:04', '2024-01-19 13:46:04'),
(3, 1, 20, NULL, NULL, NULL, 10, 10, 0, 1, 399, 0, 0, 0, 3990, '2024-01-19 13:46:04', '2024-01-19 13:46:04'),
(4, 1, 17, NULL, NULL, NULL, 10, 10, 0, 1, 349, 0, 0, 0, 3490, '2024-01-19 13:46:04', '2024-01-19 13:46:04'),
(5, 1, 16, NULL, NULL, NULL, 10, 10, 0, 1, 79, 0, 0, 0, 790, '2024-01-19 13:46:04', '2024-01-19 13:46:04'),
(6, 1, 30, NULL, NULL, NULL, 10, 10, 0, 1, 100, 0, 10, 100, 1100, '2024-01-19 13:46:04', '2024-01-19 13:46:04'),
(7, 1, 19, NULL, NULL, NULL, 10, 10, 0, 1, 817.27, 0, 10, 817.27, 8990, '2024-01-19 13:46:04', '2024-01-19 13:46:04'),
(8, 1, 3, NULL, NULL, NULL, 10, 10, 0, 1, 272.73, 0, 10, 272.73, 3000, '2024-01-19 13:46:05', '2024-01-19 13:46:05'),
(9, 1, 7, NULL, NULL, NULL, 10, 10, 0, 1, 818.17, 0, 10, 818.17, 8999.9, '2024-01-19 13:46:05', '2024-01-19 13:46:05'),
(10, 1, 2, NULL, NULL, NULL, 10, 10, 0, 1, 909.09, 0, 10, 909.09, 10000, '2024-01-19 13:46:05', '2024-01-19 13:46:05'),
(11, 2, 6, NULL, NULL, NULL, 10, 10, 0, 1, 999.99, 0, 0, 0, 9999.9, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(12, 2, 13, NULL, NULL, NULL, 10, 10, 0, 1, 227.27, 0, 10, 227.27, 2500, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(13, 2, 10, NULL, NULL, NULL, 10, 10, 0, 1, 990, 0, 0, 0, 9900, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(14, 2, 21, NULL, NULL, NULL, 10, 10, 0, 1, 369, 0, 0, 0, 3690, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(15, 2, 8, NULL, NULL, NULL, 10, 10, 0, 1, 1090, 0, 10, 1090, 11990, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(16, 2, 12, NULL, NULL, NULL, 10, 10, 0, 1, 908.18, 0, 10, 908.18, 9990, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(17, 2, 29, NULL, NULL, NULL, 10, 10, 0, 1, 2.39, 0, 0, 0, 23.9, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(18, 2, 26, NULL, NULL, NULL, 10, 10, 0, 4, 2.99, 0, 0, 0, 29.9, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(19, 2, 9, NULL, NULL, NULL, 10, 10, 0, 1, 399, 0, 0, 0, 3990, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(20, 2, 11, NULL, NULL, NULL, 10, 10, 0, 1, 1363.64, 0, 10, 1363.64, 15000, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(21, 3, 1, NULL, NULL, NULL, 10, 10, 0, 1, 999.99, 0, 10, 999.99, 10999.9, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(22, 3, 18, NULL, NULL, NULL, 10, 10, 0, 1, 417.27, 0, 10, 417.27, 4590, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(23, 3, 25, NULL, NULL, NULL, 10, 10, 0, 1, 130, 0, 0, 0, 1300, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(24, 3, 28, NULL, NULL, NULL, 10, 10, 0, 1, 2.39, 0, 0, 0, 23.9, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(25, 3, 14, NULL, NULL, NULL, 10, 10, 0, 1, 318.18, 0, 10, 318.18, 3500, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(26, 3, 24, NULL, NULL, NULL, 10, 10, 0, 1, 271.82, 0, 10, 271.82, 2990, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(27, 3, 4, NULL, NULL, NULL, 10, 10, 0, 1, 818.18, 0, 10, 818.18, 9000, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(28, 3, 5, NULL, NULL, NULL, 10, 10, 0, 1, 864.54, 0, 10, 864.54, 9509.9, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(29, 3, 22, NULL, NULL, NULL, 10, 10, 0, 1, 275, 0, 0, 0, 2750, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(30, 3, 15, NULL, NULL, NULL, 10, 10, 0, 1, 499, 0, 0, 0, 4990, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(31, 4, 1, NULL, NULL, NULL, 11, 11, 0, 1, 999.99, 0, 10, 1099.99, 12099.89, '2024-01-19 14:26:48', '2024-01-19 14:26:48'),
(32, 4, 18, NULL, NULL, NULL, 10, 10, 0, 1, 417.27, 0, 10, 417.27, 4590, '2024-01-19 14:26:48', '2024-01-19 14:26:48'),
(33, 4, 25, NULL, NULL, NULL, 10, 10, 0, 1, 130, 0, 0, 0, 1300, '2024-01-19 14:26:48', '2024-01-19 14:26:48'),
(34, 4, 28, NULL, NULL, NULL, 10, 10, 0, 1, 2.39, 0, 0, 0, 23.9, '2024-01-19 14:26:48', '2024-01-19 14:26:48'),
(35, 4, 14, NULL, NULL, NULL, 10, 10, 0, 1, 318.18, 0, 10, 318.18, 3500, '2024-01-19 14:26:49', '2024-01-19 14:26:49'),
(36, 4, 24, NULL, NULL, NULL, 10, 10, 0, 1, 271.82, 0, 10, 271.82, 2990, '2024-01-19 14:26:49', '2024-01-19 14:26:49'),
(37, 4, 4, NULL, NULL, NULL, 10, 10, 0, 1, 818.18, 0, 10, 818.18, 9000, '2024-01-19 14:26:49', '2024-01-19 14:26:49'),
(38, 4, 5, NULL, NULL, NULL, 10, 10, 0, 1, 864.54, 0, 10, 864.54, 9509.9, '2024-01-19 14:26:49', '2024-01-19 14:26:49'),
(39, 4, 22, NULL, NULL, NULL, 10, 10, 0, 1, 275, 0, 0, 0, 2750, '2024-01-19 14:26:49', '2024-01-19 14:26:49'),
(40, 4, 15, NULL, NULL, NULL, 10, 10, 0, 1, 499, 0, 0, 0, 4990, '2024-01-19 14:26:49', '2024-01-19 14:26:49'),
(41, 5, 23, NULL, NULL, NULL, 10, 10, 0, 1, 439, 0, 0, 0, 4390, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(42, 5, 27, NULL, NULL, NULL, 10, 10, 0, 1, 0.89, 0, 0, 0, 8.9, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(43, 5, 20, NULL, NULL, NULL, 10, 10, 0, 1, 399, 0, 0, 0, 3990, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(44, 5, 17, NULL, NULL, NULL, 10, 10, 0, 1, 349, 0, 0, 0, 3490, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(45, 5, 16, NULL, NULL, NULL, 10, 10, 0, 1, 79, 0, 0, 0, 790, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(46, 5, 30, NULL, NULL, NULL, 10, 10, 0, 1, 100, 0, 10, 100, 1100, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(47, 5, 19, NULL, NULL, NULL, 10, 10, 0, 1, 817.27, 0, 10, 817.27, 8990, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(48, 5, 3, NULL, NULL, NULL, 10, 10, 0, 1, 272.73, 0, 10, 272.73, 3000, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(49, 5, 7, NULL, NULL, NULL, 10, 10, 0, 1, 818.17, 0, 10, 818.17, 8999.9, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(50, 5, 2, NULL, NULL, NULL, 10, 10, 0, 1, 909.09, 0, 10, 909.09, 10000, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(51, 6, 6, NULL, NULL, NULL, 10, 10, 0, 1, 999.99, 0, 0, 0, 9999.9, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(52, 6, 13, NULL, NULL, NULL, 10, 10, 0, 1, 227.27, 0, 10, 227.27, 2500, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(53, 6, 10, NULL, NULL, NULL, 10, 10, 0, 1, 990, 0, 0, 0, 9900, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(54, 6, 21, NULL, NULL, NULL, 10, 10, 0, 1, 369, 0, 0, 0, 3690, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(55, 6, 8, NULL, NULL, NULL, 10, 10, 0, 1, 1090, 0, 10, 1090, 11990, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(56, 6, 12, NULL, NULL, NULL, 10, 10, 0, 1, 908.18, 0, 10, 908.18, 9990, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(57, 6, 29, NULL, NULL, NULL, 10, 10, 0, 1, 2.39, 0, 0, 0, 23.9, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(58, 6, 26, NULL, NULL, NULL, 10, 10, 0, 4, 2.99, 0, 0, 0, 29.9, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(59, 6, 9, NULL, NULL, NULL, 10, 10, 0, 1, 399, 0, 0, 0, 3990, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(60, 6, 11, NULL, NULL, NULL, 10, 10, 0, 1, 1363.64, 0, 10, 1363.64, 15000, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(61, 7, 17, NULL, NULL, NULL, 1, 1, 0, 1, 349, 0, 0, 0, 349, '2024-01-19 14:52:02', '2024-01-19 14:52:02'),
(62, 7, 20, NULL, NULL, NULL, 1, 1, 0, 1, 399, 0, 0, 0, 399, '2024-01-19 14:52:02', '2024-01-19 14:52:02'),
(64, 8, 7, NULL, NULL, NULL, 6, 6, 0, 1, 800, 0, 10, 480, 5280, '2024-06-20 05:08:26', '2024-06-20 05:08:26'),
(65, 9, 33, NULL, NULL, '1001,1002,1003,1004,1005', 5, 5, 0, 1, 100, 0, 0, 0, 500, '2024-07-18 07:41:45', '2024-07-18 07:41:45'),
(67, 10, 33, NULL, NULL, '2001,2002,2003,2004,2005', 5, 5, 0, 1, 100, 0, 0, 0, 500, '2024-07-18 07:51:35', '2024-07-18 07:51:35'),
(68, 11, 36, NULL, 8, NULL, 10, 10, 0, 1, 80, 0, 0, 0, 800, '2024-09-19 12:32:36', '2024-09-19 12:32:36'),
(69, 11, 36, NULL, 7, NULL, 10, 10, 0, 1, 80, 0, 0, 0, 800, '2024-09-19 12:32:36', '2024-09-19 12:32:36'),
(70, 11, 36, NULL, 6, NULL, 10, 10, 0, 1, 80, 0, 0, 0, 800, '2024-09-19 12:32:36', '2024-09-19 12:32:36'),
(71, 11, 36, NULL, 5, NULL, 10, 10, 0, 1, 80, 0, 0, 0, 800, '2024-09-19 12:32:36', '2024-09-19 12:32:36'),
(108, 15, 54, NULL, 141, NULL, 20, 20, 0, 1, 100, 0, 0, 0, 2000, '2025-01-23 15:06:45', '2025-01-23 15:06:45'),
(109, 15, 54, NULL, 140, NULL, 20, 20, 0, 1, 100, 0, 0, 0, 2000, '2025-01-23 15:06:45', '2025-01-23 15:06:45'),
(110, 15, 54, NULL, 139, NULL, 20, 20, 0, 1, 100, 0, 0, 0, 2000, '2025-01-23 15:06:45', '2025-01-23 15:06:45'),
(111, 16, 2, NULL, NULL, NULL, 10, 10, 0, 1, 909.09, 0, 10, 909.09, 10000, '2025-01-28 09:44:40', '2025-01-28 09:44:40'),
(112, 17, 55, NULL, NULL, NULL, 10, 10, 0, 1, 20, 0, 0, 0, 200, '2025-01-30 09:27:57', '2025-01-30 09:27:57'),
(113, 18, 55, NULL, NULL, NULL, 10, 10, 0, 1, 20, 0, 0, 0, 200, '2025-01-30 09:27:57', '2025-01-30 09:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_quotation`
--

CREATE TABLE `product_quotation` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_quotation`
--

INSERT INTO `product_quotation` (`id`, `quotation_id`, `product_id`, `product_batch_id`, `variant_id`, `qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 17, NULL, NULL, 1, 1, 499, 0, 0, 0, 499, '2024-01-19 14:51:32', '2024-01-19 14:51:32'),
(2, 1, 20, NULL, NULL, 1, 1, 499, 0, 0, 0, 499, '2024-01-19 14:51:32', '2024-01-19 14:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_returns`
--

CREATE TABLE `product_returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_returns`
--

INSERT INTO `product_returns` (`id`, `return_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, 1, 1, 1181.81, 0, 10, 118.18, 1299.99, '2024-03-24 07:08:23', '2024-03-24 07:08:23'),
(2, 2, 5, NULL, NULL, NULL, 1, 1, 1046.35, 0, 10, 104.64, 1150.99, '2024-04-29 12:30:38', '2024-04-29 12:30:38'),
(3, 2, 3, NULL, NULL, NULL, 1, 1, 318.18, 0, 10, 31.82, 350, '2024-04-29 12:30:38', '2024-04-29 12:30:38'),
(4, 3, 1, NULL, NULL, NULL, 1, 1, 1181.81, 0, 10, 118.18, 1299.99, '2024-06-26 07:01:42', '2024-06-26 07:01:42'),
(5, 4, 6, NULL, NULL, NULL, 1, 1, 1111.99, 0, 0, 0, 1111.99, '2025-01-28 09:53:22', '2025-01-28 09:53:22'),
(6, 4, 10, NULL, NULL, NULL, 1, 1, 1250, 0, 0, 0, 1250, '2025-01-28 09:53:22', '2025-01-28 09:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `product_sales`
--

CREATE TABLE `product_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `return_qty` double NOT NULL DEFAULT 0,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `is_packing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sales`
--

INSERT INTO `product_sales` (`id`, `sale_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `return_qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`, `is_delivered`, `is_packing`) VALUES
(1, 1, 14, NULL, NULL, NULL, 1, 0, 1, 453.64, 0, 10, 45.36, 499, '2024-01-19 14:40:16', '2024-01-19 14:40:16', NULL, NULL),
(2, 1, 2, NULL, NULL, NULL, 1, 0, 1, 1144.55, 0, 10, 114.45, 1259, '2024-01-19 14:40:16', '2024-01-19 14:40:16', NULL, NULL),
(3, 2, 16, NULL, NULL, NULL, 1, 0, 1, 109, 0, 0, 0, 109, '2024-01-19 14:44:41', '2024-01-19 14:44:41', NULL, NULL),
(4, 2, 18, NULL, NULL, NULL, 1, 0, 1, 544.55, 0, 10, 54.45, 599, '2024-01-19 14:44:41', '2024-01-19 14:44:41', NULL, NULL),
(5, 2, 9, NULL, NULL, NULL, 1, 0, 1, 559, 0, 0, 0, 559, '2024-01-19 14:44:41', '2024-01-19 14:44:41', NULL, NULL),
(6, 2, 4, NULL, NULL, NULL, 1, 0, 1, 954.55, 0, 10, 95.45, 1050, '2024-01-19 14:44:41', '2024-01-19 14:44:41', NULL, NULL),
(7, 2, 3, NULL, NULL, NULL, 2, 0, 1, 318.18, 0, 10, 63.64, 700, '2024-01-19 14:44:41', '2024-01-19 14:44:41', NULL, NULL),
(8, 3, 18, NULL, NULL, NULL, 1, 0, 1, 544.55, 0, 10, 54.45, 599, '2024-01-19 14:48:33', '2024-01-19 14:48:33', NULL, NULL),
(9, 3, 23, NULL, NULL, NULL, 1, 0, 1, 577, 0, 0, 0, 577, '2024-01-19 14:48:33', '2024-01-19 14:48:33', NULL, NULL),
(10, 3, 27, NULL, NULL, NULL, 3, 0, 1, 2, 0, 0, 0, 6, '2024-01-19 14:48:33', '2024-01-19 14:48:33', NULL, NULL),
(11, 4, 7, NULL, NULL, NULL, 1, 0, 1, 908.18, 0, 10, 90.82, 999, '2024-01-19 14:52:42', '2024-01-19 14:53:31', NULL, NULL),
(12, 4, 17, NULL, NULL, NULL, 1, 0, 1, 499, 0, 0, 0, 499, '2024-01-19 14:52:42', '2024-01-19 14:53:31', NULL, NULL),
(13, 4, 20, NULL, NULL, NULL, 1, 0, 1, 499, 0, 0, 0, 499, '2024-01-19 14:52:42', '2024-01-19 14:53:31', NULL, NULL),
(14, 5, 2, NULL, NULL, NULL, 1, 0, 1, 1144.55, 0, 10, 114.45, 1259, '2024-02-10 06:22:24', '2024-02-10 06:22:24', NULL, NULL),
(15, 6, 1, NULL, NULL, NULL, 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2024-02-25 07:49:51', '2024-02-25 07:49:51', NULL, NULL),
(16, 7, 1, NULL, NULL, NULL, 2, 0, 1, 1181.81, 0, 10, 236.36, 2599.98, '2024-02-25 07:50:13', '2024-02-25 07:50:13', NULL, NULL),
(17, 8, 2, NULL, NULL, NULL, 1, 0, 1, 1144.55, 0, 10, 114.45, 1259, '2024-02-28 05:27:44', '2024-02-28 05:27:44', NULL, NULL),
(18, 8, 1, NULL, NULL, NULL, 1, 1, 1, 1181.81, 0, 10, 118.18, 1299.99, '2024-02-28 05:27:44', '2024-03-24 07:08:23', NULL, NULL),
(19, 9, 3, NULL, NULL, NULL, 1, 0, 1, 318.18, 0, 10, 31.82, 350, '2024-04-21 05:01:43', '2024-04-21 05:01:43', NULL, NULL),
(25, 13, 3, NULL, NULL, NULL, 1, 0, 1, 318.18, 0, 10, 31.82, 350, '2024-04-28 06:15:44', '2024-04-28 06:15:44', NULL, NULL),
(26, 13, 19, NULL, NULL, NULL, 1, 0, 1, 962.73, 0, 10, 96.27, 1059, '2024-04-28 06:15:44', '2024-04-28 06:15:44', NULL, NULL),
(27, 14, 5, NULL, NULL, NULL, 1, 1, 1, 1046.35, 0, 10, 104.64, 1150.99, '2024-04-29 12:29:56', '2024-04-29 12:30:38', NULL, NULL),
(28, 14, 4, NULL, NULL, NULL, 1, 0, 1, 954.55, 0, 10, 95.45, 1050, '2024-04-29 12:29:56', '2024-04-29 12:29:56', NULL, NULL),
(29, 14, 3, NULL, NULL, NULL, 1, 1, 1, 318.18, 0, 10, 31.82, 350, '2024-04-29 12:29:56', '2024-04-29 12:30:38', NULL, NULL),
(30, 14, 2, NULL, NULL, NULL, 1, 0, 1, 1136.36, 0, 10, 113.64, 1250, '2024-04-29 12:29:56', '2024-04-29 12:29:56', NULL, NULL),
(31, 15, 20, NULL, NULL, NULL, 1, 0, 1, 499, 0, 0, 0, 499, '2024-05-05 05:19:02', '2024-05-05 05:19:02', NULL, NULL),
(37, 20, 2, NULL, NULL, NULL, 1, 0, 1, 1136.36, 0, 10, 113.64, 1250, '2024-05-05 11:29:05', '2024-05-05 11:29:05', NULL, NULL),
(38, 20, 1, NULL, NULL, NULL, 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2024-05-05 11:29:05', '2024-05-05 11:29:05', NULL, NULL),
(40, 22, 7, NULL, NULL, NULL, 1, 0, 1, 909.08, 0, 10, 90.91, 999.99, '2024-05-08 08:08:51', '2024-05-08 08:08:51', NULL, NULL),
(41, 22, 3, NULL, NULL, NULL, 1, 0, 1, 318.18, 0, 10, 31.82, 350, '2024-05-08 08:08:51', '2024-05-08 08:08:51', NULL, NULL),
(42, 23, 1, NULL, NULL, NULL, 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2024-05-19 08:24:23', '2024-05-19 08:24:23', NULL, NULL),
(43, 24, 8, NULL, NULL, NULL, 1, 0, 1, 1181.82, 0, 10, 118.18, 1300, '2024-05-19 08:25:30', '2024-05-19 08:25:30', NULL, NULL),
(44, 25, 8, NULL, NULL, NULL, 1, 0, 1, 1181.82, 0, 10, 118.18, 1300, '2024-05-19 08:30:55', '2024-05-19 08:30:55', NULL, NULL),
(49, 28, 4, NULL, NULL, NULL, 1, 0, 1, 954.55, 0, 10, 95.45, 1050, '2024-05-21 07:32:49', '2024-05-21 07:32:49', NULL, NULL),
(50, 29, 2, NULL, NULL, NULL, 1, 0, 1, 1136.36, 0, 10, 113.64, 1250, '2024-06-03 06:26:51', '2024-06-03 06:26:51', NULL, NULL),
(51, 29, 1, NULL, NULL, NULL, 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2024-06-03 06:26:51', '2024-06-03 06:26:51', NULL, NULL),
(52, 30, 4, NULL, NULL, NULL, 1, 0, 1, 954.55, 0, 10, 95.45, 1050, '2024-06-03 11:30:15', '2024-06-03 11:30:15', NULL, NULL),
(53, 30, 2, NULL, NULL, NULL, 1, 0, 1, 1136.36, 0, 10, 113.64, 1250, '2024-06-03 11:30:15', '2024-06-03 11:30:15', NULL, NULL),
(54, 31, 23, NULL, NULL, NULL, 1, 0, 1, 577, 0, 0, 0, 577, '2024-06-03 11:30:58', '2024-06-03 11:30:58', NULL, NULL),
(56, 33, 1, NULL, NULL, NULL, 1, 1, 1, 1181.81, 0, 10, 118.18, 1299.99, '2024-06-26 07:01:15', '2024-06-26 07:01:42', NULL, NULL),
(59, 36, 23, NULL, NULL, NULL, 1, 0, 1, 577, 0, 0, 0, 577, '2024-07-11 06:10:41', '2024-07-11 06:10:41', NULL, NULL),
(61, 38, 1, NULL, NULL, NULL, 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2024-07-18 05:36:30', '2024-07-18 05:36:30', NULL, NULL),
(62, 39, 33, NULL, NULL, '1003', 1, 0, 1, 250, 0, 0, 0, 250, '2024-07-18 07:59:13', '2024-07-18 07:59:13', NULL, NULL),
(63, 40, 33, NULL, NULL, '2001', 1, 0, 1, 250, 0, 0, 0, 250, '2024-07-18 08:01:45', '2024-07-18 08:01:45', NULL, NULL),
(65, 42, 23, NULL, NULL, NULL, 1, 0, 1, 577, 0, 0, 0, 577, '2024-08-11 05:06:29', '2024-08-11 05:28:06', 1, 1),
(66, 43, 18, NULL, NULL, NULL, 1, 0, 1, 544.55, 0, 10, 54.45, 599, '2024-08-11 05:37:22', '2024-08-11 05:37:38', NULL, 1),
(68, 45, 2, NULL, NULL, NULL, 1, 0, 1, 1136.36, 0, 10, 113.64, 1250, '2024-08-11 05:48:52', '2024-08-11 05:48:52', NULL, NULL),
(69, 45, 3, NULL, NULL, NULL, 1, 0, 1, 318.18, 0, 10, 31.82, 350, '2024-08-11 05:48:52', '2024-08-11 05:48:52', NULL, NULL),
(70, 46, 36, NULL, 6, NULL, 1, 0, 1, 100, 0, 0, 0, 100, '2024-09-19 12:35:56', '2024-09-19 12:35:56', NULL, NULL),
(71, 46, 36, NULL, 7, NULL, 2, 0, 1, 100, 0, 0, 0, 200, '2024-09-19 12:35:56', '2024-09-19 12:35:56', NULL, NULL),
(72, 46, 36, NULL, 8, NULL, 3, 0, 1, 100, 0, 0, 0, 300, '2024-09-19 12:35:56', '2024-09-19 12:35:56', NULL, NULL),
(73, 46, 36, NULL, 5, NULL, 4, 0, 1, 100, 0, 0, 0, 400, '2024-09-19 12:35:56', '2024-09-19 12:35:56', NULL, NULL),
(74, 47, 1, NULL, NULL, NULL, 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2024-09-19 12:38:33', '2024-09-19 12:38:33', NULL, NULL),
(75, 48, 34, NULL, 2, NULL, 1, 0, 1, 1200, 0, 0, 0, 1200, '2024-09-20 09:47:48', '2024-09-20 09:47:48', NULL, NULL),
(76, 48, 39, NULL, NULL, NULL, 1, 0, 1, 234, 0, 0, 0, 234, '2024-09-20 09:47:48', '2024-09-20 09:47:48', NULL, NULL),
(77, 49, 34, NULL, 2, NULL, 1, 0, 1, 1200, 0, 0, 0, 1200, '2024-09-20 10:00:17', '2024-09-20 10:00:17', NULL, NULL),
(78, 49, 39, NULL, NULL, NULL, 1, 0, 1, 234, 0, 0, 0, 234, '2024-09-20 10:00:17', '2024-09-20 10:00:17', NULL, NULL),
(79, 50, 34, NULL, 2, NULL, 1, 0, 1, 1200, 0, 0, 0, 1200, '2024-09-20 10:14:41', '2024-09-20 10:14:41', NULL, NULL),
(80, 50, 39, NULL, NULL, NULL, 1, 0, 1, 234, 0, 0, 0, 234, '2024-09-20 10:14:41', '2024-09-20 10:14:41', NULL, NULL),
(81, 51, 34, NULL, 2, NULL, 1, 0, 1, 1200, 0, 0, 0, 1200, '2024-09-20 10:15:18', '2024-09-20 10:15:18', NULL, NULL),
(82, 51, 39, NULL, NULL, NULL, 1, 0, 1, 234, 0, 0, 0, 234, '2024-09-20 10:15:18', '2024-09-20 10:15:18', NULL, NULL),
(83, 52, 34, NULL, 2, NULL, 3, 0, 1, 1200, 0, 0, 0, 3600, '2024-09-20 10:16:55', '2024-09-20 10:16:55', NULL, NULL),
(84, 53, 4, NULL, NULL, NULL, 2, 0, 1, 954.55, 0, 10, 190.91, 2100, '2024-09-20 10:17:51', '2024-09-20 10:17:51', NULL, NULL),
(85, 54, 34, NULL, 2, NULL, 1, 0, 1, 1200, 0, 0, 0, 1200, '2024-09-20 10:21:13', '2024-09-20 10:21:13', NULL, NULL),
(86, 54, 39, NULL, NULL, NULL, 1, 0, 1, 234, 0, 0, 0, 234, '2024-09-20 10:21:13', '2024-09-20 10:21:13', NULL, NULL),
(87, 55, 43, NULL, 17, NULL, 5, 0, 1, 10, 0, 0, 0, 50, '2024-09-20 11:27:50', '2024-09-20 11:27:50', NULL, NULL),
(88, 55, 43, NULL, 16, NULL, 5, 0, 1, 10, 0, 0, 0, 50, '2024-09-20 11:27:50', '2024-09-20 11:27:50', NULL, NULL),
(89, 55, 43, NULL, 15, NULL, 5, 0, 1, 10, 0, 0, 0, 50, '2024-09-20 11:27:50', '2024-09-20 11:27:50', NULL, NULL),
(90, 55, 43, NULL, 14, NULL, 5, 0, 1, 10, 0, 0, 0, 50, '2024-09-20 11:27:50', '2024-09-20 11:27:50', NULL, NULL),
(91, 55, 43, NULL, 13, NULL, 5, 0, 1, 10, 0, 0, 0, 50, '2024-09-20 11:27:50', '2024-09-20 11:27:50', NULL, NULL),
(92, 55, 43, NULL, 12, NULL, 5, 0, 1, 10, 0, 0, 0, 50, '2024-09-20 11:27:50', '2024-09-20 11:27:50', NULL, NULL),
(93, 55, 43, NULL, 11, NULL, 5, 0, 1, 10, 0, 0, 0, 50, '2024-09-20 11:27:50', '2024-09-20 11:27:50', NULL, NULL),
(94, 55, 43, NULL, 10, NULL, 5, 0, 1, 10, 0, 0, 0, 50, '2024-09-20 11:27:50', '2024-09-20 11:27:50', NULL, NULL),
(95, 55, 43, NULL, 9, NULL, 5, 0, 1, 10, 0, 0, 0, 50, '2024-09-20 11:27:50', '2024-09-20 11:27:50', NULL, NULL),
(96, 56, 34, NULL, 2, NULL, 1, 0, 1, 1200, 0, 0, 0, 1200, '2024-09-20 13:05:04', '2024-09-20 13:05:04', NULL, NULL),
(97, 56, 39, NULL, NULL, NULL, 1, 0, 1, 234, 0, 0, 0, 234, '2024-09-20 13:05:04', '2024-09-20 13:05:04', NULL, NULL),
(98, 57, 34, NULL, 2, NULL, 1, 0, 1, 1200, 0, 0, 0, 1200, '2024-09-20 13:27:45', '2024-09-20 13:27:45', NULL, NULL),
(99, 57, 39, NULL, NULL, NULL, 1, 0, 1, 234, 0, 0, 0, 234, '2024-09-20 13:27:45', '2024-09-20 13:27:45', NULL, NULL),
(100, 58, 34, NULL, 2, NULL, 1, 0, 1, 1200, 0, 0, 0, 1200, '2024-09-20 13:34:02', '2024-09-20 13:34:02', NULL, NULL),
(101, 58, 39, NULL, NULL, NULL, 1, 0, 1, 234, 0, 0, 0, 234, '2024-09-20 13:34:02', '2024-09-20 13:34:02', NULL, NULL),
(102, 59, 2, NULL, NULL, NULL, 2, 0, 1, 1136.36, 0, 10, 227.27, 2500, '2024-09-24 15:48:56', '2024-09-24 15:48:56', NULL, NULL),
(103, 60, 2, NULL, NULL, NULL, 1, 0, 1, 1136.36, 0, 10, 113.64, 1250, '2024-09-24 15:49:47', '2024-09-24 15:49:47', NULL, NULL),
(104, 60, 1, NULL, NULL, NULL, 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2024-09-24 15:49:47', '2024-09-24 15:49:47', NULL, NULL),
(105, 61, 1, NULL, NULL, 'null', 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2025-01-23 14:58:44', '2025-01-23 14:58:44', NULL, NULL),
(106, 62, 14, NULL, NULL, 'null', 1, 0, 1, 453.64, 0, 10, 45.36, 499, '2025-01-27 09:38:31', '2025-01-27 09:38:31', NULL, NULL),
(107, 63, 1, NULL, NULL, 'null', 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2025-01-27 12:38:23', '2025-01-27 12:38:23', NULL, NULL),
(108, 64, 1, NULL, NULL, 'null', 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2025-01-28 08:46:17', '2025-01-28 08:46:17', NULL, NULL),
(109, 65, 2, NULL, NULL, 'null', 1, 0, 1, 1136.36, 0, 10, 113.64, 1250, '2025-01-28 08:49:15', '2025-01-28 08:49:15', NULL, NULL),
(110, 66, 10, NULL, NULL, 'null', 1, 0, 1, 1250, 0, 0, 0, 1250, '2025-01-28 08:57:13', '2025-01-28 08:57:13', NULL, NULL),
(111, 67, 6, NULL, NULL, 'null', 1, 1, 1, 1111.99, 0, 0, 0, 1111.99, '2025-01-28 09:52:32', '2025-01-28 09:53:22', NULL, NULL),
(112, 67, 10, NULL, NULL, 'null', 1, 1, 1, 1250, 0, 0, 0, 1250, '2025-01-28 09:52:32', '2025-01-28 09:53:22', NULL, NULL),
(113, 68, 1, NULL, NULL, 'null', 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2025-01-29 14:13:08', '2025-01-29 14:13:08', NULL, NULL),
(114, 69, 1, NULL, NULL, 'null', 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2025-01-30 08:23:13', '2025-01-30 08:23:13', NULL, NULL),
(115, 70, 1, NULL, NULL, 'null', 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2025-01-30 08:26:24', '2025-01-30 08:26:24', NULL, NULL),
(116, 71, 1, NULL, NULL, 'null', 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2025-01-30 08:26:59', '2025-01-30 08:26:59', NULL, NULL),
(117, 72, 55, NULL, 0, NULL, 1, 0, 1, 25, 0, 0, 0, 25, '2025-01-30 09:28:42', '2025-01-30 09:28:42', NULL, NULL),
(118, 73, 55, NULL, NULL, 'null', 3, 0, 1, 25, 0, 0, 0, 75, '2025-01-30 09:31:23', '2025-01-30 09:31:23', NULL, NULL),
(119, 74, 16, NULL, NULL, 'null', 1, 0, 1, 109, 0, 0, 0, 109, '2025-01-30 09:38:22', '2025-01-30 09:38:22', NULL, NULL),
(120, 75, 7, NULL, NULL, 'null', 1, 0, 1, 909.08, 0, 10, 90.91, 999.99, '2025-01-30 09:39:36', '2025-01-30 09:39:36', NULL, NULL),
(121, 76, 6, NULL, NULL, 'null', 1, 0, 1, 1111.99, 0, 0, 0, 1111.99, '2025-01-30 09:51:37', '2025-01-30 09:51:37', NULL, NULL),
(122, 77, 1, NULL, NULL, 'null', 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2025-01-31 07:39:25', '2025-01-31 07:39:25', NULL, NULL),
(123, 77, 7, NULL, NULL, 'null', 1, 0, 1, 909.08, 0, 10, 90.91, 999.99, '2025-01-31 07:39:25', '2025-01-31 07:39:25', NULL, NULL),
(124, 78, 1, NULL, NULL, 'null,null', 2, 0, 1, 1181.81, 0, 10, 236.36, 2599.98, '2025-01-31 08:27:32', '2025-01-31 08:27:32', NULL, NULL),
(125, 79, 3, NULL, NULL, 'null', 1, 0, 1, 318.18, 0, 10, 31.82, 350, '2025-01-31 08:45:01', '2025-01-31 08:45:01', NULL, NULL),
(126, 79, 7, NULL, NULL, 'null', 1, 0, 1, 909.08, 0, 10, 90.91, 999.99, '2025-01-31 08:45:01', '2025-01-31 08:45:01', NULL, NULL),
(127, 80, 3, NULL, NULL, 'null', 1, 0, 1, 318.18, 0, 10, 31.82, 350, '2025-01-31 08:46:39', '2025-01-31 08:46:39', NULL, NULL),
(128, 81, 15, NULL, NULL, 'null', 1, 0, 1, 547, 0, 0, 0, 547, '2025-01-31 08:48:48', '2025-01-31 08:48:48', NULL, NULL),
(129, 82, 3, NULL, NULL, 'null', 1, 0, 1, 318.18, 0, 10, 31.82, 350, '2025-01-31 08:49:10', '2025-01-31 08:49:10', NULL, NULL),
(130, 83, 3, NULL, NULL, 'null', 1, 0, 1, 318.18, 0, 10, 31.82, 350, '2025-01-31 08:49:27', '2025-01-31 08:49:27', NULL, NULL),
(131, 84, 5, NULL, NULL, 'null', 1, 0, 1, 1046.35, 0, 10, 104.64, 1150.99, '2025-01-31 08:51:22', '2025-01-31 08:51:22', NULL, NULL),
(132, 85, 1, NULL, NULL, 'null', 1, 0, 1, 1181.81, 0, 10, 118.18, 1299.99, '2025-01-31 08:53:53', '2025-01-31 08:53:53', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_transfer`
--

CREATE TABLE `product_transfer` (
  `id` int(10) UNSIGNED NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_transfer`
--

INSERT INTO `product_transfer` (`id`, `transfer_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `purchase_unit_id`, `net_unit_cost`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(11, 11, 23, NULL, NULL, NULL, 1, 1, 439, 0, 0, 439, '2024-05-28 09:05:50', '2024-05-28 09:05:50'),
(12, 12, 20, NULL, NULL, NULL, 1, 1, 399, 0, 0, 399, '2024-05-28 09:07:14', '2024-05-28 09:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) NOT NULL,
  `additional_cost` double DEFAULT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `variant_id`, `position`, `item_code`, `additional_cost`, `additional_price`, `qty`, `created_at`, `updated_at`) VALUES
(1, 34, 1, 1, 'red/large-93030169', NULL, NULL, 0, '2024-09-19 12:00:57', '2025-01-24 10:11:03'),
(2, 34, 2, 2, 'meduim/large-93030169', NULL, NULL, -11, '2024-09-19 12:00:57', '2025-01-24 10:11:03'),
(3, 35, 3, 1, 'green-63164322', NULL, NULL, 0, '2024-09-19 12:11:11', '2024-09-19 12:11:11'),
(4, 35, 4, 2, 'blue-63164322', NULL, NULL, 0, '2024-09-19 12:11:11', '2024-09-19 12:11:11'),
(5, 36, 5, 1, 'M/Red-90857211', NULL, NULL, 6, '2024-09-19 12:31:00', '2024-09-19 12:35:56'),
(6, 36, 6, 2, 'M/Blue-90857211', NULL, NULL, 9, '2024-09-19 12:31:00', '2024-09-19 12:35:56'),
(7, 36, 7, 3, 'L/Red-90857211', NULL, NULL, 8, '2024-09-19 12:31:00', '2024-09-19 12:35:56'),
(8, 36, 8, 4, 'L/Blue-90857211', NULL, NULL, 7, '2024-09-19 12:31:00', '2024-09-19 12:35:56'),
(9, 37, 9, 1, 'Small/White-39101927', NULL, NULL, 0, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(10, 37, 10, 2, 'Small/Black-39101927', NULL, NULL, 0, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(11, 37, 11, 3, 'Small/Green-39101927', NULL, NULL, 0, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(12, 37, 12, 4, 'Medium/White-39101927', NULL, NULL, 0, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(13, 37, 13, 5, 'Medium/Black-39101927', NULL, NULL, 0, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(14, 37, 14, 6, 'Medium/Green-39101927', NULL, NULL, 0, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(15, 37, 15, 7, 'Large/White-39101927', NULL, NULL, 0, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(16, 37, 16, 8, 'Large/Black-39101927', NULL, NULL, 0, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(17, 37, 17, 9, 'Large/Green-39101927', NULL, NULL, 0, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(18, 38, 9, 1, 'Small/White-46408793', NULL, NULL, 0, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(19, 38, 10, 2, 'Small/Black-46408793', NULL, NULL, 0, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(20, 38, 11, 3, 'Small/Green-46408793', NULL, NULL, 0, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(21, 38, 12, 4, 'Medium/White-46408793', NULL, NULL, 0, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(22, 38, 13, 5, 'Medium/Black-46408793', NULL, NULL, 0, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(23, 38, 14, 6, 'Medium/Green-46408793', NULL, NULL, 0, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(24, 38, 15, 7, 'Large/White-46408793', NULL, NULL, 0, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(25, 38, 16, 8, 'Large/Black-46408793', NULL, NULL, 0, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(26, 38, 17, 9, 'Large/Green-46408793', NULL, NULL, 0, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(27, 41, 18, 1, 'red/M-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(28, 41, 19, 2, 'red/L-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(29, 41, 20, 3, 'red/S-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(30, 41, 21, 4, 'blue/M-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(31, 41, 22, 5, 'blue/L-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(32, 41, 23, 6, 'blue/S-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(33, 41, 18, 7, 'red/M-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(34, 41, 19, 8, 'red/L-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(35, 41, 20, 9, 'red/S-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(36, 41, 21, 10, 'blue/M-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(37, 41, 22, 11, 'blue/L-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(38, 41, 23, 12, 'blue/S-09732522', NULL, NULL, 0, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(39, 42, 9, 1, 'small/white-13990714', NULL, NULL, 0, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(40, 42, 10, 2, 'small/black-13990715', NULL, NULL, 0, '2024-09-20 11:04:54', '2024-09-20 11:39:54'),
(41, 42, 11, 3, 'small/green-13990716', NULL, NULL, 0, '2024-09-20 11:04:54', '2024-09-20 11:39:54'),
(42, 42, 12, 4, 'medium/white-13990717', NULL, NULL, 0, '2024-09-20 11:04:54', '2024-09-20 11:39:54'),
(43, 42, 13, 5, 'medium/black-13990718', NULL, NULL, 0, '2024-09-20 11:04:54', '2024-09-20 11:39:54'),
(44, 42, 14, 6, 'medium/green-13990719', NULL, NULL, 0, '2024-09-20 11:04:54', '2024-09-20 11:39:54'),
(45, 42, 15, 7, 'large/white-13990720', NULL, NULL, 0, '2024-09-20 11:04:54', '2024-09-20 11:39:54'),
(46, 42, 16, 8, 'large/black-13990721', NULL, NULL, 0, '2024-09-20 11:04:54', '2024-09-20 11:39:54'),
(47, 42, 17, 9, 'large/green-13990722', NULL, NULL, 0, '2024-09-20 11:04:54', '2024-09-20 11:39:54'),
(48, 43, 9, 1, 'small/white-91983805', NULL, NULL, -5, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(49, 43, 10, 2, 'small/black-91983805', NULL, NULL, -5, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(50, 43, 11, 3, 'small/green-91983805', NULL, NULL, -5, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(51, 43, 12, 4, 'medium/white-91983805', NULL, NULL, -5, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(52, 43, 13, 5, 'medium/black-91983805', NULL, NULL, -5, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(53, 43, 14, 6, 'medium/green-91983805', NULL, NULL, -5, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(54, 43, 15, 7, 'large/white-91983805', NULL, NULL, -5, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(55, 43, 16, 8, 'large/black-91983805', NULL, NULL, -5, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(56, 43, 17, 9, 'large/green-91983805', NULL, NULL, -5, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(57, 43, 9, 10, 'small/white-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(58, 43, 10, 11, 'small/black-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(59, 43, 11, 12, 'small/green-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(60, 43, 12, 13, 'medium/white-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(61, 43, 13, 14, 'medium/black-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(62, 43, 14, 15, 'medium/green-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(63, 43, 15, 16, 'large/white-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(64, 43, 16, 17, 'large/black-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(65, 43, 17, 18, 'large/green-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(66, 43, 9, 19, 'small/white-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(67, 43, 10, 20, 'small/black-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(68, 43, 11, 21, 'small/green-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(69, 43, 12, 22, 'medium/white-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(70, 43, 13, 23, 'medium/black-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(71, 43, 14, 24, 'medium/green-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(72, 43, 15, 25, 'large/white-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(73, 43, 16, 26, 'large/black-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(74, 43, 17, 27, 'large/green-91983805', NULL, NULL, 0, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(75, 44, 24, 1, 'black-10983943', NULL, NULL, 0, '2024-09-20 12:40:11', '2024-09-20 12:40:11'),
(76, 44, 25, 2, 'white-10983943', NULL, NULL, 0, '2024-09-20 12:40:11', '2024-09-20 12:40:11'),
(77, 45, 26, 1, 'red-03041523', NULL, NULL, 0, '2024-09-24 15:30:30', '2024-09-24 15:30:30'),
(105, 46, 27, 1, 'small/black//green//-35101582', NULL, NULL, 0, '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(106, 46, 28, 2, 'small/white//green//-35101582', NULL, NULL, 0, '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(107, 46, 29, 3, 'small/green//green//-35101582', NULL, NULL, 0, '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(108, 46, 30, 4, 'medium/black//green//-35101582', NULL, NULL, 0, '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(109, 46, 31, 5, 'medium/white//green//-35101582', NULL, NULL, 0, '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(110, 46, 32, 6, 'medium/green//green//-35101582', NULL, NULL, 0, '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(111, 46, 33, 7, 'large/black//green//-35101582', NULL, NULL, 0, '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(112, 46, 34, 8, 'large/white//green//-35101582', NULL, NULL, 0, '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(113, 46, 35, 9, 'large/green//green//-35101582', NULL, NULL, 0, '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(114, 47, 36, 1, 'S/Black-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(115, 47, 37, 2, 'S/White-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(116, 47, 38, 3, 'S/Green-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(117, 47, 39, 4, 'M/Black-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(118, 47, 40, 5, 'M/White-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(119, 47, 41, 6, 'M/Green-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(120, 47, 42, 7, 'L/Black-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(121, 47, 43, 8, 'L/White-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(122, 47, 44, 9, 'L/Green-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(123, 47, 36, 10, 'S/Black-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(124, 47, 37, 11, 'S/White-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(125, 47, 38, 12, 'S/Green-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(126, 47, 39, 13, 'M/Black-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(127, 47, 40, 14, 'M/White-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(128, 47, 41, 15, 'M/Green-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(129, 47, 42, 16, 'L/Black-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(130, 47, 43, 17, 'L/White-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(131, 47, 44, 18, 'L/Green-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(132, 47, 36, 19, 'S/Black-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(133, 47, 37, 20, 'S/White-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(134, 47, 38, 21, 'S/Green-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(135, 47, 39, 22, 'M/Black-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(136, 47, 40, 23, 'M/White-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(137, 47, 41, 24, 'M/Green-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(138, 47, 42, 25, 'L/Black-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(139, 47, 43, 26, 'L/White-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(140, 47, 44, 27, 'L/Green-19273003', NULL, NULL, 0, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(141, 48, 43, 1, 'l/white-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(142, 48, 42, 2, 'l/black-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(143, 48, 44, 3, 'l/green-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(144, 48, 40, 4, 'm/white-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(145, 48, 39, 5, 'm/black-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(146, 48, 41, 6, 'm/green-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(147, 48, 37, 7, 's/white-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(148, 48, 36, 8, 's/black-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(149, 48, 38, 9, 's/green-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(150, 48, 43, 10, 'l/white-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(151, 48, 42, 11, 'l/black-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(152, 48, 44, 12, 'l/green-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(153, 48, 40, 13, 'm/white-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(154, 48, 39, 14, 'm/black-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(155, 48, 41, 15, 'm/green-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(156, 48, 37, 16, 's/white-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(157, 48, 36, 17, 's/black-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(158, 48, 38, 18, 's/green-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(159, 48, 43, 19, 'l/white-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(160, 48, 42, 20, 'l/black-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(161, 48, 44, 21, 'l/green-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(162, 48, 40, 22, 'm/white-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(163, 48, 39, 23, 'm/black-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(164, 48, 41, 24, 'm/green-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(165, 48, 37, 25, 's/white-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(166, 48, 36, 26, 's/black-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(167, 48, 38, 27, 's/green-', NULL, NULL, 0, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(186, 50, 16, 1, 'large/black-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(187, 50, 15, 2, 'large/white-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(188, 50, 17, 3, 'large/green-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(189, 50, 13, 4, 'medium/black-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(190, 50, 12, 5, 'medium/white-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(191, 50, 14, 6, 'medium/green-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(192, 50, 10, 7, 'small/black-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(193, 50, 9, 8, 'small/white-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(194, 50, 11, 9, 'small/green-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(195, 50, 16, 10, 'large/black-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(196, 50, 15, 11, 'large/white-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(197, 50, 17, 12, 'large/green-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(198, 50, 13, 13, 'medium/black-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(199, 50, 12, 14, 'medium/white-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(200, 50, 14, 15, 'medium/green-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(201, 50, 10, 16, 'small/black-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(202, 50, 9, 17, 'small/white-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(203, 50, 11, 18, 'small/green-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(204, 50, 16, 19, 'large/black-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(205, 50, 15, 20, 'large/white-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(206, 50, 17, 21, 'large/green-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(207, 50, 13, 22, 'medium/black-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(208, 50, 12, 23, 'medium/white-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(209, 50, 14, 24, 'medium/green-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(210, 50, 10, 25, 'small/black-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(211, 50, 9, 26, 'small/white-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(212, 50, 11, 27, 'small/green-29310144', NULL, NULL, 0, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(213, 49, 54, 1, '1/r/1/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(214, 49, 55, 2, '1/r/1/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(215, 49, 56, 3, '1/r/1/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(216, 49, 57, 4, '1/r/2/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(217, 49, 58, 5, '1/r/2/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(218, 49, 59, 6, '1/r/2/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(219, 49, 60, 7, '1/r/3/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(220, 49, 61, 8, '1/r/3/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(221, 49, 62, 9, '1/r/3/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(222, 49, 63, 10, '1/b/1/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(223, 49, 64, 11, '1/b/1/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(224, 49, 65, 12, '1/b/1/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(225, 49, 66, 13, '1/b/2/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(226, 49, 67, 14, '1/b/2/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(227, 49, 68, 15, '1/b/2/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(228, 49, 69, 16, '1/b/3/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(229, 49, 70, 17, '1/b/3/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(230, 49, 71, 18, '1/b/3/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(231, 49, 72, 19, '1/w/1/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(232, 49, 73, 20, '1/w/1/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(233, 49, 74, 21, '1/w/1/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(234, 49, 75, 22, '1/w/2/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(235, 49, 76, 23, '1/w/2/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(236, 49, 77, 24, '1/w/2/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(237, 49, 78, 25, '1/w/3/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(238, 49, 79, 26, '1/w/3/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(239, 49, 80, 27, '1/w/3/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(240, 49, 81, 28, '2/r/1/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(241, 49, 82, 29, '2/r/1/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(242, 49, 83, 30, '2/r/1/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(243, 49, 84, 31, '2/r/2/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(244, 49, 85, 32, '2/r/2/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(245, 49, 86, 33, '2/r/2/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(246, 49, 87, 34, '2/r/3/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(247, 49, 88, 35, '2/r/3/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(248, 49, 89, 36, '2/r/3/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(249, 49, 90, 37, '2/b/1/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(250, 49, 91, 38, '2/b/1/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(251, 49, 92, 39, '2/b/1/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(252, 49, 93, 40, '2/b/2/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(253, 49, 94, 41, '2/b/2/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(254, 49, 95, 42, '2/b/2/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(255, 49, 96, 43, '2/b/3/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(256, 49, 97, 44, '2/b/3/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(257, 49, 98, 45, '2/b/3/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(258, 49, 99, 46, '2/w/1/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(259, 49, 100, 47, '2/w/1/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(260, 49, 101, 48, '2/w/1/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(261, 49, 102, 49, '2/w/2/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(262, 49, 103, 50, '2/w/2/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(263, 49, 104, 51, '2/w/2/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(264, 49, 105, 52, '2/w/3/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(265, 49, 106, 53, '2/w/3/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(266, 49, 107, 54, '2/w/3/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(267, 49, 108, 55, '3/r/1/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(268, 49, 109, 56, '3/r/1/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(269, 49, 110, 57, '3/r/1/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(270, 49, 111, 58, '3/r/2/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(271, 49, 112, 59, '3/r/2/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(272, 49, 113, 60, '3/r/2/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(273, 49, 114, 61, '3/r/3/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(274, 49, 115, 62, '3/r/3/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(275, 49, 116, 63, '3/r/3/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(276, 49, 117, 64, '3/b/1/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(277, 49, 118, 65, '3/b/1/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(278, 49, 119, 66, '3/b/1/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(279, 49, 120, 67, '3/b/2/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(280, 49, 121, 68, '3/b/2/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(281, 49, 122, 69, '3/b/2/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(282, 49, 123, 70, '3/b/3/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(283, 49, 124, 71, '3/b/3/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(284, 49, 125, 72, '3/b/3/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(285, 49, 126, 73, '3/w/1/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(286, 49, 127, 74, '3/w/1/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(287, 49, 128, 75, '3/w/1/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(288, 49, 129, 76, '3/w/2/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(289, 49, 130, 77, '3/w/2/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(290, 49, 131, 78, '3/w/2/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(291, 49, 132, 79, '3/w/3/r-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(292, 49, 133, 80, '3/w/3/b-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(293, 49, 134, 81, '3/w/3/w-43226111', NULL, NULL, 0, '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(294, 51, 43, 1, 'L/White-30225478', NULL, NULL, 0, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(295, 51, 7, 2, 'L/Red-30225478', NULL, NULL, 0, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(296, 51, 135, 3, 'L/Orange-30225478', NULL, NULL, 0, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(297, 51, 40, 4, 'M/White-30225478', NULL, NULL, 0, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(298, 51, 5, 5, 'M/Red-30225478', NULL, NULL, 0, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(299, 51, 136, 6, 'M/Orange-30225478', NULL, NULL, 0, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(300, 51, 37, 7, 'S/White-30225478', NULL, NULL, 0, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(301, 51, 137, 8, 'S/Red-30225478', NULL, NULL, 0, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(302, 51, 138, 9, 'S/Orange-30225478', NULL, NULL, 0, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(303, 52, 10, 1, 'small/black-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(304, 52, 9, 2, 'small/white-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(305, 52, 11, 3, 'small/green-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(306, 52, 13, 4, 'medium/black-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(307, 52, 12, 5, 'medium/white-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(308, 52, 14, 6, 'medium/green-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(309, 52, 16, 7, 'large/black-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(310, 52, 15, 8, 'large/white-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(311, 52, 17, 9, 'large/green-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(312, 52, 10, 10, 'small/black-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(313, 52, 9, 11, 'small/white-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(314, 52, 11, 12, 'small/green-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(315, 52, 13, 13, 'medium/black-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(316, 52, 12, 14, 'medium/white-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(317, 52, 14, 15, 'medium/green-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(318, 52, 16, 16, 'large/black-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(319, 52, 15, 17, 'large/white-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(320, 52, 17, 18, 'large/green-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(321, 52, 10, 19, 'small/black-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(322, 52, 9, 20, 'small/white-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(323, 52, 11, 21, 'small/green-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(324, 52, 13, 22, 'medium/black-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(325, 52, 12, 23, 'medium/white-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(326, 52, 14, 24, 'medium/green-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(327, 52, 16, 25, 'large/black-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(328, 52, 15, 26, 'large/white-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(329, 52, 17, 27, 'large/green-24682930', NULL, NULL, 0, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(330, 53, 42, 1, 'L/Black-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(331, 53, 44, 2, 'L/Green-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(332, 53, 43, 3, 'L/white-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(333, 53, 39, 4, 'M/Black-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(334, 53, 41, 5, 'M/Green-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(335, 53, 40, 6, 'M/white-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(336, 53, 36, 7, 'S/Black-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(337, 53, 38, 8, 'S/Green-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(338, 53, 37, 9, 'S/white-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(339, 53, 42, 10, 'L/Black-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(340, 53, 44, 11, 'L/Green-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(341, 53, 43, 12, 'L/white-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(342, 53, 39, 13, 'M/Black-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(343, 53, 41, 14, 'M/Green-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(344, 53, 40, 15, 'M/white-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(345, 53, 36, 16, 'S/Black-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(346, 53, 38, 17, 'S/Green-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(347, 53, 37, 18, 'S/white-94264831', NULL, NULL, 0, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(348, 54, 139, 1, 'red/64-21208959', NULL, NULL, 20, '2025-01-20 12:49:54', '2025-01-23 15:06:45'),
(349, 54, 140, 2, 'red/128-21208959', NULL, 10, 20, '2025-01-20 12:49:54', '2025-01-23 15:06:45'),
(350, 54, 141, 3, 'red/256-21208959', NULL, 20, 20, '2025-01-20 12:49:54', '2025-01-23 15:06:45'),
(351, 54, 142, 4, 'white/64-21208959', NULL, NULL, 0, '2025-01-20 12:49:54', '2025-01-20 12:49:54'),
(352, 54, 143, 5, 'white/128-21208959', NULL, 10, 0, '2025-01-20 12:49:54', '2025-01-20 13:04:28'),
(353, 54, 144, 6, 'white/256-21208959', NULL, 20, 0, '2025-01-20 12:49:54', '2025-01-20 13:04:28'),
(354, 54, 145, 7, 'green/64-21208959', NULL, NULL, 0, '2025-01-20 12:49:54', '2025-01-20 12:49:54'),
(355, 54, 146, 8, 'green/128-21208959', NULL, 10, 0, '2025-01-20 12:49:54', '2025-01-20 13:04:28'),
(356, 54, 147, 9, 'green/256-21208959', NULL, 20, 0, '2025-01-20 12:49:54', '2025-01-20 13:04:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` varchar(191) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_warehouse`
--

INSERT INTO `product_warehouse` (`id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `warehouse_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(1, '23', NULL, NULL, NULL, 1, 6, 577, '2024-01-19 13:46:04', '2024-08-11 05:25:42'),
(2, '27', NULL, NULL, NULL, 1, 10, 1.29, '2024-01-19 13:46:04', '2024-07-11 06:12:35'),
(3, '20', NULL, NULL, NULL, 1, 8, NULL, '2024-01-19 13:46:04', '2025-01-27 11:37:15'),
(4, '17', NULL, NULL, NULL, 1, 10, 499, '2024-01-19 13:46:04', '2024-04-28 06:05:43'),
(5, '16', NULL, NULL, NULL, 1, 9, 109, '2024-01-19 13:46:04', '2025-01-30 09:38:22'),
(6, '30', NULL, NULL, NULL, 1, 10, 200, '2024-01-19 13:46:04', '2024-01-19 13:46:04'),
(7, '19', NULL, NULL, NULL, 1, 9, 1059, '2024-01-19 13:46:04', '2024-05-28 08:46:50'),
(8, '3', NULL, NULL, NULL, 1, 2, 350, '2024-01-19 13:46:05', '2025-01-31 08:49:27'),
(9, '7', NULL, NULL, NULL, 1, 11, NULL, '2024-01-19 13:46:05', '2025-01-31 08:45:01'),
(10, '2', NULL, NULL, NULL, 1, 8, NULL, '2024-01-19 13:46:05', '2025-01-28 09:44:40'),
(11, '6', NULL, NULL, NULL, 1, 9, 1111.99, '2024-01-19 13:50:04', '2025-01-30 09:51:37'),
(12, '13', NULL, NULL, NULL, 1, 10, 349, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(13, '10', NULL, NULL, NULL, 1, 9, 1250, '2024-01-19 13:50:04', '2025-01-28 09:53:22'),
(14, '21', NULL, NULL, NULL, 1, 10, 599, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(15, '8', NULL, NULL, NULL, 1, 8, 1300, '2024-01-19 13:50:04', '2024-05-19 08:30:55'),
(16, '12', NULL, NULL, NULL, 1, 10, 1250, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(17, '29', NULL, NULL, NULL, 1, 10, 3.19, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(18, '26', NULL, NULL, NULL, 1, 10, 3.99, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(19, '9', NULL, NULL, NULL, 1, 10, 559, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(20, '11', NULL, NULL, NULL, 1, 10, 1750, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(21, '1', NULL, NULL, NULL, 1, -10, 1299.99, '2024-01-19 13:53:21', '2025-01-31 08:53:53'),
(22, '18', NULL, NULL, NULL, 1, 10, 599, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(23, '25', NULL, NULL, NULL, 1, 10, 157.99, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(24, '28', NULL, NULL, NULL, 1, 10, 3.3, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(25, '14', NULL, NULL, NULL, 1, 8, 499, '2024-01-19 13:53:21', '2025-01-27 09:38:31'),
(26, '24', NULL, NULL, NULL, 1, 10, 379, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(27, '4', NULL, NULL, NULL, 1, 5, NULL, '2024-01-19 13:53:21', '2024-09-20 12:37:37'),
(28, '5', NULL, NULL, NULL, 1, 9, 1150.99, '2024-01-19 13:53:21', '2025-01-31 08:51:22'),
(29, '22', NULL, NULL, NULL, 1, 10, 399, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(30, '15', NULL, NULL, NULL, 1, 9, 547, '2024-01-19 13:53:21', '2025-01-31 08:48:48'),
(31, '1', NULL, NULL, NULL, 2, 11, 1299.99, '2024-01-19 14:26:48', '2024-01-19 14:26:48'),
(32, '18', NULL, NULL, NULL, 2, 7, 599, '2024-01-19 14:26:48', '2024-08-11 05:37:38'),
(33, '25', NULL, NULL, NULL, 2, 10, 157.99, '2024-01-19 14:26:48', '2024-01-19 14:26:48'),
(34, '28', NULL, NULL, NULL, 2, 10, 3.3, '2024-01-19 14:26:48', '2024-01-19 14:26:48'),
(35, '14', NULL, NULL, NULL, 2, 10, 499, '2024-01-19 14:26:49', '2024-01-19 14:26:49'),
(36, '24', NULL, NULL, NULL, 2, 10, 379, '2024-01-19 14:26:49', '2024-01-19 14:26:49'),
(37, '4', NULL, NULL, NULL, 2, 9, NULL, '2024-01-19 14:26:49', '2024-09-20 12:37:37'),
(38, '5', NULL, NULL, NULL, 2, 10, 1150.99, '2024-01-19 14:26:49', '2024-01-19 14:26:49'),
(39, '22', NULL, NULL, NULL, 2, 10, 399, '2024-01-19 14:26:49', '2024-01-19 14:26:49'),
(40, '15', NULL, NULL, NULL, 2, 10, 547, '2024-01-19 14:26:49', '2024-01-19 14:26:49'),
(41, '23', NULL, NULL, NULL, 2, 10, 577, '2024-01-19 14:28:26', '2024-05-28 09:05:50'),
(42, '27', NULL, NULL, NULL, 2, 7, 1.29, '2024-01-19 14:28:26', '2024-01-19 14:48:33'),
(43, '20', NULL, NULL, NULL, 2, 11, NULL, '2024-01-19 14:28:26', '2025-01-27 11:37:15'),
(44, '17', NULL, NULL, NULL, 2, 10, 499, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(45, '16', NULL, NULL, NULL, 2, 9, 109, '2024-01-19 14:28:26', '2024-01-19 14:44:41'),
(46, '30', NULL, NULL, NULL, 2, 10, 200, '2024-01-19 14:28:26', '2024-01-19 14:28:26'),
(47, '19', NULL, NULL, NULL, 2, 10, 1059, '2024-01-19 14:28:26', '2024-05-28 08:46:50'),
(48, '3', NULL, NULL, NULL, 2, 8, 350, '2024-01-19 14:28:26', '2024-01-19 14:44:41'),
(49, '7', NULL, NULL, NULL, 2, 10, NULL, '2024-01-19 14:28:26', '2024-05-23 07:38:12'),
(50, '2', NULL, NULL, NULL, 2, 10, NULL, '2024-01-19 14:28:26', '2024-03-07 07:13:42'),
(51, '6', NULL, NULL, NULL, 2, 10, 1111.99, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(52, '13', NULL, NULL, NULL, 2, 10, 349, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(53, '10', NULL, NULL, NULL, 2, 10, 1250, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(54, '21', NULL, NULL, NULL, 2, 10, 599, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(55, '8', NULL, NULL, NULL, 2, 10, 1300, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(56, '12', NULL, NULL, NULL, 2, 10, 1250, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(57, '29', NULL, NULL, NULL, 2, 10, 3.19, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(58, '26', NULL, NULL, NULL, 2, 10, 3.99, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(59, '9', NULL, NULL, NULL, 2, 9, 559, '2024-01-19 14:28:35', '2024-01-19 14:44:41'),
(60, '11', NULL, NULL, NULL, 2, 10, 1750, '2024-01-19 14:28:35', '2024-01-19 14:28:35'),
(61, '32', NULL, NULL, NULL, 1, 0, NULL, '2024-04-29 12:29:17', '2024-04-29 12:29:17'),
(62, '32', NULL, NULL, NULL, 2, 0, NULL, '2024-04-29 12:29:17', '2024-04-29 12:29:17'),
(63, '33', NULL, NULL, '1001,1002,1004,1005', 1, 4, NULL, '2024-07-18 07:39:33', '2024-07-18 07:59:13'),
(64, '33', NULL, NULL, '2002,2003,2004,2005,', 2, 4, NULL, '2024-07-18 07:39:33', '2024-07-18 08:01:45'),
(65, '34', NULL, 1, NULL, 1, 0, NULL, '2024-09-19 12:00:57', '2024-09-19 12:00:57'),
(66, '34', NULL, 2, NULL, 1, -11, NULL, '2024-09-19 12:00:57', '2024-09-20 13:34:02'),
(67, '34', NULL, 1, NULL, 2, 0, NULL, '2024-09-19 12:00:57', '2024-09-19 12:00:57'),
(68, '34', NULL, 2, NULL, 2, 0, NULL, '2024-09-19 12:00:57', '2024-09-19 12:00:57'),
(69, '35', NULL, 3, NULL, 1, 0, NULL, '2024-09-19 12:11:11', '2024-09-19 12:11:11'),
(70, '35', NULL, 4, NULL, 1, 0, NULL, '2024-09-19 12:11:11', '2024-09-19 12:11:11'),
(71, '35', NULL, 3, NULL, 2, 0, NULL, '2024-09-19 12:11:11', '2024-09-19 12:11:11'),
(72, '35', NULL, 4, NULL, 2, 0, NULL, '2024-09-19 12:11:11', '2024-09-19 12:11:11'),
(73, '36', NULL, 5, NULL, 1, 6, NULL, '2024-09-19 12:31:00', '2024-09-19 12:35:56'),
(74, '36', NULL, 6, NULL, 1, 9, NULL, '2024-09-19 12:31:00', '2024-09-19 12:35:56'),
(75, '36', NULL, 7, NULL, 1, 8, NULL, '2024-09-19 12:31:00', '2024-09-19 12:35:56'),
(76, '36', NULL, 8, NULL, 1, 7, NULL, '2024-09-19 12:31:00', '2024-09-19 12:35:56'),
(77, '36', NULL, 5, NULL, 2, 0, NULL, '2024-09-19 12:31:00', '2024-09-19 12:31:00'),
(78, '36', NULL, 6, NULL, 2, 0, NULL, '2024-09-19 12:31:00', '2024-09-19 12:31:00'),
(79, '36', NULL, 7, NULL, 2, 0, NULL, '2024-09-19 12:31:00', '2024-09-19 12:31:00'),
(80, '36', NULL, 8, NULL, 2, 0, NULL, '2024-09-19 12:31:00', '2024-09-19 12:31:00'),
(81, '37', NULL, 9, NULL, 1, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(82, '37', NULL, 10, NULL, 1, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(83, '37', NULL, 11, NULL, 1, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(84, '37', NULL, 12, NULL, 1, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(85, '37', NULL, 13, NULL, 1, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(86, '37', NULL, 14, NULL, 1, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(87, '37', NULL, 15, NULL, 1, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(88, '37', NULL, 16, NULL, 1, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(89, '37', NULL, 17, NULL, 1, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(90, '37', NULL, 9, NULL, 2, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(91, '37', NULL, 10, NULL, 2, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(92, '37', NULL, 11, NULL, 2, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(93, '37', NULL, 12, NULL, 2, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(94, '37', NULL, 13, NULL, 2, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(95, '37', NULL, 14, NULL, 2, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(96, '37', NULL, 15, NULL, 2, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(97, '37', NULL, 16, NULL, 2, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(98, '37', NULL, 17, NULL, 2, 0, NULL, '2024-09-19 13:47:33', '2024-09-19 13:47:33'),
(99, '38', NULL, 9, NULL, 1, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(100, '38', NULL, 10, NULL, 1, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(101, '38', NULL, 11, NULL, 1, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(102, '38', NULL, 12, NULL, 1, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(103, '38', NULL, 13, NULL, 1, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(104, '38', NULL, 14, NULL, 1, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(105, '38', NULL, 15, NULL, 1, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(106, '38', NULL, 16, NULL, 1, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(107, '38', NULL, 17, NULL, 1, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(108, '38', NULL, 9, NULL, 2, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(109, '38', NULL, 10, NULL, 2, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(110, '38', NULL, 11, NULL, 2, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(111, '38', NULL, 12, NULL, 2, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(112, '38', NULL, 13, NULL, 2, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(113, '38', NULL, 14, NULL, 2, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(114, '38', NULL, 15, NULL, 2, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(115, '38', NULL, 16, NULL, 2, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(116, '38', NULL, 17, NULL, 2, 0, NULL, '2024-09-19 13:49:08', '2024-09-19 13:49:08'),
(117, '39', NULL, NULL, NULL, 1, -8, NULL, '2024-09-19 16:36:29', '2024-09-20 13:34:02'),
(118, '39', NULL, NULL, NULL, 2, 0, NULL, '2024-09-19 16:36:29', '2024-09-19 16:36:29'),
(119, '40', NULL, NULL, NULL, 1, 0, NULL, '2024-09-20 10:06:16', '2024-09-20 10:06:16'),
(120, '40', NULL, NULL, NULL, 2, 0, NULL, '2024-09-20 10:06:16', '2024-09-20 10:06:16'),
(121, '41', NULL, 18, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(122, '41', NULL, 19, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(123, '41', NULL, 20, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(124, '41', NULL, 21, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(125, '41', NULL, 22, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(126, '41', NULL, 23, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(127, '41', NULL, 18, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(128, '41', NULL, 19, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(129, '41', NULL, 20, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(130, '41', NULL, 21, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(131, '41', NULL, 22, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(132, '41', NULL, 23, NULL, 1, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(133, '41', NULL, 18, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(134, '41', NULL, 19, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(135, '41', NULL, 20, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(136, '41', NULL, 21, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(137, '41', NULL, 22, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(138, '41', NULL, 23, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(139, '41', NULL, 18, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(140, '41', NULL, 19, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(141, '41', NULL, 20, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(142, '41', NULL, 21, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(143, '41', NULL, 22, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(144, '41', NULL, 23, NULL, 2, 0, NULL, '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(145, '42', NULL, 9, NULL, 1, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(146, '42', NULL, 10, NULL, 1, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(147, '42', NULL, 11, NULL, 1, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(148, '42', NULL, 12, NULL, 1, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(149, '42', NULL, 13, NULL, 1, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(150, '42', NULL, 14, NULL, 1, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(151, '42', NULL, 15, NULL, 1, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(152, '42', NULL, 16, NULL, 1, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(153, '42', NULL, 17, NULL, 1, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(154, '42', NULL, 9, NULL, 2, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(155, '42', NULL, 10, NULL, 2, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(156, '42', NULL, 11, NULL, 2, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(157, '42', NULL, 12, NULL, 2, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(158, '42', NULL, 13, NULL, 2, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(159, '42', NULL, 14, NULL, 2, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(160, '42', NULL, 15, NULL, 2, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(161, '42', NULL, 16, NULL, 2, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(162, '42', NULL, 17, NULL, 2, 0, NULL, '2024-09-20 11:04:54', '2024-09-20 11:04:54'),
(163, '43', NULL, 9, NULL, 1, -5, NULL, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(164, '43', NULL, 10, NULL, 1, -5, NULL, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(165, '43', NULL, 11, NULL, 1, -5, NULL, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(166, '43', NULL, 12, NULL, 1, -5, NULL, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(167, '43', NULL, 13, NULL, 1, -5, NULL, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(168, '43', NULL, 14, NULL, 1, -5, NULL, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(169, '43', NULL, 15, NULL, 1, -5, NULL, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(170, '43', NULL, 16, NULL, 1, -5, NULL, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(171, '43', NULL, 17, NULL, 1, -5, NULL, '2024-09-20 11:15:53', '2024-09-20 11:27:50'),
(172, '43', NULL, 9, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(173, '43', NULL, 10, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(174, '43', NULL, 11, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(175, '43', NULL, 12, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(176, '43', NULL, 13, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(177, '43', NULL, 14, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(178, '43', NULL, 15, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(179, '43', NULL, 16, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(180, '43', NULL, 17, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(181, '43', NULL, 9, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(182, '43', NULL, 10, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(183, '43', NULL, 11, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(184, '43', NULL, 12, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(185, '43', NULL, 13, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(186, '43', NULL, 14, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(187, '43', NULL, 15, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(188, '43', NULL, 16, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(189, '43', NULL, 17, NULL, 1, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(190, '43', NULL, 9, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(191, '43', NULL, 10, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(192, '43', NULL, 11, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(193, '43', NULL, 12, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(194, '43', NULL, 13, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(195, '43', NULL, 14, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(196, '43', NULL, 15, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(197, '43', NULL, 16, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(198, '43', NULL, 17, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(199, '43', NULL, 9, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(200, '43', NULL, 10, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(201, '43', NULL, 11, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(202, '43', NULL, 12, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(203, '43', NULL, 13, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(204, '43', NULL, 14, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(205, '43', NULL, 15, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(206, '43', NULL, 16, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(207, '43', NULL, 17, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(208, '43', NULL, 9, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(209, '43', NULL, 10, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(210, '43', NULL, 11, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(211, '43', NULL, 12, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(212, '43', NULL, 13, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(213, '43', NULL, 14, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(214, '43', NULL, 15, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(215, '43', NULL, 16, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(216, '43', NULL, 17, NULL, 2, 0, NULL, '2024-09-20 11:15:53', '2024-09-20 11:15:53'),
(217, '44', NULL, 24, NULL, 1, 0, NULL, '2024-09-20 12:40:11', '2024-09-20 12:40:11'),
(218, '44', NULL, 25, NULL, 1, 0, NULL, '2024-09-20 12:40:11', '2024-09-20 12:40:11'),
(219, '44', NULL, 24, NULL, 2, 0, NULL, '2024-09-20 12:40:11', '2024-09-20 12:40:11'),
(220, '44', NULL, 25, NULL, 2, 0, NULL, '2024-09-20 12:40:11', '2024-09-20 12:40:11'),
(221, '45', NULL, 26, NULL, 1, 0, NULL, '2024-09-24 15:30:30', '2024-09-24 15:30:30'),
(222, '45', NULL, 26, NULL, 2, 0, NULL, '2024-09-24 15:30:30', '2024-09-24 15:30:30'),
(223, '46', NULL, 10, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(224, '46', NULL, 9, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(225, '46', NULL, 11, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(226, '46', NULL, 13, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(227, '46', NULL, 12, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(228, '46', NULL, 14, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(229, '46', NULL, 16, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(230, '46', NULL, 15, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(231, '46', NULL, 17, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(232, '46', NULL, 10, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(233, '46', NULL, 9, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(234, '46', NULL, 11, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(235, '46', NULL, 13, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(236, '46', NULL, 12, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(237, '46', NULL, 14, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(238, '46', NULL, 16, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(239, '46', NULL, 15, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(240, '46', NULL, 17, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(241, '46', NULL, 10, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(242, '46', NULL, 9, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(243, '46', NULL, 11, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(244, '46', NULL, 13, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(245, '46', NULL, 12, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(246, '46', NULL, 14, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(247, '46', NULL, 16, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(248, '46', NULL, 15, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(249, '46', NULL, 17, NULL, 1, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(250, '46', NULL, 10, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(251, '46', NULL, 9, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(252, '46', NULL, 11, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(253, '46', NULL, 13, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(254, '46', NULL, 12, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(255, '46', NULL, 14, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(256, '46', NULL, 16, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(257, '46', NULL, 15, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(258, '46', NULL, 17, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(259, '46', NULL, 10, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(260, '46', NULL, 9, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(261, '46', NULL, 11, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(262, '46', NULL, 13, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(263, '46', NULL, 12, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(264, '46', NULL, 14, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(265, '46', NULL, 16, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(266, '46', NULL, 15, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(267, '46', NULL, 17, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(268, '46', NULL, 10, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(269, '46', NULL, 9, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(270, '46', NULL, 11, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(271, '46', NULL, 13, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(272, '46', NULL, 12, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(273, '46', NULL, 14, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(274, '46', NULL, 16, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(275, '46', NULL, 15, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(276, '46', NULL, 17, NULL, 2, 0, NULL, '2024-09-25 12:55:43', '2024-09-25 12:55:43'),
(277, '47', NULL, 36, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(278, '47', NULL, 37, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(279, '47', NULL, 38, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(280, '47', NULL, 39, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(281, '47', NULL, 40, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(282, '47', NULL, 41, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(283, '47', NULL, 42, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(284, '47', NULL, 43, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(285, '47', NULL, 44, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(286, '47', NULL, 36, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(287, '47', NULL, 37, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(288, '47', NULL, 38, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(289, '47', NULL, 39, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(290, '47', NULL, 40, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(291, '47', NULL, 41, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(292, '47', NULL, 42, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(293, '47', NULL, 43, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(294, '47', NULL, 44, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(295, '47', NULL, 36, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(296, '47', NULL, 37, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(297, '47', NULL, 38, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(298, '47', NULL, 39, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(299, '47', NULL, 40, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(300, '47', NULL, 41, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(301, '47', NULL, 42, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(302, '47', NULL, 43, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(303, '47', NULL, 44, NULL, 1, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(304, '47', NULL, 36, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(305, '47', NULL, 37, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(306, '47', NULL, 38, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(307, '47', NULL, 39, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(308, '47', NULL, 40, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(309, '47', NULL, 41, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(310, '47', NULL, 42, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(311, '47', NULL, 43, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(312, '47', NULL, 44, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(313, '47', NULL, 36, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(314, '47', NULL, 37, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(315, '47', NULL, 38, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(316, '47', NULL, 39, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(317, '47', NULL, 40, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(318, '47', NULL, 41, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(319, '47', NULL, 42, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(320, '47', NULL, 43, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(321, '47', NULL, 44, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(322, '47', NULL, 36, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(323, '47', NULL, 37, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(324, '47', NULL, 38, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(325, '47', NULL, 39, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(326, '47', NULL, 40, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(327, '47', NULL, 41, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(328, '47', NULL, 42, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(329, '47', NULL, 43, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(330, '47', NULL, 44, NULL, 2, 0, NULL, '2024-09-25 13:05:42', '2024-09-25 13:05:42'),
(331, '48', NULL, 43, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(332, '48', NULL, 42, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(333, '48', NULL, 44, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(334, '48', NULL, 40, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(335, '48', NULL, 39, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(336, '48', NULL, 41, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(337, '48', NULL, 37, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(338, '48', NULL, 36, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(339, '48', NULL, 38, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(340, '48', NULL, 43, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(341, '48', NULL, 42, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(342, '48', NULL, 44, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(343, '48', NULL, 40, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(344, '48', NULL, 39, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(345, '48', NULL, 41, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(346, '48', NULL, 37, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(347, '48', NULL, 36, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(348, '48', NULL, 38, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(349, '48', NULL, 43, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(350, '48', NULL, 42, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(351, '48', NULL, 44, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(352, '48', NULL, 40, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(353, '48', NULL, 39, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(354, '48', NULL, 41, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(355, '48', NULL, 37, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(356, '48', NULL, 36, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(357, '48', NULL, 38, NULL, 1, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(358, '48', NULL, 43, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(359, '48', NULL, 42, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(360, '48', NULL, 44, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(361, '48', NULL, 40, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(362, '48', NULL, 39, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(363, '48', NULL, 41, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(364, '48', NULL, 37, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(365, '48', NULL, 36, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(366, '48', NULL, 38, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(367, '48', NULL, 43, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(368, '48', NULL, 42, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(369, '48', NULL, 44, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(370, '48', NULL, 40, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(371, '48', NULL, 39, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(372, '48', NULL, 41, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(373, '48', NULL, 37, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(374, '48', NULL, 36, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(375, '48', NULL, 38, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(376, '48', NULL, 43, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(377, '48', NULL, 42, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(378, '48', NULL, 44, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(379, '48', NULL, 40, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(380, '48', NULL, 39, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(381, '48', NULL, 41, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(382, '48', NULL, 37, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(383, '48', NULL, 36, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(384, '48', NULL, 38, NULL, 2, 0, NULL, '2024-09-25 13:10:57', '2024-09-25 13:10:57'),
(385, '49', NULL, 45, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(386, '49', NULL, 46, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(387, '49', NULL, 47, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(388, '49', NULL, 48, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(389, '49', NULL, 49, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(390, '49', NULL, 50, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(391, '49', NULL, 51, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(392, '49', NULL, 52, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(393, '49', NULL, 53, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(394, '49', NULL, 45, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(395, '49', NULL, 46, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(396, '49', NULL, 47, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(397, '49', NULL, 48, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(398, '49', NULL, 49, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(399, '49', NULL, 50, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(400, '49', NULL, 51, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(401, '49', NULL, 52, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(402, '49', NULL, 53, NULL, 1, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(403, '49', NULL, 45, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(404, '49', NULL, 46, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(405, '49', NULL, 47, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(406, '49', NULL, 48, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(407, '49', NULL, 49, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(408, '49', NULL, 50, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(409, '49', NULL, 51, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(410, '49', NULL, 52, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(411, '49', NULL, 53, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(412, '49', NULL, 45, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(413, '49', NULL, 46, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(414, '49', NULL, 47, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(415, '49', NULL, 48, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(416, '49', NULL, 49, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(417, '49', NULL, 50, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(418, '49', NULL, 51, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(419, '49', NULL, 52, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(420, '49', NULL, 53, NULL, 2, 0, NULL, '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(421, '50', NULL, 16, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(422, '50', NULL, 15, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(423, '50', NULL, 17, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(424, '50', NULL, 13, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(425, '50', NULL, 12, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(426, '50', NULL, 14, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(427, '50', NULL, 10, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(428, '50', NULL, 9, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(429, '50', NULL, 11, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(430, '50', NULL, 16, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(431, '50', NULL, 15, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(432, '50', NULL, 17, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(433, '50', NULL, 13, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(434, '50', NULL, 12, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(435, '50', NULL, 14, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(436, '50', NULL, 10, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(437, '50', NULL, 9, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(438, '50', NULL, 11, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(439, '50', NULL, 16, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(440, '50', NULL, 15, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(441, '50', NULL, 17, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(442, '50', NULL, 13, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(443, '50', NULL, 12, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(444, '50', NULL, 14, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(445, '50', NULL, 10, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(446, '50', NULL, 9, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(447, '50', NULL, 11, NULL, 1, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(448, '50', NULL, 16, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(449, '50', NULL, 15, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(450, '50', NULL, 17, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(451, '50', NULL, 13, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(452, '50', NULL, 12, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(453, '50', NULL, 14, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(454, '50', NULL, 10, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(455, '50', NULL, 9, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(456, '50', NULL, 11, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(457, '50', NULL, 16, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(458, '50', NULL, 15, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(459, '50', NULL, 17, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(460, '50', NULL, 13, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(461, '50', NULL, 12, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(462, '50', NULL, 14, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(463, '50', NULL, 10, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(464, '50', NULL, 9, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(465, '50', NULL, 11, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(466, '50', NULL, 16, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(467, '50', NULL, 15, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(468, '50', NULL, 17, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(469, '50', NULL, 13, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(470, '50', NULL, 12, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(471, '50', NULL, 14, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(472, '50', NULL, 10, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(473, '50', NULL, 9, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(474, '50', NULL, 11, NULL, 2, 0, NULL, '2024-09-27 11:50:43', '2024-09-27 11:50:43'),
(475, '51', NULL, 43, NULL, 1, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(476, '51', NULL, 7, NULL, 1, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(477, '51', NULL, 135, NULL, 1, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(478, '51', NULL, 40, NULL, 1, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(479, '51', NULL, 5, NULL, 1, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(480, '51', NULL, 136, NULL, 1, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(481, '51', NULL, 37, NULL, 1, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(482, '51', NULL, 137, NULL, 1, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(483, '51', NULL, 138, NULL, 1, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(484, '51', NULL, 43, NULL, 2, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(485, '51', NULL, 7, NULL, 2, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(486, '51', NULL, 135, NULL, 2, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(487, '51', NULL, 40, NULL, 2, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(488, '51', NULL, 5, NULL, 2, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(489, '51', NULL, 136, NULL, 2, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(490, '51', NULL, 37, NULL, 2, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(491, '51', NULL, 137, NULL, 2, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(492, '51', NULL, 138, NULL, 2, 0, NULL, '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(493, '52', NULL, 10, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(494, '52', NULL, 9, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(495, '52', NULL, 11, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(496, '52', NULL, 13, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(497, '52', NULL, 12, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(498, '52', NULL, 14, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(499, '52', NULL, 16, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(500, '52', NULL, 15, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(501, '52', NULL, 17, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(502, '52', NULL, 10, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(503, '52', NULL, 9, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(504, '52', NULL, 11, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(505, '52', NULL, 13, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(506, '52', NULL, 12, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(507, '52', NULL, 14, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(508, '52', NULL, 16, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(509, '52', NULL, 15, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(510, '52', NULL, 17, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(511, '52', NULL, 10, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(512, '52', NULL, 9, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(513, '52', NULL, 11, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(514, '52', NULL, 13, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(515, '52', NULL, 12, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(516, '52', NULL, 14, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(517, '52', NULL, 16, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(518, '52', NULL, 15, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(519, '52', NULL, 17, NULL, 1, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(520, '52', NULL, 10, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(521, '52', NULL, 9, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(522, '52', NULL, 11, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(523, '52', NULL, 13, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(524, '52', NULL, 12, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(525, '52', NULL, 14, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(526, '52', NULL, 16, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(527, '52', NULL, 15, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(528, '52', NULL, 17, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(529, '52', NULL, 10, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(530, '52', NULL, 9, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(531, '52', NULL, 11, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(532, '52', NULL, 13, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(533, '52', NULL, 12, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(534, '52', NULL, 14, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(535, '52', NULL, 16, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(536, '52', NULL, 15, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(537, '52', NULL, 17, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(538, '52', NULL, 10, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(539, '52', NULL, 9, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(540, '52', NULL, 11, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(541, '52', NULL, 13, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(542, '52', NULL, 12, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(543, '52', NULL, 14, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(544, '52', NULL, 16, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(545, '52', NULL, 15, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(546, '52', NULL, 17, NULL, 2, 0, NULL, '2024-09-30 11:29:58', '2024-09-30 11:29:58'),
(547, '53', NULL, 42, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(548, '53', NULL, 44, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(549, '53', NULL, 43, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(550, '53', NULL, 39, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(551, '53', NULL, 41, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(552, '53', NULL, 40, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(553, '53', NULL, 36, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(554, '53', NULL, 38, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(555, '53', NULL, 37, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(556, '53', NULL, 42, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(557, '53', NULL, 44, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(558, '53', NULL, 43, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(559, '53', NULL, 39, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(560, '53', NULL, 41, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(561, '53', NULL, 40, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(562, '53', NULL, 36, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(563, '53', NULL, 38, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(564, '53', NULL, 37, NULL, 1, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(565, '53', NULL, 42, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(566, '53', NULL, 44, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(567, '53', NULL, 43, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(568, '53', NULL, 39, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(569, '53', NULL, 41, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(570, '53', NULL, 40, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(571, '53', NULL, 36, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(572, '53', NULL, 38, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(573, '53', NULL, 37, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(574, '53', NULL, 42, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(575, '53', NULL, 44, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(576, '53', NULL, 43, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(577, '53', NULL, 39, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(578, '53', NULL, 41, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(579, '53', NULL, 40, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(580, '53', NULL, 36, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(581, '53', NULL, 38, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(582, '53', NULL, 37, NULL, 2, 0, NULL, '2024-09-30 11:34:19', '2024-09-30 11:34:19'),
(583, '54', NULL, 141, NULL, 1, 20, 150, '2025-01-23 15:06:45', '2025-01-23 15:06:45'),
(584, '54', NULL, 140, NULL, 1, 20, 150, '2025-01-23 15:06:45', '2025-01-23 15:06:45'),
(585, '54', NULL, 139, NULL, 1, 20, 150, '2025-01-23 15:06:45', '2025-01-23 15:06:45');
INSERT INTO `product_warehouse` (`id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `warehouse_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(586, '55', NULL, NULL, NULL, 1, 7, NULL, '2025-01-30 09:27:57', '2025-01-30 09:31:23'),
(587, '55', NULL, NULL, NULL, 2, 10, NULL, '2025-01-30 09:27:57', '2025-01-30 09:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `user_id`, `warehouse_id`, `supplier_id`, `currency_id`, `exchange_rate`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `paid_amount`, `status`, `payment_status`, `document`, `note`, `created_at`, `updated_at`) VALUES
(1, 'pr-20240119-074604', 1, 1, 1, 1, 1, 10, 100, 0, 2917.26, 44758.8, 0, 0, 0, 0, 44758.8, 0, 1, 1, NULL, NULL, '2024-01-19 13:46:04', '2024-01-19 13:46:04'),
(2, 'pr-20240119-075004', 1, 1, 1, 1, 1, 10, 100, 0, 3589.09, 67113.7, 0, 0, 0, 0, 67113.7, 0, 1, 1, NULL, NULL, '2024-01-19 13:50:04', '2024-01-19 13:50:04'),
(3, 'pr-20240119-075321', 1, 1, NULL, 1, 1, 10, 100, 0, 3689.98, 49653.7, 0, 0, 0, 0, 49653.7, 0, 1, 1, NULL, NULL, '2024-01-19 13:53:21', '2024-01-19 13:53:21'),
(4, 'pr-20240119-082648', 1, 2, 1, NULL, NULL, 10, 101, 0, 3789.98, 50753.69, 0, 0, 0, 0, 50753.69, 0, 1, 1, NULL, NULL, '2024-01-18 18:00:00', '2024-01-19 14:26:48'),
(5, 'pr-20240119-082826', 1, 2, 1, NULL, NULL, 10, 100, 0, 2917.26, 44758.8, 0, 0, 0, 0, 44758.8, 0, 1, 1, NULL, NULL, '2024-01-18 18:00:00', '2024-01-19 14:28:26'),
(6, 'pr-20240119-082835', 1, 2, 1, NULL, NULL, 10, 100, 0, 3589.09, 67113.7, 0, 0, 0, 0, 67113.7, 0, 1, 1, NULL, NULL, '2024-01-18 18:00:00', '2024-01-19 14:28:35'),
(7, 'pr-20240119-085202', 1, 1, 1, NULL, NULL, 2, 2, 0, 0, 748, 0, 0, 0, 0, 748, 0, 1, 1, NULL, NULL, '2024-01-19 14:52:02', '2024-01-19 14:52:02'),
(8, 'pr-20240204-011347', 1, 1, NULL, 1, 1, 1, 6, 0, 480, 5280, 0, 0, 0, 0, 5280, 0, 1, 1, NULL, NULL, '2024-02-03 18:00:00', '2024-06-20 05:08:26'),
(9, 'pr-20240718-014145', 1, 1, 1, 1, 1, 1, 5, 0, 0, 500, 0, 0, 0, 0, 500, 0, 1, 1, NULL, NULL, '2024-07-18 07:41:45', '2024-07-18 07:41:45'),
(10, 'pr-20240718-014928', 1, 2, 2, NULL, NULL, 1, 5, 0, 0, 500, 0, 0, 0, 0, 500, 0, 1, 1, NULL, NULL, '2024-07-17 18:00:00', '2024-07-18 07:51:35'),
(11, 'pr-20240919-023236', 1, 1, 1, 1, 1, 4, 40, 0, 0, 3200, 0, 0, 0, 0, 3200, 0, 1, 1, NULL, NULL, '2024-09-18 22:00:00', '2024-09-19 12:32:36'),
(15, 'pr-20250123-040645', 1, 1, 2, 1, 1, 3, 60, 0, 0, 6000, 0, 0, 0, 0, 6000, 0, 1, 1, NULL, NULL, '2025-01-22 23:00:00', '2025-01-23 15:06:45'),
(16, '1111', 1, 1, 1, 1, 1, 1, 10, 0, 909.09, 10000, 0, 0, 0, 0, 10000, 10000, 1, 2, NULL, NULL, '2025-01-27 23:00:00', '2025-01-28 09:45:05'),
(17, 'pr-20250130-102757', 1, 1, NULL, NULL, NULL, 1, 10, 0, 0, 200, NULL, 0, NULL, NULL, 200, 200, 1, 2, NULL, NULL, '2025-01-30 09:27:57', '2025-01-30 09:27:57'),
(18, 'pr-20250130-102757', 1, 2, NULL, NULL, NULL, 1, 10, 0, 0, 200, NULL, 0, NULL, NULL, 200, 200, 1, 2, NULL, NULL, '2025-01-30 09:27:57', '2025-01-30 09:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_product_return`
--

CREATE TABLE `purchase_product_return` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `reference_no`, `user_id`, `biller_id`, `supplier_id`, `customer_id`, `warehouse_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `quotation_status`, `document`, `note`, `created_at`, `updated_at`) VALUES
(1, 'qr-20240119-085132', 1, 1, 1, 1, 1, 2, 2, 0, 0, 998, 0, 0, NULL, NULL, 998, 1, NULL, NULL, '2024-01-19 14:51:32', '2024-01-19 14:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`id`, `reference_no`, `user_id`, `sale_id`, `cash_register_id`, `customer_id`, `warehouse_id`, `biller_id`, `account_id`, `currency_id`, `exchange_rate`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `order_tax_rate`, `order_tax`, `grand_total`, `document`, `return_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(1, 'rr-20240324-010823', 1, 8, 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 118.18, 1299.99, 0, 0, 1299.99, NULL, NULL, NULL, '2024-03-24 07:08:23', '2024-03-24 07:08:23'),
(2, 'rr-20240429-063038', 1, 14, 2, 2, 1, 1, 1, 1, 1, 2, 2, 0, 136.46, 1500.99, 0, 0, 1500.99, NULL, NULL, NULL, '2024-04-29 12:30:38', '2024-04-29 12:30:38'),
(3, 'rr-20240626-010142', 1, 33, 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 118.18, 1299.99, 0, 0, 1299.99, NULL, NULL, NULL, '2024-06-26 07:01:42', '2024-06-26 07:01:42'),
(4, 'rr-20250128-105322', 1, 67, 2, 2, 1, 1, 1, 1, 1, 2, 2, 0, 0, 2361.99, 0, 0, 2361.99, NULL, NULL, NULL, '2025-01-28 09:53:22', '2025-01-28 09:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `return_purchases`
--

CREATE TABLE `return_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_point_settings`
--

CREATE TABLE `reward_point_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reward_point_settings`
--

INSERT INTO `reward_point_settings` (`id`, `per_point_amount`, `minimum_amount`, `duration`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 300, 1000, 1, 'Year', 1, '2021-06-08 15:40:15', '2021-06-27 05:20:55');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `guard_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `guard_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin can access all data...', 'web', 1, '2018-06-01 23:46:44', '2018-06-02 23:13:05'),
(2, 'Owner', 'Staff of shop', 'web', 1, '2018-10-22 02:38:13', '2022-02-01 13:13:30'),
(4, 'staff', 'staff has specific acess...', 'web', 1, '2018-06-02 00:05:27', '2022-02-01 13:13:04'),
(5, 'Customer', NULL, 'web', 1, '2020-11-05 06:43:16', '2020-11-15 00:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(4, 1),
(4, 2),
(4, 4),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(6, 4),
(7, 1),
(7, 2),
(7, 4),
(8, 1),
(8, 2),
(8, 4),
(9, 1),
(9, 2),
(9, 4),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(12, 4),
(13, 1),
(13, 2),
(13, 4),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(20, 2),
(20, 4),
(21, 1),
(21, 2),
(21, 4),
(22, 1),
(22, 2),
(22, 4),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(24, 4),
(25, 1),
(25, 2),
(25, 4),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(28, 4),
(29, 1),
(29, 2),
(29, 4),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(55, 4),
(56, 1),
(56, 2),
(56, 4),
(57, 1),
(57, 2),
(57, 4),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(63, 4),
(64, 1),
(64, 2),
(64, 4),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 4),
(90, 1),
(90, 2),
(91, 1),
(91, 2),
(92, 1),
(92, 2),
(93, 1),
(93, 2),
(94, 1),
(94, 2),
(95, 1),
(95, 2),
(96, 1),
(96, 2),
(97, 1),
(97, 2),
(98, 1),
(98, 2),
(99, 1),
(99, 2),
(100, 1),
(100, 2),
(101, 1),
(101, 2),
(102, 1),
(102, 2),
(103, 1),
(103, 2),
(104, 1),
(104, 2),
(105, 1),
(105, 2),
(106, 1),
(106, 2),
(106, 4),
(107, 1),
(107, 2),
(108, 1),
(108, 2),
(109, 1),
(109, 2),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(113, 2),
(114, 1),
(114, 2),
(115, 1),
(115, 2),
(116, 1),
(116, 2),
(117, 1),
(117, 2),
(118, 1),
(118, 2),
(119, 1),
(119, 2),
(120, 1),
(120, 2),
(121, 1),
(122, 1),
(122, 2),
(123, 1),
(123, 2),
(124, 1),
(125, 1),
(125, 2),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `queue` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount_type` varchar(191) DEFAULT NULL,
  `order_discount_value` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  `billing_phone` varchar(255) DEFAULT NULL,
  `billing_email` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `billing_city` varchar(255) DEFAULT NULL,
  `billing_state` varchar(255) DEFAULT NULL,
  `billing_country` varchar(255) DEFAULT NULL,
  `billing_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) DEFAULT NULL,
  `shipping_phone` varchar(255) DEFAULT NULL,
  `shipping_email` varchar(255) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `shipping_city` varchar(255) DEFAULT NULL,
  `shipping_state` varchar(255) DEFAULT NULL,
  `shipping_country` varchar(255) DEFAULT NULL,
  `shipping_zip` varchar(255) DEFAULT NULL,
  `sale_type` varchar(255) DEFAULT 'pos',
  `payment_mode` varchar(255) DEFAULT NULL,
  `sale_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `reference_no`, `user_id`, `cash_register_id`, `table_id`, `queue`, `customer_id`, `warehouse_id`, `biller_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `grand_total`, `currency_id`, `exchange_rate`, `order_tax_rate`, `order_tax`, `order_discount_type`, `order_discount_value`, `order_discount`, `coupon_id`, `coupon_discount`, `shipping_cost`, `sale_status`, `payment_status`, `document`, `paid_amount`, `billing_name`, `billing_phone`, `billing_email`, `billing_address`, `billing_city`, `billing_state`, `billing_country`, `billing_zip`, `shipping_name`, `shipping_phone`, `shipping_email`, `shipping_address`, `shipping_city`, `shipping_state`, `shipping_country`, `shipping_zip`, `sale_type`, `payment_mode`, `sale_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(1, 'posr-20240119-084016', 1, NULL, NULL, NULL, 1, 1, 1, 2, 2, 0, 159.81, 1758, 1758, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1758, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-19 14:40:16', '2024-01-19 14:40:16'),
(2, 'posr-20240119-084441', 1, NULL, NULL, NULL, 1, 2, 1, 5, 6, 0, 213.54, 3017, 3017, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 3017, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-19 14:44:41', '2024-01-19 14:44:41'),
(3, 'sr-20240119-084833', 1, 1, NULL, NULL, 2, 2, 1, 3, 5, 0, 54.45, 1182, 1182, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-19 14:48:33', '2024-01-19 14:48:33'),
(4, 'sr-20240119-085242', 1, 2, NULL, NULL, 1, 1, 1, 3, 3, 0, 90.82, 1997, 1997, NULL, NULL, 0, 0, 'Flat', 0, 0, NULL, NULL, 0, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-18 18:00:00', '2024-01-19 14:53:31'),
(5, 'posr-20240210-122224', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 114.45, 1259, 1259, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1259, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-10 06:22:24', '2024-02-10 06:22:24'),
(6, 'posr-20240225-014951', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1299.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-25 07:49:51', '2024-02-25 07:49:51'),
(7, 'posr-20240225-015013', 1, 2, NULL, NULL, 2, 1, 1, 1, 2, 0, 236.36, 2599.98, 2599.98, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 2599.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-25 07:50:13', '2024-02-25 07:50:13'),
(8, 'posr-20240228-112744', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 232.63, 2558.99, 2558.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 2558.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-28 05:27:44', '2024-02-28 05:27:44'),
(9, 'posr-20240421-110143', 1, 2, 1, 1, 2, 1, 1, 1, 1, 0, 31.82, 350, 350, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 350, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-21 05:01:43', '2024-04-21 05:01:43'),
(13, 'posr-20240428-121544', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 128.09, 1409, 1409, 1, 1, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1409, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-28 06:15:44', '2024-04-28 06:15:44'),
(14, 'posr-20240429-062956', 1, 2, NULL, NULL, 2, 1, 1, 4, 4, 0, 345.55, 3800.99, 3800.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 3800.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-29 12:29:56', '2024-04-29 12:29:56'),
(15, 'sr-20240505-111902', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 0, 499, 499, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-05 05:19:02', '2024-05-05 05:20:14'),
(20, 'posr-20240505-052905', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 231.82, 2549.99, 2549.99, 1, 1, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 1, 4, NULL, 2549.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-05 11:29:05', '2024-05-05 11:29:05'),
(22, 'posr-20240508-020851', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 122.73, 1349.99, 1349.99, 1, 1, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1349.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-08 08:08:51', '2024-05-08 08:08:51'),
(23, 'posr-20240519-022423', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1299.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-19 08:24:23', '2024-05-19 08:24:23'),
(24, 'posr-20240519-022530', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1300, 1300, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-19 08:25:30', '2024-05-19 08:25:30'),
(25, 'posr-20240519-023055', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1300, 1300, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-19 08:30:55', '2024-05-19 08:30:55'),
(28, 'posr-20240521-013249', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 95.45, 1050, 1050, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1050, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-21 07:32:49', '2024-05-21 07:32:49'),
(29, 'posr-20240603-122651', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 231.82, 2549.99, 2549.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 2549.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-03 06:26:51', '2024-06-03 06:29:06'),
(30, 'posr-20240603-053015', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 209.09, 2300, 2300, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 2300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-03 11:30:15', '2024-06-03 11:30:15'),
(31, 'sr-20240603-053058', 1, 2, NULL, NULL, 1, 1, 1, 1, 1, 0, 0, 577, 577, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-03 11:30:58', '2024-06-03 11:30:58'),
(33, 'posr-20240626-010115', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 4, 4, NULL, 1299.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-26 07:01:15', '2024-06-26 07:01:42'),
(36, 'sr-20240711-121041', 1, 2, NULL, NULL, 1, 1, 1, 1, 1, 0, 0, 577, 577, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-07 18:00:00', '2024-07-11 06:10:41'),
(38, 'posr-20240718-113630', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1299.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 05:36:30', '2024-07-18 05:36:30'),
(39, 'posr-20240718-015913', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 0, 250, 250, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 07:59:13', '2024-07-18 07:59:13'),
(40, 'posr-20240718-020145', 1, 1, NULL, NULL, 2, 2, 1, 1, 1, 0, 0, 250, 250, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 08:01:45', '2024-07-18 08:01:45'),
(42, 'sr-20240811-110629', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 0, 577, 577, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 577, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-11 05:06:29', '2024-08-11 05:28:06'),
(43, 'sr-20240811-113722', 1, 1, NULL, NULL, 2, 2, 1, 1, 1, 0, 54.45, 599, 599, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-11 05:37:22', '2024-08-11 05:37:38'),
(45, 'posr-20240811-114852', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 145.46, 1600, 1600, 1, 1, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-11 05:48:52', '2024-08-11 05:48:52'),
(46, 'posr-20240919-023556', 1, 2, NULL, NULL, 2, 1, 1, 4, 10, 0, 0, 1000, 1000, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-19 12:35:56', '2024-09-19 12:35:56'),
(47, 'posr-20240919-023833', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1299.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-19 12:38:33', '2024-09-19 12:38:33'),
(48, 'posr-20240920-114748', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 0, 1434, 1434, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 09:47:48', '2024-09-20 09:47:48'),
(49, 'posr-20240920-120017', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 0, 1434, 1434, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 10:00:17', '2024-09-20 10:00:17'),
(50, 'posr-20240920-121441', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 0, 1434, 1434, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 10:14:41', '2024-09-20 10:14:41'),
(51, 'posr-20240920-121518', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 0, 1434, 1434, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 10:15:18', '2024-09-20 10:15:18'),
(52, 'posr-20240920-121655', 1, 2, NULL, NULL, 2, 1, 1, 1, 3, 0, 0, 3600, 3600, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 3600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 10:16:55', '2024-09-20 10:16:55'),
(53, 'posr-20240920-121751', 1, 2, NULL, NULL, 2, 1, 1, 1, 2, 0, 190.91, 2100, 2100, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 2100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 10:17:51', '2024-09-20 10:17:51'),
(54, 'posr-20240920-122113', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 0, 1434, 1434, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 10:21:13', '2024-09-20 10:21:13'),
(55, 'posr-20240920-012750', 1, 2, NULL, NULL, 2, 1, 1, 9, 45, 0, 0, 450, 450, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'testt', 'testt', '2024-09-19 22:00:00', '2024-09-20 11:27:50'),
(56, 'posr-20240920-030504', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 0, 1434, 1434, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 13:05:04', '2024-09-20 13:05:04'),
(57, 'posr-20240920-032745', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 0, 1434, 1434, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 13:27:45', '2024-09-20 13:27:45'),
(58, 'posr-20240920-033401', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 0, 1434, 1434, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-20 13:34:01', '2024-09-20 13:34:01'),
(59, 'posr-20240924-054856', 1, 2, NULL, NULL, 2, 1, 1, 1, 2, 0, 227.27, 2500, 2500, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 2500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-24 15:48:56', '2024-09-24 15:48:56'),
(60, 'posr-20240924-054947', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 231.82, 2549.99, 2549.99, 1, 1, NULL, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 2549.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-24 15:49:47', '2024-09-24 15:49:47'),
(61, 'posr-20250123-035844', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 101.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, 'dfsdfsfd', 'fsdfdsf', '2025-01-23 14:58:44', '2025-01-23 14:58:44'),
(62, 'posr-20250127-103831', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 45.36, 499, 499, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 500.12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-27 09:38:31', '2025-01-27 09:38:31'),
(63, 'posr-20250127-013823', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 4, NULL, 1299.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-27 12:38:23', '2025-01-27 12:38:23'),
(64, 'posr-20250128-094617', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 4, NULL, 1299.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, 'adadewwr', 'ererwerfdfsf', '2025-01-28 08:46:17', '2025-01-28 08:46:17'),
(65, 'posr-20250128-094915', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 113.64, 1250, 1250, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 4, NULL, 1250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, 'hfjgjfgf', 'uyrtrtyrtew', '2025-01-28 08:49:15', '2025-01-28 08:49:15'),
(66, 'posr-20250128-095713', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 0, 1250, 1250, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 1205.62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-28 08:57:13', '2025-01-28 08:57:13'),
(67, 'posr-20250128-105232', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 0, 2361.99, 2361.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 4, 4, NULL, 2361.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-28 09:52:32', '2025-01-28 09:53:22'),
(68, 'posr-20250129-031308', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 4, NULL, 1299.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-29 14:13:08', '2025-01-29 14:13:08'),
(69, 'posr-20250130-092313', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 1100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, 'fsdfdsfds', 'fdsfdsf', '2025-01-30 08:23:13', '2025-01-30 08:23:13'),
(70, 'posr-20250130-092624', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 3000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, 'fsfsf', 'dsfsf', '2025-01-30 08:26:24', '2025-01-30 08:26:24'),
(71, 'posr-20250130-092659', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 990, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, 'dsfsdfdsf', 'sdfsf', '2025-01-30 08:26:59', '2025-01-30 08:26:59'),
(72, '679b383ac06fa', 48, NULL, NULL, NULL, 5, 1, 1, 1, 1, 0, 0, 25, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, NULL, NULL, 'Omar fayez', '81627347', 'omarf@optimalsolutions.it', 'Beirut', 'Beirut', '', 'LB', '961', 'Omar fayez', '81627347', 'omarf@optimalsolutions.it', 'Beirut', 'Beirut', '', 'LB', '961', 'online', NULL, '', NULL, '2025-01-30 09:28:42', '2025-01-30 09:28:42'),
(73, 'posr-20250130-103123', 1, 2, NULL, NULL, 2, 1, 1, 1, 3, 0, 0, 75, 75, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 4, NULL, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-30 09:31:23', '2025-01-30 09:31:23'),
(74, 'posr-20250130-103822', 47, 3, NULL, NULL, 2, 1, 1, 1, 1, 0, 0, 109, 109, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 4, NULL, 109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-30 09:38:22', '2025-01-30 09:38:22'),
(75, 'posr-20250130-103936', 47, 3, NULL, NULL, 2, 1, 1, 1, 1, 0, 90.91, 999.99, 999.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 3, 2, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-30 09:39:36', '2025-01-30 09:39:36'),
(76, 'posr-20250130-105137', 47, 3, NULL, NULL, 2, 1, 1, 1, 1, 0, 0, 1111.99, 1111.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 4, NULL, 1111.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-30 09:51:37', '2025-01-30 09:51:37'),
(77, 'posr-20250131-083925', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 209.09, 2299.98, 2299.98, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 2300.07, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-31 07:39:25', '2025-01-31 07:39:25'),
(78, 'posr-20250131-092732', 1, 2, NULL, NULL, 2, 1, 1, 1, 2, 0, 236.36, 2599.98, 2599.98, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 1080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, 'adasdasd', 'asdasd', '2025-01-31 08:27:32', '2025-01-31 08:27:32'),
(79, 'posr-20250131-094501', 1, 2, NULL, NULL, 2, 1, 1, 2, 2, 0, 122.73, 1349.99, 1349.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 4, NULL, 1349.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-31 08:45:01', '2025-01-31 08:45:01'),
(80, 'posr-20250131-094639', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 31.82, 350, 350, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-31 08:46:39', '2025-01-31 08:46:39'),
(81, 'posr-20250131-094848', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 0, 547, 547, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 4, NULL, 547, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-31 08:48:48', '2025-01-31 08:48:48'),
(82, 'posr-20250131-094910', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 31.82, 350, 350, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 340, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-31 08:49:10', '2025-01-31 08:49:10'),
(83, 'posr-20250131-094927', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 31.82, 350, 350, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-31 08:49:27', '2025-01-31 08:49:27'),
(84, 'posr-20250131-095122', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 104.64, 1150.99, 1150.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 4, NULL, 1150.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, NULL, NULL, '2025-01-31 08:51:22', '2025-01-31 08:51:22'),
(85, 'posr-20250131-095353', 1, 2, NULL, NULL, 2, 1, 1, 1, 1, 0, 118.18, 1299.99, 1299.99, 1, 1, 0, 0, 'Flat', NULL, 0, NULL, 0, 0, 1, 2, NULL, 1040, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pos', NULL, 'fsfddsf', 'sdfsf', '2025-01-31 08:53:53', '2025-01-31 08:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `link`, `image1`, `image2`, `image3`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '202501201001050.jpg', NULL, NULL, 1, 1, '2025-01-20 09:01:05', '2025-01-20 09:01:05'),
(2, NULL, NULL, '202501201001180.jpg', NULL, NULL, 2, 1, '2025-01-20 09:01:18', '2025-01-20 09:01:18'),
(3, NULL, NULL, '202501201001430.jpg', NULL, NULL, 3, 1, '2025-01-20 09:01:43', '2025-01-20 09:01:43'),
(4, NULL, NULL, '202501201001540.jpg', NULL, NULL, 4, 1, '2025-01-20 09:01:54', '2025-01-20 09:01:54'),
(5, NULL, NULL, '202501201002040.jpg', NULL, NULL, 5, 1, '2025-01-20 09:02:04', '2025-01-20 09:02:04');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_default_ecommerce` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `name`, `content`, `is_default`, `is_default_ecommerce`, `created_at`, `updated_at`) VALUES
(1, 'test template', 'eso nije kori...', 0, 0, '2024-05-19 08:14:12', '2024-05-19 08:23:57'),
(2, 'test template 2', 'fsdfsdf', 1, 1, '2024-05-19 08:20:25', '2024-05-19 08:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` text DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `icon`, `title`, `link`, `order`, `created_at`, `updated_at`) VALUES
(1, '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"16\" width=\"10\" viewBox=\"0 0 320 512\"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d=\"M80 299.3V512H196V299.3h86.5l18-97.8H196V166.9c0-51.7 20.3-71.5 72.7-71.5c16.3 0 29.4 .4 37 1.2V7.9C291.4 4 256.4 0 236.2 0C129.3 0 80 50.5 80 159.4v42.1H14v97.8H80z\"/></svg>', 'Facebook', NULL, 0, '2025-01-20 09:49:15', '2025-01-20 09:49:15'),
(2, '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"16\" width=\"16\" viewBox=\"0 0 512 512\"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d=\"M389.2 48h70.6L305.6 224.2 487 464H345L233.7 318.6 106.5 464H35.8L200.7 275.5 26.8 48H172.4L272.9 180.9 389.2 48zM364.4 421.8h39.1L151.1 88h-42L364.4 421.8z\"/></svg>', 'Twitter', NULL, 1, '2025-01-20 09:49:26', '2025-01-20 09:49:26'),
(3, '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"16\" width=\"14\" viewBox=\"0 0 448 512\"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d=\"M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z\"/></svg>', 'Instagram', NULL, 2, '2025-01-20 09:49:46', '2025-01-20 09:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `stock_counts`
--

CREATE TABLE `stock_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(191) DEFAULT NULL,
  `brand_id` varchar(191) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `initial_file` varchar(191) DEFAULT NULL,
  `final_file` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_counts`
--

INSERT INTO `stock_counts` (`id`, `reference_no`, `warehouse_id`, `category_id`, `brand_id`, `user_id`, `type`, `initial_file`, `final_file`, `note`, `is_adjusted`, `created_at`, `updated_at`) VALUES
(1, 'scr-20240918-040459', 1, NULL, NULL, 1, 'full', '20240918-040459.csv', NULL, NULL, 0, '2024-09-18 14:04:59', '2024-09-18 14:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Abdullah', NULL, 'Global Tech', '31213131', 'abdullah@gmail.com', '312313', 'Mirpur', 'Dhaka', NULL, NULL, 'Bangladesh', 1, '2024-01-19 13:41:37', '2024-01-19 13:41:37'),
(2, 'rahmatullah', NULL, 'Samsung', NULL, 'info@microsoft.com', '213123123', 'boropul, halishahr', 'chittagong', NULL, NULL, NULL, 1, '2024-07-18 07:51:07', '2024-07-18 07:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `number_of_person` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `floor_id` tinyint(4) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `name`, `number_of_person`, `description`, `floor_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Table 1', 3, 'middle table', 1, 1, '2024-04-21 04:58:24', '2024-04-21 04:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '@10', 10, 1, '2024-01-08 05:26:16', '2024-01-08 05:26:16'),
(2, '@15', 15, 1, '2024-01-08 05:26:29', '2024-01-08 05:26:29'),
(3, 'vat 20%', 20, 1, '2024-04-29 12:28:49', '2024-04-29 12:28:49');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_sent` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `reference_no`, `user_id`, `status`, `from_warehouse_id`, `to_warehouse_id`, `item`, `total_qty`, `total_tax`, `total_cost`, `shipping_cost`, `grand_total`, `document`, `note`, `is_sent`, `created_at`, `updated_at`) VALUES
(11, 'tr-20240528-030550', 1, 1, 1, 2, 1, 1, 0, 439, NULL, 439, NULL, NULL, 1, '2024-05-28 09:05:50', '2024-05-28 09:05:56'),
(12, 'tr-20240528-030714', 1, 1, 1, 2, 1, 1, 0, 399, NULL, 399, NULL, NULL, 1, '2024-05-28 09:07:14', '2024-05-28 09:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_code` varchar(191) NOT NULL,
  `unit_name` varchar(191) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_code`, `unit_name`, `base_unit`, `operator`, `operation_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'pc', 'Piece', NULL, '*', 1, 1, '2024-01-08 05:37:39', '2024-01-08 05:37:39'),
(2, 'dozen', 'Dozen', 1, '*', 12, 1, '2024-01-08 05:38:27', '2024-01-08 05:38:27'),
(3, 'carton', 'Carton', 1, '*', 24, 1, '2024-01-08 05:39:01', '2024-01-08 05:39:01'),
(4, 'kg', 'Kilogram', NULL, '*', 1, 1, '2024-01-08 05:39:37', '2024-01-08 05:39:37'),
(5, 'gm', 'Gram', 4, '/', 1000, 1, '2024-01-08 05:40:00', '2024-01-08 05:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `phone`, `company_name`, `role_id`, `biller_id`, `warehouse_id`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'info@optimalsolutions.it', '$2y$10$D3NNYjFpxZ/7ve5fTVs.k.6cH5AfPyPC1JL7/G8NQoVcTPvt9nZoa', 'Gu8WaN2lQKdaa9mNOTb7r4FHQXcR9orTxhvBlInRyy0rAW0DjbnYEbzedrsy', '(+44) 1865 60 0679', 'Optimal Solutions', 1, NULL, NULL, 1, 0, '2018-06-02 03:24:15', '2025-01-23 15:24:11'),
(3, 'dhiman da', 'dhiman@gmail.com', '$2y$10$Fef6vu5E67nm11hX7V5a2u1ThNCQ6n9DRCvRF9TD7stk.Pmt2R6O.', '5ehQM6JIfiQfROgTbB5let0Z93vjLHS7rd9QD5RPNgOxli3xdo7fykU7vtTt', '212', 'lioncoders', 1, NULL, NULL, 0, 1, '2018-06-13 22:00:31', '2020-11-05 07:06:51'),
(6, 'test', 'test@gmail.com', '$2y$10$TDAeHcVqHyCmurki0wjLZeIl1SngKX3WLOhyTiCoZG3souQfqv.LS', 'KpW1gYYlOFacumklO2IcRfSsbC3KcWUZzOI37gqoqM388Xie6KdhaOHIFEYm', '1234', '212312', 4, NULL, NULL, 0, 1, '2018-06-23 03:05:33', '2018-06-23 03:13:45'),
(8, 'test', 'test@yahoo.com', '$2y$10$hlMigidZV0j2/IPkgE/xsOSb8WM2IRlsMv.1hg1NM7kfyd6bGX3hC', NULL, '31231', NULL, 4, NULL, NULL, 0, 1, '2018-06-24 22:35:49', '2018-07-02 01:07:39'),
(9, 'staff', 'anda@gmail.com', '$2y$10$plvC1q1qM1ypHu8uP/s1Pum2fYMLXq0LH9X0lNe0noFHaZTmDqdUe', 'Ae1PeUEwfZBA5wTsu0NgsrIBuweQ94jNwmhn60Hx9NkzduJXf3aKpU7QmMwm', '3123', NULL, 4, NULL, 1, 1, 0, '2018-07-02 01:08:08', '2025-01-27 14:48:43'),
(10, 'abul', 'abul@alpha.com', '$2y$10$5zgB2OOMyNBNVAd.QOQIju5a9fhNnTqPx5H6s4oFlXhNiF6kXEsPq', 'x7HlttI5bM0vSKViqATaowHFJkLS3PHwfvl7iJdFl5Z1SsyUgWCVbLSgAoi0', '1234', 'anda', 1, NULL, NULL, 0, 0, '2018-09-07 23:44:48', '2018-09-07 23:44:48'),
(11, 'teststaff', 'a@a.com', '$2y$10$5KNBIIhZzvvZEQEhkHaZGu.Q8bbQNfqYvYgL5N55B8Pb4P5P/b/Li', 'DkHDEcCA0QLfsKPkUK0ckL0CPM6dPiJytNa0k952gyTbeAyMthW3vi7IRitp', '111', 'aa', 4, 5, 1, 0, 1, '2018-10-22 02:47:56', '2018-10-23 02:10:56'),
(12, 'john', 'john@gmail.com', '$2y$10$P/pN2J/uyTYNzQy2kRqWwuSv7P2f6GE/ykBwtHdda7yci3XsfOKWe', 'O0f1WJBVjT5eKYl3Js5l1ixMMtoU6kqrH7hbHDx9I1UCcD9CmiSmCBzHbQZg', '10001', NULL, 4, 2, 2, 0, 1, '2018-12-30 00:48:37', '2019-03-06 04:59:49'),
(13, 'jjj', 'test@test.com', '$2y$10$/Qx3gHWYWUhlF1aPfzXaCeZA7fRzfSEyCIOnk/dcC4ejO8PsoaalG', NULL, '1213', NULL, 1, NULL, NULL, 0, 1, '2019-01-03 00:08:31', '2019-03-03 04:02:29'),
(19, 'shakalaka', 'shakalaka@gmail.com', '$2y$10$ketLWT0Ib/JXpo00eJlxoeSw.7leS8V1CUGInfbyOWT4F5.Xuo7S2', NULL, '1212', 'Digital image', 5, NULL, NULL, 1, 0, '2020-11-09 00:07:16', '2020-11-09 00:07:16'),
(21, 'modon', 'modon@gmail.com', '$2y$10$7VpoeGMkP8QCvL5zLwFW..6MYJ5MRumDLDoX.TTQtClS561rpFHY.', NULL, '2222', 'modon company', 5, NULL, NULL, 1, 0, '2020-11-13 07:12:08', '2020-11-13 07:12:08'),
(22, 'dhiman', 'dhiman@gmail.com', '$2y$10$3mPygsC6wwnDtw/Sg85IpuExtUhgaHx52Lwp7Rz0.FNfuFdfKVpRq', NULL, '+8801111111101', 'lioncoders', 5, NULL, NULL, 1, 0, '2020-11-15 06:14:58', '2020-11-15 06:14:58'),
(31, 'mbs', 'mbs@gmail.com', '$2y$10$6Ldm1rWEVSrlTmpjIXkeQO9KwWJz/j0FB4U.fY1oCFeax47rvttEK', NULL, '2121', NULL, 4, 1, 2, 0, 0, '2021-12-29 06:40:22', '2021-12-29 06:40:22'),
(39, 'maja', 'maja@maja.com', '$2y$10$lrMVhNDE9AuKhFrJIgG2y.zdtrCltR8/JB1okO0W8GsUcMjSFW7rW', NULL, '444555', NULL, 4, 5, 2, 1, 0, '2022-09-14 04:37:21', '2022-09-14 04:37:21'),
(42, 'Tarik Iqbal', 'tarik_17@yahoo.co.uk', '$2y$10$z2nZAsrIPrSWgPEtTY9D6.1vmkvYj4p3W3kamYvdoCDnCtlVqZp86', NULL, '', NULL, 5, NULL, NULL, 1, 0, '2023-11-17 05:04:37', '2023-11-28 15:10:11'),
(43, 'support@lion-coders.com', 'support@lion-coders.com', '$2y$10$ea.ekPLTQk0Y5087FqSbdevaN.gkEMGucgFJ13aGPEd.EqY45Y.AK', NULL, '', NULL, 5, NULL, NULL, 1, 0, '2023-12-09 14:15:06', '2023-12-09 14:15:50'),
(44, 'james', 'jamesbond@gmail.com', '$2y$10$7XCviP5GAZm6E/nlk4HQmuyw2kbhVpLbxsN6PqmNubmUKpiseGiEy', NULL, '313131', 'MI6', 5, NULL, NULL, 1, 0, '2024-01-19 13:23:28', '2024-01-19 13:23:28'),
(46, 'bkk', 'bkk@bkk.com', '$2y$10$6FBCW.gf7tOH6ygDYLUcSeVkur1VL.iBSvGor35AxO849fJLxxZoW', NULL, '87897', NULL, 5, NULL, NULL, 1, 0, '2024-06-10 10:40:15', '2024-06-10 10:40:15'),
(47, 'Owner', 'Owner@gmail.com', '$2y$10$19JlU.WkVVFik.xPxZK7heNwlm3Cc6KvgwgMvb/P8Y5GsySX5ctoO', NULL, '00000000', NULL, 2, NULL, NULL, 1, 0, '2025-01-27 14:46:27', '2025-01-27 14:46:27'),
(48, 'Omar fayez', 'omarf@optimalsolutions.it', '$2y$10$JAlf5XBd7ACt.fPMcigVQ.d88T4X7NRZaK5T2lPY1qipp.1F9Rrke', NULL, '81627347', NULL, 5, NULL, NULL, 1, 0, '2025-01-30 09:28:42', '2025-01-30 09:28:42'),
(49, 'alaa test', 'alaak@optimalsolutions.it', '$2y$10$OI0.HxNXfJiLh.EPb8x/DOhGzFoOC1WPKirv/5oxu84byL381eR5S', NULL, '', NULL, 5, NULL, NULL, 0, 0, '2025-01-31 10:08:13', '2025-01-31 10:08:13'),
(50, 'alaa', 'alaa.k@optimalsolutions.it', '$2y$10$jiFcyHr9b3Xjl8J6wTLK6uYVwZ5WTgBSIWFmrLMuy1okvjaPnWpMy', NULL, '', NULL, 5, NULL, NULL, 0, 0, '2025-01-31 10:41:02', '2025-01-31 10:41:02');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'red/large', '2024-09-19 12:00:57', '2024-09-19 12:00:57'),
(2, 'meduim/large', '2024-09-19 12:00:57', '2024-09-19 12:00:57'),
(3, 'green', '2024-09-19 12:11:11', '2024-09-19 12:11:11'),
(4, 'blue', '2024-09-19 12:11:11', '2024-09-19 12:11:11'),
(5, 'M/Red', '2024-09-19 12:31:00', '2024-09-19 12:31:00'),
(6, 'M/Blue', '2024-09-19 12:31:00', '2024-09-19 12:31:00'),
(7, 'L/Red', '2024-09-19 12:31:00', '2024-09-19 12:31:00'),
(8, 'L/Blue', '2024-09-19 12:31:00', '2024-09-19 12:31:00'),
(9, 'small/white', '2024-09-19 13:47:33', '2024-09-20 11:04:54'),
(10, 'small/black', '2024-09-19 13:47:33', '2024-09-20 11:04:54'),
(11, 'small/green', '2024-09-19 13:47:33', '2024-09-20 11:04:54'),
(12, 'medium/white', '2024-09-19 13:47:33', '2024-09-20 11:04:54'),
(13, 'medium/black', '2024-09-19 13:47:33', '2024-09-20 11:04:54'),
(14, 'medium/green', '2024-09-19 13:47:33', '2024-09-20 11:04:54'),
(15, 'large/white', '2024-09-19 13:47:33', '2024-09-20 11:04:54'),
(16, 'large/black', '2024-09-19 13:47:33', '2024-09-20 11:04:54'),
(17, 'large/green', '2024-09-19 13:47:33', '2024-09-20 11:04:54'),
(18, 'red/M', '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(19, 'red/L', '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(20, 'red/S', '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(21, 'blue/M', '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(22, 'blue/L', '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(23, 'blue/S', '2024-09-20 10:50:16', '2024-09-20 10:50:16'),
(24, 'black', '2024-09-20 12:40:11', '2024-09-20 12:40:11'),
(25, 'white', '2024-09-20 12:40:11', '2024-09-20 12:40:11'),
(26, 'red', '2024-09-24 15:30:30', '2024-09-24 15:30:30'),
(27, 'small/black//green//', '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(28, 'small/white//green//', '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(29, 'small/green//green//', '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(30, 'medium/black//green//', '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(31, 'medium/white//green//', '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(32, 'medium/green//green//', '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(33, 'large/black//green//', '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(34, 'large/white//green//', '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(35, 'large/green//green//', '2024-09-25 13:01:33', '2024-09-25 13:01:33'),
(36, 'S/Black', '2024-09-25 13:05:42', '2024-09-30 11:34:19'),
(37, 'S/white', '2024-09-25 13:05:42', '2024-09-30 11:34:19'),
(38, 'S/Green', '2024-09-25 13:05:42', '2024-09-30 11:34:19'),
(39, 'M/Black', '2024-09-25 13:05:42', '2024-09-30 11:34:19'),
(40, 'M/white', '2024-09-25 13:05:42', '2024-09-30 11:34:19'),
(41, 'M/Green', '2024-09-25 13:05:42', '2024-09-30 11:34:19'),
(42, 'L/Black', '2024-09-25 13:05:42', '2024-09-30 11:34:19'),
(43, 'L/white', '2024-09-25 13:05:42', '2024-09-30 11:34:19'),
(44, 'L/Green', '2024-09-25 13:05:42', '2024-09-30 11:34:19'),
(45, '1/r', '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(46, '1/b', '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(47, '1/w', '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(48, '2/r', '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(49, '2/b', '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(50, '2/w', '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(51, '3/r', '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(52, '3/b', '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(53, '3/w', '2024-09-27 11:15:35', '2024-09-27 11:15:35'),
(54, '1/r/1/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(55, '1/r/1/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(56, '1/r/1/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(57, '1/r/2/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(58, '1/r/2/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(59, '1/r/2/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(60, '1/r/3/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(61, '1/r/3/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(62, '1/r/3/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(63, '1/b/1/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(64, '1/b/1/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(65, '1/b/1/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(66, '1/b/2/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(67, '1/b/2/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(68, '1/b/2/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(69, '1/b/3/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(70, '1/b/3/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(71, '1/b/3/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(72, '1/w/1/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(73, '1/w/1/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(74, '1/w/1/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(75, '1/w/2/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(76, '1/w/2/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(77, '1/w/2/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(78, '1/w/3/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(79, '1/w/3/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(80, '1/w/3/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(81, '2/r/1/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(82, '2/r/1/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(83, '2/r/1/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(84, '2/r/2/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(85, '2/r/2/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(86, '2/r/2/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(87, '2/r/3/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(88, '2/r/3/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(89, '2/r/3/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(90, '2/b/1/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(91, '2/b/1/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(92, '2/b/1/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(93, '2/b/2/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(94, '2/b/2/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(95, '2/b/2/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(96, '2/b/3/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(97, '2/b/3/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(98, '2/b/3/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(99, '2/w/1/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(100, '2/w/1/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(101, '2/w/1/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(102, '2/w/2/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(103, '2/w/2/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(104, '2/w/2/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(105, '2/w/3/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(106, '2/w/3/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(107, '2/w/3/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(108, '3/r/1/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(109, '3/r/1/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(110, '3/r/1/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(111, '3/r/2/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(112, '3/r/2/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(113, '3/r/2/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(114, '3/r/3/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(115, '3/r/3/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(116, '3/r/3/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(117, '3/b/1/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(118, '3/b/1/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(119, '3/b/1/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(120, '3/b/2/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(121, '3/b/2/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(122, '3/b/2/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(123, '3/b/3/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(124, '3/b/3/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(125, '3/b/3/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(126, '3/w/1/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(127, '3/w/1/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(128, '3/w/1/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(129, '3/w/2/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(130, '3/w/2/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(131, '3/w/2/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(132, '3/w/3/r', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(133, '3/w/3/b', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(134, '3/w/3/w', '2024-09-27 18:11:10', '2024-09-27 18:11:10'),
(135, 'L/Orange', '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(136, 'M/Orange', '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(137, 'S/Red', '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(138, 'S/Orange', '2024-09-30 11:21:44', '2024-09-30 11:21:44'),
(139, 'red/64', '2025-01-20 12:49:54', '2025-01-20 12:49:54'),
(140, 'red/128', '2025-01-20 12:49:54', '2025-01-20 12:49:54'),
(141, 'red/256', '2025-01-20 12:49:54', '2025-01-20 12:49:54'),
(142, 'white/64', '2025-01-20 12:49:54', '2025-01-20 12:49:54'),
(143, 'white/128', '2025-01-20 12:49:54', '2025-01-20 12:49:54'),
(144, 'white/256', '2025-01-20 12:49:54', '2025-01-20 12:49:54'),
(145, 'green/64', '2025-01-20 12:49:54', '2025-01-20 12:49:54'),
(146, 'green/128', '2025-01-20 12:49:54', '2025-01-20 12:49:54'),
(147, 'green/256', '2025-01-20 12:49:54', '2025-01-20 12:49:54');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Shop 1', '97090998', 'ashfaqdev.php@gmail.com', 'london', 1, '2024-01-19 13:28:31', '2024-05-28 07:56:14'),
(2, 'Shop 2', '8098098', 'ashfaqdev.php@gmail.com', 'Liverpool', 1, '2024-01-19 13:28:52', '2024-05-28 07:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `order` varchar(255) NOT NULL,
  `feature_title` varchar(255) DEFAULT NULL,
  `feature_secondary_title` varchar(255) DEFAULT NULL,
  `feature_icon` varchar(255) DEFAULT NULL,
  `site_info_name` varchar(255) DEFAULT NULL,
  `site_info_description` varchar(255) DEFAULT NULL,
  `site_info_address` varchar(255) DEFAULT NULL,
  `site_info_phone` varchar(255) DEFAULT NULL,
  `site_info_email` varchar(255) DEFAULT NULL,
  `site_info_hours` varchar(255) DEFAULT NULL,
  `newsletter_title` varchar(255) DEFAULT NULL,
  `newsletter_text` varchar(255) DEFAULT NULL,
  `quick_links_title` varchar(255) DEFAULT NULL,
  `quick_links_menu` varchar(255) DEFAULT NULL,
  `text_title` varchar(255) DEFAULT NULL,
  `text_content` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `name`, `location`, `order`, `feature_title`, `feature_secondary_title`, `feature_icon`, `site_info_name`, `site_info_description`, `site_info_address`, `site_info_phone`, `site_info_email`, `site_info_hours`, `newsletter_title`, `newsletter_text`, `quick_links_title`, `quick_links_menu`, `text_title`, `text_content`, `created_at`, `updated_at`) VALUES
(5, 'site-features-widget', 'footer_top', '0', 'Free Shipping', 'Free shipping on all orders over $200', '202501230306120.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:24:45', '2025-01-23 14:06:12'),
(6, 'site-features-widget', 'footer_top', '1', '24/7 Dedicated Support', 'Get in touch with any query you have', '202501230306261.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:24:46', '2025-01-23 14:06:26'),
(7, 'site-features-widget', 'footer_top', '1', '100% Secure Payment', 'Pay with confidence on our site', '202501230306391.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:24:48', '2025-01-23 14:06:39'),
(8, 'site-features-widget', 'footer_top', '1', 'Daily Offers', 'Exciting discounts, promotions and offers', '202501230306491.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:24:50', '2025-01-23 14:06:49'),
(9, 'site-info-widget', 'footer', '0', NULL, NULL, NULL, NULL, 'Optimal POS eCommerce is a premium POS, inventory Laravel PHP script.', 'Beirut, Lebanon', '(+44) 1865 60 0679', 'info@optimalsolutions.it', '9AM - 5PM (GMT +6)', NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-20 09:24:56', '2025-01-20 09:36:01'),
(13, 'newsletter-widget', 'footer', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Newsletter Sign Up', 'Sign Up for our monthly newsletter and be the first to know about exciting offers, promotions and new items', NULL, NULL, NULL, NULL, '2025-01-20 09:25:07', '2025-01-20 09:55:57'),
(17, 'custom-menu-widget', 'footer', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Useful Links', '2', NULL, NULL, '2025-01-20 09:56:24', '2025-01-20 09:56:48'),
(18, 'custom-menu-widget', 'footer', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Help Center', '3', NULL, NULL, '2025-01-20 09:56:25', '2025-01-23 08:46:56'),
(19, 'custom-menu-widget', 'footer', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Business', '4', NULL, NULL, '2025-01-20 09:56:27', '2025-01-23 08:46:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `challans`
--
ALTER TABLE `challans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plans`
--
ALTER TABLE `discount_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dso_alerts`
--
ALTER TABLE `dso_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecommerce_settings`
--
ALTER TABLE `ecommerce_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `external_services`
--
ALTER TABLE `external_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_categories`
--
ALTER TABLE `income_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_settings`
--
ALTER TABLE `mail_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `packing_slips`
--
ALTER TABLE `packing_slips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packing_slip_products`
--
ALTER TABLE `packing_slip_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_widgets`
--
ALTER TABLE `page_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_setting`
--
ALTER TABLE `pos_setting`
  ADD UNIQUE KEY `pos_setting_id_unique` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_batches`
--
ALTER TABLE `product_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_purchases`
--
ALTER TABLE `product_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_quotation`
--
ALTER TABLE `product_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_returns`
--
ALTER TABLE `product_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sales`
--
ALTER TABLE `product_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_transfer`
--
ALTER TABLE `product_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_purchases`
--
ALTER TABLE `return_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_counts`
--
ALTER TABLE `stock_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `challans`
--
ALTER TABLE `challans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plans`
--
ALTER TABLE `discount_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dso_alerts`
--
ALTER TABLE `dso_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ecommerce_settings`
--
ALTER TABLE `ecommerce_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `external_services`
--
ALTER TABLE `external_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `income_categories`
--
ALTER TABLE `income_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_settings`
--
ALTER TABLE `mail_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packing_slips`
--
ALTER TABLE `packing_slips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `packing_slip_products`
--
ALTER TABLE `packing_slip_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `page_widgets`
--
ALTER TABLE `page_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `pos_setting`
--
ALTER TABLE `pos_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_batches`
--
ALTER TABLE `product_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_purchases`
--
ALTER TABLE `product_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `product_quotation`
--
ALTER TABLE `product_quotation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_sales`
--
ALTER TABLE `product_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `product_transfer`
--
ALTER TABLE `product_transfer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=588;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `return_purchases`
--
ALTER TABLE `return_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stock_counts`
--
ALTER TABLE `stock_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
