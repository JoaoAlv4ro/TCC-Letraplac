-- Owner: Letraplac
-- Version: 2.0
DROP SCHEMA IF EXISTS `DB_Letraplac`;
CREATE SCHEMA IF NOT EXISTS `DB_Letraplac` DEFAULT CHARACTER SET utf8mb4;
USE `DB_Letraplac`;

/*------------ USER ------------*/
CREATE TABLE IF NOT EXISTS `DB_Letraplac` . `TB_user_login` (
	`user_id` INT NOT NULL AUTO_INCREMENT,
    `user_name` VARCHAR(100) NOT NULL,
    `user_CPF` VARCHAR(45) NOT NULL UNIQUE,
    `user_birth` DATE NOT NULL,
    `user_email` VARCHAR(45) NOT NULL UNIQUE, 
    `user_contact` VARCHAR(45) NULL,
    `user_password` VARCHAR(64) NOT NULL,
    `user_type` ENUM("A","C"),
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `DB_Letraplac` . `TB_user_address` (
	`address_id` INT NOT NULL AUTO_INCREMENT,
    `address_CEP` DECIMAL(3,2) NOT NULL,
    `address_street` VARCHAR(100) NOT NULL,
    `address_number` INT NOT NULL,
    `address_district` VARCHAR(75) NOT NULL,
    `address_complement` VARCHAR(20),
    `address_city` VARCHAR(50) NOT NULL,
    `address_state` VARCHAR(2) NOT NULL,
    `user_id` INT NOT NULL,
    
    CONSTRAINT 
		FOREIGN KEY (`user_id`)
        REFERENCES `DB_Letraplac`.`TB_user_login` (`user_id`)
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION,
    
    PRIMARY KEY (`address_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4;

    /*------------ INSERTS ------------*/
    INSERT INTO TB_user_login VALUES (DEFAULT, "Álvaro", "689.508.377-47", "2004-07-02", "joaosilvaabc1@gmail.com", "(12) 99637-4429", "Senha", "A");
    INSERT INTO TB_user_login VALUES (DEFAULT, "Vitor", "400.892.233-24", "2004-09-27", "joaovitorabc2@gmail.com", "(12) 992324-2526", "Senha", "C");
    INSERT INTO TB_user_login VALUES (DEFAULT, "Marco", "678.321.594-10", "2003-07-21", "marcoantoniabc3@gmail.com", "(12) 99452-3132", "Senha", "C");
    /*------------ INSERTS END ------------*/

/*------------ USER END ------------*/

/*------------ PRODUCT ------------*/
CREATE TABLE IF NOT EXISTS `DB_Letraplac` . `TB_product` (
	`product_id` INT NOT NULL AUTO_INCREMENT,
    `product_name` VARCHAR(45) NOT NULL,
    `product_code` INT NOT NULL,
    `product_type` VARCHAR(30),
    `product_size` VARCHAR(45),
    `product_unity_value` DECIMAL(5,2) NOT NULL,
    `product_image` VARCHAR(30),
    PRIMARY KEY (`product_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4;

    /*------------ INSERTS ------------*/
    INSERT INTO TB_product VALUES (DEFAULT, "Placa1", "1", "A", "20cm x 30cm", "20.00", "");
    INSERT INTO TB_product VALUES (DEFAULT, "Placa2", "2", "B", "20cm x 30cm", "50.00", "");
    INSERT INTO TB_product VALUES (DEFAULT, "Placa3", "3", "C", "20cm x 30cm", "180.00", "");
    /*------------ INSERTS END ------------*/

/*------------ PRODUCT END ------------*/

/*------------ DEMAND ------------*/
CREATE TABLE IF NOT EXISTS `DB_Letraplac` . `TB_demand` (
	`demand_id` INT NOT NULL AUTO_INCREMENT,
    `demand_amount` INT NOT NULL,
    `demand_date` DATE NOT NULL,
    `demand_status` ENUM("A","P","E") NOT NULL,
    /*Analise, Produção e Enviado*/
    `demand_value` DECIMAL(6,2) NOT NULL,
    `demand_border_type` ENUM("1","2","3") NOT NULL,
    `demand_info` VARCHAR(256) NOT NULL,
    `demand_photo` VARCHAR(50),
    `user_id` INT NOT NULL,
    `product_id` INT NOT NULL,
    
    INDEX `FK_user_id_idx` (`user_id`),
    INDEX `FK_product_id_idx` (`product_id`),
    
    CONSTRAINT `FK_user_id`
		FOREIGN KEY (`user_id`)
        REFERENCES `DB_Letraplac`.`TB_user_login` (`user_id`)
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION,
        
    CONSTRAINT `FK_product_id` 
		FOREIGN KEY (`product_id`)
        REFERENCES `DB_Letraplac`.`TB_product` (`product_id`)
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION,

    PRIMARY KEY (`demand_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4;

    /*------------ INSERTS ------------*/
    INSERT INTO TB_demand VALUES (DEFAULT, 1, "2022-11-21", "A", "20.00", "1", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "", "2", "2");
    INSERT INTO TB_demand VALUES (DEFAULT, 2, "2022-11-22", "P", "100.00", "2", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "", "2", "2");
    INSERT INTO TB_demand VALUES (DEFAULT, 3, "2022-11-23", "E", "360.00", "3", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "", "3", "3");
    /*------------ INSERTS END ------------*/
/*------------ DEMAND END ------------*/

/*------------ FEEDBACK ------------*/
CREATE TABLE IF NOT EXISTS `DB_Letraplac` . `TB_feedback` (
	`feedback_id` INT NOT NULL AUTO_INCREMENT,
    `feedback` VARCHAR(256),
    `rating` ENUM("1","2","3","4","5") NOT NULL,
    `user_id` INT NOT NULL,
    `product_id` INT NOT NULL,
    
	INDEX `FK_user_id_idx` (`user_id`),
    INDEX `FK_product_id_idx` (`product_id`),
    
    CONSTRAINT `FK_user_id_feedback`
		FOREIGN KEY (`user_id`)
        REFERENCES `DB_Letraplac`.`TB_user_login` (`user_id`)
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION,
        
    CONSTRAINT `FK_product_id_feedback` 
		FOREIGN KEY (`product_id`)
        REFERENCES `DB_Letraplac`.`TB_product` (`product_id`)
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION,
        
    PRIMARY KEY (`feedback_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4;

    /*------------ INSERTS ------------*/
    INSERT INTO TB_feedback VALUES (DEFAULT, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "3", "2", "2");
    INSERT INTO TB_feedback VALUES (DEFAULT, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "4", "2", "2");
    INSERT INTO TB_feedback VALUES (DEFAULT, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "5", "3", "3");
    /*------------ INSERTS END ------------*/

/*------------ FEEDBACK END ------------*/


SELECT * FROM TB_user_login;
SELECT * FROM TB_product;
SELECT * FROM TB_demand;
SELECT * FROM TB_feedback;