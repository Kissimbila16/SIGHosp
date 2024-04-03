-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Abr-2024 às 11:55
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `saturn`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accommodation`
--

CREATE TABLE `accommodation` (
  `accommodation_id` varchar(60) NOT NULL DEFAULT '',
  `accommodation_category_id` varchar(60) DEFAULT NULL,
  `room_number` varchar(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `accommodation_category`
--

CREATE TABLE `accommodation_category` (
  `accommodation_category_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `uri` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `accommodation_type` int(11) DEFAULT NULL COMMENT 'single room = 0, is bed = 1, has beds = 2',
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` varchar(60) NOT NULL DEFAULT '',
  `doctor_id` varchar(60) DEFAULT NULL,
  `patient_id` varchar(60) DEFAULT NULL,
  `appointment_date` int(11) DEFAULT NULL,
  `appointment_time` varchar(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bed`
--

CREATE TABLE `bed` (
  `bed_id` varchar(60) NOT NULL DEFAULT '',
  `root_accommodation_category_id` varchar(60) DEFAULT NULL,
  `bed_number` varchar(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `accommodation_category_id` varchar(60) DEFAULT NULL,
  `accommodation_id` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `blood_donor`
--

CREATE TABLE `blood_donor` (
  `blood_donor_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `mobile_number` varchar(22) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `blood_inventory_id` int(11) NOT NULL,
  `address` varchar(111) DEFAULT NULL,
  `dob` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `last_donated_on` int(11) DEFAULT NULL,
  `ssn` char(11) DEFAULT NULL,
  `profession_id` int(11) DEFAULT NULL,
  `health_status` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `blood_inventory`
--

CREATE TABLE `blood_inventory` (
  `blood_inventory_id` varchar(60) NOT NULL DEFAULT '',
  `blood_group_name` char(11) NOT NULL,
  `num_of_bags` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `blood_inventory`
--

INSERT INTO `blood_inventory` (`blood_inventory_id`, `blood_group_name`, `num_of_bags`, `updated_by`, `timestamp`) VALUES
('1', 'A+', 999, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 1672941211),
('2', 'O+', 1002, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 1672975352),
('3', 'B+', 1001, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 1672941221),
('4', 'AB+', 1002, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 1672941217),
('5', 'A-', 1000, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 1672941229),
('6', 'O-', 1001, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 1672941225),
('7', 'B-', 1001, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 1672941237),
('8', 'AB-', 1000, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 1672941233);

-- --------------------------------------------------------

--
-- Estrutura da tabela `blood_request`
--

CREATE TABLE `blood_request` (
  `blood_request_id` varchar(60) NOT NULL DEFAULT '',
  `blood_inventory_id` varchar(60) DEFAULT NULL,
  `num_of_bags` int(11) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `doctor_id` varchar(60) DEFAULT NULL,
  `blood_donor_id` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cafeteria_inventory`
--

CREATE TABLE `cafeteria_inventory` (
  `cafeteria_inventory_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `code` varchar(22) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_id` varchar(60) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cafeteria_sale`
--

CREATE TABLE `cafeteria_sale` (
  `cafeteria_sale_id` varchar(60) NOT NULL DEFAULT '',
  `status` int(11) DEFAULT NULL,
  `grand_total` int(11) DEFAULT NULL,
  `customer_name` varchar(55) DEFAULT NULL,
  `customer_mobile` varchar(22) DEFAULT NULL,
  `invoice_number` varchar(22) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cafeteria_sale_details`
--

CREATE TABLE `cafeteria_sale_details` (
  `cafeteria_sale_details_id` varchar(60) NOT NULL,
  `cafeteria_inventory_id` varchar(60) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `cafeteria_sale_id` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `certificate`
--

CREATE TABLE `certificate` (
  `certificate_id` varchar(60) NOT NULL DEFAULT '',
  `certificate_type` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `father_name` varchar(55) DEFAULT NULL,
  `mother_name` varchar(55) DEFAULT NULL,
  `ssn` varchar(15) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `dod` int(11) DEFAULT NULL,
  `address` varchar(111) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dob` int(11) DEFAULT NULL,
  `extra_note` varchar(255) DEFAULT NULL,
  `place` varchar(111) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `mobile_number` varchar(22) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `doctor_id` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `code` char(3) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `currency`
--

INSERT INTO `currency` (`currency_id`, `name`, `code`, `created_on`, `created_by`, `timestamp`, `updated_by`) VALUES
(1, 'Andorran Peseta', 'ADP', 1519583748, '1', 1519583748, '1'),
(2, 'United Arab Emirates Dirham', 'AED', 1519583748, '1', 1519583748, '1'),
(3, 'Afghanistan Afghani', 'AFA', 1519583748, '1', 1519583748, '1'),
(4, 'Albanian Lek', 'ALL', 1519583748, '1', 1519583748, '1'),
(5, 'Netherlands Antillian Guilder', 'ANG', 1519583748, '1', 1519583748, '1'),
(6, 'Angolan Kwanza', 'AOK', 1519583748, '1', 1519583748, '1'),
(7, 'Argentine Peso', 'ARS', 1519583748, '1', 1519583748, '1'),
(9, 'Australian Dollar', 'AUD', 1519583748, '1', 1519583748, '1'),
(10, 'Aruban Florin', 'AWG', 1519583748, '1', 1519583748, '1'),
(11, 'Barbados Dollar', 'BBD', 1519583748, '1', 1519583748, '1'),
(12, 'Bangladeshi Taka', 'BDT', 1519583748, '1', 1519583748, '1'),
(14, 'Bulgarian Lev', 'BGN', 1519583748, '1', 1519583748, '1'),
(15, 'Bahraini Dinar', 'BHD', 1519583748, '1', 1519583748, '1'),
(16, 'Burundi Franc', 'BIF', 1519583748, '1', 1519583748, '1'),
(17, 'Bermudian Dollar', 'BMD', 1519583748, '1', 1519583748, '1'),
(18, 'Brunei Dollar', 'BND', 1519583748, '1', 1519583748, '1'),
(19, 'Bolivian Boliviano', 'BOB', 1519583748, '1', 1519583748, '1'),
(20, 'Brazilian Real', 'BRL', 1519583748, '1', 1519583748, '1'),
(21, 'Bahamian Dollar', 'BSD', 1519583748, '1', 1519583748, '1'),
(22, 'Bhutan Ngultrum', 'BTN', 1519583748, '1', 1519583748, '1'),
(23, 'Burma Kyat', 'BUK', 1519583748, '1', 1519583748, '1'),
(24, 'Botswanian Pula', 'BWP', 1519583748, '1', 1519583748, '1'),
(25, 'Belize Dollar', 'BZD', 1519583748, '1', 1519583748, '1'),
(26, 'Canadian Dollar', 'CAD', 1519583748, '1', 1519583748, '1'),
(27, 'Swiss Franc', 'CHF', 1519583748, '1', 1519583748, '1'),
(28, 'Chilean Unidades de Fomento', 'CLF', 1519583748, '1', 1519583748, '1'),
(29, 'Chilean Peso', 'CLP', 1519583748, '1', 1519583748, '1'),
(30, 'Yuan (Chinese) Renminbi', 'CNY', 1519583748, '1', 1519583748, '1'),
(31, 'Colombian Peso', 'COP', 1519583748, '1', 1519583748, '1'),
(32, 'Costa Rican Colon', 'CRC', 1519583748, '1', 1519583748, '1'),
(33, 'Czech Republic Koruna', 'CZK', 1519583748, '1', 1519583748, '1'),
(34, 'Cuban Peso', 'CUP', 1519583748, '1', 1519583748, '1'),
(35, 'Cape Verde Escudo', 'CVE', 1519583748, '1', 1519583748, '1'),
(36, 'Cyprus Pound', 'CYP', 1519583748, '1', 1519583748, '1'),
(40, 'Danish Krone', 'DKK', 1519583748, '1', 1519583748, '1'),
(41, 'Dominican Peso', 'DOP', 1519583748, '1', 1519583748, '1'),
(42, 'Algerian Dinar', 'DZD', 1519583748, '1', 1519583748, '1'),
(43, 'Ecuador Sucre', 'ECS', 1519583748, '1', 1519583748, '1'),
(44, 'Egyptian Pound', 'EGP', 1519583748, '1', 1519583748, '1'),
(45, 'Estonian Kroon (EEK)', 'EEK', 1519583748, '1', 1519583748, '1'),
(46, 'Ethiopian Birr', 'ETB', 1519583748, '1', 1519583748, '1'),
(47, 'Euro', 'EUR', 1519583748, '1', 1519583748, '1'),
(49, 'Fiji Dollar', 'FJD', 1519583748, '1', 1519583748, '1'),
(50, 'Falkland Islands Pound', 'FKP', 1519583748, '1', 1519583748, '1'),
(52, 'British Pound', 'GBP', 1519583748, '1', 1519583748, '1'),
(53, 'Ghanaian Cedi', 'GHC', 1519583748, '1', 1519583748, '1'),
(54, 'Gibraltar Pound', 'GIP', 1519583748, '1', 1519583748, '1'),
(55, 'Gambian Dalasi', 'GMD', 1519583748, '1', 1519583748, '1'),
(56, 'Guinea Franc', 'GNF', 1519583748, '1', 1519583748, '1'),
(58, 'Guatemalan Quetzal', 'GTQ', 1519583748, '1', 1519583748, '1'),
(59, 'Guinea-Bissau Peso', 'GWP', 1519583748, '1', 1519583748, '1'),
(60, 'Guyanan Dollar', 'GYD', 1519583748, '1', 1519583748, '1'),
(61, 'Hong Kong Dollar', 'HKD', 1519583748, '1', 1519583748, '1'),
(62, 'Honduran Lempira', 'HNL', 1519583748, '1', 1519583748, '1'),
(63, 'Haitian Gourde', 'HTG', 1519583748, '1', 1519583748, '1'),
(64, 'Hungarian Forint', 'HUF', 1519583748, '1', 1519583748, '1'),
(65, 'Indonesian Rupiah', 'IDR', 1519583748, '1', 1519583748, '1'),
(66, 'Irish Punt', 'IEP', 1519583748, '1', 1519583748, '1'),
(67, 'Israeli Shekel', 'ILS', 1519583748, '1', 1519583748, '1'),
(68, 'Indian Rupee', 'INR', 1519583748, '1', 1519583748, '1'),
(69, 'Iraqi Dinar', 'IQD', 1519583748, '1', 1519583748, '1'),
(70, 'Iranian Rial', 'IRR', 1519583748, '1', 1519583748, '1'),
(73, 'Jamaican Dollar', 'JMD', 1519583748, '1', 1519583748, '1'),
(74, 'Jordanian Dinar', 'JOD', 1519583748, '1', 1519583748, '1'),
(75, 'Japanese Yen', 'JPY', 1519583748, '1', 1519583748, '1'),
(76, 'Kenyan Schilling', 'KES', 1519583748, '1', 1519583748, '1'),
(77, 'Kampuchean (Cambodian) Riel', 'KHR', 1519583748, '1', 1519583748, '1'),
(78, 'Comoros Franc', 'KMF', 1519583748, '1', 1519583748, '1'),
(79, 'North Korean Won', 'KPW', 1519583748, '1', 1519583748, '1'),
(80, '(South) Korean Won', 'KRW', 1519583748, '1', 1519583748, '1'),
(81, 'Kuwaiti Dinar', 'KWD', 1519583748, '1', 1519583748, '1'),
(82, 'Cayman Islands Dollar', 'KYD', 1519583748, '1', 1519583748, '1'),
(83, 'Lao Kip', 'LAK', 1519583748, '1', 1519583748, '1'),
(84, 'Lebanese Pound', 'LBP', 1519583748, '1', 1519583748, '1'),
(85, 'Sri Lanka Rupee', 'LKR', 1519583748, '1', 1519583748, '1'),
(86, 'Liberian Dollar', 'LRD', 1519583748, '1', 1519583748, '1'),
(87, 'Lesotho Loti', 'LSL', 1519583748, '1', 1519583748, '1'),
(89, 'Libyan Dinar', 'LYD', 1519583748, '1', 1519583748, '1'),
(90, 'Moroccan Dirham', 'MAD', 1519583748, '1', 1519583748, '1'),
(91, 'Malagasy Franc', 'MGF', 1519583748, '1', 1519583748, '1'),
(92, 'Mongolian Tugrik', 'MNT', 1519583748, '1', 1519583748, '1'),
(93, 'Macau Pataca', 'MOP', 1519583748, '1', 1519583748, '1'),
(94, 'Mauritanian Ouguiya', 'MRO', 1519583748, '1', 1519583748, '1'),
(95, 'Maltese Lira', 'MTL', 1519583748, '1', 1519583748, '1'),
(96, 'Mauritius Rupee', 'MUR', 1519583748, '1', 1519583748, '1'),
(97, 'Maldive Rufiyaa', 'MVR', 1519583748, '1', 1519583748, '1'),
(98, 'Malawi Kwacha', 'MWK', 1519583748, '1', 1519583748, '1'),
(99, 'Mexican Peso', 'MXP', 1519583748, '1', 1519583748, '1'),
(100, 'Malaysian Ringgit', 'MYR', 1519583748, '1', 1519583748, '1'),
(101, 'Mozambique Metical', 'MZM', 1519583748, '1', 1519583748, '1'),
(102, 'Namibian Dollar', 'NAD', 1519583748, '1', 1519583748, '1'),
(103, 'Nigerian Naira', 'NGN', 1519583748, '1', 1519583748, '1'),
(104, 'Nicaraguan Cordoba', 'NIO', 1519583748, '1', 1519583748, '1'),
(105, 'Norwegian Kroner', 'NOK', 1519583748, '1', 1519583748, '1'),
(106, 'Nepalese Rupee', 'NPR', 1519583748, '1', 1519583748, '1'),
(107, 'New Zealand Dollar', 'NZD', 1519583748, '1', 1519583748, '1'),
(108, 'Omani Rial', 'OMR', 1519583748, '1', 1519583748, '1'),
(109, 'Panamanian Balboa', 'PAB', 1519583748, '1', 1519583748, '1'),
(110, 'Peruvian Nuevo Sol', 'PEN', 1519583748, '1', 1519583748, '1'),
(111, 'Papua New Guinea Kina', 'PGK', 1519583748, '1', 1519583748, '1'),
(112, 'Philippine Peso', 'PHP', 1519583748, '1', 1519583748, '1'),
(113, 'Pakistan Rupee', 'PKR', 1519583748, '1', 1519583748, '1'),
(114, 'Polish Zloty', 'PLN', 1519583748, '1', 1519583748, '1'),
(116, 'Paraguay Guarani', 'PYG', 1519583748, '1', 1519583748, '1'),
(117, 'Qatari Rial', 'QAR', 1519583748, '1', 1519583748, '1'),
(118, 'Romanian Leu', 'RON', 1519583748, '1', 1519583748, '1'),
(119, 'Rwanda Franc', 'RWF', 1519583748, '1', 1519583748, '1'),
(120, 'Saudi Arabian Riyal', 'SAR', 1519583748, '1', 1519583748, '1'),
(121, 'Solomon Islands Dollar', 'SBD', 1519583748, '1', 1519583748, '1'),
(122, 'Seychelles Rupee', 'SCR', 1519583748, '1', 1519583748, '1'),
(123, 'Sudanese Pound', 'SDP', 1519583748, '1', 1519583748, '1'),
(124, 'Swedish Krona', 'SEK', 1519583748, '1', 1519583748, '1'),
(125, 'Singapore Dollar', 'SGD', 1519583748, '1', 1519583748, '1'),
(126, 'St. Helena Pound', 'SHP', 1519583748, '1', 1519583748, '1'),
(127, 'Sierra Leone Leone', 'SLL', 1519583748, '1', 1519583748, '1'),
(128, 'Somali Schilling', 'SOS', 1519583748, '1', 1519583748, '1'),
(129, 'Suriname Guilder', 'SRG', 1519583748, '1', 1519583748, '1'),
(130, 'Sao Tome and Principe Dobra', 'STD', 1519583748, '1', 1519583748, '1'),
(131, 'Russian Ruble', 'RUB', 1519583748, '1', 1519583748, '1'),
(132, 'El Salvador Colon', 'SVC', 1519583748, '1', 1519583748, '1'),
(133, 'Syrian Potmd', 'SYP', 1519583748, '1', 1519583748, '1'),
(134, 'Swaziland Lilangeni', 'SZL', 1519583748, '1', 1519583748, '1'),
(135, 'Thai Baht', 'THB', 1519583748, '1', 1519583748, '1'),
(136, 'Tunisian Dinar', 'TND', 1519583748, '1', 1519583748, '1'),
(137, 'Tongan Paanga', 'TOP', 1519583748, '1', 1519583748, '1'),
(138, 'East Timor Escudo', 'TPE', 1519583748, '1', 1519583748, '1'),
(139, 'Turkish Lira', 'TRY', 1519583748, '1', 1519583748, '1'),
(140, 'Trinidad and Tobago Dollar', 'TTD', 1519583748, '1', 1519583748, '1'),
(141, 'Taiwan Dollar', 'TWD', 1519583748, '1', 1519583748, '1'),
(142, 'Tanzanian Schilling', 'TZS', 1519583748, '1', 1519583748, '1'),
(143, 'Uganda Shilling', 'UGX', 1519583748, '1', 1519583748, '1'),
(144, 'US Dollar', 'USD', 1519583748, '1', 1519583748, '1'),
(145, 'Uruguayan Peso', 'UYU', 1519583748, '1', 1519583748, '1'),
(146, 'Venezualan Bolivar', 'VEF', 1519583748, '1', 1519583748, '1'),
(147, 'Vietnamese Dong', 'VND', 1519583748, '1', 1519583748, '1'),
(148, 'Vanuatu Vatu', 'VUV', 1519583748, '1', 1519583748, '1'),
(149, 'Samoan Tala', 'WST', 1519583748, '1', 1519583748, '1'),
(150, 'CommunautÃƒÂ© FinanciÃƒÂ¨re Africaine BEAC, Francs', 'XAF', 1519583748, '1', 1519583748, '1'),
(151, 'Silver, Ounces', 'XAG', 1519583748, '1', 1519583748, '1'),
(152, 'Gold, Ounces', 'XAU', 1519583748, '1', 1519583748, '1'),
(153, 'East Caribbean Dollar', 'XCD', 1519583748, '1', 1519583748, '1'),
(154, 'International Monetary Fund (IMF) Special Drawing Rights', 'XDR', 1519583748, '1', 1519583748, '1'),
(155, 'CommunautÃƒÂ© FinanciÃƒÂ¨re Africaine BCEAO - Francs', 'XOF', 1519583748, '1', 1519583748, '1'),
(156, 'Palladium Ounces', 'XPD', 1519583748, '1', 1519583748, '1'),
(157, 'Comptoirs FranÃƒÂ§ais du Pacifique Francs', 'XPF', 1519583748, '1', 1519583748, '1'),
(158, 'Platinum, Ounces', 'XPT', 1519583748, '1', 1519583748, '1'),
(159, 'Democratic Yemeni Dinar', 'YDD', 1519583748, '1', 1519583748, '1'),
(160, 'Yemeni Rial', 'YER', 1519583748, '1', 1519583748, '1'),
(161, 'New Yugoslavia Dinar', 'YUD', 1519583748, '1', 1519583748, '1'),
(162, 'South African Rand', 'ZAR', 1519583748, '1', 1519583748, '1'),
(163, 'Zambian Kwacha', 'ZMK', 1519583748, '1', 1519583748, '1'),
(164, 'Zaire Zaire', 'ZRZ', 1519583748, '1', 1519583748, '1'),
(165, 'Zimbabwe Dollar', 'ZWD', 1519583748, '1', 1519583748, '1'),
(166, 'Slovak Koruna', 'SKK', 1519583748, '1', 1519583748, '1'),
(167, 'Armenian Dram', 'AMD', 1519583748, '1', 1519583748, '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `custom_invoice_item`
--

CREATE TABLE `custom_invoice_item` (
  `custom_invoice_item_id` varchar(60) NOT NULL,
  `item` varchar(55) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `department`
--

CREATE TABLE `department` (
  `department_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `discharge`
--

CREATE TABLE `discharge` (
  `discharge_id` varchar(60) NOT NULL DEFAULT '',
  `occupancy_id` varchar(60) DEFAULT NULL,
  `doctor_id` varchar(60) DEFAULT NULL,
  `next_appointment` int(11) DEFAULT NULL,
  `conditions` varchar(255) DEFAULT NULL,
  `instructions` varchar(255) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `discharge_details`
--

CREATE TABLE `discharge_details` (
  `discharge_details_id` varchar(60) NOT NULL,
  `medicine_id` varchar(60) DEFAULT NULL,
  `dose` varchar(11) DEFAULT NULL,
  `medication_time` varchar(11) DEFAULT NULL,
  `discharge_id` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disease`
--

CREATE TABLE `disease` (
  `disease_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `mobile_number` varchar(22) DEFAULT NULL,
  `department_id` varchar(60) DEFAULT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  `address` varchar(111) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dob` int(11) DEFAULT NULL,
  `ssn` char(11) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `blood_inventory_id` varchar(60) DEFAULT NULL,
  `staff_category_id` varchar(60) DEFAULT NULL,
  `degrees` varchar(111) DEFAULT NULL,
  `designation` varchar(111) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `appointment_fee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `expense`
--

CREATE TABLE `expense` (
  `expense_id` varchar(60) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `month` varchar(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` varchar(60) NOT NULL DEFAULT '',
  `feedback` mediumtext NOT NULL,
  `user_id` varchar(60) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` varchar(60) NOT NULL,
  `item` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` varchar(60) NOT NULL,
  `invoice_number` varchar(22) DEFAULT NULL,
  `grand_total` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `patient_name` varchar(55) DEFAULT NULL,
  `patient_mobile` varchar(22) DEFAULT NULL,
  `patient_address` varchar(111) DEFAULT NULL,
  `patient_id` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `invoice_request`
--

CREATE TABLE `invoice_request` (
  `invoice_request_id` varchar(60) NOT NULL,
  `table_name` varchar(55) DEFAULT NULL,
  `table_row_id` varchar(60) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0 = Unpaid, 1 = Paid',
  `invoice_id` varchar(60) DEFAULT NULL,
  `patient_id` varchar(60) DEFAULT NULL,
  `item` varchar(55) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `is_custom` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `laboratory`
--

CREATE TABLE `laboratory` (
  `laboratory_id` varchar(60) NOT NULL DEFAULT '',
  `room_number` varchar(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicine`
--

CREATE TABLE `medicine` (
  `medicine_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `message`
--

CREATE TABLE `message` (
  `message_id` varchar(60) NOT NULL DEFAULT '',
  `receiver_id` varchar(60) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `module`
--

CREATE TABLE `module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `title` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `module`
--

INSERT INTO `module` (`module_id`, `name`, `title`) VALUES
(1, 'dashboard', 'Dashboard'),
(2, 'occupancies', 'Occupancies'),
(3, 'treatments', 'Treatments'),
(4, 'discharges', 'Discharges'),
(5, 'patient_meals', 'Patient Meals'),
(6, 'appointments', 'Appointments'),
(7, 'patients', 'Patients'),
(8, 'prescriptions', 'Prescriptions'),
(9, 'emergency_rosters', 'Emergency Rosters'),
(10, 'emergency_patients', 'Emergency Patients'),
(11, 'pharmacy_inventory', 'Pharmacy Inventory'),
(12, 'pharmacy_invoice', 'Pharmacy Invoice'),
(13, 'pharmacy_pos', 'Pharmacy POS'),
(14, 'pharmacy_sales', 'Pharmacy Sales'),
(15, 'pharmacy_sale_returns', 'Pharmacy Sale Returns'),
(16, 'pharmacy_units', 'Pharmacy Units'),
(17, 'cafeteria_inventory', 'Cafeteria Inventory'),
(18, 'cafeteria_pos', 'Cafeteria POS'),
(19, 'cafeteria_invoice', 'Cafeteria Invoice'),
(20, 'cafeteria_sales', 'Cafeteria Sales'),
(21, 'cafeteria_units', 'Cafeteria Units'),
(22, 'staff_categories', 'Staff Categories'),
(23, 'staff', 'Staff'),
(24, 'accommodation_categories', 'Accommodation Categories'),
(25, 'accommodations', 'Accommodations'),
(26, 'transport_categories', 'Transport Categories'),
(27, 'transports', 'Transports'),
(28, 'departments', 'Departments'),
(29, 'settings', 'Settings'),
(31, 'payroll', 'Payroll'),
(32, 'revenue', 'Revenue'),
(33, 'inventory', 'Inventory'),
(34, 'expenses', 'Expenses'),
(35, 'income_statement', 'Income Statement'),
(36, 'blood_requests', 'Blood Requests'),
(37, 'blood_inventory', 'Blood Inventory'),
(38, 'blood_donors', 'Blood Donors'),
(39, 'reports', 'Reports'),
(40, 'report_categories', 'Report Categories'),
(41, 'laboratories', 'Laboratories'),
(42, 'notices', 'Notices'),
(43, 'feedback_and_ratings', 'Feedback & Ratings'),
(44, 'certificates', 'Certificates'),
(45, 'medicines', 'Medicines'),
(46, 'diseases', 'Diseases'),
(47, 'rosters', 'Rosters'),
(48, 'individual_workload', 'Individual Workload'),
(49, 'shift_categories', 'Shift Categories'),
(50, 'shifts', 'Shifts'),
(51, 'invoice_requests', 'Invoice Requests'),
(52, 'invoices', 'Invoices'),
(53, 'custom_invoice_items', 'Custom Invoice Items'),
(54, 'transport_services', 'Transport Services'),
(55, 'tickets', 'Tickets');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notice`
--

CREATE TABLE `notice` (
  `notice_id` varchar(60) NOT NULL DEFAULT '',
  `notice` mediumtext NOT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `title` varchar(111) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `occupancy`
--

CREATE TABLE `occupancy` (
  `occupancy_id` varchar(60) NOT NULL DEFAULT '',
  `patient_id` varchar(60) DEFAULT NULL,
  `accommodation_category_id` varchar(60) DEFAULT NULL,
  `accommodation_id` varchar(60) DEFAULT NULL,
  `doctor_id` varchar(60) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0 = Discharged, 1 = Admitted',
  `reason` varchar(255) DEFAULT NULL,
  `extra_note` varchar(255) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patient`
--

CREATE TABLE `patient` (
  `patient_id` varchar(60) NOT NULL DEFAULT '',
  `pid` varchar(22) DEFAULT NULL,
  `profession_id` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `password` varchar(99) DEFAULT NULL,
  `mobile_number` varchar(22) DEFAULT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  `address` varchar(111) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `dob` int(11) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `blood_inventory_id` varchar(60) DEFAULT NULL,
  `ssn` char(11) DEFAULT NULL,
  `father_name` varchar(55) DEFAULT NULL,
  `mother_name` varchar(55) DEFAULT NULL,
  `emergency_contact` varchar(55) DEFAULT NULL,
  `emergency_contact_number` varchar(22) DEFAULT NULL,
  `emergency_contact_relation` varchar(22) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0 = Regular, 1 = Emergency',
  `status` int(11) DEFAULT NULL COMMENT '0 = Not Admitted, 1 = Admitted',
  `member` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patient_meal`
--

CREATE TABLE `patient_meal` (
  `patient_meal_id` varchar(60) NOT NULL DEFAULT '',
  `occupancy_id` varchar(60) DEFAULT NULL,
  `doctor_id` varchar(60) DEFAULT NULL,
  `breakfast` varchar(255) DEFAULT NULL,
  `milk_break` varchar(255) DEFAULT NULL,
  `lunch` varchar(255) DEFAULT NULL,
  `tea_break` varchar(255) DEFAULT NULL,
  `dinner` varchar(255) DEFAULT NULL,
  `extra_note` varchar(255) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payroll`
--

CREATE TABLE `payroll` (
  `payroll_id` varchar(60) NOT NULL,
  `user_id` varchar(60) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0 = Unpaid, 1 = Paid',
  `amount` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `month` varchar(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pharmacy_inventory`
--

CREATE TABLE `pharmacy_inventory` (
  `pharmacy_inventory_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `code` varchar(22) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_id` varchar(60) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pharmacy_sale`
--

CREATE TABLE `pharmacy_sale` (
  `pharmacy_sale_id` varchar(60) NOT NULL DEFAULT '',
  `status` int(11) DEFAULT NULL,
  `grand_total` int(11) DEFAULT NULL,
  `is_patient` int(11) DEFAULT NULL COMMENT '0 = Customer, 1 = Patient',
  `patient_id` varchar(60) DEFAULT NULL,
  `customer_name` varchar(55) DEFAULT NULL,
  `customer_mobile` varchar(22) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `invoice_number` varchar(22) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pharmacy_sale_details`
--

CREATE TABLE `pharmacy_sale_details` (
  `pharmacy_sale_details_id` varchar(60) NOT NULL,
  `pharmacy_inventory_id` varchar(60) DEFAULT NULL,
  `pharmacy_sale_id` varchar(60) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pharmacy_sale_return`
--

CREATE TABLE `pharmacy_sale_return` (
  `pharmacy_sale_return_id` varchar(60) NOT NULL DEFAULT '',
  `pharmacy_sale_id` varchar(60) DEFAULT NULL,
  `grand_total` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pharmacy_sale_return_details`
--

CREATE TABLE `pharmacy_sale_return_details` (
  `pharmacy_sale_return_details_id` varchar(60) NOT NULL,
  `pharmacy_inventory_id` varchar(60) DEFAULT NULL,
  `pharmacy_sale_return_id` varchar(60) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` varchar(60) NOT NULL DEFAULT '',
  `doctor_id` varchar(60) DEFAULT NULL,
  `patient_id` varchar(60) DEFAULT NULL,
  `disease_id` varchar(60) DEFAULT NULL,
  `next_appointment` int(11) DEFAULT NULL,
  `extra_note` varchar(255) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `symptoms` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prescription_details`
--

CREATE TABLE `prescription_details` (
  `prescription_details_id` varchar(60) NOT NULL,
  `medicine_id` varchar(60) DEFAULT NULL,
  `dose` varchar(11) DEFAULT NULL,
  `medication_time` varchar(11) DEFAULT NULL,
  `prescription_id` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `profession`
--

CREATE TABLE `profession` (
  `profession_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `profession`
--

INSERT INTO `profession` (`profession_id`, `name`, `timestamp`) VALUES
(1, 'Accountant', 1484580450),
(2, 'Actor', 1484580461),
(3, 'Air Steward', 1484580483),
(4, 'Animator', 1484580488),
(5, 'Architect', 1484580494),
(6, 'Artist', 1484580498),
(7, 'Author', 1484580502),
(8, 'Baker', 1484580507),
(9, 'Biologist', 1484580511),
(10, 'Builder', 1484580515),
(11, 'Butcher', 1484580519),
(12, 'Counselor', 1484580523),
(13, 'Chef', 1484580527),
(14, 'Director', 1484580532),
(15, 'Dentist', 1484580537),
(16, 'Designer', 1484580547),
(17, 'Doctor', 1484580551),
(18, 'Economist', 1484580556),
(19, 'Electrician', 1484580560),
(20, 'Engineer', 1484580565),
(21, 'Farmer', 1484580576),
(22, 'Film Director', 1484580582),
(23, 'Fisherman', 1484580586),
(24, 'Geologist', 1484581447),
(25, 'Head Teacher', 1484581455),
(26, 'Journalist', 1484581461),
(27, 'Judge', 1484581466),
(28, 'Lawyer', 1484581470),
(29, 'Lecturer', 1484581474),
(30, 'Magician', 1484581479),
(31, 'Manager', 1484581483),
(32, 'Musician', 1484581488),
(33, 'Nurse', 1484581492),
(34, 'Painter', 1484581497),
(35, 'Photographer', 1484581501),
(36, 'Pilot', 1484581506),
(37, 'Police Officer', 1484581514),
(38, 'Politician', 1484581519),
(39, 'Receptionist', 1484581523),
(40, 'Salesperson', 1484581527),
(41, 'Scientist', 1484581532),
(42, 'Secretary', 1484581537),
(43, 'Singer', 1484581541),
(44, 'Software Engineer', 1484581549),
(45, 'Soldier', 1484581556),
(46, 'Surgeon', 1484581560),
(47, 'Teacher', 1484581565),
(48, 'Translator', 1484581570),
(49, 'Waiter', 1484581575),
(50, 'Web Developer', 1484581588),
(51, 'Writer', 1484581592),
(52, 'Other', 1484581601);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rating`
--

CREATE TABLE `rating` (
  `rating_id` varchar(60) NOT NULL DEFAULT '',
  `rating` int(11) DEFAULT NULL,
  `user_id` varchar(60) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `report`
--

CREATE TABLE `report` (
  `report_id` varchar(60) NOT NULL DEFAULT '',
  `delivery_date` int(11) DEFAULT NULL,
  `patient_id` varchar(60) DEFAULT NULL,
  `doctor_id` varchar(60) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_patient` int(11) DEFAULT NULL,
  `customer_name` varchar(55) DEFAULT NULL,
  `customer_mobile` varchar(22) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `grand_total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `report_category`
--

CREATE TABLE `report_category` (
  `report_category_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(111) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `laboratory_id` varchar(60) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `report_details`
--

CREATE TABLE `report_details` (
  `report_details_id` varchar(60) NOT NULL,
  `report_category_id` varchar(60) DEFAULT NULL,
  `report_id` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `roster`
--

CREATE TABLE `roster` (
  `roster_id` varchar(60) NOT NULL DEFAULT '',
  `shift_id` varchar(60) DEFAULT NULL,
  `staff_id` varchar(60) DEFAULT NULL,
  `extra_note` varchar(255) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0 = Incoming, 1 = Ongoing, 2 = Done, 3 = Incomplete',
  `duty_on` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0 = Regular, 1 = Emergency'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `setting`
--

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL,
  `item` varchar(55) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `tag` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `setting`
--

INSERT INTO `setting` (`setting_id`, `item`, `content`, `timestamp`, `tag`) VALUES
(1, 'breakfast_price', '30', 1587277577, 'meal'),
(2, 'milk_break_price', '10', 1587277577, 'meal'),
(3, 'lunch_price', '50', 1587277577, 'meal'),
(4, 'tea_break_price', '10', 1587277577, 'meal'),
(5, 'dinner_price', '50', 1587277577, 'meal'),
(6, 'currency', 'USD', 1587277577, 'currency'),
(7, 'system_name', 'Saturn', 1587277577, 'system'),
(8, 'system_address', 'Sonargaon Janapath<br>Uttara, Dhaka 1230', 1587277577, 'system'),
(9, 'system_phone', '+1 (614) 440-9009', 1587277577, 'system'),
(10, 'system_website', 'saturn.t1m9m.com', 1587277577, 'system'),
(11, 'system_email', 't1m9m.com@gmail.com', 1587277577, 'system'),
(12, 'login_bg', 'login_bg_1653862800.jpg', 1587277577, 'system'),
(13, 'favicon', 'favicon_1587496135.png', 1587277577, 'system'),
(14, 'system_tagline', 'Hospital Management System', 1587277577, 'system'),
(15, 'copyright', 't1m9m.com', 1587277577, 'system'),
(16, 'copyright_url', 'https://t1m9m.com', 1587277577, 'system'),
(17, 'font', '\'Josefin Sans\', sans-serif', NULL, NULL),
(18, 'font_family', 'Josefin Sans', NULL, NULL),
(19, 'font_src', 'https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap', NULL, NULL),
(20, 'account_sid', NULL, NULL, NULL),
(21, 'auth_token', NULL, NULL, NULL),
(22, 'number', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `shift`
--

CREATE TABLE `shift` (
  `shift_id` varchar(60) NOT NULL DEFAULT '',
  `shift_starts` varchar(11) DEFAULT NULL,
  `shift_ends` varchar(11) DEFAULT NULL,
  `staff_category_id` varchar(60) DEFAULT NULL,
  `is_doctor` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `staff`
--

CREATE TABLE `staff` (
  `staff_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `mobile_number` varchar(22) DEFAULT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  `address` varchar(111) DEFAULT NULL,
  `ssn` char(11) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `blood_inventory_id` varchar(60) DEFAULT NULL,
  `staff_category_id` varchar(60) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `staff`
--

INSERT INTO `staff` (`staff_id`, `name`, `email`, `mobile_number`, `image_link`, `address`, `ssn`, `sex_id`, `blood_inventory_id`, `staff_category_id`, `status`, `created_on`, `created_by`, `timestamp`, `updated_by`) VALUES
('037eb3f7-f9e6-4868-a932-c14beb029727', 'Tahsin Alam', 'admin@saturn.com', '+1 (614) 440-9009', '', '656 Thurber Dr W.<br>Columbus, OH', NULL, 1, '4', '1f6fc685-081b-4f5a-89f1-769765c0c1b8', 1, 1671595043, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 1671861456, 'ad032653-3fee-4df5-9f62-3d4d81c6244f');

-- --------------------------------------------------------

--
-- Estrutura da tabela `staff_category`
--

CREATE TABLE `staff_category` (
  `staff_category_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `pay_scale` int(11) DEFAULT NULL,
  `duties` varchar(255) DEFAULT NULL,
  `uri` varchar(55) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `is_doctor` int(11) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `staff_category`
--

INSERT INTO `staff_category` (`staff_category_id`, `name`, `pay_scale`, `duties`, `uri`, `created_on`, `created_by`, `timestamp`, `updated_by`, `is_doctor`, `payment_type`, `permissions`) VALUES
('1f6fc685-081b-4f5a-89f1-769765c0c1b8', 'Super Admin', 0, 'Have access to every function of the application', 'super-admin', 1671595043, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 1671619008, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 0, 1, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` varchar(60) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `subject` varchar(111) DEFAULT NULL,
  `patient_id` varchar(60) DEFAULT NULL,
  `ticket_number` varchar(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ticket_details`
--

CREATE TABLE `ticket_details` (
  `ticket_id` varchar(60) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `ticket_details_id` varchar(60) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transport`
--

CREATE TABLE `transport` (
  `transport_id` varchar(60) NOT NULL DEFAULT '',
  `transport_number` varchar(22) DEFAULT NULL,
  `transport_category_id` varchar(60) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transport_category`
--

CREATE TABLE `transport_category` (
  `transport_category_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `uri` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transport_service`
--

CREATE TABLE `transport_service` (
  `transport_service_id` varchar(60) NOT NULL,
  `transport_category_id` varchar(60) DEFAULT NULL,
  `transport_id` varchar(60) DEFAULT NULL,
  `patient_id` varchar(60) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `treatment`
--

CREATE TABLE `treatment` (
  `treatment_id` varchar(60) NOT NULL DEFAULT '',
  `patient_id` varchar(60) DEFAULT NULL,
  `next_checkup` int(11) DEFAULT NULL,
  `extra_note` varchar(255) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `symptoms` varchar(255) DEFAULT NULL,
  `disease_id` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `treatment_details`
--

CREATE TABLE `treatment_details` (
  `treatment_details_id` varchar(60) NOT NULL,
  `medicine_id` varchar(60) DEFAULT NULL,
  `dose` varchar(11) DEFAULT NULL,
  `medication_time` varchar(11) DEFAULT NULL,
  `treatment_id` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `unit`
--

CREATE TABLE `unit` (
  `unit_id` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(55) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `unit_for` int(11) DEFAULT NULL COMMENT '1 = Pharmacy, 2 = Cafeteria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `user_id` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(55) DEFAULT NULL,
  `password` varchar(99) DEFAULT NULL,
  `staff_category_id` varchar(60) DEFAULT NULL,
  `staff_id` varchar(60) DEFAULT NULL,
  `is_doctor` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_on` int(11) DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `staff_category_id`, `staff_id`, `is_doctor`, `status`, `created_on`, `created_by`, `timestamp`, `updated_by`) VALUES
('ad032653-3fee-4df5-9f62-3d4d81c6244f', 'admin@saturn.com', '$2y$10$uH17QG9FnyTosG5iMxMwMeBcVDHkyGZiJ.bVD/D.uhQANsY.LVhBq', '1f6fc685-081b-4f5a-89f1-769765c0c1b8', '037eb3f7-f9e6-4868-a932-c14beb029727', 0, 1, 1671595043, 'ad032653-3fee-4df5-9f62-3d4d81c6244f', 1671861456, 'ad032653-3fee-4df5-9f62-3d4d81c6244f');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `accommodation`
--
ALTER TABLE `accommodation`
  ADD PRIMARY KEY (`accommodation_id`);

--
-- Índices para tabela `accommodation_category`
--
ALTER TABLE `accommodation_category`
  ADD PRIMARY KEY (`accommodation_category_id`);

--
-- Índices para tabela `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Índices para tabela `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bed_id`);

--
-- Índices para tabela `blood_donor`
--
ALTER TABLE `blood_donor`
  ADD PRIMARY KEY (`blood_donor_id`);

--
-- Índices para tabela `blood_inventory`
--
ALTER TABLE `blood_inventory`
  ADD PRIMARY KEY (`blood_inventory_id`);

--
-- Índices para tabela `blood_request`
--
ALTER TABLE `blood_request`
  ADD PRIMARY KEY (`blood_request_id`);

--
-- Índices para tabela `cafeteria_inventory`
--
ALTER TABLE `cafeteria_inventory`
  ADD PRIMARY KEY (`cafeteria_inventory_id`);

--
-- Índices para tabela `cafeteria_sale`
--
ALTER TABLE `cafeteria_sale`
  ADD PRIMARY KEY (`cafeteria_sale_id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`);

--
-- Índices para tabela `cafeteria_sale_details`
--
ALTER TABLE `cafeteria_sale_details`
  ADD PRIMARY KEY (`cafeteria_sale_details_id`);

--
-- Índices para tabela `certificate`
--
ALTER TABLE `certificate`
  ADD PRIMARY KEY (`certificate_id`);

--
-- Índices para tabela `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Índices para tabela `custom_invoice_item`
--
ALTER TABLE `custom_invoice_item`
  ADD PRIMARY KEY (`custom_invoice_item_id`);

--
-- Índices para tabela `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Índices para tabela `discharge`
--
ALTER TABLE `discharge`
  ADD PRIMARY KEY (`discharge_id`);

--
-- Índices para tabela `discharge_details`
--
ALTER TABLE `discharge_details`
  ADD PRIMARY KEY (`discharge_details_id`);

--
-- Índices para tabela `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`disease_id`);

--
-- Índices para tabela `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Índices para tabela `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`expense_id`);

--
-- Índices para tabela `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Índices para tabela `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Índices para tabela `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Índices para tabela `invoice_request`
--
ALTER TABLE `invoice_request`
  ADD PRIMARY KEY (`invoice_request_id`);

--
-- Índices para tabela `laboratory`
--
ALTER TABLE `laboratory`
  ADD PRIMARY KEY (`laboratory_id`);

--
-- Índices para tabela `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Índices para tabela `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Índices para tabela `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module_id`);

--
-- Índices para tabela `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- Índices para tabela `occupancy`
--
ALTER TABLE `occupancy`
  ADD PRIMARY KEY (`occupancy_id`);

--
-- Índices para tabela `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Índices para tabela `patient_meal`
--
ALTER TABLE `patient_meal`
  ADD PRIMARY KEY (`patient_meal_id`);

--
-- Índices para tabela `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`payroll_id`);

--
-- Índices para tabela `pharmacy_inventory`
--
ALTER TABLE `pharmacy_inventory`
  ADD PRIMARY KEY (`pharmacy_inventory_id`);

--
-- Índices para tabela `pharmacy_sale`
--
ALTER TABLE `pharmacy_sale`
  ADD PRIMARY KEY (`pharmacy_sale_id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`);

--
-- Índices para tabela `pharmacy_sale_details`
--
ALTER TABLE `pharmacy_sale_details`
  ADD PRIMARY KEY (`pharmacy_sale_details_id`);

--
-- Índices para tabela `pharmacy_sale_return`
--
ALTER TABLE `pharmacy_sale_return`
  ADD PRIMARY KEY (`pharmacy_sale_return_id`);

--
-- Índices para tabela `pharmacy_sale_return_details`
--
ALTER TABLE `pharmacy_sale_return_details`
  ADD PRIMARY KEY (`pharmacy_sale_return_details_id`);

--
-- Índices para tabela `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`);

--
-- Índices para tabela `prescription_details`
--
ALTER TABLE `prescription_details`
  ADD PRIMARY KEY (`prescription_details_id`);

--
-- Índices para tabela `profession`
--
ALTER TABLE `profession`
  ADD PRIMARY KEY (`profession_id`);

--
-- Índices para tabela `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Índices para tabela `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`);

--
-- Índices para tabela `report_category`
--
ALTER TABLE `report_category`
  ADD PRIMARY KEY (`report_category_id`);

--
-- Índices para tabela `report_details`
--
ALTER TABLE `report_details`
  ADD PRIMARY KEY (`report_details_id`);

--
-- Índices para tabela `roster`
--
ALTER TABLE `roster`
  ADD PRIMARY KEY (`roster_id`);

--
-- Índices para tabela `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Índices para tabela `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shift_id`);

--
-- Índices para tabela `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Índices para tabela `staff_category`
--
ALTER TABLE `staff_category`
  ADD PRIMARY KEY (`staff_category_id`);

--
-- Índices para tabela `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`transport_id`);

--
-- Índices para tabela `transport_category`
--
ALTER TABLE `transport_category`
  ADD PRIMARY KEY (`transport_category_id`);

--
-- Índices para tabela `transport_service`
--
ALTER TABLE `transport_service`
  ADD PRIMARY KEY (`transport_service_id`);

--
-- Índices para tabela `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatment_id`);

--
-- Índices para tabela `treatment_details`
--
ALTER TABLE `treatment_details`
  ADD PRIMARY KEY (`treatment_details_id`);

--
-- Índices para tabela `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT de tabela `module`
--
ALTER TABLE `module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `profession`
--
ALTER TABLE `profession`
  MODIFY `profession_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
