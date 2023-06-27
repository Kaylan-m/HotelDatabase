-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2023 at 01:53 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `21343052_hotel`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reservasi` (IN `no_rsv` INT)  BEGIN
SELECT * from tb052_reservasi
WHERE no_reservasi = no_rsv;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb052_fasilitas`
--

CREATE TABLE `tb052_fasilitas` (
  `id_fasilitas` int(5) NOT NULL,
  `nama_fasilitas` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  `harga` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb052_fasilitas`
--

INSERT INTO `tb052_fasilitas` (`id_fasilitas`, `nama_fasilitas`, `deskripsi`, `harga`) VALUES
(1, 'Basic', 'Akses wifi dan free breakfast', 'Rp. 100.000'),
(2, 'Elite', 'Akses wifi, free breakfast dan dinner, dan TV', 'Rp. 300.000'),
(3, 'Star', 'Akses wifi, Free breakfast dan dinner, TV, dan Housekeeping.', 'Rp. 450.000'),
(4, 'VIP', 'Akses wifi, Free breakfast dan dinner, TV, Housekeeping, pelayanan kebersihan', 'Rp. 600.000'),
(5, 'VVIP', 'Akses wifi, Free breakfast dan dinner, TV, Housekeeping, pelayanan kebersihan dan Private pool', 'Rp. 1.000.000');

-- --------------------------------------------------------

--
-- Table structure for table `tb052_feedback`
--

CREATE TABLE `tb052_feedback` (
  `id_feedback` varchar(5) NOT NULL,
  `id_tamu` int(3) DEFAULT NULL,
  `no_kamar` int(3) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb052_feedback`
--

INSERT INTO `tb052_feedback` (`id_feedback`, `id_tamu`, `no_kamar`, `feedback`) VALUES
('1001', 1, 5, 'Pelayanannya bagus, makanannya enak, overall ok banget!'),
('1002', 2, 1, 'Poolnya lagi kurang bersih, tapi it\'s okay, masih seger airnya. Makanan, Ruangan, dll 5/5 for me.'),
('1003', 3, 2, 'Single room nyaman banget viewnya langsung ke alam, suasana hotelnya super cozyy.'),
('1004', 4, 4, 'Superior Room ngga sesuai ekspektasi, terlalu basic dibanding hotel lain.'),
('1005', 5, 3, 'Makanannyaaa super mega enakk! Poolnya bagus langsung ke alam luar jadi nyaman banget^^');

-- --------------------------------------------------------

--
-- Table structure for table `tb052_kamar`
--

CREATE TABLE `tb052_kamar` (
  `no_kamar` int(3) NOT NULL,
  `tipe_kamar` varchar(20) DEFAULT NULL,
  `id_fasilitas` int(5) DEFAULT NULL,
  `harga` varchar(20) DEFAULT NULL,
  `ketersediaan` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb052_kamar`
--

INSERT INTO `tb052_kamar` (`no_kamar`, `tipe_kamar`, `id_fasilitas`, `harga`, `ketersediaan`) VALUES
(1, 'Standard Room', 5, 'Rp.500.000', 15),
(2, 'Single Room', 1, 'Rp.1.000.000', 10),
(3, 'Double Room', 5, 'Rp.1.500.000', 13),
(4, 'Superior Room', 4, 'Rp.2.500.000', 7),
(5, 'Deluxe Room', 5, 'Rp.3.000.000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb052_pegawai`
--

CREATE TABLE `tb052_pegawai` (
  `id_pegawai` varchar(5) NOT NULL,
  `nama_pegawai` varchar(50) DEFAULT NULL,
  `telp_pegawai` varchar(15) DEFAULT NULL,
  `posisi` varchar(20) DEFAULT NULL,
  `gaji` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb052_pegawai`
--

INSERT INTO `tb052_pegawai` (`id_pegawai`, `nama_pegawai`, `telp_pegawai`, `posisi`, `gaji`) VALUES
('20231', 'Jamalica ', '0812101021', 'Resepsionis', 'Rp.5.500.000'),
('20232', 'Andrew', '0813982742', 'Resepsionis', 'Rp.4.500.000'),
('20233', 'Layliana', '0834982836', 'Resepsionis', 'Rp.5.000.000'),
('20234', 'Bellefina', '0841873402', 'Resepsionis', 'Rp.4.000.000'),
('20235', 'Haris', '0814729837', 'Resepsionis', 'Rp.5.500.000'),
('20236', 'Francise', '0813939280', 'Resepsionis', 'Rp.5.500.000');

-- --------------------------------------------------------

--
-- Table structure for table `tb052_reservasi`
--

CREATE TABLE `tb052_reservasi` (
  `no_reservasi` varchar(5) NOT NULL,
  `id_tamu` int(3) DEFAULT NULL,
  `tgl_reservasi` date DEFAULT NULL,
  `no_kamar` int(3) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `st_transaksi` varchar(20) DEFAULT NULL,
  `id_pegawai` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb052_reservasi`
--

INSERT INTO `tb052_reservasi` (`no_reservasi`, `id_tamu`, `tgl_reservasi`, `no_kamar`, `check_in`, `check_out`, `st_transaksi`, `id_pegawai`) VALUES
('201', 1, '2023-05-01', 5, '2023-05-01', '2023-05-04', '201 - Lunas', '20231'),
('202', 2, '2023-05-09', 1, '2023-05-10', '2023-05-11', '202 - Lunas', '20236'),
('203', 3, '2023-05-23', 2, '2023-05-23', '2023-05-26', '203 - Lunas', '20231'),
('204', 4, '2023-05-13', 4, '2023-05-13', '2023-05-18', '204 - Lunas', '20236'),
('205', 5, '2023-05-20', 3, '2023-05-21', '2023-05-24', '205 - Lunas', '20236'),
('206', 6, '2023-05-26', 5, '2023-05-26', '2023-05-27', '206 - Luna', '20236');

--
-- Triggers `tb052_reservasi`
--
DELIMITER $$
CREATE TRIGGER `update_ketersediaan_kamar` AFTER INSERT ON `tb052_reservasi` FOR EACH ROW BEGIN
    UPDATE tb052_kamar
    SET ketersediaan = ketersediaan - 1
    WHERE no_kamar = NEW.no_kamar;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb052_tamu`
--

CREATE TABLE `tb052_tamu` (
  `id_tamu` int(3) NOT NULL,
  `nama_tamu` varchar(50) DEFAULT NULL,
  `telp_tamu` varchar(15) DEFAULT NULL,
  `no_kamar` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb052_tamu`
--

INSERT INTO `tb052_tamu` (`id_tamu`, `nama_tamu`, `telp_tamu`, `no_kamar`) VALUES
(1, 'Nabiela Kathrine', '0812928390', 5),
(2, 'Jason Ruffman', '0827653480', 1),
(3, 'Kila Hilton', '00873738298', 2),
(4, 'Darrnie Luvien', '0876132455', 4),
(5, 'Moanna Covey', '0812094701', 3),
(6, 'Berrie Sara', '0854984903', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb052_transaksi`
--

CREATE TABLE `tb052_transaksi` (
  `id_transaksi` int(5) DEFAULT NULL,
  `id_tamu` int(3) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `total` varchar(20) DEFAULT NULL,
  `st_transaksi` varchar(20) NOT NULL,
  `total_integer` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb052_transaksi`
--

INSERT INTO `tb052_transaksi` (`id_transaksi`, `id_tamu`, `tgl_transaksi`, `total`, `st_transaksi`, `total_integer`) VALUES
(1, 1, '2023-05-01', 'Rp.11.430.000', '201 - Lunas', NULL),
(2, 2, '2023-05-09', 'Rp.650.000', '202 - Lunas', NULL),
(3, 3, '2023-05-23', 'Rp.3.840.000', '203 - Lunas', NULL),
(4, 4, '2023-05-13', 'Rp.12.900.000', '204 - Lunas', NULL),
(5, 5, '2023-05-30', 'Rp.6.000.000', '205 - Lunas', NULL),
(6, 6, '2023-05-23', 'Rp.1.430.000', '206 - Lunas', '1430000.00');

--
-- Triggers `tb052_transaksi`
--
DELIMITER $$
CREATE TRIGGER `insert_transaksi` BEFORE INSERT ON `tb052_transaksi` FOR EACH ROW BEGIN
    SET NEW.total_integer = REPLACE(REPLACE(REPLACE(NEW.total, 'Rp.', ''), '.', ''), ',', '');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_feedbacktamu`
-- (See below for the actual view)
--
CREATE TABLE `v_feedbacktamu` (
`nama_tamu` varchar(50)
,`feedback` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kamartamu`
-- (See below for the actual view)
--
CREATE TABLE `v_kamartamu` (
`nama_tamu` varchar(50)
,`tipe_kamar` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_stransaksi`
-- (See below for the actual view)
--
CREATE TABLE `v_stransaksi` (
`nama_tamu` varchar(50)
,`total` varchar(20)
,`st_transaksi` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `v_feedbacktamu`
--
DROP TABLE IF EXISTS `v_feedbacktamu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_feedbacktamu`  AS SELECT `tb052_tamu`.`nama_tamu` AS `nama_tamu`, `tb052_feedback`.`feedback` AS `feedback` FROM (`tb052_tamu` left join `tb052_feedback` on(`tb052_feedback`.`id_tamu` = `tb052_tamu`.`id_tamu`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_kamartamu`
--
DROP TABLE IF EXISTS `v_kamartamu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kamartamu`  AS SELECT `tb052_tamu`.`nama_tamu` AS `nama_tamu`, `tb052_kamar`.`tipe_kamar` AS `tipe_kamar` FROM (`tb052_kamar` left join `tb052_tamu` on(`tb052_tamu`.`no_kamar` = `tb052_kamar`.`no_kamar`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_stransaksi`
--
DROP TABLE IF EXISTS `v_stransaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stransaksi`  AS SELECT `tb052_tamu`.`nama_tamu` AS `nama_tamu`, `tb052_transaksi`.`total` AS `total`, `tb052_transaksi`.`st_transaksi` AS `st_transaksi` FROM (`tb052_tamu` join `tb052_transaksi` on(`tb052_transaksi`.`id_tamu` = `tb052_tamu`.`id_tamu`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb052_fasilitas`
--
ALTER TABLE `tb052_fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indexes for table `tb052_feedback`
--
ALTER TABLE `tb052_feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD KEY `id_tamu` (`id_tamu`),
  ADD KEY `no_kamar` (`no_kamar`);

--
-- Indexes for table `tb052_kamar`
--
ALTER TABLE `tb052_kamar`
  ADD PRIMARY KEY (`no_kamar`),
  ADD KEY `id_fasilitas` (`id_fasilitas`);

--
-- Indexes for table `tb052_pegawai`
--
ALTER TABLE `tb052_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `tb052_reservasi`
--
ALTER TABLE `tb052_reservasi`
  ADD PRIMARY KEY (`no_reservasi`),
  ADD KEY `no_kamar` (`no_kamar`),
  ADD KEY `id_tamu` (`id_tamu`),
  ADD KEY `st_transaksi` (`st_transaksi`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tb052_tamu`
--
ALTER TABLE `tb052_tamu`
  ADD PRIMARY KEY (`id_tamu`),
  ADD KEY `no_kamar` (`no_kamar`);

--
-- Indexes for table `tb052_transaksi`
--
ALTER TABLE `tb052_transaksi`
  ADD PRIMARY KEY (`st_transaksi`),
  ADD KEY `id_tamu` (`id_tamu`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb052_feedback`
--
ALTER TABLE `tb052_feedback`
  ADD CONSTRAINT `tb052_feedback_ibfk_1` FOREIGN KEY (`id_tamu`) REFERENCES `tb052_tamu` (`id_tamu`),
  ADD CONSTRAINT `tb052_feedback_ibfk_2` FOREIGN KEY (`no_kamar`) REFERENCES `tb052_kamar` (`no_kamar`),
  ADD CONSTRAINT `tb052_feedback_ibfk_3` FOREIGN KEY (`id_tamu`) REFERENCES `tb052_tamu` (`id_tamu`),
  ADD CONSTRAINT `tb052_feedback_ibfk_4` FOREIGN KEY (`no_kamar`) REFERENCES `tb052_kamar` (`no_kamar`);

--
-- Constraints for table `tb052_kamar`
--
ALTER TABLE `tb052_kamar`
  ADD CONSTRAINT `tb052_kamar_ibfk_1` FOREIGN KEY (`id_fasilitas`) REFERENCES `tb052_fasilitas` (`id_fasilitas`);

--
-- Constraints for table `tb052_reservasi`
--
ALTER TABLE `tb052_reservasi`
  ADD CONSTRAINT `tb052_reservasi_ibfk_1` FOREIGN KEY (`no_kamar`) REFERENCES `tb052_kamar` (`no_kamar`),
  ADD CONSTRAINT `tb052_reservasi_ibfk_2` FOREIGN KEY (`id_tamu`) REFERENCES `tb052_tamu` (`id_tamu`),
  ADD CONSTRAINT `tb052_reservasi_ibfk_3` FOREIGN KEY (`st_transaksi`) REFERENCES `tb052_transaksi` (`st_transaksi`),
  ADD CONSTRAINT `tb052_reservasi_ibfk_4` FOREIGN KEY (`id_pegawai`) REFERENCES `tb052_pegawai` (`id_pegawai`);

--
-- Constraints for table `tb052_tamu`
--
ALTER TABLE `tb052_tamu`
  ADD CONSTRAINT `tb052_tamu_ibfk_1` FOREIGN KEY (`no_kamar`) REFERENCES `tb052_kamar` (`no_kamar`),
  ADD CONSTRAINT `tb052_tamu_ibfk_2` FOREIGN KEY (`no_kamar`) REFERENCES `tb052_kamar` (`no_kamar`);

--
-- Constraints for table `tb052_transaksi`
--
ALTER TABLE `tb052_transaksi`
  ADD CONSTRAINT `tb052_transaksi_ibfk_1` FOREIGN KEY (`id_tamu`) REFERENCES `tb052_tamu` (`id_tamu`),
  ADD CONSTRAINT `tb052_transaksi_ibfk_2` FOREIGN KEY (`id_tamu`) REFERENCES `tb052_tamu` (`id_tamu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
