-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2022 at 10:43 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mimishop`
--

-- --------------------------------------------------------

--
-- Table structure for table `apiuser`
--

CREATE TABLE `apiuser` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `apiuser`
--

INSERT INTO `apiuser` (`id`, `name`) VALUES
(1, 'supper mod'),
(2, 'Mod'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` text COLLATE utf8_unicode_ci NOT NULL,
  `id_m` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `name`, `picture`, `id_m`) VALUES
(1, 'màu hồng', '35445_Y-nghia-hoa-hong-97987895875800.png', 1),
(5, 'màu đỏ', '35463_Y-nghia-hoa-hong-98008904359500.png', 1),
(6, 'màu vàng ', '35444_Y-nghia-hoa-hong-98028390402500.png', 1),
(7, 'hồng trắng', '35465_Y-nghia-hoa-hong-98060484052500.png', 1),
(9, 'hoa bi', '35501_Y-nghia-hoa-bi-98165927846100.png', 10),
(11, 'hướng dương', '35843_Y-nghia-hoa-huong-duong-98418414062600.png', 2),
(12, 'ly trắng', '35371_Y-nghia-hoa-Ly-98524067916200.png', 9),
(13, 'Màu kem bi', '35451_Y-nghia-hoa-cam-chuong-97881887963900.png', 3),
(14, 'màu hường', '2-97751962699300.png', 3),
(15, 'màu vàng', '4-97774409246900.png', 3),
(16, 'màu đỏ', '35452_Y-nghia-hoa-cam-chuong-97799712097000.png', 3),
(17, 'màu hồng', '35448-97816857887400.png', 3),
(18, 'ly hồng', '35375_Y-nghia-hoa-Ly-98537352798100.png', 9),
(21, 'màu tím', 'y-nghia-hoa-thach-thao-336313681756600.png', 12);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `website`, `message`) VALUES
(1, 'Nguyễn Văn A\r\n', 'nguyenvana@gmail.com\r\n', 'http://vinaenter.edu.vn\r\n', 'Website cần hoàn thiện hơn nữa\r\n'),
(2, 'Trần Văn B\r\n', 'tranvanb@gmail.com\r\n', 'http://vinaenter.edu.vn\r\n', 'Admin đẹp trai lắm\r\n'),
(4, 'trần văn trung', 'trungtran@gmail.com', 'anhtrungdeptrai.vn.com', 'trang web bán hàng'),
(7, 'minh hai', 'Minhhaidt3@gmail.com', 'http://minh@gmail.com', 'trang web mới'),
(8, 'minh hai', 'Minhhaidt3@gmail.com', 'banbonphuong.com', 'qưeq'),
(13, 'thị nga', 'ngamimi123@gmail.com', 'hoanhalam.vn.com', 'hãy liên hệ để hợp tác'),
(14, 'văn vũ', 'vanvu@gmail.com', 'https://www.facebook.com/minhhaidmh/', 'liên hệ với chúng tôi để chạy quảng cáo'),
(16, 'nguyễn minh sơn ', 'minhson@gmail.com', 'http://cuahangtienloiminhson.com.vn', 'trang web uy tín');

-- --------------------------------------------------------

--
-- Table structure for table `flowers`
--

