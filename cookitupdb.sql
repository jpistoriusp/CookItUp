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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(400) NULL DEFAULT NULL,
  `password` VARCHAR(400) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(400) NULL DEFAULT NULL,
  `source_url` VARCHAR(400) NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `favorite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite` ;

CREATE TABLE IF NOT EXISTS `favorite` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL DEFAULT NULL,
  `recipe_id` INT(11) NULL DEFAULT NULL,
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
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ingredient` ;

CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instruction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instruction` ;

CREATE TABLE IF NOT EXISTS `instruction` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` INT(11) NULL DEFAULT NULL,
  `step_number` INT(11) NULL DEFAULT NULL,
  `text` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `recipe_id_idx` (`recipe_id` ASC),
  CONSTRAINT `recipe_id`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile` ;

CREATE TABLE IF NOT EXISTS `profile` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `age` INT(11) NULL DEFAULT NULL,
  `profile_pic` VARCHAR(45) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `weight` DECIMAL(5,2) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_profile_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `recipe_id` INT(11) NOT NULL,
  `value` INT(11) NULL DEFAULT NULL,
  `review` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_has_recipe_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_user_has_recipe_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_recipe_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `recipe_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_ingredient` ;

CREATE TABLE IF NOT EXISTS `recipe_ingredient` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` INT(11) NOT NULL,
  `ingredient_id` INT(11) NOT NULL,
  `quantity` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_has_ingredient_ingredient1_idx` (`ingredient_id` ASC),
  INDEX `fk_recipe_has_ingredient_recipe1_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_recipe_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_ingredient_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag` ;

CREATE TABLE IF NOT EXISTS `tag` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `recipe_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_tag` ;

CREATE TABLE IF NOT EXISTS `recipe_tag` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` INT(11) NOT NULL,
  `tag_id` INT(11) NOT NULL,
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
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

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
INSERT INTO `user` (`id`, `email`, `password`) VALUES (1, 'a@a.com', '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `recipe` (`id`, `image_url`, `source_url`, `title`) VALUES (1, 'https://static01.nyt.com/images/2016/04/04/dining/04COOKING-FRIEDRICE1/04COOKING-FRIEDRICE1-superJumbo.jpg', 'http://www.food.com/recipe/chinese-fried-rice-38748', 'Fried Rice');
INSERT INTO `recipe` (`id`, `image_url`, `source_url`, `title`) VALUES (2, 'http://carlsbadcravings.com/wp-content/uploads/2015/01/Southwest-Salad-with-Creamy-Avocado-Salsa-Dressing8.jpg', 'http://www.eatingwell.com/recipe/250230/southwestern-salad-with-black-beans/', 'Southwestern Salad');
INSERT INTO `recipe` (`id`, `image_url`, `source_url`, `title`) VALUES (3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvHj5CCqy0opzVGwJ6Qk5QVxefcmf6ulrWlwy2jOMJJ9t5ANhdcg', NULL, 'Peachy Pancakes');
INSERT INTO `recipe` (`id`, `image_url`, `source_url`, `title`) VALUES (4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI1Dnd34uam6BbT5umn9a6IDGm05vXzYHOI0ZoWzVW1sSvi1K0', NULL, 'Fries');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `cookitupdb`;
INSERT INTO `rating` (`id`, `user_id`, `recipe_id`, `value`, `review`) VALUES (1, 1, 1, 4, 'Delicious!!!');
INSERT INTO `rating` (`id`, `user_id`, `recipe_id`, `value`, `review`) VALUES (2, 1, 1, 3, 'Not Bad!');
INSERT INTO `rating` (`id`, `user_id`, `recipe_id`, `value`, `review`) VALUES (3, 1, 1, 3, 'Tasty!');
INSERT INTO `rating` (`id`, `user_id`, `recipe_id`, `value`, `review`) VALUES (4, 1, 2, 1, 'Yuck!');
INSERT INTO `rating` (`id`, `user_id`, `recipe_id`, `value`, `review`) VALUES (5, 1, 2, 5, 'Loved it!');
INSERT INTO `rating` (`id`, `user_id`, `recipe_id`, `value`, `review`) VALUES (6, 1, 2, 2, 'Garbage');
INSERT INTO `rating` (`id`, `user_id`, `recipe_id`, `value`, `review`) VALUES (7, 1, 3, 4, 'So Good');
INSERT INTO `rating` (`id`, `user_id`, `recipe_id`, `value`, `review`) VALUES (8, 1, 3, 5, 'Great');
INSERT INTO `rating` (`id`, `user_id`, `recipe_id`, `value`, `review`) VALUES (9, 1, 3, 4, 'Yum!');

COMMIT;

