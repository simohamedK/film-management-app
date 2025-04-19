CREATE DATABASE  IF NOT EXISTS `readflex` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `readflex`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: readflex
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id` bigint NOT NULL,
  `actor_image` varchar(255) DEFAULT NULL,
  `actor_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'image','Aaron'),(2,'image2.jpg','Bella'),(3,'image3.jpg','Charles'),(4,'image4.jpg','Diana'),(5,'image5.jpg','Ethan'),(6,'image6.jpg','Fiona'),(7,'image7.jpg','George'),(8,'image8.jpg','Hannah'),(9,'image9.jpg','Ivan'),(10,'image10.jpg','Jasmine'),(11,'image11.jpg','Kevin'),(12,'image12.jpg','Laura'),(13,'image13.jpg','Martin'),(14,'image14.jpg','Nina'),(15,'image15.jpg','Oscar'),(16,'image16.jpg','Paula'),(17,'image17.jpg','Quentin'),(18,'image18.jpg','Rachel'),(19,'image19.jpg','Sam'),(20,'image20.jpg','Tina'),(21,'image1.jpg','Aaron');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actors_seq`
--

DROP TABLE IF EXISTS `actors_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors_seq`
--

LOCK TABLES `actors_seq` WRITE;
/*!40000 ALTER TABLE `actors_seq` DISABLE KEYS */;
INSERT INTO `actors_seq` VALUES (51);
/*!40000 ALTER TABLE `actors_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKt8o6pivur7nn124jehx7cygw5` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'aa'),(9,'Adventure'),(10,'Animation'),(11,'Biography'),(2,'Comedy'),(12,'Crime'),(13,'Documentary'),(3,'Drama'),(14,'Family'),(4,'Fantasy'),(15,'History'),(5,'Horror'),(16,'Musical'),(17,'Mystery'),(6,'Romance'),(7,'Sci-Fi'),(18,'Sport'),(8,'Thriller'),(19,'War'),(20,'Western');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_seq`
--

DROP TABLE IF EXISTS `categories_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_seq`
--

