-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pet_rescue
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pet_rescue
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pet_rescue` DEFAULT CHARACTER SET utf8 ;
USE `pet_rescue` ;

-- -----------------------------------------------------
-- Table `pet_rescue`.`Pet_staging`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pet_rescue`.`Pet_staging` (
  `PetID` INT NOT NULL,
  `Type` VARCHAR(3) NULL,
  `Age` INT NULL,
  `Breed1` VARCHAR(45) NULL,
  `Breed2` VARCHAR(45) NULL,
  `Gender` VARCHAR(6) NULL,
  `Color1` VARCHAR(45) NULL,
  `Color2` VARCHAR(45) NULL,
  `Color3` VARCHAR(45) NULL,
  `MaturitySize` VARCHAR(13) NULL,
  `Furlength` VARCHAR(13) NULL,
  `Vaccinated` VARCHAR(8) NULL,
  `Dewormed` VARCHAR(8) NULL,
  `Sterilized` VARCHAR(8) NULL,
  `Health` VARCHAR(14) NULL,
  `Quantity` INT NULL,
  `FEE` INT NULL,
  `State` VARCHAR(45) NULL,
  `RescuerID` INT NULL,
  `Last_update` DATETIME NULL,
  PRIMARY KEY (`PetID`),
  INDEX `Rescuer` (`RescuerID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_rescue`.`Medical_DIM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pet_rescue`.`Medical_DIM` (
  `Medical_PK` INT NOT NULL AUTO_INCREMENT,
  `Vaccinated` VARCHAR(8) NULL,
  `Dewormed` VARCHAR(8) NULL,
  `Sterilized` VARCHAR(8) NULL,
  PRIMARY KEY (`Medical_PK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_rescue`.`Rescuer_DIM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pet_rescue`.`Rescuer_DIM` (
  `Rescuer_PK` INT NOT NULL AUTO_INCREMENT,
  `Rescuer_ID` INT NULL,
  `Rescuer_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Rescuer_PK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_rescue`.`Species_DIM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pet_rescue`.`Species_DIM` (
  `Species_PK` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(3) NULL,
  `Gender` VARCHAR(45) NULL,
  PRIMARY KEY (`Species_PK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_rescue`.`Breed_DIM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pet_rescue`.`Breed_DIM` (
  `Breed_PK` INT NOT NULL AUTO_INCREMENT,
  `Breed_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Breed_PK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_rescue`.`Color_DIM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pet_rescue`.`Color_DIM` (
  `Color_PK` INT NOT NULL AUTO_INCREMENT,
  `Color_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Color_PK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_rescue`.`Size_DIM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pet_rescue`.`Size_DIM` (
  `Size_PK` INT NOT NULL AUTO_INCREMENT,
  `Size_name` VARCHAR(13) NULL,
  PRIMARY KEY (`Size_PK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_rescue`.`Fur_DIM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pet_rescue`.`Fur_DIM` (
  `Fur_PK` INT NOT NULL AUTO_INCREMENT,
  `Fur_name` VARCHAR(13) NULL,
  PRIMARY KEY (`Fur_PK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_rescue`.`Health_DIM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pet_rescue`.`Health_DIM` (
  `Health_PK` INT NOT NULL AUTO_INCREMENT,
  `Health_name` VARCHAR(14) NULL,
  PRIMARY KEY (`Health_PK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_rescue`.`State_DIM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pet_rescue`.`State_DIM` (
  `State_PK` INT NOT NULL AUTO_INCREMENT,
  `State_name` VARCHAR(45) NULL,
  PRIMARY KEY (`State_PK`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_rescue`.`Pet_status_Fact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pet_rescue`.`Pet_status_Fact` (
  `Pet_PK` INT NOT NULL AUTO_INCREMENT,
  `Pet_ID` INT NULL,
  `Species_FK` INT NULL,
  `Breed1_FK` INT NULL,
  `Breed2_FK` INT NULL,
  `Color1_FK` INT NULL,
  `Color2_FK` INT NULL,
  `Color3_FK` INT NULL,
  `Size_FK` INT NULL,
  `Fur_FK` INT NULL,
  `Medical_FK` INT NULL,
  `Health_FK` INT NULL,
  `State_FK` INT NULL,
  `Rescuer_FK` INT NULL,
  `Age` INT NULL,
  `Quantity` INT NULL,
  `Fee` INT NULL,
  `Version` INT NULL,
  `Start_date` DATETIME NULL,
  `End_date` DATETIME NULL,
  `Last_update` DATETIME NULL,
  PRIMARY KEY (`Pet_PK`),
  INDEX `Species_idx` (`Species_FK` ASC) VISIBLE,
  INDEX `Breed_idx` (`Breed1_FK` ASC) VISIBLE,
  INDEX `Color_idx` (`Color1_FK` ASC) VISIBLE,
  INDEX `Size_idx` (`Size_FK` ASC) VISIBLE,
  INDEX `Fur_idx` (`Fur_FK` ASC) VISIBLE,
  INDEX `Medical_idx` (`Medical_FK` ASC) VISIBLE,
  INDEX `Health_idx` (`Health_FK` ASC) VISIBLE,
  INDEX `State_idx` (`State_FK` ASC) VISIBLE,
  INDEX `Rescuer_idx` (`Rescuer_FK` ASC) VISIBLE,
  CONSTRAINT `Species`
    FOREIGN KEY (`Species_FK`)
    REFERENCES `pet_rescue`.`Species_DIM` (`Species_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Breed`
    FOREIGN KEY (`Breed1_FK`)
    REFERENCES `pet_rescue`.`Breed_DIM` (`Breed_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Color`
    FOREIGN KEY (`Color1_FK`)
    REFERENCES `pet_rescue`.`Color_DIM` (`Color_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Size`
    FOREIGN KEY (`Size_FK`)
    REFERENCES `pet_rescue`.`Size_DIM` (`Size_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fur`
    FOREIGN KEY (`Fur_FK`)
    REFERENCES `pet_rescue`.`Fur_DIM` (`Fur_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Medical`
    FOREIGN KEY (`Medical_FK`)
    REFERENCES `pet_rescue`.`Medical_DIM` (`Medical_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Health`
    FOREIGN KEY (`Health_FK`)
    REFERENCES `pet_rescue`.`Health_DIM` (`Health_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `State`
    FOREIGN KEY (`State_FK`)
    REFERENCES `pet_rescue`.`State_DIM` (`State_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rescuer`
    FOREIGN KEY (`Rescuer_FK`)
    REFERENCES `pet_rescue`.`Rescuer_DIM` (`Rescuer_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
