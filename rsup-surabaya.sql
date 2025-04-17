-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 16, 2025 at 03:49 PM
-- Server version: 8.0.32
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rsup-surabaya`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `category` enum('Teknologi','Kesehatan','Pendidikan') NOT NULL,
  `uploaded_file` varchar(255) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `category`, `uploaded_file`, `created_by`, `created_at`) VALUES
(1, 'Sample Article 1', 'This is the content of Sample Article 1.', 'Kesehatan', '', 1, '2025-04-16 15:49:16'),
(2, 'Sample Article 2', 'This is the content of Sample Article 2.', 'Teknologi', '', 2, '2025-04-16 15:49:16'),
(3, 'Sample Article 3', 'This is the content of Sample Article 3.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(4, 'Sample Article 4', 'This is the content of Sample Article 4.', 'Teknologi', '', 2, '2025-04-16 15:49:16'),
(5, 'Sample Article 5', 'This is the content of Sample Article 5.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(6, 'Sample Article 6', 'This is the content of Sample Article 6.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(7, 'Sample Article 7', 'This is the content of Sample Article 7.', 'Teknologi', '', 2, '2025-04-16 15:49:16'),
(8, 'Sample Article 8', 'This is the content of Sample Article 8.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(9, 'Sample Article 9', 'This is the content of Sample Article 9.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(10, 'Sample Article 10', 'This is the content of Sample Article 10.', 'Teknologi', '', 2, '2025-04-16 15:49:16'),
(11, 'Sample Article 11', 'This is the content of Sample Article 11.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(12, 'Sample Article 12', 'This is the content of Sample Article 12.', 'Kesehatan', '', 1, '2025-04-16 15:49:16'),
(13, 'Sample Article 13', 'This is the content of Sample Article 13.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(14, 'Sample Article 14', 'This is the content of Sample Article 14.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(15, 'Sample Article 15', 'This is the content of Sample Article 15.', 'Kesehatan', '', 1, '2025-04-16 15:49:16'),
(16, 'Sample Article 16', 'This is the content of Sample Article 16.', 'Kesehatan', '', 1, '2025-04-16 15:49:16'),
(17, 'Sample Article 17', 'This is the content of Sample Article 17.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(18, 'Sample Article 18', 'This is the content of Sample Article 18.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(19, 'Sample Article 19', 'This is the content of Sample Article 19.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(20, 'Sample Article 20', 'This is the content of Sample Article 20.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(21, 'Sample Article 21', 'This is the content of Sample Article 21.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(22, 'Sample Article 22', 'This is the content of Sample Article 22.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(23, 'Sample Article 23', 'This is the content of Sample Article 23.', 'Kesehatan', '', 1, '2025-04-16 15:49:16'),
(24, 'Sample Article 24', 'This is the content of Sample Article 24.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(25, 'Sample Article 25', 'This is the content of Sample Article 25.', 'Teknologi', '', 2, '2025-04-16 15:49:16'),
(26, 'Sample Article 26', 'This is the content of Sample Article 26.', 'Teknologi', '', 2, '2025-04-16 15:49:16'),
(27, 'Sample Article 27', 'This is the content of Sample Article 27.', 'Teknologi', '', 2, '2025-04-16 15:49:16'),
(28, 'Sample Article 28', 'This is the content of Sample Article 28.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(29, 'Sample Article 29', 'This is the content of Sample Article 29.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(30, 'Sample Article 30', 'This is the content of Sample Article 30.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(31, 'Sample Article 31', 'This is the content of Sample Article 31.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(32, 'Sample Article 32', 'This is the content of Sample Article 32.', 'Teknologi', '', 3, '2025-04-16 15:49:16'),
(33, 'Sample Article 33', 'This is the content of Sample Article 33.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(34, 'Sample Article 34', 'This is the content of Sample Article 34.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(35, 'Sample Article 35', 'This is the content of Sample Article 35.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(36, 'Sample Article 36', 'This is the content of Sample Article 36.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(37, 'Sample Article 37', 'This is the content of Sample Article 37.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(38, 'Sample Article 38', 'This is the content of Sample Article 38.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(39, 'Sample Article 39', 'This is the content of Sample Article 39.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(40, 'Sample Article 40', 'This is the content of Sample Article 40.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(41, 'Sample Article 41', 'This is the content of Sample Article 41.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(42, 'Sample Article 42', 'This is the content of Sample Article 42.', 'Pendidikan', '', 3, '2025-04-16 15:49:16'),
(43, 'Sample Article 43', 'This is the content of Sample Article 43.', 'Pendidikan', '', 3, '2025-04-16 15:49:16'),
(44, 'Sample Article 44', 'This is the content of Sample Article 44.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(45, 'Sample Article 45', 'This is the content of Sample Article 45.', 'Teknologi', '', 3, '2025-04-16 15:49:16'),
(46, 'Sample Article 46', 'This is the content of Sample Article 46.', 'Pendidikan', '', 3, '2025-04-16 15:49:16'),
(47, 'Sample Article 47', 'This is the content of Sample Article 47.', 'Teknologi', '', 3, '2025-04-16 15:49:16'),
(48, 'Sample Article 48', 'This is the content of Sample Article 48.', 'Kesehatan', '', 1, '2025-04-16 15:49:16'),
(49, 'Sample Article 49', 'This is the content of Sample Article 49.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(50, 'Sample Article 50', 'This is the content of Sample Article 50.', 'Teknologi', '', 2, '2025-04-16 15:49:16'),
(51, 'Sample Article 51', 'This is the content of Sample Article 51.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(52, 'Sample Article 52', 'This is the content of Sample Article 52.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(53, 'Sample Article 53', 'This is the content of Sample Article 53.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(54, 'Sample Article 54', 'This is the content of Sample Article 54.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(55, 'Sample Article 55', 'This is the content of Sample Article 55.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(56, 'Sample Article 56', 'This is the content of Sample Article 56.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(57, 'Sample Article 57', 'This is the content of Sample Article 57.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(58, 'Sample Article 58', 'This is the content of Sample Article 58.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(59, 'Sample Article 59', 'This is the content of Sample Article 59.', 'Teknologi', '', 2, '2025-04-16 15:49:16'),
(60, 'Sample Article 60', 'This is the content of Sample Article 60.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(61, 'Sample Article 61', 'This is the content of Sample Article 61.', 'Pendidikan', '', 3, '2025-04-16 15:49:16'),
(62, 'Sample Article 62', 'This is the content of Sample Article 62.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(63, 'Sample Article 63', 'This is the content of Sample Article 63.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(64, 'Sample Article 64', 'This is the content of Sample Article 64.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(65, 'Sample Article 65', 'This is the content of Sample Article 65.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(66, 'Sample Article 66', 'This is the content of Sample Article 66.', 'Pendidikan', '', 3, '2025-04-16 15:49:16'),
(67, 'Sample Article 67', 'This is the content of Sample Article 67.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(68, 'Sample Article 68', 'This is the content of Sample Article 68.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(69, 'Sample Article 69', 'This is the content of Sample Article 69.', 'Pendidikan', '', 3, '2025-04-16 15:49:16'),
(70, 'Sample Article 70', 'This is the content of Sample Article 70.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(71, 'Sample Article 71', 'This is the content of Sample Article 71.', 'Pendidikan', '', 3, '2025-04-16 15:49:16'),
(72, 'Sample Article 72', 'This is the content of Sample Article 72.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(73, 'Sample Article 73', 'This is the content of Sample Article 73.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(74, 'Sample Article 74', 'This is the content of Sample Article 74.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(75, 'Sample Article 75', 'This is the content of Sample Article 75.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(76, 'Sample Article 76', 'This is the content of Sample Article 76.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(77, 'Sample Article 77', 'This is the content of Sample Article 77.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(78, 'Sample Article 78', 'This is the content of Sample Article 78.', 'Teknologi', '', 2, '2025-04-16 15:49:16'),
(79, 'Sample Article 79', 'This is the content of Sample Article 79.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(80, 'Sample Article 80', 'This is the content of Sample Article 80.', 'Kesehatan', '', 3, '2025-04-16 15:49:16'),
(81, 'Sample Article 81', 'This is the content of Sample Article 81.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(82, 'Sample Article 82', 'This is the content of Sample Article 82.', 'Teknologi', '', 1, '2025-04-16 15:49:16'),
(83, 'Sample Article 83', 'This is the content of Sample Article 83.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(84, 'Sample Article 84', 'This is the content of Sample Article 84.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(85, 'Sample Article 85', 'This is the content of Sample Article 85.', 'Teknologi', '', 2, '2025-04-16 15:49:16'),
(86, 'Sample Article 86', 'This is the content of Sample Article 86.', 'Kesehatan', '', 1, '2025-04-16 15:49:16'),
(87, 'Sample Article 87', 'This is the content of Sample Article 87.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(88, 'Sample Article 88', 'This is the content of Sample Article 88.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(89, 'Sample Article 89', 'This is the content of Sample Article 89.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(90, 'Sample Article 90', 'This is the content of Sample Article 90.', 'Pendidikan', '', 3, '2025-04-16 15:49:16'),
(91, 'Sample Article 91', 'This is the content of Sample Article 91.', 'Pendidikan', '', 3, '2025-04-16 15:49:16'),
(92, 'Sample Article 92', 'This is the content of Sample Article 92.', 'Pendidikan', '', 2, '2025-04-16 15:49:16'),
(93, 'Sample Article 93', 'This is the content of Sample Article 93.', 'Pendidikan', '', 3, '2025-04-16 15:49:16'),
(94, 'Sample Article 94', 'This is the content of Sample Article 94.', 'Kesehatan', '', 2, '2025-04-16 15:49:16'),
(95, 'Sample Article 95', 'This is the content of Sample Article 95.', 'Pendidikan', '', 3, '2025-04-16 15:49:16'),
(96, 'Sample Article 96', 'This is the content of Sample Article 96.', 'Kesehatan', '', 1, '2025-04-16 15:49:16'),
(97, 'Sample Article 97', 'This is the content of Sample Article 97.', 'Kesehatan', '', 1, '2025-04-16 15:49:16'),
(98, 'Sample Article 98', 'This is the content of Sample Article 98.', 'Pendidikan', '', 1, '2025-04-16 15:49:16'),
(99, 'Sample Article 99', 'This is the content of Sample Article 99.', 'Teknologi', '', 3, '2025-04-16 15:49:16'),
(100, 'Sample Article 100', 'This is the content of Sample Article 100.', 'Kesehatan', '', 2, '2025-04-16 15:49:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Editor','User') NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2y$10$PSoiGVgaYSRsW4sLvohYleRw6VPhGLd0Xkf003EXwZrcvP3jnh4fy', 'Admin'),
(2, 'editor', '$2y$10$/z/1axgbLY2sZXXXMR.oB.nreOJ/tqdhZAL3owDsyCwQwAufk24n.', 'Editor'),
(3, 'user', '$2y$10$Ynh2ELutPlduBn0Cc917RO6yckKCJlRo/Kd5f2iU3b1NLDYXbnenO', 'User'),
(4, 'user1', '$2y$10$5UK1dYY1pz6PXfgFOqUqz.BZfrlqH1KwrlVH6GFI9PtG6udzhnDee', 'Editor'),
(5, 'user2', '$2y$10$kCoRpHTyqOWPfxUAc1M0EOxLHIBkmTDLnGDxmIhjIgQVaGubAWtRa', 'User'),
(6, 'user3', '$2y$10$H9owO3BHeLjkKVJAryL8feX2bd56CX3HecG2SSJR2r96LxF3hrvAe', 'Admin'),
(7, 'user4', '$2y$10$iHjPy1YdL5FLSj1lJBcqKe4Slc36k.lA06kG/WLZYN/el983zGUMy', 'Editor'),
(8, 'user5', '$2y$10$dojwtqsZTP5M1ypwMrTQauHr.KBh5na7RDHx3w3qgWcKyD7wiMLlS', 'Admin'),
(9, 'user6', '$2y$10$SwMzVeOFcBox.cDXF1/WOu9x/mt/x3cqHQBbdKDqpfV3CEU7.1fei', 'User'),
(10, 'user7', '$2y$10$Jl5xgqDEX2WWHpATujJEuunlcodBNwC0SqfLALUjSn9o8FlyVrZi6', 'User'),
(11, 'user8', '$2y$10$okFgtGfS6G6qckSeyAfQzeSdFGtN/Uc7Xf4jUVyQCtEiyx5D2uR.C', 'User'),
(12, 'user9', '$2y$10$Xlune2VRNzDujEF0btMhAujfLI.zG5TtCz9qLWBPSOWFRf1IJk1ga', 'User'),
(13, 'user10', '$2y$10$h2OzUT0ukbHcASaJK/.O8eXF2JYjWdrU3ZV3PA7Bxm/Fzqh7cTNUG', 'User'),
(14, 'user11', '$2y$10$JZaCqORnPWEodtjtRJCEfeFR/uofRzDuuZcnksq3uU34T66Rdtttm', 'Editor'),
(15, 'user12', '$2y$10$Wi86c1dAaKq24n2aXrOPkuNUgQ9S3TkeIFySmA2zqsYEoZwok7qW2', 'User'),
(16, 'user13', '$2y$10$AOb2W1GYlYhQMqC1RtlPBuSj7rqQj0ZTBnCskchCJ37a1yMh/otuS', 'Editor'),
(17, 'user14', '$2y$10$8XRbhqGyf2QroSGqYKF7oeUbFP4qz.Vx16YXGEvD/RjpaQZEbdBxa', 'Editor'),
(18, 'user15', '$2y$10$JJDbYHUI3QhRUNRbQ/6/reGIhOFnojWcAyDSInjb/pot/m1CH8F8e', 'Admin'),
(19, 'user16', '$2y$10$3A8NNEt2.hVNrxmMmFJ1juh2e2oJ/hk8b/tfRujHzcd6f3ssb4FCW', 'Editor'),
(20, 'user17', '$2y$10$jDUMXT30lUj5gfHVmDrd6uRNYivihfp/OLYUZ/hvN3FsaAyqbNt6W', 'Admin'),
(21, 'user18', '$2y$10$CMxcno1Lc4XU3r5QRxoYqeBNjq9PxkNNa50EGAJkGI5XA46SWFrWq', 'Editor'),
(22, 'user19', '$2y$10$.lB0/uk.ikASz2WUH0AJyuiCz3Csc0TPqxCVRC38FuhvC4/voqJdu', 'Editor'),
(23, 'user20', '$2y$10$j/Xzse6YmIK2Z3HbogwE3eji.wODSbg0e36DLIrSYqlu1VypB2w3W', 'Admin'),
(24, 'user21', '$2y$10$rdR3Q8jAi7SDSJJveoYkK.32DVV31UQFu8KCZ6kG5FKOXvoc5YMH2', 'Editor'),
(25, 'user22', '$2y$10$HUUJGnJ.FHilqC5QPpj4ve6OjvnBJPOA9AdBJOyXmEbY5pRb9IUa2', 'Admin'),
(26, 'user23', '$2y$10$H01ogWCZORfHNWmlWH2OfOze3Q5zYTIVOQ1y3bs6.59SW18vATJAq', 'Admin'),
(27, 'user24', '$2y$10$CHA.j4RXhpDvLKuSMoRyj.Ckru8Gg4E0Q2qsi0H6BG/Nks/1S.S42', 'User'),
(28, 'user25', '$2y$10$1xsEczWIh5N0Qehxo/RZ/OFOeHjjPcYUg4KzEi1y10XqWW.4a2Cxa', 'Admin'),
(29, 'user26', '$2y$10$49RfaH1JJ/WOVVieaPGTEuBJoJ8JxEcaarGNja6wCnAGdFP9hP./q', 'Admin'),
(30, 'user27', '$2y$10$Ebh3TweK/R/.fkry5V8MlOGg5cvVxPPzgsvZk4V6T3P83ZHtPybji', 'Admin'),
(31, 'user28', '$2y$10$/5o6MKqmnd4.Z4LY8Gehiu/ODFdPZSHCvPnSEEtj0PoTv.BApONNe', 'Admin'),
(32, 'user29', '$2y$10$/ywCS61Oxf8FrddELN4T1uj2NvKTX8AAVkXWFdVEmL/yH9Oc9poaS', 'User'),
(33, 'user30', '$2y$10$iKjAxA9f9P22G4hTF/W9t.jFhopdVf/hl7tY8p343Z2reqIfIkE2u', 'User'),
(34, 'user31', '$2y$10$Vj8nFPw7NQAp12VA9Y/wl.6KiDeDVxv7qDwECrAvFG54CRrhCJyL6', 'Editor'),
(35, 'user32', '$2y$10$vlvx7O6JE3X9s7AtsX88WeykLxwn16RldNbZH01j3kWicxyNPpYti', 'Editor'),
(36, 'user33', '$2y$10$8ha9fv0NRH1deYHvNyk8.eaO3L5bmX.WMFddOBuET7Rl5H2Nhgpaq', 'Admin'),
(37, 'user34', '$2y$10$WRVHNc/eT.EmsVEO0IislukyXC6ax9QoAIofkUbx4D7pA5iGmshne', 'Admin'),
(38, 'user35', '$2y$10$EcbF4z5A5NdEgf2Cwws5o.Q7Q0vjXJAhWLgy.zv0iIL8Nw5M0aP96', 'Admin'),
(39, 'user36', '$2y$10$1A9df8QHPV0rJNmzJG..A.BtvMqfGfgLHCt4JfzEECvrN8uXodJrm', 'Editor'),
(40, 'user37', '$2y$10$gF83wEl/MUyNxbEwX5gpX.BYc7BuwKhlqWhh/p0mioFRocy8EfdMy', 'Admin'),
(41, 'user38', '$2y$10$Vs/sv96URLmZP00UUf0.vet2/ZoC1BHF2mCj5CVxxa7cG7DmHAqLe', 'User'),
(42, 'user39', '$2y$10$8okkSDND5WxS0Nf9lA5/Z.x3TFhq4b7SK8eJ15EP7oKu/Pc0whUiW', 'User'),
(43, 'user40', '$2y$10$M9vhHsLbk6Rl/W9o4IsLMe/NSwznMZmAYzzoAFP2yw3GH7ePpJEBK', 'User'),
(44, 'user41', '$2y$10$eMvzz9eakn7OS/9HjeNynelQV1zDEhA4Pa7MpNz.jAatXvpdMBH0K', 'User'),
(45, 'user42', '$2y$10$QNGyTGXG/2/qoxwocRZDbOZqcpAQA1hX4s8eiECMi75lNJ14y3uEe', 'Editor'),
(46, 'user43', '$2y$10$XoDT6DIbdHvRp6swU8sk2.3PxSWaFQZW8FyJwDJvdPug/Z1W/MbrS', 'Editor'),
(47, 'user44', '$2y$10$v5ovkvXZXbqkR1joOP.wverqA5JClw/trx3ms5of4quAC1xCWpNGa', 'Admin'),
(48, 'user45', '$2y$10$0dPInWVVVaiIsPCKiUBTYO3PdJztxBWIZMz1opm1/tSJLu18NwViS', 'Admin'),
(49, 'user46', '$2y$10$CmtCe1mrPWrI3QIw40tTzeMQoT7vWCujuvNKIz7xRgb.UmGJRkSxa', 'Admin'),
(50, 'user47', '$2y$10$XMN3YAfA1rZobySet0RPpODLebl5v09Y1kQ0lsHm88mEP3uvUnxv2', 'Admin'),
(51, 'user48', '$2y$10$zn1iRqdp8jiGLUfyuCqdeun9JzyzKov/5DhE3mwW.QimvEMQRv7eq', 'Editor'),
(52, 'user49', '$2y$10$k/.cP6ZJK8GAa18XBcl5qug.9WTsM/uIqB431xA7PYIWrRpg3/07S', 'User'),
(53, 'user50', '$2y$10$qlWE9jpC1SCQRleWNVPFA.MxoZHaY/1zv78qiwH8FfzjNMt6BEFai', 'User'),
(54, 'user51', '$2y$10$msmlPCwxtbuQHzWt9P506.qWH.Om21gD1ZFuElk/3jvPimVf1cIHq', 'Editor'),
(55, 'user52', '$2y$10$/QCuBslzKopPE7ZvT4WMd.fKB9KTUr.3qD6UQ3onUXH1I6FQyoG4e', 'User'),
(56, 'user53', '$2y$10$oRzksDQh6ipyINAMzGxxquJAJMxmdhAynqh2z1ve4m9PhsQRkQwgu', 'Admin'),
(57, 'user54', '$2y$10$OKXaWoO1lsO03CL78S6By.U2Lh8gIQGeXwuNJQ2AIT0kP3Ax44dZe', 'Editor'),
(58, 'user55', '$2y$10$QoYmqyCXofLE6p2R8gugRO0qm/u1/FPF6sY9/5eA9VVqrLmn1buWK', 'Editor'),
(59, 'user56', '$2y$10$dzrjVIpKME57tZfpKWt4u.eZvVQ3P0HgJ3884eWy9HNn6ZwTQXNyO', 'Editor'),
(60, 'user57', '$2y$10$vUBQ4n9QqzXSvTJBuhzZxe767rImCxNedbsPmDhXT222Yh7qlzWiu', 'User'),
(61, 'user58', '$2y$10$btQ51ZMV/p.9iOBCq42j8.47MZ/DanLB7mxC4DE.NiXk7/x9jacM6', 'User'),
(62, 'user59', '$2y$10$57DiNpFt1N8HLLHmnsk5o.PdDKjmFfzf6N/7oWbgEUPahm7SRyZ4C', 'Editor'),
(63, 'user60', '$2y$10$gPkCh.C78ksc3gXMpyL1u.2KyG0P8/NqTH8qxEO3tVfW7v3QvJ2mi', 'User'),
(64, 'user61', '$2y$10$dri.btaOMaLkA.i6rG23/uV4s156WdlvCWGMn5r20WKkOYIlPvgpG', 'User'),
(65, 'user62', '$2y$10$s2ToA.o3IAXE3hSW563IhuY9slQyq2Vu6h5DMT6AiyKEvAfCrq4Qm', 'Editor'),
(66, 'user63', '$2y$10$LsVpuer.Cb52ugiFWIxXa.3.T7DYEeo7ZA4iKtAgDtwUWK7K4mwny', 'User'),
(67, 'user64', '$2y$10$p8tXalABf3xnQ5w3udn9t.ZbDeRl4Ken3ctRq6rLDsJ6ujemT7cuG', 'Editor'),
(68, 'user65', '$2y$10$gEYTVfDCrmQ1Zxg5NSyEluIQrGQFDi4KgAumWWLX88a16BRyvfWTe', 'Admin'),
(69, 'user66', '$2y$10$6LH7C0dAAluPd.y7byzyRuy/fVCnmxtfxqCKhQm6hzcWGscNu/9q.', 'User'),
(70, 'user67', '$2y$10$AkXbwpsEUYDvopJNjff/4uBe.GnWZOMyb.p1Ox.OIx5/Uot/MLmaK', 'User'),
(71, 'user68', '$2y$10$4KyVbL2eHb1cT1xX0M7Sx.JdAAAA5Vf.lMUNixY7svV.ez3gYM.mi', 'Admin'),
(72, 'user69', '$2y$10$.Qei.p4DHXbzlyxAR9BPruC7mLy9VfqnL4pvdMtgt4yCiFAWFEu/.', 'Admin'),
(73, 'user70', '$2y$10$Cf07iwh6dqxfefQWFXBLVOGTtrtHd.Xe9B1Va0yHIez0X3LomL3Ne', 'Admin'),
(74, 'user71', '$2y$10$DetAkuZuiMgROysRZvJmD.6C9Ad9PZg2D7p2AsA6JdUSaWyh3xyje', 'User'),
(75, 'user72', '$2y$10$pddtUuIgA/BDUYfexFdyFO.WpOK3kIjlDHiQnxf7wussu7NXcV9yG', 'User'),
(76, 'user73', '$2y$10$R/7mgfM0XQ8lud88Nwg1x.2Q.Rbc0JnIXP6jxOygXvo7OIedZGHNC', 'Editor'),
(77, 'user74', '$2y$10$jTnSfem25rUHlVikqvyIU.Ck8sS6hio72ckt3g7TBR240CxQ3qIH.', 'Admin'),
(78, 'user75', '$2y$10$2wpZ1IBdMHUIy7iLv9GnWeZDL0MnbL30EdXq1Z6w8yd07lQPSEQ2G', 'User'),
(79, 'user76', '$2y$10$RLwBbvcz1A6A0N2VRMo8feMX4dhYKRiBR/7Y1U4ZJ2Zj6plMrxU/S', 'Editor'),
(80, 'user77', '$2y$10$AGMQPLpB5wY91z0t05ZbBu2REidkYecAU0QixtgjpmdWaoYSjfiv6', 'User'),
(81, 'user78', '$2y$10$4X8uqDXrW6d4sAN6fLuEqe/ix7bqXluMyoE1WSRHXdVDD/.14zXle', 'Admin'),
(82, 'user79', '$2y$10$zVbtmbQfIepuppqhgJ1TCOmz5RagMPOFRsYNwD00qQw9Url4ATdzm', 'Editor'),
(83, 'user80', '$2y$10$.RIQR4u.rJwm6/SVPJohXePYpDsa9z7wYqOBT/fenJnkmkVBPIIjS', 'User'),
(84, 'user81', '$2y$10$8/Bjj7yyNOH1Bn2.wI9zH.U52tPS1337VT73KpAVibs6zDR07MeB6', 'User'),
(85, 'user82', '$2y$10$8Sd2ONVwHf7IlZCHcoosb.Sq8GaGY90OV1ai8N6TlOT2UdJQRlXFO', 'Admin'),
(86, 'user83', '$2y$10$79gIemNhn8MO0WnpjgGxDuqsNM77gxS.FNvfqXygnAGUB1bMgy1sW', 'Admin'),
(87, 'user84', '$2y$10$/TJYGM71pHW1BXO8Zhwy3OWHgZX33fONumADK2Nrgl7kecLacBa56', 'User'),
(88, 'user85', '$2y$10$yGC3AlO4v/kS8qSRXWaSnuGGJPsUtKCrCTx1uPAEtX66IqSphL6/u', 'User'),
(89, 'user86', '$2y$10$TjfvuabEsO4klWyEVnAMDufdb3ggXczXGKFz7YPEaZfxm0BYdbuq6', 'Editor'),
(90, 'user87', '$2y$10$rWF5uyLUx4I7E7Ga7pdA/OAO7eHrV0UdDHa9vcYurLFgLV7J88hTm', 'Admin'),
(91, 'user88', '$2y$10$bVPbj1SWt7mRon3.P5VfgeiL4YRD109ZGj3GOg2bdEmBPtpfzXkZe', 'User'),
(92, 'user89', '$2y$10$O6Jl5TwT9WzgWfmkZwJQV.Gxrt6pEeeVF7d5epBXt7nxxcvock.cC', 'Admin'),
(93, 'user90', '$2y$10$Xw7q635Bmaue.97v3NPbp.Zfekm4/3YLNM3TP5jTvVC.SE4JdD5Fa', 'Admin'),
(94, 'user91', '$2y$10$nYU0p1rlhZRGja65lD5hveCkK4062Wqv7LluCPGMB0qNjFu/qC6xG', 'Editor'),
(95, 'user92', '$2y$10$7.EeohFdboz2KphlZKc7QeYcbAT50Scth29jvnNcHeCljPjrAaZI6', 'User'),
(96, 'user93', '$2y$10$.aK14RFbLo7P8WIFbpDC..rhrZABiCi.nqV7VBfISv25F2jYiH7cK', 'Admin'),
(97, 'user94', '$2y$10$kPu/S.dLAaZ5S3aIZGclneh/wEqcTdmFcgJjrvEhmzA77AWDMx2eu', 'User'),
(98, 'user95', '$2y$10$GDZ63pbxbToSb/FYlClE8O75x3nt8iiUUkkzeRz8t055.02HxRqQ2', 'Editor'),
(99, 'user96', '$2y$10$Grz..CsN6Gq/W2nb1MUB1uo7RYmjau9IGKT.x5Hzmb4upIJF5.pN2', 'Admin'),
(100, 'user97', '$2y$10$XHjqxKconUDg6T/HPilBAecFr2yWMfZUOBm7gT6die/HmOJJwIbX6', 'Admin'),
(101, 'user98', '$2y$10$.CMlKeuxnWXKcl.VT1cr7exgecXv37TpdOaxR31R0dW1viZW7hXI2', 'User'),
(102, 'user99', '$2y$10$zDzDQngQlw8EHAp7T72xv.jOrDPpYBzCLzjnu9vz9K5WbEcspyXES', 'Editor'),
(103, 'user100', '$2y$10$SD/APRmd5DH.qQ42FL7PRuz/sWK7uk9x2hhXegW6KsG0BFaMbi7de', 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
