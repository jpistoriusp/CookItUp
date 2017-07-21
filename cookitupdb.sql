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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Onion'),(2,'Rice'),(3,'Egg'),(4,'Soy Sauce'),(5,'Chicken'),(6,'Carrot'),(7,'Lettuce'),(8,'Black Beans'),(31,'Corn'),(32,'Canola oil'),(33,'Tomatoes'),(34,'Salt'),(35,'Garlic'),(36,'Olive Oil'),(37,'Bell peppers'),(38,'Crescent Rolls'),(39,'Ham'),(40,'Salami'),(41,'Eggs'),(42,'Cheese'),(43,'Milk'),(44,'Butter'),(45,'Active Dry Yeast'),(46,'Flour'),(47,'Sugar'),(48,'Cinnamon'),(49,'Walnuts'),(50,'Rolled Oats'),(51,'Oat Bran'),(52,'Nutmeg'),(53,'Baking Powder'),(54,'Vanilla Extract'),(55,'Maple Syrup'),(56,'Butter Beans'),(57,'Red Hot Pepper'),(58,'Green Onion'),(59,'test'),(60,'fdasf'),(61,'fdasfa'),(62,'fdasfas'),(63,'Lean ground beef'),(64,'Medium onion'),(65,'Creamy celery soup'),(66,'Frozen tater tots'),(67,'Cheddar cheese'),(68,'Cornstarch'),(69,'All-purpose flour'),(70,'Fresh ground pepper'),(71,'Chicken breast'),(72,'Ginger'),(73,'Apple cider vinegar'),(74,'Sweet chili sauce'),(75,'Brown sugar'),(76,'Green onions'),(77,'White rice'),(78,'Salmon fillet'),(79,'extra-virgin olive oil'),(80,'parsley'),(81,'parmesan'),(82,'freshly ground black pepper'),(83,'graham cracker crumbs'),(84,'confectioners\' sugar'),(85,'peanut butter'),(86,'milk chocolate chips'),(87,'vegetable oil'),(88,'water'),(89,'vegetable oil');
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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruction`
--

LOCK TABLES `instruction` WRITE;
/*!40000 ALTER TABLE `instruction` DISABLE KEYS */;
INSERT INTO `instruction` VALUES (1,1,1,'Heat 1 tbsp oil in wok; add chopped onions and stir-fry until onions turn a nice brown color, about 8-10 minutes; remove from wok.'),(2,1,2,'Mix egg with 3 drops of soy and 3 drops of sesame oil; set aside.'),(3,1,3,'Add 1/2 tbsp oil to wok, swirling to coat surfaces; add egg mixture; working quickly, swirl egg until egg sets against wok; when egg puffs, flip egg and cook other side briefly; remove from wok, and chop into small pieces.'),(4,1,4,'Heat 1 tbsp oil in wok; add selected meat to wok, along with carrots, peas, and cooked onion; stir-fry for 2 minutes.'),(5,1,5,'Add rice, green onions, and bean sprouts, tossing to mix well; stir-fry for 3 minutes.'),(6,1,6,'Add 2 tbsp of light soy sauce and chopped egg to rice mixture and fold in; stir-fry for 1 minute more; serve.'),(7,2,7,'Place avocado, cilantro, yogurt, scallions, garlic, lime juice, sugar and salt in a blender; blend until smooth.'),(8,2,8,'Place greens in an individual salad bowl; toss with 2 tablespoons of the dressing. (Refrigerate the remaining dressing.) Top the greens with black beans, corn and tomatoes.'),(29,29,1,'In a large skillet, saute corn in 1 tablespoon oil until lightly browned.'),(30,30,1,'Preheat oven to 350 degrees F. Generously coat a 9Ã13 baking dish with nonstick cooking spray.'),(31,30,2,'Add olive oil to a large skillet over high heat. When it just starts to smoke, carefully add bell peppers and onions and cook, stirring occasionally, until they are soft and slightly blackened around the edges. Remove to a plate and set aside.'),(32,30,3,'In the prepared dish, layer crescent rolls, ham, and salami. Beat the eggs with the salt and pepper and pour on top. Top with peppers and onions and cheese.'),(33,30,4,'Bake at 350 for 30 minutes.'),(34,31,1,'Melt butter with milk. Heat until very warm, but don\'t boil. Allow to cool until still warm to the touch, but not hot. Sprinkle yeast over the top, stir gently, and allow to sit for 10 minutes.'),(35,31,2,'Combine flour and salt.'),(36,31,3,'In the bowl of an electric mixer, mix sugar and eggs with the paddle attachment until combined. Pour in milk/butter/yeast mixture and stir to combine. Add half the flour and beat on medium speed until combined. Add the other half and beat until combined.'),(37,31,4,'Switch to the dough hook attachment and beat/knead dough on medium speed for ten minutes. If dough is overly sticky, add 1/4 cup flour and beat again for 5 minutes.'),(38,31,5,'Heat a metal or glass mixing bowl so it\'s warm. Drizzle in a little canola oil, then toss the dough in the oil to coat. Cover bowl in plastic wrap and set it in a warm, hospitable place for at least 2 hours.'),(39,31,6,'Turn dough out onto the work surface. Roll into a neat rectangle no wider than the loaf pan you\'re going to use, and about 18 to 24 inches long. Smear with 2 tablespoons melted butter. Mix sugar and cinnamon together, then sprinkle evenly over the butter-smeared dough. Starting at the far end, roll dough toward you, keeping it tight and contained. Pinch seam to seal.'),(40,31,7,'Smear loaf pan with softened butter. Place dough, seam down, in the pan. Cover with plastic wrap and allow to rise for 2 hours.'),(41,31,8,'Preheat oven to 350 degrees.'),(42,31,9,'Mix a little egg with milk, and smear over the top. Bake for 40 minutes on a middle/lower rack in the oven.'),(43,31,10,'Remove from the pan and allow bread to cool. Slice and serve, or make cinnamon toast or French toast with it.'),(44,32,1,'Preheat oven to 350 degrees F. Lightly brush 2-qt. casserole dish with melted butter.'),(45,32,2,'In small sautÃ© pan over medium-low heat, cook walnuts until lightly toasted, about 3 to 5 minutes. (Watch so they donât burn!)Set aside to cool.'),(46,32,3,'In large bowl, combine oats, oat bran, cinnamon, nutmeg, baking powder, salt and walnuts. In separate bowl, combine milk, egg, butter, vanilla and maple syrup. Whisk until egg is incorporated.'),(47,32,4,'Pour wet ingredients into dry, add toasted walnuts and stir until combined. Pour mixture into prepared dish and top with candied walnut halves.'),(48,32,5,'Bake for 35 minutes, until oatmeal springs back lightly when gently pressed. Serve warm with fresh fruit and dollop of vanilla yogurt.'),(49,32,6,'For candied maple walnuts: Cook walnut halves in small sautÃ© pan over medium low heat for 3 minutes, until warmed through.'),(50,32,7,'Add maple syrup and salt and continue to cook until syrup has evaporated, about 3 more minutes. Remove from heat and cool.'),(51,33,1,'Obtain 1 can (16 oz) of butter beans. You should get about 1 cup. Drain the liquid from the can. You can use different kinds of beans, but for the pretty color, I picked these light colored beans instead of darker colored beans.'),(52,33,2,'Finely chop the beans, 2 Tbsp of garlic, Â½ Tbsp of red hot pepper, and 1 Tbsp of green onion.'),(53,33,3,'Add the beans, vegetables, 2 eggs, Â¼ cup of flour, and Â½ tsp of salt in a mixing bowl.'),(54,33,4,'Mix everything together.'),(55,33,5,'In a heated and generously oiled pan, spread a small spoonful of the batter in a round shape.'),(56,33,6,'Fry them on medium-high until both sides of the patties become golden brown.'),(64,41,1,'Preheat oven to 350 degrees.'),(65,41,2,'Brown ground beef.'),(66,41,3,'Saute onion.'),(67,41,4,'In a casserole dish, combine ground beef, sauteed onion, cream of celery soup.'),(68,41,5,'Top mixture with tater tots.'),(69,41,6,'Sprinkle shredded cheddar cheese over top of tater tots.'),(70,41,7,'Bake in oven for 30-40 minutes.'),(71,42,1,'Set up dredging station: In one bowl add eggs, and in a second bowl mix together 1/2 cup cornstarch, flour, salt, and pepper. Coat chicken pieces in egg, then toss in cornstarch mixture, making sure to tap off any excess.'),(72,42,2,'In a large, deep skillet over medium-high heat, heat 1/4â oil. Once oil is shimmering, fry chicken in batches until golden and crispy, 4 to 5 minutes. Drain on paper towels.'),(73,42,3,'In a small saucepan over medium heat, heat 1 tablespoon canola oil. Add garlic, ginger, and chili flakes and cook until fragrant, about 2 minutes. Whisk in orange juice, soy sauce, apple cider vinegar, chili sauce, and brown sugar. Bring to a simmer.'),(74,42,4,'Meanwhile, in a small bowl, make cornstarch slurry: Mix remaining tablespoon cornstarch with 2 tablespoons water. Slowly whisk slurry into sauce to thicken, and bring back to a simmer. Once sauce starts to look syrupy, about 5 minutes, remove from heat.'),(75,42,5,'Toss chicken with sauce and green onions. Serve over white rice.'),(76,43,1,'Preheat oven to 400Âº and spray a piece of aluminum foil with cooking spray. In a small bowl, mix together oil, parsley, Parmesan, and garlic and season with salt and pepper.'),(77,43,2,'Place salmon on foil on a large rimmed baking sheet and brush garlic mixture all over salmon.'),(78,43,3,'Cover with foil and bake until salmon is cooked through, 15 to 20 minutes.'),(79,43,4,'Sprinkle with more Parmesan and serve.'),(80,44,1,'Combine graham crumbs, sugar and peanut butter and mix well.'),(81,44,2,'Blend in melted butter until well combined.'),(82,44,3,'Press mixture evenly into a 9 x 13 inch pan.'),(83,44,4,'Melt chocolate chips in microwave or in double boiler.'),(84,44,5,'Spread over peanut butter mixture.'),(85,44,0,'Chill until just set and cut into bars (these are very hard to cut if the chocolate gets \"rock hard\".'),(86,45,1,'Make the sauce by heating 2 tsp of vegetable oil in a medium saucepan over med/low heat.'),(87,45,2,'Add ginger and garlic to the pan and quickly add the soy sauce and water before the garlic scorches.'),(88,45,3,'Dissolve the brown sugar in the sauce, then raise the heat to about medium and boil the sauce for 2-3 minutes or until the sauce thickens.'),(89,45,4,'Slice the flank steak against the grain into 1/4\" thick bite-size slices (Tilt the blade of your knife at about a forty five degree angle to the top of the steak so that you get wider cuts).'),(90,45,5,'Dip the steak pieces into the cornstarch to apply a very thin dusting to both sides of each piece of beef.'),(91,45,6,'Let the beef sit for about 10 minutes so that the cornstarch sticks.'),(92,45,7,'As the beef sits, heat up one cup of oil in a wok (you may also use a skillet for this step as long as the beef will be mostly covered with oil).'),(93,45,8,'Heat the oil over medium heat until it\'s nice and hot, but not smoking.'),(94,45,9,'Add the beef to the oil and sautÃ© for just two minutes, or until the beef just begins to darken on the edges.'),(95,45,10,'You don\'t need a thorough cooking here since the beef is going to go back on the heat later. Stir the meat around a little so that it cooks evenly.'),(96,45,11,'After a couple minutes, use a large slotted spoon to take the meat out and onto paper towels, then pour the oil out of the wok or skillet. Put the pan back over the heat, dump the meat back into it and simmer for one minute.'),(97,45,12,'Add the sauce, cook for one minute while stirring, then add all the green onions. Cook for one more minute, then remove the beef and onions with tongs or a slotted spoon to a serving plate.');
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
  `profile_pic` varchar(255) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_user1_idx` (`user_id`),
  CONSTRAINT `fk_profile_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,1,4,NULL),(2,5,1,2,'Yummo'),(3,5,2,4,'Yummilicious'),(4,5,2,0,'Boo'),(5,5,2,0,'Boo'),(6,6,30,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'https://static01.nyt.com/images/2016/04/04/dining/04COOKING-FRIEDRICE1/04COOKING-FRIEDRICE1-superJumbo.jpg','http://www.food.com/recipe/chinese-fried-rice-38748','Fried Rice'),(2,'http://carlsbadcravings.com/wp-content/uploads/2015/01/Southwest-Salad-with-Creamy-Avocado-Salsa-Dressing8.jpg','http://www.eatingwell.com/recipe/250230/southwestern-salad-with-black-beans/','Southwestern Salad'),(29,'https://cdn2.tmbi.com/TOH/Images/Photos/37/300x300/Veggie-Bean-Tacos_exps112757_THHC1998108B03_23_RMS.jpg',NULL,'Veggie Bean Tacos'),(30,'http://www.kevinandamanda.com/whatsnew/wp-content/uploads/2015/03/Italian-Breakfast-Casserole-19.jpg',NULL,'Italian Breakfast Casserole'),(31,'https://pioneerwoman.files.wordpress.com/2017/03/homemade-cinnamon-raisin-bread-15.jpg',NULL,'Cinnamon Bread'),(32,'http://del.h-cdn.co/assets/15/38/980x490/landscape-1442416186-lidey-table-oatmeal-bowl.JPG',NULL,'Maple Walnut Baked Oatmeal'),(33,'http://aeriskitchen.com/wp-content/uploads/2010/11/butter_bean_jeon_01-.jpg',NULL,'Butter Bean Jeon'),(41,'http://img.sndimg.com/food/image/upload/h_357,w_477,c_fit/v1/img/recipes/27/11/7/ghAcYlKTmG1ffiUcXakm_THE%20FOOD%20GAYS%20-%20TATER%20TOT%20BAKE-3.jpg',NULL,'Tater Tots Casserole'),(42,'http://del.h-cdn.co/assets/17/15/640x959/gallery-1492200404-delish-sticky-orange-chicken-pin-1.jpg',NULL,'Sticky Orange Chicken'),(43,'https://therecipecritic.com/wp-content/uploads/2015/10/salmon11.jpg',NULL,'Garlic Parmesan Salmon'),(44,'http://img.sndimg.com/food/image/upload/h_357,w_477,c_fit/v1/img/recipes/29/67/9/J1stgzFRTqkYn2HpK1Kn_RS%207%20-%20final_4.jpg',NULL,'Reeses Squares'),(45,'http://pictures.food.com/api/file/zIE9mDxhTQi3r5IPmmVP-134-mongolian-beef.jpg/convert?loc=/pictures.food.com/recipes/66/12/1/ccVGjLhRaa08MpeL42x9_134+mongolian+beef.jpg&width=477&height=357&fit=crop&flags=progressive&quality=95',NULL,'Mongolian Beef');
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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredient`
--

