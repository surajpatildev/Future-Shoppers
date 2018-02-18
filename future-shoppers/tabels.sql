CREATE TABLE `futureshopping`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));
  
  INSERT INTO `futureshopping`.`categories` (`category_id`, `name`, `description`) VALUES ('1', 'SmartPhones', 'Today, smartphones largely fulfill most peoples needs for a telephone, digital camera and video camera, GPS navigation, a media player, clock, news, calculator, web browser, handheld video game player, flashlight, compass, an address book, note-taking, digital messaging, an event calendar, etc. Typical smartphones will include one or more of the following sensors: magnetometer, proximity sensor, barometer, gyroscope, or accelerometer. Since 2010, smartphones adopted integrated virtual assistants, such as Apple Siri, Amazon Alexa, Google Assistant, Microsoft Cortana, BlackBerry Assistant and Samsung Bixby. Most smartphones produced from 2012 onward have high-speed mobile broadband 4G LTE capability.');
  INSERT INTO `futureshopping`.`categories` (`category_id`, `name`, `description`) VALUES ('2', 'Headphones', 'Headphones (or head-phones in the early days of telephony and radio) are a pair of small loudspeaker drivers worn on or around the head over a users ears. They are electroacoustic transducers, which convert an electrical signal to a corresponding sound. Headphones let a single user listen to an audio source privately, in contrast to a loudspeaker, which emits sound into the open air for anyone nearby to hear. Headphones are also known as earspeakers, earphones[1] or, colloquially, cans.[2] Circumaural and supra-aural headphones use a band over the top of the head to hold the speakers in place.');
  INSERT INTO `futureshopping`.`categories` (`category_id`, `name`, `description`) VALUES ('3', 'Laptops', 'A laptop, often called a notebook or \"notebook computer\", is a small, portable personal computer with a \"clamshell\" form factor, an alphanumeric keyboard on the lower part of the \"clamshell\" and a thin LCD or LED computer screen on the upper part, which is opened up to use the computer. Laptops are folded shut for transportation, and thus are suitable for mobile use.[1] Although originally there was a distinction between laptops and notebooks, the former being bigger and heavier than the latter, as of 2014, there is often no longer any difference.[2] Laptops are commonly used in a variety of settings, such as at work, in education, in playing games, Internet surfing, for personal multimedia and general home computer use.');
  INSERT INTO `futureshopping`.`categories` (`category_id`, `name`, `description`) VALUES ('4', 'TV', 'Television (TV) is a telecommunication medium used for transmitting moving images in monochrome (black and white), or in colour, and in two or three dimensions and sound. The term can refer to a television set, a television program (\"TV show\"), or the medium of television transmission. Television is a mass medium for entertainment, education, news, politics, gossip and advertising.');
  
  
