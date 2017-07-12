-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cookitupdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cookitupdb` ;

-- -----------------------------------------------------
-- Schema cookitupdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cookitupdb` DEFAULT CHARACTER SET utf8 ;
USE `cookitupdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(400) NULL,
  `password` VARCHAR(400) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(400) NULL,
  `source_url` VARCHAR(400) NULL,
  `title` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile` ;

CREATE TABLE IF NOT EXISTS `profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `age` INT NULL,
  `profile_pic` VARCHAR(255) NULL,
  `location` VARCHAR(45) NULL,
  `weight` DECIMAL(5,2) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_profile_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag` ;

CREATE TABLE IF NOT EXISTS `tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ingredient` ;

CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_tag` ;

CREATE TABLE IF NOT EXISTS `recipe_tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `recipe_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_has_tag_tag1_idx` (`tag_id` ASC),
  INDEX `fk_recipe_has_tag_recipe_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_recipe_has_tag_recipe`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag_ingredient` ;

CREATE TABLE IF NOT EXISTS `tag_ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tag_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  INDEX `fk_tag_has_ingredient_ingredient1_idx` (`ingredient_id` ASC),
  INDEX `fk_tag_has_ingredient_tag1_idx` (`tag_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tag_has_ingredient_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_ingredient` ;

CREATE TABLE IF NOT EXISTS `recipe_ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `recipe_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  `quantity` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_has_ingredient_ingredient1_idx` (`ingredient_id` ASC),
  INDEX `fk_recipe_has_ingredient_recipe1_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_recipe_has_ingredient_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  `value` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_has_recipe_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_user_has_recipe_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_recipe_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instruction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instruction` ;

CREATE TABLE IF NOT EXISTS `instruction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `recipe_id` INT NULL,
  `step_number` INT NULL,
  `text` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `recipe_id_idx` (`recipe_id` ASC),
  CONSTRAINT `recipe_id`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite` ;

CREATE TABLE IF NOT EXISTS `favorite` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `recipe_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `recipe_id_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_user_has_favorite`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_recipe`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO cooker;
 DROP USER cooker;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'cooker' IDENTIFIED BY 'cooker';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'cooker';
GRANT SELECT, INSERT, TRIGGER ON TABLE * TO 'cooker';
GRANT ALL ON * TO 'cooker';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `user` (`id`, `email`, `password`) VALUES (1, 'nancy@test.com', 'password');
INSERT INTO `user` (`id`, `email`, `password`) VALUES (2, 'chowman@test.com', 'pw123');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `recipe` (`id`, `image_url`, `source_url`, `title`) VALUES (1, 'http://pictures.food.com/api/file/gpcRqESQQZGx9GUrVljG-IMG_0704.jpg/convert?loc=/pictures.food.com/recipes/38/74/8/uXUajHqyRq0TEyO7rfDX_IMG_0704.jpg&width=560&height=420&fit=crop&flags=progressive&quality=95', 'http://www.food.com/recipe/chinese-fried-rice-38748', 'Fried Rice');
INSERT INTO `recipe` (`id`, `image_url`, `source_url`, `title`) VALUES (2, 'data:image/jpeg;base64,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', 'http://www.eatingwell.com/recipe/250230/southwestern-salad-with-black-beans/', 'Southwestern Salad');

COMMIT;


-- -----------------------------------------------------
-- Data for table `profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `profile` (`id`, `first_name`, `last_name`, `age`, `profile_pic`, `location`, `weight`, `user_id`) VALUES (1, 'Nancy', 'Tran', 25, NULL, 'Denver', 200, 1);
INSERT INTO `profile` (`id`, `first_name`, `last_name`, `age`, `profile_pic`, `location`, `weight`, `user_id`) VALUES (2, 'Chowder', 'Tran', 4, NULL, 'Denver', 50, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `tag` (`id`, `name`) VALUES (1, 'Asian');
INSERT INTO `tag` (`id`, `name`) VALUES (2, 'Vegetarian');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `ingredient` (`id`, `name`) VALUES (1, 'Onion');
INSERT INTO `ingredient` (`id`, `name`) VALUES (2, 'Rice');
INSERT INTO `ingredient` (`id`, `name`) VALUES (3, 'Egg');
INSERT INTO `ingredient` (`id`, `name`) VALUES (4, 'Soy Sauce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (5, 'Chicken');
INSERT INTO `ingredient` (`id`, `name`) VALUES (6, 'Carrot');
INSERT INTO `ingredient` (`id`, `name`) VALUES (7, 'Lettuce');
INSERT INTO `ingredient` (`id`, `name`) VALUES (8, 'Black Beans');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `recipe_tag` (`id`, `recipe_id`, `tag_id`) VALUES (1, 1, 1);
INSERT INTO `recipe_tag` (`id`, `recipe_id`, `tag_id`) VALUES (2, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `recipe_ingredient` (`id`, `recipe_id`, `ingredient_id`, `quantity`) VALUES (1, 1, 1, '3/4 cup');
INSERT INTO `recipe_ingredient` (`id`, `recipe_id`, `ingredient_id`, `quantity`) VALUES (2, 1, 2, '4 cups');
INSERT INTO `recipe_ingredient` (`id`, `recipe_id`, `ingredient_id`, `quantity`) VALUES (3, 1, 3, '1');
INSERT INTO `recipe_ingredient` (`id`, `recipe_id`, `ingredient_id`, `quantity`) VALUES (4, 1, 4, '2 teaspoons');
INSERT INTO `recipe_ingredient` (`id`, `recipe_id`, `ingredient_id`, `quantity`) VALUES (5, 1, 5, '8 ounces');
INSERT INTO `recipe_ingredient` (`id`, `recipe_id`, `ingredient_id`, `quantity`) VALUES (6, 1, 6, '1/2 cup');
INSERT INTO `recipe_ingredient` (`id`, `recipe_id`, `ingredient_id`, `quantity`) VALUES (7, 2, 7, '3 cups');
INSERT INTO `recipe_ingredient` (`id`, `recipe_id`, `ingredient_id`, `quantity`) VALUES (8, 2, 8, '3/4 cup');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `rating` (`id`, `user_id`, `recipe_id`, `value`) VALUES (1, 1, 1, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `instruction`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `instruction` (`id`, `recipe_id`, `step_number`, `text`) VALUES (1, 1, 1, 'Heat 1 tbsp oil in wok; add chopped onions and stir-fry until onions turn a nice brown color, about 8-10 minutes; remove from wok.');
INSERT INTO `instruction` (`id`, `recipe_id`, `step_number`, `text`) VALUES (2, 1, 2, 'Mix egg with 3 drops of soy and 3 drops of sesame oil; set aside.');
INSERT INTO `instruction` (`id`, `recipe_id`, `step_number`, `text`) VALUES (3, 1, 3, 'Add 1/2 tbsp oil to wok, swirling to coat surfaces; add egg mixture; working quickly, swirl egg until egg sets against wok; when egg puffs, flip egg and cook other side briefly; remove from wok, and chop into small pieces.');
INSERT INTO `instruction` (`id`, `recipe_id`, `step_number`, `text`) VALUES (4, 1, 4, 'Heat 1 tbsp oil in wok; add selected meat to wok, along with carrots, peas, and cooked onion; stir-fry for 2 minutes.');
INSERT INTO `instruction` (`id`, `recipe_id`, `step_number`, `text`) VALUES (5, 1, 5, 'Add rice, green onions, and bean sprouts, tossing to mix well; stir-fry for 3 minutes.');
INSERT INTO `instruction` (`id`, `recipe_id`, `step_number`, `text`) VALUES (6, 1, 6, 'Add 2 tbsp of light soy sauce and chopped egg to rice mixture and fold in; stir-fry for 1 minute more; serve.');
INSERT INTO `instruction` (`id`, `recipe_id`, `step_number`, `text`) VALUES (7, 2, 7, 'Place avocado, cilantro, yogurt, scallions, garlic, lime juice, sugar and salt in a blender; blend until smooth.');
INSERT INTO `instruction` (`id`, `recipe_id`, `step_number`, `text`) VALUES (8, 2, 8, 'Place greens in an individual salad bowl; toss with 2 tablespoons of the dressing. (Refrigerate the remaining dressing.) Top the greens with black beans, corn and tomatoes.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `favorite` (`id`, `user_id`, `recipe_id`) VALUES (1, 1, 1);
INSERT INTO `favorite` (`id`, `user_id`, `recipe_id`) VALUES (2, 1, 2);

COMMIT;

