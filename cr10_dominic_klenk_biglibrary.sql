-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 23, 2018 at 02:55 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cr10_dominic_klenk_biglibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`) VALUES
(1, 'Charles', 'Dickens'),
(2, 'Miguel', 'de Cervantes'),
(3, 'Stephen', 'King'),
(4, 'Jordan B.', 'Peterson'),
(5, 'Jamie', 'Oliver'),
(6, 'Arctic Monkeys', ''),
(7, 'Wanda', ''),
(8, 'Namika', ''),
(9, 'Snow Patrol', ''),
(10, 'George Ezra', ''),
(11, 'Imagine Dragons', ''),
(12, 'Christopher Nolan', ''),
(13, 'Lana Wachowski', ''),
(14, 'Miguel Arteta', ''),
(15, 'Andrew Stanton, Lee Unkrich', ''),
(16, 'Olivier Nakache, Éric Toledano', '');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `media_id` int(11) NOT NULL,
  `ISBN_code` varchar(30) DEFAULT NULL,
  `media_title` varchar(60) NOT NULL,
  `media_img` varchar(150) NOT NULL,
  `media_type` varchar(60) NOT NULL,
  `media_genre` varchar(30) NOT NULL,
  `publish_date` date DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `status` enum('available','reserved') DEFAULT NULL,
  `fk_publisher_id` int(11) NOT NULL,
  `fk_author_id` int(11) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`media_id`, `ISBN_code`, `media_title`, `media_img`, `media_type`, `media_genre`, `publish_date`, `description`, `status`, `fk_publisher_id`, `fk_author_id`, `fk_user_id`) VALUES
(8, '9780141199702', 'A Tale of Two Cities', 'http://prodimage.images-bn.com/pimages/9781593081386_p0_v3_s1200x630.jpg', 'book', 'roman', '1859-11-15', 'Described by Dickens as ´the best story I have written.', 'available', 1, 1, NULL),
(9, '9780099469698', 'Don Quixote', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/0994/9780099469698.jpg', 'book', 'roman', '2005-01-06', 'The world\'s first modern novel, and one of the funniest and most tragic books ever written. Don Quixote and his faithful squire, Sancho Panza, as they travel through sixteenth-century Spain. Unless you read Spanish, you\'ve never read Don Quixote.', 'available', 2, 2, NULL),
(10, '9781444707861', 'It', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4447/9781444707861.jpg', 'book', 'thriller', '2011-07-26', '\'They float...and when you\'re down here with me, you\'ll float, too.\'\r\nDerry, Maine is just an ordinary town: familiar, well-ordered for the most part, a good place to live.', 'reserved', 3, 3, 6),
(11, '9780345816023', '12 Rules for Life', 'https://media.buch.de/img-adb/61669796-00-00.jpg', 'book', 'health', '2018-01-23', 'Humorous, surprising and informative, Dr. Peterson tells us why skateboarding boys and girls must be left alone, what terrible fate awaits those who criticize too easily, and why you should always pet a cat when you meet one on the street.', 'available', 4, 4, NULL),
(12, '9780718187729', '5 Ingredients - Quick & Easy Food', 'https://media.buch.de/img-adb/54425029-00-00.jpg', 'book', 'cookbook', '2017-08-24', 'One of the Guardian\'s TOP TEN READS for Christmas Featuring ALL the simple and delicious recipes from Jamie\'s CHANNEL 4 series - Quick and Easy Food . . . ', 'available', 5, 5, NULL),
(13, '0887828031702', 'AM (Jewel Case)', 'https://media.buch.de/img-adb/36346443-00-00.jpg', 'cd', 'rock', '2013-09-06', 'The band from Sheffield to singer and guitarist Alex Turner, who has since moved to Los Angeles, has evolved significantly on their fifth studio album.', 'available', 6, 6, NULL),
(14, '0602557801644', 'Niente', 'https://media.buch.de/img-adb/72412631-00-00.jpg', 'cd', 'german pop', '2017-10-06', 'NIENTE is not quiet, and the whirlpools of still water are often stronger than the roar of the falls. The story is not finished, it finds a new pivot.', 'reserved', 7, 7, 5),
(15, '0889853720125', 'Que Walou', 'https://media.buch.de/img-adb/110693633-00-00.jpg', 'cd', 'german pop', '2018-06-01', 'That the second album should always be the hardest, you can not hear \"Que Walou\" from Namika. The record released today also tells about heavy topics in a feathery tone.', 'available', 8, 8, NULL),
(16, '0602567399483', 'Wildness', 'https://media.buch.de/img-adb/105013765-00-00.jpg', 'cd', 'rock', '2018-05-25', 'Ever since the TV series Grays Anatomy repeatedly with \"Chasing Cars\", \"Open Your Eyes\" or \"Make This Go On Forever\" episodes underpinned, the tracks of Gary Lightbody and Co. regularly conquered the top of the charts worldwide.', 'available', 7, 9, NULL),
(17, '0889854597825', 'Staying at Tamara\'s', 'https://media.buch.de/img-adb/96405889-00-00.jpg', 'cd', 'pop', '2018-03-23', 'Born in 1993, the Hertfordshire musician has taken his time with a successor to his worldwide hit debut album \"Wanted On Voyage\", which was also a hit with the hit \"Budapest\".', 'reserved', 8, 10, 5),
(18, '0602557680867', 'Evolve', 'https://media.buch.de/img-adb/65256892-00-00.jpg', 'cd', 'rock', '2017-06-23', 'In 2014, the Imagine Dragons emerged from nowhere and immediately hit the nerve of the zeitgeist. Four years later, the Grammy winners are now in the starting blocks with their third album Evolve.', 'available', 7, 11, NULL),
(19, '9780141199599', 'Inception', 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'dvd', 'action, sci-fi', '2010-07-30', 'Inception is a movie starring Leonardo DiCaprio, Joseph Gordon-Levitt, and Ellen Page. A thief, who steals corporate secrets through the use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.', 'available', 9, 12, NULL),
(20, '9780141199699', 'The Matrix', 'https://images-na.ssl-images-amazon.com/images/I/51EG732BV3L._SY445_.jpg', 'dvd', 'action, sci-fi', '1999-03-31', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 'available', 9, 13, NULL),
(21, '9780141199601', 'Youth in Revolt', 'https://m.media-amazon.com/images/M/MV5BMjE3NTkxODUwOV5BMl5BanBnXkFtZTcwMjE4NjI5Mg@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'dvd', 'comedy, drama', '2010-01-08', 'While camping in Ukiah, Nick meets Sheeni: for him, it\'s love at first sight.', 'reserved', 10, 14, 7),
(22, '9781444707603', 'Finding Nemo', 'https://m.media-amazon.com/images/M/MV5BZjMxYzBiNjUtZDliNC00MDAyLTg3N2QtOWNjNmNhZGQzNDg5XkEyXkFqcGdeQXVyNjE2MjQwNjc@._V1_UY268_CR1,0,182,268_AL_.jpg', 'dvd', 'animation, adventure, comedy', '2003-11-20', 'After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home.', 'available', 11, 15, NULL),
(23, '9780141199604', 'The Intouchables', 'https://m.media-amazon.com/images/M/MV5BMTYxNDA3MDQwNl5BMl5BanBnXkFtZTcwNTU4Mzc1Nw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'dvd', 'biography, comedy, drama', '2011-11-02', 'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.', 'available', 12, 16, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `publisher_name` varchar(60) NOT NULL,
  `publisher_address` varchar(60) NOT NULL,
  `publisher_size` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publisher_name`, `publisher_address`, `publisher_size`) VALUES
