SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test1_db`
--
CREATE DATABASE IF NOT EXISTS `test1_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `test1_db`;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `comment`, `date`) VALUES
(1, 1, 'Alice for some time busily writing in his sleep, \'that \"I like what I like\"!\' \'You might just as the other.\' As soon as she could. \'The game\'s going on shrinking rapidly: she soon made out the.', '2003-11-27'),
(2, 2, 'Alice. \'Call it what you would have done just as well. The twelve jurors were writing down \'stupid things!\' on their slates, when the tide rises and sharks are around, His voice has a timid and.', '1973-01-21'),
(3, 2, 'The Mouse did not like to go down--Here, Bill! the master says you\'re to go nearer till she heard one of them attempted to explain the mistake it had been. But her sister kissed her, and said, \'So.', '1997-12-19'),
(4, 2, 'March Hare was said to Alice, and tried to open it; but, as the March Hare. \'Sixteenth,\' added the Hatter, and, just as I\'d taken the highest tree in the sea!\' cried the Mouse, in a very small cake,.', '2007-03-15');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `fio`, `email`, `password`) VALUES
(1, 'America Abbott II', 'gulgowski.ebba@example.org', 'fe896a84add7507cfe2653c1e0be27462ba2c70a'),
(2, 'Delia Swaniawski', 'hackett.mazie@example.org', '90bd2a1b62c629dbd5f6b6ecde0dc21b14461c49'),
(3, 'Don Ankunding', 'althea.wyman@example.net', '79eaa713ed177c13b62ca3d379300c6b6567be3d');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
