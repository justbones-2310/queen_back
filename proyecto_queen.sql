-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-11-2024 a las 01:34:26
-- Versión del servidor: 5.7.40
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_queen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `img_id` varchar(250) DEFAULT NULL,
  `subtitulo` text NOT NULL,
  `cuerpo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `titulo`, `img_id`, `subtitulo`, `cuerpo`) VALUES
(1, 'Death on Two Legs (Dedicated To...)', 'e90furfpbxz6obfehc2h', ' La canción fue escrita por Freddie Mercury y describe su odio hacia el mánager original de Queen, Norman Sheffield, que tiene la fama de haber maltratado la banda y abusado de su papel de mánager entre 1972 y 1975.  ', ' La canción se considera la \"carta de odio\" de Freddie Mercury escrita en forma de ataque directo al mánager original de Queen Norman Sheffield, incorporando una gama de comentarios furiosos, entre insultos y maldiciones, todos puramente groseros y viciosos, y es descrito por Mercury como \"tan vengativa que Brian se sentía mal al cantarla.\" Aunque la canción no hace ninguna referencia directa hacia él, Sheffield se horrorizó cuando escuchó la reproducción de la canción en Trident Studios en el lanzamiento del álbum, y demandó tanto a la banda como a la discográfica por difamación. Todo esto resultó en un acuerdo extrajudicial, revelando así al público su conexión con la canción.\r\n\r\nEn su autobiografía publicada en 2013, Life on Two Legs: Set The Record Straight, Norman Sheffield negó que hubiese maltratado a la banda como mánager, y refiriéndose a las copias de sus contratos originales de 1972 con Queen, incluidos en el libro, para respaldar su defensa. Sheffield murió en 2014.\r\n\r\nDurante los conciertos en vivo Mercury solía dedicar la canción a \"a real motherfucker of a gentleman\". Esta frase se censuró utilizando pitidos en su álbum Live Killers de 1979.\r\n\r\nLa grabación y mezcla fueron realizadas entre agosto y noviembre de 1975: En Sarm East Studios (Londres, Inglaterra, Reino Unido). '),
(2, 'Bohemian Rhapsody', 'mljquqqu1p34v43ksdle', ' La canción, como su nombre sugiere, es una rapsodia musical que consta de seis secciones: introducción, balada, solo de guitarra, ópera, rock y coda o final. ', ' Freddie Mercury escribió la mayor parte de «Bohemian Rhapsody» en su casa de Holland Road, Kensington, al norte de Londres.3​ El productor de la canción, Roy Thomas Baker, relató cómo Mercury tocó la balada introductoria para él: \"Interpretó el comienzo en el piano. Luego se detuvo y dijo \'¡Y aquí es donde empieza la sección de ópera!\' Luego nos fuimos a cenar\".4​5​ El guitarrista Brian May dijo que la banda comentó que el esbozo de Mercury para la canción era \"intrigante y original y digno de trabajarse\".4​ Mucho del material de Queen se escribía en el estudio según May, pero esta canción \"estaba toda en la mente de Freddie\" antes de que se sacara a la luz.3​ La musicóloga Sheila Witeley sugirió que \"el título se basa fuertemente en la ideología del rock contemporáneo, el individualismo del mundo de los artistas bohemios, con lo de \'rapsodia\' afirmando los románticos ideales del rock como arte\".6​ Sobre lo de \"bohemio\", Daniel Michea dijo que \"Mercury intentó [...] [que esta canción] fuera una suerte de ópera, algo fuera de las normas de las canciones de rock y sigue la lógica operística: coros de muchas voces alternados con solos similares a arias, las emociones son excesivas y la trama, confusa\".7​\r\n\r\nLa canción se grabó en tres semanas, empezando en Rockfield Studio 1 el 24 de agosto de 1975, tras un ensayo de tres semanas en Herefordshire.5​ Durante el proceso, se usaron otros cuatro estudios adicionales: Roundhouse, SARM, Scorpion y Wessex.5​ Según los miembros de la banda, Mercury compuso mentalmente la canción y los dirigió él mismo.8​ Usó un piano de cola para conciertos marca Bechstein, que aparece en el video promocional y en las giras por el Reino Unido. Es una de las grabaciones más elaboradas y mejor producidas en toda la historia del rock.5​\r\n\r\nMay, Mercury y Taylor cantaron continuamente de diez a doce horas por día, obteniendo 180 grabaciones separadas.8​ Como los estudios de aquella época solo disponían de cintas analógicas de 24 pistas, fue necesario que los tres se sobre grabaran numerosas veces y reiteraran estas grabaciones en sucesivas submezclas. Al final, terminaron usando cintas de octava generación.5​\r\n\r\nLa grabación se realizo entre enero y julio de 1975  en Estudio Rockfield 1 Roundhouse SARM (este) ScorpionHaines 2005 Wessex '),
(9, 'Salsita', 'eosi3o5qyjr8atxczg80', '   Queen       ', '   Te extrañamos Salsita       ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'Claudia', '81dc9bdb52d04dc20036dbd8313ed055'),
(2, 'Invitado', '674f3c2c1a8a6f90461e8a66fb5550ba');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
