DROP SCHEMA IF EXISTS `petclinic` ;


CREATE SCHEMA IF NOT EXISTS `petclinic` DEFAULT CHARACTER SET utf8 ;
USE `petclinic` ;


DROP TABLE IF EXISTS `petclinic`.`facturas` ;

CREATE TABLE IF NOT EXISTS `petclinic`.`facturas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_number` BIGINT(20) NOT NULL,
  `money` DOUBLE NOT NULL,
  `payment_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


DROP TABLE IF EXISTS `petclinic`.`owners` ;

CREATE TABLE IF NOT EXISTS `petclinic`.`owners` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `telephone` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


DROP TABLE IF EXISTS `petclinic`.`types` ;

CREATE TABLE IF NOT EXISTS `petclinic`.`types` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


DROP TABLE IF EXISTS `petclinic`.`pets` ;

CREATE TABLE IF NOT EXISTS `petclinic`.`pets` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `birth_date` DATE NULL DEFAULT NULL,
  `owner` INT(11) NULL DEFAULT NULL,
  `type_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKfd6mterd0lb7flr6xr6f8a2rw` (`owner` ASC),
  INDEX `FKtmmh1tq8pah5vxf8kuqqplo4p` (`type_id` ASC),
  CONSTRAINT `FKfd6mterd0lb7flr6xr6f8a2rw`
    FOREIGN KEY (`owner`)
    REFERENCES `petclinic`.`owners` (`id`),
  CONSTRAINT `FKtmmh1tq8pah5vxf8kuqqplo4p`
    FOREIGN KEY (`type_id`)
    REFERENCES `petclinic`.`types` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


DROP TABLE IF EXISTS `petclinic`.`specialties` ;

CREATE TABLE IF NOT EXISTS `petclinic`.`specialties` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


DROP TABLE IF EXISTS `petclinic`.`vets` ;

CREATE TABLE IF NOT EXISTS `petclinic`.`vets` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



DROP TABLE IF EXISTS `petclinic`.`vet_specialties` ;

CREATE TABLE IF NOT EXISTS `petclinic`.`vet_specialties` (
  `vet_id` INT(11) NOT NULL,
  `specialty_id` INT(11) NOT NULL,
  PRIMARY KEY (`vet_id`, `specialty_id`),
  INDEX `FK35uiboyrpfn1bndrr5jorcj0m` (`specialty_id` ASC),
  CONSTRAINT `FK35uiboyrpfn1bndrr5jorcj0m`
    FOREIGN KEY (`specialty_id`)
    REFERENCES `petclinic`.`specialties` (`id`),
  CONSTRAINT `FKby1c0fbaa0byaifi63vt18sx9`
    FOREIGN KEY (`vet_id`)
    REFERENCES `petclinic`.`vets` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


DROP TABLE IF EXISTS `petclinic`.`visits` ;

CREATE TABLE IF NOT EXISTS `petclinic`.`visits` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `visit_date` DATETIME NULL DEFAULT NULL,
  `description` VARCHAR(255) NOT NULL,
  `pet_id` INT(11) NULL DEFAULT NULL,
  `bill_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKjouwu4vj82ytrowsvdsvlxntv` (`bill_id` ASC),
  INDEX `FK6jcifhlqqlsfseu67utlouauy` (`pet_id` ASC),
  CONSTRAINT `FK6jcifhlqqlsfseu67utlouauy`
    FOREIGN KEY (`pet_id`)
    REFERENCES `petclinic`.`pets` (`id`),
  CONSTRAINT `FKjouwu4vj82ytrowsvdsvlxntv`
    FOREIGN KEY (`bill_id`)
    REFERENCES `petclinic`.`facturas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;