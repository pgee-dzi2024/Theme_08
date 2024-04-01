-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране:  1 апр 2024 в 20:07
-- Версия на сървъра: 10.4.32-MariaDB
-- Версия на PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данни: `dzi_08`
--

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Стока', 7, 'add_item'),
(26, 'Can change Стока', 7, 'change_item'),
(27, 'Can delete Стока', 7, 'delete_item'),
(28, 'Can view Стока', 7, 'view_item'),
(29, 'Can add Отзив', 8, 'add_review'),
(30, 'Can change Отзив', 8, 'change_review'),
(31, 'Can delete Отзив', 8, 'delete_review'),
(32, 'Can view Отзив', 8, 'view_review'),
(33, 'Can add Поръчка', 9, 'add_orderreview'),
(34, 'Can change Поръчка', 9, 'change_orderreview'),
(35, 'Can delete Поръчка', 9, 'delete_orderreview'),
(36, 'Can view Поръчка', 9, 'view_orderreview'),
(37, 'Can add Поръчка', 9, 'add_order'),
(38, 'Can change Поръчка', 9, 'change_order'),
(39, 'Can delete Поръчка', 9, 'delete_order'),
(40, 'Can view Поръчка', 9, 'view_order');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$qtHTp375sYGhZ5zz6hiPmk$erDyuDsvPGygJ6+K2d9gWY9AV6EvjOtEwDE61vE/4Ks=', '2024-03-28 13:53:47.877464', 1, 'admin', '', '', '', 1, 1, '2024-03-24 21:13:40.302963'),
(2, 'pbkdf2_sha256$600000$GXrlBtuhf9ZhxryO5dH17s$sexcJQ8oM4LMW8u36jxxrxi1VJHDJI8l2+crBrqHO9k=', NULL, 0, 'test_user', '', '', '', 0, 1, '2024-03-26 22:18:47.045696');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-03-25 00:28:48.502454', '1', 'Стол Nordic', 1, '[{\"added\": {}}]', 7, 1),
(2, '2024-03-25 00:29:01.065763', '1', 'Стол Nordic', 2, '[]', 7, 1),
(3, '2024-03-25 00:29:40.661790', '2', 'Стол Kruzo Aero', 1, '[{\"added\": {}}]', 7, 1),
(4, '2024-03-25 00:30:29.787273', '3', 'Стол Ergon', 1, '[{\"added\": {}}]', 7, 1),
(5, '2024-03-25 00:31:20.553563', '4', 'Табуретка Ретро', 1, '[{\"added\": {}}]', 7, 1),
(6, '2024-03-25 11:27:22.527379', '1', 'Иван Петров', 1, '[{\"added\": {}}]', 8, 1),
(7, '2024-03-25 11:30:10.652430', '2', 'Ивана Георгиева', 1, '[{\"added\": {}}]', 8, 1),
(8, '2024-03-25 11:31:20.398994', '3', 'Тодор Великденски', 1, '[{\"added\": {}}]', 8, 1),
(9, '2024-03-25 14:06:34.194509', '4', 'Табуретка Ретро', 2, '[{\"changed\": {\"fields\": [\"\\u0411\\u0440\\u043e\\u0439 \\u043f\\u043e\\u043a\\u0443\\u043f\\u043a\\u0438\"]}}]', 7, 1),
(10, '2024-03-25 17:45:58.133587', '4', 'Табуретка Ретро', 2, '[{\"changed\": {\"fields\": [\"\\u0411\\u0440\\u043e\\u0439 \\u043f\\u043e\\u043a\\u0443\\u043f\\u043a\\u0438\"]}}]', 7, 1),
(11, '2024-03-26 19:35:03.924071', '3', 'weqweq qweq', 3, '', 9, 1),
(12, '2024-03-26 19:35:03.936058', '2', '14 24', 3, '', 9, 1),
(13, '2024-03-26 19:35:03.939057', '1', '1 2', 3, '', 9, 1),
(14, '2024-03-26 22:18:47.368900', '2', 'test_user', 1, '[{\"added\": {}}]', 4, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'main', 'item'),
(9, 'main', 'order'),
(8, 'main', 'review'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура на таблица `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-18 22:40:38.081662'),
(2, 'auth', '0001_initial', '2024-03-18 22:40:39.099898'),
(3, 'admin', '0001_initial', '2024-03-18 22:40:39.363817'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-18 22:40:39.375821'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-18 22:40:39.387733'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-18 22:40:39.471934'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-18 22:40:39.541994'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-18 22:40:39.559531'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-18 22:40:39.568625'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-18 22:40:39.619654'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-18 22:40:39.623168'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-18 22:40:39.632214'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-18 22:40:39.648022'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-18 22:40:39.663135'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-18 22:40:39.679135'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-18 22:40:39.689144'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-18 22:40:39.704153'),
(18, 'sessions', '0001_initial', '2024-03-18 22:40:39.739700'),
(19, 'main', '0001_initial', '2024-03-25 00:25:59.565668'),
(20, 'main', '0002_review', '2024-03-25 11:22:56.509986'),
(21, 'main', '0003_orderreview', '2024-03-26 18:08:07.970734'),
(22, 'main', '0004_rename_orderreview_order', '2024-03-26 18:15:02.288516'),
(23, 'main', '0005_alter_order_managers', '2024-03-26 18:24:30.082065'),
(24, 'main', '0006_alter_order_managers', '2024-03-26 19:26:47.061637'),
(25, 'main', '0007_alter_order_order_details', '2024-03-26 19:34:32.764325');

-- --------------------------------------------------------

--
-- Структура на таблица `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9j124q55vw58ja6f7m7qibql884ubgop', '.eJxVjMsOwiAQRf-FtSFAGR4u3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnocXpd8tID247KHdst1nS3NZlynJX5EG7vM6Fn5fD_Tuo2Ou3pgAMTvmcLWjjyHqGgAbNoIvyDkbWVqPhEa0NJioOzmcYImaiSIbE-wPL1Tec:1rpF7J:TrROv4fcH7eoLB2GawYoqJTVI_bw0yVGfiAwUUbvXq4', '2024-04-09 22:18:01.534364'),
('a3pg825xddtblb00swgttj3ye4ftd7gz', 'MTljZDYzYWM2Y2RhYWU0YmRlZjJiNjQzNmU2NGRhNjZlNjJhOGYxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzM3NGE1OWRhZWNlYTdjNTdmOTdiYzhlZjQ5NWYyNGQyZTk1M2E5In0=', '2024-04-07 21:18:30.499070'),
('bnu14fi1je5tenhtmqtt9mbn22ulyrmg', '.eJxVjMsOwiAQRf-FtSFAGR4u3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnocXpd8tID247KHdst1nS3NZlynJX5EG7vM6Fn5fD_Tuo2Ou3pgAMTvmcLWjjyHqGgAbNoIvyDkbWVqPhEa0NJioOzmcYImaiSIbE-wPL1Tec:1rpCUj:U25ijvF88keOXF-tq_kVp5CAu4-cwk9NwX5gUKi0Wjc', '2024-04-09 19:30:01.968609'),
('k61g5clu9yuqck3eaks4y1kcgbl2c835', '.eJxVjMsOwiAQRf-FtSFAGR4u3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnocXpd8tID247KHdst1nS3NZlynJX5EG7vM6Fn5fD_Tuo2Ou3pgAMTvmcLWjjyHqGgAbNoIvyDkbWVqPhEa0NJioOzmcYImaiSIbE-wPL1Tec:1roVuA:zE3HyKYWtTZvVCN39fQcBYehV8aHr_plcAtu6DvQLv0', '2024-04-07 22:01:26.548396'),
('wg1cm070pdjmb0upghbub2ms4ns14ttj', '.eJxVjMsOwiAQRf-FtSFAGR4u3fsNZBimUjU0Ke3K-O_apAvd3nPOfYmE21rT1nlJUxFnocXpd8tID247KHdst1nS3NZlynJX5EG7vM6Fn5fD_Tuo2Ou3pgAMTvmcLWjjyHqGgAbNoIvyDkbWVqPhEa0NJioOzmcYImaiSIbE-wPL1Tec:1rpqCR:RxZzxA0n_vHB4E8yDLet4Sy7ruDcztH-05JG_BngI6Q', '2024-04-11 13:53:47.882790');

-- --------------------------------------------------------

--
-- Структура на таблица `main_item`
--

DROP TABLE IF EXISTS `main_item`;
CREATE TABLE `main_item` (
  `id` bigint(20) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_item`
--

INSERT INTO `main_item` (`id`, `picture`, `name`, `price`, `hits`) VALUES
(1, 'items/product-1.png', 'Стол Nordic', 78.99, 3),
(2, 'items/product-2.png', 'Стол Kruzo Aero', 123.44, 3),
(3, 'items/product-3.png', 'Стол Ergon', 87.65, 2),
(4, 'items/img-grid-3.jpg', 'Табуретка Ретро', 22.04, 0);

-- --------------------------------------------------------

--
-- Структура на таблица `main_order`
--

DROP TABLE IF EXISTS `main_order`;
CREATE TABLE `main_order` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `note` longtext NOT NULL,
  `order_details` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_order`
--

INSERT INTO `main_order` (`id`, `first_name`, `last_name`, `company`, `address`, `email`, `phone`, `note`, `order_details`) VALUES
(4, '1', '2', '3', '4', '1', '1', '1', '1'),
(5, '12', '34', '56', '78', '12', '12', '12', 'Стол Nordic x 78.99 лв.\nСтол Kruzo Aero x 123.44 лв.\nСтол Ergon x 87.65 лв.\n Сума общо: 290.08 лв.\n'),
(6, 'ghfghfd', 'ghfghfg', 'fsdf asdfs sa dfasd', '', 'ghfghfd', 'ghfghfd', 'ghfghfd', 'Стол Nordic x 78.99 лв.\nСтол Ergon x 262.95 лв.\n ----------------------------------------------\n Сума общо: 341.94 лв.\n');

-- --------------------------------------------------------

--
-- Структура на таблица `main_review`
--

DROP TABLE IF EXISTS `main_review`;
CREATE TABLE `main_review` (
  `id` bigint(20) NOT NULL,
  `txt` longtext NOT NULL,
  `name` varchar(50) NOT NULL,
  `pos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_review`
--

INSERT INTO `main_review` (`id`, `txt`, `name`, `pos`) VALUES
(1, 'Мебелите безспорно са много хубави, но на-вече съм доволен от отзивчивостта и компетентността на консултантите с които комуникирах при избора.', 'Иван Петров', 'Банско, ФИРМА ЕООД'),
(2, 'Много съм доволна от бързината с която изпълнихте поръчката. Много е удобно, когато фирмата доставчик предлага собствен транспорт до адрес на клиента.', 'Ивана Георгиева', 'с. Няматакова, домакиня'),
(3, 'Страхотни мебели, хубав сайт, лесен начин за правене на поръчки.', 'Тодор Великденски', 'инжинер, Банско');

--
-- Indexes for dumped tables
--

--
-- Индекси за таблица `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индекси за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индекси за таблица `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индекси за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индекси за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индекси за таблица `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индекси за таблица `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индекси за таблица `main_item`
--
ALTER TABLE `main_item`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `main_order`
--
ALTER TABLE `main_order`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `main_review`
--
ALTER TABLE `main_review`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `main_item`
--
ALTER TABLE `main_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `main_order`
--
ALTER TABLE `main_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `main_review`
--
ALTER TABLE `main_review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
