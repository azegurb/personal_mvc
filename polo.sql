-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 24 2018 г., 22:17
-- Версия сервера: 10.1.30-MariaDB
-- Версия PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `polo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `state` smallint(5) NOT NULL,
  `name` text NOT NULL,
  `qeyd` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `state`, `name`, `qeyd`) VALUES
(1, 0, 'HEYVANLAR', 'heyvanlar.png'),
(2, 0, 'HEYVANDARLIQ MƏHSULLARI', 'hey_meh.png'),
(3, 0, 'TOXUM VƏ TİNGLƏR', 'toxumlar.png'),
(4, 0, 'BİTKİ MƏHSULLARI', 'bitki_meh.png'),
(5, 0, 'YEMLƏR', 'yemler.png'),
(6, 0, 'KƏND TƏSƏRRÜFATI TEXNİKASI', 'texnika.png'),
(7, 0, 'HEYVANDARLIQ MÜƏSSİSƏLƏRİ', 'kend_torpaq.png'),
(8, 0, 'KƏND TƏSƏRRÜFATI TƏYİNATLI TORPAQLAR', 'kttt.png');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `common`
-- (See below for the actual view)
--
CREATE TABLE `common` (
`elan_ad` int(11)
,`elan_name` varchar(300)
,`elan_mezmun` varchar(500)
,`elan_tarix` date
,`price` int(11)
,`active` varchar(200)
,`amount` int(11)
,`vahid` varchar(200)
,`diri` varchar(100)
,`fatty` varchar(100)
,`cins` varchar(150)
,`age` varchar(120)
,`source` varchar(130)
,`deliver` varchar(130)
,`baxis` int(11)
,`cat_id` int(11)
,`cat_name` text
,`subcat_id` int(11)
,`subcat_name` tinytext
,`pro` varchar(100)
,`person` text
,`name` varchar(100)
,`sname` varchar(120)
,`fname` varchar(100)
,`email` varchar(120)
,`phone` varchar(100)
,`pic_id` int(11)
,`picname` varchar(300)
,`pic_largename` varchar(300)
);

-- --------------------------------------------------------

--
-- Структура таблицы `elan`
--

CREATE TABLE `elan` (
  `id` int(11) NOT NULL,
  `cid` smallint(5) NOT NULL,
  `sid` smallint(6) NOT NULL,
  `ssid` smallint(6) NOT NULL,
  `name` varchar(300) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `vahid` varchar(200) NOT NULL,
  `diri` varchar(100) NOT NULL,
  `fatty` varchar(100) NOT NULL,
  `cins` varchar(150) NOT NULL,
  `age` varchar(120) NOT NULL,
  `pro` tinytext NOT NULL,
  `source` varchar(130) NOT NULL,
  `deliver` varchar(130) NOT NULL,
  `pic` varchar(356) NOT NULL,
  `tarix` date NOT NULL,
  `qeyd` varchar(500) NOT NULL,
  `active` varchar(200) NOT NULL,
  `person` int(11) NOT NULL,
  `baxis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `elan`
--

