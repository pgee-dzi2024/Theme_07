-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране: 22 май 2024 в 06:37
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
-- База данни: `dzi_07`
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
  `id` int(11) NOT NULL,
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
(25, 'Can add Категория стоки', 7, 'add_category'),
(26, 'Can change Категория стоки', 7, 'change_category'),
(27, 'Can delete Категория стоки', 7, 'delete_category'),
(28, 'Can view Категория стоки', 7, 'view_category'),
(29, 'Can add Група стоки', 8, 'add_group'),
(30, 'Can change Група стоки', 8, 'change_group'),
(31, 'Can delete Група стоки', 8, 'delete_group'),
(32, 'Can view Група стоки', 8, 'view_group'),
(33, 'Can add Стока', 9, 'add_item'),
(34, 'Can change Стока', 9, 'change_item'),
(35, 'Can delete Стока', 9, 'delete_item'),
(36, 'Can view Стока', 9, 'view_item');

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
(1, 'pbkdf2_sha256$600000$DrFnUXO73ollBSU275zRzW$tMzFF3YKT+qc/OtJc8FgNBaUPseO//R2YpsUMuIr62k=', '2024-05-22 00:42:36.003079', 1, 'admin', '', '', '', 1, 1, '2024-04-16 19:25:20.009083');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
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
(1, '2024-04-16 19:26:55.966729', '1', 'Компютри и компоненти', 1, '[{\"added\": {}}]', 8, 1),
(2, '2024-04-16 19:27:00.170042', '1', 'Готови конфигурации', 1, '[{\"added\": {}}]', 7, 1),
(3, '2024-04-16 19:27:16.636825', '2', 'Дънни платки', 1, '[{\"added\": {}}]', 7, 1),
(4, '2024-04-16 19:28:00.399305', '3', 'Процесори', 1, '[{\"added\": {}}]', 7, 1),
(5, '2024-04-16 19:28:13.545466', '4', 'Памети', 1, '[{\"added\": {}}]', 7, 1),
(6, '2024-04-16 19:28:27.444764', '5', 'Видеокарти', 1, '[{\"added\": {}}]', 7, 1),
(7, '2024-04-16 19:28:39.658684', '6', 'Охлаждане', 1, '[{\"added\": {}}]', 7, 1),
(8, '2024-04-16 19:28:53.595946', '7', 'Кутии', 1, '[{\"added\": {}}]', 7, 1),
(9, '2024-04-16 19:29:06.851905', '8', 'Други', 1, '[{\"added\": {}}]', 7, 1),
(10, '2024-04-16 19:29:35.509653', '2', 'Лаптопи', 1, '[{\"added\": {}}]', 8, 1),
(11, '2024-04-16 19:29:37.488795', '9', 'Dell', 1, '[{\"added\": {}}]', 7, 1),
(12, '2024-04-16 19:29:57.575048', '10', 'HP', 1, '[{\"added\": {}}]', 7, 1),
(13, '2024-04-16 19:30:12.218468', '11', 'Lenovo', 1, '[{\"added\": {}}]', 7, 1),
(14, '2024-04-16 19:30:27.568830', '12', 'Asus', 1, '[{\"added\": {}}]', 7, 1),
(15, '2024-04-16 19:30:39.844020', '13', 'Други', 1, '[{\"added\": {}}]', 7, 1),
(16, '2024-04-16 19:31:17.982949', '3', 'Монитори', 1, '[{\"added\": {}}]', 8, 1),
(17, '2024-04-16 19:31:21.046194', '14', '17\'\'', 1, '[{\"added\": {}}]', 7, 1),
(18, '2024-04-16 19:31:41.893742', '15', '19\'\'', 1, '[{\"added\": {}}]', 7, 1),
(19, '2024-04-16 19:31:54.830871', '16', '22\'\'', 1, '[{\"added\": {}}]', 7, 1),
(20, '2024-04-16 19:32:12.987805', '17', 'Други', 1, '[{\"added\": {}}]', 7, 1),
(21, '2024-04-16 19:32:41.847828', '4', 'Таблети и телефони', 1, '[{\"added\": {}}]', 8, 1),
(22, '2024-04-16 19:32:43.101813', '18', 'Телефони', 1, '[{\"added\": {}}]', 7, 1),
(23, '2024-04-16 19:32:56.788204', '19', 'Таблети', 1, '[{\"added\": {}}]', 7, 1),
(24, '2024-04-16 19:33:09.181273', '20', 'Аксесоари', 1, '[{\"added\": {}}]', 7, 1),
(25, '2024-04-17 00:57:10.848786', '1', 'Лаптоп 15\"', 1, '[{\"added\": {}}]', 9, 1),
(26, '2024-04-17 00:57:36.713520', '2', 'Лаптоп', 1, '[{\"added\": {}}]', 9, 1),
(27, '2024-04-17 00:58:14.651053', '3', 'Лаптоп', 1, '[{\"added\": {}}]', 9, 1),
(28, '2024-04-17 00:58:31.012399', '2', 'Лаптоп', 2, '[{\"changed\": {\"fields\": [\"\\u0421\\u043d\\u0438\\u043c\\u043a\\u0430\"]}}]', 9, 1),
(29, '2024-04-17 17:54:04.935745', '4', 'Дънна платка MSI A520M-A PRO, AM4, 2xDDR4, Micro-ATX', 1, '[{\"added\": {}}]', 9, 1),
(30, '2024-04-17 17:56:08.478798', '5', 'Дънна платка ASROCK A520M-HDV, Socket AM4, Micro ATX, 2 x DDR4', 1, '[{\"added\": {}}]', 9, 1),
(31, '2024-04-17 17:59:03.873531', '6', 'Дънна платка ASROCK H610M-HVS, Socket 1700, 2x DDR4, Micro ATX', 1, '[{\"added\": {}}]', 9, 1),
(32, '2024-04-17 18:01:06.860823', '7', 'Процесор AMD RYZEN 3 4100', 1, '[{\"added\": {}}]', 9, 1),
(33, '2024-04-17 18:02:58.573744', '8', 'Процесор AMD RYZEN 5 5500GT', 1, '[{\"added\": {}}]', 9, 1),
(34, '2024-04-17 18:09:53.206204', '9', 'Процесор Intel Comet Lake-S Core I7-10700KF', 1, '[{\"added\": {}}]', 9, 1),
(35, '2024-04-17 18:11:56.755692', '10', 'Zalman охладител за процесор', 1, '[{\"added\": {}}]', 9, 1),
(36, '2024-04-17 18:14:25.015546', '11', 'Arctic охладител за процесор', 1, '[{\"added\": {}}]', 9, 1),
(37, '2024-04-17 18:15:17.654483', '12', 'Охладител за процесор Arctic 34 eSports DUO', 1, '[{\"added\": {}}]', 9, 1),
(38, '2024-04-17 18:18:55.873347', '13', 'Памет Silicon Power 8GB DDR3L', 1, '[{\"added\": {}}]', 9, 1),
(39, '2024-04-17 18:21:41.389336', '14', 'Памет KINGST FURY BEAST 8GB, DDR4, 2666 MHz', 1, '[{\"added\": {}}]', 9, 1),
(40, '2024-04-17 18:23:13.096811', '15', 'Памет G.SKILL Aegis 16GB DDR4 PC4-24000 3000MHz', 1, '[{\"added\": {}}]', 9, 1),
(41, '2024-04-17 18:25:15.619832', '21', 'HDD', 1, '[{\"added\": {}}]', 7, 1),
(42, '2024-04-17 18:26:51.867103', '16', 'SSD ADATA SU650, 240GB, M.2 2280', 1, '[{\"added\": {}}]', 9, 1),
(43, '2024-04-17 18:28:08.244676', '17', 'SSD ADATA SU800, 512GB', 1, '[{\"added\": {}}]', 9, 1),
(44, '2024-04-17 18:30:10.848061', '18', 'Видео карта Gigabyte GeForce GT 710', 1, '[{\"added\": {}}]', 9, 1),
(45, '2024-04-17 18:31:40.852649', '19', 'Видео карта GIGABYTE Radeon RX 6500 XT', 1, '[{\"added\": {}}]', 9, 1),
(46, '2024-04-17 18:33:49.459878', '22', 'Захранване', 1, '[{\"added\": {}}]', 7, 1),
(47, '2024-04-17 18:34:01.161938', '20', 'Makki Захранване PSU ATX-400W', 1, '[{\"added\": {}}]', 9, 1),
(48, '2024-04-17 18:35:21.869906', '21', '1stPlayer захранване PSU 700W Bronze', 1, '[{\"added\": {}}]', 9, 1),
(49, '2024-04-17 18:38:16.463968', '22', 'AeroCool кутия Case ATX', 1, '[{\"added\": {}}]', 9, 1),
(50, '2024-04-17 18:40:52.612240', '23', 'Zalman кутия за компютър Case ATX', 1, '[{\"added\": {}}]', 9, 1),
(51, '2024-04-17 19:51:30.052539', '11', 'Arctic охладител за процесор', 2, '[{\"changed\": {\"fields\": [\"\\u0421\\u043d\\u0438\\u043c\\u043a\\u0430\"]}}]', 9, 1),
(52, '2024-04-18 01:14:09.283739', '23', '23\"', 1, '[{\"added\": {}}]', 7, 1),
(53, '2024-04-18 01:14:12.346949', '24', 'Lenovo ThinkVision S24e-20', 1, '[{\"added\": {}}]', 9, 1),
(54, '2024-04-18 01:16:38.195011', '25', 'HTC Desire 22 Pro 5G 128GB, Starry Night Black', 1, '[{\"added\": {}}]', 9, 1);

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
(7, 'main', 'category'),
(8, 'main', 'group'),
(9, 'main', 'item'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура на таблица `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-14 23:01:35.434153'),
(2, 'auth', '0001_initial', '2024-04-14 23:01:35.602303'),
(3, 'admin', '0001_initial', '2024-04-14 23:01:36.184276'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-14 23:01:36.311953'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-14 23:01:36.323325'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-14 23:01:36.454970'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-14 23:01:36.537618'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-04-14 23:01:36.556261'),
(9, 'auth', '0004_alter_user_username_opts', '2024-04-14 23:01:36.569978'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-04-14 23:01:36.632910'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-04-14 23:01:36.638428'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-14 23:01:36.651977'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-04-14 23:01:36.673978'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-14 23:01:36.696248'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-04-14 23:01:36.720480'),
(16, 'auth', '0011_update_proxy_permissions', '2024-04-14 23:01:36.734994'),
(17, 'sessions', '0001_initial', '2024-04-14 23:01:36.763933'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2024-04-15 23:22:56.185506'),
(19, 'main', '0001_initial', '2024-04-16 19:20:03.882843'),
(20, 'main', '0002_rename_brand_category_group', '2024-04-16 19:35:13.167816'),
(21, 'main', '0003_alter_category_group_item', '2024-04-17 00:49:05.304290');

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
('cbo00im7b8kt0oty42m6xg3y1dpy64ur', '.eJxVjDsOwjAQBe_iGln-fyjpOYO1Xq9xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWkq7MwkO_1uGfBBfQflDv02c5z7ukyZ7wo_6ODXudDzcrh_Bw1G-9aIKFAoUxVqS55yMNr7CFDJyVqFsVkJTzrqGHxEnauJ1XkrHBUZANj7A_G2OBE:1rwtWK:v3Mtl9lwgr3B6Sx0MTWWpsMdiw7mCwix_b3g5XDqbzE', '2024-05-01 00:51:28.207757'),
('dnbtw8tonp27j1s3z8kn820ajfg38bdx', '.eJxVjDsOwjAQBe_iGln-fyjpOYO1Xq9xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWkq7MwkO_1uGfBBfQflDv02c5z7ukyZ7wo_6ODXudDzcrh_Bw1G-9aIKFAoUxVqS55yMNr7CFDJyVqFsVkJTzrqGHxEnauJ1XkrHBUZANj7A_G2OBE:1rx9SA:sFkbCn2OOvFJiOfLmXMEbqriqwovg2AYp2_LK2QpTxE', '2024-05-01 17:52:14.363625'),
('i7uqbybnisnz0ug8mmcjwumsxtwv1f0t', '.eJxVjDsOwjAQBe_iGln-fyjpOYO1Xq9xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWkq7MwkO_1uGfBBfQflDv02c5z7ukyZ7wo_6ODXudDzcrh_Bw1G-9aIKFAoUxVqS55yMNr7CFDJyVqFsVkJTzrqGHxEnauJ1XkrHBUZANj7A_G2OBE:1rwoQu:taxQA3c7wS-w94bedZnXXIgD8tLuN8wNMlZ5_tPlhFQ', '2024-04-30 19:25:32.122639'),
('mjt58owps2fz3pqyaz1062ll89duf8o5', '.eJxVjDsOwjAQBe_iGln-fyjpOYO1Xq9xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWkq7MwkO_1uGfBBfQflDv02c5z7ukyZ7wo_6ODXudDzcrh_Bw1G-9aIKFAoUxVqS55yMNr7CFDJyVqFsVkJTzrqGHxEnauJ1XkrHBUZANj7A_G2OBE:1s9a3w:imPJDRy94et_fee8WLc2w0LEA9GAiWs_PN121ML5RX8', '2024-06-05 00:42:36.010158'),
('ucq9cdhn690y0zma13yrt0fkro1s1497', '.eJxVjDsOwjAQBe_iGln-fyjpOYO1Xq9xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWkq7MwkO_1uGfBBfQflDv02c5z7ukyZ7wo_6ODXudDzcrh_Bw1G-9aIKFAoUxVqS55yMNr7CFDJyVqFsVkJTzrqGHxEnauJ1XkrHBUZANj7A_G2OBE:1s6yi1:Vvd3rPChIlvUDI1vcwOOcUOZg8ydLSfuVdieXbqWA9Q', '2024-05-28 20:25:13.131706');

-- --------------------------------------------------------

--
-- Структура на таблица `main_category`
--

DROP TABLE IF EXISTS `main_category`;
CREATE TABLE `main_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `group_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_category`
--

INSERT INTO `main_category` (`id`, `name`, `group_id`) VALUES
(1, 'Готови конфигурации', 1),
(2, 'Дънни платки', 1),
(3, 'Процесори', 1),
(4, 'Памети', 1),
(5, 'Видеокарти', 1),
(6, 'Охлаждане', 1),
(7, 'Кутии', 1),
(8, 'Други', 1),
(9, 'Dell', 2),
(10, 'HP', 2),
(11, 'Lenovo', 2),
(12, 'Asus', 2),
(13, 'Други', 2),
(14, '17\'\'', 3),
(15, '19\'\'', 3),
(16, '22\'\'', 3),
(17, 'Други', 3),
(18, 'Телефони', 4),
(19, 'Таблети', 4),
(20, 'Аксесоари', 4),
(21, 'HDD', 1),
(22, 'Захранване', 1),
(23, '23\"', 3);

-- --------------------------------------------------------

--
-- Структура на таблица `main_group`
--

DROP TABLE IF EXISTS `main_group`;
CREATE TABLE `main_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_group`
--

INSERT INTO `main_group` (`id`, `name`) VALUES
(1, 'Компютри и компоненти'),
(2, 'Лаптопи'),
(3, 'Монитори'),
(4, 'Таблети и телефони');

-- --------------------------------------------------------

--
-- Структура на таблица `main_item`
--

DROP TABLE IF EXISTS `main_item`;
CREATE TABLE `main_item` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `new_item` tinyint(1) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_item`
--

INSERT INTO `main_item` (`id`, `name`, `description`, `price`, `new_item`, `photo`, `category_id`, `group_id`) VALUES
(1, 'Лаптоп 15\"', 'Процесор i7g10: RAM 16 Gb; SSD 1Tb; 15\" antiglare дисплей, 2 x 3.0 и 1 х 2.0 USB, HDMI, Audio, Video NVIDIA GEFORCE RTX', 1923.32, 1, 'items/product01.png', 9, 2),
(2, 'Лаптоп', 'Процесор i7g10: RAM 16 Gb; SSD 1Tb; 15\" antiglare дисплей, 2 x 3.0 и 1 х 2.0 USB, HDMI, Audio, Video NVIDIA GEFORCE RTX', 2000.00, 1, 'items/product06.png', 10, 2),
(3, 'Лаптоп', 'Процесор i7g10: RAM 16 Gb; SSD 1Tb; 15\" antiglare дисплей, 2 x 3.0 и 1 х 2.0 USB, HDMI, Audio, Video NVIDIA GEFORCE RTX', 1999.99, 1, 'items/product01_PpSOQEy.png', 11, 2),
(4, 'Дънна платка MSI A520M-A PRO, AM4, 2xDDR4, Micro-ATX', 'CPU`s supported: AM4\r\n\r\nMemory type: 2 x DDR4\r\n\r\nChipset: AMD A520M\r\n\r\nStorage: M.2\r\n\r\nAudio:  7.1 CH HD Audio (Realtek ALC897 Audio Codec)\r\n\r\nLAN: Gigabit LAN\r\n\r\nForm Factor: Micro ATX', 94.13, 1, 'items/msi-main-board-desktop-a520m-a-pro-a520-am4-2xddr4-1x-pci-e-3-0-x16-sl.jpg', 2, 1),
(5, 'Дънна платка ASROCK A520M-HDV, Socket AM4, Micro ATX, 2 x DDR4', 'CPU`s supported: - Supports AMD AM4\r\n\r\nChipset: - AMD A520\r\n\r\nMemory type: - 2 x DDR4\r\n\r\nAudio: - 7.1 CH HD Audio (Realtek ALC887 Audio Codec)\r\n\r\nLAN: - PCIE x1 Gigabit LAN 10/100/1000 Mb/s\r\n\r\nForm Factor: - Micro ATX, 23.0 cm x 20.1 cm', 121.22, 1, 'items/asrock-a520m-hdv-am4-1900900485.png', 2, 1),
(6, 'Дънна платка ASROCK H610M-HVS, Socket 1700, 2x DDR4, Micro ATX', 'CPU`s supported: LGA1700\r\n\r\nMemory type: 2 x DDR4\r\n\r\nChipset: Intel® H610\r\n\r\nStorage: M.2\r\n\r\nAudio:  7.1 CH HD Audio (Realtek ALC897/887 Audio Codec)\r\n\r\nLAN: Gigabit LAN\r\n\r\nForm Factor: Micro ATX', 134.18, 1, 'items/asrock-mb-desktop-h610m-hvs-s1700-2x-ddr4-1x-pcie-x16-1x-pcie-x1-4x-sa.jpg', 2, 1),
(7, 'Процесор AMD RYZEN 3 4100', 'Процесор AMD RYZEN 3 4100, AM4, 3.8GHZ, 4CORES,65W, BOX', 141.35, 1, 'items/amd-ryzen-3-4100-box.jpg', 3, 1),
(8, 'Процесор AMD RYZEN 5 5500GT', 'Процесор AMD RYZEN 5 5500GT3.6G, AM4, 4.4Ghz, BOX, FAN, 65W', 270.58, 1, 'items/amd-ryzen-5-5500gt3-6g-box.jpg', 3, 1),
(9, 'Процесор Intel Comet Lake-S Core I7-10700KF', 'Процесор Intel Comet Lake-S Core I7-10700KF 8 cores, 3.8Ghz (Up to 5.10Ghz), 16MB, 125W, LGA1200, BOX\r\n\r\n8 Cores / 16 Threads\r\nDiscrete GPU Required - No Integrated Graphics\r\nSocket Type LGA 1200\r\nUp to 5.1 GHz Unlocked\r\nCompatible with Intel 400 series chipset based motherboards\r\nIntel Turbo Boost Max Technology 3.0 Support\r\nIntel Optane Memory Support', 467.18, 1, 'items/protsesor-intel-comet-lake-s-core-i7-10700kf-8-cores-3-8ghz--736127489.jpg', 3, 1),
(10, 'Zalman охладител за процесор', 'Zalman охладител за процесор CPU Cooler CNPS10X PERFORMA WHITE', 79.26, 1, 'items/zalman-ohladitel-za-protsesor-cpu-cooler-cnps10x-performa-white.jpg', 6, 1),
(11, 'Arctic охладител за процесор', 'Arctic охладител за процесор CPU Cooler Alpine 23 - AM4', 15.23, 1, 'items/arctic-ohladitel-za-protsesor-cpu-cooler-alpine-23-am4.jpg', 6, 1),
(12, 'Охладител за процесор Arctic 34 eSports DUO', 'Охладител за процесор Arctic 34 Duo Red eSports, Intel/AMD\r\n\r\nMax. TDP:  200W\r\nВключени вентилатори:  2 x 120mm\r\n\r\nС мощен и оптимизиран за налягане BioniX P-вентилатор и неговия актуализиран термично покрит радиатор, Freezer 34 eSports предлага много възможности за добра цена. Във вътрешните тестове, изравнени до 28 dB (A), Freezer 34 eSports успя да надмине много конкуренти, дори много по-големи и по-скъпи решения за охлаждане с двойна кула.', 96.81, 1, 'items/ohladitel-za-protsesor-arctic-34-esports-duo-cherven-intel-amd.jpg', 6, 1),
(13, 'Памет Silicon Power 8GB DDR3L', 'Памет Silicon Power 8GB DDR3L PC3-12800 1600MHz CL11 SP008GLLTU160N02', 23.88, 1, 'items/pamet-silicon-power-8gb-ddr3l-pc3-12800-1600mhz-cl11-sp008glltu160n02.jpg', 4, 1),
(14, 'Памет KINGST FURY BEAST 8GB, DDR4, 2666 MHz', 'РАМ Памет KINGST FURY BEAST 8GB, DDR4, 2666 MHz', 46.62, 1, 'items/8g-ddr4-2666-kingst-fury-beast.jpg', 4, 1),
(15, 'Памет G.SKILL Aegis 16GB DDR4 PC4-24000 3000MHz', 'Памет G.SKILL Aegis 16GB DDR4 PC4-24000 3000MHz CL16 F4-3000C16S-16GISB', 74.54, 1, 'items/pamet-g-skill-aegis-16gb-ddr4-pc4-24000-3000mhz-cl16-f4-3000c16s-16gisb.png', 4, 1),
(16, 'SSD ADATA SU650, 240GB, M.2 2280', 'SSD ADATA SU650, 240GB, M.2 2280', 45.61, 1, 'items/adata-ssd-su650-240gb-m2-sata.jpg', 21, 1),
(17, 'SSD ADATA SU800, 512GB', 'Solid State Drive (SSD) ADATA SU800, 512GB, 3D NAND, SATA3 2.5\'\'', 113.59, 1, 'items/adata-ssd-su800-512gb-3d-nand.jpg', 21, 1),
(18, 'Видео карта Gigabyte GeForce GT 710', 'Видео карта Gigabyte GeForce GT 710, 2GB, GDDR5, 64 bit, D-Sub, DVI-D, HDMI\r\n\r\nФункции\r\nРазчита на мощта на графичния чип NVIDIA GeForce GT 710\r\nВграден 64-битов интерфейс за памет с 2GB GDDR5\r\nТактова честота на ядрото: 954 MHz\r\nИзходи Dual-link DVI-I / HDMI\r\nПоддържа шинния интерфейс PCI Express 2.0 x8\r\nПрепоръчвано електрозахранване на системата: 300 вата', 130.46, 1, 'items/video-karta-gigabyte-geforce-gt-710-2gb-gddr5-64-bit-d-sub-dvi-d-hdmi-.png', 5, 1),
(19, 'Видео карта GIGABYTE Radeon RX 6500 XT', 'Видео карта GIGABYTE Radeon RX 6500 XT GAMING OC 4GB, GDDR6', 402.56, 1, 'items/gb-r65xtgaming-oc-4gd.jpg', 5, 1),
(20, 'Makki Захранване PSU ATX-400W', 'Makki Захранване PSU ATX-400W MAKKI-ATX400-120', 28.49, 1, 'items/makki-zahranvane-psu-atx-400w-makki-atx400-120.jpg', 22, 1),
(21, '1stPlayer захранване PSU 700W Bronze', '1stPlayer захранване PSU 700W Bronze - PS-700AX', 92.86, 1, 'items/1stplayer-zahranvane-psu-700w-bronze-ps-700ax.jpg', 22, 1),
(22, 'AeroCool кутия Case ATX', 'AeroCool кутия Case ATX - Streak-A-BK-v1 RGB - ACCM-PV19012.11', 60.36, 1, 'items/aerocool-kutiya-case-atx-streak-a-bk-v1-rgb-accm-pv19012-11_1.jpg', 7, 1),
(23, 'Zalman кутия за компютър Case ATX', 'Zalman кутия за компютър Case ATX - N5 MF - 4 x 120mm Fixed RGB', 105.97, 1, 'items/zalman-kutiya-za-kompyutar-case-atx-n5-mf-4-x-120mm-fixed-rgb.jpg', 7, 1),
(24, 'Lenovo ThinkVision S24e-20', '23.8\" VA\r\n1920x1080 Full HD\r\n72% NTSC\r\nHDMI\r\nAMD FreeSync™', 169.00, 1, 'items/lenovo_thinkvision_s24e20.jpg', 23, 3),
(25, 'HTC Desire 22 Pro 5G 128GB, Starry Night Black', '6.6“ IPS 120Hz\r\n8GB RAM / 128GB\r\n4520mAh батерия\r\n64MP камера\r\nAndroid 10', 539.00, 1, 'items/starry_night_black.jpg', 18, 4);

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
-- Индекси за таблица `main_category`
--
ALTER TABLE `main_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_category_group_id_9ad6fe45_fk_main_group_id` (`group_id`);

--
-- Индекси за таблица `main_group`
--
ALTER TABLE `main_group`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `main_item`
--
ALTER TABLE `main_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_item_category_id_b10a4096_fk_main_category_id` (`category_id`),
  ADD KEY `main_item_group_id_a0e691c8_fk_main_group_id` (`group_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `main_category`
--
ALTER TABLE `main_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `main_group`
--
ALTER TABLE `main_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `main_item`
--
ALTER TABLE `main_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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

--
-- Ограничения за таблица `main_category`
--
ALTER TABLE `main_category`
  ADD CONSTRAINT `main_category_group_id_9ad6fe45_fk_main_group_id` FOREIGN KEY (`group_id`) REFERENCES `main_group` (`id`);

--
-- Ограничения за таблица `main_item`
--
ALTER TABLE `main_item`
  ADD CONSTRAINT `main_item_category_id_b10a4096_fk_main_category_id` FOREIGN KEY (`category_id`) REFERENCES `main_category` (`id`),
  ADD CONSTRAINT `main_item_group_id_a0e691c8_fk_main_group_id` FOREIGN KEY (`group_id`) REFERENCES `main_group` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
