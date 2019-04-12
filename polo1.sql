-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 16 2018 г., 05:47
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
-- База данных: `polo1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admins`
--

CREATE TABLE `admins` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `login` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'admin',
  `password` char(120) NOT NULL,
  `is_active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admins`
--

INSERT INTO `admins` (`id`, `login`, `email`, `role`, `password`, `is_active`) VALUES
(1, 'admin', 'admin@admin.com', 'admin', '96f36f77e57c959a969c4d78b12b0fe0', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `name_en` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `content_category`
--

CREATE TABLE `content_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `content_category`
--

INSERT INTO `content_category` (`id`, `name`, `name_en`) VALUES
(1, 'Ustmenu', '');

-- --------------------------------------------------------

--
-- Структура таблицы `content_material`
--

CREATE TABLE `content_material` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `name_en` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `content_material`
--

INSERT INTO `content_material` (`id`, `name`, `content`, `name_en`) VALUES
(1, 'Ana səhifə', 'sliderR() newsGenerator()', 'salamlar'),
(2, 'Haqqimizda', '<div class=\"container\">\r\n                <div class=\"row  m-b-50\">\r\n                    <div class=\"col-md-3\">\r\n                        <div class=\"heading heading text-left\">\r\n                            <h2>ABOUT ME</h2>\r\n\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"col-md-9\">\r\n                        <div class=\"row\">\r\n                            <div class=\"col-md-6\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sagittis, sem quis lacinia faucibus,\r\n                                orci ipsum gravida tortor, vel interdum mi sapien ut justo. Nulla varius consequat magna,\r\n                                id molestie ipsum volutpat quis. Suspendisse consectetur fringilla luctus. Fusce id mi diam,\r\n                                non ornare orci. Pellentesque ipsum erat,\r\n                                <br>\r\n                                <br> facilisis ut venenatis eu, sodales vel dolor. Lorem ipsum dolor sit amet, consectetur adipiscing\r\n                                elit. Morbi sagittis, sem quis lacinia faucibus, orci ipsum gravida tortor, vel interdum\r\n                                mi sapien ut justo. Nulla varius consequat magna, id molestie ipsum volutpat quis. Suspendisse\r\n                                consectetur fringilla luctus. Fusce id mi diam, non ornare orci. Pellentesque ipsum erat,\r\n                                facilisis ut venenatis eu, sodales vel dolor. </div>\r\n\r\n                            <div class=\"col-md-6\">Pellentesque ipsum erat, facilisis ut venenatis eu, sodales vel dolor. Lorem ipsum dolor sit\r\n                                amet, consectetur adipiscing elit. Morbi sagittis, sem quis lacinia faucibus, orci ipsum\r\n                                gravida tortor, vel interdum mi sapien ut justo. Nulla varius consequat magna, id molestie\r\n                                ipsum volutpat quis. Suspendisse consectetur fringilla luctus. Fusce id mi diam, non ornare\r\n                                orci. Pellentesque ipsum erat, facilisis ut venenatis eu, sodales vel dolor. Pellentesque\r\n                                ipsum erat, facilisis ut venenatis eu, sodales vel dolor.\r\n                                <br>\r\n                                <br>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sagittis, sem quis lacinia\r\n                                faucibus, orci ipsum gravida tortor, vel interdum mi sapien ut justo. Nulla varius consequat\r\n                                magna, id molestie ipsum volut.</div>\r\n                        </div>\r\n                    </div>\r\n\r\n                </div>\r\n                <div class=\"row\">\r\n                    <div class=\"col-md-3\">\r\n                        <div class=\"heading heading text-left m-b-20\">\r\n                            <h2>My Skills</h2>\r\n\r\n                        </div>Lorem ipsum dolor sit ametusp endisse consectetur fringilla luctus. Fusce id mi diam, non ornare\r\n                        orci. Pellentesque ipsum erat,\r\n                    </div>\r\n                    <div class=\"col-md-9\">\r\n                        <div class=\"m-t-60\">\r\n                            <div class=\"progress-bar-container title-up small extra-small color\">\r\n                                <div class=\"progress-bar progress-animated\" data-percent=\"100\" data-delay=\"100\" data-type=\"%\" style=\"width: 100%;\">\r\n                                    <div class=\"progress-title\">HTML5</div>\r\n                                <span class=\"progress-type\">%</span><span class=\"progress-number animated fadeIn\">100</span></div>\r\n                            </div>\r\n\r\n                            <div class=\"progress-bar-container title-up small extra-small color\">\r\n                                <div class=\"progress-bar progress-animated\" data-percent=\"94\" data-delay=\"200\" data-type=\"%\" style=\"width: 94%;\">\r\n                                    <div class=\"progress-title\">CSS3</div>\r\n                                <span class=\"progress-type\">%</span><span class=\"progress-number animated fadeIn\">94</span></div>\r\n                            </div>\r\n\r\n                            <div class=\"progress-bar-container title-up small extra-small color\">\r\n                                <div class=\"progress-bar progress-animated\" data-percent=\"78\" data-delay=\"300\" data-type=\"%\" style=\"width: 78%;\">\r\n                                    <div class=\"progress-title\">JQUERY</div>\r\n                                <span class=\"progress-type\">%</span><span class=\"progress-number animated fadeIn\">78</span></div>\r\n                            </div>\r\n\r\n                            <div class=\"progress-bar-container title-up small extra-small color\">\r\n                                <div class=\"progress-bar progress-animated\" data-percent=\"65\" data-delay=\"400\" data-type=\"%\" style=\"width: 65%;\">\r\n                                    <div class=\"progress-title\">MYSQL</div>\r\n                                <span class=\"progress-type\">%</span><span class=\"progress-number animated fadeIn\">65</span></div>\r\n                            </div>\r\n                        </div>\r\n\r\n\r\n                    </div>\r\n\r\n                </div>\r\n            </div>', ''),
(3, 'vacancy_inner', '   <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor\r\n                            porta feugiat. Fusce at velit id ligula pharetra laoreet. Ut nec metus a mi ullamcorper\r\n                            hendrerit. Nulla facilisi. Pellentesque sed nibh a quam accumsan dignissim quis quis\r\n                            urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id dolor dui,\r\n                            dapibus gravida elit. Donec consequat laoreet sagittis. Suspendisse ultricies ultrices\r\n                            viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum convallis metus.M</p>\r\n                        <blockquote>\r\n                            <p>The world is a dangerous place to live; not because of the people who are evil, but because\r\n                                of the people who dont do anything about it.</p>\r\n                            <small>by\r\n                                <cite>Albert Einstein</cite>\r\n                            </small>\r\n                        </blockquote>', '');

-- --------------------------------------------------------

--
-- Структура таблицы `departaments`
--

CREATE TABLE `departaments` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `departaments`
--

INSERT INTO `departaments` (`id`, `name`, `note`) VALUES
(1, 'HR', ''),
(2, 'IT', '');

-- --------------------------------------------------------

--
-- Структура таблицы `editors`
--

CREATE TABLE `editors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `editors`
--

INSERT INTO `editors` (`id`, `name`, `note`) VALUES
(1, 'Memmed Memmedov', ''),
(2, 'Ehmed Aliyev', '');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `text` varchar(300) NOT NULL,
  `qeyd` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `name`, `text`, `qeyd`) VALUES