LOCK TABLES `recipe_ingredient` WRITE;
/*!40000 ALTER TABLE `recipe_ingredient` DISABLE KEYS */;
INSERT INTO `recipe_ingredient` VALUES (1,1,1,'3/4 cup'),(2,1,2,'4 cups'),(3,1,3,'1'),(4,1,4,'2 teaspoons'),(5,1,5,'8 ounces'),(6,1,6,'1/2 cup'),(7,2,7,'3 cups'),(8,2,8,'3/4 cup'),(32,29,31,'2 cups'),(33,29,32,'2 tablespoons'),(34,29,33,'4 medium'),(35,29,8,'1 cup'),(36,29,1,'1 large'),(37,29,34,'1/2 teaspoon'),(38,29,35,'3 cloves'),(39,30,36,'1 tablespoon'),(40,30,37,'2 cups'),(41,30,38,'8 oz'),(42,30,39,'8 slices'),(43,30,40,'15 slices'),(44,30,41,'8'),(45,30,42,'1 cup'),(46,31,43,'1 cup'),(47,31,44,'6 Tablespoons'),(48,31,45,'2-1/2 teaspoons'),(49,31,41,'2'),(50,31,46,'3-1/2 cups'),(51,31,34,'1 teaspoon'),(52,31,47,'1/3 cup'),(53,31,48,'2 Tablespoons'),(54,32,44,'3 tbsp'),(55,32,49,'3/4 cup'),(56,32,50,'1-1/2 cups'),(57,32,51,'3/4 cup'),(58,32,48,'2 tsp'),(59,32,52,'1/8'),(60,32,53,'1 tsp'),(61,32,34,'1/2 tsp'),(62,32,3,'1'),(63,32,54,'1 tsp'),(64,32,55,'1/3 cup'),(65,33,56,'1 can'),(66,33,41,'2'),(67,33,46,'1/4 cup'),(68,33,35,'2 tbsp'),(69,33,57,'1/2 tbsp'),(70,33,58,'1 tbsp'),(71,33,34,'1/2 tsp'),(79,41,63,'1 lb'),(80,41,64,'1/2'),(81,41,65,'1 can'),(82,41,66,'1 bag'),(83,41,67,'1 cup'),(84,42,41,'2'),(85,42,68,'1/2 cup'),(86,42,69,'1/4'),(87,42,34,'1 tsp'),(88,42,70,'1 tsp'),(89,42,71,'2 lb'),(90,42,32,NULL),(91,42,35,'2 cloves'),(92,42,72,'1/2 tsp'),(93,42,4,'2 tbsp'),(94,42,73,'1 tbsp'),(95,42,74,'1 tbsp'),(96,42,75,'1 tbsp'),(97,42,76,'2'),(98,42,77,'2 cups'),(99,43,78,'2-3 lb'),(100,43,79,'1 tbsp'),(101,43,80,'1 tbsp'),(102,43,81,'1/4 cup'),(103,43,35,'4 cloves'),(104,43,34,'1 tbsp'),(105,43,82,'1 tbsp'),(106,44,83,'1 1/2 cups'),(107,44,84,'1 lb'),(108,44,85,'1 1/2 cups'),(109,44,44,'1 cup'),(110,44,86,'12 oz'),(111,45,87,'2 tsp'),(112,45,72,'1/2 tsp'),(113,45,35,'1 tbsp'),(114,45,4,'1/2 cup'),(115,45,88,'1/2 cup'),(116,45,75,'3/4 cup'),(117,45,89,'1 cup'),(118,45,68,'1/4 cup'),(119,45,58,'2');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_tag`
--

LOCK TABLES `recipe_tag` WRITE;
/*!40000 ALTER TABLE `recipe_tag` DISABLE KEYS */;
INSERT INTO `recipe_tag` VALUES (1,1,1),(2,2,2),(15,29,2),(16,30,8),(17,31,4),(18,32,8),(19,33,1),(21,41,10),(22,42,10),(23,43,5),(24,44,4),(25,45,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Asian',NULL),(2,'Vegetarian',NULL),(4,'Dessert',NULL),(5,'Gluten Free',NULL),(8,'Breakfast',NULL),(9,'User-submitted',NULL),(10,'Dinner',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nancy@test.com','password'),(2,'chowman@test.com','pw123'),(3,'nancy2@test.com','$2a$10$5Pq4z7SMRHWpqsasf1Etu.pp1HEWMlN/gjRVLi2Xovx8ViJKKFDhe'),(4,'nancy3@test.com','$2a$10$9dy9ensRN2mXmhxP6/UUruFl3rK37t0hJALNW9jQ5vn.F4/6ryCNO'),(5,'nancy@numberone.com','$2a$10$d5R61JhyUCXDyy7y9Cy8P.9AmQPjy29KLsCOPBc2q9M53Ox/wS9SK'),(6,'yummo@test.com','$2a$10$R/AMTlZnogUM8dvrnMbAfeMQRwLJRvZqEEdMMYV.jI2852910mouS'),(7,'yummo@test.co','$2a$10$.f1w.0GX97E1vlGk7PgUBeEfDNMDM4CHqjASIiFbjVUlZNO5VgGh2');
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

-- Dump completed on 2017-07-19 16:01:52
