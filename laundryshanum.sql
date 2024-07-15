-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2024 at 03:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundryshanum`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--
-- Error reading structure for table laundryshanum.customer: #1932 - Table &#039;laundryshanum.customer&#039; doesn&#039;t exist in engine
-- Error reading data for table laundryshanum.customer: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `laundryshanum`.`customer`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--
-- Error reading structure for table laundryshanum.employee: #1932 - Table &#039;laundryshanum.employee&#039; doesn&#039;t exist in engine
-- Error reading data for table laundryshanum.employee: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `laundryshanum`.`employee`&#039; at line 1

-- --------------------------------------------------------

--
-- Stand-in structure for view `horizontal_view`
-- (See below for the actual view)
--
CREATE TABLE `horizontal_view` (
);

-- --------------------------------------------------------

--
-- Table structure for table `log_table`
--
-- Error reading structure for table laundryshanum.log_table: #1932 - Table &#039;laundryshanum.log_table&#039; doesn&#039;t exist in engine
-- Error reading data for table laundryshanum.log_table: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `laundryshanum`.`log_table`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `new_table`
--
-- Error reading structure for table laundryshanum.new_table: #1932 - Table &#039;laundryshanum.new_table&#039; doesn&#039;t exist in engine
-- Error reading data for table laundryshanum.new_table: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `laundryshanum`.`new_table`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--
-- Error reading structure for table laundryshanum.orders: #1932 - Table &#039;laundryshanum.orders&#039; doesn&#039;t exist in engine
-- Error reading data for table laundryshanum.orders: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `laundryshanum`.`orders`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--
-- Error reading structure for table laundryshanum.order_details: #1932 - Table &#039;laundryshanum.order_details&#039; doesn&#039;t exist in engine
-- Error reading data for table laundryshanum.order_details: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `laundryshanum`.`order_details`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `service`
--
-- Error reading structure for table laundryshanum.service: #1932 - Table &#039;laundryshanum.service&#039; doesn&#039;t exist in engine
-- Error reading data for table laundryshanum.service: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `laundryshanum`.`service`&#039; at line 1

--
-- Triggers `service`
--
DELIMITER $$
CREATE TRIGGER `after_service_delete` AFTER DELETE ON `service` FOR EACH ROW BEGIN
    INSERT INTO log_table (log_message) VALUES (CONCAT('Service ', OLD.service_name, ' deleted after'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_service_insert` AFTER INSERT ON `service` FOR EACH ROW BEGIN
    INSERT INTO log_table (log_message) VALUES (CONCAT('Service ', NEW.service_name, ' inserted'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_service_update` AFTER UPDATE ON `service` FOR EACH ROW BEGIN
    INSERT INTO log_table (log_message) VALUES (CONCAT('Service ', NEW.service_name, ' updated'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_service_delete` BEFORE DELETE ON `service` FOR EACH ROW BEGIN
    INSERT INTO log_table (log_message) VALUES (CONCAT('Service ', OLD.service_name, ' deleted'));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_service_insert` BEFORE INSERT ON `service` FOR EACH ROW BEGIN
    SET NEW.price = IFNULL(NEW.price, 0.00);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_service_update` BEFORE UPDATE ON `service` FOR EACH ROW BEGIN
    SET NEW.updated_at = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `service_employee`
--
-- Error reading structure for table laundryshanum.service_employee: #1932 - Table &#039;laundryshanum.service_employee&#039; doesn&#039;t exist in engine
-- Error reading data for table laundryshanum.service_employee: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `laundryshanum`.`service_employee`&#039; at line 1

-- --------------------------------------------------------

--
-- Stand-in structure for view `vertical_view`
-- (See below for the actual view)
--
CREATE TABLE `vertical_view` (
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_inside_view`
-- (See below for the actual view)
--
CREATE TABLE `view_inside_view` (
);

-- --------------------------------------------------------

--
-- Structure for view `horizontal_view`
--
DROP TABLE IF EXISTS `horizontal_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `horizontal_view`  AS SELECT `service`.`service_name` AS `service_name`, `service`.`price` AS `price` FROM `service` ;

-- --------------------------------------------------------

--
-- Structure for view `vertical_view`
--
DROP TABLE IF EXISTS `vertical_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vertical_view`  AS SELECT `service`.`service_id` AS `service_id`, `service`.`service_name` AS `service_name`, `service`.`price` AS `price` FROM `service` ;

-- --------------------------------------------------------

--
-- Structure for view `view_inside_view`
--
DROP TABLE IF EXISTS `view_inside_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_inside_view`  AS SELECT `with check option`.`service_name` AS `service_name`, `with check option`.`price` AS `price` FROM `horizontal_view` AS `with check option` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