(4, 'uploads/gallery/woman2.jpg', 'sfsfsdfsdfsf', ''),
(5, 'uploads/gallery/deskbg.jpg', 'sfsfsdfsdfsf', ''),
(6, 'uploads/gallery/discover1_detail-1.jpg', 'sfsfsdfsdfsf', '');

-- --------------------------------------------------------

--
-- Структура таблицы `labels`
--

CREATE TABLE `labels` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `labels`
--

INSERT INTO `labels` (`id`, `name`) VALUES
(1, 'contents'),
(2, 'news'),
(3, 'vacancies');

-- --------------------------------------------------------

--
-- Структура таблицы `main_menu`
--

CREATE TABLE `main_menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(10) NOT NULL,
  `menu_name` varchar(200) NOT NULL,
  `menu_name_en` varchar(200) NOT NULL,
  `label` varchar(50) NOT NULL,
  `main` varchar(10) NOT NULL,
  `fid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `main_menu`
--

INSERT INTO `main_menu` (`id`, `parent_id`, `menu_name`, `menu_name_en`, `label`, `main`, `fid`) VALUES
(1, 0, 'Ana sehife', '', 'contents', 'index', 1),
(2, 0, 'Haqqimizda', '', 'contents', '', 2),
(3, 0, 'Xəbərlər', '', 'news', '', 1),
(4, 0, 'Vakansiyalar', '', 'vacancies', '', 0),
(5, 0, 'Əlaqə', '', 'contacts', '', 0),
(6, 0, 'Məhsullar', '', 'shops', '', 0),
(7, 3, 'Siyasi', '', 'news', '', 2),
(8, 3, 'İqtisadi', '', 'news', '', 3),
(9, 3, 'Eylence', 'Entartainment', 'news', '', 4),
(10, 0, 'Daxil ol', 'Login', 'login', '', 0),
(12, 3, 'Novbeti', '', '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `news_category_id` int(10) NOT NULL,
  `news_image` varchar(300) NOT NULL,
  `title` varchar(200) NOT NULL,
  `title_en` varchar(300) NOT NULL,
  `short_name` varchar(300) NOT NULL,
  `short_name_en` varchar(300) NOT NULL,
  `name` text NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `editor_id` int(10) NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `news_category_id`, `news_image`, `title`, `title_en`, `short_name`, `short_name_en`, `name`, `name_en`, `editor_id`, `view_count`, `created_at`, `updated_at`) VALUES
