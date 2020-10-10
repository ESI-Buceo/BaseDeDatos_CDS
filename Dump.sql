-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: dbTriage
-- ------------------------------------------------------
-- Server version	5.7.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrativo`
--

DROP TABLE IF EXISTS `administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrativo` (
  `docidentidad` int(11) NOT NULL,
  `ndeempleado` int(11) NOT NULL,
  PRIMARY KEY (`docidentidad`),
  UNIQUE KEY `ndeempleado` (`ndeempleado`),
  CONSTRAINT `administrativo_ibfk_1` FOREIGN KEY (`docidentidad`) REFERENCES `persona` (`docidentidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativo`
--

LOCK TABLES `administrativo` WRITE;
/*!40000 ALTER TABLE `administrativo` DISABLE KEYS */;
INSERT INTO `administrativo` VALUES (11111111,1234),(22222222,2222),(77777777,2587),(33333333,4321),(44444444,6541),(55555555,8426),(66666666,8523),(11111115,11115),(11111114,12314),(19266711,13214),(11111112,13321),(22222229,22256),(99999999,99999),(11111113,111113),(11111118,111118),(11111119,1231466),(88888888,13214564);
/*!40000 ALTER TABLE `administrativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asociados`
--

DROP TABLE IF EXISTS `asociados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asociados` (
  `idPatologia` int(11) NOT NULL,
  `IdSintoma` int(11) NOT NULL,
  PRIMARY KEY (`idPatologia`,`IdSintoma`),
  KEY `IdSintoma` (`IdSintoma`),
  CONSTRAINT `asociados_ibfk_1` FOREIGN KEY (`idPatologia`) REFERENCES `patologia` (`id`),
  CONSTRAINT `asociados_ibfk_2` FOREIGN KEY (`IdSintoma`) REFERENCES `sintoma` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asociados`
--

