-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 12 2021 г., 17:35
-- Версия сервера: 10.4.19-MariaDB
-- Версия PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `drum_n_code`
--

-- --------------------------------------------------------

--
-- Структура таблицы `form_comments`
--

CREATE TABLE `form_comments` (
  `comment_id` int(11) NOT NULL,
  `parent_comment_id` int(11) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `comment_sender_name` varchar(40) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `form_comments`
--

INSERT INTO `form_comments` (`comment_id`, `parent_comment_id`, `comment`, `comment_sender_name`, `date`) VALUES
(2, 0, 'вывы', 'blago1', '2021-12-03 19:54:26'),
(3, 0, 'выаыва', 'blago1', '2021-12-03 19:54:30'),
(4, 0, 'saddsa', 'blago1s', '2021-12-05 12:04:31'),
(5, 0, 'sadsads', 'blago1sa', '2021-12-06 21:47:03'),
(6, 0, 'comments\r\n', 'blago1', '2021-12-06 21:56:45'),
(7, 6, 'you dump', 'blagoi', '2021-12-06 21:57:09'),
(8, 0, 'ad', 'blago1', '2021-12-07 12:11:17'),
(9, 0, 'asda', 'blago1ada', '2021-12-07 12:18:00'),
(10, 7, 'werew', 'wer', '2021-12-08 14:29:22'),
(11, 9, 'wre', 'wer', '2021-12-08 14:29:25');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `form_comments`
--
ALTER TABLE `form_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `form_comments`
--
ALTER TABLE `form_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
