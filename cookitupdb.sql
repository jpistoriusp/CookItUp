-- MySQL dump 10.13  Distrib 5.6.35, for osx10.9 (x86_64)
--
-- Host: localhost    Database: cookitupdb
-- ------------------------------------------------------
-- Server version	5.6.35

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
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `recipe_id_idx` (`recipe_id`),
  CONSTRAINT `fk_user_has_favorite` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (1,1,1),(2,1,2),(3,3,12);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Onion'),(2,'Rice'),(3,'Egg'),(4,'Soy Sauce'),(5,'Chicken'),(6,'Carrot'),(7,'Lettuce'),(8,'Black Beans'),(9,'Shrimp'),(10,'Potatoes'),(13,'Cheese'),(14,'Flour'),(15,'flower'),(16,'milk'),(17,'Oatmeal'),(18,'milk'),(19,'all-purpose flour'),(20,'teaspoons baking powder'),(21,'salt'),(22,'white sugar'),(23,'eggs'),(24,'mayonnaise or salad dressing'),(25,'water (optional)'),(26,'margarine or butter'),(27,'salt and pepper'),(28,'olive oil'),(29,'diced bell peppers and onions'),(30,'tube Crescent Rolls'),(31,'ham'),(32,'slices salami'),(33,'eggs'),(34,'salt and pepper to taste'),(35,'shredded cheese'),(36,'can no-salt-added black beans, drained'),(37,'teaspoons fresh lime juice'),(38,'Cooking spray'),(39,'large eggs, lightly beaten'),(40,'flour tortillas'),(41,'Fresh Salsa'),(42,'crumbled Cotija cheese'),(43,'Lime wedges'),(44,'eggs'),(45,'Butter beans/Tofu'),(46,'all purpose flour'),(47,'garlic'),(48,'Red Hot pepper'),(49,'green onion'),(50,'salt'),(51,'Cooking oil'),(58,'jar sliced pickled jalapenos, drained'),(59,'pound flank steak,trimmed'),(60,'Kosher salt and freshly ground pepper'),(61,'cup chopped white onion'),(62,'cup fresh cilantro'),(63,'Lime wedges, for serving'),(64,'tablespoons Salsa'),(65,'corn tortillas');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruction`
--

DROP TABLE IF EXISTS `instruction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) DEFAULT NULL,
  `step_number` int(11) DEFAULT NULL,
  `text` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_id_idx` (`recipe_id`),
  CONSTRAINT `recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruction`
--

