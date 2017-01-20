-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2017 at 09:54 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cleverpro`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Clever Local', 'CleverLocal builds, markets and supports leading online stores with best in class technology platforms. Clients use our services to power their business across all of their sales channels, including desktop, tablet and mobile storefronts, social media storefronts, Amazon, eBay and brick-and-mortar and pop-up shops.\n\nWe started CleverLocal to design, implement and manage market leading online stores to rapidly deliver rapid and sustainable revenue growth to our client base.\n\nThe CleverLocal team now provides our merchants with a unified view of their online business across all sales channels. We enable customers to easily manage products, inventory, orders, payments, customer relationships and leverage powerful analytics.\n\nMobile commerce is everything and consumers now expect to be able to transact anywhere, anytime on any device and the experience needs to be simple, seamless and secure. Consumers are accustomed to the standards set by the largest and most innovative online stores and expect a comparable experience with all merchants without exception.\n\nWe build our stores bespoke with detailed analytics to address the growing challenges facing clients, with the aim of making previously complex tasks simple. We use predictive intelligence to maximise sales and chat bots to increase conversions.\n\nWe believe a unified and intelligent e-commerce platform is critical for all of our clients as they accelerate investment in the increasingly competitive online market place.\n\nOur solutions are able to manage large spikes in traffic from events such as new product releases, holiday shopping seasons and flash sales with proven 99.9% availability.\n\nOur passion is to make commerce better for everyone and we believe we can help merchants of nearly all sizes and retail verticals realise their true potential.\n\nWe have a large team of talented designers, developers, project managers and digital marketers ready to grow your business online today !', NULL, NULL),
(2, 'Amaro Trade', 'just kidding', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `developer_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `priority` enum('high','medium','low') NOT NULL,
  `severity` enum('critical','blocker') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`id`, `project_id`, `reporter_id`, `developer_id`, `title`, `description`, `date`, `priority`, `severity`) VALUES
(1, 1, 2, 7, 'login button not responding', 'such a simple issue', '2017-01-12', 'low', 'blocker');

-- --------------------------------------------------------

--
-- Table structure for table `issue_image`
--

CREATE TABLE `issue_image` (
  `id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `original_name` int(11) NOT NULL,
  `extension` int(11) NOT NULL,
  `saved_name` int(11) NOT NULL,
  `location` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2017_01_09_091800_create_user_table', 1),
('2017_01_10_062437_create_user_type', 2),
('2017_01_10_062646_create_company', 2);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('not started','in progress','completed','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `project_id`, `title`, `description`, `start_date`, `end_date`, `status`) VALUES
(1, 1, 'UI', 'please finish this sooner', '2017-01-15', '2017-01-22', 'not started');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `project_manager_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `guest_id` int(11) NOT NULL,
  `status` enum('not started','in progress','completed','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `company_id`, `project_manager_id`, `title`, `description`, `start_date`, `end_date`, `guest_id`, `status`) VALUES
(1, 1, 2, 'CleverPro', 'A project management system that is mainly used in a team-oriented company. (So bad description)', '2017-01-14', '2017-03-31', 8, 'not started'),
(3, 1, 2, 'Library System', 'For USC library', '2017-01-22', '2017-01-31', 8, 'not started');

-- --------------------------------------------------------

--
-- Table structure for table `project_member`
--

CREATE TABLE `project_member` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Full Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_member`
--

INSERT INTO `project_member` (`id`, `project_id`, `title`, `user_id`, `Full Name`) VALUES
(1, 1, 'CleverPro', 1, 'Gary Amaro'),
(2, 3, 'Library System', 1, 'Gary Amaro'),
(3, 1, 'CleverPro', 2, 'April Marieson Fuentes');

-- --------------------------------------------------------

--
-- Table structure for table `project_user`
--

CREATE TABLE `project_user` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_user`
--

INSERT INTO `project_user` (`project_id`, `user_id`) VALUES
(1, 1),
(3, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `developer_id` int(11) NOT NULL,
  `tester_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('not started','in progress','completed','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `module_id`, `developer_id`, `tester_id`, `title`, `description`, `start_date`, `end_date`, `status`) VALUES
(1, 1, 7, 6, 'login form', 'faster please', '2017-01-16', '2017-01-20', 'not started');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `user_type_id`, `company_id`) VALUES
(1, 'Gary', 'Amaro', 'gary.amaro.pn@gmail.com', '', NULL, NULL, NULL, 2, 1),
(2, 'April Marieson', 'Fuentes', 'april@gmail.com', '', NULL, NULL, NULL, 8, 1),
(4, 'Jessa Mae', 'Catolico', 'jessa@gmail.com', '', NULL, NULL, NULL, 4, 1),
(5, 'Almira', 'Delmo', 'almira@gmail.com', '', NULL, NULL, NULL, 5, 1),
(6, 'Ma Izabelle', 'Repaso', 'izabelle@gmail.com', '', NULL, NULL, NULL, 7, 1),
(7, 'Coco', 'Martian', 'coco@gmail.com', '', NULL, NULL, NULL, 6, 1),
(8, 'Vice', 'Ganda', 'vice@gmail.com', '', NULL, NULL, NULL, 3, 1),
(10, 'Juan', 'Dela Cruz', 'juan@gmail.com', '', NULL, '2017-01-20 00:49:31', '2017-01-20 00:49:31', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', NULL, NULL),
(2, 'owner', 'owner', NULL, NULL),
(3, 'guest', 'guest', NULL, NULL),
(4, 'developer lead', 'developer lead', NULL, NULL),
(5, 'test lead', 'test lead', NULL, NULL),
(6, 'developer', 'developer', NULL, NULL),
(7, 'tester', 'tester', NULL, NULL),
(8, 'project manager', 'project manager', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_member`
--
ALTER TABLE `project_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_user`
--
ALTER TABLE `project_user`
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`),
  ADD KEY `user_type_id` (`user_type_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `user_type_id_2` (`user_type_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_type_id_3` (`user_type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `issue`
--
ALTER TABLE `issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `project_member`
--
ALTER TABLE `project_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `project_user`
--
ALTER TABLE `project_user`
  ADD CONSTRAINT `project_user_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