(1, 2, 'idqjz7v57l1518735058.jpg', 'Azərbaycan Premyer Liqasında XV tura yekun vurulub. ', '', 'Azərbaycan Premyer Liqasında XV tura yekun vurulub. Oxu.Az-ın xəbərinə görə, “Keşlə” doğma meydanda debütant “Səbail”i qəbul edib.', '', '<p>\r\n	Azərbaycan Premyer Liqasında XV tura yekun vurulub. Oxu.Az-ın xəbərinə g&ouml;rə, &ldquo;Keşlə&rdquo; doğma meydanda deb&uuml;tant &ldquo;Səbail&rdquo;i qəbul edib. Qarşılaşma 1:1 hesablı bərabərliklə yekunlaşıb. 34-c&uuml; dəqiqədə Fəhmin Muradbəyli qonaqları hesabda irəli &ccedil;ıxarıb. Mat&ccedil;ın 55-ci dəqiqəsində isə Pərdis Fərcad-Azad meydan sahiblərinin bərabərlik qolunu vurub.</p>\r\n', '', 1, 1, '2018-02-15 20:32:24', '2018-02-15 23:32:24'),
(2, 3, 'idatlfm3ze1518735353.png', 'Putin təyyarə qəzası ilə bağlı xüsusi göstəriş verdi', '', 'Rusiya prezidenti Vladimir Putin An-148 təyyarəsinin qəzaya uğrama səbəblərini araşdırmağı tapşırıb. Oxu.Az-ın RİA ', '', '<p>\r\n	Rusiya prezidenti Vladimir Putin An-148 təyyarəsinin qəzaya uğrama səbəblərini araşdırmağı tapşırıb. Oxu.Az-ın RİA Novosti-yə istinadən məlumatına g&ouml;rə, bu barədə Rusiya d&ouml;vlət baş&ccedil;ısının mətbuat katibi Dmitri Peskov deyib. Prezident h&ouml;kumətə x&uuml;susi komissiya yaratmağı tapşırıb. M&uuml;vafiq qurumlara da axtarış tədbirləri ilə bağlı g&ouml;stərişlər verilib. Xatırladaq ki, bu g&uuml;n yerli vaxtla saat 14.21 radələrində Moskvanın &ldquo;Domodedovo&rdquo; hava limanından qalxan və Orska u&ccedil;an təyyarə u&ccedil;uşdan 2 dəqiqə sonra radardan itib. G&ouml;yərtəsində 65 sərnişin və 6 heyət &uuml;zv&uuml; olan təyyarənin qalıqları Moskva ətrafında Ramensk rayonunun Stepanovsk kəndi ərazisində aşkarlanıb. Rusiya F&ouml;vqəladə Hallar Nazirliyi sərnişin və heyət &uuml;zvlərinin qəza nəticəsində həyatlarını itirdiyini a&ccedil;ıqlayıb.</p>\r\n', '', 2, 1, '2018-02-15 20:30:37', '2018-02-15 23:30:37'),
(5, 4, 'idm9bkkqqe1518737335.jpg', 'Azərbaycan Premyer Liqasında XV tura yekun vurulub', '', ' “Keşlə” doğma meydanda debütant “Səbail”i qəbul edib.Qarşılaşma 1:1 hesablı bərabərliklə yekunlaşıb. 34-cü dəqiqədə Fəhmin M', '', '<p>\r\n	Azərbaycan Premyer Liqasında XV tura yekun vurulub. Oxu.Az-ın xəbərinə g&ouml;rə, &ldquo;Keşlə&rdquo; doğma meydanda deb&uuml;tant &ldquo;Səbail&rdquo;i qəbul edib. Qarşılaşma 1:1 hesablı bərabərliklə yekunlaşıb. 34-c&uuml; dəqiqədə Fəhmin Muradbəyli qonaqları hesabda irəli &ccedil;ıxarıb. Mat&ccedil;ın 55-ci dəqiqəsində isə Pərdis Fərcad-Azad meydan sahiblərinin bərabərlik qolunu vurub.</p>\r\n', '', 1, 1, '2018-02-15 20:33:03', '2018-02-15 23:33:03'),
(16, 4, 'idtiftpj071518735683.jpg', 'Türkiyə PKK ilə mübarizədə müttəfiqlərdən daha çox dəstək gözləyir', '', 'Türkiyə PKK, PYD/YPG terror qruplaşmaları ilə mübarizədə müttəfiqlərdən daha çox dəstək gözləyir.\r\n\r\nOxu.Az Anadolu agentliyinə istinadən xəbər verir ki, bunu Berlində rəsmi səfərdə olan Türkiyənin baş naziri Binəli Yıldırım bildirib.', '', '<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	T&uuml;rkiyə PKK, PYD/YPG terror qruplaşmaları ilə m&uuml;barizədə m&uuml;ttəfiqlərdən daha &ccedil;ox dəstək g&ouml;zləyir.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	<strong>Oxu.Az</strong>&nbsp;Anadolu agentliyinə istinadən xəbər verir ki, bunu Berlində rəsmi səfərdə olan T&uuml;rkiyənin baş naziri&nbsp;<strong>Binəli Yıldırım</strong>&nbsp;bildirib.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	&ldquo;YPG və PYD PKK-nın Suriyadakı qollarıdır. Bunu Britaniya və ABŞ x&uuml;susi xidmət qurumları da etiraf edir. Bu cinayətkar təşkilatın məqsədi b&ouml;lgədə gərginlik və yeni m&uuml;naqişə ocaqları yaratmaqdır. Ankara PKK ilə m&uuml;barizədə m&uuml;ttəfiqlərdən daha &ccedil;ox dəstək g&ouml;zləyir&rdquo;, - deyə baş nazir qeyd edib.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	Qeyd edək ki, yanvarın 21-dən T&uuml;rkiyə Baş Qərargahı Afrin b&ouml;lgəsində &ldquo;Zeytun budağı&rdquo; əməliyyatı başladığını, hərbi əməliyyatda məqsədin b&ouml;lgənin PKK terror təşkilatının Suriya qolu PYD/YPG, İŞİD və digər terror təşkilatlarından təmizləmək olduğunu bəyan edib. Bir g&uuml;n sonra isə T&uuml;rkiyə ordusu Suriyanın Afrin b&ouml;lgəsində quru əməliyyatına başlayıb.</p>\r\n', '', 2, 1, '2018-02-15 20:04:54', '2018-02-15 23:04:54'),
(17, 2, 'iduk8bll2l1518736533.jpg', 'ABŞ dövlət katibinin Ərdoğanla görüşü 3 saatdan artıq çəkib – FOTO + YENİLƏNİB', '', 'Anakarada  ABŞ dövlət katibi Reks Tillerson və Türkiyə prezidenti Rəcəb Tayyib Ərdoğan arasında görüş baş açatıb.\r\nOxu.Az Anadolu agentliyinə istinadən xəbər verir ki, 3 saat 15 dəqiqə davam edib.', '', '<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	Anakarada&nbsp; ABŞ d&ouml;vlət katibi Reks Tillerson və T&uuml;rkiyə prezidenti Rəcəb Tayyib Ərdoğan arasında g&ouml;r&uuml;ş baş a&ccedil;atıb.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	<strong>Oxu.Az</strong>&nbsp;Anadolu agentliyinə istinadən xəbər verir ki, 3 saat 15 dəqiqə davam edib.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	Əlavə məlumat hələlik verilmir.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	Səhər saatlarında isə Reks Tillersonun&nbsp;M&ouml;vlud &Ccedil;avuşoğlu ilə g&ouml;r&uuml;ş&uuml; nəzərdə tutulub.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	G&ouml;r&uuml;şdən sonra gər iki XİN rəhbəri birgə mətbuat qarşısına &ccedil;ıxacaqlar.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	&nbsp;</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	&nbsp;</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	<strong>15.02.2018 (21:31)</strong></p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	Anakarada səfərdə olan ABŞ d&ouml;vlət katibi&nbsp;<strong>Reks Tillerson&nbsp;</strong>və T&uuml;rkiyə prezidenti&nbsp;<strong>Rəcəb Tayyib Ərdoğan&nbsp;</strong>arasında g&ouml;r&uuml;ş olub.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	<strong>Oxu.Az&nbsp;</strong>xəbər verir ki, g&ouml;r&uuml;ş jurnalistlər &uuml;&ccedil;&uuml;n qapalı olub.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	Reks Tillersonun həm&ccedil;inin xarici işlər naziri M&ouml;vlud &Ccedil;avuşoğlu ilə g&ouml;r&uuml;ş&uuml; nəzərdə tutulub.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	G&ouml;r&uuml;şlərdə T&uuml;rkiyənin Afrində həyata ke&ccedil;irdiyi əməliyyatlar, Suriyada vəziyyət və ikitərəfli əlaqələrdə yaranmış problemlər m&uuml;zakirə olunacağı bildirilmişdi.</p>\r\n', '', 1, 1, '2018-02-15 20:15:33', '2018-02-15 23:15:33'),
(18, 3, 'iddh3tugl81518737718.jpg', 'İlin ilk Günəş tutulması baş verir – VİDEO', '', 'Bu ilin ilk Günəş tutulması bu gün Bakı vaxtı ilə saat 22:55-də başlayıb və 02:47-dək davam edəcək.\r\n\r\nOxu.Az-ın xarici mətbuata istinadən xəbər verir ki, təbiət hadisəsi Sakit və Atlantik okeanın hövzələrini,  əhatə edəcək. hövzələrini,  \r\n əhatə edəcək.\r\n', '', '<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	<strong>Oxu.Az</strong>-ın xarici mətbuata istinadən xəbər verir ki, təbiət hadisəsi Sakit və Atlantik okeanın h&ouml;vzələrini, həm&ccedil;inin Cənubi Amerikanın cənub hissəsini və Antarktidanı əhatə edəcək.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	&Uuml;mumiyyətlə isə 2018-ci ildə 3 G&uuml;nəş tutulması (qismən tutulma) baş verəcəyi bildirilir. Həmin tutulmalardan ikisi cənub, biri isə şimal yarımk&uuml;rəsinə d&uuml;şəcək.</p>\r\n<div style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); font-family: Arial, sans-serif;\">\r\n	<iframe allow=\"autoplay; encrypted-media\" allowfullscreen=\"\" frameborder=\"0\" height=\"404\" src=\"https://www.youtube.com/embed/qyEzsAy4qeU\" style=\"max-width: 100%;\" width=\"590\"></iframe></div>\r\n<div style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); font-family: Arial, sans-serif;\">\r\n	<iframe allow=\"autoplay; encrypted-media\" allowfullscreen=\"\" frameborder=\"0\" height=\"404\" src=\"https://www.youtube.com/embed/RxRjEHL-6cw\" style=\"max-width: 100%;\" width=\"600\"></iframe></div>\r\n', '', 1, 1, '2018-02-15 21:39:13', '2018-02-16 00:39:13'),
(19, 4, 'idr2tzcelu1518738008.jpg', '“Astana” – “Sportinq” oyununda 4 qol – VİDEO', '', 'Avropa Liqasının 1/16 final mərhələsinin ilk oyunu keçirilib.\r\n\r\nOxu.Az-ın məlumatına görə, “Astana” – “Sportinq”-lə qarşılaşıb.\r\n\r\nOyun 1:3 hesabı ilə başa çatıb.\r\n\r\n“Astana” (Qazaxıstan) – “Sportinq” (Portuqaliya) - 1:3\r\n', '', '<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	Avropa Liqasının 1/16 final mərhələsinin ilk oyunu ke&ccedil;irilib.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	<strong>Oxu.Az</strong>-ın məlumatına g&ouml;rə, &ldquo;Astana&rdquo; &ndash; &ldquo;Sportinq&rdquo;-lə qarşılaşıb.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	Oyun 1:3 hesabı ilə başa &ccedil;atıb.</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	&ldquo;Astana&rdquo; (Qazaxıstan) &ndash; &ldquo;Sportinq&rdquo; (Portuqaliya) - 1:3</p>\r\n<p style=\"line-height: 1.6; font-size: 18px; color: rgb(51, 51, 51); margin-top: 5px; margin-bottom: 20px; font-family: Arial, sans-serif;\">\r\n	Qollar: Tomasov, 7 - Fernandez, 47, Martinş, 50, Dumbia, 55.</p>\r\n', '', 1, 1, '2018-02-15 20:40:08', '2018-02-15 23:40:08');

