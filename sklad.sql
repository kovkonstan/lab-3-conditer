-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Янв 21 2021 г., 10:59
-- Версия сервера: 10.4.17-MariaDB
-- Версия PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sklad`
--

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `type_id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `count` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`id`, `type_id`, `name`, `date`, `count`) VALUES
(19, 11, 'Торт \"Новый\"', '2021-01-19 19:15:08', 23),
(18, 11, 'Торт \"Красивый\"', '2021-01-19 19:14:40', 45),
(9, 11, 'Торт \"Наполеон\"', '2021-01-19 16:37:27', 5),
(10, 11, 'Торт \"Прага\"', '2021-01-19 16:37:46', 32),
(11, 11, 'Торт \"Медовик\"', '2021-01-19 16:37:58', 21),
(12, 12, 'Пирожное \"Безе\"', '2021-01-19 16:38:14', 45),
(13, 12, 'Пирожное \"Профитроли\"', '2021-01-19 16:38:31', 21),
(14, 12, 'Пирожное \"Кекс\"', '2021-01-19 16:38:44', 23),
(15, 13, 'Печенье \"Курабье\"', '2021-01-19 16:39:06', 50),
(16, 13, 'Печенье \"Нежное\"', '2021-01-19 16:39:18', 34),
(17, 13, 'Печенье \"Московское\"', '2021-01-19 16:39:31', 45);

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id`, `type_name`) VALUES
(11, 'Торт'),
(12, 'Пирожное'),
(13, 'Печенье');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`type_name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