INSERT INTO `elan` (`id`, `cid`, `sid`, `ssid`, `name`, `price`, `amount`, `vahid`, `diri`, `fatty`, `cins`, `age`, `pro`, `source`, `deliver`, `pic`, `tarix`, `qeyd`, `active`, `person`, `baxis`) VALUES
(42, 1, 50, 0, 'Erkek toglu', 300, 0, '', 'undefined', 'undefined', 'undefined', 'undefined', '', 'yerli', 'elnen', '', '2016-01-27', '', 'active', 0, 4),
(43, 1, 50, 0, 'Erkek toglu', 300, 0, '', '200', 'kok', 'undefined', '300', '4', 'yerli', 'elnen', '', '2016-01-27', 'az', 'active', 0, 21),
(44, 1, 50, 0, 'ppapapap', 300, 0, '', '120', 'orta', 'undefined', '12', '4', 'yerli', '', '', '2016-01-29', 'YERINDE', 'active', 0, 7),
(45, 1, 55, 0, 'Duye', 340, 1, '1', '350', 'kok', 'rusiyet', '2', '1', 'rusiya', 'yerinde', '', '2016-01-29', 'mbjvbbv', 'active', 64, 13),
(46, 1, 50, 0, 'toglu', 300, 0, '', '200', 'orta', 'undefined', '1', '4', 'yerli', 'elnen', '', '2016-01-29', 'jsdfsb', 'active', 71, 18),
(47, 1, 50, 0, 'MAMAMAMAAMMAM', 300, 0, '', '300', 'kok', 'undefined', '2', '1', 'yerli', '', '', '2016-01-29', '', 'passive', 71, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `hidden`
--

CREATE TABLE `hidden` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `mezmun` text NOT NULL,
  `tarix` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hidden`
--

INSERT INTO `hidden` (`id`, `name`, `mezmun`, `tarix`) VALUES
(1, 'vmnvn', '&lt;p&gt;\r\n	hgggj&lt;/p&gt;\r\n', '2016-01-28 12:15:21');

-- --------------------------------------------------------

--
-- Структура таблицы `leftmenu`
--

CREATE TABLE `leftmenu` (
  `id` int(11) NOT NULL,
  `state` smallint(3) NOT NULL,
  `name` varchar(120) NOT NULL,
  `mezmun` text NOT NULL,
  `qeyd` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `leftmenu`
--

INSERT INTO `leftmenu` (`id`, `state`, `name`, `mezmun`, `qeyd`) VALUES
(2, 2, 'İstifadə qaydaları', '<p>\r\n	Istifade qaydalari haqqinda tanisliq</p>\r\n', 'istifade.png'),
(3, 3, 'Bazar məlumatları', '<p>\r\n	bazar melumatlar</p>\r\n', 'bazar.png'),
(5, 5, 'Reklam yerləşdirmək', '', 'reklam.png'),
(6, 6, 'Tez-tez verilən suallar', '<div style=\"line-height:2; padding:20px\">\r\n	<p>\r\n		<span style=\"font-size:16px;\"><span style=\"color:#f00;\"><strong>Tez tez verilən suallar</strong></span></span></p>\r\n	<ul>\r\n		<li>\r\n			<span style=\"font-size:14px;\"><strong>Agro Market internet portalından&nbsp; istifadə &ouml;dənişlidirmi?</strong></span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\">Xeyr. Agro Market internet portalından&nbsp; istifadə &ouml;dənişsizdir . İstifadə &uuml;&ccedil;&uuml;n sadəcə qeydiyyatdan ke&ccedil;mək lazımdır.</span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\"><strong>Agro Market internet portalından&nbsp; necə qeydiyyatdan ke&ccedil;ə bilərəm?</strong></span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\">Portaldan qeydiyyatdan ke&ccedil;mək &uuml;&ccedil;&uuml;n saytın &uuml;st hissəsində QEYDİYYAT d&uuml;yməsinə vuraraq, sizdən tələb olunan məlumatları daxil edərək qeydiyyat ke&ccedil;mək olaraq.</span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\"><strong>Elan yerləşdirmək &uuml;&ccedil;&uuml;n nə etməliyəm?</strong></span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\">Elan yerləşdirmək &uuml;&ccedil;&uuml;n ilk &ouml;ncə qeydiyyatdan ke&ccedil;mək lazım. Qeydiyyatdan ke&ccedil;dikdən sonra ELAN YERLƏŞDİRMƏK d&uuml;yməsini vuraraq elan &uuml;&ccedil;&uuml;n tələb olunan məlumatları daxil etmək lazım.</span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\"><strong>Portalda hansı formada axtarış aparmaq lazım?</strong></span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\">Portalda axtarış aparmaq &uuml;&ccedil;&uuml;n saytın &uuml;st hissəsində axtarış sahəsində&nbsp; axtardığınız məhsulun kateqoriyasının se&ccedil;ərək, məhsulun adını daxil edib AXTAR d&uuml;yməsinə vurmaq lazım.</span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\"><strong>Agro Market internet portalından&nbsp; istifadə etməyin &uuml;st&uuml;nl&uuml;kləri nələrdir?</strong></span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\">Agro Market portalı kənd təsərr&uuml;fatı məhsulların satışı ilə məşğul olan satıcılarla alıcıları bir ortamda g&ouml;r&uuml;şd&uuml;rmək &uuml;&ccedil;&uuml;n nəzərdə tutlmuşdur. Kənd təsərr&uuml;fatı məhsulları almaq istəyən hər bir şəxs axtardığı hər bir məhsulu &ccedil;ox asanlıqla bu portaldan əldə edə biləcəkdir.</span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\"><strong>Daxil edilən elanlar portalda nə qədər m&uuml;ddətdə aktiv olur?</strong></span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\">Daxil edilən elan başlanğıcda&nbsp; portala avtomatik olaraq bir ay m&uuml;ddətinə qəbul olunur. Bir ayın bitməsinə 3 g&uuml;n qalmış sistem avtomatik olaraq istifadə&ccedil;iyə xəbərdarlıq g&ouml;ndərir. Xəbərdarlqıdan sonra vaxt uzadılmırsa elan passiv olur.</span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\"><strong>Agro Market internet portalından&nbsp; istifadə edərkən &ccedil;ıxan problemlərlə əlaqədar hara m&uuml;raciət etməliyik?</strong></span></li>\r\n		<li>\r\n			<span style=\"font-size:14px;\">Ortaya &ccedil;ıxan problemlərlə əlaqədar olaraq&nbsp; destek@azagromarket.az&nbsp; emailinə yazaraq 24 saat yardım və dəstək ala bilərsiniz.</span></li>\r\n	</ul>\r\n</div>\r\n', 'suallar.png'),
(8, 8, 'AGRAR BAZAR', '<p align=\"center\">\r\n	<span style=\"font-size:16px;\">KƏND TƏSƏRR&Uuml;FATI MƏHSULLARININ SATIŞ BAZARLARI&nbsp;</span></p>\r\n<p align=\"center\">\r\n	&nbsp;</p>\r\n<p align=\"center\">\r\n	&nbsp;</p>\r\n<p align=\"center\">\r\n	<a href=\"/pages/viewh/1\"><strong>Diri heyvanların və heyvan ətinin topdan satış bazarları haqqında məlumat</strong></a></p>\r\n<p>\r\n	<a href=\"/pages/viewh/1\"><br />\r\n	</a></p>', 'agrar.png');

-- --------------------------------------------------------

--
-- Структура таблицы `main`
--

CREATE TABLE `main` (
  `id` smallint(5) NOT NULL,
  `title` varchar(200) NOT NULL,
  `menu` varchar(10000) NOT NULL,
  `titleen` text NOT NULL,
  `menuen` text NOT NULL,
  `titleru` text NOT NULL,
  `menuru` text NOT NULL,
  `state1` int(11) NOT NULL,
  `url` varchar(300) NOT NULL,
  `main` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `main`
--

INSERT INTO `main` (`id`, `title`, `menu`, `titleen`, `menuen`, `titleru`, `menuru`, `state1`, `url`, `main`) VALUES
(1, 'XƏBƏRLƏR', '<p>\r\n	cs sfdfsfsdafgd dgdgd</p>\r\n', 'MAIN', 'MAIN page text', 'ГЛАВНАЯ', 'Техт главная', 3, '', 'main'),
(2, 'HAQQIMIZDA', '<p>\r\n	Azərbaycan-Belarus arasında sənədlərinin imzalanması mərasimi olub. &Uuml;mumilikdə 4 sənəd imzalanıb. Prezidenti İlham Əliyev və Aleksandr LukaşenkoPrezidentlər birgə bəyannamə imzalayıblar. Daha sonra gdfgs gfsg sgfs g ANS PRESS-in məlumatına g&ouml;rə, &quot;D&ouml;vlət r&uuml;sumu haqqında&quot; qanuna edilmiş dəyişikliyə əsasən, respublikamızın vətəndaşları şəxsiyyət vəsiqəsi 10 g&uuml;n m&uuml;ddətində verildikdə və ya dəyişdirildikdə d&ouml;vlət b&uuml;dcəsinə 5 manat, 3 iş g&uuml;n&uuml; m&uuml;ddətində verildikdə və ya dəyişdirildikdə 25 manat, 1 iş g&uuml;n&uuml; m&uuml;ddətində verildikdə və ya dəyişdirildikdə isə 35 manat məbləğində r&uuml;sum &ouml;dəyəcək. Bu ilin oktyabr ayında isə şəxsiyyət vəsiqələri ilə bağlı daha bir dəyişiklik olunub. Nazirlər Kabineti &quot;Azərbaycan Respublikasına qayıdış şəhadətnaməsinin blanklarının ciddi hesabat sənədi kimi u&ccedil;otu Qaydaları&quot;nda dəyişiklik edilməsi haqqında&quot; 2012-ci il 21 noyabr tarixli qərarında dəyişiklik edib. xarici d&ouml;vlətdə 18 yaşına &ccedil;atmış Azərbaycan vətəndaşına Azərbaycanın diplomatik n&uuml;mayəndəliyi və ya konsulluğu tərəfindən &ouml;lkəyə qayıtmaq &uuml;&ccedil;&uuml;n qayıdış şəhadətnaməsi verilməli idi. Eyni h&uuml;quqlar &ouml;lkədə qanuni əsaslarla yaşayan vətəndaşlığı olmayan şəxsə, onunla birgə Azərbaycana qayıdan 18 yaşına &ccedil;atmayan və ya xarici d&ouml;vlətdə 18 yaşına &ccedil;atmış uşağına da aid edilir. Dəyişikliyə g&ouml;rə, şəxsiyyət vəsiqəsi itmiş, oğurlanmış və ya yararsız hala d&uuml;şm&uuml;ş, həm&ccedil;inin şəxsiyyət vəsiqəsinin etibarlılıq m&uuml;ddəti bitmiş Azərbaycan vətəndaşına qayıdış şəhadətnaməsinin verilməsinə 2015-ci ilin dekabrından başlanılması təxirə salınıb. Bu c&uuml;r şəhadətnamənin verilməsinə 2017-ci il yanvarın 1-dən başlanacaq. Bu, Azərbaycan vətəndaşlarına yeni nəsil, elektron daşıyıcıya malik şəxsiyyət vəsiqələrinin verilməsinə 2017-ci yanvarın 1-dən verilməyə başlanacağı ilə bağlıdır.</p>\r\n', '', '', '', '', 1, '', ''),
(3, 'QANUNVERİCİLİK', 'Biz yaranmisig 1999-da', '', '', '', '', 5, '', ''),
(4, 'ƏLAQƏ', 'buda bizim korporativ musteilre.\r\n1-Oxford summer school', '', '', '', '', 27, '', ''),
(5, 'ELEKTRON XİDMƏTLƏR', '', '', '', '', '', 4, 'http://e-xidmet.agro.gov.az/', '');

-- --------------------------------------------------------

--
-- Структура таблицы `main_menu`
--

CREATE TABLE `main_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `qeyd` varchar(255) NOT NULL,
  `qeyd_en` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `mezmun` text NOT NULL,
  `xulase` varchar(300) NOT NULL,
  `tarix` datetime NOT NULL,
  `sekil` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `name`, `mezmun`, `xulase`, `tarix`, `sekil`) VALUES
