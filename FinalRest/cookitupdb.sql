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
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL,
  `image_url` VARCHAR(400) NULL,
  `source_url` VARCHAR(400) NULL,
  `f2f_url` VARCHAR(400) NULL,
  `recipe_id` INT NULL,
  `title` VARCHAR(45) NULL,
  `publisher` VARCHAR(45) NULL,
  `publisher_url` VARCHAR(45) NULL,
  `social_rank` VARCHAR(45) NULL,
  `ingredients` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile` ;

CREATE TABLE IF NOT EXISTS `profile` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `age` INT NULL,
  `profile_pic` VARCHAR(45) NULL,
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
  `id` INT NOT NULL,
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
  `id` VARCHAR(45) NOT NULL,
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
  `id` VARCHAR(45) NOT NULL,
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
  `id` VARCHAR(45) NOT NULL,
  `recipe_id` INT NULL,
  `ingredient_id` INT NULL,
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
  `id` VARCHAR(45) NOT NULL,
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
