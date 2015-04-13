SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `fyp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `fyp` ;

-- -----------------------------------------------------
-- Table `fyp`.`node`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fyp`.`node` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `temperature` INT NULL ,
  `humidity` INT NULL ,
  `light` INT NULL ,
  `noise` INT NULL ,
  `people_count` INT NOT NULL DEFAULT 0 ,
  `type` INT NULL ,
  `activity` INT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fyp`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fyp`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fyp`.`activities`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `fyp`.`activities` (
  `type` INT NOT NULL ,
  `activity` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`type`, `activity`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
