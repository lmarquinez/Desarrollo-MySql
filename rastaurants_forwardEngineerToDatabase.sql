-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restaurants
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restaurants
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurants` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `restaurants` ;

-- -----------------------------------------------------
-- Table `restaurants`.`locals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurants`.`locals` (
  `idlocal` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `direction` VARCHAR(90) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `phone` CHAR(13) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `name_responsible` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `isOpen` TINYINT NOT NULL,
  PRIMARY KEY (`idlocal`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `direction_UNIQUE` (`direction` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `restaurants`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurants`.`clients` (
  `idclient` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `phone` CHAR(13) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `email` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`idclient`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `restaurants`.`tables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurants`.`tables` (
  `idtable` INT NOT NULL AUTO_INCREMENT,
  `number_table` INT NOT NULL,
  `number_people` INT NOT NULL,
  `isAvailable` TINYINT NOT NULL,
  `date_booked` DATETIME NULL,
  `fk_local` INT NOT NULL,
  `fk_client` INT NULL,
  PRIMARY KEY (`idtable`),
  INDEX `fk_tables_locals1_idx` (`fk_local` ASC) VISIBLE,
  INDEX `fk_tables_clients1_idx` (`fk_client` ASC) VISIBLE,
  CONSTRAINT `fk_tables_locals1`
    FOREIGN KEY (`fk_local`)
    REFERENCES `restaurants`.`locals` (`idlocal`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tables_clients1`
    FOREIGN KEY (`fk_client`)
    REFERENCES `restaurants`.`clients` (`idclient`)
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `restaurants`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurants`.`favorites` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_client` INT NOT NULL,
  `fk_local` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clients_has_locals_locals1_idx` (`fk_local` ASC) VISIBLE,
  INDEX `fk_clients_has_locals_clients1_idx` (`fk_client` ASC) VISIBLE,
  CONSTRAINT `fk_clients_has_locals_clients1`
    FOREIGN KEY (`fk_client`)
    REFERENCES `restaurants`.`clients` (`idclient`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_clients_has_locals_locals1`
    FOREIGN KEY (`fk_local`)
    REFERENCES `restaurants`.`locals` (`idlocal`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
