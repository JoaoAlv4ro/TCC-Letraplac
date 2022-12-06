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
    `address_CEP` VARCHAR(10) NOT NULL,
    `address_street` VARCHAR(100) NOT NULL,
    `address_number` INT NOT NULL,
    `address_city` VARCHAR(256) NOT NULL,
    `address_state` VARCHAR(2) NOT NULL,
    `user_id` INT NOT NULL,
    
    CONSTRAINT 
		FOREIGN KEY (`user_id`)
        REFERENCES `DB_Letraplac`.`TB_user_login` (`user_id`)
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION,
    
    PRIMARY KEY (`address_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4;
drop table TB_user_login;
drop table TB_user_address;
    /*------------ INSERTS ------------*/
    INSERT INTO TB_user_login VALUES (DEFAULT, "Álvaro", "689.508.377-47", "2004-07-02", "joaosilvaabc1@gmail.com", "(12) 99637-4429", "Senha", "A"),
				     (DEFAULT, "Vitor", "400.892.233-24", "2004-09-27", "joaovitorabc2@gmail.com", "(12) 992324-2526", "Senha", "C"),
				     (DEFAULT, "Marco", "678.321.594-10", "2003-07-21", "marcoantoniabc3@gmail.com", "(12) 99452-3132", "Senha", "C"),
				     (DEFAULT, "Julia", "809.666.643-16", "2004-05-06", "juliaabc1@gmail.com", "(12) 97518-0369", "Senha", "A"),
				     (DEFAULT, "Aline", "028.753.350-98", "2000-09-11", "alineabc2@gmail.com", "(12) 99025-7845", "Senha", "C"),
				     (DEFAULT, "Olivia", "741.012.986-74", "2000-01-03", "oliviaabc3@gmail.com", "(12) 99132-0187", "Senha", "C"),
				     (DEFAULT, "Emanuel", "774.789.336-65", "1999-05-02", "emauelabc1@gmail.com", "(12) 99637-4429", "Senha", "A"),
				     (DEFAULT, "Heloisa", "998.036.014-82", "1998-01-27", "heloisaabc2@gmail.com", "(12) 992324-2526", "Senha", "C"),
				     (DEFAULT, "Cristiane", "990.046.578-02", "1990-02-21", "cristiaeabc3@gmail.com", "(12) 90258-8744", "Senha", "C"),
				     (DEFAULT, "Caio", "336.025.120-78", "1988-07-06", "caioabc1@gmail.com", "(12) 91452-9875", "Senha", "A"),
				     (DEFAULT, "Hector", "852.093.017-00", "2002-01-06", "hectorabc2@gmail.com", "(12) 95874-6663", "Senha", "C"),
				     (DEFAULT, "Marilia", "999.554.967-01", "1999-08-03", "mariliaabc3@gmail.com", "(12) 9777-0001", "Senha", "C");
    
    INSERT INTO TB_user_address VALUES  (DEFAULT, "12345-01", "Avenida Alagoas", "1", "São José dos Campos", "SP", "1"),
					(DEFAULT, "12345-02", "Avenida Vitoria", "2", "Vitoria da Conquista", "BH", "2"),
					(DEFAULT, "12345-03", "Avenida Marcos", "3", "Jacareí", "SP", "3"),
					(DEFAULT, "12345-04", "Rua das Palmeiras", "4", "São Paulo", "SP", "4") ,
					(DEFAULT, "12345-05", "Rua Gaivota", "5", "Vilhena", "RO", "5"),
					(DEFAULT, "12345-06", "Rua das Orquideas", "6", "Jacareí", "SP", "6"),
					(DEFAULT, "12345-07", "Avenida Almdeida", "7", "São José dos Campos", "SP", "7") ,
					(DEFAULT, "12345-08", "Avenida Alagoana", "8", "Porto Velho", "RO", "8"),
					(DEFAULT, "12345-09", "Avenida Bahia", "9", "Santos", "SP", "9"),
					(DEFAULT, "12345-10", "Rua dos Anjos", "10", "São José dos Campos", "SP", "10") ,
					(DEFAULT, "12345-11", "Rua Brasil", "11", "Vitoria da Conquista", "BH", "11"),
					(DEFAULT, "12345-12", "Rua Olinda", "12", "Osasco", "SP", "12");
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
    `feedback_date` DATE NOT NULL,
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
    INSERT INTO TB_feedback VALUES (DEFAULT, "2022-11-24", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "3", "2", "2");
    INSERT INTO TB_feedback VALUES (DEFAULT, "2022-09-25", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "4", "2", "2");
    INSERT INTO TB_feedback VALUES (DEFAULT, "2022-07-26", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "5", "3", "3");
    /*------------ INSERTS END ------------*/

/*------------ FEEDBACK END ------------*/
SELECT * FROM TB_user_login;
SELECT * FROM TB_user_address;
SELECT * FROM TB_product;
SELECT * FROM TB_demand;
SELECT * FROM TB_feedback;


/*------------AVALIATION------------*/


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--

--

-- 
--
--

CREATE TABLE `avaliacos` (
  `id` int(11) NOT NULL,
  `qnt_estrela` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `avaliacos`
--

INSERT INTO `avaliacos` (`id`, `qnt_estrela`, `created`, `modified`) VALUES
(1, 3, '2017-08-28 22:35:17', NULL),
(2, 5, '2017-08-28 22:35:35', NULL);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `avaliacos`
--
ALTER TABLE `avaliacos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*------------EVALUATION ENDS------------*/

select * from avaliacos
