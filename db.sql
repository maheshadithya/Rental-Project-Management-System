CREATE TABLE `rpmsystem`.`property` (
  `property_id` INT NOT NULL AUTO_INCREMENT,
  `property_type` VARCHAR(45) NULL,
  `no_of_rooms` INT NULL,
  `area_in_sqfeet` INT NULL,
  `owner_id` INT NULL,
  `price` FLOAT NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`property_id`));
  
  
  CREATE TABLE `rpmsystem`.`rentpayment` (
  `rentpayment_id` INT NOT NULL,
  `rent_payment_type` VARCHAR(45) NULL,
  `property_id` VARCHAR(45) NULL,
  `tenant_id` VARCHAR(45) NULL,
  `owner_id` VARCHAR(45) NULL,
  `employee_id` VARCHAR(45) NULL,
  `amount` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  PRIMARY KEY (`rentpayment_id`));
  
  CREATE TABLE `rpmsystem`.`tenant` (
  `tenant_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `second_name` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `age` INT NULL,
  `mobile` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`tenant_id`));
  
  CREATE TABLE `rpmsystem`.`owner` (
  `owner_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `second_name` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `age` INT NULL,
  `mobile` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`owner_id`));


  CREATE TABLE `rpmsystem`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `second_name` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `age` INT NULL,
  `mobile` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `qualification` VARCHAR(45) NULL,
  PRIMARY KEY (`employee_id`));
  
  

INSERT INTO `rpmsystem`.`admin` (`id`, `admin_id`, `admin_password`) VALUES ('1', 'admin', 'admin123');