CREATE TABLE `flowers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(100) NOT NULL,
  `preview_text` text COLLATE utf8_unicode_ci NOT NULL,
  `detail_text` text COLLATE utf8_unicode_ci NOT NULL,
  `picture` text COLLATE utf8_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `counter` int(11) NOT NULL DEFAULT 0,
  `id_cat` int(11) NOT NULL,
  `id_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flowers`
--

INSERT INTO `flowers` (`id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat`, `id_type`) VALUES
(1, 'hoa hồng', 2500000, '\"Nhớ lắm Tặng a món quà tinh thần ... \r\n01.04 Ngày kĩ niệm :x \r\nDù ngày mai đời đổi thay \r\nChỉ yêu anh và yêu thôi, \r\nNguyện yêu mãi muôn đời chẳng quên\"\r\n', '\"Nhớ lắm Tặng a món quà tinh thần ... \r\n01.04 Ngày kĩ niệm :x \r\nDù ngày mai đời đổi thay \r\nChỉ yêu anh và yêu thôi, \r\nNguyện yêu mãi muôn đời chẳng quên\"\r\n', '9-4250508613799.jpg', '2021-11-28 14:57:18', 16, 1, 2),
(2, 'only you', 230000, 'hoa ', '23423543', '6830_mua-hong-4268725748099.png', '2021-12-14 16:57:30', 127, 8, 5),
(6, 'hoa hồng ', 310000, 'hoa đẹp lắm', 'hoa hồng to ', '10704_tinh-4286020777400.png', '2021-11-28 14:57:02', 21, 7, 1),
(16, 'hoa theo tên', 120000, 'hoa theo tên là một mẫu mới đang thịnh hành', 'hoa theo tên là một mẫu mới đang thịnh hành', '2-3538560408900.jpg', '2021-11-28 15:01:15', 4, 8, 1),
(18, 'yêu mãi mãi ', 200000, 'Bó hoa tượng trưng cho một tình yêu gắn kết mãi mãi của các cuộc tình\r\n', 'Nguyên liệu gồm:\r\n- 20 bông hồng đỏ \r\n- 15 bông cọ cỏ+ giấy màu gói\r\n', '3199_yeu-xa-4298859468900.jpg', '2021-12-02 16:39:48', 2, 7, 1),
(19, 'Tình yêu đầu', 350000, 'Bó hoa mang màu sắc trong sáng, thích hợp cho các cuộc tình mới chớm nở\r\nhay dành tặng cho những người bạn thân ...', 'Nguyên liệu gồm:\r\n- 15 bông hồng hường\r\n- 5 bông hồng trắng\r\n- 3 bông cọ + 4 bông cỏ\r\n-  giấy màu gói\r\n', '6830_mua-hong-4317119525899.png', '2021-11-28 14:58:39', 0, 2, 5),
(20, 'hoa sinh nhật theo chữ', 900000, 'Bó hoa 999 đoá hồng tượng trưng cho 1 tình yêu vĩ đại', 'Nguyên liệu gồm:\r\n- 950 bông hồng đỏ\r\n- 49 bông hồng trắng\r\n-  giấy màu gói + nguyên liệu kèm theo\r\n- Thiệp + chữ \"I LOVE YOU\"\r\n', '243339104_1230864260762393_4141501929439187897_n-4225781252400.jpg', '2021-11-28 14:57:33', 4, 8, 5),
(21, 'Hoa tiền 100k', 2500000, 'Hoa tiền mệnh giá 100k ', '<p>Nguy&ecirc;n liệu gồm:</p>\r\n\r\n<p>- 100 tờ tiền thật mệnh gi&aacute; 100.000vnd</p>\r\n\r\n<p>- Hoa cỏ</p>\r\n\r\n<p>- giấy m&agrave;u g&oacute;i</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/9.jpg\" style=\"height:357px; width:276px\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/243414965_1229072014274951_8571261058994031787_n.jpg\" style=\"height:357px; width:276px\" /></p>\r\n', '9-4208789929400.jpg', '2021-12-06 06:34:34', 3, 9, 2),
(22, 'Hạnh phúc', 900000, 'Hạnh phúc là cái gì? Đó là cảm giác đến từ trái tim, chứ không phải nhận định của người khác. Hạnh phúc và bi ai thực sự, chỉ có bản thân mới hiểu, định nghĩa của hạnh phúc của mỗi người đâu có giống nhau. Hạnh phúc là hai người yên lặng bảo vệ, gom góp tất cả tình yêu gửi sâu vào đáy lòng, ngày qua ngày mang ra thưởng thức. Giỏ hoa này sẽ lan tỏa và nhân rộng hạnh phúc đến từng người, từng nhà, trong từng mối quan hệ tình cảm giữa con người với nhau.', 'Giỏ hoa tươi Hạnh Phúc gồm các loại hoa ; \r\n\r\n- 8 Hồng da\r\n\r\n- 10 Hồng sen mới\r\n\r\n- 5 Cát tường trắng\r\n\r\n- 15 Mõm sói trắng\r\n\r\n- 3 Hoa thạch thảo tím', '5205_hanh-phuc-27679311331900.jpg', '2021-11-25 16:34:53', 2, 2, 3),
(23, 'hoa lễ 20-10', 2100000, 'bó hoa chữ 20-10', '<p>b&oacute; hoa chữ 20-10</p>\r\n', 'hoa_ten1-161246238617300.jpg', '2021-12-06 16:26:33', 1, 0, 1),
(24, 'tình yêu muôn lối', 130000, 'tình yêu muôn lối', 'tình yêu muôn lối', '9-161293838015300.jpg', '2021-12-14 17:28:24', 1, 2, 2),
(26, 'hương vị tình nhân 123', 180000, 'hương vị tình nhân', '<p>hương vị t&igrave;nh nh&acirc;n</p>\r\n\r\n<p><img alt=\"\" src=\"/CKFinderJava/userfiles/images/2795_hoa-mung-tot-nghiep.png\" style=\"height:700px; width:500px\" /></p>\r\n', '3199_yeu-xa-4175010080799.jpg', '2021-12-08 06:00:56', 6, 0, 1),
(27, 'only love 123', 1300000, 'only love', '<p>only love</p>\r\n\r\n<p><img alt=\"\" src=\"/CKFinderJava/userfiles/images/2644_hoa-chuc-suc-khoe.png\" style=\"height:357px; width:276px\" /></p>\r\n', '11040_ohara-3853667188300.png', '2021-12-08 06:23:15', 1, 0, 3),
(28, 'Ngọc sắc', 700000, 'Giỏ hoa gam tím chủ đạo cực kì phù hợp gửi tặng những người phụ nữ bạn yêu thương trong các dịp lễ đặc biệt. Mỗi đoá hoa khoe sắc như cách mà bạn gửi gắm tâm tình của mình đến với người nhận. Hãy tạo thêm những kỉ niệm thật đáng nhớ với người bạn yêu quý nhé.', 'Giỏ hoa gồm có:\r\n\r\n- 3 Pink OHara\r\n\r\n- 11 Hồng tím cà\r\n\r\n- 2 Cát tường hồng viền\r\n\r\n- 5 Cúc rossi hồng\r\n\r\n- Hoa lá phụ khác', '10707_ngoc-sac-27527447535200.jpg', '2021-11-25 16:32:26', 3, 2, 3),
(29, 'thiên đường tình yêu', 1000000, 'thiên đường tình yêu', 'thiên đường tình yêu', '7240_pink-lady-3832484492000.png', '2021-12-08 06:42:48', 14, 2, 5),
(30, 'Hè rực rỡ 12123', 700000, 'Có lẽ bao mùa hè trôi qua đều đầy ắp những kỉ niệm mà con người cứ thích lưu giữ mãi đến độ hôm nay nắng về lại được dịp ra hong phơi. Một chút hương hoa thoang thoảng hay làn gió nhẹ khẽ đung đưa qua tay cũng đủ khiến cho trái tim này xuyến xao. Đôi chân cứ lơ đãng bước qua những góc phố, con đường quen thuộc mà ngỡ như là mới. Góc phố nơi anh và em gặp nhau lần đầu\r\n', '<p>Giỏ hoa tươi H&egrave; Rực Rỡ gồm c&aacute;c loại hoa:</p>\r\n\r\n<p>- 40 Hồng đỏ sa - 5 Hoa thạch thảo trắng</p>\r\n\r\n<p>- 3 Hoa Sao t&iacute;m * Sản phẩm cắm tr&ograve;n</p>\r\n', '6928_he-ruc-ro - Copy-27399020126300.jpg', '2021-12-07 21:07:55', 13, 0, 3),
(31, 'tấn tài tấn lộc', 2000000, 'hoa tiền', 'hoa tiền', 'th-3997388449200.jpg', '2021-11-10 16:19:27', 1, 7, 2),
(32, 'bong bóng hoa', 300000, 'bong bóng hoa', 'bong bóng hoa', '7247_tinh-hong-2-3972750346500.png', '2021-12-14 17:28:17', 10, 9, 5),
(33, 'mãi mãi yêu em', 2000000, 'mãi mãi yêu em', 'mãi mãi yêu em', '6830_mua-hong-3894956577300.png', '2021-12-14 17:28:12', 39, 9, 1),
(34, 'mimi ', 1000000, '', '', '243271288_1228127237702762_44450488602337645_n-27704666916500.jpg', '2021-12-09 13:35:24', 4, 1, 3),
(35, 'lẵng hoa', 800000, 'lẵng hoa', 'lẵng hoa', '3013_gia-biet-1-4522489206900.jpg', '2021-11-25 14:59:41', 4, 1, 11),
(37, 'nhẫn cặp', 200000, 'mặt dây chuyền phong thuỷ', '<p>mặt d&acirc;y chuyền phong thuỷ</p>\r\n', 'd-5233158702100.jpg', '2021-12-07 21:55:25', 0, 0, 18),
(38, 'nhẫn đính đá', 2500000, 'nhẫn đính đá\r\nThương hiệu: PNJ\r\nLoại đá chính: Topaz', 'hẫn vàng đính đá Topaz – Điểm nhấn tinh tế và thời thượng\r\nSở hữu thiết kế độc đáo với điểm nhấn đá Topaz được điểm xuyến bởi dãy đá trắng tạo nên vẻ đẹp đầy sự quyến rũ và hiện đại cho chiếc nhẫn vàng trắng 14K PNJ. Sự hoàn hảo của trang sức không chỉ đến từ chất liệu mà nó còn thể hiện ở thiết kế cùng đá đính kèm trên mỗi sản phẩm', 'khung_anh-5435746708600.jpg', '2021-11-25 10:24:10', 0, 9, 18),
(39, 'gấu bông', 200000, 'gấu bông', 'gấu bông tuỳ kích thước', '183829-49ece1c409c8daa19105c94a9e96eadc_1-5503709395100.jpg', '2021-12-08 06:45:33', 2, 9, 18),
(40, 'gấu kèm hoa', 300000, 'gấu kèm hoa phù hợp tặng lễ tốt nghiệp hay làm quà vào các ngày lễ dành cho người mình yêu', 'gấu kèm hoa phù hợp tặng lễ tốt nghiệp hay làm quà vào các ngày lễ dành cho người mình yêu\r\nmón quà thật ý nghĩa', 'hoa-hong-sap-7-bong-kem-gau-hop-handmade-dep-5574740686300.jpg', '2021-12-08 06:45:13', 1, 9, 18),
(41, 'Đồng hồ cặp', 1000000, 'mặt dây chuyền phong thuỷ', 'mặt dây chuyền phong thuỷ', 'dongho-5620294308100.jpg', '2021-12-31 07:33:01', 6, 9, 18),
(42, 'sự nghiệp thành công', 600000, 'Những bông hoa với màu sắc tươi sáng, mạnh mẽ được cắm dáng cao tượng trưng cho sự thành đạt, sung túc trong sự nghiệp và cuộc sống. Kèm theo đó là những cành hạnh phúc lên tượng trưng cho ngọn lửa của sự khát khao và ý chí vươn lên mạnh mẽ.\r\nMẫu hoa thích hơp dành tặng cho bạn bè, người thân, khách hàng nhân dịp sinh nhật, khai trương, kỉ niệm thay cho lời chúc mừng..', 'Bình hoa tươi Sự Nghiệp Thành Công gồm các loại hoa:\r\n\r\n- 3 Hoa hạnh phúc\r\n\r\n- 5 Hồng red naomi\r\n\r\n- 6 Mõm sói hồng đậm\r\n\r\n- 10 Lan Moka đỏ\r\n\r\n- 6 Green wicky\r\n\r\n- 10 Cẩm chướng chùm đỏ\r\n\r\n- 20 Hồng đỏ sa\r\n\r\n- Bình thủy tinh cao cấp', 'sunghieptc-27091340279100.png', '2021-11-30 13:53:10', 2, 8, 1),
(43, 'Hồng vàng ánh trăng', 400000, 'Hồng vàng măn nồng', 'Nguyên liệu gồm:\r\n\r\n- 25 bông hồng vàng ánh trăng\r\n\r\n- Bình men sứ 25 x 16,5\r\n\r\n*Hoa kèm bình men sứ màu ngẫu nhiên', '11605_hong-vang-anh-trang-25-27900162119700.jpg', '2021-11-28 14:21:40', 2, 9, 4),
(44, 'HỒNG ĐỎ SA (25 BÔNG)', 500000, '', 'Nguyên liệu gồm:\r\n\r\n- 25 bông hồng đỏ sa\r\n\r\n- Bình men sứ 25 x 16,5\r\n\r\n*Hoa kèm bình men sứ màu ngẫu nhiên', '11534_hong-do-sa-25-bong-27999545689400.jpg', '2021-12-09 13:35:32', 3, 9, 4),
(45, 'Tiễn biệt', 1000000, 'Trong cuộc sống chúng ta mất bất cứ thứ gì chúng ta cũng có thể có lại được , nhưng khi chúng ta mất vĩnh viễn một người thân hay một người bạn chúng ta không bao giờ tìm lại được. Với vòng hoa chia buồn Tiễn Biệt được được thiết kế theo tông chủ đạo là màu trắng của lan, hồng, cúc và các phụ liệu khác Hoayeuthuong.com sẽ thay mặt bạn đưa tiễn họ và chia sẻ cùng gia đình họ.', 'Trang chủHoa tình yêuHoa chia buồn\r\nTiễn Biệt 2\r\nMã SP: 3113\r\nGiá cũ: 1.000.000 đ\r\nGiá mới: 920.000 đ\r\n(Giá đã bao gồm 10% VAT)\r\n\r\nGỌI NGAY: 1800 6353\r\nHOA CHIA BUỒN - TIỄN BIỆT 2\r\nTrong cuộc sống chúng ta mất bất cứ thứ gì chúng ta cũng có thể có lại được , nhưng khi chúng ta mất vĩnh viễn một người thân hay một người bạn chúng ta không bao giờ tìm lại được. Với vòng hoa chia buồn Tiễn Biệt được được thiết kế theo tông chủ đạo là màu trắng của lan, hồng, cúc và các phụ liệu khác Hoayeuthuong.com sẽ thay mặt bạn đưa tiễn họ và chia sẻ cùng gia đình họ.\r\nSản phẩm bạn đang chọn là sản phẩm được thiết kế đặc biệt!\r\n\r\nHiện nay, Hoayeuthuong.com chỉ thử nghiệm cung cấp cho thị trường Tp. Hồ Chí Minh và Hà Nội\r\n\r\nTặng banner, thiệp (trị giá 20.000đ) miễn phíGiảm ngay 20.000đ khi Bạn tạo đơn hàng onlineGiảm tiếp 3% cho đơn hàng Bạn tạo ONLINE lần thứ 2, 5% cho đơn hàng Bạn tạo ONLINE lần thứ 6 và 10% cho đơn hàng Bạn tạo ONLINE lần thứ 12 (Chỉ áp dụng tại Tp. HCM)Giao miễn phí trong nội thành 63/63 tỉnhGiao gấp trong vòng 2 giờCam kết 100% hoàn lại tiền nếu Bạn không hài lòngCam kết hoa tươi trên 3 ngàyFacebookTwitterGoogle +THÔNG TIN THÊMHƯỚNG DẪN THANH TOÁNCHÍNH SÁCH VÀ ĐIỀU KHOẢN\r\n \r\n\r\n- 15 Cúc trắng\r\n\r\n- 15 Hồng trắng nhí\r\n\r\n- 10 Lan trắng vườn\r\n\r\n- 10 Hoa mimi\r\n\r\n \r\n\r\nVòng hoa chia buồn Tiễn Biệt 2 gồm:\r\n\r\n- Hoa Lan Trắng\r\n\r\n- Hoa Hồng\r\n\r\n- Hoa cúc\r\n\r\n- Ami\r\n\r\nVà các phụ liệu khác', '3113_tien-biet-2-28174926660000.jpg', '2021-11-26 16:28:16', 1, 9, 11),
(46, 'ký ức xưa', 1050000, 'Người đã xa khuất chắc chắn sẽ để lại trong trái tim những người ở lại những hồi ức tươi đẹp nhất. Khi họ ra đi, hãy gửi tặng họ những bông hoa xinh đẹp, rực rỡ, để ở thế giới bên kia đó cũng chính là kí ức tươi đẹp nhất của riêng họ. Kệ hoa tông vàng phù hợp gửi tặng những buổi tang lễ là những người lớn tuổi đã có gia đình theo phong tục ở phía Bắc nước ta.', 'Kẹ hoa tang \"Kí ức xưa\" gồm có:\r\n\r\n- 50 Cẩm chướng đơn vàng\r\n\r\n- 12 Hoa Cúc Ping Pong Vàng\r\n\r\n- 15 Cúc trắng\r\n\r\n- 5 Lan vũ nữ', '8390_ki-uc-xua-28399857497700.png', '2021-12-05 12:45:31', 7, 9, 11),
(49, 'Thiên sứ tình yêu', 600000, 'Thiên sứ tình yêu', '<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/11442_beautiful-you.jpg\" style=\"height:357px; width:276px\" /></p>\r\n', '11442_beautiful-you-457699466340200.jpg', '2021-12-05 11:46:31', 1, 9, 5),
(54, ' FRESHNESS', 700000, 'Màu xanh tươi mát luôn khiến tinh thần của chúng ta cảm thấy dễ chịu mỗi khi ngắm nhìn, và đó cũng chính là cảm hứng để các florist thiết kế nên bó hoa đặc biệt này. Sản phẩm có sự kết hợp thêm của hồng trắng và cúc tana, khiến cho mẫu hoa có một màu sắc hài hoà nhưng không kém phần bắt mắt.', '<p>B&oacute; hoa gồm c&oacute;:</p>\r\n\r\n<p>- 18 Hồng trắng cồ</p>\r\n\r\n<p>- 6 Cẩm chướng đơn xanh bơ</p>\r\n\r\n<p>- 10 M&otilde;m s&oacute;i trắng</p>\r\n\r\n<p>- 5 C&uacute;c Tana</p>\r\n\r\n<p>- 2 L&aacute; bạc</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/2795_hoa-mung-tot-nghiep.png\" style=\"height:700px; width:500px\" /></p>\r\n', '10261_freshness-877890928562300.png', '2021-12-05 12:44:22', 4, 9, 10),
(55, 'Hoa tặng sự kiện', 650000, 'Trong văn hóa giao tiếp, để bắt đầu các mối quan hệ tốt đẹp bạn có thể gửi đến đối phương một lời chúc mừng cùng với bó hoa tươi như lời tri ân. Những bó hoa tặng đại biểu với màu hồng trang nhã, điểm thêm chút vàng của sự tài lộc may mắn sẽ giúp bạn thể hiện được sự thiện chí của bản thân đồng thời cũng góp phần tạo sự gắn kết, hợp tác trong công việc.', '<p>B&oacute; hoa gồm:</p>\r\n\r\n<p>- 3 Hồng da</p>\r\n\r\n<p>- 3 Hồng v&agrave;ng &aacute;nh trăng</p>\r\n\r\n<p>- 5 M&otilde;m s&oacute;i song hỷ</p>\r\n\r\n<p>- 3 Hoa thạch thảo trắng</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/10902_hoa-tang-su-kien-620-bo.png\" style=\"height:360px; width:300px\" /></p>\r\n\r\n<p>Trong văn h&oacute;a giao tiếp, để bắt đầu c&aacute;c mối quan hệ tốt đẹp bạn c&oacute; thể gửi đến đối phương một lời ch&uacute;c mừng c&ugrave;ng với b&oacute; hoa tươi như lời tri &acirc;n.</p>\r\n\r\n<p>Những b&oacute; hoa tặng đại biểu với m&agrave;u hồng trang nh&atilde;, điểm th&ecirc;m ch&uacute;t v&agrave;ng của sự t&agrave;i lộc may mắn sẽ gi&uacute;p bạn thể hiện được sự thiện ch&iacute; của bản th&acirc;n đồng thời cũng g&oacute;p phần tạo sự gắn kết, hợp t&aacute;c trong c&ocirc;ng việc.</p>\r\n', '2994_hoa-mung-tot-nghiep - Copy-873238861354700.png', '2021-12-06 07:47:46', 4, 9, 10),
(56, 'HOA MAY MẮN', 450000, 'Bó hoa là sự kết hợp vô cùng hài hoà của hồng da nhẹ nhàng và màu vàng may mắn từ hoa đồng tiền. Bó hoa sẽ thay bạn gửi những tâm tư hay những lời chúc khó có thể diễn tả thành lời trong những dịp quan trọng của bạn bè và người thân của bạn.', '<p>B&oacute; hoa&nbsp;<strong>&quot;May mắn&quot;</strong>&nbsp;gồm c&oacute;:</p>\r\n\r\n<p>- 15 Hồng da</p>\r\n\r\n<p>- 10 Đồng tiền v&agrave;ng</p>\r\n\r\n<p>- 2 c&agrave;nh sao v&agrave;ng</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/2644_hoa-chuc-suc-khoe.png\" style=\"height:357px; width:276px\" /></p>\r\n', '9442_hoa-may-man-873743991718900.jpg', '2021-12-14 17:21:01', 6, 9, 14),
(57, 'Nhớ đấng sinh thành', 700000, 'Nhớ đấng sinh thành', '<p>Hộp hoa gồm c&oacute; hồng đỏ sa, chuỗi ngọc, l&aacute; bạc v&agrave; phụ kiện trang tr&iacute;</p>\r\n\r\n<p>- 45 Hồng đỏ sa</p>\r\n\r\n<p>- 20 Chuỗi ngọc đỏ</p>\r\n\r\n<p>- 5 L&aacute; bạc</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/2224_hoa-sinh-nhat.png\" style=\"height:357px; width:276px\" /></p>\r\n', '8289_red-box-873908750288400.png', '2021-12-14 17:24:37', 5, 9, 14),
(58, 'TÌNH YÊU VĨNH CỬU 2', 1100000, 'Không có tình yêu vĩnh cửu mà chỉ có những giây phút vĩnh cửu của tình yêu. Giây phút ta bên nhau, luôn là những khoảnh khắc yêu thương nhất trong cuộc sống của anh. Bó hoa với 100 hoa hồng đỏ sẽ giúp bạn làm khoảnh khắc ấy càng thêm sâu sắc và sẽ là kỉ niệm không thể quên trong chuyện tình yêu của bạn', '<p><strong>B&oacute; hoa tươi&nbsp;</strong>T&igrave;nh Y&ecirc;u Vĩnh Cửu 2 gồm c&aacute;c loại hoa:</p>\r\n\r\n<p>- 100 Hồng đỏ sa</p>\r\n\r\n<p>- 2 C&agrave;nh L&aacute; bạc</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;<img alt=\"\" src=\"/CKFinderJava/userfiles/images/1354_hoa-tuoi-mau-do.png\" style=\"height:357px; width:276px\" /></p>\r\n', '6020_tinh-yeu-vinh-cuu-2-874187157138300.jpg', '2021-12-14 15:39:52', 11, 9, 1),
(60, 'Tình yêu bao la', 1500000, 'Tình mẹ bao la như đất trời không kể xuyến.\r\nNhân 20-10 tặng mẹ', '<p>B&oacute; hoa gồm :</p>\r\n\r\n<p>- 100 tờ 1k tiền</p>\r\n\r\n<p>-&nbsp; 25 hoa hồng đỏ</p>\r\n\r\n<p>- c&aacute;c phụ kiện đi k&egrave;m</p>\r\n', '243414965_1229072014274951_8571261058994031787_n-3528851627400.jpg', '2021-12-14 15:42:05', 2, 0, 6),
(61, 'Tùng Noel 2021', 2500000, 'ây thông Noel luôn được xem như một biểu tượng không thể thiếu mỗi dịp giáng sinh về. Tuy nhiên, không phải dễ dàng để có thể sở hữu một cây thông chính hiệu như ở các xứ sở lạnh khác, nên tại Việt Nam, các florist đã sáng tạo nên những mẫu cây thông giáng sinh được cắm từ lá sơn tùng với hình dáng và cách trang trí không khác nhiều với cây thông thật. Và với mức giá hợp lí, cùng các phụ kiện được decor độc đáo, các mẫu sơn tùng noel vẫn mang lại sự ấm áp và lung linh cho đêm giáng sinh của mỗi gia đình.', '<p>Sản phẩm gồm c&oacute;: l&aacute; sơn t&ugrave;ng, phụ kiện trang tr&iacute; noel v&agrave; chậu men sứ cao cấp</p>\r\n\r\n<p>Chiều cao chậu v&agrave; c&acirc;y: 150cm</p>\r\n\r\n<p><img alt=\"\" src=\"/CKFinderJava/userfiles/images/10902_hoa-tang-su-kien-620-bo.png\" style=\"height:360px; width:300px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n', '10981_son-tung-noel-3824649904600.png', '2021-12-14 17:25:57', 7, 0, 10),
(62, 'hoa đẹp', 120000, 'hoa rất đẹp', '<p><img alt=\"\" src=\"/CKFinderJava/userfiles/images/2224_hoa-sinh-nhat.png\" style=\"height:357px; width:276px\" /></p>\r\n', '2224_hoa-sinh-nhat-29214236609600.png', '2021-12-14 17:26:20', 6, 0, 3),
(63, 'hoa mười giờ', 1000000, 'hoa thật đẹp', '<p><strong>hoa thật đẹp</strong></p>\r\n\r\n<p><strong><img alt=\"\" src=\"/CKFinderJava/userfiles/images/10902_hoa-tang-su-kien-620-bo.png\" style=\"height:360px; width:300px\" /></strong></p>\r\n', '2644_hoa-chuc-suc-khoe-163910736622100.png', '2021-12-14 17:24:26', 9, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `meaning`
--

CREATE TABLE `meaning` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `preview` text COLLATE utf8_unicode_ci NOT NULL,
  `picture` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `meaning`
--

INSERT INTO `meaning` (`id`, `name`, `detail`, `preview`, `picture`) VALUES
(1, 'Hoa hồng', '<p>Mỗi m&agrave;u sắc hoa hồng lại mang đến một &yacute; nghĩa biểu đạt kh&aacute;c nhau, v&igrave; vậy bạn h&atilde;y c&ugrave;ng Hoayeuthuong.com t&igrave;m hiểu xem b&oacute; hoa m&igrave;nh tặng mang th&ocirc;ng điệp g&igrave; nh&eacute;:</p>\r\n\r\n<p><strong>Hoa hồng đỏ</strong>: tượng trưng cho một t&igrave;nh y&ecirc;u nồng ch&aacute;y v&agrave; l&atilde;ng mạn. Hoa hồng đỏ đ&atilde; c&oacute; từ rất l&acirc;u đời, trải qua nhiều nền văn h&oacute;a - cả phương t&acirc;y v&agrave; phương đ&ocirc;ng.Nhưng ở bất k&igrave; đ&acirc;u, n&oacute; cũng lu&ocirc;n l&agrave; lo&agrave;i hoa được y&ecirc;u th&iacute;ch nhất, v&agrave; biểu tượng cho một thứ t&igrave;nh cảm v&ocirc; c&ugrave;ng thi&ecirc;ng li&ecirc;ng: T&igrave;nh y&ecirc;u.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/35463_Y-nghia-hoa-hong.png\" style=\"height:150px; width:125px\" /></p>\r\n\r\n<p><strong>Hoa hồng trắng</strong>: tượng trưng cho sự ng&acirc;y thơ, duy&ecirc;n d&aacute;ng v&agrave; sự cảm th&ocirc;ng. Hồng trắng kh&ocirc;ng chỉ biểu tượng cho một t&igrave;nh y&ecirc;u thuần khiết, cao thượng m&agrave; mặt kh&aacute;c, n&oacute; c&ograve;n l&agrave; lo&agrave;i hoa d&agrave;nh để b&agrave;y tỏ lời xin lỗi đến người y&ecirc;u nếu chẳng may bạn c&oacute; mắc lỗi lầm.</p>\r\n\r\n<p><strong>Hoa hồng v&agrave;ng</strong>: C&oacute; lẽ đ&acirc;y l&agrave; lo&agrave;i hoa l&agrave;m người nhận kh&aacute; đau đầu bởi &yacute; nghĩa kh&aacute; đa dạng của n&oacute;: Hoa hồng v&agrave;ng kh&ocirc;ng chỉ tượng trưng cho một t&igrave;nh y&ecirc;u ki&ecirc;u sa đầy rực rỡ, m&agrave; n&oacute; c&ograve;n l&agrave; lo&agrave;i hoa của t&igrave;nh bạn, thể hiện sự quan t&acirc;m v&agrave; tiến triển trong mối quan hệ, chẳng hạn như: &quot;anh quan t&acirc;m đến em&quot; hoặc &quot;h&atilde;y nhớ đến anh&quot;. Tặng một b&oacute; hồng v&agrave;ng c&oacute; thể l&agrave; mừng ng&agrave;y khởi đầu, v&agrave; cả mừng ng&agrave;y trở về. Đ&ocirc;i khi,hồng v&agrave;ng lại l&agrave; một lời b&agrave;y tỏ sự ghen tu&ocirc;ng, t&igrave;nh y&ecirc;u giảm s&uacute;t, v&agrave; sự phản bội. B&ecirc;n cạnh đ&oacute;, hoa hồng v&agrave;ng cũng l&agrave; lo&agrave;i hoa l&yacute; tưởng để d&agrave;nh tặng mẹ v&agrave; b&agrave;, bởi lẽ n&oacute; c&ograve;n c&oacute; &yacute; nghĩa của sự biết ơn v&agrave; t&ocirc;n k&iacute;nh.</p>\r\n\r\n<p><strong>Hoa hồng phớt</strong>: M&agrave;u hồng phớt nhẹ nh&agrave;ng của hoa hồng ngụ &yacute; về sự bắt đầu của một t&igrave;nh y&ecirc;u đầy mơ mộng, l&atilde;ng mạn v&agrave; dịu d&agrave;ng. B&ecirc;n cạnh đ&oacute;, n&oacute; c&ograve;n thể hiện một hạnh ph&uacute;c tr&ograve;n đầy với lời nhắn nhủ: &quot;H&atilde;y tin anh nh&eacute;! &quot;</p>\r\n\r\n<p><strong>Hoa hồng đậm</strong>: hoa hồng m&agrave;u hồng đậm mang &yacute; nghĩa của sự sang trọng, sự biết ơn v&agrave; để b&agrave;y tỏ lời cảm ơn. Ngo&agrave;i ra, hồng đậm c&ograve;n ngụ &yacute; về một người đẹp ki&ecirc;u k&igrave;.</p>\r\n\r\n<p><strong>Hoa hồng phấn</strong>: M&agrave;u hồng phấn dịu nhẹ của hoa mang đến th&ocirc;ng điệp về sự tr&igrave;u mến, về một t&igrave;nh y&ecirc;u l&atilde;ng mạn v&agrave; nhẹ nh&agrave;ng.</p>\r\n\r\n<p><strong>Hoa hồng nhung</strong>: tượng trưng cho một t&igrave;nh y&ecirc;u say đắm v&agrave; nồng nhiệt.</p>\r\n\r\n<p><strong>Hoa hồng cam</strong>: Thể hiện sự nhiệt t&igrave;nh v&agrave; đam m&ecirc; ch&aacute;y bỏng. M&agrave;u cam đầy rực rỡ thể hiện một t&igrave;nh y&ecirc;u nồng nhiệt nhưng cũng h&ograve;a lẫn với sự ghen tu&ocirc;ng. Hay một &yacute; nghĩa kh&aacute;c, n&oacute; l&agrave; cầu nối giữa t&igrave;nh bạn v&agrave; t&igrave;nh y&ecirc;u (bởi sự h&ograve;a trộn giữa v&agrave;ng v&agrave; đỏ) v&agrave; ngụ &yacute; rằng &quot;t&ocirc;i tự h&agrave;o về bạn&quot;.</p>\r\n\r\n<p><strong>Hoa hồng t&iacute;m</strong>: B&ecirc;n cạnh sự sang trọng vốn c&oacute;, hoa hồng t&iacute;m c&ograve;n thể hiện l&ograve;ng say m&ecirc;, chung thủy, v&agrave; l&agrave; t&igrave;nh y&ecirc;u m&atilde;nh liệt ngay từ c&aacute;i nh&igrave;n đầu ti&ecirc;n.</p>\r\n\r\n<p><strong>Hoa hồng xanh</strong>: tượng trưng cho một t&igrave;nh y&ecirc;u bất diệt.</p>\r\n\r\n<p><strong>Hoa hồng tỉ muội</strong>: Đ&uacute;ng như c&aacute;i t&ecirc;n của hoa, hồng tỉ muội tượng trưng cho t&igrave;nh chị em thắm thiết. Cho t&igrave;nh cảm gia đ&igrave;nh. B&agrave;y tỏ sự biết ơn, y&ecirc;u thương tr&igrave;u mến. V&agrave; nếu người được tặng l&agrave; một ch&agrave;ng trai, th&ocirc;ng điệp được trao gửi ở đ&acirc;y ch&iacute;nh l&agrave;: Bạn l&agrave; một đứa em ngoan.</p>\r\n', 'Trong ngày lễ tình nhân hay mỗi dịp kỉ niệm tình yêu, hoa hồng là một món quà không thể thiếu. Bởi lẽ đó là loại hoa tượng trưng cho tình yêu được nhiều người biết đến nhất trên thế giới, là loại hoa ngọt ngào, nồng thắm mà tình yêu đã len lỏi vào từng cánh hoa, nhị hoa và cả hương thơm dịu nhẹ phảng phất...\r\n', 'y-nghia-hoa-hong-97142833851500.png'),
(2, 'hoa hướng dương', '<p><a href=\"https://hoayeuthuong.com/search.aspx?key=h%c6%b0%e1%bb%9bng+d%c6%b0%c6%a1ng\"><strong>Hoa hướng dương</strong></a>&nbsp;c&oacute; nguồn gốc từ Bắc Mỹ, v&agrave; v&agrave;o thế kỉ thứ 16 th&igrave; hạt giống được mang sang c&aacute;c nước ch&acirc;u &Acirc;u v&agrave; sau đ&oacute; lan rộng ra to&agrave;n thế giới. Kh&ocirc;ng chỉ l&agrave; lo&agrave;i hoa được tr&acirc;n qu&yacute; v&igrave; cung cấp nguồn lương thực qu&yacute; b&aacute;u l&agrave; hạt v&agrave; dầu, m&agrave; ngay từ thời xa xưa, hoa hướng dương đ&atilde; được người d&acirc;n bản địa t&ocirc;n s&ugrave;ng v&igrave; vẻ đẹp lộng lẫy, mạnh mẽ của n&oacute;. V&agrave; đến ng&agrave;y nay, hướng dương c&ograve;n được chọn l&agrave;m biểu tượng cho một chiến dịch sức khoẻ c&oacute; &yacute; nghĩa rất to lớn đồi với cộng đồng.</p>\r\n\r\n<p>Với đặc t&iacute;nh hướng quang - lu&ocirc;n hướng về ph&iacute;a mặt trời th&igrave;:</p>\r\n\r\n<p>- Trong t&igrave;nh bạn, hoặc c&aacute;c mối quan hệ đối t&aacute;c b&ecirc;n ngo&agrave;i x&atilde; hội, hoa hướng dương biểu trưng cho sự ch&acirc;n th&agrave;nh, t&iacute;nh ki&ecirc;n định.</p>\r\n\r\n<p>- Trong t&igrave;nh y&ecirc;u, đ&oacute; l&agrave; biểu tượng của sự chung thủy, sắt son, lu&ocirc;n một l&ograve;ng hướng về ph&iacute;a đối phương.</p>\r\n\r\n<p>V&agrave;, h&igrave;nh d&aacute;ng những c&aacute;nh hoa v&agrave;ng rực rỡ như những tia nắng mặt trời, hướng dương lu&ocirc;n khiến người nh&igrave;n cảm thấy tr&agrave;n đầy những năng lượng t&iacute;ch cực. T&acirc;m hồn người ngắm nh&igrave;n sẽ lu&ocirc;n hướng về c&aacute;i thiện, v&agrave; cuộc sống của họ sẽ kh&ocirc;ng bao giờ chứa đựng hai từ &quot;bi quan&quot;.</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, cũng ch&iacute;nh v&igrave; mang h&igrave;nh ảnh biểu tượng của mặt trời,hướng dương c&ograve;n thể hiện sự quyền uy, sự ngưỡng mộ, t&ocirc;n s&ugrave;ng v&agrave; sự bền vững l&acirc;u d&agrave;i.</p>\r\n\r\n<p>Ch&iacute;nh v&igrave; vậy, hoa hướng dương th&iacute;ch hợp để b&agrave;y tỏ t&igrave;nh cảm trong c&aacute;c dịp kỉ niệm t&igrave;nh y&ecirc;u, t&igrave;nh bạn, cũng như những dịp ch&uacute;c mừng, để gửi đi th&ocirc;ng điệp về sự h&acirc;n hoan, phấn khởi.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/y-nghia-hoa-huong-duong.png\" style=\"height:150px; width:125px\" /></p>\r\n\r\n<p>Cuối c&ugrave;ng, một th&ocirc;ng điệp cực k&igrave; &yacute; nghĩa m&agrave; hướng dương mang đến ch&iacute;nh l&agrave;: &quot;Stand tall and follow your dreams. Focus on what&rsquo;s positive in your life and don&rsquo;t let anyone get you down&quot; - H&atilde;y mạnh mẽ đứng vững v&agrave; theo đuổi ước mơ của bạn. Tập trung v&agrave;o những thứ t&iacute;ch cực trong cuộc sống của bạn v&agrave; đừng để cho bất cứ ai khiến bạn nản l&ograve;ng.</p>\r\n', 'Hoa hướng dương tượng trưng cho sự đáng yêu, trung thành và trường thọ. Phần lớn ý nghĩa của hoa hướng dương bắt nguồn từ chính cái tên của nó, chính là mặt trời - một biểu tượng mãnh liệt của sự sống\r\n', 'y-nghia-hoa-huong-duong-97330488690000.png'),
(3, 'hoa cẩm chướng', '<p>C&oacute; rất nhiều truyền thuyết kh&aacute;c nhau về sự ra đời của&nbsp;<strong>hoa cẩm chướng</strong>: đ&oacute; l&agrave; lo&agrave;i hoa được trồng ở thi&ecirc;n đường rồi rơi xuống trần gian, hoặc c&oacute; truyền thuyết kể rằng đ&oacute; l&agrave; lo&agrave;i hoa được mọc tr&ecirc;n những nấm mồ của những đ&ocirc;i t&igrave;nh nh&acirc;n trẻ tuổi. &Yacute; nghĩa của hoa cẩm chướng phụ thuộc v&agrave;o m&agrave;u sắc của n&oacute;:</p>\r\n\r\n<p>-&nbsp;<strong>Cẩm chướng hồng</strong>: Anh sẽ kh&ocirc;ng bao giờ qu&ecirc;n em.</p>\r\n\r\n<p>-&nbsp;<strong>Cẩm chướng đỏ</strong>: Sự &aacute;i mộ.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/35452_Y-nghia-hoa-cam-chuong.png\" style=\"height:150px; width:125px\" /></p>\r\n\r\n<p>-&nbsp;<strong>Cẩm chướng đỏ thẫm</strong>: Tr&aacute;i tim t&ocirc;i đau nh&oacute;i v&igrave; em.</p>\r\n\r\n<p>-&nbsp;<strong>Cẩm chướng v&agrave;ng</strong>: Sự từ chối, khinh thường, thất vọng.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/4.png\" style=\"height:150px; width:125px\" /></p>\r\n\r\n<p>-&nbsp;<strong>Cẩm chướng trắng</strong>: Ngọt ng&agrave;o, ng&acirc;y thơ v&agrave; đ&aacute;ng y&ecirc;u. Thể hiện t&igrave;nh y&ecirc;u trong s&aacute;ng, v&agrave; l&agrave; m&oacute;n qu&agrave; may mắn gửi tặng phụ nữ.</p>\r\n\r\n<p>-&nbsp;<strong>Cẩm chướng t&iacute;m</strong>: Thể hiện t&iacute;nh kh&iacute; thất thường.</p>\r\n\r\n<p>-&nbsp;<strong>Cẩm chướng c&oacute; vằn, sọc</strong>: thể hiện lời chối từ t&igrave;nh y&ecirc;u.</p>\r\n', 'Hoa cẩm chướng là một trong những loài hoa đẹp được nhiều người yêu thích và đã xuất hiện từ lâu đời. Tuy nhiên, với ý nghĩa tượng trưng của mình, hoa cẩm chướng phần lớn được dành tặng cho bà , cho mẹ hoặc cho bạn bè. Rất ít người dùng hoa cẩm chướng để dành tặng người yêu.', 'y-nghia-hoa-cam-chuong-97557009558300.png'),
(9, 'hoa ly', '<p>Mỗi m&agrave;u sắc&nbsp;<strong>hoa Ly</strong>&nbsp;c&oacute; một &yacute; nghĩa biểu đạt kh&aacute;c nhau v&agrave; b&acirc;y giờ,&nbsp;<strong>Hoayeuthuong.com</strong>&nbsp;sẽ gi&uacute;p bạn hiểu r&otilde; hơn về lo&agrave;i hoa n&agrave;y:</p>\r\n\r\n<p>-&nbsp;<strong>Ly Trắng</strong>: Hoa Ly trắng tượng trưng cho sự trong trắng v&agrave; đức hạnh. Do đ&oacute;, hoa Ly trắng được cắm trong nh&agrave; thờ suốt m&ugrave;a lễ Phục Sinh v&agrave; được d&ugrave;ng để d&acirc;ng l&ecirc;n Đức Mẹ. V&agrave; khi gửi tặng ai đ&oacute; một b&oacute; ly trắng, c&ograve;n c&oacute; nghĩa l&agrave; bạn đang người đ&oacute; hạnh ph&uacute;c, thịnh vượng.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/35371_Y-nghia-hoa-Ly.png\" style=\"height:150px; width:125px\" /></p>\r\n\r\n<p>-&nbsp;<strong>Ly V&agrave;ng:</strong>&nbsp;L&agrave; lo&agrave;i hoa đại diện cho những người đ&agrave;n &ocirc;ng h&agrave;o hoa, phong nh&atilde;. Vậy n&ecirc;n,h&atilde;y d&agrave;nh tặng lo&agrave;i hoa n&agrave;y cho người đ&agrave;n &ocirc;ng lu&ocirc;n gi&uacute;p đỡ bạn trong c&ocirc;ng việc.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/35467_Y-nghia-hoa-Ly.png\" style=\"height:150px; width:125px\" /></p>\r\n\r\n<p><br />\r\n-&nbsp;<strong>Ly hồng (Ly Tiger)</strong>&nbsp;: biểu trưng cho sự gi&agrave;u sang, l&ograve;ng ki&ecirc;u h&atilde;nh.</p>\r\n', 'Hoa Ly từ lâu đã được mệnh danh là một loài hoa thanh cao và quý phái, nó không những tượng trưng cho sắc đẹp, đức hạnh mà còn là sự kiêu hãnh và cả tình yêu cao thượng, chung thủy. Chính bởi vậy, hoa Ly không chỉ thích hợp để dành tặng mẹ, người yêu mà còn rất thích hợp cho ngày chúc mừng, tốt nghiệp, khai trương...', 'y-nghia-hoa-ly-97445910737200.png'),
(10, 'hoa bi', '<p>Hoa baby xuất ph&aacute;t từ t&ecirc;n &quot;Baby&rsquo;s breath&quot;, c&oacute; nghĩa l&agrave; hơi thở trẻ thơ. N&oacute; đẹp v&agrave; mong manh như hơi thở trẻ thơ !</p>\r\n\r\n<p>Tại Việt Nam, hoa Baby được gọi với một c&aacute;i t&ecirc;n giản lược v&agrave; gần gũi hơn rất nhiều, người ta gọi n&oacute; đơn giản l&agrave; : hoa bi.</p>\r\n\r\n<p>Như những n&eacute;t biểu hiện b&ecirc;n ngo&agrave;i về một lo&agrave;i hoa yếu ớt, mỏng manh.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/CKFinderJava/userfiles/images/y-nghia-hoa-bi.png\" style=\"height:150px; width:125px\" /></p>\r\n\r\n<p>Với những cụm hoa trắng muốt nhỏ xinh như những b&ocirc;ng tuyết, n&ecirc;n bản th&acirc;n hoa bi cũng kh&ocirc;ng bền với nhiệt độ v&agrave; &aacute;nh s&aacute;ng. Nếu chẳng may hoa để trong nhiệt độ qu&aacute; n&oacute;ng hoặc qu&aacute; lạnh, hoa sẽ h&eacute;o ngay.</p>\r\n\r\n<p>Với những cảm x&uacute;c v&agrave; &yacute; nghĩa m&agrave; hoa bi mang lại, lo&agrave;i hoa n&agrave;y được rất nhiều người ưa th&iacute;ch.</p>\r\n\r\n<p>V&agrave; trong phong c&aacute;ch tặng hoa, hoa bi thường được d&ugrave;ng k&egrave;m với những lo&agrave;i hoa kh&aacute;c, để bổ sung th&ecirc;m &yacute; nghĩa, hoặc lời cầu ch&uacute;c. Cũng c&oacute; khi, hoa bi được ưu &aacute;i trở th&agrave;nh hoa ch&iacute;nh- độc nhất trong b&oacute;, giỏ hoa m&agrave; người ta d&agrave;nh tặng cho người y&ecirc;u, bạn b&egrave; của m&igrave;nh.</p>\r\n', 'Hoa bi trắng (hay hoa baby, baby\'s breath) tượng trưng cho tình yêu tinh khiết và ngây thơ, trong trắng bởi vẻ đẹp mỏng manh, thanh tao do chính những bông hoa nhỏ xinh mang lại.', 'y-nghia-hoa-bi-97498334308400.png'),
(12, 'hoa thạch thảo', '<p><strong>Hoa thạch thảo</strong>&nbsp;l&agrave; lo&agrave;i hoa thường mọc th&agrave;nh bụi, những đ&oacute;a hoa với c&aacute;nh mỏng, d&agrave;i, x&ograve;e rộng tạo n&ecirc;n một vẻ dịu d&agrave;ng, mộc mạc. Thạch thảo c&oacute; nguồn gốc từ nước &Yacute;, khi về Việt Nam, hoa được trồng nhiều ở Đ&agrave; Lạt v&agrave; xứ lạnh, đ&ocirc;i khi n&oacute; c&ograve;n mọc dại ở ven đường. Cũng c&oacute; thể v&igrave; vậy, m&agrave; ở nước ta, hoa thạch thảo c&ograve;n phủ l&ecirc;n m&igrave;nh một lớp &yacute; nghĩa đượm buồn: đ&oacute; l&agrave; sự lẻ loi trong t&igrave;nh y&ecirc;u.</p>\r\n\r\n<p><br />\r\nTuy nhi&ecirc;n, nếu đi s&acirc;u v&agrave;o t&igrave;m hiểu, người ta sẽ nhận ra những &yacute; nghĩa cao đẹp m&agrave; lo&agrave;i hoa mỏng manh n&agrave;y mang lại:&nbsp;<strong>Thạch thảo</strong>&nbsp;tượng trưng cho một t&igrave;nh y&ecirc;u nhẹ nh&agrave;ng v&agrave; b&igrave;nh dị. Trong t&igrave;nh y&ecirc;u ấy, t&igrave;nh cảm đong đầy v&agrave; lu&ocirc;n ẩn hiện đ&ocirc;i mắt d&otilde;i theo nhau, những lời hứa hẹn sẽ kh&ocirc;ng bao giờ qu&ecirc;n, sẽ m&atilde;i m&atilde;i đi c&ugrave;ng nhau tr&ecirc;n những s&oacute;ng gi&oacute;, gập ghềnh...</p>\r\n\r\n<p>Thạch thảo c&ograve;n tượng trưng cho vẻ đẹp mỏng manh, thanh t&uacute; v&agrave; tr&agrave;n đầy nữ t&iacute;nh nhưng cũng rất cần sự che chở từ v&ograve;ng tay ấm &aacute;p y&ecirc;u thương.</p>\r\n\r\n<p>V&agrave;, c&oacute; một điều đặc biệt, d&ugrave; thạch thảo gợi l&ecirc;n vẻ mỏng manh, c&oacute; ch&uacute;t yếu đuối, nhưng đ&ocirc;i l&uacute;c, n&oacute; lại mang &yacute; nghĩa của sự ch&iacute;n chắn. Bởi thạch thảo tự nhi&ecirc;n thường nở v&agrave;o cuối m&ugrave;a thu - khi m&agrave; những lo&agrave;i hoa kh&aacute;c đ&atilde; t&agrave;n.</p>\r\n', 'Loài hoa của nhớ mong, chờ đợi, của những lời nhắn nhủ sẽ mãi nhớ về nhau, sẽ luôn bên nhau cho đến khi từ giã cõi đời...', 'y-nghia-hoa-thach-thao-336255021026900.png');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quanty` int(11) NOT NULL,
  `total` double NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `iduser`, `phone`, `address`, `email`, `display_name`, `quanty`, `total`, `note`) VALUES
