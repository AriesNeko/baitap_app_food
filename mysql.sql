/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `food_types`;
CREATE TABLE `food_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(50) DEFAULT NULL,
  `food_image` varchar(100) DEFAULT NULL,
  `food_price` float NOT NULL,
  `food_desc` varchar(250) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` timestamp NULL DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `like_status` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `arr_sub_id` varchar(50) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` timestamp NULL DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE `restaurants` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(50) DEFAULT NULL,
  `res_image` varchar(100) DEFAULT NULL,
  `res_desc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_foods`;
CREATE TABLE `sub_foods` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(50) DEFAULT NULL,
  `sub_price` float NOT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_foods_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_full_name` varchar(50) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food_types` (`type_id`, `type_name`) VALUES
(1, 'Japanese');
INSERT INTO `food_types` (`type_id`, `type_name`) VALUES
(2, 'Korean');
INSERT INTO `food_types` (`type_id`, `type_name`) VALUES
(3, 'Viet Nam');
INSERT INTO `food_types` (`type_id`, `type_name`) VALUES
(4, 'Sushi'),
(5, 'Ramen'),
(6, 'Grill'),
(7, 'Fruit'),
(8, 'Seafood'),
(9, 'Vegetable'),
(10, 'Meat');

INSERT INTO `foods` (`food_id`, `food_name`, `food_image`, `food_price`, `food_desc`, `type_id`) VALUES
(2, 'groupware', 'http://dummyimage.com/143x243.png/cc0000/ffffff', 60.06, 'Skeletal x-ray of thigh, knee, and lower leg', 4);
INSERT INTO `foods` (`food_id`, `food_name`, `food_image`, `food_price`, `food_desc`, `type_id`) VALUES
(3, 'Extended', 'http://dummyimage.com/148x203.png/cc0000/ffffff', 45.07, 'Fasciotomy of hand', 9);
INSERT INTO `foods` (`food_id`, `food_name`, `food_image`, `food_price`, `food_desc`, `type_id`) VALUES
(4, 'fresh-thinking', 'http://dummyimage.com/154x227.png/5fa2dd/ffffff', 57.51, 'Closure of cystostomy', 3);
INSERT INTO `foods` (`food_id`, `food_name`, `food_image`, `food_price`, `food_desc`, `type_id`) VALUES
(5, 'human-resource', 'http://dummyimage.com/161x248.png/5fa2dd/ffffff', 81.9, 'Flexible sigmoidoscopy', 10),
(6, '3rd generation', 'http://dummyimage.com/226x208.png/dddddd/000000', 79.9, 'Biopsy of eyelid', 1),
(7, 'pricing structure', 'http://dummyimage.com/144x168.png/cc0000/ffffff', 90.38, 'Other cataract extraction', 4),
(8, 'Visionary', 'http://dummyimage.com/166x135.png/cc0000/ffffff', 29.15, 'Incision of uvula', 8),
(9, 'Programmable', 'http://dummyimage.com/138x155.png/5fa2dd/ffffff', 45.83, 'Other septoplasty', 8),
(10, 'coherent', 'http://dummyimage.com/231x169.png/cc0000/ffffff', 52.75, 'Puncture of spleen', 1),
(11, 'functionalities', 'http://dummyimage.com/209x212.png/dddddd/000000', 42.85, 'Implantation of electronic ureteral stimulator', 10),
(12, 'bi-directional', 'http://dummyimage.com/102x139.png/ff4444/ffffff', 24.11, 'Other diagnostic procedures on testes', 8),
(13, 'Open-source', 'http://dummyimage.com/231x227.png/ff4444/ffffff', 80.84, 'Amputation and disarticulation of thumb', 7),
(14, 'scalable', 'http://dummyimage.com/102x178.png/dddddd/000000', 41.62, 'Removal of spinal neurostimulator lead(s)', 8),
(15, 'Focused', 'http://dummyimage.com/163x228.png/cc0000/ffffff', 65.59, 'Correction of fetal defect', 10),
(16, 'Public-key', 'http://dummyimage.com/243x244.png/ff4444/ffffff', 56.23, 'Removal of spinal thecal shunt', 5),
(17, 'Programmable', 'http://dummyimage.com/164x208.png/cc0000/ffffff', 36.31, 'Internal drainage of pancreatic cyst', 5),
(18, 'demand-driven', 'http://dummyimage.com/117x224.png/5fa2dd/ffffff', 78.46, 'Other reconstruction of eyelid, full-thickness', 2),
(19, 'Persevering', 'http://dummyimage.com/179x208.png/cc0000/ffffff', 24.83, 'Mechanical vitrectomy by anterior approach', 7),
(20, '24 hour', 'http://dummyimage.com/191x141.png/5fa2dd/ffffff', 17.47, 'Other diagnostic procedures on cornea', 5),
(21, 'Versatile', 'http://dummyimage.com/142x214.png/dddddd/000000', 90, 'Anorectal myectomy', 1),
(22, 'Extended', 'http://dummyimage.com/156x151.png/cc0000/ffffff', 18.67, 'Synovectomy, foot and toe', 6),
(23, 'Up-sized', 'http://dummyimage.com/117x190.png/cc0000/ffffff', 94.69, 'Extracapsular extraction of lens by simple aspiration (and irrigation) technique', 3),
(24, 'fault-tolerant', 'http://dummyimage.com/100x131.png/dddddd/000000', 49.5, 'Open and other replacement of unspecified heart valve', 8),
(25, 'pricing structure', 'http://dummyimage.com/142x190.png/ff4444/ffffff', 33.61, 'Labial frenectomy', 1),
(26, 'bi-directional', 'http://dummyimage.com/165x197.png/ff4444/ffffff', 74.31, 'Intra-abdominal venous shunt', 5),
(27, 'Proactive', 'http://dummyimage.com/201x145.png/dddddd/000000', 13.77, 'Low forceps operation with episiotomy', 3),
(28, 'paradigm', 'http://dummyimage.com/159x233.png/cc0000/ffffff', 3.89, 'Synovectomy, elbow', 8),
(29, 'client-driven', 'http://dummyimage.com/130x171.png/ff4444/ffffff', 88.77, 'Closed biopsy of skin and subcutaneous tissue', 8),
(30, 'portal', 'http://dummyimage.com/104x215.png/cc0000/ffffff', 44.14, 'Vaccination against yellow fever', 1),
(31, 'focus group', 'http://dummyimage.com/162x223.png/5fa2dd/ffffff', 6.65, 'Suture of laceration of testis', 2),
(32, 'info-mediaries', 'http://dummyimage.com/166x201.png/dddddd/000000', 59, 'Laparoscopic repair of diaphragmatic hernia, with thoracic approach', 5),
(33, 'empowering', 'http://dummyimage.com/180x152.png/cc0000/ffffff', 29.32, 'Excision of major lesion of eyelid, full-thickness', 1),
(34, 'instruction set', 'http://dummyimage.com/228x139.png/dddddd/000000', 69.53, 'Excision or destruction of intervertebral disc, unspecified', 2),
(35, 'motivating', 'http://dummyimage.com/119x181.png/dddddd/000000', 53, 'Incisional hernia repair', 5),
(36, 'foreground', 'http://dummyimage.com/197x184.png/5fa2dd/ffffff', 44.95, 'Magnetic resonance imaging of spinal canal', 8),
(37, 'challenge', 'http://dummyimage.com/214x165.png/dddddd/000000', 81.49, 'Reconstruction of external auditory canal', 3),
(38, 'secured line', 'http://dummyimage.com/159x152.png/dddddd/000000', 21.28, 'Other suture of flexor tendon of hand', 8),
(39, 'Organized', 'http://dummyimage.com/149x190.png/dddddd/000000', 68.32, 'Repair of esophageal stricture', 9),
(40, 'orchestration', 'http://dummyimage.com/246x104.png/ff4444/ffffff', 31.15, 'Choledochoplasty', 4),
(41, 'focus group', 'http://dummyimage.com/168x174.png/5fa2dd/ffffff', 22.97, 'Fracture of the turbinates', 9),
(42, 'Innovative', 'http://dummyimage.com/131x223.png/dddddd/000000', 68.03, 'Removal of tracheostomy tube', 2),
(43, 'Adaptive', 'http://dummyimage.com/106x203.png/5fa2dd/ffffff', 47.04, 'Excision or destruction of testicular lesion', 5),
(44, 'complexity', 'http://dummyimage.com/206x155.png/cc0000/ffffff', 17.93, 'Microscopic examination of specimen from lower gastrointestinal tract and of stool, parasitology', 1),
(45, 'forecast', 'http://dummyimage.com/170x184.png/dddddd/000000', 51.31, 'Administration of measles-mumps-rubella vaccine', 2),
(46, 'access', 'http://dummyimage.com/237x135.png/ff4444/ffffff', 26.46, 'Removal of foreign body from foot without incision', 3),
(47, 'Exclusive', 'http://dummyimage.com/236x142.png/ff4444/ffffff', 57.73, 'Endoscopic excision or destruction of lesion or tissue of pancreatic duct', 3),
(48, 'logistical', 'http://dummyimage.com/202x220.png/ff4444/ffffff', 79.72, 'Skeletal x-ray of upper limb, not otherwise specified', 6),
(49, 'initiative', 'http://dummyimage.com/115x124.png/ff4444/ffffff', 64.81, 'Other corneal transplant', 6),
(50, 'intermediate', 'http://dummyimage.com/198x203.png/ff4444/ffffff', 67.85, 'Other x-ray of cervical spine', 10),
(51, 'modular', 'http://dummyimage.com/206x135.png/5fa2dd/ffffff', 42.96, 'Closure of intestinal stoma, not otherwise specified', 7);

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `id`, `like_status`) VALUES
(4, 5, '2023-05-05 01:18:28', 1, 1);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `id`, `like_status`) VALUES
(8, 5, '2022-12-07 13:08:44', 2, 0);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `id`, `like_status`) VALUES
(10, 1, '2022-09-12 19:51:29', 3, 0);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `id`, `like_status`) VALUES
(6, NULL, NULL, 4, 1),
(7, 3, '2023-06-19 15:11:08', 5, 1),
(1, 4, '2022-11-10 21:48:52', 6, 1),
(2, 2, '2022-12-19 05:04:29', 7, 0),
(7, 5, '2022-11-02 06:15:54', 8, 0),
(9, 5, '2023-03-05 06:01:42', 9, 0),
(8, 1, '2023-05-18 16:17:49', 10, 0),
(2, 2, '2023-01-28 10:19:52', 11, 1),
(8, 2, '2023-01-04 06:27:51', 12, 0),
(1, 3, '2022-11-22 04:18:58', 13, 0),
(7, 4, '2022-09-23 06:32:16', 14, 0),
(10, 5, '2023-07-06 02:30:54', 15, 0),
(5, NULL, NULL, 16, 0),
(3, 4, '2023-05-25 04:03:04', 17, 0),
(2, 5, '2023-05-24 15:29:37', 18, 1),
(10, 2, '2023-04-25 11:19:17', 19, 0),
(10, 3, '2023-08-12 00:45:27', 20, 1);

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `id`) VALUES
(9, 16, 611, '6557199579', '03-956-5710', 1);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `id`) VALUES
(1, 12, 862, '7045348983', '32-935-0214', 2);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `id`) VALUES
(8, 36, 448, '196313163', '87-111-1021', 3);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `id`) VALUES
(4, 27, 743, '978083946', '58-971-7898', 4),
(9, 7, 834, '5589531926', '19-748-7836', 5),
(8, 35, 938, '9691114143', '37-235-1118', 6),
(2, 9, 602, '8615252866', '81-099-4523', 7),
(1, 17, 196, '7770654963', '55-008-1916', 8),
(8, 19, 724, '2956268457', '73-016-0689', 9),
(2, 13, 283, '6434056540', '23-815-7403', 10),
(1, 11, 596, '5707767932', '98-338-9072', 11),
(2, 42, 121, '55356621', '70-950-8015', 12),
(8, 27, 365, '7065584143', '58-334-0831', 13),
(2, 24, 173, '26194732', '68-538-4286', 14),
(9, 4, 860, '4333508193', '92-408-3113', 15),
(2, 4, 222, '7949418192', '44-860-7382', 16),
(5, NULL, NULL, '', '', 17),
(10, 10, 99, '9612553084', '90-296-7651', 18),
(9, 6, 438, '4997083801', '52-832-8718', 19),
(6, NULL, NULL, '', '', 20),
(3, 16, 298, '1771752718', '91-326-1211', 21),
(7, 39, 777, '1540762483', '09-089-0568', 22),
(9, 50, 165, '2330820275', '13-302-3081', 23),
(1, 39, 369, '1578408687', '90-365-2790', 24),
(7, 38, 84, '4234656801', '63-845-2574', 25),
(2, 45, 795, '405469799', '17-298-4982', 26),
(7, 36, 835, '6795815366', '29-030-2130', 27),
(3, 27, 344, '4385319723', '76-623-3835', 28),
(2, 33, 734, '5999161169', '28-348-1196', 29),
(5, NULL, NULL, '', '', 30);

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `id`) VALUES
(3, 4, 4, '2023-09-27 16:37:03', 1);
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `id`) VALUES
(2, 4, 2, '2023-09-27 06:45:39', 2);
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `id`) VALUES
(9, 2, 1, '2022-09-15 06:09:35', 3);
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `id`) VALUES
(10, 3, 1, '2023-06-15 07:00:36', 4),
(7, 2, 2, '2023-07-02 22:14:23', 5),
(4, 5, 2, '2023-02-11 22:08:00', 6),
(2, 2, 2, '2023-05-17 20:20:33', 7),
(3, 3, 3, '2022-11-28 13:04:11', 8),
(2, 5, 5, '2023-08-09 11:16:25', 9),
(3, 3, 5, '2023-04-13 04:12:24', 10),
(2, 1, 4, '2022-11-19 02:42:26', 11),
(10, 5, 3, '2023-06-16 14:15:26', 12),
(1, 4, 4, '2023-04-23 12:15:49', 13),
(2, 5, 2, '2023-05-04 04:15:35', 14),
(1, 2, 2, '2023-07-17 02:47:34', 15),
(9, 5, 4, '2023-06-22 23:08:33', 16),
(8, 3, 2, '2023-01-28 07:32:37', 17),
(4, 4, 1, '2023-02-11 09:46:56', 18),
(1, 3, 5, '2023-03-20 14:42:00', 19),
(6, NULL, NULL, NULL, 20),
(5, NULL, NULL, NULL, 21);

INSERT INTO `restaurants` (`res_id`, `res_name`, `res_image`, `res_desc`) VALUES
(1, 'Italy restaurant', 'img1', 'nkcjsnckjackalca');
INSERT INTO `restaurants` (`res_id`, `res_name`, `res_image`, `res_desc`) VALUES
(2, 'VietNam Ngon', NULL, 'iehwfliewhf');
INSERT INTO `restaurants` (`res_id`, `res_name`, `res_image`, `res_desc`) VALUES
(3, 'Street Food', 'img2', 'hfiuhf384@');
INSERT INTO `restaurants` (`res_id`, `res_name`, `res_image`, `res_desc`) VALUES
(4, 'Korea Dish', 'img3', 'ewdeludhwedh'),
(5, 'Tokyo Deli', NULL, 'iqpiudeqpijfq');

INSERT INTO `sub_foods` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'rdaubeny0', 4.48, 5);
INSERT INTO `sub_foods` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'cbolesma1', 1.91, 7);
INSERT INTO `sub_foods` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'atrigwell2', 4.42, 8);
INSERT INTO `sub_foods` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'rwidd3', 4.05, 5),
(5, 'vklambt4', 3.75, 10);

INSERT INTO `users` (`user_id`, `user_full_name`, `user_email`, `user_password`) VALUES
(1, 'Nguyen Van A', 'abc@ymail.com', '111111');
INSERT INTO `users` (`user_id`, `user_full_name`, `user_email`, `user_password`) VALUES
(2, 'Nguyen Van B', 'abc1@ymail.com', '222222');
INSERT INTO `users` (`user_id`, `user_full_name`, `user_email`, `user_password`) VALUES
(3, 'Nguyen Van C', 'abc2@ymail.com', '333333');
INSERT INTO `users` (`user_id`, `user_full_name`, `user_email`, `user_password`) VALUES
(4, 'Nguyen Thi D', 'aaa@gmai.com', '444444'),
(5, 'Tran Thi E', 'bbb@bmail.com', 'bbbbbb'),
(6, 'Vo Van F', 'ff@mail.com', 'aaaaaa'),
(7, 'Nguyen Tien G', 'hdjs@gmail.com', '69769l'),
(8, 'Tran Trinh H', 'qqq@mai.com', '3e923jd'),
(9, 'Le Dai I', 'yyy@hmail.com', '738273k'),
(10, 'Trinh Kim J', 'hhh@jmail.com', 'he88j2k');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;