(1, 'Thalia', 'Landstraßer Hauptstraße 2A, 1030 Wien', 'medium'),
(2, 'Vintage Publishing', 'Vauxhall Bridge Road, 20 Vauxhall Bridge Road London', 'medium'),
(3, 'Hodder & Stoughton General Division', 'London, United Kingdom', 'big'),
(4, 'Random House LCC US', 'New York City, New York', 'big'),
(5, 'Penguin Books Ltd', 'London, UK', 'big'),
(6, 'GoodToGo GmbH', 'Mathias-Brüggen-Str. 85, Germany', 'medium'),
(7, 'Universal Music - A Division of Universal Music GmbH', 'Schwarzenbergpl. 2, 1010 Wien', 'medium'),
(8, 'Sony Music Entertainment', 'New York City, New York', 'big'),
(9, 'Warner Bros', 'USA', 'big'),
(10, 'Dimension Films', 'USA', 'big'),
(11, 'Pixar Animation Studios, Walt Disney Pictures', 'USA', 'big'),
(12, 'Quad Productions, Ten Films, Canal+', 'France', 'medium');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `user_name`, `email`, `password`, `register_date`) VALUES
(5, 'Jon', 'Doe', 'jondoe', 'jon@doe.com', '1049130abe45fb20718ef10eeca69b8f4617e536e22804e167f7dfc110d0186c', '2018-06-22 20:40:05'),
(6, 'Dominic', 'Kron', 'domk', 'dominic.k@hotmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '2018-06-22 20:43:04'),
(7, 'Marco', 'Eran', 'marc', 'marco.er@gmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', '2018-06-22 21:22:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `media_ibfk_3` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`);
