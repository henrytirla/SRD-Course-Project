DROP DATABASE IF EXISTS `retail_chains`;
CREATE DATABASE IF NOT EXISTS `retail_chains`;

USE `retail_chains`;

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  id int NOT NULL,
  name VARCHAR(40) NULL,
  code CHAR(4) NULL ,
  language VARCHAR(10) NULL ,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  id INT AUTO_INCREMENT NOT NULL ,
  street_address VARCHAR(255) NULL,
  postal_code VARCHAR(12) NULL,
  city VARCHAR(30) NOT NULL,
  region VARCHAR(25) NULL,
  country_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX `country_id_index` (`country_id`),
  CONSTRAINT location_country_id FOREIGN KEY (country_id) references `country` (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `retail_chain`;
CREATE TABLE IF NOT EXISTS `retail_chain` (
    id INT AUTO_INCREMENT NOT NULL ,
    name VARCHAR(30) NOT NULL,
    industry VARCHAR(30) NOT NULL ,
    founded_year VARCHAR(10),
    headquarter VARCHAR(10),
    revenue VARCHAR(100),
    url TEXT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY (id),
    INDEX `country_id_index` (`country_id`),
    CONSTRAINT retail_chain_country_id FOREIGN KEY (country_id) references `country` (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  id INT AUTO_INCREMENT NOT NULL,
  store_name VARCHAR(30) NOT NULL,
  retail_chain_id INT NULL,
  location_id INT NULL,
  PRIMARY KEY (id),
  INDEX `retail_chain_id_index` (`retail_chain_id`),
  INDEX `location_id_index` (`location_id`),
  CONSTRAINT store_retail_chain_id FOREIGN KEY (retail_chain_id) references `retail_chain` (id),
  CONSTRAINT store_location_id FOREIGN KEY (location_id) references `location` (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
    id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(35) NOT NULL,
    min_salary decimal(6,0) NULL,
    max_salary decimal(6,0) NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  id INT AUTO_INCREMENT NOT NULL,
  first_name VARCHAR(20) NULL,
  last_name VARCHAR(25) NOT NULL,
  email VARCHAR(25) NOT NULL,
  phone_number VARCHAR(20) NULL,
  hire_date date NOT NULL,
  store_id INT NOT NULL,
  job_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX `store_id_index` (`store_id`),
  INDEX `job_id_index` (`job_id`),
  CONSTRAINT fk_employee_store_id FOREIGN KEY (store_id) references `store` (id),
  CONSTRAINT fk_employee_job_id FOREIGN KEY (job_id) references `job` (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier`(
	id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(100),
	contact_name VARCHAR(100),
	contact_title VARCHAR(100),
	phone VARCHAR(25),
	location_id INT NOT NULL,
    PRIMARY KEY (id),
    INDEX `location_id_index` (`location_id`),
    CONSTRAINT supplier_location_id FOREIGN KEY (location_id) references `location` (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category`(
  id INT AUTO_INCREMENT NOT NULL ,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product`(
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    picture VARCHAR(250) DEFAULT 'No_image_available.svg' NOT NULL,
    weight DOUBLE NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    supplier_id INT NOT NULL,
    PRIMARY KEY (id),
    INDEX `category_id_index` (`category_id`),
    INDEX `supplier_id_index` (`supplier_id`),
    CONSTRAINT fk_product_category_od FOREIGN KEY (category_id) REFERENCES `category`(id),
    CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES `supplier`(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `supply_process`;
CREATE TABLE IF NOT EXISTS `supply_process`(
    supplier_id INT NOT NULL,
	product_id INT NOT NULL,
	store_id INT NOT NULL,
	date DATETIME NOT NULL,
	quantity DOUBLE,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME,
	PRIMARY KEY (supplier_id, product_id, store_id, date),
    INDEX `supplier_id_index` (`supplier_id`),
    INDEX `product_id_index` (`product_id`),
    INDEX `store_id_index` (`store_id`),
	CONSTRAINT fk_supply_process_supplier_id FOREIGN KEY (supplier_id) REFERENCES `supplier`(id),
	CONSTRAINT fk_supply_process_product_id FOREIGN KEY (product_id) REFERENCES `product`(id),
	CONSTRAINT fk_supply_process_store_id FOREIGN KEY (store_id) REFERENCES `store`(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `store_products`;
CREATE TABLE IF NOT EXISTS `store_products`(
    id INT AUTO_INCREMENT,
	store_id INT NOT NULL ,
    product_id INT NOT NULL ,
    price DECIMAL(10,2) NOT NULL,
    quantity INT DEFAULT 0 NOT NULL,
    rate DECIMAL(2, 1) DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME,
    PRIMARY KEY (id),
    INDEX `store_id_index` (`store_id`),
    INDEX `product_id_index` (`product_id`),
    CONSTRAINT fk_store_products_store_id FOREIGN KEY (store_id) REFERENCES `store`(id),
    CONSTRAINT fk_store_products_product_id FOREIGN KEY (product_id) REFERENCES `product`(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer`(
    id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(20) DEFAULT NULL,
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(25) NOT NULL,
    phone_number VARCHAR(20) DEFAULT NULL,
    address varchar(255),
	gender ENUM('Male', 'Female', 'Other'),
	date_of_birth date,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  id INT AUTO_INCREMENT NOT NULL,
  customer_id INT NOT NULL,
  store_id INT NOT NULL,
  code VARCHAR(25) UNIQUE,
  time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  description VARCHAR(255) NOT NULL,
  payment_method ENUM('Cash','Net Banking','Credit Card','Debit Card') DEFAULT 'Cash' NOT NULL,
  type ENUM('Online', 'Store'),
  amount DECIMAL(10,2) NOT NULL DEFAULT 0,
  status ENUM('Pending', 'InProgress', 'Done') DEFAULT 'Pending',
  employee_id INT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME,
  PRIMARY KEY (id),
  INDEX `code_index` (`code`),
  INDEX `time_index` (`time`),
  INDEX `customer_id_index` (`customer_id`),
  INDEX `store_id_index` (`store_id`),
  INDEX `employee_id_index` (`employee_id`),
  CONSTRAINT fk_order_customer_id FOREIGN KEY (customer_id) REFERENCES `customer`(id),
  CONSTRAINT fk_order_store_id FOREIGN KEY (store_id) REFERENCES `store`(id),
  CONSTRAINT FOREIGN KEY fk_order_employee_id(employee_id) REFERENCES `employee`(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `order_products`;
CREATE TABLE IF NOT EXISTS `order_products` (
  order_id INT NOT NULL,
  store_product_id INT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL DEFAULT 0,
  amount DECIMAL(10,2) NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME,
  PRIMARY KEY (order_id, store_product_id),
  INDEX `order_id_index` (`order_id`),
  INDEX `store_product_id_index` (`store_product_id`),
  CONSTRAINT fk_order_products_order_id FOREIGN KEY (order_id) references `orders`(id),
  CONSTRAINT fk_order_products_store_products_id FOREIGN KEY (store_product_id) references `store_products`(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
	id INT AUTO_INCREMENT NOT NULL,
	customer_id INT NOT NULL,
	store_id INT NOT NULL,
	order_id INT NOT NULL,
    discount DECIMAL(10,2) DEFAULT 0,
    tax_rate DECIMAL(10,2) DEFAULT 5,
    tax DECIMAL(10,2) DEFAULT 0,
    sub_total DECIMAL(10,2) DEFAULT 0,
    total DECIMAL(10,2) DEFAULT 0,
	date_of_purchase DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	payment_method VARCHAR(40),
	employee_id INT NOT NULL,
	PRIMARY KEY(id),
	UNIQUE (customer_id, store_id, order_id),
	INDEX `customer_id_index` (`customer_id`),
	INDEX `store_id_index` (`store_id`),
	INDEX `order_id_index` (`order_id`),
	INDEX `employee_id_index` (`employee_id`),
	CONSTRAINT FOREIGN KEY fk_transaction_customer_id(customer_id) REFERENCES `customer`(id),
	CONSTRAINT FOREIGN KEY fk_transaction_store_id(store_id) REFERENCES `store`(id),
	CONSTRAINT FOREIGN KEY fk_transaction_order_id(order_id) REFERENCES `orders`(id),
	CONSTRAINT FOREIGN KEY fk_transaction_employee_id(employee_id) REFERENCES `employee`(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `product_rate`;
CREATE TABLE IF NOT EXISTS `product_rate`(
    id INT AUTO_INCREMENT,
    customer_id INT NOT NULL ,
    store_id INT NOT NULL ,
    product_id INT NOT NULL ,
    rate DECIMAL(2, 1),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME,
    PRIMARY KEY (id),
    UNIQUE (customer_id, store_id, product_id),
    INDEX `store_id_index` (`store_id`),
	INDEX `product_id_index` (`product_id`),
	INDEX `customer_id_index` (`customer_id`),
    CONSTRAINT FOREIGN KEY fk_product_rate_store_id(store_id) REFERENCES `store`(id),
    CONSTRAINT fk_product_rate_products_id FOREIGN KEY (product_id) REFERENCES `product`(id),
    CONSTRAINT fk_product_rate_customer_id FOREIGN KEY (customer_id) REFERENCES `customer`(id),
    CONSTRAINT chk_Ratings CHECK (rate >= 0 AND rate <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs`(
    id BIGINT unsigned AUTO_INCREMENT,
    l_table VARCHAR(250) ,
    l_action VARCHAR(250) ,
    row_identifier VARCHAR(250) ,
    new_value TEXT,
    logged_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;