(1, 0, '0328272220     ', 'đội 11, bình hiệp, bình sơn, tp quảng ngãi     ', 'a@gmail.com     ', 'van nhi     ', 4, 1200000, 'giao hoa vào buổi sáng     '),
(4, 2, '00000000 ', 'đà nẵng ', 'da@gmail.com ', 'anh tuấn ', 10, 200000, 'giao hàng nhanh '),
(5, 3, '23333123', 'Tuy hoà', 'hoa@gmail.com', 'Hoa', 4, 1111110, 'hoa đẹp'),
(6, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 2, 5980000, '123214'),
(7, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 3, 5980012, 'àdàẻ'),
(8, 0, '123456879', 'đà nẵng', 'huy@gmail.com', 'minh huy', 1, 1980000, 'giao hàng buổi tối'),
(11, 0, '328272550', 'binh hiep', 'minhhaihai96@gmail.com', 'hai minh', 2, 5980000, '233'),
(12, 1, '122358385365', '10 Mac Dinh Chi\r\n10 Mac Dinh Chi', 'thuy@gmail.com', 'Doan Thi Thuy', 2, 313, 'giao hàng cho mình sớm nha'),
(13, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 1, 5980000, '1243'),
(14, 0, '13221423543', 'hoà lộc', 'nhoem@gmail.com', 'đoàn thị nhớ', 2, 5980000, 'hoà lộc'),
(15, 0, '13221423543', 'hoà lộc', 'nhoem@gmail.com', 'đoàn thị nhớ', 2, 5980000, 'hoà lộc'),
(16, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 2, 1980200, '4'),
(17, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 2, 1980200, '4'),
(18, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 1, 1980000, ''),
(19, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 1, 1980000, ''),
(29, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 3, 5980400, 'q2w'),
(31, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 2, 9980000, 'jy'),
(32, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 2, 9980000, 'jy'),
(34, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 2, 9980000, 'jy'),
(35, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 2, 9980000, 'jy'),
(37, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 2, 9980000, 'jy'),
(41, 0, '0328272550', 'lien chieu', 'Minhhaidt3@gmail.com', 'minh hai', 3, 5980400, ''),
(43, 1, '0328272550', 'lien chieu', 'Minhhaidt3@gmail.com', 'minh hai', 2, 4280000, 'o;.'),
(52, 0, '0328272550', 'lien chieu', 'Minhhaidt3@gmail.com', 'minh hai', 3, 2280150, ''),
(54, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 3, 1980100, ''),
(56, 0, '0328272550', '22', 'minhhai.dmh96@gmail.com', '', 2, 5180000, ''),
(61, 0, '328272550', 'binh hiep', 'minhhaihai96@gmail.com', 'hai minh', 2, 5980000, ''),
(62, 0, '328272550', 'binh hiep', 'minhhaihai96@gmail.com', 'hai minh', 2, 5980000, ''),
(63, 0, '0328272550', 'lien chieu', 'Minhhaidt3@gmail.com', 'minh hai', 2, 7980000, ''),
(64, 0, '0328272550', 'lien chieu', 'Minhhaidt3@gmail.com', 'minh hai', 2, 7980000, ''),
(65, 1, '0328272550', 'lien chieu', 'Minhhaidt3@gmail.com', 'minh hai', 2, 9980000, ''),
(66, 0, '0328272550', 'lien chieu', 'Minhhaidt3@gmail.com', 'minh hai', 2, 9980000, ''),
(67, 0, '0328272550', 'lien chieu', 'Minhhaidt3@gmail.com', 'minh hai', 2, 9980000, ''),
(68, 0, '4235435643', 'ád', 'anhyeuem@gmail.com', 'anh trai than yeu', 3, 1480526, 'ưet23543'),
(69, 0, '012301204', 'anh nhà ở đâu thế', 'luchuynh@gmail.com', 'lực huỳnh', 3, 4880000, 'giao hành đúng giờ nha'),
(73, 0, '202003202340', 'ĐỘi 11 thôn liên trì tây', 'toan@gmail.com', 'cu toán', 2, 3980150, 'bí mật'),
(74, 0, '0328272550', '10 Mac Dinh Chi\r\n10 Mac Dinh Chi', 'Minhhaidt3@gmail.com', 'Doan Thi Thuy', 3, 5980400, '133322'),
(75, 0, '0328272550', 'lien chieu', 'Minhhaidt3@gmail.com', 'minh hai', 5, 9980600, ''),
(76, 0, '0328272550', 'lien chieu', 'minhhai.dmh96@gmail.com', 'minh hai', 4, 5982115, ''),
(77, 1, '3253426', 'huy cầy', 'huy cầy', 'huy cầy', 4, 4880200, 'huy cầy'),
(79, 1, '0328272550', 'lien chieu', 'Minhhaidt3@gmail.com', 'minh hai', 2, 2580000, '123214'),
(80, 0, '023409382', 'hoà bình sơn la', 'anhem@gmail.com', 'bÍ mật', 3, 5982050, 'giao hàng bí mật nha!'),
(86, 0, '0989448366', 'phú vang, huyện phú bài, tỉnh thừa thiên huế', 'nganguyen@gmail.com', 'nga ngố', 2, 5080000, 'giao hàng vào buổi tối vì tôi đi làm ban ngày'),
(88, 1, '09355621721', 'Thăng bình, Quảng nam\r\n', 'nhacnguyen@gmail.com', 'nhạc nguyễn', 3, 4130000, 'giao hàng nhanh chóng'),
(89, 0, '092825828', 'phú vang, huyện phú bài, tỉnh thừa thiên huế', 'nganguyen@gmail.com', 'nga ngố', 1, 1930000, ''),
(90, 1, '032822552', 'bÌNH HƯNG hoà . quận tân bình, tp HCM', 'queanhodau@gmail.com', 'queanhodau', 3, 4980000, 'nhớ giao hàng đúng hẹn'),
(92, 0, '014225353', '121 đà nẵng', 'vanc@gmail.com', 'Nguyễn Văn C', 3, 5980000, ''),
(94, 1, '12252338521', 'tp đà nẵng', 'huynhdetuongtan@gmail.com', 'huynh đệ ', 2, 7980000, ''),
(95, 1, '0542352985', 'Thanh sơn. đà lạt', 'minhson@gmail.com', 'nguyễn văn minh', 3, 3680000, ''),
(96, 1, '0989448355', 'phú vang, huyện phú bài, tỉnh thừa thiên huế', 'ngamini@gmail.com', 'nga ngố', 2, 3980000, 'Giao hàng cho tôi'),
(97, 1, '0133825686', 'Hạ long, Quảng Ninh', 'nhanhoa@gmail.com', 'nhân hoà', 3, 5930000, ''),
(98, 1, '023546230', 'Hạ Long, Quảng Ninh', 'hanhoa@gmail.com', 'Nhân hoà', 1, 600000, ''),
(103, 1, '090536552', '111 ngô văn nhữ, Quận 1, Tp HCM', 'sontung@gmail.com', 'nguyễn sơn tùng', 1, 2480000, ''),
(105, 0, '0538386682', '123 hồ tùng mậu, Quận Tân Bình, Hồ chí MInh', 'vannhan123@gmail.com', 'văn nhân hoà', 2, 8680000, 'giao hoa trước 5h chiều'),
(106, 0, '05082782832', '123 Hồ tùng mậu, Quận Tân Bình , TP Hồ chí Minh', 'vannhan123@gmail.com', 'Nguyễn Văn Nhân', 2, 4580000, ''),
(107, 0, '02304032532', '3214 Hoà minh 1, liên chiểu, Đà nẵng ', 'iloveu123@gmail.com', 'i love you', 2, 3980000, 'gói hoa cẩn thận'),
(108, 0, '41563458563', '132 Hoang thi loan, Đà lạt, lâm đồng\r\n', 'minhson@gmail.com', 'nguyễn minh sơn', 1, 5980000, ''),
(109, 0, '023432332443', '123 nguyễn lương bằng, hoà khánh đà nẵng', 'minhhai@gmail.com', 'minh hải 123', 3, 10880000, ''),
(110, 0, '056468254', '145 nguyên văn cừ, Đà lạt, lâm đồngg\r\n', 'minhson@gmail.com', 'nguyễn minh sơn ', 2, 2320000, 'Đóng hàng cẩn thận');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL,
  `id_flower` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `quanty` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`id`, `id_flower`, `id_order`, `quanty`, `total`) VALUES