LOCK TABLES `asociados` WRITE;
/*!40000 ALTER TABLE `asociados` DISABLE KEYS */;
INSERT INTO `asociados` VALUES (4,1),(19,1),(22,1),(24,1),(26,1),(29,1),(37,1),(38,1),(39,1),(3,2),(16,2),(22,2),(24,2),(25,2),(26,2),(30,2),(34,2),(35,2),(36,2),(39,2),(41,2),(2,3),(5,3),(6,3),(16,3),(24,3),(26,3),(38,3),(39,3),(3,4),(4,4),(7,4),(19,4),(25,4),(34,4),(35,4),(39,4),(4,5),(18,5),(24,5),(39,5),(41,5),(20,6),(39,6),(6,8),(36,8),(39,8),(1,9),(2,9),(5,9),(11,9),(39,9),(42,9),(11,11),(15,11),(39,11),(11,12),(20,12),(29,12),(39,12),(5,18),(6,18),(16,18),(30,18),(39,18),(7,19),(22,19),(1,45),(36,45),(15,46),(18,46),(18,47),(42,47),(36,50),(1,53),(29,67),(27,76),(27,77),(27,78),(29,78),(27,79),(29,79),(32,84),(32,86),(33,88),(33,89),(40,94),(40,95);
/*!40000 ALTER TABLE `asociados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docidentidadPaciente` int(11) NOT NULL DEFAULT '0',
  `docidentidadMedico` int(11) NOT NULL DEFAULT '0',
  `idSesion` int(11) NOT NULL,
  `fechaHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emisor` enum('P','M') DEFAULT NULL,
  `mensaje` varchar(80) NOT NULL,
  `leido` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`docidentidadPaciente`,`docidentidadMedico`,`idSesion`),
  KEY `docidentidadPaciente` (`docidentidadPaciente`),
  KEY `docidentidadMedico` (`docidentidadMedico`),
  KEY `idSesion` (`idSesion`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`docidentidadPaciente`) REFERENCES `paciente` (`docidentidad`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`docidentidadMedico`) REFERENCES `medico` (`docidentidad`),
  CONSTRAINT `chat_ibfk_3` FOREIGN KEY (`idSesion`) REFERENCES `sesion` (`idSesion`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,19248371,19266171,161348021,'2020-08-16 20:14:20','M','El medico ha iniciado sesion, aguarda por favor...',1),(2,19248371,19266171,161348021,'2020-08-16 20:14:20','M','Hola buenas tardes',1),(3,19248371,19266171,161348021,'2020-08-16 20:14:28','P','hola doctor',1),(4,19248371,19266171,161348021,'2020-08-16 20:14:40','M','cuanto hace que presenta este cuadro?',1),(5,19248371,19266171,161348021,'2020-08-16 20:14:53','P','desde ayer a la mañana',1),(6,19248371,19266171,161348021,'2020-08-16 20:15:05','M','Ha presentado fiebre',1),(7,19248371,19266171,161348021,'2020-08-16 20:15:18','P','no',1),(8,19248371,19266171,161348021,'2020-08-16 20:15:45','M','bien, algun otro sintoma ',1),(9,19248371,19266171,161348021,'2020-08-16 20:15:53','P','pero el dolor en el pecho me preocupo por eso le consultaba',1),(10,19248371,19266171,161348021,'2020-08-16 20:16:03','P','cansancio fisico',1),(11,19248371,19266171,161348021,'2020-08-16 20:16:09','M','La tos es con catarro?',1),(12,19248371,19266171,161348021,'2020-08-16 20:16:13','P','no',1),(13,19248371,19266171,161348021,'2020-08-16 20:16:18','P','es tos seca',1),(14,19248371,19266171,161348021,'2020-08-16 20:16:45','M','ok, bueno, estamos ante un escenario de gripe',1),(15,19248371,19266171,161348021,'2020-08-16 20:16:55','M','tomese un zolben caliente',1),(16,19248371,19266171,161348021,'2020-08-16 20:16:55','M','y a la cama',1),(17,19248371,19266171,161348021,'2020-08-16 20:17:13','M','si no recupera en 72 hrs. vuelva a contactarnos',1),(18,19248371,19266171,161348021,'2020-08-16 20:17:13','P','okey, ya me tomo uno',1),(19,19248371,19266171,161348021,'2020-08-16 20:17:23','P','muchas gracias',1),(20,19248371,19266171,161348021,'2020-08-16 20:17:30','M','gracias a Usted.',1),(21,19248371,19266171,162251781,'2020-08-16 20:23:26','M','El medico ha iniciado sesion, aguarda por favor...',1),(22,19248371,19266171,162251781,'2020-08-16 20:23:31','M','Hola',1),(23,19248371,19266171,162251781,'2020-08-16 20:23:36','M','Como esta Andrea?',1),(24,19248371,19266171,162251781,'2020-08-16 20:23:36','P','hola doc',1),(25,19248371,19266171,162251781,'2020-08-16 20:23:51','P','con molestia',1),(26,19248371,19266171,162251781,'2020-08-16 20:23:56','M','Cuanto hace que presenta este cuadro?',1),(27,19248371,19266171,162251781,'2020-08-16 20:24:16','P','los estornudos y la picazon en los ojos',1),(28,19248371,19266171,162251781,'2020-08-16 20:24:26','P','y la tos no me deja tranquila',1),(29,19248371,19266171,162251781,'2020-08-16 20:24:36','P','me duele la frente cuando bajo la cabeza',1),(30,19248371,19266171,162251781,'2020-08-16 20:25:46','M','bien, de acuerdo a sus sintomas creo que podemos estar frente a una rinitis,',1),(31,19248371,19266171,162251781,'2020-08-16 20:26:06','M','es aconsejable que visite el policlinico para que le realicen',1),(32,19248371,19266171,162251781,'2020-08-16 20:26:11','M','una revision mas profunda',1),(33,19248371,19266171,162251781,'2020-08-16 20:26:31','P','ah bueno, voy hasta ahi entonces',1),(34,19248371,19266171,162251781,'2020-08-16 20:26:36','P','muchas gracias',1),(35,19248371,19266171,162251781,'2020-08-16 20:26:41','M','Gracias por consulta',1),(36,19248371,19266171,162251781,'2020-08-16 20:26:43','M','y a las ordenes',1),(37,19248371,19266171,162251781,'2020-08-16 20:26:46','P','saludos',1),(38,19248371,19266171,163840577,'2020-08-16 20:38:59','M','El medico ha iniciado sesion, aguarda por favor...',1),(39,19248371,19266171,163840577,'2020-08-16 20:39:04','M','Hola Andra, bienvenida nuevamente',1),(40,19248371,19266171,163840577,'2020-08-16 20:39:10','P','hola doc',1),(41,19248371,19266171,163840577,'2020-08-16 20:39:10','P','como esta?',1),(42,19248371,19266171,163840577,'2020-08-16 20:39:24','M','Los calambres son en las dos manos',1),(43,19248371,19266171,163840577,'2020-08-16 20:39:24','M','?',1),(44,19248371,19266171,163840577,'2020-08-16 20:39:25','P','me siguen los calambres en las manos',1),(45,19248371,19266171,163840577,'2020-08-16 20:39:59','M','y el dolor de huesos, donde es que le duele?',1),(46,19248371,19266171,163840577,'2020-08-16 20:40:05','P','hoy es mas intenso',1),(47,19248371,19266171,163840577,'2020-08-16 20:40:20','P','los brazos y antebrazos',1),(48,19248371,19266171,163840577,'2020-08-16 20:40:39','M','Bien, esta tomando alguna medicacion?',1),(49,19248371,19266171,163840577,'2020-08-16 20:41:05','P','aun no, solo un analgesico para los dolores',1),(50,19248371,19266171,163840577,'2020-08-16 20:41:54','M','Ok, le sugiero pedir pase a un reumatologo a los efectos de que pueda hacer ',1),(51,19248371,19266171,163840577,'2020-08-16 20:41:59','M','una correcta evaluacino',1),(52,19248371,19266171,163840577,'2020-08-16 20:42:04','M','evaluacion de la situacion',1),(53,19248371,19266171,163840577,'2020-08-16 20:42:04','M','no deje estar',1),(54,19248371,19266171,163840577,'2020-08-16 20:42:13','P','bien gracias',1),(55,19248371,19266171,163840577,'2020-08-16 20:42:14','M','ya que esto puede derivar en consecuencias mayores',1),(56,19248371,19266171,163840577,'2020-08-16 20:42:20','P','pido hora para estos dias',1),(57,19248371,19266171,163840577,'2020-08-16 20:42:25','P','gracias por todo',1),(58,19248371,19266171,163840577,'2020-08-16 20:42:29','M','a las ordenes',1),(59,19248371,19266171,185246737,'2020-08-18 16:54:13','M','El medico ha iniciado sesion, aguarda por favor...',0),(60,19248371,19266171,185624937,'2020-08-18 16:56:56','M','El medico ha iniciado sesion, aguarda por favor...',1),(61,19248371,19266171,185624937,'2020-08-18 16:57:03','M','Hola paciente',1),(62,19248371,19266171,180733799,'2020-08-18 17:07:50','M','El medico ha iniciado sesion, aguarda por favor...',1),(63,19248371,19266171,180733799,'2020-08-18 17:08:00','M','Hola doc',1),(64,19248371,19266171,180733799,'2020-08-18 17:08:01','P','Hola pciente',0),(65,19248371,19266171,182050763,'2020-08-18 17:21:33','M','El medico ha iniciado sesion, aguarda por favor...',1),(66,19248371,19266171,182522019,'2020-08-18 17:25:34','M','El medico ha iniciado sesion, aguarda por favor...',1),(67,19248371,19266171,182522019,'2020-08-18 17:25:45','M','Hola paciente',1),(68,19248371,19266171,18274778,'2020-08-18 17:27:59','M','El medico ha iniciado sesion, aguarda por favor...',1),(69,19248371,19266171,18274778,'2020-08-18 17:28:02','M','Hola paciente, buenas tardes',1),(70,19248371,19266171,18274778,'2020-08-18 17:28:08','P','Hola doc',1),(71,19248371,19266171,18274778,'2020-08-18 17:30:58','P','estoy teniendo problemas',1),(72,19248371,19266171,18274778,'2020-08-18 17:31:04','M','Bien, cuenteme',1),(73,19248371,19266171,18274778,'2020-08-18 17:31:23','P','estoy un poco dolorido',1),(74,19248371,19266171,183222711,'2020-08-18 17:32:46','M','El medico ha iniciado sesion, aguarda por favor...',0),(75,19248371,19266171,18403076,'2020-08-18 17:40:52','M','El medico ha iniciado sesion, aguarda por favor...',1),(76,19248371,19266171,18403076,'2020-08-18 17:41:02','M','Hola Andrea, como le va?',1),(77,19248371,19266171,18403076,'2020-08-18 17:41:07','P','Hola doctor',1),(78,19248371,19266171,18403076,'2020-08-18 17:41:17','P','estoy con mucha tos',1),(79,19248371,19266171,18403076,'2020-08-18 17:41:27','P','y ayer vomite muchas veces',1),(80,19248371,19266171,18403076,'2020-08-18 17:41:42','M','bien, cuantos dias hace que esta en estas condiciones?',1),(81,19248371,19266171,18403076,'2020-08-18 17:42:27','P','hace 10 dias',1),(82,19248371,19266171,184258624,'2020-08-18 17:43:04','M','El medico ha iniciado sesion, aguarda por favor...',1),(83,19248371,19266171,184258624,'2020-08-18 17:43:12','M','hola paciente, como se encuentra',1),(84,19248371,19266171,184258624,'2020-08-18 17:43:22','P','Mejor',1),(85,19248371,19266171,184852304,'2020-08-18 17:50:54','M','El medico ha iniciado sesion, aguarda por favor...',1),(86,19248371,19266171,184852304,'2020-08-18 17:50:57','M','Hola paciente',1),(87,19248371,19266171,180012767,'2020-08-18 18:01:05','M','El medico ha iniciado sesion, aguarda por favor...',1),(88,19248371,19266171,180012767,'2020-08-18 18:01:08','M','Hola buenas tardes',1),(89,19248371,19266171,180012767,'2020-08-18 18:01:21','P','buenas tardes doc',1),(90,19248371,19266171,180012767,'2020-08-18 18:01:23','M','Hace cuanto esta con ese cuadro',1),(91,19248371,19266171,180012767,'2020-08-18 18:01:31','P','hace dos dias',1),(92,19248371,19266171,180012767,'2020-08-18 18:01:44','M','bien, que comio?',1),(93,19248371,19266171,180012767,'2020-08-18 18:02:41','P','una casuela de mondongo',1),(94,19248371,19266171,180012767,'2020-08-18 18:02:55','M','y eso le dio tos?',1),(95,19248371,19266171,180012767,'2020-08-18 18:03:16','P','ni idea, por eso le pregunto a usted',1),(96,19248371,19266171,180012767,'2020-08-18 18:03:27','M','tomese un tesito',1),(97,19248371,19266171,180012767,'2020-08-18 18:03:32','M','y en 48 hrs',1),(98,19248371,19266171,180012767,'2020-08-18 18:03:36','M','va a estar mejor',1),(99,19248371,19266171,180012767,'2020-08-18 18:04:01','P','cualquier te?',1),(100,19248371,19266171,180012767,'2020-08-18 18:04:11','P','o algun yuyo en particular?',1),(101,19248371,19266171,180012767,'2020-08-18 18:04:16','P','no se de esas cosas',1),(102,19248371,19266171,181820008,'2020-08-18 18:18:32','M','El medico ha iniciado sesion, aguarda por favor...',1),(103,19248371,19266171,181820008,'2020-08-18 18:18:35','M','hola',1),(104,19248371,19266171,181820008,'2020-08-18 18:18:37','M','buenas tardes',1),(105,19248371,19266171,181820008,'2020-08-18 18:18:54','P','hola como esta?',1),(106,19248371,19266171,181820008,'2020-08-18 18:19:04','P','yo con vomitos desde ayer',1),(107,19248371,19266171,273039649,'2020-08-27 23:30:49','M','El medico ha iniciado sesion, aguarda por favor...',1),(108,19248371,19266171,273039649,'2020-08-27 23:30:52','M','hola',1),(109,19248371,19266171,273039649,'2020-08-27 23:30:58','P','hola',1),(110,19248371,19266171,273653711,'2020-08-27 23:37:59','M','El medico ha iniciado sesion, aguarda por favor...',1),(111,19248371,19266171,273653711,'2020-08-27 23:38:01','M','asdasdas',1),(112,19248371,19266171,273653711,'2020-08-27 23:38:11','P','me duele el alma',1),(113,19248371,19266171,281110842,'2020-08-28 01:41:41','M','El medico ha iniciado sesion, aguarda por favor...',1),(114,19248371,19266171,281110842,'2020-08-28 01:41:42','M','Hola paciente',1),(115,19248371,19266171,281110842,'2020-08-28 01:41:47','P','Hola doc',1),(116,19248371,19266171,282917714,'2020-08-28 01:59:20','M','El medico ha iniciado sesion, aguarda por favor...',1),(117,19248371,19266171,282917714,'2020-08-28 01:59:27','M','Hola paciente',1),(118,19248371,19266171,282917714,'2020-08-28 01:59:37','P','Hola doc',1),(119,19248371,19266171,33151786,'2020-09-03 19:32:07','M','El medico ha iniciado sesion, aguarda por favor...',1),(120,19248371,19266171,33151786,'2020-09-03 19:32:10','M','buenas tardes',1),(121,19248371,19266171,33151786,'2020-09-03 19:32:17','P','Hola doctor Muela',1),(122,19248371,19266171,33151786,'2020-09-03 19:32:19','M','en que lo puedo ayudar',1),(123,19248371,19266171,33151786,'2020-09-03 19:32:37','P','estoy teniendo fiebre',1),(124,19248371,19266171,33151786,'2020-09-03 19:32:42','P','y dolor de cabeza',1),(125,19248371,19266171,33151786,'2020-09-03 19:32:52','P','esto comenzo hace dos dias',1),(126,19248371,19266171,33151786,'2020-09-03 19:33:09','M','seria bueno que pase por la policlinica',1),(127,19248371,19266171,33151786,'2020-09-03 19:33:37','P','bueno gracias',1),(128,19248371,19266171,33151786,'2020-09-03 19:33:38','M','para hacer un test',1),(129,19248371,19266171,33151786,'2020-09-03 19:33:42','P','no lo queria molestar',1),(130,19248371,19266171,33151786,'2020-09-03 19:33:47','P','ah',1),(131,19248371,19266171,33151786,'2020-09-03 19:33:55','M','y descartar Covid',1),(132,19248371,19266171,33151786,'2020-09-03 19:34:07','P','bien, muchas gracias',1),(133,19248371,19266171,33151786,'2020-09-03 19:34:10','P','saludos a la famlia',1),(134,19248371,19266171,33151786,'2020-09-03 19:34:10','M','y hacer chequeo ',1),(135,19248371,19266171,30802296,'2020-09-03 20:08:43','M','El medico ha iniciado sesion, aguarda por favor...',1),(136,19248371,19266171,30802296,'2020-09-03 20:08:43','M','buenas tardes',1),(137,19248371,19266171,30802296,'2020-09-03 20:10:55','P','Hola doc',1),(138,19248371,19266171,30802296,'2020-09-03 20:11:04','P','chau',1),(139,19248371,19266171,30802296,'2020-09-03 20:11:04','M','en que lo puedo ayudar?',0),(140,19248371,19266171,94934374,'2020-09-14 19:26:33','M','El medico ha iniciado sesion, aguarda por favor...',1),(141,19248371,19266171,94934374,'2020-09-14 19:26:33','M','Hola Ana Laura',1),(142,19248371,19266171,141619613,'2020-09-14 19:25:20','M','El medico ha iniciado sesion, aguarda por favor...',1),(143,19248371,19266171,141619613,'2020-09-14 19:25:28','M','hola',1),(144,19248371,19266171,141619613,'2020-09-14 19:26:17','P','hola doc',1),(145,19248371,19266171,143719796,'2020-09-14 19:37:30','M','El medico ha iniciado sesion, aguarda por favor...',1),(146,19248371,19266171,143851003,'2020-09-14 19:39:04','M','El medico ha iniciado sesion, aguarda por favor...',1),(147,19248371,19266171,143851003,'2020-09-14 19:39:31','M','hola',1),(148,19248371,19266171,143851003,'2020-09-14 19:39:35','P','hola doc',1),(149,19248371,19266171,145121494,'2020-09-14 19:51:52','M','El medico ha iniciado sesion, aguarda por favor...',1),(150,19248371,19266171,145309821,'2020-09-14 19:53:22','M','El medico ha iniciado sesion, aguarda por favor...',1),(151,19248371,19266171,145359912,'2020-09-14 19:54:10','M','El medico ha iniciado sesion, aguarda por favor...',1),(152,19248371,19266171,145923084,'2020-09-14 19:59:43','M','El medico ha iniciado sesion, aguarda por favor...',1),(153,19248371,19266171,145923084,'2020-09-14 19:59:51','P','The patient has left the chat',1),(154,19248371,19266171,160147058,'2020-09-16 16:01:58','M','El medico ha iniciado sesion, aguarda por favor...',1),(155,19248371,19266171,160147058,'2020-09-16 16:02:14','M','Hola buenos dias',1),(156,19248371,19266171,160147058,'2020-09-16 16:02:24','P','Hola doctor',1),(157,19248371,19266171,160147058,'2020-09-16 16:02:30','M','Cuentame cuanto hace que presentas estos sintomas',1),(158,19248371,19266171,160147058,'2020-09-16 16:02:39','P','Hace aproximadamente dos dias',1),(159,19248371,19266171,160147058,'2020-09-16 16:02:50','M','Algo fuera de la dieta normal?',1),(160,19248371,19266171,160147058,'2020-09-16 16:03:04','P','No, todo igual, mp he cambiado mi dieta',1),(161,19248371,19266171,160147058,'2020-09-16 16:03:12','M','Bien, has presentado diarrea?',1),(162,19248371,19266171,160147058,'2020-09-16 16:03:21','M','Dolor en el costado?',1),(163,19248371,19266171,160147058,'2020-09-16 16:03:34','P','No doctor, no he presentado ningun otro sintoma',1),(164,19248371,19266171,160147058,'2020-09-16 16:03:38','M','has tomado algo para bajar la fiebre?',1),(165,19248371,19266171,160147058,'2020-09-16 16:03:54','P','Si, he tomado perificar, me baja, pero al rato me vuelve a',1),(166,19248371,19266171,160147058,'2020-09-16 16:03:59','P','subir',1),(167,19248371,19266171,160147058,'2020-09-16 16:04:04','M','Bien,',1),(168,19248371,19266171,160147058,'2020-09-16 16:04:29','M','te sugiero pasar por la policlinica mas cercana a los efectos de poder',1),(169,19248371,19266171,160147058,'2020-09-16 16:04:33','M','hacer una mejor evaluacion',1),(170,19248371,19266171,160147058,'2020-09-16 16:04:49','P','Perfecto doctor, muchas gracias',1),(171,19248371,19266171,160147058,'2020-09-16 16:04:51','M','Estamos a las ordenes',1),(172,19248371,19266171,160147058,'2020-09-16 16:04:59','M','Cualquier cosa vuelva a consultar',1),(173,19248371,19266171,160147058,'2020-09-16 16:05:04','P','gracias',1),(174,19248371,19266171,164116007,'2020-09-16 16:41:33','M','El medico ha iniciado sesion, aguarda por favor...',1),(175,19248371,19266171,164116007,'2020-09-16 16:41:33','M','Hola paciente',1),(176,19248371,19266171,16461762,'2020-09-16 16:46:34','M','El medico ha iniciado sesion, aguarda por favor...',1),(177,19248371,19266171,16461762,'2020-09-16 16:46:39','M','Hola paciente',1),(178,19248371,19266171,165010559,'2020-09-16 16:50:27','M','El medico ha iniciado sesion, aguarda por favor...',1),(179,19248371,19266171,165010559,'2020-09-16 16:50:32','M','Hola paciente, esto es una prueba de envio de emai',1),(180,19248371,19266171,165302542,'2020-09-16 16:53:18','M','El medico ha iniciado sesion, aguarda por favor...',1),(181,19248371,19266171,165302542,'2020-09-16 16:53:18','M','Mensaje enviado para probar el email',1),(182,19248371,19266171,165048746,'2020-09-16 17:50:59','M','El medico ha iniciado sesion, aguarda por favor...',1),(183,19248371,19266171,165048746,'2020-09-16 17:51:03','M','Hola Paciente',1),(184,19248371,19266171,165258673,'2020-09-16 17:53:09','M','El medico ha iniciado sesion, aguarda por favor...',1),(185,19248371,19266171,165258673,'2020-09-16 17:53:09','M','Hola paciente',1),(186,19248371,19266171,165620719,'2020-09-16 17:56:31','M','El medico ha iniciado sesion, aguarda por favor...',1),(187,19248371,19266171,165620719,'2020-09-16 17:56:32','M','prueba de envio de email',1),(188,19248371,19266171,160129462,'2020-09-16 18:01:40','M','El medico ha iniciado sesion, aguarda por favor...',1),(189,19248371,19266171,160129462,'2020-09-16 18:01:44','M','Mensaje creado para enviar copia por email',1),(190,19248371,19266171,160328821,'2020-09-16 18:03:39','M','El medico ha iniciado sesion, aguarda por favor...',1),(191,19248371,19266171,160328821,'2020-09-16 18:03:40','M','Hola paciente, ',1),(192,19248371,19266171,160328821,'2020-09-16 18:03:49','M','este es un mensaje para enviar por email',1),(193,19248371,19266171,160328821,'2020-09-16 18:03:55','P','Hola doc',1),(194,19248371,19266171,160328821,'2020-09-16 18:04:00','P','gracia por avisar',1),(195,19248371,19266171,160614771,'2020-09-16 18:06:25','M','El medico ha iniciado sesion, aguarda por favor...',1),(196,19248371,19266171,160614771,'2020-09-16 18:06:33','M','Hola paciente, bienvenido al sistema de chat',1),(197,19248371,19266171,160614771,'2020-09-16 18:06:40','P','Gracias doctor',1),(198,19248371,19266171,160614771,'2020-09-16 18:06:44','P','un placer',1),(199,19248371,19266171,162532118,'2020-09-16 18:25:43','M','El medico ha iniciado sesion, aguarda por favor...',1),(200,19248371,19266171,162532118,'2020-09-16 18:25:48','M','Chateo para enviar por email',1),(201,19248371,19266171,162532118,'2020-09-16 18:26:00','P','Bien gracias doctor por avisar',1),(202,19248371,19266171,162658769,'2020-09-16 18:27:09','M','El medico ha iniciado sesion, aguarda por favor...',1),(203,19248371,19266171,162658769,'2020-09-16 18:27:15','M','Hola paciente, buenas tardes,',1),(204,19248371,19266171,162658769,'2020-09-16 18:27:26','M','cuanto hace que tiene esos sintomas?',1),(205,19248371,19266171,162658769,'2020-09-16 18:27:35','P','hola doctor',1),(206,19248371,19266171,162658769,'2020-09-16 18:27:35','P','hace dos dias',1),(207,19248371,19266171,16410049,'2020-09-16 18:41:11','M','El medico ha iniciado sesion, aguarda por favor...',1),(208,19248371,19266171,16410049,'2020-09-16 18:41:12','M','Hola paciente, buenas tardes',1),(209,19248371,19266171,16410049,'2020-09-16 18:41:19','P','Hola doctor',1),(210,19248371,19266171,16410049,'2020-09-16 18:41:29','P','Quisiera saber si ve los sintomas que ingrese',1),(211,19248371,19266171,16410049,'2020-09-16 18:41:35','M','Si los veo',1),(212,19248371,19266171,164327344,'2020-09-16 18:43:38','M','El medico ha iniciado sesion, aguarda por favor...',1),(213,19248371,19266171,164327344,'2020-09-16 18:43:39','M','Hola paciente buenas tardes,',1),(214,19248371,19266171,164327344,'2020-09-16 18:43:45','P','hola doctor',1),(215,19248371,19266171,164327344,'2020-09-16 18:43:47','M','prueba de email',1),(216,19248371,19266171,164618367,'2020-09-16 18:46:28','M','El medico ha iniciado sesion, aguarda por favor...',1),(217,19248371,19266171,164618367,'2020-09-16 18:46:32','M','Hola Paciente, buenas tardes',1),(218,19248371,19266171,164618367,'2020-09-16 18:46:40','P','Hola doctor',1),(219,19248371,19266171,164618367,'2020-09-16 18:46:45','P','Como esta?',1),(220,19248371,19266171,164618367,'2020-09-16 18:46:55','P','estoy teniendo problemas de salud',1),(221,19248371,19266171,164618367,'2020-09-16 18:47:12','M','esto es una prueba para enviar automaticamente la conversacion ',1),(222,19248371,19266171,164618367,'2020-09-16 18:47:18','M','de chat por email',1),(223,19248371,19266171,165534656,'2020-09-16 18:55:46','M','El medico ha iniciado sesion, aguarda por favor...',1),(224,19248371,19266171,165534656,'2020-09-16 18:55:46','M','Hola paciente, buenas tardes',1),(225,19248371,19266171,165534656,'2020-09-16 18:55:54','M','cuanto tiempo hace que tiene esos sintomas?',1),(226,19248371,19266171,165534656,'2020-09-16 18:56:03','P','Hola doctor',1),(227,19248371,19266171,165534656,'2020-09-16 18:56:03','P','hace mas de dos dias',1),(228,19248371,19266171,165534656,'2020-09-16 18:56:08','M','ha presentado diarrea?',1),(229,19248371,19266171,165534656,'2020-09-16 18:56:13','P','No por el momento',1),(230,19248371,19266171,165534656,'2020-09-16 18:56:23','P','pero estoy muy dolorida',1),(231,19248371,19266171,165534656,'2020-09-16 18:56:33','P','y ya tome de todo para la fiebre pero no baja',1),(232,19248371,19266171,165534656,'2020-09-16 18:56:37','M','a presentado tos',1),(233,19248371,19266171,165534656,'2020-09-16 18:56:43','P','no doctor',1),(234,19248371,19266171,165534656,'2020-09-16 18:56:48','M','Bien',1),(235,19248371,19266171,165534656,'2020-09-16 18:56:55','M','debido a que ya ha pansado 48 hrs',1),(236,19248371,19266171,165534656,'2020-09-16 18:57:14','M','le sugiero vaya a la policlinica mas cercana',1),(237,19248371,19266171,165534656,'2020-09-16 18:57:25','M','para tener una revision presencial',1),(238,19248371,19266171,165534656,'2020-09-16 18:57:33','P','ok gracias doctos',1),(239,19248371,19266171,165534656,'2020-09-16 18:57:36','M','a la ordenes.',1),(240,19248371,19266171,165534656,'2020-09-16 18:57:47','M','Esto es un mensaje que se envio de prueba para luego enviar por email',1),(241,19248371,19266171,165534656,'2020-09-16 18:57:56','M','hoy es 16-09-2020 y la hora 15:57',1),(242,19248371,19266179,160143549,'2020-09-16 19:02:04','M','El medico ha iniciado sesion, aguarda por favor...',1),(243,19248371,19266179,160143549,'2020-09-16 19:02:14','M','Lo atendio otro medico',1),(244,19248371,19266179,160143549,'2020-09-16 19:02:25','P','Si es correcto',1),(245,19248371,19266179,160143549,'2020-09-16 19:02:28','M','voy a poner en espera',1),(246,19248371,19266171,160143549,'2020-09-16 19:03:10','M','lo tomo otro medico',1),(247,19248371,19266179,161215981,'2020-09-16 19:12:47','M','El medico ha iniciado sesion, aguarda por favor...',1),(248,19248371,19266179,161215981,'2020-09-16 19:12:47','M','Hola paciente',1),(249,19248371,19266179,161215981,'2020-09-16 19:12:50','M','soy el doctor puentes',1),(250,19248371,19266171,165401729,'2020-09-16 20:54:12','M','El medico ha iniciado sesion, aguarda por favor...',1),(251,19248371,19266171,165401729,'2020-09-16 20:54:13','M','Prueba de mesaje para enviar por email',1),(252,19248371,19266171,165401729,'2020-09-16 20:55:10','P','perfecto',1),(253,19248371,19266171,165401729,'2020-09-16 20:55:10','P','gracias por avisar',1),(254,19248371,19266171,165401729,'2020-09-16 20:55:15','M','Si es una prueba de usuario',1),(255,19248371,19266171,160007112,'2020-09-16 21:00:17','M','El medico ha iniciado sesion, aguarda por favor...',1),(256,19248371,19266171,160110667,'2020-09-16 21:01:21','M','El medico ha iniciado sesion, aguarda por favor...',1),(257,19248371,19266171,160540941,'2020-09-16 21:05:54','M','El medico ha iniciado sesion, aguarda por favor...',1),(258,19248371,19266171,160732641,'2020-09-16 21:07:44','M','El medico ha iniciado sesion, aguarda por favor...',1),(259,19248371,19266171,160732641,'2020-09-16 21:07:48','M','hola paciente',1),(260,19248371,19266171,160732641,'2020-09-16 21:07:54','P','hola doc',1),(261,19248371,19266171,240319275,'2020-09-24 23:03:25','M','El medico ha iniciado sesion, aguarda por favor...',1),(262,19248371,19266171,240319275,'2020-09-24 23:03:32','M','Hola paciente',1),(263,19248371,19266171,240319275,'2020-09-24 23:03:47','P','hola doc, le escribi para que prueba el envio de email',1),(264,19248371,19266171,240319275,'2020-09-24 23:03:59','M','Perfecto, vamos a verificar si este email le llega a torterolo',1),(265,19248371,19266171,240319275,'2020-09-24 23:04:07','P','Perfecto, probemos',1),(266,19248371,19266171,243221767,'2020-09-24 23:32:38','M','El medico ha iniciado sesion, aguarda por favor...',1),(267,19248371,19266171,243221767,'2020-09-24 23:34:25','M','hola paciente, buenas noches, ',1),(268,19248371,19266171,243221767,'2020-09-24 23:34:33','M','cuando dias hace que presenta estos sintomas?',1),(269,19248371,19266171,243221767,'2020-09-24 23:35:47','P','hace una semana, he tomado de todo y no he encontrado',1),(270,19248371,19266171,243221767,'2020-09-24 23:35:47','P','solucion',1),(271,19248371,19266171,243221767,'2020-09-24 23:36:27','M','Bien, le sugiero visite la policlinica mas cercana',1),(272,19248371,19266171,243221767,'2020-09-24 23:36:42','P','Perfecto, muchas gracias',1),(273,19248371,19266171,243221767,'2020-09-24 23:36:49','M','A las ordenes.',1),(274,19248371,19266171,260721461,'2020-09-26 19:07:34','M','El medico ha iniciado sesion, aguarda por favor...',1),(275,19248371,19266171,260721461,'2020-09-26 19:12:09','P','El paciente ha salido del chat',1),(276,19248373,19266171,2075757,'2020-10-02 20:08:03','M','El medico ha iniciado sesion, aguarda por favor...',1),(277,19248373,19266171,45235599,'2020-10-04 23:53:02','M','El medico ha iniciado sesion, aguarda por favor...',1),(278,19248373,19266171,65901239,'2020-10-06 23:59:06','M','El medico ha iniciado sesion, aguarda por favor...',1),(279,19248373,19266171,65901239,'2020-10-07 00:05:46','M','hola doc',1);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnostico` (
  `id` int(11) NOT NULL,
  `prioridad` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
INSERT INTO `diagnostico` VALUES (1808049,0),(2075757,40),(12835823,40),(16410049,40),(16422397,0),(16461762,40),(18274778,10),(18403076,10),(28333907,0),(30203762,0),(30322292,0),(30353867,0),(30509857,0),(30802296,0),(33151786,0),(45044295,40),(45235599,40),(50156981,40),(62014755,40),(65901239,40),(94508039,40),(94934374,40),(95513082,40),(95601972,0),(110107882,10),(110119394,10),(114732051,10),(140430229,0),(141147135,10),(141554446,0),(141619613,0),(143549399,0),(143606664,0),(143626994,0),(143719796,10),(143851003,40),(145051366,0),(145121494,10),(145309821,0),(145359912,0),(145923084,0),(160007112,40),(160110667,0),(160129462,40),(160143549,40),(160147058,40),(160328821,40),(160341667,10),(160540941,40),(160614771,40),(160732641,0),(161111765,40),(161215981,40),(161348021,40),(162251781,30),(162532118,40),(162658769,40),(163100886,40),(163840577,20),(164116007,40),(164234573,40),(164327344,40),(164331468,40),(164351737,40),(164538245,40),(164618367,40),(164627055,40),(165010559,40),(165048746,40),(165258673,40),(165302542,40),(165401729,40),(165534656,40),(165620719,40),(180012767,10),(180733799,10),(181149988,40),(181205817,40),(181217659,40),(181228985,40),(181239914,40),(181250174,40),(181301051,40),(181311721,40),(181323401,40),(181349741,40),(181820008,10),(182050763,10),(182522019,10),(183222711,10),(183652181,10),(184258624,10),(184852304,10),(185246737,10),(185624937,10),(240319275,40),(243221767,40),(260721461,10),(261400142,40),(261456734,40),(261622662,40),(273039649,10),(273653711,10),(281110842,0),(281716082,10),(281725792,10),(282917714,0),(283232338,0);
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico` (
  `docidentidad` int(11) NOT NULL,
  `ndemedico` int(11) NOT NULL,
  PRIMARY KEY (`docidentidad`),
  UNIQUE KEY `ndemedico` (`ndemedico`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`docidentidad`) REFERENCES `persona` (`docidentidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (19266173,1234),(19266171,1926),(1926174,13456),(19266179,16665),(19266175,19265),(19266176,19266),(19266172,192622),(19266177,89796546),(19266178,546711321);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `docidentidad` int(11) NOT NULL,
  PRIMARY KEY (`docidentidad`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`docidentidad`) REFERENCES `persona` (`docidentidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (19248370),(19248371),(19248372),(19248373),(19248374),(19248375),(19248376),(19248377),(19248378),(19248379);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patologia`
--

DROP TABLE IF EXISTS `patologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `ponderacion` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patologia`
--

LOCK TABLES `patologia` WRITE;
/*!40000 ALTER TABLE `patologia` DISABLE KEYS */;
INSERT INTO `patologia` VALUES (1,'Contracturas',10,'Dolor Muscular en todo el cuerpo',1),(2,'Gripe A',40,'La gripe A es una enfermedad infecciosa causada por un virus de la influenza tipo A,',1),(3,'Covid-19',40,'Los síntomas aparecen entre dos y catorce días, con un promedio de cinco días, después de la exposición al virus.21?22?23?24? Existe evidencia limitada que sugiere que el virus podría transmitirse uno o dos días antes de que se tengan síntomas, ya que la viremia alcanza un pico al final del período de incubación.2',1),(4,'Ataque la Higado',10,'Comé despacio y mastica muy bien. El hígado no es el responsable de tus molestias. Es un problema digestivo. Deberás tener presente todos estos consejos para evitar su progresión.',1),(5,'Sinusitis',20,'Inflamación nasal.Secreción espesa y descolorida de la nariz. Secreción por la parte posterior de la garganta (secreción posnasal). Obstrucción o congestión nasal, que dificultad para respirar por la nariz. Dolor, sensibilidad e inflamación alrededor de los ojos, las mejillas, la nariz o la frente',1),(6,'Asma',40,'Falta de aire. Dolor u opresión en el pecho. Problemas para dormir causados por falta de aire, tos o silbido al respirar.',1),(7,'Hemorroides',10,'Las hemorroides, también llamadas almorranas, son venas hinchadas en el ano y la parte inferior del recto, similares a las venas varicosas. Las hemorroides pueden desarrollarse dentro del recto (hemorroides internas) o debajo de la piel alrededor del ano (hemorroides externas).',1),(11,'Accidente cerebrovascular',40,'Un accidente cerebrovascular ocurre cuando el suministro de sangre a una parte del cerebro se interrumpe o se reduce, lo que impide que el tejido cerebral reciba oxígeno y nutrientes. Las células cerebrales comienzan a morir en minutos.',1),(15,'Artritis reumatoide',20,'La artritis reumatoide es una forma de artritis que causa dolor, inflamación, rigidez y pérdida de la función de las articulaciones. Puede afectar cualquier articulación, pero es común en las muñecas y los dedos.',1),(16,'Broncoespamo',10,'Las glándulas bronquiales se encargan de segregar una mucosidad que acaba por bloquear los bronquios impidiendo que el aire circule con normalidad. ',1),(18,'Dengue',40,'El dengue es una enfermedad infecciosa producida por el virus del dengue (DENV). Pertenece al género Flavivirus, de la familia Flaviviridae que, a la vez, pertenece al grupo de los Arbovirus (virus trasmitidos por artrópodos). Las partículas virales contienen RNA de cadena simple, son envueltas y tienen aproximadamente 40-50 nm de diámetro.',1),(19,'Patologia Uno',20,'Ingreso de nuevo patologia <sv<sd',0),(20,'Prueba de pat',10,'Prueba de patologia nueva',0),(22,'Prueba de patologia',20,'Ingreso de patologia 17/06/2020 con sus sintomas relacionados',1),(24,'Ingreso de patologia',20,'Ingreso de patologia 1 con sintomas diferentes',0),(25,'Prueba 2',40,'Ingreso de patologia 2',1),(26,'Prueba 3',30,'Ingreso de patologia 3 17/06/2020 con sintomas',1),(27,'Rinitis',30,'Usted presenta un cuadro de  Rinitis. La rinitis es una inflamación del revestimiento mucoso de la nariz, caracterizada clínicamente por uno o más síntomas: rinorrea, estornudo, prurito (picor) nasal, tos irritativa, drenaje (secreción) postnasal.',1),(28,'picazon',10,'urticaria en el cuerpo, principalmente en manos',0),(29,'test',1000,'asrgaedrgadsf',0),(30,'Broncoespasmo',10,'Las glándulas bronquiales se encargan de segregar una mucosidad que acaba por bloquear los bronquios impidiendo que el aire circule con normalidad. ',0),(31,'Patologia inactiva',10,'asrgasg',0),(32,'Acné',10,'El acné es una enfermedad que se caracteriza por la aparición de lesiones en la piel como consecuencia de una foliculitis, una inflamación y posterior infección del poro folicular (orificio de salida del pelo). Estas lesiones suelen ser granos, espinillas negras y parches rojos e inflamados, como quistes.',1),(33,'Aftas bucales',10,'Las aftas bucales son úlceras que se producen en la mucosa de la boca y constituyen una de las enfermedades bucales que  más frecuencia tiene junto con las caries. Son de tamaño pequeño (unos 5 milímetros), el color suele ser blanquecino y aparecen rodeadas por un área roja. Además, no son contagiosas.',1),(34,'Nueva Patologia',30,'Detalle',0),(35,'Nueva patologia',20,'Detalle',0),(36,'Gripe común',10,'La gripe es causada por un virus de la influenza.\r\nLa mayoría de las personas contraen la gripe cuando inhalan gotitas provenientes de la tos o los estornudos de alguien que tenga gripe. Usted también la puede contraer si toca algo que contenga el virus y luego se toca la boca, la nariz o los ojos.',1),(37,'para borrar',20,'Patologia para borrar',0),(38,'prueba',20,'adasds',0),(39,'Nueva Patologia',10,'aerhaerhearhaerhea',1),(40,'Piedras en Riñones',40,'Tus riñones remueven los desechos y líquidos de tu cuerpo para hacer orina.  Algunas veces cuando tienes demasiado de algún desecho y no suficiente líquidos en tu sangre, estos deshechos pueden acumularse y aglutinan en tus riñones.  Estos bodoques de deshechos son llamadas piedras en los riñones o también conocidos como cálculos renales.\r\n\r\n',1),(41,'Tifus',30,'En el horno',1),(42,'Ensefalitis',40,'La encefalitis es una inflamación (hinchazón e irritación) del cerebro. En la mayoría de los casos, esta inflamación está provocada por un virus.\r\n\r\nLa encefalitis también se llama \"encefalitis viral aguda\" o \"encefalitis aséptica\".',1);
/*!40000 ALTER TABLE `patologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `docidentidad` int(11) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `apellidos` varchar(25) NOT NULL,
  `calle` varchar(30) DEFAULT NULL,
  `numero` varchar(8) DEFAULT NULL,
  `barrio` varchar(25) DEFAULT NULL,
  `esquina` varchar(30) DEFAULT NULL,
  `apartamento` varchar(5) DEFAULT NULL,
  `fechaNacimiento` date NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`docidentidad`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1926174,'mariaprado@gmail.com','Maria Esther','Lima Prado','','','','','','1993-09-02',1,'2020-09-16 14:20:20'),(11111111,'usuario1@gmail.com','Mario Juan','Fernandez Corbo','Las Violetas','2516','Jardin','Las Flores','','1982-04-25',1,'2020-09-03 18:54:58'),(11111112,'adm@gmail.com','Prueba de adminitrativo','Nevo','','','','','','1974-06-01',1,'2020-09-14 18:05:18'),(11111113,'floresa@gmail.com','Andres','Flores','','','','','','1945-01-01',1,'2020-09-14 18:33:41'),(11111114,'jramos@gmail.com','Julia Maria','Ramos','','','','','','1753-01-05',1,'2020-09-16 14:00:52'),(11111115,'lucia.ramirez@hotmail.com','Lucia Carolina','Menendez Ramirez','','','','','','1984-01-01',1,'2020-09-26 20:19:08'),(11111118,'lm@gmail.com','Julia Maria','Munoz','Ema Capurro','1613','Estrella del Sur','Venecia','0','1969-10-25',1,'2020-09-26 20:17:59'),(11111119,'mg@gmail.com','Marcos','Bueno','','','','','','1984-01-01',1,'2020-09-29 11:01:26'),(19248370,'mm@gmail.com','Maria','Menendez','','','','','','1984-04-16',1,'2020-09-18 09:30:54'),(19248371,'agonzalez@gmail.com','Andrea Laura','Gonzalez Sanchez','','','','','','1969-08-12',1,'2020-10-02 16:07:18'),(19248372,'maria.perez@gmail.com','Maria Elisa','Perez Perez','','','','','','1900-08-12',1,'2020-09-18 09:10:58'),(19248373,'alexga_1999@hotmail.com','Julio Raul','Gonzalez Prieto','','','','','','1969-10-27',1,'2020-10-01 21:46:42'),(19248374,'luisjuan@gmail.com','Luis Juan','Gomez Diaz','','','','','','1984-01-02',1,'2020-08-12 18:53:54'),(19248375,'mariamoreno@gmail.com','Maria Lujan','Garcia Moreno','Las Heras','3256','Parque Batlle','Av. Italia','201','1980-05-14',1,'2020-08-12 18:58:16'),(19248376,'mikalu@gmail.com','Mika Lu','Capu Sala','MCastro','5544','Solymar','Dulcinea','','1980-09-21',1,'2020-08-12 19:01:38'),(19248377,'juanazapata@gmail.com','Juana Gaby','Zapata Gana','','','','','','1976-12-20',1,'2020-08-12 19:03:58'),(19248378,'alat@gmail.com','Andrea','Latorre','','','','','','1999-09-02',0,'2020-09-08 20:46:47'),(19248379,'lbenites@gmail.com','Luis Maria','Benitez','','','','','','1984-09-15',1,'2020-09-18 09:11:19'),(19266171,'mathias.torterolo@gmail.com','Arturo Manuel','Muela Sosa','Arturo Vidal','2516','El Palacio','Felipe Calderon','','1974-06-12',1,'2020-10-01 21:03:23'),(19266172,'ruben.lima@gmail.com','Ruben Andres','Lima Sosa','','','','','','1983-09-20',1,'2020-09-16 14:20:51'),(19266173,'andreabaz2012@gmail.com','Luis Mario','Benedetti','La direccion','2510','el barrio','La esquina','','1984-03-22',1,'2020-10-01 21:33:19'),(19266175,'notienemail@gmail.com','Estanislao','Perez','Lima ','5646','La Blanqueada','Lavalleja','1A','1936-08-12',1,'2020-08-12 18:44:37'),(19266176,'aburuth@gmial.com','Ruth Rosario','Sanchez Cardozo','','','','','','1974-06-11',1,'2020-08-18 16:41:17'),(19266177,'mb@gmail.com','Macos','Bueno','','','','','','1984-01-01',1,'2020-09-29 10:59:34'),(19266178,'rgomez@gmai.com','Ramon','Gomez','','','','','','1998-01-28',0,'2020-09-09 18:24:48'),(19266179,'Puentes@gmail.com','Arturo','Puentes','','','','','','1969-09-14',1,'2020-09-14 18:32:41'),(19266711,'dff@dff.com','nombre','ape','','','','','','1969-09-03',1,'2020-09-03 18:16:38'),(22222222,'maria.lima@gmail.com','Maria Juana','Lima Perez','Av. De los Pinos','2516','El Barrio','La otra calle','','1984-08-12',1,'2020-09-02 04:52:19'),(22222229,'sol.andy@hotmail.com','MArcos','Bueno','','','','','','1984-01-01',1,'2020-09-29 19:30:24'),(33333333,'angelasoria@vidasana.com','Angela Maria','Soria Machado','','','','','','1967-02-12',1,'2020-08-12 19:07:14'),(44444444,'sebastian@vidasana.com','Sebas Tian','Guardia Segura','','','','','','1986-04-10',1,'2020-08-12 19:08:50'),(55555555,'auguspais@vidasana.com','Augus Diego','Pais Nandez','Los Caminos al Fondo','2244','Buceo','Es aca','','1990-12-26',1,'2020-08-12 19:11:41'),(66666666,'anamarialopez@vidasana.com','Ana Maria','Lopez Perez','Aguas Claras','3355','Escondido','Lado','','1995-10-22',1,'2020-08-12 19:15:02'),(77777777,'cristinamendez@vidasana.com','Cristina Maria','Mendez Pintos','','','','','','1954-01-18',1,'2020-08-12 19:16:52'),(88888888,'mdela@gmail.com','Maria Estela','De la Cruz','Avenida Ramos','1619','La Comercial','Las Flores','','1984-08-12',0,'2020-10-02 16:11:50'),(99999999,'rdiaz@gmail.com','Ruben','Diaz','Avenida Italia','3890','Buceo','Comercio','','1973-09-21',1,'2020-09-08 23:59:34');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preexistentes`
--

DROP TABLE IF EXISTS `preexistentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preexistentes` (
  `docidentidad` int(11) NOT NULL,
  `preexistente` varchar(40) NOT NULL,
  PRIMARY KEY (`docidentidad`,`preexistente`),
  CONSTRAINT `preexistentes_ibfk_1` FOREIGN KEY (`docidentidad`) REFERENCES `paciente` (`docidentidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preexistentes`
--

LOCK TABLES `preexistentes` WRITE;
/*!40000 ALTER TABLE `preexistentes` DISABLE KEYS */;
INSERT INTO `preexistentes` VALUES (19248370,'Hipertencion'),(19248371,'Alergia'),(19248371,'Hipertencion'),(19248372,'Diabetes'),(19248378,'Alergia');
/*!40000 ALTER TABLE `preexistentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibe`
--

DROP TABLE IF EXISTS `recibe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recibe` (
  `idDiagnostico` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `fechaHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idDiagnostico`,`idPaciente`,`fechaHora`),
  KEY `idPaciente` (`idPaciente`),
  CONSTRAINT `recibe_ibfk_1` FOREIGN KEY (`idDiagnostico`) REFERENCES `diagnostico` (`id`),
  CONSTRAINT `recibe_ibfk_2` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`docidentidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibe`
--

LOCK TABLES `recibe` WRITE;
/*!40000 ALTER TABLE `recibe` DISABLE KEYS */;
INSERT INTO `recibe` VALUES (1808049,19248370,'2020-09-18 09:31:23'),(181149988,19248370,'2020-09-18 09:35:08'),(181205817,19248370,'2020-09-18 09:35:24'),(181217659,19248370,'2020-09-18 09:35:36'),(181228985,19248370,'2020-09-18 09:35:47'),(181239914,19248370,'2020-09-18 09:35:58'),(181250174,19248370,'2020-09-18 09:36:08'),(181301051,19248370,'2020-09-18 09:36:19'),(181311721,19248370,'2020-09-18 09:36:30'),(181323401,19248370,'2020-09-18 09:36:42'),(181349741,19248370,'2020-09-18 09:37:08'),(12835823,19248371,'2020-09-01 18:28:35'),(16410049,19248371,'2020-09-16 18:41:00'),(16422397,19248371,'2020-09-16 15:42:23'),(16461762,19248371,'2020-09-16 16:46:17'),(18274778,19248371,'2020-08-18 17:27:48'),(18403076,19248371,'2020-08-18 17:40:31'),(28333907,19248371,'2020-08-28 01:03:19'),(30802296,19248371,'2020-09-03 20:08:01'),(33151786,19248371,'2020-09-03 19:31:50'),(50156981,19248371,'2020-09-05 15:01:57'),(94508039,19248371,'2020-09-09 21:45:07'),(94934374,19248371,'2020-09-09 21:49:33'),(95513082,19248371,'2020-09-09 21:55:12'),(95601972,19248371,'2020-09-09 21:56:01'),(110107882,19248371,'2020-09-11 17:01:07'),(110119394,19248371,'2020-09-11 17:01:18'),(114732051,19248371,'2020-09-11 14:47:31'),(140430229,19248371,'2020-09-14 20:04:29'),(141147135,19248371,'2020-09-14 19:11:46'),(141554446,19248371,'2020-09-14 19:15:54'),(141619613,19248371,'2020-09-14 19:16:19'),(143549399,19248371,'2020-09-14 19:35:48'),(143606664,19248371,'2020-09-14 19:36:06'),(143626994,19248371,'2020-09-14 19:36:26'),(143719796,19248371,'2020-09-14 19:37:19'),(143851003,19248371,'2020-09-14 19:38:50'),(145051366,19248371,'2020-09-14 19:50:50'),(145121494,19248371,'2020-09-14 19:51:20'),(145309821,19248371,'2020-09-14 19:53:09'),(145359912,19248371,'2020-09-14 19:53:59'),(145923084,19248371,'2020-09-14 19:59:22'),(160007112,19248371,'2020-09-16 21:00:06'),(160110667,19248371,'2020-09-16 21:01:10'),(160129462,19248371,'2020-09-16 18:01:29'),(160143549,19248371,'2020-09-16 19:01:43'),(160147058,19248371,'2020-09-16 16:01:46'),(160328821,19248371,'2020-09-16 18:03:28'),(160341667,19248371,'2020-09-16 15:03:41'),(160540941,19248371,'2020-09-16 21:05:40'),(160614771,19248371,'2020-09-16 18:06:14'),(160732641,19248371,'2020-09-16 21:07:32'),(161111765,19248371,'2020-09-16 21:11:11'),(161215981,19248371,'2020-09-16 19:12:15'),(161348021,19248371,'2020-08-16 20:13:48'),(162251781,19248371,'2020-08-16 20:22:52'),(162532118,19248371,'2020-09-16 18:25:31'),(162658769,19248371,'2020-09-16 18:26:58'),(163100886,19248371,'2020-09-16 15:31:00'),(163840577,19248371,'2020-08-16 20:38:41'),(164116007,19248371,'2020-09-16 16:41:15'),(164234573,19248371,'2020-09-16 15:42:34'),(164327344,19248371,'2020-09-16 18:43:27'),(164331468,19248371,'2020-09-16 23:42:45'),(164351737,19248371,'2020-09-16 15:43:51'),(164538245,19248371,'2020-09-16 15:45:37'),(164618367,19248371,'2020-09-16 18:46:18'),(164627055,19248371,'2020-09-16 15:46:26'),(165010559,19248371,'2020-09-16 16:50:10'),(165048746,19248371,'2020-09-16 17:50:48'),(165258673,19248371,'2020-09-16 17:52:58'),(165302542,19248371,'2020-09-16 16:53:02'),(165401729,19248371,'2020-09-16 20:54:01'),(165534656,19248371,'2020-09-16 18:55:34'),(165620719,19248371,'2020-09-16 17:56:20'),(180012767,19248371,'2020-08-18 18:00:13'),(180733799,19248371,'2020-08-18 17:07:34'),(181820008,19248371,'2020-08-18 18:18:20'),(182050763,19248371,'2020-08-18 17:20:51'),(183222711,19248371,'2020-08-18 17:32:23'),(183652181,19248371,'2020-08-18 17:36:52'),(184852304,19248371,'2020-08-18 17:48:52'),(185246737,19248371,'2020-08-18 16:52:47'),(240319275,19248371,'2020-09-24 23:03:17'),(243221767,19248371,'2020-09-24 23:32:20'),(260721461,19248371,'2020-09-26 19:07:22'),(261400142,19248371,'2020-09-26 23:14:00'),(261456734,19248371,'2020-09-26 23:14:57'),(261622662,19248371,'2020-09-26 23:16:23'),(273039649,19248371,'2020-08-27 23:30:38'),(273653711,19248371,'2020-08-27 23:36:52'),(281110842,19248371,'2020-08-28 01:40:53'),(281716082,19248371,'2020-08-28 00:47:32'),(281725792,19248371,'2020-08-28 00:47:42'),(282917714,19248371,'2020-08-28 01:58:58'),(283232338,19248371,'2020-08-28 01:02:12'),(2075757,19248373,'2020-10-02 20:07:56'),(45044295,19248373,'2020-10-04 23:50:44'),(45235599,19248373,'2020-10-04 23:52:35'),(62014755,19248373,'2020-10-07 00:20:12'),(65901239,19248373,'2020-10-06 23:58:59'),(182522019,19248373,'2020-09-18 08:23:47'),(184258624,19248373,'2020-09-18 08:23:47'),(185624937,19248373,'2020-09-18 08:23:47');
/*!40000 ALTER TABLE `recibe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion` (
  `idSesion` int(11) NOT NULL,
  `estado` enum('0','1','2','3','4') DEFAULT '0',
  `fechaHoraInicioSesion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `prioridad` int(11) NOT NULL,
  PRIMARY KEY (`idSesion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (2075757,'3','2020-10-02 20:08:24',40),(12835823,'4','2020-09-01 18:28:49',40),(16410049,'3','2020-09-16 18:41:48',40),(16461762,'3','2020-09-16 16:46:43',40),(18274778,'3','2020-08-18 17:31:53',10),(18403076,'3','2020-08-18 17:42:39',10),(30802296,'3','2020-09-03 20:11:14',0),(33151786,'3','2020-09-03 19:34:32',0),(45044295,'4','2020-10-04 23:52:24',40),(45235599,'3','2020-10-04 23:55:47',40),(50156981,'4','2020-09-05 15:02:06',40),(62014755,'4','2020-10-07 00:22:53',40),(65901239,'3','2020-10-07 00:06:11',40),(94934374,'1','2020-09-14 19:33:05',40),(95513082,'4','2020-09-09 21:55:18',40),(95601972,'4','2020-09-09 21:56:43',0),(110107882,'4','2020-09-11 17:01:27',10),(110119394,'4','2020-09-11 17:01:30',10),(114732051,'4','2020-09-11 14:47:37',10),(141147135,'4','2020-09-14 19:11:51',10),(141619613,'3','2020-09-16 16:01:32',0),(143719796,'3','2020-09-16 16:01:17',10),(143851003,'3','2020-09-16 16:01:12',40),(145121494,'3','2020-09-16 16:01:20',10),(145309821,'3','2020-09-16 16:01:24',0),(145359912,'3','2020-09-16 16:01:27',0),(145923084,'3','2020-09-14 20:00:06',0),(160007112,'3','2020-09-16 21:00:19',40),(160110667,'3','2020-09-16 21:01:29',0),(160129462,'3','2020-09-16 18:01:49',40),(160143549,'4','2020-09-16 19:11:12',40),(160147058,'3','2020-09-16 16:05:17',40),(160328821,'3','2020-09-16 18:04:03',40),(160341667,'4','2020-09-16 15:03:49',10),(160540941,'3','2020-09-16 21:06:12',40),(160614771,'3','2020-09-16 18:06:47',40),(160732641,'3','2020-09-16 21:08:04',0),(161215981,'4','2020-09-16 20:53:43',40),(161348021,'3','2020-08-16 20:17:46',10),(162251781,'3','2020-08-16 20:26:51',30),(162532118,'3','2020-09-16 18:26:04',40),(162658769,'3','2020-09-16 18:27:38',40),(163840577,'3','2020-08-16 20:42:30',20),(164116007,'3','2020-09-16 16:41:39',40),(164327344,'3','2020-09-16 18:43:50',40),(164618367,'3','2020-09-16 18:47:22',40),(165010559,'3','2020-09-16 16:50:34',40),(165048746,'3','2020-09-16 17:51:17',40),(165258673,'3','2020-09-16 17:53:13',40),(165302542,'3','2020-09-16 16:53:20',40),(165401729,'4','2020-09-16 20:58:25',40),(165534656,'3','2020-09-16 18:57:59',40),(165620719,'3','2020-09-16 17:56:35',40),(180012767,'3','2020-08-18 18:10:35',10),(180733799,'1','2020-08-18 17:07:45',10),(181820008,'3','2020-08-18 18:19:10',10),(182050763,'1','2020-08-18 17:21:24',10),(182522019,'3','2020-08-18 17:27:25',10),(183222711,'3','2020-08-18 17:32:48',10),(183652181,'4','2020-08-18 17:37:06',10),(184258624,'3','2020-08-18 17:43:31',10),(184852304,'3','2020-08-18 17:51:01',10),(185246737,'3','2020-08-18 16:54:16',10),(185624937,'1','2020-08-18 16:56:51',10),(240319275,'3','2020-09-24 23:04:16',40),(243221767,'3','2020-09-24 23:36:52',40),(260721461,'3','2020-09-26 19:13:57',10),(261622662,'4','2020-09-26 23:16:28',40),(273039649,'3','2020-08-27 23:31:04',10),(273653711,'3','2020-08-27 23:38:38',10),(281110842,'3','2020-08-28 01:42:21',0),(281236836,'0','2020-08-28 00:43:01',0),(281735578,'0','2020-08-28 00:48:06',0),(282917714,'3','2020-08-28 02:00:25',0);
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantSintomas` int(11) DEFAULT NULL,
  `ipGestion` varchar(15) DEFAULT NULL,
  `ipMedicos` varchar(15) DEFAULT NULL,
  `ipPacientes` varchar(15) DEFAULT NULL,
  `emailContacto` varchar(60) DEFAULT NULL,
  `emailPuertoSMTP` int(11) DEFAULT NULL,
  `emailServidorSMPT` varchar(50) DEFAULT NULL,
  `emailSSL` tinyint(1) DEFAULT NULL,
  `emailCredencial` varchar(40) DEFAULT NULL,
  `docIdentidad` int(11) DEFAULT NULL,
  `ultimaModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `docIdentidad` (`docIdentidad`),
  CONSTRAINT `setting_ibfk_1` FOREIGN KEY (`docIdentidad`) REFERENCES `administrativo` (`docidentidad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,2,'192.168.1.%','192.168.1.%','%','solutionscds@gmail.com',587,'smtp.gmail.com',1,'cdssolution2020',11111111,'2020-10-01 20:53:29');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sintoma`
--

DROP TABLE IF EXISTS `sintoma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sintoma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sintoma`
--

LOCK TABLES `sintoma` WRITE;
/*!40000 ALTER TABLE `sintoma` DISABLE KEYS */;
INSERT INTO `sintoma` VALUES (1,'Náuseas',1),(2,'Tos',1),(3,'Falta de Aire',1),(4,'Diarrea',1),(5,'Vomito',1),(6,'Náuseas',1),(8,'Dolor en el pecho',1),(9,'Dolor de Cabeza',1),(11,' Calambres en manos',1),(12,' Presion Alta',1),(13,'Perdida de Peso',0),(14,'Picor',0),(15,'Agotamiento',0),(17,'Taquicardia',0),(18,'Mareos',1),(19,'Escalofríos',1),(22,'Dolor de testiculo',1),(23,'Pérdida de apetito',1),(24,'Dolor de oído',1),(25,'cucusa',0),(27,'Ojos y piel amarillentos',1),(28,'Pigmentación amarilla de ',1),(30,'Picazon en los ojos',1),(40,'Dolor en los Genitales',1),(42,'Manchas rojizas',1),(44,'Dolor en los ojos',1),(45,'Dolor Muscular',1),(46,'Dolor en los huesos',1),(47,'Fiebre Alta',1),(49,'Fiebre baja',1),(50,'Fiebre Moderada',1),(53,'Dolor de espalda',1),(54,'Perdida de audicion',1),(57,'Prueba dos',0),(66,'Piel roja',1),(67,'Alteracion en la orina',1),(76,'Picor en los ojos',1),(77,'Estornudos',1),(78,'Tos irritativa',1),(79,'Ojos rojos',1),(81,'',0),(84,'Granos',1),(86,'Pus',1),(88,'Heridas blancas en boca',1),(89,'heridas en la lengua',1),(93,'Calambre',1),(94,'Dolor agudo en la espalda',1),(95,'Dolor al orinar',0);
/*!40000 ALTER TABLE `sintoma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono` (
  `docidentidad` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  PRIMARY KEY (`docidentidad`,`telefono`),
  CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`docidentidad`) REFERENCES `persona` (`docidentidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES (1926174,94204333),(11111111,91253412),(11111114,66666661),(11111114,66666666),(11111115,96321654),(11111118,94123456),(19248370,96111111),(19248371,92123456),(19248371,94111111),(19248378,91123456),(19266171,98111111),(19266172,94123456),(19266173,94123456),(19266176,91123456),(19266177,94555555),(77777777,94777777),(88888888,9555555),(99999999,94999999);
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiene`
--

DROP TABLE IF EXISTS `tiene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiene` (
  `idDiagnostico` int(11) NOT NULL,
  `idPatologia` int(11) NOT NULL,
  `idSintoma` int(11) NOT NULL,
  PRIMARY KEY (`idDiagnostico`,`idPatologia`,`idSintoma`),
  KEY `idPatologia` (`idPatologia`),
  KEY `idSintoma` (`idSintoma`),
  CONSTRAINT `tiene_ibfk_1` FOREIGN KEY (`idDiagnostico`) REFERENCES `diagnostico` (`id`),
  CONSTRAINT `tiene_ibfk_2` FOREIGN KEY (`idPatologia`) REFERENCES `patologia` (`id`),
  CONSTRAINT `tiene_ibfk_3` FOREIGN KEY (`idSintoma`) REFERENCES `sintoma` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiene`
--

LOCK TABLES `tiene` WRITE;
/*!40000 ALTER TABLE `tiene` DISABLE KEYS */;
INSERT INTO `tiene` VALUES (143719796,1,9),(143719796,1,45),(143719796,1,53),(145121494,1,9),(145121494,1,45),(145121494,1,53),(161111765,1,9),(163840577,1,9),(185246737,1,9),(110107882,4,1),(110107882,4,4),(162251781,5,1),(143851003,6,3),(143851003,6,8),(143851003,6,18),(163840577,6,47),(161348021,16,1),(163840577,16,1),(2075757,18,5),(2075757,18,47),(12835823,18,5),(12835823,18,47),(16410049,18,5),(16410049,18,47),(16461762,18,5),(16461762,18,47),(45044295,18,5),(45044295,18,47),(45235599,18,5),(45235599,18,47),(50156981,18,5),(50156981,18,47),(62014755,18,5),(62014755,18,47),(65901239,18,5),(65901239,18,47),(94508039,18,5),(94508039,18,47),(94934374,18,5),(94934374,18,47),(95513082,18,5),(95513082,18,47),(160007112,18,5),(160007112,18,47),(160129462,18,5),(160129462,18,47),(160143549,18,5),(160143549,18,47),(160147058,18,5),(160147058,18,47),(160328821,18,5),(160328821,18,47),(160540941,18,5),(160540941,18,47),(160614771,18,5),(160614771,18,47),(161111765,18,5),(161111765,18,47),(161215981,18,5),(161215981,18,47),(162532118,18,5),(162532118,18,47),(162658769,18,5),(162658769,18,47),(163100886,18,5),(163100886,18,47),(164116007,18,5),(164116007,18,47),(164234573,18,5),(164234573,18,47),(164327344,18,5),(164327344,18,47),(164331468,18,5),(164331468,18,47),(164351737,18,5),(164351737,18,47),(164538245,18,5),(164538245,18,47),(164618367,18,5),(164618367,18,47),(164627055,18,5),(164627055,18,47),(165010559,18,5),(165010559,18,47),(165048746,18,5),(165048746,18,47),(165258673,18,5),(165258673,18,47),(165302542,18,5),(165302542,18,47),(165401729,18,5),(165401729,18,47),(165534656,18,5),(165534656,18,47),(165620719,18,5),(165620719,18,47),(240319275,18,5),(240319275,18,47),(243221767,18,5),(243221767,18,47),(261400142,18,5),(261400142,18,47),(261456734,18,5),(261456734,18,47),(261622662,18,5),(261622662,18,47),(161348021,24,1),(161348021,26,1),(184852304,36,2),(184852304,36,8),(184852304,36,45),(184852304,36,50),(273653711,36,2),(273653711,36,8),(18274778,39,2),(18274778,39,5),(18403076,39,2),(18403076,39,5),(110107882,39,1),(110107882,39,4),(110119394,39,1),(110119394,39,6),(114732051,39,1),(114732051,39,8),(141147135,39,1),(141147135,39,5),(141147135,39,9),(143851003,39,3),(143851003,39,8),(143851003,39,18),(160341667,39,1),(160341667,39,6),(162251781,39,1),(180012767,39,2),(180012767,39,5),(180733799,39,2),(180733799,39,5),(181820008,39,2),(181820008,39,5),(182050763,39,2),(182050763,39,5),(182522019,39,2),(182522019,39,5),(183222711,39,2),(183222711,39,5),(183652181,39,2),(183652181,39,5),(184258624,39,2),(184258624,39,5),(185246737,39,47),(185624937,39,2),(185624937,39,5),(260721461,39,3),(260721461,39,5),(273039649,39,2),(273039649,39,5),(273653711,39,2),(273653711,39,8),(281716082,39,12),(281716082,39,18),(281725792,39,5),(281725792,39,11),(181149988,42,9),(181149988,42,47),(181205817,42,9),(181205817,42,47),(181217659,42,9),(181217659,42,47),(181228985,42,9),(181228985,42,47),(181239914,42,9),(181239914,42,47),(181250174,42,9),(181250174,42,47),(181301051,42,9),(181301051,42,47),(181311721,42,9),(181311721,42,47),(181323401,42,9),(181323401,42,47),(181349741,42,9),(181349741,42,47);
/*!40000 ALTER TABLE `tiene` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-09 17:35:02