LOCK TABLES `categories_seq` WRITE;
/*!40000 ALTER TABLE `categories_seq` DISABLE KEYS */;
INSERT INTO `categories_seq` VALUES (101);
/*!40000 ALTER TABLE `categories_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story`
--

DROP TABLE IF EXISTS `story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `story` (
  `id` bigint NOT NULL,
  `story_content` text,
  `story_description` varchar(255) DEFAULT NULL,
  `story_image` varchar(255) DEFAULT NULL,
  `story_name` varchar(255) DEFAULT NULL,
  `categorie_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1t39u7nea3pds0v21pratpl2i` (`categorie_id`),
  CONSTRAINT `FK1t39u7nea3pds0v21pratpl2i` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story`
--

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
INSERT INTO `story` VALUES (1,'blablacar','story of blabla car','cc','car',1),(2,'Élise, une jeune femme au cœur tendre, décide de quitter la ville pour se ressourcer à la campagne. Elle y rencontre Antoine, un fermier discret mais passionné. Peu à peu, une romance naît entre eux, malgré les différences de leurs mondes. Ensemble, ils découvrent que l’amour peut fleurir même dans les endroits les plus inattendus.','L’amour fleurit dans des endroits inattendus','romance1.jpg','Amour à la Campagne',2),(3,'Le détective Pierre Lefebvre reçoit une lettre anonyme l’invitant à résoudre une énigme complexe dans une grande ville. Au fur et à mesure de ses recherches, il découvre que chaque indice est lié à une série de disparitions non résolues. Grâce à sa persévérance et à son esprit analytique, il parvient à démêler l’affaire et à arrêter le coupable.','Un thriller criminel captivant','mystere1.jpg','Détective en Ville',3),(4,'L’astronaute Claire Dupont est envoyée en mission pour explorer une planète inconnue située aux confins de la galaxie. Une fois sur place, elle découvre des formes de vie intelligentes et entre en contact avec une civilisation avancée. Elle doit alors choisir entre protéger les secrets de cette planète ou partager ses découvertes avec l’humanité.','Aventure de science-fiction au-delà des étoiles','scifi1.jpg','Odyssée Spatiale',4),(5,'Un groupe d’amis d’enfance décide de suivre une vieille carte qui semble indiquer l’emplacement d’un trésor oublié. Après de nombreuses péripéties et pièges, ils parviennent enfin à la grotte cachée. À l’intérieur, ils découvrent non seulement des richesses, mais aussi une leçon sur l’importance de l’amitié et de la loyauté.','Une chasse au trésor remplie d’aventures','aventure1.jpg','La Chasse au Trésor',5),(6,'Lucas, un jeune garçon curieux, s’aventure dans une forêt mystérieuse près de chez lui. Il y découvre des créatures magiques, des fées et des animaux parlants. Au fil de ses aventures, il apprend qu’il est destiné à protéger cette forêt d’une force obscure qui menace de détruire l’équilibre de ce monde enchanté.','Un conte magique plein de merveilles et de fantaisie','fantaisie1.jpg','La Forêt Enchantée',6),(7,'Après des années passées au front, Marc revient chez lui, mais il a du mal à retrouver une vie normale. Ses souvenirs de guerre le hantent, et il se sent isolé. Avec l’aide de sa famille et d’un groupe de soutien, il commence à reconstruire sa vie, trouvant finalement la paix en aidant d’autres anciens combattants à surmonter leurs traumatismes.','Une histoire émotive de résilience et d’espoir','guerre1.jpg','Retour à la Maison',7),(8,'Dans un futur proche, les robots coexistent avec les humains. Martin, un ingénieur talentueux, développe une intelligence artificielle capable d’émotions. Alors que la société débat sur les droits des robots, Martin se retrouve au cœur d’un conflit moral et politique qui changera à jamais le rapport entre l’homme et la machine.','Une histoire futuriste sur l’IA et l’humanité','robot1.jpg','L’Homme contre la Machine',8),(9,'Sophie, une jeune chef prometteuse, participe à une compétition culinaire de renommée mondiale. Face à des chefs expérimentés, elle doit prouver qu’elle a sa place parmi les meilleurs. Chaque plat qu’elle prépare est une œuvre d’art, mais c’est en restant fidèle à ses racines qu’elle parvient à remporter le titre de meilleure chef.','Une bataille acharnée pour la première place','cuisine1.jpg','Le Maître Chef',9),(10,'Alex et son équipe d’explorateurs partent en expédition dans une forêt tropicale inexplorée. Rapidement, ils se perdent et doivent affronter les dangers de la nature sauvage : animaux féroces, tempêtes et maladies. Pour survivre, ils doivent s’unir et surmonter leurs différences. Finalement, ils réussissent à revenir sains et saufs, changés à jamais par cette expérience.','Lutter contre les éléments pour survivre','survie1.jpg','Dans la Nature Sauvage',10),(11,'Thomas, un jeune musicien talentueux, quitte sa petite ville pour tenter sa chance à Paris. Après des débuts difficiles, il est découvert par un producteur qui lui offre une opportunité en or. Mais la route vers la gloire est semée d’embûches. Avec persévérance et passion, il parvient à réaliser son rêve et devient une star internationale.','Un rêve devenu réalité','musique1.jpg','Étoile Montante',11),(12,'Lisa, une jeune hackeuse, découvre un réseau de corruption impliquant de hauts responsables politiques. Déterminée à révéler la vérité, elle utilise ses compétences pour pirater les systèmes de sécurité et publier les preuves en ligne. Mais en s’attaquant à des ennemis puissants, elle met sa vie en danger. Sa quête pour la justice lui coûte cher, mais elle devient une héroïne anonyme.','Espionnage numérique et intrigues modernes','hacker1.jpg','Le Cyber Justicier',12),(13,'Pendant une pandémie mondiale, la famille Durand doit faire face à l’isolement, la peur et la perte. Chacun des membres de la famille vit cette période différemment, mais c’est leur amour et leur soutien mutuel qui leur permet de surmonter les épreuves. À travers les hauts et les bas, ils découvrent l’importance des liens familiaux.','Un récit émouvant d’amour et de perte','pandemie1.jpg','Les Jours de Quarantaine',13),(14,'Dans le royaume d’Aryon, les dragons dominent les cieux et les humains vivent sous leur règne. Lorsqu’un jeune fermier nommé Kai découvre qu’il a le pouvoir de communiquer avec les dragons, il devient un élément clé dans la révolte contre le roi dragon. Avec l’aide d’un dragon rebelle, Kai mène une bataille épique pour libérer son peuple.','Des batailles épiques entre humains et dragons','dragons1.jpg','L’Empire des Dragons',14),(15,'Claire, une jeune artiste, s’installe à Paris pour poursuivre son rêve de devenir peintre. Dans le monde impitoyable de l’art contemporain, elle fait face à la concurrence féroce et aux critiques acerbes. Malgré les défis, elle reste fidèle à sa vision et finit par être reconnue pour son travail unique. Elle découvre que l’art est plus qu’une question de succès, c’est une expression de soi.','Un voyage créatif plein de défis','art1.jpg','Chaos Créatif',15),(16,'Un groupe de braqueurs organise un vol audacieux dans une banque hautement sécurisée. Mais dès le début, les choses tournent mal : un membre de l’équipe trahit les autres et les forces de l’ordre se rapprochent rapidement. Ce qui devait être un coup parfait devient une lutte pour la survie. Les braqueurs restants doivent utiliser toute leur ingéniosité pour s’échapper.','Une histoire d’action pleine de rebondissements','braquage1.jpg','Le Grand Braquage',16),(17,'L’équipe de football des Lions traverse une saison difficile, mais grâce à la détermination de leur capitaine, Maxime, ils parviennent à se qualifier pour la finale du championnat. Lors du match décisif, ils affrontent une équipe redoutable. Avec un esprit d’équipe sans faille, ils remportent la victoire et deviennent champions.','Un récit de travail d’équipe et de persévérance','sport1.jpg','Les Champions',17),(18,'Dans une petite ville tranquille, un meurtre bouleverse la communauté. Le détective Marc Dufour est appelé pour enquêter. Au fil de l’enquête, il découvre que le meurtre cache de sombres secrets impliquant des personnes influentes. Avec patience et détermination, il dénoue l’affaire et traduit les coupables en justice.','Un drame criminel captivant','meurtre1.jpg','Meurtre dans la Vallée',18),(19,'Sophie, une scientifique brillante, découvre un moyen de voyager dans le temps. Elle utilise cette technologie pour explorer des événements historiques majeurs, mais en intervenant dans le passé, elle modifie l’avenir. Désormais, elle doit réparer les erreurs qu’elle a commises avant que son propre présent ne disparaisse à jamais.','Une aventure historique à travers les siècles','temps1.jpg','Le Voyageur Temporel',19),(20,'Pendant la Guerre Froide, un agent double nommé Viktor est chargé de jouer un rôle crucial dans l’espionnage entre l’Est et l’Ouest. Pris entre deux feux, il doit choisir entre trahir son pays ou sauver sa famille. Son dilemme le conduit à une série d’actions qui auront un impact décisif sur le cours de l’histoire.','Tensions politiques et jeux d’espions','espion1.jpg','Espionnage de la Guerre Froide',20),(21,'Dans un village reculé, un jeune homme nommé Julien décide de se dresser contre les injustices imposées par le seigneur local. Malgré les menaces, il organise une révolte avec les habitants. Après des mois de luttes, ils réussissent à libérer le village. Le courage de Julien fait de lui un héros pour son peuple.','Un récit de bravoure et de courage','heros1.jpg','Le Voyage du Héros',1);
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story_seq`
--

DROP TABLE IF EXISTS `story_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `story_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story_seq`
--

LOCK TABLES `story_seq` WRITE;
/*!40000 ALTER TABLE `story_seq` DISABLE KEYS */;
INSERT INTO `story_seq` VALUES (1);
/*!40000 ALTER TABLE `story_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_story_favorite`
--

DROP TABLE IF EXISTS `user_story_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_story_favorite` (
  `user_id` bigint NOT NULL,
  `story_id` bigint NOT NULL,
  KEY `FKk87ka6eoimdlbmvm7taesmif0` (`story_id`),
  KEY `FKe60mbsc1gwqnifgsj73m6wqbd` (`user_id`),
  CONSTRAINT `FKe60mbsc1gwqnifgsj73m6wqbd` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKk87ka6eoimdlbmvm7taesmif0` FOREIGN KEY (`story_id`) REFERENCES `story` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_story_favorite`
--

LOCK TABLES `user_story_favorite` WRITE;
/*!40000 ALTER TABLE `user_story_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_story_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'aa@gmail.com',1,'$2a$10$/n8NOhhGQLvAj7aNzbBa8eY4JKPKcZ2c.HSoJGZCATImbm/Oz2K86','Aa'),(2,'aaronkom345kata@gmail.com',1,'$2a$10$HMn31MSZIRevVJHzlcwYouSaacRl5pGl4RiIaxZhXM5i3eq5LNbyy','bba'),(3,'marcel@gmail.com',0,'$2a$10$b.86DqwxzejmmHj/po.OV.NP/qryamcjye8HUWPt6Ave.9YUwCZZO','marcel');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_seq`
--

DROP TABLE IF EXISTS `users_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_seq`
--

LOCK TABLES `users_seq` WRITE;
/*!40000 ALTER TABLE `users_seq` DISABLE KEYS */;
INSERT INTO `users_seq` VALUES (101);
/*!40000 ALTER TABLE `users_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-22 13:41:06
