
# create Db
CREATE DATABASE CAR_RENTAL;

USE CAR_RENTAL;

# create table
CREATE TABLE `car`
(
  `vichicle_id` int UNIQUE PRIMARY KEY,
  `lincese_plate_number` int UNIQUE NOT NULL,
  `modle` varchar(255),
  `type` varchar(255),
  `year` int,
  `mile_in` int,
  `mile_out` int
);

CREATE TABLE `customer`
(
  `policy_id` int PRIMARY KEY,
  `vichicle_id` int,
  `driver_lincese_num` int PRIMARY KEY,
  `full_name` varchar(255),
  `email` varchar(255) UNIQUE,
  `gender` varchar(255),
  `date_of_birth` varchar(255)
);

CREATE TABLE `rent_policy`
(
  `policy_id` int,
  `vichicle_id` int,
  `amount` int,
  `date` varchar(255)
);

CREATE TABLE `member`
(
  `full_name` varchar(255),
  `email` varchar(255) UNIQUE,
  `type` varchar(255),
  `discount` int
);

CREATE TABLE `bill`
(
  `policy_id` int,
  `discount` int,
  `final_amount` int,
  `pay_type` varchar(255),
  `card_number` int
);

ALTER TABLE `customer` ADD FOREIGN KEY (`vichicle_id`) REFERENCES `car` (`vichicle_id`);

ALTER TABLE `rent_policy` ADD FOREIGN KEY (`policy_id`) REFERENCES `customer` (`policy_id`);

ALTER TABLE `rent_policy` ADD FOREIGN KEY (`vichicle_id`) REFERENCES `car` (`vichicle_id`);

ALTER TABLE `member` ADD FOREIGN KEY (`email`) REFERENCES `customer` (`email`);

ALTER TABLE `bill` ADD FOREIGN KEY (`policy_id`) REFERENCES `rent_policy` (`policy_id`);

ALTER TABLE `bill` ADD FOREIGN KEY (`discount`) REFERENCES `customer` (`policy_id`);