CREATE TABLE `futureshopping`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `mobile_number` BIGINT NOT NULL,
  `role` ENUM('ADMIN', 'CUSTOMER', 'SUPPLIER') NOT NULL,
  `is_active` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `mobile_number_UNIQUE` (`mobile_number` ASC));
  
  INSERT INTO `futureshopping`.`USER` (`user_id`, `first_name`, `last_name`, `email`, `mobile_number`, `role`, `is_active`, `Password`) VALUES ('1', 'admin', 'sj', 'admin@futureshoppers.in', '12', 'ADMIN', 'TRUE', 'adminsj');
 INSERT INTO `futureshopping`.`USER` (`user_id`, `first_name`, `last_name`, `email`, `mobile_number`, `role`, `is_active`, `Password`) VALUES ('2', 'supplier', 'sj', 'supplier@futuershoppers.in', '123456', 'SUPPLIER', 'TRUE', 'suppliersj');
  
  CREATE TABLE `futureshopping`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NOT NULL,
  `product_code` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL,
  `supplier_id` INT NOT NULL,
  `Unit_price` DOUBLE NOT NULL,
  `Total_Quantity` INT NOT NULL DEFAULT 0,
  `Quantity_Sold` INT NOT NULL DEFAULT 0,
  `views` BIGINT NOT NULL DEFAULT 0,
  `quantity_available` INT NOT NULL DEFAULT 0,
  `Is_Active` VARCHAR(10) NOT NULL,
  `Product_Description` LONGTEXT NULL,
  `rating` FLOAT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `FK_Product_Category_id_idx` (`category_id` ASC),
  INDEX `FK_PRODUCT_SupplierID_idx` (`supplier_id` ASC),
  CONSTRAINT `FK_Product_Category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `futureshopping`.`categories` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_SupplierID`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `futureshopping`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
 
    INSERT INTO `futureshopping`.`product` (`product_id`, `product_code`, `category_id`, `supplier_id`, `Unit_price`, `Total_Quantity`, `Quantity_Sold`, `views`, `quantity_available`, `Is_Active`, `Product_Description`, `rating`, `name`) VALUES ('1', 'TEMP', '1', '1', '10000', '10', '0', '0', '10', 'TRUE', 'The <strong>Xiaomi Redmi Note 3</strong> is a smartphone developed by Xiaomi Inc.', '4', 'REDMI NOTE 3 32 GB');
	INSERT INTO `futureshopping`.`product` (`product_id`, `product_code`, `category_id`, `supplier_id`, `Unit_price`, `Total_Quantity`, `Quantity_Sold`, `views`, `quantity_available`, `Is_Active`, `Product_Description`, `rating`, `name`) VALUES ('2', 'TEMP1', '2', '2', '500', '25', '12', '12', '13', 'TRUE', '<strong>BOAT</strong> is an Indian company that manufactures loudspeaker and associated electronics. <br>', '5', 'BOAt A1');
     INSERT INTO `futureshopping`.`product` (`product_id`, `product_code`, `category_id`, `supplier_id`, `Unit_price`, `Total_Quantity`, `Quantity_Sold`, `views`, `quantity_available`, `Is_Active`, `Product_Description`, `rating`, `name`) VALUES ('3', 'TEMP2', '3', '2', '50325', '5', '0', '0', '5', 'TRUE', 'MacBook Air lasts up to an incredible 12 hours between charges. So from your morning coffee to your evening commute, you can work unplugged. When it’s time to kick back and relax, you can get up to 12 hours of iTunes movie playback. And with up to 30 days of standby time, you can go away for weeks and pick up where you left off.Whatever the task, fifth-generation Intel Core i5 and i7 processors with Intel HD Graphics 6000 are up to it. From editing photos to browsing the web, everything happens ultra-fast. And all that power is encased in an incredibly thin 1.7-centimetre unibody design that weighs only 1.35 kilos. It’s macOS at its highest level yet.', '2', 'APPLE MACKBOOK AIR');
     INSERT INTO `futureshopping`.`product` (`product_id`, `product_code`, `category_id`, `supplier_id`, `Unit_price`, `Total_Quantity`, `Quantity_Sold`, `views`, `quantity_available`, `Is_Active`, `Product_Description`, `rating`, `name`) VALUES ('4', 'TEMP3', '4', '1', '5515', '26', '0', '0', '26', 'TRUE', 'Incredibly slim profile and stylish, contemporary design • Super slim panel: At an incredibly slim 10mm - as slender as a ballpoint pen - the one-piece panel is more than twice as thin as standard Samsung monitors • Simple circular stand: A simple circular stand elegantly complements the super slim display • Patterned rear panel: Horizontal patterning on the rear panel provides a stylish, contemporary finish Extra-wide viewing angle for the perfect view from anywhere • Extra-wide 178-degree viewing angle: An expanded 178-degree vertical and horizontal viewing angle ensures a clear picture from wherever you are watching • Whether sitting back to relax or gathered around with friends, the wider viewing angle means everyone enjoys the perfect view from any position. The product comes under manufacturer warranty if any kind of manufacturer defect customer may call on Samsung toll free 180030008282/18002668282 and get replacement from Samsung onsite.', '4', 'Samsung S19F350HNW 18.5-inch AH IPS LED Monitor (Black)');
	INSERT INTO `futureshopping`.`product` (`product_id`, `product_code`, `category_id`, `supplier_id`, `Unit_price`, `Total_Quantity`, `Quantity_Sold`, `views`, `quantity_available`, `Is_Active`, `Product_Description`, `rating`, `name`) VALUES ('5', 'TeMP6', '1', '2', '8000', '1523', '021', '1502', '1502', 'TRUE', 'iPhone 6 isn’t simply bigger it’s better in every way. Larger, yet dramatically thinner. More powerful, but remarkably power efficient. With a smooth metal surface that seamlessly meets the new Retina HD display. It’s one continuous form where hardware and software function in perfect unison, creating a new generation of iPhone that’s better by any measure.', '3.54', 'Apple iPhone 6 (Gold, 16GB)');
	INSERT INTO `futureshopping`.`product` (`product_id`, `product_code`, `category_id`, `supplier_id`, `Unit_price`, `Total_Quantity`, `Quantity_Sold`, `views`, `quantity_available`, `Is_Active`, `Product_Description`, `name`) VALUES ('6', 'Temp7', '3', '2', '35465', '0', '0', '0', '0', 'TRUE', 'This laptop is from Dell. The operating system is windows and RAM size is 4GB.', 'Dell Inspiron 15 3565 15-inch Laptop (7th Gen E2-9000/4GB/1TB/Win. 10 /Integrated Graphics), Black');