(1, 32, 1, 3, 1000000),
(2, 6, 1, 3, 1000000),
(4, 33, 64, 1, 2000000),
(6, 33, 65, 2, 4000000),
(8, 29, 68, 1, 100),
(9, 27, 68, 2, 426),
(10, 32, 68, 5, 1500000),
(11, 33, 69, 1, 2000000),
(12, 34, 69, 2, 2000000),
(20, 33, 73, 2, 4000000),
(21, 30, 73, 3, 150),
(23, 31, 74, 2, 4000000),
(24, 29, 74, 4, 400),
(25, 29, 75, 1, 100),
(27, 29, 75, 5, 500),
(31, 33, 77, 2, 4000000),
(32, 32, 77, 3, 900000),
(33, 29, 77, 1, 100),
(34, 20, 77, 2, 100),
(39, 32, 79, 2, 600000),
(40, 34, 79, 2, 2000000),
(41, 33, 80, 3, 6000000),
(42, 20, 80, 1, 50),
(43, 21, 80, 2, 2000),
(53, 41, 86, 3, 3000000),
(56, 43, 88, 2, 800000),
(57, 39, 88, 1, 200000),
(60, 33, 90, 1, 2000000),
(61, 40, 90, 3, 900000),
(65, 42, 92, 6, 3600000),
(66, 37, 92, 2, 400000),
(67, 34, 92, 2, 2000000),
(69, 31, 94, 1, 2000000),
(70, 33, 94, 3, 6000000),
(71, 49, 95, 2, 1200000),
(72, 43, 95, 1, 400000),
(73, 28, 95, 3, 2100000),
(74, 41, 96, 2, 2000000),
(75, 33, 96, 1, 2000000),
(76, 58, 97, 3, 3300000),
(77, 56, 97, 3, 1350000),
(78, 55, 97, 2, 1300000),
(79, 42, 98, 1, 600000),
(89, 61, 103, 1, 2500000),
(92, 43, 105, 3, 1200000),
(93, 61, 105, 3, 7500000),
(94, 55, 106, 2, 1300000),
(95, 58, 106, 3, 3300000),
(96, 33, 107, 1, 2000000),
(97, 29, 107, 2, 2000000),
(98, 31, 108, 3, 6000000),
(99, 61, 109, 3, 7500000),
(100, 63, 109, 2, 2000000),
(101, 57, 109, 2, 1400000),
(102, 62, 110, 2, 240000),
(103, 54, 110, 3, 2100000);

