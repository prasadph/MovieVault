-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2018 at 10:17 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movievault`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(1, 'India'),
(2, 'USA'),
(3, 'Australia'),
(4, 'Sweden'),
(5, 'France'),
(6, 'Japan'),
(7, 'Iran');

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE `directors` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`id`, `name`) VALUES
(1, 'Doug Nichol'),
(2, 'Isha Pungaliya'),
(3, 'Ruben Ostlund'),
(4, 'Francois Ferracci'),
(5, 'Ali Asgari'),
(6, 'Prannoy Mehta'),
(7, 'Hardik Mehta'),
(8, 'Daisy Jacobs'),
(9, 'Jeronimo Rocha'),
(10, 'Spike Jonze'),
(11, 'Higuchi Shinji');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Comedy'),
(2, 'Sci-Fi'),
(3, 'Drama'),
(4, 'Romance'),
(5, 'Experimental'),
(6, 'Animation'),
(7, 'Short Doc'),
(8, 'Award Winning'),
(9, 'Indian'),
(10, 'Thriller'),
(11, 'Disaster Porn'),
(12, 'Famous Directors'),
(13, 'Dark'),
(14, 'Offline'),
(15, 'Horror');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`) VALUES
(1, 'English'),
(2, 'Hindi'),
(3, 'Marathi'),
(4, 'Swedish'),
(5, 'French'),
(6, 'Persian'),
(7, 'Japanese');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `synopsis` varchar(100) DEFAULT NULL,
  `description` varchar(800) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL COMMENT 'durations in minutes\n',
  `likes` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `director_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `name`, `synopsis`, `description`, `duration`, `likes`, `views`, `language_id`, `country_id`, `director_id`) VALUES
(1, 'Sunshine', 'An American advertising producer in Shanghai tries to sell fast food to the Chinese. An endearing po', 'Acclaimed commercial director Doug Nichol adapts the philosophy to documentary filmmaking in Sunshine. While in Shanghai to film a commercial, Nichol turns his handy 5DMarkII upon his friend and longtime producer John Benet, and what results is a remarkable work, one that tells two stories with equal aplomb—an ethnographic snapshot of the young, developing Chinese ad industry, but also the confessions of a jaded, cynical American ad man.\n\nOfficial Selection:\n\nTrue/False Film Festival, DOCNYC, Mill Valley Film Festival, Palm Springs, LA Shorts Fest, SF DocFest, Hot Springs Documentary Festival, Big Apple Film Festival, Woods Hole Film Festival, SF Shorts\n\n', 14, 100, 1000, 1, 2, 1),
(2, 'Dwaraka', 'Romance in post-modern times between two unlikely individuals', 'Dwaraka is film about a waiter, Kanha in a godforsaken hotel in Pondicherry, India and a woman, Radhika stuck in a purely functional, childless marriage. The two meet when Radhika comes to the hotel with her husband for a vacation. As the characters of Kanha and Radhika are derived from Krishna and Radha, mythological characters from Mahabharata the Indian epic, they fall passionately in love despite a visible class difference. Kanha has been a womanizer but this time,it is different for him. Whereas Radhika, never having been in love before cannot fathom her happiness. The magic of love makes Kanha a considerate person, perfect in all regards, almost like Krishna himself. Which is precisely why he needs to end the relationship as Krishna ended it with Radha for the fear of the mundaneness', 32, 55, 177, 2, 1, 2),
(3, 'Incident by a bank', '90 people recreate a failed bank robbery', 'Shot using a single camera, 90 people meticulously recreate a failed bank robbery that took place in Stockholm in June 2006. A superb single shot.\n\n The short went on to win the Golden Bear at Berlinale in 2010.', 12, 251, 391, 4, 4, 3),
(4, 'Lost Memories 2.0', 'In an ultra connected world, how do you find a person who has no record online.', '\r\nProbably one of the best vfx in any film - feature or short and one of the best visualization of screen obsessed culture, Lost Memories 2.0 traces the search of a lover.\r\nThe “Cloud” collapsed and destroyed all the digital data in the world a few years ago in an electromagnetic storm.\r\nSince that moment, the world has been slowly recovering, AD is now AC “After Cloud”.\r\nIn an ultra-connected world filled with hyper connected people, how do you find your one true love when the world is partially disconnected and you have lost her? A very interesting insight on how our world is radially shaping up.', 15, 54, 202, 5, 5, 4),
(5, 'The Baby', '\r\nNarges and her friend have just a few hours to find someone to take care of her baby for some days', 'Once in a while you come across a really gripping short film where the core tension is because of a real life human situation. Narges and her friend have just a few hours to find someone to take care of her baby for some days.\r\n\r\nShot as realistically as possible, the Baby is all about emotional resonance, it immerses you completely in it\'s core conflict and leaves you with thoughts to ponder once the film is over. A must watch.', 16, 54, 101, 6, 7, 5),
(6, 'Qahr', 'In a deeply divided Central India, a young man is forced to confront the realities of', 'In a part-dystopian Central India, in the year 2022, territorial conflicts have arisen between the Hindus, Muslims, and Christians. Amidst all of this, a young man, Imaan, struggling to protect his little sister’s innocence and faith, is suddenly put to test when a group of anarchists abduct her and make demands which send him down murky routes, unravelling bizarre truths about the world he lives in.', 29, 93, 428, 2, 1, 6),
(7, 'The Affair', 'A city of millions becomes witness to one secret affair.', 'In a city of a millions, everyday after work, a man and a woman meet each other. They turn their backs to the city and let the sea be witness to their relationship. But this affair can only last for ahardik5\r\nfew minutes, since back at their homes someone waits for them.\r\n\"The inspiration behind The Affair is all the couples one keeps seeing while taking a walk at Marine Drive, Worli Sea Face, Bandra Reclamation or for that matter anywhere in any city.\" Hardik tells us that he wanted to make something short and sweet like the era when cinema was simple, even if the conflicts were complex they were treated simply and the outcome was beautiful. \"There was no dramatic music or villains so I thought why not recreate that kind of cinema again and thats how Th', 6, 266, 430, 2, 1, 7),
(8, 'I\'m Here', 'Ordinary is no place to be.', 'A library assistant plods through an ordinary life in LA until a chance meeting opens his eyes to a the power of creativity and ultimately, love. When this new life and love begin to fall apart, he discovers he has a lot to give. This short film proves that ordinary is no place to be.', 31, 161, 519, 1, 2, 10),
(9, 'Dedalo', 'A disaster porn - a girl surviving an alien in a spaceship.', 'Jerónimo Rocha’s scifi horror short Dédalo is reminiscent of Alien in both visuals and story.  Dust is a new channel specializing in scifi horror shorts and calls itself a bingeable scifi horror  short destination. We would call them Ramsay brothers equivalent of international shorts except that their production values are really high and the CGI is immaculate. For a short film, the film has a really decent production quality and superb performance by the lead. The film follows a woman who appears to be the lone survivor of a gruesome attack on her space freighter. Her frantic struggle to survive is suspenseful as hell, but the real draw here is that alien creature, specifically its freakishly spiky nails. We were expecting a lot more gore though.', 8, 225, 266, 1, 2, 9),
(10, 'Giant God Warrior appears in Tokyo', 'Disaster Porn', 'Disaster porn can get stale, but Studio Ghibli\'s entry into the tokusatsu genre is a fresh visual delight even as it reaches back to classic monster movies and Nausicaä of the Valley of the Wind. It helps that it relies on practical effects rather than slick CG, giving the short a loving, bespoke effect. It looks like it was incredible fun to make, and the teeth on the God Warrior are a thing of horrific beauty.', 8, 230, 308, 7, 6, 11);

-- --------------------------------------------------------

--
-- Table structure for table `movies_genres`
--

CREATE TABLE `movies_genres` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies_genres`
--

INSERT INTO `movies_genres` (`movie_id`, `genre_id`) VALUES
(1, 7),
(2, 8),
(2, 9),
(3, 3),
(3, 8),
(3, 10),
(4, 2),
(4, 3),
(4, 4),
(4, 11),
(5, 3),
(5, 8),
(6, 3),
(6, 10),
(7, 3),
(7, 4),
(7, 9),
(8, 4),
(9, 2),
(9, 11),
(9, 15),
(10, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_movies_directors1_idx` (`director_id`),
  ADD KEY `fk_movies_languages1_idx` (`language_id`),
  ADD KEY `fk_movies_country1_idx` (`country_id`);

--
-- Indexes for table `movies_genres`
--
ALTER TABLE `movies_genres`
  ADD PRIMARY KEY (`movie_id`,`genre_id`),
  ADD KEY `fk_movies_has_genres_genres1_idx` (`genre_id`),
  ADD KEY `fk_movies_has_genres_movies1_idx` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `fk_movies_country1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movies_directors1` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movies_languages1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movies_genres`
--
ALTER TABLE `movies_genres`
  ADD CONSTRAINT `fk_movies_has_genres_genres1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movies_has_genres_movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
