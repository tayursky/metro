-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 20 2017 г., 00:15
-- Версия сервера: 5.7.18-15-beget-5.7.18-15-2-3-log
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `socani9r_metro`
--

-- --------------------------------------------------------

--
-- Структура таблицы `account_emailaddress`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `account_emailconfirmation`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add permission', 4, 'add_permission'),
(11, 'Can change permission', 4, 'change_permission'),
(12, 'Can delete permission', 4, 'delete_permission'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add email address', 8, 'add_emailaddress'),
(23, 'Can change email address', 8, 'change_emailaddress'),
(24, 'Can delete email address', 8, 'delete_emailaddress'),
(25, 'Can add email confirmation', 9, 'add_emailconfirmation'),
(26, 'Can change email confirmation', 9, 'change_emailconfirmation'),
(27, 'Can delete email confirmation', 9, 'delete_emailconfirmation'),
(28, 'Can add Назначение', 10, 'add_naznach'),
(29, 'Can change Назначение', 10, 'change_naznach'),
(30, 'Can delete Назначение', 10, 'delete_naznach'),
(31, 'Can add Округ', 11, 'add_okrug'),
(32, 'Can change Округ', 11, 'change_okrug'),
(33, 'Can delete Округ', 11, 'delete_okrug'),
(34, 'Can add Клиент', 12, 'add_client'),
(35, 'Can change Клиент', 12, 'change_client'),
(36, 'Can delete Клиент', 12, 'delete_client'),
(37, 'Can add Задача клиента', 13, 'add_taskclient'),
(38, 'Can change Задача клиента', 13, 'change_taskclient'),
(39, 'Can delete Задача клиента', 13, 'delete_taskclient'),
(40, 'Can add Стация метро', 14, 'add_stancmetro'),
(41, 'Can change Стация метро', 14, 'change_stancmetro'),
(42, 'Can delete Стация метро', 14, 'delete_stancmetro'),
(43, 'Can add Объект', 15, 'add_myobject'),
(44, 'Can change Объект', 15, 'change_myobject'),
(45, 'Can delete Объект', 15, 'delete_myobject'),
(46, 'Can add Настроки прав', 16, 'add_menageroptions'),
(47, 'Can change Настроки прав', 16, 'change_menageroptions'),
(48, 'Can delete Настроки прав', 16, 'delete_menageroptions'),
(49, 'Can add Настрока сайта\\SEO', 17, 'add_seo'),
(50, 'Can change Настрока сайта\\SEO', 17, 'change_seo'),
(51, 'Can delete Настрока сайта\\SEO', 17, 'delete_seo'),
(52, 'Can add Настройки циан', 18, 'add_cian'),
(53, 'Can change Настройки циан', 18, 'change_cian'),
(54, 'Can delete Настройки циан', 18, 'delete_cian');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$30000$QctcuC75dbvt$mYUeKCS6A/7M9U7Wpzzb4OqLGvMRqCD7iJIl7qXYmao=', '2017-06-10 17:32:38.391831', 1, 'DJWOMS', '', '', 'l2maximum@mail.ru', 1, 1, '2017-05-05 01:55:25.292808'),
(2, 'pbkdf2_sha256$30000$eCKWzSni7DRH$Ex4PS9H7gNwrBDourmB9ud8jsP2+MfQGTFxBckqJNQQ=', '2017-05-05 12:44:23.000000', 0, 'admin', '', '', '', 1, 1, '2017-05-05 02:14:50.000000'),
(3, 'pbkdf2_sha256$30000$VxVQdL3zyna5$sECZiZg/EeJvYqMNx3Np/VMtAThh1xfYD/hV6jPVlOk=', '2017-05-15 10:47:02.559073', 0, 'superadmin', '', '', '', 1, 1, '2017-05-11 22:03:18.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14),
(15, 2, 15),
(16, 2, 16),
(17, 2, 17),
(18, 2, 18),
(25, 2, 25),
(26, 2, 26),
(27, 2, 27),
(28, 2, 28),
(29, 2, 29),
(30, 2, 30),
(31, 2, 31),
(32, 2, 32),
(33, 2, 33),
(34, 2, 34),
(35, 2, 35),
(36, 2, 36),
(37, 2, 37),
(38, 2, 38),
(39, 2, 39),
(40, 2, 40),
(41, 2, 41),
(42, 2, 42),
(43, 2, 43),
(44, 2, 44),
(45, 2, 45),
(46, 2, 46),
(47, 2, 47),
(48, 2, 48),
(49, 2, 49),
(50, 2, 50),
(51, 2, 51),
(52, 2, 52),
(53, 2, 53),
(54, 2, 54),
(55, 3, 1),
(56, 3, 2),
(57, 3, 3),
(58, 3, 4),
(59, 3, 5),
(60, 3, 6),
(61, 3, 7),
(62, 3, 8),
(63, 3, 9),
(64, 3, 10),
(65, 3, 11),
(66, 3, 12),
(67, 3, 13),
(68, 3, 14),
(69, 3, 15),
(70, 3, 16),
(71, 3, 17),
(72, 3, 18),
(73, 3, 25),
(74, 3, 26),
(75, 3, 27),
(76, 3, 28),
(77, 3, 29),
(78, 3, 30),
(79, 3, 31),
(80, 3, 32),
(81, 3, 33),
(82, 3, 34),
(83, 3, 35),
(84, 3, 36),
(85, 3, 37),
(86, 3, 38),
(87, 3, 39),
(88, 3, 40),
(89, 3, 41),
(90, 3, 42),
(91, 3, 43),
(92, 3, 44),
(93, 3, 45),
(94, 3, 46),
(95, 3, 47),
(96, 3, 48),
(97, 3, 49),
(98, 3, 50),
(99, 3, 51),
(100, 3, 52),
(101, 3, 53),
(102, 3, 54);

-- --------------------------------------------------------

--
-- Структура таблицы `cian`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `cian`;
CREATE TABLE `cian` (
  `id` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `tel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cian`
--

INSERT INTO `cian` (`id`, `login`, `password`, `tel`) VALUES
(1, '72364', '785585260', '4955858231');

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `hide` varchar(30) NOT NULL,
  `area_ot` int(11) NOT NULL,
  `area_do` int(11) NOT NULL,
  `price_obsh` int(11) NOT NULL,
  `price_m` int(11) NOT NULL,
  `dop_kont` longtext NOT NULL,
  `metro` tinyint(1) NOT NULL,
  `adres` tinyint(1) NOT NULL,
  `komisiya` tinyint(1) NOT NULL,
  `etaj` tinyint(1) NOT NULL,
  `podborka` tinyint(1) NOT NULL,
  `type_obj` varchar(30) NOT NULL,
  `my_manager_id` int(11) NOT NULL,
  `naznach_one_id` int(11) NOT NULL,
  `naznach_two_id` int(11) DEFAULT NULL,
  `hide_date` date
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id`, `name`, `tel`, `email`, `hide`, `area_ot`, `area_do`, `price_obsh`, `price_m`, `dop_kont`, `metro`, `adres`, `komisiya`, `etaj`, `podborka`, `type_obj`, `my_manager_id`, `naznach_one_id`, `naznach_two_id`, `hide_date`) VALUES
(1, 'Иванов Иван', '+380957506112', 'socanime@gmail.com', '0', 10, 30, 3000, 7000, 'Доп. информация', 1, 0, 1, 0, 1, 'undeg', 2, 1, 5, '1970-01-01'),
(2, 'Гледов Иван', '+380957506112', 'l2maximum@mail.ru', '0', 10, 30, 3000, 7000, 'Доп. информация', 1, 0, 1, 0, 1, 'undeg', 2, 1, 5, '1970-01-01'),
(3, 'Ирина Волкова', '+380957506112', 'djwoms@mail.ru', '0', 10, 30, 3000, 7000, 'Доп. информация', 1, 0, 1, 0, 1, 'undeg', 2, 6, 7, '1970-01-01');

-- --------------------------------------------------------

--
-- Структура таблицы `client_okrug`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `client_okrug`;
CREATE TABLE `client_okrug` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `okrug_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client_okrug`
--

INSERT INTO `client_okrug` (`id`, `client_id`, `okrug_id`) VALUES
(1, 2, 3),
(2, 2, 5),
(3, 3, 3),
(4, 3, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-05-05 02:14:50.986748', '2', 'admin', 1, '[{\"added\": {}}]', 3, 1),
(2, '2017-05-05 02:15:11.865925', '2', 'admin', 2, '[{\"changed\": {\"fields\": [\"is_staff\"]}}]', 3, 1),
(3, '2017-05-05 02:16:13.011400', '1', 'Юг', 1, '[{\"added\": {}}]', 11, 1),
(4, '2017-05-05 02:16:17.155639', '2', 'Север', 1, '[{\"added\": {}}]', 11, 1),
(5, '2017-05-05 02:16:21.239904', '3', 'Запад', 1, '[{\"added\": {}}]', 11, 1),
(6, '2017-05-05 02:16:25.515896', '4', 'Восток', 1, '[{\"added\": {}}]', 11, 1),
(7, '2017-05-05 02:16:30.042932', '5', 'Центер', 1, '[{\"added\": {}}]', 11, 1),
(8, '2017-05-05 02:16:47.345368', '6', 'Область', 1, '[{\"added\": {}}]', 11, 1),
(9, '2017-05-05 02:17:13.824740', '1', 'Колбаса', 1, '[{\"added\": {}}]', 10, 1),
(10, '2017-05-05 02:17:44.529933', '2', 'Молоко', 1, '[{\"added\": {}}]', 10, 1),
(11, '2017-05-05 02:17:50.677548', '3', 'Табак', 1, '[{\"added\": {}}]', 10, 1),
(12, '2017-05-05 02:18:00.718106', '4', 'Кондитерка', 1, '[{\"added\": {}}]', 10, 1),
(13, '2017-05-05 02:18:06.368174', '5', 'Мясо', 1, '[{\"added\": {}}]', 10, 1),
(14, '2017-05-05 02:18:18.254843', '6', 'Фрукты\\Овощи', 1, '[{\"added\": {}}]', 10, 1),
(15, '2017-05-05 02:18:28.001067', '7', 'Кулинария', 1, '[{\"added\": {}}]', 10, 1),
(16, '2017-05-05 02:18:39.106332', '8', 'Пиво\\Алкоголь', 1, '[{\"added\": {}}]', 10, 1),
(17, '2017-05-05 02:18:43.037032', '9', 'Хлеб', 1, '[{\"added\": {}}]', 10, 1),
(18, '2017-05-05 02:18:55.753575', '10', 'Магазин продуктов', 1, '[{\"added\": {}}]', 10, 1),
(19, '2017-05-05 02:19:04.679910', '11', 'Рыба\\Икра', 1, '[{\"added\": {}}]', 10, 1),
(20, '2017-05-05 02:19:12.526380', '12', 'Чай и другое', 1, '[{\"added\": {}}]', 10, 1),
(21, '2017-05-05 02:19:24.333682', '13', 'Выпечка и подобное', 1, '[{\"added\": {}}]', 10, 1),
(22, '2017-05-05 02:19:35.210730', '14', 'Кофе с собой', 1, '[{\"added\": {}}]', 10, 1),
(23, '2017-05-05 02:19:51.640549', '15', 'Рестораны и другое', 1, '[{\"added\": {}}]', 10, 1),
(24, '2017-05-05 02:20:14.342547', '16', 'Шаурма\\Тандыр', 1, '[{\"added\": {}}]', 10, 1),
(25, '2017-05-05 02:20:32.380205', '17', 'Аптека\\Оптика', 1, '[{\"added\": {}}]', 10, 1),
(26, '2017-05-05 02:21:25.937641', '18', 'Офис\\Мед. Услуги\\Салон кр.', 1, '[{\"added\": {}}]', 10, 1),
(27, '2017-05-05 02:21:34.466809', '19', 'Промтовары', 1, '[{\"added\": {}}]', 10, 1),
(28, '2017-05-05 02:21:57.774699', '20', 'Ломбард\\Банк. Услуги', 1, '[{\"added\": {}}]', 10, 1),
(29, '2017-05-05 02:22:11.872109', '21', 'Ремонт\\Быт. Услуги', 1, '[{\"added\": {}}]', 10, 1),
(30, '2017-05-05 02:22:24.141828', '22', 'Одежда\\Обувь', 1, '[{\"added\": {}}]', 10, 1),
(31, '2017-05-05 02:22:30.891400', '23', 'Цветы', 1, '[{\"added\": {}}]', 10, 1),
(32, '2017-05-05 02:22:41.506610', '24', 'Другое', 1, '[{\"added\": {}}]', 10, 1),
(33, '2017-05-11 21:56:53.198440', '1', 'admin', 1, '[{\"added\": {}}]', 16, 1),
(34, '2017-05-11 21:57:27.167977', '1', 'SEO настройки Аренда у метро, аренда торговых площадей, аренда под магазин, аренда в метро, аренда отдела', 1, '[{\"added\": {}}]', 17, 1),
(35, '2017-05-11 21:58:08.779978', '1', '72364', 1, '[{\"added\": {}}]', 18, 1),
(36, '2017-05-11 21:59:39.110006', '2', 'admin', 2, '[]', 3, 1),
(37, '2017-05-11 22:03:18.386794', '3', 'superadmin', 1, '[{\"added\": {}}]', 3, 1),
(38, '2017-05-11 22:04:12.306640', '3', 'superadmin', 2, '[{\"changed\": {\"fields\": [\"is_staff\"]}}]', 3, 1),
(39, '2017-05-11 22:04:35.415132', '2', 'superadmin', 2, '[{\"changed\": {\"fields\": [\"tel\", \"tel_vlad\", \"del_obj\", \"edit_obj\", \"look\"]}}]', 16, 1),
(40, '2017-05-15 10:51:13.467096', '1', 'Сокольники', 1, '[{\"added\": {}}]', 14, 3),
(41, '2017-05-15 10:51:51.140059', '5', 'Центр', 2, '[{\"changed\": {\"fields\": [\"options\"]}}]', 11, 3),
(42, '2017-05-15 12:46:04.108927', '6', 'Область', 2, '[]', 11, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'account', 'emailaddress'),
(9, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(4, 'auth', 'permission'),
(3, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'myclient', 'client'),
(10, 'myclient', 'naznach'),
(11, 'myclient', 'okrug'),
(13, 'myclient', 'taskclient'),
(15, 'myobject', 'myobject'),
(14, 'myobject', 'stancmetro'),
(18, 'seo', 'cian'),
(16, 'seo', 'menageroptions'),
(17, 'seo', 'seo'),
(6, 'sessions', 'session'),
(7, 'sites', 'site');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-05-05 01:48:49.148328'),
(2, 'auth', '0001_initial', '2017-05-05 01:48:52.617181'),
(3, 'account', '0001_initial', '2017-05-05 01:48:53.526493'),
(4, 'account', '0002_email_max_length', '2017-05-05 01:48:53.556699'),
(5, 'admin', '0001_initial', '2017-05-05 01:48:54.341642'),
(6, 'admin', '0002_logentry_remove_auto_add', '2017-05-05 01:48:54.364341'),
(7, 'contenttypes', '0002_remove_content_type_name', '2017-05-05 01:48:54.484453'),
(8, 'auth', '0002_alter_permission_name_max_length', '2017-05-05 01:48:54.518434'),
(9, 'auth', '0003_alter_user_email_max_length', '2017-05-05 01:48:54.549410'),
(10, 'auth', '0004_alter_user_username_opts', '2017-05-05 01:48:54.562590'),
(11, 'auth', '0005_alter_user_last_login_null', '2017-05-05 01:48:54.600755'),
(12, 'auth', '0006_require_contenttypes_0002', '2017-05-05 01:48:54.602096'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2017-05-05 01:48:54.615237'),
(14, 'auth', '0008_alter_user_username_max_length', '2017-05-05 01:48:54.645555'),
(15, 'sessions', '0001_initial', '2017-05-05 01:48:54.955294'),
(16, 'sites', '0001_initial', '2017-05-05 01:48:55.221029'),
(17, 'sites', '0002_alter_domain_unique', '2017-05-05 01:48:55.272815'),
(18, 'myclient', '0001_initial', '2017-05-05 01:51:18.735460'),
(19, 'myclient', '0002_auto_20170504_0052', '2017-05-05 01:51:18.775114'),
(20, 'myclient', '0003_auto_20170504_0055', '2017-05-05 01:51:18.796515'),
(21, 'myclient', '0004_auto_20170504_0058', '2017-05-05 01:51:18.820370'),
(22, 'myclient', '0005_auto_20170504_0103', '2017-05-05 01:51:18.838747'),
(23, 'myclient', '0006_auto_20170504_0109', '2017-05-05 01:51:18.923313'),
(24, 'myclient', '0007_auto_20170504_0118', '2017-05-05 01:51:20.271140'),
(25, 'myclient', '0008_auto_20170504_0455', '2017-05-05 01:51:20.546889'),
(26, 'myclient', '0009_auto_20170505_0135', '2017-05-05 01:51:21.282059'),
(27, 'myclient', '0010_auto_20170505_0229', '2017-05-05 01:51:21.322040'),
(28, 'myobject', '0001_initial', '2017-05-11 21:54:26.774681'),
(29, 'seo', '0001_initial', '2017-05-11 21:54:28.028637'),
(30, 'seo', '0002_cian', '2017-05-11 21:54:28.426147');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('6t64bdtwwwm6mki6hddhyds7uudh00b8', 'NGQxZjI5ZjBhMGY1MmFiYTdiZDc2YjYzMWVmZThlZjNhZjY4NzFmMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJfYXV0aF91c2VyX2hhc2giOiIzODgwMWU2ODdmM2JmNjU5YTE2NmZlNmExYjExZjI2MDYyNmI0YmVhIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2017-05-19 09:28:21.877828'),
('dwar8actuw68e7mowzz0ma4zmeqtsw8z', 'YTBhYjU2YmUwZjE0YTI1MmRkYWMzYjc2Y2QyZGUyYzYyM2M2MTVjNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzMTA0N2U3ZTY3MWUzZTFhMTIyMmVhZmZlM2M0NDY4ZTQzNzcyMGIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2017-06-24 17:32:38.409091'),
('hnpjl9gh393aygda0j37i4zi69roelhl', 'YzE4MDZiYTk1YjAyOGQ4NjU2OGRmMmZmM2ExNGQ5OWExMTVmNjk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTVkMGFmMWZkODIwNDZhZDE2NmViZjUzYWZhOGFkOWVmZDNiZDRiZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-05-25 22:29:35.816691'),
('mfudkc0po6lt8etqfwa60n0k23q0hhuv', 'Y2JmZmMzNzk2Nzc1MDkzODk0MzkwNGYxYzQ4MjlmOWU3OWVmZjhjZDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE1ZDBhZjFmZDgyMDQ2YWQxNjZlYmY1M2FmYThhZDllZmQzYmQ0YmQifQ==', '2017-05-29 10:47:02.564892'),
('w5h209myktd8tjuxle1wa7iiz7nudqea', 'NzI1ZjcwZDQxZDVjODU4MDA5MjE4NDk2NDUxYWY4Y2Y4ZGU3ZDA5NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE1ZDBhZjFmZDgyMDQ2YWQxNjZlYmY1M2FmYThhZDllZmQzYmQ0YmQiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjoxMjA5NjAwfQ==', '2017-05-26 16:13:23.896160');

-- --------------------------------------------------------

--
-- Структура таблицы `django_site`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Структура таблицы `manager_options`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `manager_options`;
CREATE TABLE `manager_options` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `tel_vlad` tinyint(1) NOT NULL,
  `del_obj` tinyint(1) NOT NULL,
  `edit_obj` tinyint(1) NOT NULL,
  `look` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `manager_options`
--

INSERT INTO `manager_options` (`id`, `name`, `tel`, `tel_vlad`, `del_obj`, `edit_obj`, `look`, `user_id`) VALUES
(1, 'Миша', '+380957506112', 1, 1, 1, 1, 2),
(2, 'superadmin', '+380957506112', 1, 1, 1, 1, 3),
(3, 'DJWOMS', '', 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `metro`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `metro`;
CREATE TABLE `metro` (
  `id` int(11) NOT NULL,
  `color` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `metro`
--

INSERT INTO `metro` (`id`, `color`, `name`) VALUES
(1, 'Сокольническая', 'Сокольники');

-- --------------------------------------------------------

--
-- Структура таблицы `metro_okrug`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `metro_okrug`;
CREATE TABLE `metro_okrug` (
  `id` int(11) NOT NULL,
  `stancmetro_id` int(11) NOT NULL,
  `okrug_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `metro_okrug`
--

INSERT INTO `metro_okrug` (`id`, `stancmetro_id`, `okrug_id`) VALUES
(1, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `naznach`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `naznach`;
CREATE TABLE `naznach` (
  `id` int(11) NOT NULL,
  `group` varchar(30) NOT NULL,
  `options` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `naznach`
--

INSERT INTO `naznach` (`id`, `group`, `options`) VALUES
(1, 'Продукты', 'Колбаса'),
(2, 'Продукты', 'Молоко'),
(3, 'Продукты', 'Табак'),
(4, 'Продукты', 'Кондитерка'),
(5, 'Продукты', 'Мясо'),
(6, 'Продукты', 'Фрукты\\Овощи'),
(7, 'Продукты', 'Кулинария'),
(8, 'Продукты', 'Пиво\\Алкоголь'),
(9, 'Продукты', 'Хлеб'),
(10, 'Продукты', 'Магазин продуктов'),
(11, 'Продукты', 'Рыба\\Икра'),
(12, 'Продукты', 'Чай и другое'),
(13, 'Общепит', 'Выпечка и подобное'),
(14, 'Общепит', 'Кофе с собой'),
(15, 'Общепит', 'Рестораны и другое'),
(16, 'Общепит', 'Шаурма\\Тандыр'),
(17, 'Другое', 'Аптека\\Оптика'),
(18, 'Другое', 'Офис\\Мед. Услуги\\Салон кр.'),
(19, 'Другое', 'Промтовары'),
(20, 'Другое', 'Ломбард\\Банк. Услуги'),
(21, 'Другое', 'Ремонт\\Быт. Услуги'),
(22, 'Другое', 'Одежда\\Обувь'),
(23, 'Другое', 'Цветы'),
(24, 'Другое', 'Другое');

-- --------------------------------------------------------

--
-- Структура таблицы `object`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `object`;
CREATE TABLE `object` (
  `id` int(11) NOT NULL,
  `typeobj` varchar(30) NOT NULL,
  `adres` varchar(100) NOT NULL,
  `area` int(11) NOT NULL,
  `block_area` double NOT NULL,
  `block_price` double NOT NULL,
  `block_procent` double NOT NULL,
  `etaj` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `opis` longtext NOT NULL,
  `dom` tinyint(1) NOT NULL,
  `kvt` varchar(50) NOT NULL,
  `dogovor` varchar(50) NOT NULL,
  `block_name` varchar(20) NOT NULL,
  `block_tel` varchar(20) NOT NULL,
  `block_email` varchar(30) NOT NULL,
  `silka` varchar(200) NOT NULL,
  `zametka` longtext NOT NULL,
  `hide` varchar(30) NOT NULL,
  `hide_date` date DEFAULT NULL,
  `zvon` date NOT NULL,
  `my_manager_id` int(11) NOT NULL,
  `station_one_id` int(11) NOT NULL,
  `station_two_id` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `object_naznach`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `object_naznach`;
CREATE TABLE `object_naznach` (
  `id` int(11) NOT NULL,
  `myobject_id` int(11) NOT NULL,
  `naznach_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `object_okrug`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `object_okrug`;
CREATE TABLE `object_okrug` (
  `id` int(11) NOT NULL,
  `myobject_id` int(11) NOT NULL,
  `okrug_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `okrug`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `okrug`;
CREATE TABLE `okrug` (
  `id` int(11) NOT NULL,
  `options` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `okrug`
--

INSERT INTO `okrug` (`id`, `options`) VALUES
(1, 'Юг'),
(2, 'Север'),
(3, 'Запад'),
(4, 'Восток'),
(5, 'Центр'),
(6, 'Область');

-- --------------------------------------------------------

--
-- Структура таблицы `seo`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `seo`;
CREATE TABLE `seo` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `desc` longtext NOT NULL,
  `keywords` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `seo`
--

INSERT INTO `seo` (`id`, `title`, `desc`, `keywords`) VALUES
(1, 'Аренда у метро, аренда торговых площадей, аренда под магазин, аренда в метро, аренда отдела', 'Аренда у метро, аренда торговых площадей, аренда под магазин, аренда в метро, аренда отдела', 'аренда павильонов, аренда торговых павильонов, аренда торговых площадей, аренда торговых, аренда торговых помещений, торговое помещение в аренду, павильон в аренду, аренда торгового помещения, помещения в аренду, торговая аренда, аренда под магазин, аренда в подземных переходах, аренда в метро');

-- --------------------------------------------------------

--
-- Структура таблицы `task_client`
--
-- Создание: Май 21 2017 г., 01:07
--

DROP TABLE IF EXISTS `task_client`;
CREATE TABLE `task_client` (
  `id` int(11) NOT NULL,
  `prioritet` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `task` longtext NOT NULL,
  `client_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`);

--
-- Индексы таблицы `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` (`email_address_id`);

--
-- Индексы таблицы `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`);

--
-- Индексы таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индексы таблицы `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индексы таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`);

--
-- Индексы таблицы `cian`
--
ALTER TABLE `cian`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_my_manager_id_530baa61_fk_auth_user_id` (`my_manager_id`),
  ADD KEY `client_naznach_one_id_ba98bc63_fk_naznach_id` (`naznach_one_id`),
  ADD KEY `client_naznach_two_id_ad3a4e5a_fk_naznach_id` (`naznach_two_id`);

--
-- Индексы таблицы `client_okrug`
--
ALTER TABLE `client_okrug`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_okrug_client_id_1fb4d33b_uniq` (`client_id`,`okrug_id`),
  ADD KEY `client_okrug_okrug_id_5841394a_fk_okrug_id` (`okrug_id`);

--
-- Индексы таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индексы таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индексы таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Индексы таблицы `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Индексы таблицы `manager_options`
--
ALTER TABLE `manager_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Индексы таблицы `metro`
--
ALTER TABLE `metro`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `metro_okrug`
--
ALTER TABLE `metro_okrug`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `metro_okrug_stancmetro_id_19f018d2_uniq` (`stancmetro_id`,`okrug_id`),
  ADD KEY `metro_okrug_okrug_id_48f02f1d_fk_okrug_id` (`okrug_id`);

--
-- Индексы таблицы `naznach`
--
ALTER TABLE `naznach`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_my_manager_id_2f5979b5_fk_auth_user_id` (`my_manager_id`),
  ADD KEY `object_station_one_id_fcf868d5_fk_metro_id` (`station_one_id`),
  ADD KEY `object_station_two_id_5c716354_fk_metro_id` (`station_two_id`);

--
-- Индексы таблицы `object_naznach`
--
ALTER TABLE `object_naznach`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_naznach_myobject_id_8d65e6bb_uniq` (`myobject_id`,`naznach_id`),
  ADD KEY `object_naznach_naznach_id_b2ca4760_fk_naznach_id` (`naznach_id`);

--
-- Индексы таблицы `object_okrug`
--
ALTER TABLE `object_okrug`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_okrug_myobject_id_5e901da1_uniq` (`myobject_id`,`okrug_id`),
  ADD KEY `object_okrug_okrug_id_bde21601_fk_okrug_id` (`okrug_id`);

--
-- Индексы таблицы `okrug`
--
ALTER TABLE `okrug`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `task_client`
--
ALTER TABLE `task_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_client_client_id_7a28e174_fk_client_id` (`client_id`),
  ADD KEY `task_client_manager_id_044d843b_fk_auth_user_id` (`manager_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT для таблицы `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT для таблицы `cian`
--
ALTER TABLE `cian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `client_okrug`
--
ALTER TABLE `client_okrug`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `manager_options`
--
ALTER TABLE `manager_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `metro`
--
ALTER TABLE `metro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `metro_okrug`
--
ALTER TABLE `metro_okrug`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `naznach`
--
ALTER TABLE `naznach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT для таблицы `object`
--
ALTER TABLE `object`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `object_naznach`
--
ALTER TABLE `object_naznach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `object_okrug`
--
ALTER TABLE `object_okrug`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `okrug`
--
ALTER TABLE `okrug`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `seo`
--
ALTER TABLE `seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `task_client`
--
ALTER TABLE `task_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_my_manager_id_530baa61_fk_auth_user_id` FOREIGN KEY (`my_manager_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `client_naznach_one_id_ba98bc63_fk_naznach_id` FOREIGN KEY (`naznach_one_id`) REFERENCES `naznach` (`id`),
  ADD CONSTRAINT `client_naznach_two_id_ad3a4e5a_fk_naznach_id` FOREIGN KEY (`naznach_two_id`) REFERENCES `naznach` (`id`);

--
-- Ограничения внешнего ключа таблицы `client_okrug`
--
ALTER TABLE `client_okrug`
  ADD CONSTRAINT `client_okrug_client_id_16a0bcc5_fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `client_okrug_okrug_id_5841394a_fk_okrug_id` FOREIGN KEY (`okrug_id`) REFERENCES `okrug` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `manager_options`
--
ALTER TABLE `manager_options`
  ADD CONSTRAINT `manager_options_user_id_46e7b9d8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `metro_okrug`
--
ALTER TABLE `metro_okrug`
  ADD CONSTRAINT `metro_okrug_okrug_id_48f02f1d_fk_okrug_id` FOREIGN KEY (`okrug_id`) REFERENCES `okrug` (`id`),
  ADD CONSTRAINT `metro_okrug_stancmetro_id_68328e2e_fk_metro_id` FOREIGN KEY (`stancmetro_id`) REFERENCES `metro` (`id`);

--
-- Ограничения внешнего ключа таблицы `object`
--
ALTER TABLE `object`
  ADD CONSTRAINT `object_my_manager_id_2f5979b5_fk_auth_user_id` FOREIGN KEY (`my_manager_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `object_station_one_id_fcf868d5_fk_metro_id` FOREIGN KEY (`station_one_id`) REFERENCES `metro` (`id`),
  ADD CONSTRAINT `object_station_two_id_5c716354_fk_metro_id` FOREIGN KEY (`station_two_id`) REFERENCES `metro` (`id`);

--
-- Ограничения внешнего ключа таблицы `object_naznach`
--
ALTER TABLE `object_naznach`
  ADD CONSTRAINT `object_naznach_myobject_id_80f3af66_fk_object_id` FOREIGN KEY (`myobject_id`) REFERENCES `object` (`id`),
  ADD CONSTRAINT `object_naznach_naznach_id_b2ca4760_fk_naznach_id` FOREIGN KEY (`naznach_id`) REFERENCES `naznach` (`id`);

--
-- Ограничения внешнего ключа таблицы `object_okrug`
--
ALTER TABLE `object_okrug`
  ADD CONSTRAINT `object_okrug_myobject_id_d511a1e6_fk_object_id` FOREIGN KEY (`myobject_id`) REFERENCES `object` (`id`),
  ADD CONSTRAINT `object_okrug_okrug_id_bde21601_fk_okrug_id` FOREIGN KEY (`okrug_id`) REFERENCES `okrug` (`id`);

--
-- Ограничения внешнего ключа таблицы `task_client`
--
ALTER TABLE `task_client`
  ADD CONSTRAINT `task_client_client_id_7a28e174_fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `task_client_manager_id_044d843b_fk_auth_user_id` FOREIGN KEY (`manager_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