LOCK TABLES `instruction` WRITE;
/*!40000 ALTER TABLE `instruction` DISABLE KEYS */;
INSERT INTO `instruction` VALUES (1,1,1,'Heat 1 tbsp oil in wok; add chopped onions and stir-fry until onions turn a nice brown color, about 8-10 minutes; remove from wok.'),(2,1,2,'Mix egg with 3 drops of soy and 3 drops of sesame oil; set aside.'),(3,1,3,'Add 1/2 tbsp oil to wok, swirling to coat surfaces; add egg mixture; working quickly, swirl egg until egg sets against wok; when egg puffs, flip egg and cook other side briefly; remove from wok, and chop into small pieces.'),(4,1,4,'Heat 1 tbsp oil in wok; add selected meat to wok, along with carrots, peas, and cooked onion; stir-fry for 2 minutes.'),(5,1,5,'Add rice, green onions, and bean sprouts, tossing to mix well; stir-fry for 3 minutes.'),(6,1,6,'Add 2 tbsp of light soy sauce and chopped egg to rice mixture and fold in; stir-fry for 1 minute more; serve.'),(7,2,7,'Place avocado, cilantro, yogurt, scallions, garlic, lime juice, sugar and salt in a blender; blend until smooth.'),(8,2,8,'Place greens in an individual salad bowl; toss with 2 tablespoons of the dressing. (Refrigerate the remaining dressing.) Top the greens with black beans, corn and tomatoes.'),(9,10,1,'Slice the potatoes'),(10,12,1,'Make dough'),(11,13,1,'sift flower'),(12,13,2,'chill milk'),(13,14,1,'boil togethor until tender'),(14,15,1,'In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.'),(15,15,2,'Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'),(16,16,1,'In a cup or small bowl, whisk together the eggs, mayonnaise and water using a fork. Melt margarine in a skillet over low heat. Pour in the eggs, and stir constantly as they cook. Remove the eggs to a plate when they are set, but still moist. Do not over cook. Never add salt or pepper until eggs are on plate, but these are also good without.'),(17,16,2,'fry in pan'),(18,16,0,'serve hot'),(19,17,1,'Preheat oven to 350 degrees F. Generously coat a 9Ã13 baking dish with nonstick cooking spray.'),(20,17,2,'Add olive oil to a large skillet over high heat. When it just starts to smoke, carefully add bell peppers and onions and cook, stirring occasionally, until they are soft and slightly blackened around the edges. Remove to a plate and set aside.'),(21,17,3,'In the prepared dish, layer crescent rolls, ham, and salami. Beat the eggs with the salt and pepper and pour on top. Top with peppers and onions and cheese.'),(22,17,4,'Bake at 350 for 30 minutes.'),(23,18,1,'Place beans and lime juice in a small bowl; mash with the back of a spoon until almost smooth.'),(24,18,2,'Heat a large skillet over medium-high heat. Coat pan with cooking spray. Add eggs to pan. Cook, without stirring, until mixture sets on bottom. Draw a spatula across bottom of pan to form curds. Continue cooking, stirring occasionally, until egg is thickened but still moist. Remove from pan immediately.'),(25,18,3,'Spoon 2 tablespoons bean mixture, 2 1/2 tablespoons egg, 2 tablespoons Fresh Salsa, and 1 tablespoon cheese down center of each tortilla. Roll up. Recoat skillet with cooking spray. Place burritos in pan, and cook over medium heat 4 minutes or until lightly browned, turning occasionally. Garnish with lime wedges, if desired.'),(26,19,1,'Take a bowl, add the beans, garlic, green onions, hot peppers, eggs, flour, salt and mix everything together well. Read more at https://ifood.tv/asian/410430-korean-tofu-jeon#M5wEd1FqumHmDAuU.99'),(27,19,2,'In a heated and oiled pan, spread a spoonful of batter in a round shape. Fry them on medium high heat until both sides of the patties become golden brown.'),(28,19,3,'Serve warm as a finger food or a side dish'),(29,21,1,'Make tortillas, if you\'re using Homemade Tortillas.'),(30,21,2,'Marinate the steak: Spread the jalapenos in a baking dish and press the steak on top. Cover and set aside at room temperature, about 1 hour.'),(31,21,3,'Preheat a grill or grill pan to high. Brush the jalapenos off the steak, pat dry and season with salt and pepper. Grill the steak for 4 to 6 minutes per side for medium-rare. Let rest 10 minutes, then slice'),(32,21,4,'Assemble the tacos: For each taco, stack 2 tortillas and lay a few pieces of steak in the middle. Top with onion, salsa and cilantro. Top with lime wedges.');
/*!40000 ALTER TABLE `instruction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `profile_pic` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_user1_idx` (`user_id`),
  CONSTRAINT `fk_profile_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Nancy','Tran',25,NULL,'Denver',200.00,1),(2,'Chowder','Tran',4,NULL,'Denver',50.00,2),(3,'Paul','Pistorius',26,NULL,'Denver, Co',185.00,3);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `review` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_has_recipe_recipe1_idx` (`recipe_id`),
  KEY `fk_user_has_recipe_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_recipe_recipe1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_recipe_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,1,4,NULL),(2,5,1,4,'tasted super'),(3,5,1,0,NULL),(4,5,1,0,NULL);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(400) DEFAULT NULL,
  `source_url` varchar(400) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'https://static01.nyt.com/images/2016/04/04/dining/04COOKING-FRIEDRICE1/04COOKING-FRIEDRICE1-superJumbo.jpg','http://www.food.com/recipe/chinese-fried-rice-38748','Fried Rice'),(2,'http://carlsbadcravings.com/wp-content/uploads/2015/01/Southwest-Salad-with-Creamy-Avocado-Salsa-Dressing8.jpg','http://www.eatingwell.com/recipe/250230/southwestern-salad-with-black-beans/','Southwestern Salad'),(3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvHj5CCqy0opzVGwJ6Qk5QVxefcmf6ulrWlwy2jOMJJ9t5ANhdcg',NULL,'Peachy Pancakes'),(4,'http://www.shandongportland.com/wp/wp-content/uploads/2013/12/vegan-sesame_tofu-zoom.jpg',NULL,'Sesame Tofu'),(5,NULL,NULL,'Test'),(6,NULL,NULL,'Test'),(7,NULL,NULL,'TestRecipe'),(8,NULL,NULL,'Tacos'),(9,'www.yummo.com',NULL,'Spring Rolls'),(10,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI1Dnd34uam6BbT5umn9a6IDGm05vXzYHOI0ZoWzVW1sSvi1K0',NULL,'Fries'),(12,NULL,NULL,'Pizza'),(13,'https://pioneerwoman.files.wordpress.com/2017/03/homemade-cinnamon-raisin-bread-15.jpg',NULL,'raisin bread'),(14,'http://cdn-img.health.com/sites/default/files/styles/400x400/public/migration/images/gallery/eating/oatmeal-heart-400.jpg?itok=x5kFxvnc',NULL,'Oatmeal'),(15,'http://images.media-allrecipes.com/userphotos/720x405/3821005.jpg',NULL,'Good Old Fashioned Pancakes'),(16,'http://images.media-allrecipes.com/userphotos/720x405/4512134.jpg',NULL,'Scrambled Eggs Done Right'),(17,'http://www.kevinandamanda.com/whatsnew/wp-content/uploads/2015/03/Italian-Breakfast-Casserole-19.jpg',NULL,'Italian Breakfast Casserole'),(18,'http://cdn-image.myrecipes.com/sites/default/files/image/recipes/oh/12/mexican-breakfast-burritos-oh-x.jpg',NULL,'Mexican Breakfast Burrito'),(19,'http://aeriskitchen.com/wp-content/uploads/2010/11/butter_bean_jeon_08-.jpg',NULL,'Butter Bean Jeon'),(21,'http://food.fnr.sndimg.com/content/dam/images/food/fullset/2010/3/25/0/FNM_050110-Try-This-At-Home-138_s4x3.jpg.rend.hgtvcom.616.462.suffix/1499012483883.jpeg',NULL,'Carne Asada Tacos');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredient`
--

DROP TABLE IF EXISTS `recipe_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recipe_has_ingredient_ingredient1_idx` (`ingredient_id`),
  KEY `fk_recipe_has_ingredient_recipe1_idx` (`recipe_id`),
  CONSTRAINT `fk_recipe_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_ingredient_recipe1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredient`
--

LOCK TABLES `recipe_ingredient` WRITE;
/*!40000 ALTER TABLE `recipe_ingredient` DISABLE KEYS */;
INSERT INTO `recipe_ingredient` VALUES (1,1,1,'3/4 cup'),(2,1,2,'4 cups'),(3,1,3,'1'),(4,1,4,'2 teaspoons'),(5,1,5,'8 ounces'),(6,1,6,'1/2 cup'),(7,2,7,'3 cups'),(8,2,8,'3/4 cup'),(9,9,9,'2 lbs'),(10,10,10,'2 lbs'),(13,12,13,'2'),(14,12,14,'2'),(15,13,15,'2 Cups'),(16,13,16,'3 cups'),(17,14,17,'1 Cup'),(18,14,18,'1/4 cup'),(19,15,19,'1 1/2 cups'),(20,15,20,'3 1/2'),(21,15,21,'1 teaspoon'),(22,15,22,'1 tablespoon'),(23,16,23,'2'),(24,16,24,'1 teaspoon'),(25,16,25,'1 teaspoon'),(26,16,26,'1 teaspoon'),(27,16,27,'1 dash'),(28,17,28,'1 tablespoon'),(29,17,29,'2 cups'),(30,17,30,'1 (8 oz)'),(31,17,31,'8 slices'),(32,17,32,'15'),(33,17,33,'8'),(34,17,34,'1 dahs'),(35,17,35,'1 cup'),(36,18,36,'1'),(37,18,37,'2'),(38,18,38,'1 can'),(39,18,39,'6'),(40,18,40,'8 (8-inch) flour tortillas'),(41,18,41,'1 cup'),(42,18,42,'2 ounces'),(43,18,43,'2'),(44,19,44,'2'),(45,19,45,'16 ounch'),(46,19,46,'1/4 cup'),(47,19,47,'2 tblspn'),(48,19,48,'1/2 tablespoon'),(49,19,49,'1 tablespoon'),(50,19,50,'1/2 teaspoon'),(51,19,51,'4 tablespoon'),(58,21,58,'One (12-ounce)'),(59,21,59,'1 3/4-pound'),(60,21,60,'1 pinch'),(61,21,61,'1/2'),(62,21,62,'1/2'),(63,21,63,'4'),(64,21,64,'2 to 4'),(65,21,65,'2');
/*!40000 ALTER TABLE `recipe_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_tag`
--

DROP TABLE IF EXISTS `recipe_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recipe_has_tag_tag1_idx` (`tag_id`),
  KEY `fk_recipe_has_tag_recipe_idx` (`recipe_id`),
  CONSTRAINT `fk_recipe_has_tag_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_tag_tag1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_tag`
--

LOCK TABLES `recipe_tag` WRITE;
/*!40000 ALTER TABLE `recipe_tag` DISABLE KEYS */;
INSERT INTO `recipe_tag` VALUES (1,1,1),(2,2,2),(3,13,1),(4,14,4),(5,15,4),(6,16,5),(7,17,4),(8,18,8),(9,19,2),(11,21,8);
/*!40000 ALTER TABLE `recipe_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `selected` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'User-submitted',NULL),(2,'Asian',NULL),(3,'Vegetarian',NULL),(4,'breakfast',NULL),(5,'American',NULL),(6,'Low calorie',NULL),(7,'Italian',NULL),(8,'Mexican',NULL),(9,'Korean',NULL),(11,'Lunch',NULL);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_ingredient`
--

DROP TABLE IF EXISTS `tag_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tag_has_ingredient_ingredient1_idx` (`ingredient_id`),
  KEY `fk_tag_has_ingredient_tag1_idx` (`tag_id`),
  CONSTRAINT `fk_tag_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_has_ingredient_tag1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_ingredient`
--

LOCK TABLES `tag_ingredient` WRITE;
/*!40000 ALTER TABLE `tag_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(400) DEFAULT NULL,
  `password` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nancy@test.com','password'),(2,'chowman@test.com','pw123'),(3,'nancy2@test.com','$2a$10$5Pq4z7SMRHWpqsasf1Etu.pp1HEWMlN/gjRVLi2Xovx8ViJKKFDhe'),(4,'nancy3@test.com','$2a$10$9dy9ensRN2mXmhxP6/UUruFl3rK37t0hJALNW9jQ5vn.F4/6ryCNO'),(5,'ryan@ryan.com','$2a$10$JWuCrpHVy41CKm.7zeceX.F6Gi8XNOms6/0Tqko1F3zcsFazKq0JG');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-18 13:20:30
