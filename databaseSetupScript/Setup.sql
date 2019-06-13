-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 12, 2019 at 09:15 PM
-- Server version: 10.1.38-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CommandCenter`
--

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `exercise_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `name`, `exercise_type_id`) VALUES
(1, 'Front Squats', 4),
(2, 'Planks', 2),
(3, 'Mountain Jumpers', 3),
(5, 'Squat Press', 4),
(6, 'Dragon Rolls', 2),
(7, 'Bench Press', 1),
(8, 'Kettlebell Squats', 4),
(9, 'Overhead Press', 1),
(10, 'Bent Over Row', 1),
(11, 'Deadlift', 4),
(13, 'Romanian Deadlift', 4),
(14, 'Weighted Hip Thrust', 4),
(15, 'Bulgarian Split Squat', 4),
(16, 'Weighted Lunges', 4),
(17, 'Calf Raises', 4),
(18, 'Plank Weights', 1),
(19, 'Crunches', 2),
(20, 'Bicycle', 2),
(21, 'Fire Hydrants', 2),
(22, 'Donkey Kicks', 2),
(23, 'Wall Sits', 2),
(24, 'Side Crunches', 2),
(25, 'Flutter Kicks', 2),
(26, 'Russian Twists', 2),
(27, 'Boat Holds', 2),
(28, 'Broad Jump', 3),
(29, 'Squat Jacks', 3),
(30, 'Jumping Jacks', 3),
(31, 'Jumping Lunges', 3),
(32, 'Skiers', 3),
(33, 'Box Jumps', 3),
(34, 'Step-ups', 3),
(35, 'Interval Cardio', 3),
(36, 'Squat Jumps', 3),
(38, 'Bicep Curls', 1),
(39, 'Burpees', 3);

-- --------------------------------------------------------

--
-- Table structure for table `exercises_workouts`
--

