-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SafeFoodDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SafeFoodDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SafeFoodDB` DEFAULT CHARACTER SET utf8 ;
USE `SafeFoodDB` ;

-- -----------------------------------------------------
-- Table `SafeFoodDB`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SafeFoodDB`.`User` (
  `uid` VARCHAR(40) NOT NULL,
  `upw` VARCHAR(45) NULL,
  `uname` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`uid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SafeFoodDB`.`Food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SafeFoodDB`.`Food` (
  `fcode` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `supportpereat` DOUBLE NULL,
  `calory` DOUBLE NULL,
  `carbo` DOUBLE NULL,
  `protein` DOUBLE NULL,
  `fat` DOUBLE NULL,
  `sugar` DOUBLE NULL,
  `natrium` DOUBLE NULL,
  `chole` DOUBLE NULL,
  `fattyacid` DOUBLE NULL,
  `transfat` DOUBLE NULL,
  `maker` VARCHAR(45) NULL,
  `img` VARCHAR(45) NULL,
  PRIMARY KEY (`fcode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SafeFoodDB`.`Material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SafeFoodDB`.`Material` (
  `mname` VARCHAR(100) NOT NULL,
  `origin` VARCHAR(45) NULL,
  PRIMARY KEY (`mname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SafeFoodDB`.`Recoding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SafeFoodDB`.`Recoding` (
  `User_uid` VARCHAR(40) NOT NULL,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Food_fcode` INT NOT NULL,
  `food_num` INT NOT NULL,
  PRIMARY KEY (`User_uid`, `date`),
  INDEX `fk_User_has_Food_Food1_idx` (`Food_fcode` ASC) VISIBLE,
  INDEX `fk_User_has_Food_User_idx` (`User_uid` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Food_User`
    FOREIGN KEY (`User_uid`)
    REFERENCES `SafeFoodDB`.`User` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Food_Food1`
    FOREIGN KEY (`Food_fcode`)
    REFERENCES `SafeFoodDB`.`Food` (`fcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SafeFoodDB`.`Allergy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SafeFoodDB`.`Allergy` (
  `allergy_name` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`allergy_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SafeFoodDB`.`RawMaterial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SafeFoodDB`.`RawMaterial` (
  `Food_fcode` INT NOT NULL,
  `Material_mname` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Food_fcode`, `Material_mname`),
  INDEX `fk_Food_has_Material_Material1_idx` (`Material_mname` ASC) VISIBLE,
  INDEX `fk_Food_has_Material_Food1_idx` (`Food_fcode` ASC) VISIBLE,
  CONSTRAINT `fk_Food_has_Material_Food1`
    FOREIGN KEY (`Food_fcode`)
    REFERENCES `SafeFoodDB`.`Food` (`fcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Food_has_Material_Material1`
    FOREIGN KEY (`Material_mname`)
    REFERENCES `SafeFoodDB`.`Material` (`mname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SafeFoodDB`.`Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SafeFoodDB`.`Cart` (
  `User_uid` VARCHAR(40) NOT NULL,
  `Food_fcode` INT NOT NULL,
  `date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`User_uid`, `Food_fcode`),
  INDEX `fk_User_has_Food_Food2_idx` (`Food_fcode` ASC) VISIBLE,
  INDEX `fk_User_has_Food_User1_idx` (`User_uid` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Food_User1`
    FOREIGN KEY (`User_uid`)
    REFERENCES `SafeFoodDB`.`User` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Food_Food2`
    FOREIGN KEY (`Food_fcode`)
    REFERENCES `SafeFoodDB`.`Food` (`fcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SafeFoodDB`.`Log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SafeFoodDB`.`Log` (
  `User_uid` VARCHAR(40) NOT NULL,
  `time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `search_word` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`User_uid`, `time`),
  INDEX `fk_Log_User1_idx` (`User_uid` ASC) VISIBLE,
  CONSTRAINT `fk_Log_User1`
    FOREIGN KEY (`User_uid`)
    REFERENCES `SafeFoodDB`.`User` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SafeFoodDB`.`User_Allergy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SafeFoodDB`.`User_Allergy` (
  `User_uid` VARCHAR(40) NOT NULL,
  `Allergy_allergy_name` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`User_uid`, `Allergy_allergy_name`),
  INDEX `fk_User_has_Allergy_Allergy1_idx` (`Allergy_allergy_name` ASC) VISIBLE,
  INDEX `fk_User_has_Allergy_User1_idx` (`User_uid` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Allergy_User1`
    FOREIGN KEY (`User_uid`)
    REFERENCES `SafeFoodDB`.`User` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Allergy_Allergy1`
    FOREIGN KEY (`Allergy_allergy_name`)
    REFERENCES `SafeFoodDB`.`Allergy` (`allergy_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