-- --------------------------------------------------------

--
-- Table structure for table `typeflowers`
--

CREATE TABLE `typeflowers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture_type` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `typeflowers`
--

INSERT INTO `typeflowers` (`id`, `name`, `picture_type`) VALUES
(1, 'Hoa bó', '4840_only-you-138474445030400.jpg'),
(2, 'Hoa tiền', '9-258074507875700.jpg'),
(3, 'Hoa giỏ ', '5205_hanh-phuc-258098818600000.jpg'),
(4, 'Hoa cắm bình', '243978015_1228127057702780_7531393546091558872_n-4642715849100.jpg'),
(5, 'Hoa sinh nhật', '6830_mua-hong-4566025178200.png'),
(6, 'Hoa theo tên', '243928113_1229077054274447_1649660653884142101_n-4674022098100.jpg'),
(10, 'Hoa chúc mừng', '10704_tinh-138548987211800.png'),
(11, 'Hoa chia buồn', '3013_gia-biet-1-138730500861899.jpg'),
(14, 'Hoa tri ân', '8425_tana-moc-mac-4721432094400.png'),
(18, 'Đồ handmade', '183829-49ece1c409c8daa19105c94a9e96eadc_1-4764116838800.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `idapi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `Email`, `address`, `idapi`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'Nguyễn Văn C', 'vanc@gmail.com', '121 phùng chí kiên, tp đà nẵng', 3),
(4, 'ngamini', '698d51a19d8a121ce581499d7b701668', 'nga ngố', 'ngamini@gmail.com', 'phú vang, huyện phú bài, tỉnh thừa thiên huế', 2),
(5, 'minhh13', 'e10adc3949ba59abbe56e057f20f883e', 'ĐỖ 123', 'anhhai@gmail.com', 'tp quảng ngãi\r\n', 1),
(8, 'anhhai', '202cb962ac59075b964b07152d234b70', 'anh hai dep trai', 'Minhhaidt3@gmail.com', 'lien chieu', 2),
(10, 'vannhi', 'e10adc3949ba59abbe56e057f20f883e', 'văn nhí', 'vannhi123@gmail.com', 'bình hiệp bình sơn quảng ngãi', 1),
(14, 'kimngan', '202cb962ac59075b964b07152d234b70', 'Phạm thị kim ngân', 'kimngandt@gmail.com', 'Tôn đức Thắng, Liên Chiểu, Đà Nẵng\r\n', 2),
(15, 'nhacnguyen', '202cb962ac59075b964b07152d234b70', 'nhạc nguyễn 123', 'nhacnguyen@gmail.com', 'Thăng bình, Quảng nam\r\n', 2),
(16, 'queanhodau', '698d51a19d8a121ce581499d7b701668', 'ANh ở quê mới lên', 'queanhodau@gmail.com', 'QUận bình tân, sài gòn', 2),
(18, 'minhson', '202cb962ac59075b964b07152d234b70', 'nguyễn minh sơn ', 'minhson@gmail.com', 'Đà lạt, lâm đồngg\r\n', 2),
(22, 'NhanHoa', 'e10adc3949ba59abbe56e057f20f883e', 'Nhân hoà', 'hanhoa@gmail.com', 'Hạ Long, Quảng Ninh', 1),
(23, 'kien245', '96e79218965eb72c92a549dd5a330112', 'trung kiên 245', 'kienanhem@gmail.com', 'Quảng ngãi', 2),
(26, 'Minhhai', '4297f44b13955235245b2497399d7a93', 'MInh Hải', 'minhhhai321@gmail.com', 'Quảng Ngãi', 1),
(27, 'vancao', '123123', 'Nguyễn Văn Cao', 'vancao@gmail.com', 'Hồ Chí Minh, Q1', 1),
(28, 'vannhan123', '96e79218965eb72c92a549dd5a330112', 'nguyen văn Nhân', 'vannhannguyen@gmail.com', '123 nguyễn văn cừ, Đà lạt', 1),
(32, 'vanhleg', '123456', 'anh vanh leg', 'vanhleg123@gmail.com', 'Bắc Giang', 2),
(33, 'sontung', 'd0970714757783e6cf17b26fb8e2298f', 'nguyễn sơn tùng', 'sontung@gmail.com', '111 ngô văn nhữ, Quận 1, Tp HCM', 1),
(34, 'binhluanvien', '4297f44b13955235245b2497399d7a93', 'doraruma PSG', 'binhluanvien@gmail.com', '123 Q đống đa, Hà nội', 1),
(38, '54r353', 'f4ee1446c0c245326dffe193c5fc4fe6', '5436', 'vanminh@gmail.com', 'e2q5t44r', 3),
(39, 'Anhson', '4297f44b13955235245b2497399d7a93', 'Nguyễn Văn SƠn 1', 'sonnguyen@gmail.com', 'Đà nẵng , Q.Lien Chieu', 3),
(40, 'minhhuy', '4297f44b13955235245b2497399d7a93', 'minh Huy ơi', 'minhhuy123@gmail.com', 'Bình tân, Quảng NAm', 1),
(43, 'vannhandeptrai', '4297f44b13955235245b2497399d7a93', 'Nguyễn Văn Nhân 123', 'vannhan123@gmail.com', '123 Hồ tùng mậu, Quận Tân Bình , TP Hồ chí Minh', 2),
(44, '125237y5', 'c4ca4238a0b923820dcc509a6f75849b', 'Bạn là ai ai', '2352345@gmail.com', 'hà nội quê tôi\r\n', 2),
(46, 'minhhai12343', '4297f44b13955235245b2497399d7a93', 'Minh hải quê tôi đây mà', 'minhhai@gmail.com', 'Đội 11 thôn liên trì Tây, Xã Bình Hiệp, Huyện Bình Sơn, Tỉnh', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apiuser`
--
ALTER TABLE `apiuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`,`id_m`),
  ADD KEY `id_m` (`id_m`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flowers`
--
ALTER TABLE `flowers`
  ADD PRIMARY KEY (`id`,`id_cat`,`id_type`),
  ADD KEY `id_cat` (`id_cat`),
  ADD KEY `id_type` (`id_type`);

--
-- Indexes for table `meaning`
--
ALTER TABLE `meaning`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`,`iduser`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`id`,`id_flower`,`id_order`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_flower` (`id_flower`);

--
-- Indexes for table `typeflowers`
--
ALTER TABLE `typeflowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`,`idapi`),
  ADD KEY `idapi` (`idapi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apiuser`
--
ALTER TABLE `apiuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `flowers`
--
ALTER TABLE `flowers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `meaning`
--
ALTER TABLE `meaning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `typeflowers`
--
ALTER TABLE `typeflowers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `color`
--
ALTER TABLE `color`
  ADD CONSTRAINT `color_ibfk_1` FOREIGN KEY (`id_m`) REFERENCES `meaning` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flowers`
--
ALTER TABLE `flowers`
  ADD CONSTRAINT `flowers_ibfk_3` FOREIGN KEY (`id_type`) REFERENCES `typeflowers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`id_flower`) REFERENCES `flowers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`idapi`) REFERENCES `apiuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