(1, 'KƏND TƏSƏRRÜFATI MƏHSULLARININ SATIŞ BAZARLARI', '&lt;p&gt;\r\n	&amp;nbsp;&lt;strong&gt;Diri heyvanların və heyvan ətinin topdan satış bazarları haqqında məlumat00&lt;/strong&gt;&lt;/p&gt;\r\n&lt;table align=&quot;left&quot; border=&quot;1&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th style=&quot;width:102px;&quot;&gt;\r\n				&lt;p align=&quot;center&quot;&gt;\r\n					Rayon və ya şəhərin adı&lt;/p&gt;\r\n			&lt;/th&gt;\r\n			&lt;th style=&quot;width:246px;&quot;&gt;\r\n				&lt;p align=&quot;center&quot;&gt;\r\n					&lt;strong&gt;Bazarın adı&lt;/strong&gt;&lt;/p&gt;\r\n			&lt;/th&gt;\r\n			&lt;th style=&quot;width:312px;&quot;&gt;\r\n				&lt;p align=&quot;center&quot;&gt;\r\n					&lt;strong&gt;Yerləşdiyi ərazi &lt;/strong&gt;&lt;/p&gt;\r\n			&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td rowspan=&quot;10&quot; style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					&amp;nbsp;&lt;/p&gt;\r\n				&lt;p&gt;\r\n					&amp;nbsp;&lt;/p&gt;\r\n				&lt;p&gt;\r\n					&amp;nbsp;&lt;/p&gt;\r\n				&lt;p&gt;\r\n					&amp;nbsp;&lt;/p&gt;\r\n				&lt;p&gt;\r\n					Bakı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;1.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/strong&gt;&amp;ldquo;Bəsit&amp;rdquo; firması&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Bakı şəh. H.Əliyevprs. 92&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;2.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/strong&gt;&amp;ldquo;Ucal-Erg&amp;uuml;n&amp;rdquo;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					&amp;nbsp;Bakı şəh. Nərimanov r. Ə.Əliyev 26&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;3.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/strong&gt;&amp;ldquo;Təzə bazar&amp;rdquo; MMC&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Bakı şəh. Nəsimi r.&amp;nbsp; S. Vurğun 73&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;4.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/strong&gt;&amp;ldquo;Ət qəbulu və tədar&amp;uuml;k&amp;uuml; &amp;ldquo;məntəqəsi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Bakı şəh.Səbail r. Bayıl qəs. G. Əliyev k&amp;uuml;&amp;ccedil;. 20&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;5.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/strong&gt;&amp;ldquo;Azbanvit&amp;rdquo; ət kəsmə kombinatı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Bakı şəh.&amp;nbsp; Xəzər r. Buzovna qəs.&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;6.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/strong&gt;&amp;ldquo;Qo&amp;ccedil;-ət&amp;rdquo; MMC&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Bakı şəh.&amp;nbsp; Qaradağ r.L&amp;ouml;kbatanqəs.&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;7.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/strong&gt;&amp;ldquo;Keşlə&amp;rdquo; ticarət mərkəzi &amp;ldquo;Təbriz&amp;rdquo; KM&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Bakı şəh.&amp;nbsp; Nərimanov r. Ə.Əliyevk&amp;uuml;&amp;ccedil;. 19/24&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;8.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/strong&gt;&amp;ldquo;Hilal&amp;rdquo; aqro MMC&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Bakı şəh.&amp;nbsp; Sabun&amp;ccedil;u r. K&amp;uuml;rdəxanı kəndi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;9.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/strong&gt;&amp;ldquo;Aysel&amp;rdquo; ət kəsimi və satışı pavilyonu&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Bakı şəh.&amp;nbsp; Binəqədi r. Atat&amp;uuml;rk&amp;nbsp; prs.52C&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;height:18px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;10.&amp;nbsp; &lt;/strong&gt;&amp;ldquo;&amp;Ouml;zfermamızdan&amp;rdquo;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;height:18px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Bakı şəh.&amp;nbsp; Xəzər r. Binə qəs.&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td rowspan=&quot;3&quot; style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					&amp;nbsp;&lt;/p&gt;\r\n				&lt;p&gt;\r\n					Sumqayıt&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;11.&amp;nbsp; &lt;/strong&gt;Mərcan firması&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Sumqayıt şəh. 15 məhəllə&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;12.&amp;nbsp; &lt;/strong&gt;Misiroğlu Firması&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Sumqayıt şəh. 46 məhəllə &amp;Ccedil;erkaskik&amp;uuml;&amp;ccedil;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;13.&amp;nbsp; &lt;/strong&gt;&amp;ldquo;İmi&amp;rdquo; Firması&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Sumqayıt şəh. 46 məhəllə &amp;Ccedil;erkaskik&amp;uuml;&amp;ccedil;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Şəki&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;14.&amp;nbsp; &lt;/strong&gt;Şəki diri heyvan bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Salman M&amp;uuml;mtazk&amp;uuml;&amp;ccedil; (həftəlik)&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Ağcabədi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;15.&amp;nbsp; &lt;/strong&gt;Ağcabədi diri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					S&amp;uuml;l&amp;uuml; kəndi (həftəlik)&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Bərdə&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;16.&amp;nbsp; &lt;/strong&gt;Bərdə diri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Alpoud kəndi (həftəlik)&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Ağdaş&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;17.&amp;nbsp; &lt;/strong&gt;Ağdaş diri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Zeynəddin kəndi (həftəlik)&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Ağsu&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;18.&amp;nbsp; &lt;/strong&gt;Ağsu&amp;nbsp; diri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Agsu-Gəgəli yolunun sag tərəfi (həftəlik)&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Balakən&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;19.&amp;nbsp; &lt;/strong&gt;Balakən diri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Balakən rayonu Hənifə kəndi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Beyləqan&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;20.&amp;nbsp; &lt;/strong&gt;Beyləqan diri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Beylaqan rayon Asiqli kəndi&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Biləsuvar&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;21.&amp;nbsp; &lt;/strong&gt;Biləsuvardiri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Biləsuvar r. Təyyarə meydanı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Cəlilabad&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;22.&amp;nbsp; &lt;/strong&gt;Cəlilabad &amp;nbsp;diri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Cəlilabad r. Cavadxank&amp;uuml;&amp;ccedil;(həftəlik)&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					G&amp;ouml;yg&amp;ouml;l&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;23.&amp;nbsp; &lt;/strong&gt;G&amp;ouml;yg&amp;ouml;l&amp;nbsp; diri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					G&amp;ouml;yg&amp;ouml;l rayonu Yeni Qızılca kəndi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					İmişli&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;24.&amp;nbsp; &lt;/strong&gt;&lt;strong&gt;&amp;ldquo;&lt;/strong&gt;S&amp;uuml;bhan Kəndli Təsərr&amp;uuml;fatı&amp;rdquo; MMC&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					İmişli rayonu, Otuziki kəndi&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Lənkəran&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;25.&amp;nbsp; &lt;/strong&gt;Lənkəran ş. ATSC-nin bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Lənkəran şəhəri və Liman qəs&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Qəbələ&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;26.&amp;nbsp; &lt;/strong&gt;Qəbələ mal bazarı və Nic həftə bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Qəbələ şəhəri və Nic kəndi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Qazax&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;27.&amp;nbsp; &lt;/strong&gt;Qazax diri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Qazax şəhər Ağstafa &amp;ccedil;ay sahili&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Qusar&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;28.&amp;nbsp; &lt;/strong&gt;Qusar şəhər Ət kəsim məntəqəsi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Qusar şəhər&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td rowspan=&quot;2&quot; style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					&amp;nbsp;&lt;/p&gt;\r\n				&lt;p&gt;\r\n					Sabirabad&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;29.&amp;nbsp; &lt;/strong&gt;Sabirabad K&amp;uuml;rkəndi mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Sabirabad rayon K&amp;uuml;rkəndi kəndi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;30.&amp;nbsp; &lt;/strong&gt;Sabirabad Şəhriyar mal&amp;nbsp; bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Sabirabad rayon Şəhriyar kəndi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Salyan&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;31.&amp;nbsp; &lt;/strong&gt;Salyan diri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Ələt-Astara yolunun Salyan şəhər Stansiya ərazisi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Şamaxı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;32.&amp;nbsp; &lt;/strong&gt;&amp;ldquo;Şirvan&amp;rdquo; ticarət mərkəzi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Şamaxı şəhəri 48-ci məhəllə&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Tovuz&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;33.&amp;nbsp; &lt;/strong&gt;Tovuz rayonudiri mal bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Tovuz rayonu Dondar Quş&amp;ccedil;u kəndi&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td rowspan=&quot;2&quot; style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Xa&amp;ccedil;maz&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;34.&amp;nbsp; &lt;/strong&gt;Xa&amp;ccedil;maz Azəri Qardaşları MMC&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Xa&amp;ccedil;maz şəhər Mehdi H&amp;uuml;seynzadə k&amp;uuml;&amp;ccedil;.&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;35.&amp;nbsp; &lt;/strong&gt;Xudat şəhər Kolxoz bazarı&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Xudat şəhər Axundov k&amp;uuml;&amp;ccedil;.&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:102px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Zaqatala&amp;nbsp;&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:246px;&quot;&gt;\r\n				&lt;p style=&quot;margin-left:.1pt;&quot;&gt;\r\n					&lt;strong&gt;36.&amp;nbsp; &lt;/strong&gt;Zaqatala Mini ət kəsim sexi&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td style=&quot;width:312px;&quot;&gt;\r\n				&lt;p&gt;\r\n					Aşağı Tala&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;', '', '2015-12-27 23:57:20', 'Cow_female_black_white.jpg'),
(2, 'KƏND TƏSƏRRÜFATI NAZİRLİYİNİN GÜNDƏLİK YENİLƏNƏN QİYMƏT mcmmcmc  İNFORMASİYA PORTALI TAM-- FƏALİYYƏT GÖSTƏRİR', '&lt;p&gt;\r\n	KƏND TƏSƏRR&amp;Uuml;FATI NAZkshaf jsaasahfsajhfaksfa ahfuha;dsfasfsa&amp;#39;dfajsdk adfs----&lt;/p&gt;\r\n', '', '2016-01-29 14:03:59', 'iddeolyj6w1454061839Cow_female_black_white.jpg'),
(3, 'SUMQAYITDA KƏND TƏSƏRRÜFATI MƏHSULLARININ SATIŞ YARMARKASI AÇILIB', '&lt;p style=&quot;box-sizing: border-box; margin: 0px 0px 0.5em; padding: 0px; border: 0px; font-stretch: inherit; font-size: 14.6667px; line-height: 17px; font-family: Calibri, Arial, Helvetica, sans-serif; vertical-align: baseline; text-indent: 2em; text-align: justify; color: rgb(61, 61, 61);&quot;&gt;\r\n	&lt;span style=&quot;box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12pt; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;Dekabrın 5-də Kənd Təsərr&amp;uuml;fatı Nazirliyi və Sumqayıt Şəhər İcra Hakimiyyətinin təşkilat&amp;ccedil;ılığı ilə Sumqayıt şəhərində kənd təsərr&amp;uuml;fatı məhsullarının satış-yarmarkası a&amp;ccedil;ılıb.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; margin: 0px 0px 0.5em; padding: 0px; border: 0px; font-stretch: inherit; font-size: 14.6667px; line-height: 17px; font-family: Calibri, Arial, Helvetica, sans-serif; vertical-align: baseline; text-indent: 2em; text-align: justify; color: rgb(61, 61, 61);&quot;&gt;\r\n	&lt;span style=&quot;box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12pt; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;Həftənin şənbə və bazar g&amp;uuml;nləri təşkil olunacaq yarmarkaya səhər saat 10-da start verilib. Respublikanın ayrı-ayrı rayonlarından minədək fermer yarmarkada satışa 300 tondan &amp;ccedil;ox kənd təsərr&amp;uuml;fatı məhsulları &amp;ccedil;ıxarıb.&lt;/span&gt;&lt;br style=&quot;box-sizing: border-box;&quot; /&gt;\r\n	&lt;span style=&quot;box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12pt; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;a class=&quot;highslide&quot; href=&quot;http://agro.gov.az/uploads/posts/2015-12/1449470645_sumqayit-yarmarka-05.12.2015jpg-2.jpg&quot; rel=&quot;highslide&quot; style=&quot;box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: rgb(94, 125, 46);&quot;&gt;&lt;img alt=&quot;SUMQAYITDA KƏND TƏSƏRRÜFATI MƏHSULLARININ SATIŞ YARMARKASI AÇILIB&quot; src=&quot;http://agro.gov.az/uploads/posts/2015-12/medium/1449470645_sumqayit-yarmarka-05.12.2015jpg-2.jpg&quot; style=&quot;box-sizing: border-box; margin: 20px 20px 20px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; cursor: url(&amp;quot;highslide/graphics/zoomin.cur&amp;quot;), pointer !important; float: left;&quot; title=&quot;SUMQAYITDA KƏND TƏSƏRRÜFATI MƏHSULLARININ SATIŞ YARMARKASI AÇILIB&quot; /&gt;&lt;/a&gt;&lt;a class=&quot;highslide&quot; href=&quot;http://agro.gov.az/uploads/posts/2015-12/1449477416_sumqayit-yarmarka-05.12.2015jpg-3.jpg&quot; rel=&quot;highslide&quot; style=&quot;box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: rgb(94, 125, 46);&quot;&gt;&lt;img alt=&quot;SUMQAYITDA KƏND TƏSƏRRÜFATI MƏHSULLARININ SATIŞ YARMARKASI AÇILIB&quot; src=&quot;http://agro.gov.az/uploads/posts/2015-12/medium/1449477416_sumqayit-yarmarka-05.12.2015jpg-3.jpg&quot; style=&quot;box-sizing: border-box; margin: 20px 20px 20px 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; cursor: url(&amp;quot;highslide/graphics/zoomin.cur&amp;quot;), pointer !important; float: left;&quot; title=&quot;SUMQAYITDA KƏND TƏSƏRRÜFATI MƏHSULLARININ SATIŞ YARMARKASI AÇILIB&quot; /&gt;&lt;/a&gt;Satış-yarmarka ilə tanışlıq zamanı kənd təsərr&amp;uuml;fatı naziri Heydər Əsədov jurnalistlərə bildirdi ki, yarmarkanın ke&amp;ccedil;irilməsində əsas məqsəd fermerlərin məhsullarını bazara &amp;ccedil;ıxarmasına k&amp;ouml;mək etmək, fermerlərlə emal m&amp;uuml;əssisələri və alıcılar arasında əlaqə yaratmaq, bazarlarda s&amp;uuml;ni qiymət artımının qarşısını almaqdır. Əhaliyə təqdim olunan məhsulların qiyməti bazar qiymətindən 25-30 faiz aşağıdır. Yarmarkanın ərazisində nəzarət- toksikologiya laboratoriyası və baytarlıq nəzarət xidmətinin əməkdaşları tərəfindən tibbi m&amp;uuml;ayinələr aparılıb.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;box-sizing: border-box; margin: 0px 0px 0.5em; padding: 0px; border: 0px; font-stretch: inherit; font-size: 14.6667px; line-height: 17px; font-family: Calibri, Arial, Helvetica, sans-serif; vertical-align: baseline; text-indent: 2em; text-align: justify; color: rgb(61, 61, 61);&quot;&gt;\r\n	&lt;span style=&quot;box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 12pt; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;Satışa &amp;ccedil;ıxarılan məhsulların bazar qiymətindən aşağı olması alıcıların da &amp;uuml;rəyincə olub. Satıcılar və alıcılar satış-yarmarkasının y&amp;uuml;ksək səviyyədə təşkilinə g&amp;ouml;rə razılıqlarını bildiriblər.&lt;/span&gt;&lt;/p&gt;\r\n', '', '2015-12-14 10:07:20', 'Cow_female_black_white.jpg'),
(4, 'NAZİR HEYDƏR ƏSƏDOV ZAQATALA RAYONUNDA VƏTƏNDAŞLARLA GÖRÜŞÜB', '&lt;p&gt;\r\n	NAZİR HEYDƏR ƏSƏDOV ZAQATALA RAYONUNDA VƏTƏNDAŞLARLA G&amp;Ouml;R&amp;Uuml;Ş&amp;Uuml;B&lt;/p&gt;\r\n', '', '2016-01-29 13:51:51', '2016-01-29 13:51:51dana.jpg'),
(5, '&quot;KƏND TƏSƏRRÜFATI ASSOSİASİYALARI&quot; MÖVZUSUNDA İKİ GÜNLÜK SEMİNAR İŞƏ BAŞLAMIŞDIR', '&lt;p&gt;\r\n	&amp;quot;KƏND TƏSƏRR&amp;Uuml;FATI ASSOSİASİYALARI&amp;quot; M&amp;Ouml;VZUSUNDA İKİ G&amp;Uuml;NL&amp;Uuml;K SEMİNAR İŞƏ BAŞLAMIŞDIR&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img alt=&quot;&quot; src=&quot;http://agro.loc/js/ckeditor/plugins/w3bdeveloper_uimages/media_files/1449643514_meyv-trvz-3.jpg&quot; style=&quot;width: 450px; height: 250px;&quot; /&gt;&lt;/p&gt;\r\n', '', '2015-12-14 16:57:34', 'Cow_female_black_white.jpg'),
(8, 'hahahahahhahah', '&lt;p&gt;\r\n	i yfiasudtf asfa stsadf isaf sagfasoidtfo saftag utsif asfgasu fgafga fagydfas&lt;/p&gt;\r\n', '', '2016-01-29 13:15:05', 'Cow_female_black_white.jpg'),
(9, 'hahahahahhahah', '&lt;p&gt;\r\n	i yfiasudtf asfa stsadf isaf sagfasoidtfo saftag utsif asfgasu fgafga fagydfas&lt;/p&gt;\r\n', '', '2016-01-29 13:15:46', '2016-01-29 13:15:46Cow_female_black_white.jpg'),
(10, 'hahahahahhahah', '&lt;p&gt;\r\n	i yfiasudtf asfa stsadf isaf sagfasoidtfo saftag utsif asfgasu fgafga fagydfas&lt;/p&gt;\r\n', '', '2016-01-29 13:17:31', 'Cow_female_black_white.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `ques_id` int(11) NOT NULL,
  `value` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `options`
--

INSERT INTO `options` (`id`, `ques_id`, `value`) VALUES
(1, 1, 'Bəyənirəm'),
(2, 1, 'Qismən'),
(3, 1, 'Bəyənmirəm');

-- --------------------------------------------------------

--
-- Структура таблицы `pic`
--

CREATE TABLE `pic` (
  `id` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `large_name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pic`
--

INSERT INTO `pic` (`id`, `eid`, `name`, `large_name`) VALUES
(111, 93, 'balaca/ids2ej372m1451133436.jpg', ''),
(112, 93, 'balaca/id9dmpzjsb1451133436.jpg', ''),
(113, 93, 'balaca/idyezcm3951451133437.jpg', ''),
(114, 94, 'balaca/idzpu7z95q1451133871.jpg', 'boyuk/idzpu7z95q1451133871.jpg'),
(115, 94, 'balaca/idmzbsdnpk1451133871.jpg', 'boyuk/idmzbsdnpk1451133871.jpg'),
(116, 94, 'balaca/idq5qzjdeo1451133871.jpg', 'boyuk/idq5qzjdeo1451133871.jpg'),
(117, 1, 'balaca/idfirc1hg41451161749.jpg', 'boyuk/idfirc1hg41451161749.jpg'),
(118, 1, 'balaca/idwvrmgljo1451161749.jpg', 'boyuk/idwvrmgljo1451161749.jpg'),
(119, 1, 'balaca/idj0830j3b1451161749.jpg', 'boyuk/idj0830j3b1451161749.jpg'),
(120, 2, 'balaca/idnrurf6bm1451162021.jpg', 'boyuk/idnrurf6bm1451162021.jpg'),
(121, 2, 'balaca/idca3byj2q1451162021.jpg', 'boyuk/idca3byj2q1451162021.jpg'),
(122, 3, 'balaca/id5wdm1gds1451162322.jpg', 'boyuk/id5wdm1gds1451162322.jpg'),
(123, 3, 'balaca/id2zyewtjn1451162322.jpg', 'boyuk/id2zyewtjn1451162322.jpg'),
(124, 3, 'balaca/id104a3qcl1451162322.jpg', 'boyuk/id104a3qcl1451162322.jpg'),
(125, 3, 'balaca/idz1y1j59j1451162322.jpg', 'boyuk/idz1y1j59j1451162322.jpg'),
(126, 4, 'balaca/idzos73w9r1451162531.jpg', 'boyuk/idzos73w9r1451162531.jpg'),
(127, 4, 'balaca/id1glt40fp1451162531.jpg', 'boyuk/id1glt40fp1451162531.jpg'),
(128, 4, 'balaca/idcwnb8eij1451162532.jpg', 'boyuk/idcwnb8eij1451162532.jpg'),
(129, 4, 'balaca/id6alsz8qj1451162532.jpg', 'boyuk/id6alsz8qj1451162532.jpg'),
(130, 5, 'balaca/idz1tksd111451162535.jpg', 'boyuk/idz1tksd111451162535.jpg'),
(131, 5, 'balaca/id4gts4np51451162535.jpg', 'boyuk/id4gts4np51451162535.jpg'),
(132, 5, 'balaca/idad45zw4c1451162535.jpg', 'boyuk/idad45zw4c1451162535.jpg'),
(133, 5, 'balaca/idbrialw491451162535.jpg', 'boyuk/idbrialw491451162535.jpg'),
(134, 6, 'balaca/id0pulge8r1451162537.jpg', 'boyuk/id0pulge8r1451162537.jpg'),
(135, 6, 'balaca/id6z56jb3y1451162537.jpg', 'boyuk/id6z56jb3y1451162537.jpg'),
(136, 6, 'balaca/idgvf205qh1451162537.jpg', 'boyuk/idgvf205qh1451162537.jpg'),
(137, 6, 'balaca/idrwnyrfip1451162538.jpg', 'boyuk/idrwnyrfip1451162538.jpg'),
(138, 7, 'balaca/id09ahiuzy1451162540.jpg', 'boyuk/id09ahiuzy1451162540.jpg'),
(139, 7, 'balaca/idtl3hltzc1451162540.jpg', 'boyuk/idtl3hltzc1451162540.jpg'),
(140, 7, 'balaca/id81jo4rtq1451162540.jpg', 'boyuk/id81jo4rtq1451162540.jpg'),
(141, 7, 'balaca/idmcayuzbl1451162540.jpg', 'boyuk/idmcayuzbl1451162540.jpg'),
(142, 8, 'balaca/idjri3y6yz1451162542.jpg', 'boyuk/idjri3y6yz1451162542.jpg'),
(143, 8, 'balaca/idjapyyjy61451162542.jpg', 'boyuk/idjapyyjy61451162542.jpg'),
(144, 8, 'balaca/id9lp3cc1e1451162543.jpg', 'boyuk/id9lp3cc1e1451162543.jpg'),
(145, 8, 'balaca/idcurskhf41451162543.jpg', 'boyuk/idcurskhf41451162543.jpg'),
(146, 9, 'balaca/idwzhg4mk81451162545.jpg', 'boyuk/idwzhg4mk81451162545.jpg'),
(147, 9, 'balaca/idbgdoy7er1451162545.jpg', 'boyuk/idbgdoy7er1451162545.jpg'),
(148, 9, 'balaca/id78an7kny1451162545.jpg', 'boyuk/id78an7kny1451162545.jpg'),
(149, 9, 'balaca/idliii7raw1451162545.jpg', 'boyuk/idliii7raw1451162545.jpg'),
(151, 12, 'balaca/idmfgmda371451892206.png', 'boyuk/idmfgmda371451892206.png'),
(152, 13, 'balaca/idfuj8ej0p1451892288.png', 'boyuk/idfuj8ej0p1451892288.png'),
(153, 14, 'balaca/id16jc0zni1451892329.jpg', 'boyuk/id16jc0zni1451892329.jpg'),
(154, 15, 'balaca/iddwcgv6e31451892357.jpg', 'boyuk/iddwcgv6e31451892357.jpg'),
(155, 16, 'balaca/idf9v7qmlw1452064966.jpg', 'boyuk/idf9v7qmlw1452064966.jpg'),
(156, 17, 'balaca/id58a7ogb21452064970.jpg', 'boyuk/id58a7ogb21452064970.jpg'),
(157, 18, 'balaca/idm4zdkhl41452064972.jpg', 'boyuk/idm4zdkhl41452064972.jpg'),
(158, 19, 'balaca/id9nucjnqz1452064974.jpg', 'boyuk/id9nucjnqz1452064974.jpg'),
(159, 20, 'balaca/id83pzbr1e1452064976.jpg', 'boyuk/id83pzbr1e1452064976.jpg'),
(160, 22, 'balaca/idtpoi1pmh1452065143.jpg', 'boyuk/idtpoi1pmh1452065143.jpg'),
(161, 23, 'balaca/idze6nbi6w1452065146.jpg', 'boyuk/idze6nbi6w1452065146.jpg'),
(162, 24, 'balaca/idk6u8m93z1452065150.jpg', 'boyuk/idk6u8m93z1452065150.jpg'),
(163, 25, 'balaca/id85a7fkg01452065153.jpg', 'boyuk/id85a7fkg01452065153.jpg'),
(164, 26, 'balaca/id6blp1ayn1452065167.jpg', 'boyuk/id6blp1ayn1452065167.jpg'),
(165, 27, 'balaca/id24furgv31452065170.jpg', 'boyuk/id24furgv31452065170.jpg'),
(167, 28, 'balaca/idzqggs1271452065317.jpg', 'boyuk/idzqggs1271452065317.jpg'),
(168, 28, 'balaca/id508wkcqn1452065317.jpg', 'boyuk/id508wkcqn1452065317.jpg'),
(169, 28, 'balaca/id9tddu4gi1452065317.jpg', 'boyuk/id9tddu4gi1452065317.jpg'),
(170, 29, 'balaca/idn9m71lqp1452065367.jpg', 'boyuk/idn9m71lqp1452065367.jpg'),
(171, 30, 'balaca/ideo3vsn5z1452065369.jpg', 'boyuk/ideo3vsn5z1452065369.jpg'),
(172, 31, 'balaca/idhzu4m4ae1452065881.jpg', 'boyuk/idhzu4m4ae1452065881.jpg'),
(173, 32, 'balaca/id3l1zptje1452065883.jpg', 'boyuk/id3l1zptje1452065883.jpg'),
(174, 33, 'balaca/id885voh041452065885.jpg', 'boyuk/id885voh041452065885.jpg'),
(175, 34, 'balaca/idlz9mrl4i1452065886.jpg', 'boyuk/idlz9mrl4i1452065886.jpg'),
(176, 35, 'balaca/id8mg7r6tm1452065889.jpg', 'boyuk/id8mg7r6tm1452065889.jpg'),
(177, 36, 'balaca/idjfdallzp1452065890.jpg', 'boyuk/idjfdallzp1452065890.jpg'),
(178, 37, 'balaca/idlob6l6v21452065892.jpg', 'boyuk/idlob6l6v21452065892.jpg'),
(179, 38, 'balaca/id3s4nbr3i1452085586.jpg', 'boyuk/id3s4nbr3i1452085586.jpg'),
(181, 38, 'balaca/idnkj6zfim1452085587.jpg', 'boyuk/idnkj6zfim1452085587.jpg'),
(182, 38, 'balaca/id1s09pj8v1452085587.jpg', 'boyuk/id1s09pj8v1452085587.jpg'),
(183, 38, 'balaca/idoiqzsty81452085587.jpg', 'boyuk/idoiqzsty81452085587.jpg'),
(184, 39, 'balaca/idwqmt208h1452085761.jpg', 'boyuk/idwqmt208h1452085761.jpg'),
(185, 39, 'balaca/id754nzyjk1452085761.jpg', 'boyuk/id754nzyjk1452085761.jpg'),
(186, 39, 'balaca/idnrkg9klb1452085761.jpg', 'boyuk/idnrkg9klb1452085761.jpg'),
(187, 39, 'balaca/id13jsc9sv1452085761.jpg', 'boyuk/id13jsc9sv1452085761.jpg'),
(188, 39, 'balaca/idiudaelwz1452085761.jpg', 'boyuk/idiudaelwz1452085761.jpg'),
(190, 40, 'balaca/id2wajdbej1452085885.jpg', 'boyuk/id2wajdbej1452085885.jpg'),
(191, 40, 'balaca/id3jb7zf9q1452085885.jpg', 'boyuk/id3jb7zf9q1452085885.jpg'),
(192, 40, 'balaca/ids6wlqs7s1452085885.jpg', 'boyuk/ids6wlqs7s1452085885.jpg'),
(193, 40, 'balaca/idzyu66ey11452085885.jpg', 'boyuk/idzyu66ey11452085885.jpg'),
(194, 41, 'balaca/id260kazad1452085971.jpg', 'boyuk/id260kazad1452085971.jpg'),
(195, 41, 'balaca/id910mpg5e1452085971.jpg', 'boyuk/id910mpg5e1452085971.jpg'),
(196, 41, 'balaca/id774kjhzk1452085972.jpg', 'boyuk/id774kjhzk1452085972.jpg'),
(197, 42, 'balaca/idzgi45gz71453886059.jpg', 'boyuk/idzgi45gz71453886059.jpg'),
(198, 42, 'balaca/idtbfyrqyq1453886060.jpg', 'boyuk/idtbfyrqyq1453886060.jpg'),
(199, 42, 'balaca/id5ioudq3u1453886060.jpg', 'boyuk/id5ioudq3u1453886060.jpg'),
(200, 43, 'balaca/idu874zirh1453886084.jpg', 'boyuk/idu874zirh1453886084.jpg'),
(201, 43, 'balaca/ide590q4pp1453886084.jpg', 'boyuk/ide590q4pp1453886084.jpg'),
(202, 43, 'balaca/ida818bzyr1453886085.jpg', 'boyuk/ida818bzyr1453886085.jpg'),
(203, 44, 'balaca/idq45ttkjf1454048521.jpg', 'boyuk/idq45ttkjf1454048521.jpg'),
(204, 44, 'balaca/idtq3m001a1454048521.jpg', 'boyuk/idtq3m001a1454048521.jpg'),
(205, 44, 'balaca/idg4n6wtz31454048521.jpg', 'boyuk/idg4n6wtz31454048521.jpg'),
(207, 45, 'balaca/id9snprz5l1454048694.jpg', 'boyuk/id9snprz5l1454048694.jpg'),
(208, 45, 'balaca/idizgv71yl1454048694.jpg', 'boyuk/idizgv71yl1454048694.jpg'),
(209, 45, 'balaca/idulqzjrrn1454048694.jpg', 'boyuk/idulqzjrrn1454048694.jpg'),
(210, 45, 'balaca/iderd53qc61454048694.jpg', 'boyuk/iderd53qc61454048694.jpg'),
(211, 46, 'balaca/idzwbwua5d1454057671.jpg', 'boyuk/idzwbwua5d1454057671.jpg'),
(212, 46, 'balaca/idzrqdoo0g1454057671.jpg', 'boyuk/idzrqdoo0g1454057671.jpg'),
(213, 47, 'balaca/iduters3t11454070304.jpg', 'boyuk/iduters3t11454070304.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `pro`
--

CREATE TABLE `pro` (
  `id` smallint(5) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pro`
--

INSERT INTO `pro` (`id`, `name`) VALUES
(1, 'ETLIK'),
(2, 'SUDLUK'),
(3, 'YUNLUQ'),
(4, 'YUMURTALIQ');

-- --------------------------------------------------------

--
-- Структура таблицы `qeydiyyat`
--

CREATE TABLE `qeydiyyat` (
  `id` int(11) NOT NULL,
  `ptype` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sname` varchar(120) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `company` text NOT NULL,
  `area` text NOT NULL,
  `login` varchar(150) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(120) NOT NULL,
  `contactperson` varchar(150) NOT NULL,
  `webpage` varchar(120) NOT NULL,
  `rules` varchar(200) NOT NULL,
  `buyerseller` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `qeydiyyat`
--

INSERT INTO `qeydiyyat` (`id`, `ptype`, `name`, `sname`, `fname`, `company`, `area`, `login`, `password`, `email`, `phone`, `address`, `contactperson`, `webpage`, `rules`, `buyerseller`) VALUES
(64, 'buyer', 'Azer', 'Qurbanov', 'Eldar', 'AR MMC', '1', 'azegurb', '19841223', 'az@gmail.com', '777', '77', '777', '7', '77', ''),
(65, 'buyer', 'Samir', 'Valiyev', '', '', '1', 'samiko', '123', 'sam@az.com', '', '', '', '', '', ''),
(70, 'seller', 'mm', 'm', 'm', 'm', '4', 'm', 'm', 'azegurb@mail.ru', '121', '', '', '', '', ''),
(71, 'buyer', 'Azer', 'Qurbanov', 'Eldar', '', '1', 'azegurb', '19841223', 'a.e.qurbanov@gmail.com', '102121212', '', '', '', '', ''),
(72, 'buyer', 'Ali', 'hasan', '', '', '1', 'azeg', '123', 'azegurb@gmail.com', '0124444444', 'sg fkhg', 'Azer', '', 'sg fkhg', ''),
(73, 'buyer', 'Mambo', 'adj akj', 'jjhjh', '', '1', 'az', 'az', 'azer.gurbanov@facebook.com', '0120120', '', 'Memmed', 'www.sayt.az', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `ques` text NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `ques`, `created_on`) VALUES
(1, 'Saytımızın dizaynını bəyənirsizmi?', '2009-10-13 07:42:18');

-- --------------------------------------------------------

--
-- Структура таблицы `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `sid` int(5) NOT NULL,
  `state` int(5) NOT NULL,
  `name` tinytext NOT NULL,
  `qeyd` int(11) NOT NULL,
  `fatty` varchar(100) NOT NULL,
  `age` varchar(100) NOT NULL,
  `diri` varchar(100) NOT NULL,
  `cins` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `pro` varchar(100) NOT NULL,
  `img` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subcategory`
--

INSERT INTO `subcategory` (`id`, `sid`, `state`, `name`, `qeyd`, `fatty`, `age`, `diri`, `cins`, `amount`, `pro`, `img`) VALUES
(50, 1, 0, 'Xırda buynuzlular', 0, '', '', '', '', '', 'a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";}', 'logo/id8ecz3ddi1451162509.jpg'),
(54, 2, 0, 'İnək südü', 0, '', '', '', 'cins', 'amount', 'a:2:{i:0;s:0:\"\";i:1;s:1:\"2\";}', 'logo/idv49pz3o51451166697.png'),
(55, 1, 0, 'İnək naxırı', 0, '', '', '', '', '', '', 'logo/idb6k5f4441451166797.jpg'),
(56, 1, 0, 'Camış naxırı', 0, '', '', '', '', '', '', 'logo/idj3hlfnpm1451166885.jpg'),
(57, 1, 0, 'Atlar', 0, '', '', '', '', '', '', 'logo/id25vokslr1451166963.jpg'),
(58, 1, 0, 'Dəvə', 0, '', '', '', '', '', '', 'logo/id42ijkz161451167031.jpg'),
(59, 1, 0, 'Donuz', 0, '', '', '', '', '', '', 'logo/idgkcas27f1451167272.jpg'),
(75, 2, 0, 'Camış südü', 0, '', '', '', '', 'amount', 'a:2:{i:0;s:0:\"\";i:1;s:1:\"2\";}', 'logo/idknvujge11451167966.jpeg'),
(76, 2, 0, 'Qoyun südü', 0, '', '', '', '', '', 'a:2:{i:0;s:0:\"\";i:1;s:1:\"2\";}', 'logo/idys593pwl1451168047.jpg'),
(78, 2, 0, 'Keçi südü', 0, '', '', '', '', '', '', 'logo/idaggqn70k1451168158.jpg'),
(79, 2, 0, 'Ət', 0, '', '', '', '', '', '', 'logo/idud16jkh31451168215.jpg'),
(80, 2, 0, 'Yun', 0, '', '', '', '', '', '', 'logo/idd4mpthk11451168379.jpg'),
(81, 2, 0, 'Pendir', 0, '', '', '', '', '', '', 'logo/id46zknv5e1451168492.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `subcategory2`
--

CREATE TABLE `subcategory2` (
  `id` int(11) NOT NULL,
  `sid` int(6) NOT NULL,
  `ssid` int(6) NOT NULL,
  `state` int(5) NOT NULL,
  `name` varchar(250) NOT NULL,
  `qeyd` varchar(600) NOT NULL,
  `fatty` tinytext NOT NULL,
  `age` tinytext NOT NULL,
  `diri` tinytext NOT NULL,
  `cins` tinytext NOT NULL,
  `amount` tinytext NOT NULL,
  `pro` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subcategory2`
--

INSERT INTO `subcategory2` (`id`, `sid`, `ssid`, `state`, `name`, `qeyd`, `fatty`, `age`, `diri`, `cins`, `amount`, `pro`) VALUES
(3, 1, 50, 0, 'Erkək toğlu', '', 'fatty', 'age', 'diri', '', '', 'a:1:{i:0;s:1:\"1\";}'),
(4, 1, 50, 0, 'Dişi quzu', '', 'fatty', '', 'diri', 'cins', '', ''),
(5, 1, 50, 0, 'Dişi toğlu', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(6, 1, 50, 0, 'Ana qoyun', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";}'),
(7, 1, 50, 0, ' Şişək', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(8, 1, 50, 0, 'Törədici qoç', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}'),
(9, 1, 50, 0, 'Erkək quzu', '', 'fatty', '', 'diri', '', '', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}'),
(10, 1, 50, 0, 'Törədici təkə', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(11, 1, 50, 0, 'Ana keçi', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}'),
(12, 1, 50, 0, 'Küyər', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}'),
(13, 1, 50, 0, 'Dişi oğlaq', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(14, 1, 55, 0, 'Törədici buğa', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(15, 1, 55, 0, 'Düyə', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(16, 1, 55, 0, 'Erkək dana', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(17, 1, 55, 0, 'Dişi buzov', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(18, 1, 55, 0, 'Cöngə', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(19, 1, 55, 0, 'Dişi dana', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(20, 1, 55, 0, 'İnək', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}'),
(21, 1, 55, 0, 'Erkək buzov', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(22, 1, 56, 0, 'Törədici kəl', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(23, 1, 56, 0, 'Ana camış', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}'),
(24, 1, 56, 0, 'Camış düyəsi', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(25, 1, 56, 0, 'Erkək kəlçə', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(26, 1, 56, 0, 'Dişi balaq', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(27, 1, 56, 0, 'Erkək balaq', '', 'fatty', 'age', 'diri', 'cins', 'amount', 'a:1:{i:0;s:1:\"1\";}'),
(28, 1, 57, 0, 'Ayğır', '', '', 'age', '', 'cins', '', ''),
(29, 1, 57, 0, 'Madyan', '', '', 'age', '', 'cins', '', ''),
(30, 1, 57, 0, 'Dişi dayça', '', '', 'age', '', 'cins', '', ''),
(31, 1, 57, 0, 'Qatır ', '', '', 'age', '', 'cins', '', ''),
(32, 1, 57, 0, 'Eşşək', '', '', 'age', '', 'cins', '', ''),
(33, 1, 57, 0, 'Erkək dayça', '', '', 'age', '', 'cins', '', ''),
(34, 1, 58, 0, 'Nər', '', '', 'age', 'diri', 'cins', '', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}'),
(35, 1, 58, 0, 'Maya', '', '', 'age', 'diri', 'cins', '', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}'),
(36, 1, 58, 0, 'Dişi köşək', '', '', 'age', 'diri', 'cins', '', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}'),
(37, 1, 58, 0, 'Erkək köşək', '', '', 'age', 'diri', 'cins', '', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"3\";}'),
(38, 0, 0, 0, '', '', '', '', '', '', '', ''),
(39, 2, 79, 0, 'İribuynuzlu heyvan əti', '', '', '', '', '', 'amount', ''),
(40, 2, 79, 0, 'Quş əti', '', '', '', '', '', 'amount', ''),
(41, 2, 79, 0, 'Donuz əti', '', '', '', '', '', 'amount', ''),
(42, 2, 79, 0, 'Yumurta', '', '', '', '', '', 'amount', ''),
(43, 2, 80, 0, 'Zərif', '', '', '', '', '', 'amount', ''),
(44, 2, 80, 0, 'Yarımzərif', '', '', '', '', '', 'amount', ''),
(45, 2, 80, 0, 'Qaba', '', '', '', '', '', 'amount', ''),
(46, 2, 81, 0, 'İnək pendiri', '', '', '', '', '', 'amount', ''),
(47, 2, 81, 0, 'Qoyun pendiri', '', '', '', '', '', 'amount', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `login` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'admin',
  `password` char(120) NOT NULL,
  `is_active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `email`, `role`, `password`, `is_active`) VALUES
(1, 'admin', 'admin@admin.com', 'admin', '96f36f77e57c959a969c4d78b12b0fe0', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `vahid`
--

CREATE TABLE `vahid` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `vahid`
--

INSERT INTO `vahid` (`id`, `name`) VALUES
(1, 'Kq'),
(2, 'ədəd'),
(3, 'baş');

-- --------------------------------------------------------

--
-- Структура таблицы `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `voted_on` datetime NOT NULL,
  `ip` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `votes`
--

INSERT INTO `votes` (`id`, `option_id`, `voted_on`, `ip`) VALUES
(1, 1, '2015-12-28 14:44:44', '127.0.0.1'),
(2, 2, '2016-01-04 11:29:47', '127.0.0.1'),
(3, 1, '2016-01-27 17:44:00', '127.0.0.1'),
(4, 2, '2016-03-15 17:36:23', '127.0.0.1'),
(5, 1, '2016-04-04 01:22:02', '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `w3bdeveloper_media`
--

CREATE TABLE `w3bdeveloper_media` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `thumbnailPath` text NOT NULL,
  `fileName` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `w3bdeveloper_media`
--

INSERT INTO `w3bdeveloper_media` (`id`, `type`, `path`, `thumbnailPath`, `fileName`, `date`) VALUES
(8, 'image', 'media_files/Desert.jpg', 'media_files/Desert.jpg', 'Desert.jpg', '2015-12-12 12:06:59'),
(9, 'image', 'media_files/logo.jpg', 'media_files/logo.jpg', 'logo.jpg', '2015-12-12 12:13:13'),
(11, 'image', 'media_files/logo.jpg', 'media_files/logo.jpg', 'logo.jpg', '2015-12-12 12:43:09'),
(12, 'image', 'media_files/Chrysanthemum.jpg', 'media_files/Chrysanthemum.jpg', 'Chrysanthemum.jpg', '2015-12-12 12:48:00'),
(13, 'image', 'media_files/Hydrangeas.jpg', 'media_files/Hydrangeas.jpg', 'Hydrangeas.jpg', '2015-12-12 12:48:04'),
(14, 'image', 'media_files/Lighthouse.jpg', 'media_files/Lighthouse.jpg', 'Lighthouse.jpg', '2015-12-12 12:48:07'),
(15, 'image', 'media_files/Penguins.jpg', 'media_files/Penguins.jpg', 'Penguins.jpg', '2015-12-12 12:48:11'),
(16, 'image', 'media_files/Tulips.jpg', 'media_files/Tulips.jpg', 'Tulips.jpg', '2015-12-12 12:48:14'),
(17, 'image', 'media_files/Desert.jpg', 'media_files/Desert.jpg', 'Desert.jpg', '2015-12-12 12:48:18'),
(18, 'image', 'media_files/Chrysanthemum.jpg', 'media_files/Chrysanthemum.jpg', 'Chrysanthemum.jpg', '2015-12-12 12:48:25'),
(19, 'image', 'media_files/Jellyfish.jpg', 'media_files/Jellyfish.jpg', 'Jellyfish.jpg', '2015-12-12 12:48:32'),
(20, 'image', 'media_files/Lighthouse.jpg', 'media_files/Lighthouse.jpg', 'Lighthouse.jpg', '2015-12-12 12:49:03'),
(21, 'image', 'media_files/1449643514_meyv-trvz-3.jpg', 'media_files/1449643514_meyv-trvz-3.jpg', '1449643514_meyv-trvz-3.jpg', '2015-12-14 05:51:59'),
(22, 'image', 'media_files/07._Camel_Profile,_near_Silverton,_NSW,_07.07.2007.jpg', 'media_files/07._Camel_Profile,_near_Silverton,_NSW,_07.07.2007.jpg', '07._Camel_Profile,_near_Silverton,_NSW,_07.07.2007.jpg', '2016-02-03 06:22:59'),
(23, 'image', 'media_files/belgmilksheep2.jpg', 'media_files/belgmilksheep2.jpg', 'belgmilksheep2.jpg', '2016-02-03 06:24:37'),
(24, 'image', 'media_files/????????? ?????.jpg', 'media_files/????????? ?????.jpg', '????????? ?????.jpg', '2016-02-03 06:25:23'),
(25, 'image', 'media_files/wool-gathering-18-blog.jpg', 'media_files/wool-gathering-18-blog.jpg', 'wool-gathering-18-blog.jpg', '2016-02-03 06:26:29');

-- --------------------------------------------------------

--
-- Структура для представления `common`
--
DROP TABLE IF EXISTS `common`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `common`  AS  select `elan`.`id` AS `elan_ad`,`elan`.`name` AS `elan_name`,`elan`.`qeyd` AS `elan_mezmun`,`elan`.`tarix` AS `elan_tarix`,`elan`.`price` AS `price`,`elan`.`active` AS `active`,`elan`.`amount` AS `amount`,`vahid`.`name` AS `vahid`,`elan`.`diri` AS `diri`,`elan`.`fatty` AS `fatty`,`elan`.`cins` AS `cins`,`elan`.`age` AS `age`,`elan`.`source` AS `source`,`elan`.`deliver` AS `deliver`,`elan`.`baxis` AS `baxis`,`category`.`id` AS `cat_id`,`category`.`name` AS `cat_name`,`subcategory`.`id` AS `subcat_id`,`subcategory`.`name` AS `subcat_name`,`pro`.`name` AS `pro`,`qeydiyyat`.`company` AS `person`,`qeydiyyat`.`name` AS `name`,`qeydiyyat`.`sname` AS `sname`,`qeydiyyat`.`fname` AS `fname`,`qeydiyyat`.`email` AS `email`,`qeydiyyat`.`phone` AS `phone`,min(`pic`.`id`) AS `pic_id`,(case when isnull(`pic`.`name`) then 'yoxdur.jpg' else `pic`.`name` end) AS `picname`,(case when isnull(`pic`.`large_name`) then 'yoxdur.jpg' else `pic`.`large_name` end) AS `pic_largename` from ((((((`elan` left join `category` on((`elan`.`cid` = `category`.`id`))) left join `subcategory` on((`elan`.`sid` = `subcategory`.`id`))) left join `pic` on((`pic`.`eid` = `elan`.`id`))) left join `pro` on((`pro`.`id` = `elan`.`pro`))) left join `vahid` on((`vahid`.`id` = `elan`.`vahid`))) left join `qeydiyyat` on((`qeydiyyat`.`id` = `elan`.`person`))) group by `elan`.`id` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `elan`
--
ALTER TABLE `elan`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hidden`
--
ALTER TABLE `hidden`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `leftmenu`
--
ALTER TABLE `leftmenu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `main`
--
ALTER TABLE `main`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `main_menu`
--
ALTER TABLE `main_menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pic`
--
ALTER TABLE `pic`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pro`
--
ALTER TABLE `pro`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `qeydiyyat`
--
ALTER TABLE `qeydiyyat`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subcategory2`
--
ALTER TABLE `subcategory2`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `vahid`
--
ALTER TABLE `vahid`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `w3bdeveloper_media`
--
ALTER TABLE `w3bdeveloper_media`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `elan`
--
ALTER TABLE `elan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `hidden`
--
ALTER TABLE `hidden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `leftmenu`
--
ALTER TABLE `leftmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `main`
--
ALTER TABLE `main`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `main_menu`
--
ALTER TABLE `main_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `pic`
--
ALTER TABLE `pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT для таблицы `pro`
--
ALTER TABLE `pro`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `qeydiyyat`
--
ALTER TABLE `qeydiyyat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT для таблицы `subcategory2`
--
ALTER TABLE `subcategory2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `vahid`
--
ALTER TABLE `vahid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `w3bdeveloper_media`
--
ALTER TABLE `w3bdeveloper_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