CREATE TABLE `exercises_workouts` (
  `id` int(11) NOT NULL,
  `workout_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exercises_workouts`
--

INSERT INTO `exercises_workouts` (`id`, `workout_id`, `exercise_id`) VALUES
(3, 1, 2),
(6, 1, 5),
(4, 1, 7),
(2, 1, 13),
(1, 1, 21),
(5, 1, 36);

-- --------------------------------------------------------

--
-- Table structure for table `exercise_types`
--

CREATE TABLE `exercise_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exercise_types`
--

INSERT INTO `exercise_types` (`id`, `name`) VALUES
(3, 'Calisthenics'),
(2, 'Toning'),
(1, 'Weights Arms'),
(4, 'Weights Legs');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created`, `modified`) VALUES
(10, 'admin', 'djj211.tveditor@gmail.com', '$2y$10$Jz0wMEjJdiqXr4O8l8rgUO9AoTXz9SMYTtvnjQbzG71CLioaJLFxS', 'admin', '2016-03-09 16:45:00', '2016-03-23 16:13:39'),
(50, 'mjones', 'melaniemanero@gmail.com', '$2y$10$oyflv6qVNBVw6iYooQ18iOO4QzkfUgYJJA7CM6EiYjm13iIQDPz7y', 'manage', '2016-03-23 12:12:48', '2019-02-01 23:39:49'),
(51, 'djj211', 'djj211@gmail.com', '$2y$10$NBJ6.lGsoDrM8KSNsZkfe.y3Ril4dlQ5V43bFefWeuT6pY2oYWFqu', 'manage', '2016-03-23 12:13:59', '2019-01-31 23:45:51'),
(52, 'test123', 'test@test.com', '$2y$10$x0jF.il9GN8QeMyK4dkBKe0/vsv.SuI6tT2wPq87veHxgZfsZH4QW', 'read', '2016-12-11 22:30:22', '2017-12-29 01:35:19'),
(53, 'furmson', 'fran.urmson@gmail.com', '$2y$10$AhWXKI2Ym9DdFWJWO7BWle98vrjpx8cu2XPqeXAg6FJqaJr79I3cK', 'manage', '2019-05-25 18:32:41', '2019-05-25 22:32:41');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `users_insert_trigger` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
SET time_zone = 'America/New_York';
IF NEW.created = '0000-00-00 00:00:00' THEN
SET NEW.created = NOW();
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_keep_logins`
--

CREATE TABLE `users_keep_logins` (
  `id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` char(128) NOT NULL,
  `seriesId` char(128) NOT NULL,
  `token` char(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_keep_logins`
--

INSERT INTO `users_keep_logins` (`id`, `user_id`, `username`, `seriesId`, `token`) VALUES
(28, 10, '5a8fcabcd7118b9b3e5ec80c3c54aa07bc47e7cf6fc64d9612e4ca0c79cf133c', '8571250c077b799e586f8749691d2740beb2d98e5b1192a32394a6ab92def97c', 'c4ccb5d371f0b18a44791a1b67fc40c3fdb131b2ff7d1772b7a65c8988e6722f'),
(41, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'e8acb831aaf3cbd7e821212cb672d421872ea2402e708345acf38c076ed17094', '2755035335c280d06b153b210b18c53feebb5c5d9da6917d8200d28dc66a5374'),
(42, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'ef3c777cff0ded2cd1a47a152f76cbfc3c7ce8e884b183c23ce8aff96f821f9c', '2119a5b0cd6887dadf894cd45ae179252b46dc91dd92b51c60162746ba9da680'),
(45, 10, '5a8fcabcd7118b9b3e5ec80c3c54aa07bc47e7cf6fc64d9612e4ca0c79cf133c', '27e5294fde99daf6b8124c43143223e080829170578df123d010d0242beeed12', 'fb3842ab17b1bb66259f3319c53dd29f26eead4bff9f8005ac13a7f52f1f1471'),
(47, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'afb82171ca897b35de70bec39f8d12059601fe4aa7458af2b8d731280bc5d5da', '80976c315ca703c73c8e4c3e89364b4418a6634d147e293e79a109f23028b959'),
(48, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'ec5e445e7f6944011e28b52a20ae6ca0ea9bf1292da1735963b6949b223b518e', '0a4c96939f939c52a410ccea235ff06161ba3bb765d843085cacbef61503a1dd'),
(54, 10, '5a8fcabcd7118b9b3e5ec80c3c54aa07bc47e7cf6fc64d9612e4ca0c79cf133c', '780024764316adccad7e99ba111ee4c0de79948da1aef178af1c514518ad854c', '0121947aa7bb551bcd2a15c9fb06604c2a7a15ac7597917aee6ac065c1de21ac'),
(56, 10, '5a8fcabcd7118b9b3e5ec80c3c54aa07bc47e7cf6fc64d9612e4ca0c79cf133c', '5b9c52efe7ce53c95ba563a3f3b4a7ef41aea6a8e058c999c4edf9d97a3410fd', '7e241ee62ffea9e64b293c96b1c396b0f8cb3dafce8a4a23ed99b3f76dd5a2ae'),
(57, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '48f77218334f5fa18208002dd6e81f7afc07462d65c3f2974dcb930d5fd5ba15', 'fc85635f5c862f422ec2c9d6864c9682dbb31843a8048a246c69b953476b275a'),
(59, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '4deeeafee5edc2d2e58229f3ff72b2eec624b75ebbd67f272fac74635d0c1f78', '8d08c4e75fd4901e3c49b267f7aa6172ee1b99ddde10e5e633a7750f90ad2fdc'),
(61, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'd2eace24216d84b9cf4edca0affea650688706b0ccbdf783ed8ae9e9f21543d6', 'f9e1ad8a140b436a87e445418eb34d9c35ab5104e5005f746c162b143ff455e3'),
(62, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '0bc7fa0ef52fd6da55fba2ab905179fbf4486b6caa4d60a2dd29253fc7e13423', 'c289ebf3d5bb91c93aee9c28b102bdcac5f634da0f76451065854ecaabdc52f9'),
(63, 10, '5a8fcabcd7118b9b3e5ec80c3c54aa07bc47e7cf6fc64d9612e4ca0c79cf133c', '930ac134babca17f63bb928215b3b416ac0b8a7a560f4255eac6b0cd99758ac1', 'e2312c55a3a9208cccdbb997a9746dbf0cbf491e4587f4c64ee38d2535b8a115'),
(68, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'a919dff755e86261d37a14e94f9b25fb3439420246764e16801e6e8e5b4828ac', '2633eb8b46476ad2df2f0915552f0b44b1f736522ae4f960ebc2eb2dd1390c0f'),
(69, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '6dc37253037db05332a8f767fe2bff467bdf4e96ce616f7ad524b069037abee6', '04d0cc531d270fdfc7c3793699336db5453054630fb41958b6b920006327df1d'),
(71, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '9d8fe5cfd358316b7ecb9862c65455d0bc64de2c14db2d92893b86631d637353', 'aebbbf13c4b9278d2f607a9612e4cdf33c887abd0bf6ebc90cf7764c26a8025f'),
(72, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '9d1a5940fc7600ef426bbc0cffbf6d0671031960cc81c65bbea89712ca73295b', '462adea0b0fe9833155a6f23ba8542ad9bf78a3282f147244fa8a997a991fe6a'),
(75, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '141d4e9f4d8ef7cbbbefde80f04ae887ccb6dacd1105e51cc2fbaea0e5291277', '6fb902bcd9a1d9051d4e2255e061d88dcefa12fe53a7aaf7e81f9a004bb9a92a'),
(77, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'e45c7aa4a5fb4254af6bd4fbe0c8bf8c4ab341e3eb187fd546f51e74ffdcd225', '222796411e215781140fa75582be2e1efec56092257def3505d495f149309706'),
(78, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '1de395eb03f92a268c1b523f3f5b9727d7c0fb2f1efcedbf52b1d006decdf8b9', 'ec6a5108449ca11923b5c70b92a5fe1fc2ee0042dfe4be062a3699dcb7bf0431'),
(79, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'cfcf0d6f06b0095c75e7240946851a1a79e434d3e99ac7f3ae0f595b9fdf6a19', 'dee491b9ca457b6f6cba35ff8fd1db2f9fbf82549266596bc23607dd6dc59ad2'),
(81, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '0302f8ab6996b1a6d129566befd60d94109ffb321a8e36e12b9bfe1324c5bd6c', 'e5f31e6933b904ce0a49e5321416ce45ee1e7f5e8d4fd465c5130a09c9af9881'),
(82, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '237637347b282b7debae0e634ff8d552cd004548407cc9f194dc3994f7a05b40', 'e7b1eaaad6983c615297f44aa14fba0a7f854673eb15ed7ef973b9aa53cbbb66'),
(85, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '823eb2dc5f30b9cb09425ef58f390b624fc8064f1400b7baf72437bccf253972', 'c97c851c0a6e60e913cf642e61065a21a15b4ff2bdcbf39d0094c952a9db6c05'),
(86, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '9c141e855541133f8051ff3d507bbaea01edc7448a3bd0cf6236431bced5af99', 'aed6dcc2f42a9695a8f5ad8df217e0d41f758d28653ef93efac429a2d953f727'),
(87, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'df8679672823888d837a373384d22fb568ea28e30e79e465c8173c66f866b06d', '10fd7b088a7470b2feee8dda09450237aec8f133c58dceed92848337e45c6039'),
(89, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '427abe2f9e614cecb592ad4219244d5f74d43f4bd8868035e19b1e8b388db561', 'a9fced89364a221ec4033fd74cd002fb0b8d62092bd236e672c2a4d05c92440f'),
(91, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '7f4ead8cac4b2ab05153b61c6f97d10c69536e9390c3644ad1b6fe83d5688bbb', '491a4d37d021f0885046fc29bed5c7008ab350b7fdbb70cf7bd2c418f97a9cae'),
(102, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'dd2d5ed09ee3b2f348a4304e6007752eee244bf940edc0468ba57344408ca647', 'f25f198e38c0a41b66a7bd132d2133928821cb041ab1df7acd3280d42904b90a'),
(108, 10, '5a8fcabcd7118b9b3e5ec80c3c54aa07bc47e7cf6fc64d9612e4ca0c79cf133c', 'ee9411f8c6754fd9c4fa4eacfeb925fffb3ec4ea37c5603077b86b96de1473c4', 'f24dd7cdc0cb57f9ee660c44e33822690ae1b01ff1016565f567197f104782c4'),
(109, 10, '5a8fcabcd7118b9b3e5ec80c3c54aa07bc47e7cf6fc64d9612e4ca0c79cf133c', '80ca660cf3dc1eb41886cf8e4cb84fe5df27be42acf6a0edf755e450c04b5fef', '598d8345be79dc412e953926f968f4c75ead191e70f3c91b8c24ddea3944d5b0'),
(110, 50, 'cec92112c81e6adf03293c4295e9773170f7bbd3555643aa06d58db5d003751f', '0c0f33acddbb36c3abea2ad31fa887d9fa41e911931b1b6e864e0cde5fe00c15', '7c66f03b131a70885b86385746d93189e996ef12868e69873e3d628752e126ef'),
(111, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'fdfc61864568dc3128b0bf90854796ab98a766ad84db2d631883723c9c4beb8e', '363bc74fa66ef3daed8bf2406cd4f783bb95c47965e4ed620ae0ffa1172c12ca'),
(114, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'da2b4ae4a5005be04e73b3aadc957c6c93e244814f643c8a4f02097afc756f16', '40f35279fd3d3bc0a1221a1f857295b64ee797f2a1a1bb595a9d74764acb34bd'),
(116, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '4e29cf3f9d7b384ca6101c0fcda611df7d919cbea8113118131c414bb929b50c', '605e1190145d1a9569c620396f73296c439de048c55bc0cb42ee0267f5e06f87'),
(117, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', '2cc76d88ae611add776fac24fcea7d2568d7bc28782346ab40c5fd79cd9e78b0', '0538b8a3be23bd7b3d09387080884e8ef1d9919f063f3ba72adea6eb52b09afb'),
(118, 51, '01a9a7de890b4a5a962aa81af955953d6a7198e943612d667f0517b7c57dcbb8', 'a1d8ca5742e6ce214867db9632acb6eb98696e62fccc0463bfda813be379b910', 'ca269fc70f6f788673788136e7e06e14d639760eb9680cd2d6f6b278583ba3fd');

-- --------------------------------------------------------

--
-- Table structure for table `users_login_attempts`
--

CREATE TABLE `users_login_attempts` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_preferences`
--

CREATE TABLE `users_preferences` (
  `user_id` int(11) NOT NULL,
  `theme` varchar(20) DEFAULT NULL,
  `plex_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_preferences`
--

INSERT INTO `users_preferences` (`user_id`, `theme`, `plex_id`) VALUES
(10, 'Fire', NULL),
(50, 'Default', 18),
(51, 'Ice', 10),
(52, 'Forest', 1),
(53, 'Default', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_reset_passwords`
--

CREATE TABLE `users_reset_passwords` (
  `user_id` int(10) NOT NULL,
  `ticket` char(128) NOT NULL,
  `reset` varchar(40) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_reset_passwords`
--

INSERT INTO `users_reset_passwords` (`user_id`, `ticket`, `reset`, `time`) VALUES
(10, 'ac35ad5c6b2b9b1edb1c959f07f92791d44ee66edacde33d4d96f57cd0ea599b', 'wNovE5', '6/5/19, 10:09 AM');

-- --------------------------------------------------------

--
-- Table structure for table `workouts`
--

CREATE TABLE `workouts` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workouts`
--

INSERT INTO `workouts` (`id`, `created`) VALUES
(1, '2019-06-03 19:17:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `FK_exercise_type` (`exercise_type_id`);

--
-- Indexes for table `exercises_workouts`
--
ALTER TABLE `exercises_workouts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workout_id` (`workout_id`,`exercise_id`),
  ADD KEY `exercise_id` (`exercise_id`);

--
-- Indexes for table `exercise_types`
--
ALTER TABLE `exercise_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `users_keep_logins`
--
ALTER TABLE `users_keep_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token` (`token`,`username`),
  ADD KEY `user_id` (`user_id`,`token`);

--
-- Indexes for table `users_login_attempts`
--
ALTER TABLE `users_login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`time`);

--
-- Indexes for table `users_preferences`
--
ALTER TABLE `users_preferences`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `plex_id` (`plex_id`);

--
-- Indexes for table `users_reset_passwords`
--
ALTER TABLE `users_reset_passwords`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `ticket` (`ticket`,`time`);

--
-- Indexes for table `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `created` (`created`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `exercises_workouts`
--
ALTER TABLE `exercises_workouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `exercise_types`
--
ALTER TABLE `exercise_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `users_keep_logins`
--
ALTER TABLE `users_keep_logins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `users_login_attempts`
--
ALTER TABLE `users_login_attempts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `workouts`
--
ALTER TABLE `workouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `exercises_ibfk_1` FOREIGN KEY (`exercise_type_id`) REFERENCES `exercise_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exercises_workouts`
--
ALTER TABLE `exercises_workouts`
  ADD CONSTRAINT `exercises_workouts_ibfk_1` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exercises_workouts_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_keep_logins`
--
ALTER TABLE `users_keep_logins`
  ADD CONSTRAINT `users_keep_logins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_login_attempts`
--
ALTER TABLE `users_login_attempts`
  ADD CONSTRAINT `users_login_attempts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_preferences`
--
ALTER TABLE `users_preferences`
  ADD CONSTRAINT `users_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_reset_passwords`
--
ALTER TABLE `users_reset_passwords`
  ADD CONSTRAINT `users_reset_passwords_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
