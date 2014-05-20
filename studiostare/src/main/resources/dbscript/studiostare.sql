SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

use mysql;
drop user 'studiostare'@'localhost';
drop user 'studiostare'@'%';
delete from user where user='studiostare' and host='localhost';
delete from user where user='studiostare' and host='%';
create user 'studiostare'@'localhost' identified by 'studiostare';
create user 'studiostare'@'%' identified by 'studiostare';
grant all on studiostare.* to 'studiostare'@'localhost';
grant all on studiostare.* to 'studiostare'@'%';
flush privileges;

DROP SCHEMA IF EXISTS `studiostare` ;
CREATE SCHEMA IF NOT EXISTS `studiostare` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `studiostare` ;

-- -----------------------------------------------------
-- Table `studiostare`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studiostare`.`role` ;

CREATE TABLE IF NOT EXISTS `studiostare`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(1024) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `studiostare`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studiostare`.`user` ;

CREATE TABLE IF NOT EXISTS `studiostare`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(255) NULL ,
  `email` VARCHAR(255) NULL,
  `role_id` INT NULL ,
  `capture_news_flag` INT NULL ,
  `twitter_user` VARCHAR(255) NULL ,
  `position`	VARCHAR(64) NULL ,
  `photo_path` VARCHAR(1024) NULL ,
  `description` VARCHAR(1024) NULL ,
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_to_role_role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `studiostare`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `studiostare`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studiostare`.`client` ;

CREATE TABLE IF NOT EXISTS `studiostare`.`client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL ,
  `phone` VARCHAR(255) NOT NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `description` VARCHAR(1024) NULL ,
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `studiostare`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studiostare`.`category` ;

CREATE TABLE IF NOT EXISTS `studiostare`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL ,
  `description` VARCHAR(1024) NULL ,
  `update_time` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `studiostare`.`video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studiostare`.`video` ;

CREATE TABLE IF NOT EXISTS `studiostare`.`video` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `index` INT NOT NULL ,
  `client_id` INT NOT NULL ,
  `category_id` INT NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `img_path` VARCHAR(1024) NOT NULL ,
  `video_path_webm` VARCHAR(1024) ,
  `video_path_ogg` VARCHAR(1024) ,
  `video_path_mp4` VARCHAR(1024) ,
  `description` VARCHAR(1024) ,
  `type` INT NOT NULL DEFAULT 1 ,
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_video_to_client_client_id`
    FOREIGN KEY (`id`)
    REFERENCES `studiostare`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_to_category_category_id`
    FOREIGN KEY (`id`)
    REFERENCES `studiostare`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `studiostare`.`about`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studiostare`.`about` ;

CREATE TABLE IF NOT EXISTS `studiostare`.`about` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `office_img_path` VARCHAR(1024) ,
  `about_us_info` VARCHAR(1024) ,
  `manifesto` VARCHAR(1024) ,
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `studiostare`.`news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studiostare`.`news` ;

CREATE TABLE IF NOT EXISTS `studiostare`.`news` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL ,
  `content` VARCHAR(1024) NOT NULL ,
  `photo_path` VARCHAR(1024) NULL ,
  `video_path_mp4` VARCHAR(1024) NULL ,
  `video_path_webm` VARCHAR(1024) NULL ,
  `video_path_ogg` VARCHAR(1024) NULL ,
  `user_id` INT NULL ,
  `twitter_id` BIGINT DEFAULT NULL ,
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_news_to_user_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `studiostare`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
-- -----------------------------------------------------
-- Table `studiostare`.`news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `studiostare`.`leading` ;

CREATE TABLE IF NOT EXISTS `studiostare`.`leading` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `picPath` VARCHAR(1024) ,
  `title` VARCHAR(1024) ,
  `description` VARCHAR(1024) ,
  `updateTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `studiostare`.`role` (`id`, `name`, `description`) VALUES ('1', 'admin', 'admin');
INSERT INTO `studiostare`.`role` (`id`, `name`, `description`) VALUES ('2', 'twitterUser', 'twitterUser');
INSERT INTO `studiostare`.`role` (`id`, `name`, `description`) VALUES ('3', 'aboutus', 'aboutus');
INSERT INTO `studiostare`.`user` (`id`, `name`, `password`, `email`, `role_id`, `description`) VALUES ('1', 'admin', 'admin', 'admin@admin.com', '1', 'admin');