-- --------------------------------------------------------

--
-- Структура таблицы `news_category`
--

CREATE TABLE `news_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news_category`
--

INSERT INTO `news_category` (`id`, `parent_id`, `name`, `name_en`) VALUES
(1, 0, 'Butun xeberler', ''),
(2, 1, 'Siyasi', ''),
(3, 1, 'Iqtisadi', ''),
(4, 1, 'Əyləncə', ''),
(5, 1, 'Test category', '');

-- --------------------------------------------------------

--
-- Структура таблицы `news_comments`
--

CREATE TABLE `news_comments` (
  `id` int(11) NOT NULL,
  `news_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `professions`
--

CREATE TABLE `professions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `professions`
--

INSERT INTO `professions` (`id`, `name`, `name_en`) VALUES
(1, 'Programci', ''),
(2, 'Muhasib', '');

-- --------------------------------------------------------

--
-- Структура таблицы `rel_menu_material`
--

CREATE TABLE `rel_menu_material` (
  `id` int(11) NOT NULL,
  `menu_id` int(10) NOT NULL,
  `category_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rel_menu_material`
--

INSERT INTO `rel_menu_material` (`id`, `menu_id`, `category_id`) VALUES
(1, 7, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `rel_vacancy_requests`
--

CREATE TABLE `rel_vacancy_requests` (
  `id` int(11) NOT NULL,
  `vacancy_id` int(10) NOT NULL,
  `vacancy_request_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'Idman'),
(2, 'Siyaset');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `oauth_provider` enum('','facebook','google','twitter') COLLATE utf8_unicode_ci NOT NULL,
  `oauth_uid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `vacancies`
--

CREATE TABLE `vacancies` (
  `id` int(11) NOT NULL,
  `departament_id` int(10) NOT NULL,
  `profession_id` int(10) NOT NULL,
  `vacancy_details` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `vacancies`
--

INSERT INTO `vacancies` (`id`, `departament_id`, `profession_id`, `vacancy_details`, `created_at`) VALUES
(1, 1, 1, '   <p>Kateqoriya meneceri\r\n \r\nVəzifə öhdəlikləri:\r\nMəhsulun innovativ şəkildə tanıtım strategiyasinin hazırlanması;\r\nBazarın monitorinq və təhlili, rəqabət mühitinin öyrənilməsi;\r\nMT&TT (BTS) üzrə strategiyanin hazırlanması;\r\nSatış komandasının təlimləndirilməsi;\r\nSatış planinin həyata keçirilməsi.\r\nNamizədə olan tələblər:\r\nAli təhsil;\r\nMS Office proqramları biliyi;\r\nMinimum 3 il marketinq sektorunda iş təcrübəsi; FMCG iş təcrübəsi arzuolunandır;\r\nRus dili biliyi mütləqdir; İngilis dili üstünlükdür;\r\nAnalitik və innovativ düşünmə qabiliyyəti.\r\nŞərtlər:\r\n5 iş günü;\r\nİş saatları 08:00-17:00;\r\nNahar şirkət tərəfindən təmin olunur. <blockquote>  metn</p>                             <small>by                                 <cite>Albert Einstein</cit', '2018-02-14 05:26:56'),
(2, 2, 2, '', '2018-02-13 11:12:05');

-- --------------------------------------------------------

--
-- Структура таблицы `vacancy_request`
--

CREATE TABLE `vacancy_request` (
  `id` int(11) NOT NULL,
  `sender_name` varchar(200) NOT NULL,
  `sender_email` varchar(200) NOT NULL,
  `sender_webpage` varchar(200) NOT NULL,
  `sender_comment` varchar(1000) NOT NULL,
  `sender_file` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `vacancy_request`
--

INSERT INTO `vacancy_request` (`id`, `sender_name`, `sender_email`, `sender_webpage`, `sender_comment`, `sender_file`, `created_at`) VALUES
(2, 'Azer', 'az@az.com', 'www.polo.az', '', '', '2018-02-14 06:53:20'),
(3, 'Azer', 'az@az.com', 'www.polo.az', '', '', '2018-02-14 06:54:33'),
(4, 'jjjhh', 'az@az.com', 'www.polo.az', '', '', '2018-02-14 06:55:29'),
(5, 'dsfdsf', 'az@az.com', 'www.polo.az', '', '', '2018-02-14 06:56:54'),
(6, '', '', '', '', '', '2018-02-14 06:58:35'),
(7, '', '', '', '', '', '2018-02-14 07:01:27'),
(8, '', '', '', '', '', '2018-02-14 07:01:59'),
(9, '', '', '', '', '', '2018-02-14 07:05:11'),
(10, '', '', '', '', '', '2018-02-14 07:05:49'),
(11, '', '', '', '', '', '2018-02-14 07:08:32'),
(12, '', '', '', '', '', '2018-02-14 07:15:50'),
(13, '', '', '', '', '', '2018-02-14 07:23:08'),
(14, '', '', '', '', '', '2018-02-14 07:28:10'),
(15, 'kfhjha', 'az@az.com', 'azzaza', '', 'db--.xlsx', '2018-02-14 07:47:02'),
(16, 'MMM', 'a.e.qurbanov@gmail.com', 'dddd', ' fsdajfasfsaf', 'db--.xlsx', '2018-02-14 07:57:23'),
(17, '', '', '', '', '', '2018-02-14 19:48:03');

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
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `content_category`
--
ALTER TABLE `content_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `content_material`
--
ALTER TABLE `content_material`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `departaments`
--
ALTER TABLE `departaments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `editors`
--
ALTER TABLE `editors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `labels`
--
ALTER TABLE `labels`
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
-- Индексы таблицы `news_category`
--
ALTER TABLE `news_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news_comments`
--
ALTER TABLE `news_comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rel_menu_material`
--
ALTER TABLE `rel_menu_material`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rel_vacancy_requests`
--
ALTER TABLE `rel_vacancy_requests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `vacancies`
--
ALTER TABLE `vacancies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `vacancy_request`
--
ALTER TABLE `vacancy_request`
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
-- AUTO_INCREMENT для таблицы `admins`
--
ALTER TABLE `admins`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `content_category`
--
ALTER TABLE `content_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `content_material`
--
ALTER TABLE `content_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `departaments`
--
ALTER TABLE `departaments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `editors`
--
ALTER TABLE `editors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `main_menu`
--
ALTER TABLE `main_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `news_category`
--
ALTER TABLE `news_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `news_comments`
--
ALTER TABLE `news_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `professions`
--
ALTER TABLE `professions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `rel_menu_material`
--
ALTER TABLE `rel_menu_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `rel_vacancy_requests`
--
ALTER TABLE `rel_vacancy_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `vacancies`
--
ALTER TABLE `vacancies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `vacancy_request`
--
ALTER TABLE `vacancy_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `w3bdeveloper_media`
--
ALTER TABLE `w3bdeveloper_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
