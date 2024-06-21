-- Creation of the database and selection of it
DROP DATABASE IF EXISTS `la-abejita-22-db`;
CREATE DATABASE `la-abejita-22-db`;
USE `la-abejita-22-db`;

-- Creation of the password_reset_tokens table
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Creation of the Users table
CREATE TABLE `users` (
  `user_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_first_name` VARCHAR(50) NOT NULL,
  `user_last_name` VARCHAR(50) NOT NULL,
  `user_email` VARCHAR(70) NOT NULL, 
  `user_username` VARCHAR(20) NOT NULL, 
  `user_password` VARCHAR(70) NOT NULL, 
  `user_address` VARCHAR(30) DEFAULT NULL, 
  `user_phone_number` DECIMAL(10,0) DEFAULT NULL, 
  `user_image_url` VARCHAR(100) DEFAULT '/images/users/nf.jpg',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` INT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Inserting data into the Users table
INSERT INTO `users` (`user_id`, `user_first_name`, `user_last_name`, `user_email`, `user_username`, `user_password`, `user_address`, `user_phone_number`, `user_image_url`, `role_id`) VALUES
(1 ,'Andrés', 'Gutiérrez Hurtado', 'andres52885241@gmail.com', 'Andres_Gutierrez', '1234', 'Dg 86D Sur 70C-31', 3209202177, '/images/users/nf.jpg', 2),
(2 ,'Wendy Alejandra', 'Navarro Arias', 'nwendy798@gmail.com', 'Wendy_Navarro', '1234', 'Kalamary V, El ensueño', 3044462452, '/images/users/nf.jpg', 1);

-- Creation of the Roles table
CREATE TABLE `roles` (
  `role_id` INT PRIMARY KEY NOT NULL, 
  `role_name` VARCHAR(20) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Inserting data into the Roles table
INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'cliente'),
(2, 'administrador');

-- Creation of the Products table
CREATE TABLE `products` (
  `product_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
  `product_name` VARCHAR(100) NOT NULL, 
  `product_description` VARCHAR(100) NOT NULL,
  `product_image_url` VARCHAR(100) DEFAULT '/images/products/nf.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Inserting data into the Products table
INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `product_image_url`) VALUES
(1, 'Blazer escolar', 'Blazer para uniforme escolar.', '/images/products/1.jpg'),
(2, 'Chaleco negro', 'Chaleco formal para uniforme escolar.', '/images/products/2.jpg'),
(3, 'Camisa blanca', 'Camisa blanca para uniforme escolar.', '/images/products/3.jpg'),
(4, 'Pantalón gris', 'Pantalón de vestir gris para uniforme escolar.', '/images/products/4.jpg'),
(5, 'Corbata', 'Corbata azul obscura para uniforme escolar.', '/images/products/5.jpg'),
(6, 'Jardinera', 'Jardinera de mezclilla para uniforme escolar.', '/images/products/6.jpg'),
(7, 'Chaqueta sudadera', 'Chaqueta estilo sudadera para uniforme escolar.', '/images/products/7.jpg'),
(8, 'Pantalón sudadera', 'Pantalón estilo sudadera para uniforme escolar.', '/images/products/8.jpg'),
(9, 'Camiseta polo', 'Camiseta tipo polo para uniforme escolar.', '/images/products/9.jpg'),
(10, 'Pantaloneta', 'Pantaloneta para actividades deportivas escolares.', '/images/products/10.jpg');

-- Creation of the Sizes table
CREATE TABLE `sizes` (
  `size_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `size_name` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Inserting data into the Sizes table
INSERT INTO `sizes` (`size_id`, `size_name`) VALUES
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, 'XXL'),
(7, 'XXXL');

-- Creation of the Products Sizes table
CREATE TABLE `products_sizes` (
  `product_size_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `product_size_stock` INT NOT NULL,
  `product_size_price` DECIMAL(10,2) NOT NULL,
  `size_id` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Inserting data into the Products Sizes table with Colombian prices
INSERT INTO `products_sizes` (`product_id`, `product_size_stock`, `product_size_price`, `size_id`) VALUES
-- Blazer escolar
(1, 10, 85000.00, 3),  -- M
(1, 8, 85000.00, 4),   -- L
(1, 5, 85000.00, 5),   -- XL
-- Chaleco negro
(2, 10, 65000.00, 2),  -- S
(2, 8, 65000.00, 3),   -- M
(2, 6, 65000.00, 4),   -- L
-- Camisa blanca
(3, 15, 52000.00, 2),  -- S
(3, 20, 52000.00, 3),  -- M
(3, 18, 52000.00, 4),  -- L
-- Pantalón gris
(4, 12, 98000.00, 3),  -- M
(4, 10, 98000.00, 4),  -- L
(4, 8, 98000.00, 5),   -- XL
-- Corbata
(5, 25, 32000.00, 1),   -- XS
(5, 20, 32000.00, 2),   -- S
(5, 15, 32000.00, 3),   -- M
-- Jardinera
(6, 8, 118000.00, 3),   -- M
(6, 6, 118000.00, 4),   -- L
(6, 4, 118000.00, 5),   -- XL
-- Chaqueta sudadera
(7, 15, 76000.00, 2),  -- S
(7, 20, 76000.00, 3),  -- M
(7, 18, 76000.00, 4),  -- L
-- Pantalón sudadera
(8, 12, 65000.00, 3),  -- M
(8, 10, 65000.00, 4),  -- L
(8, 8, 65000.00, 5),   -- XL
-- Camiseta polo
(9, 20, 42000.00, 2),  -- S
(9, 25, 42000.00, 3),  -- M
(9, 18, 42000.00, 4),  -- L
-- Pantaloneta
(10, 25, 32000.00, 2),  -- S
(10, 30, 32000.00, 3),  -- M
(10, 20, 32000.00, 4);  -- L

-- Creation of the Schools table
CREATE TABLE `schools` (
  `school_id` INT PRIMARY KEY NOT NULL,
  `school_name` VARCHAR(100) NOT NULL,
  `school_address` VARCHAR(200) NOT NULL,
  `school_image_url` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Inserting data into the Schools table
INSERT INTO `schools` (`school_id`,`school_name`,`school_address`, `school_image_url`) VALUES
(1, 'IED El Ensueño', 'Tv. 70c #11 a 67a, Bogotá', '/images/schools/1.jpg'),
(2, 'Colegio Angela Restrepo Moreno', 'Cl. 69 Sur #71g-12, Bogotá', '/images/schools/2.jpg'),
(3, 'Colegio Emma Reyes', 'Cra. 80b #6-71, Bogotá', '/images/schools/3.jpg'),
(4, 'Colegio María Mercedes Carranza', 'El Perdomo, Tv. 70g #65 Sur-2, Bogotá', '/images/schools/4.jpg'),
(5, 'Colegio Distrital Agudelo Restrepo IED', 'Tv. 70d, Bogotá', '/images/schools/nf.jpg');

-- Creación de la tabla intermedia product_school
CREATE TABLE `school_products` (
  `product_school_id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `product_id` INT NOT NULL,
  `school_id` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insertar datos de ejemplo en la tabla school_products
INSERT INTO `school_products` (`product_id`, `school_id`) VALUES
-- Colegio El Ensueño
(1, 1), -- Blazer escolar
(2, 1), -- Chaleco negro
(3, 1), -- Camisa blanca
(4, 1), -- Pantalón gris
(5, 1), -- Corbata
(6, 1), -- Jardinera
(7, 1), -- Chaqueta sudadera
(8, 1), -- Pantalón sudadera
(9, 1), -- Camiseta polo
(10, 1), -- Pantaloneta
-- Colegio Angela Restrepo Moreno
(1, 2), -- Blazer escolar
(2, 2), -- Chaleco negro
(3, 2), -- Camisa blanca
(4, 2), -- Pantalón gris
(5, 2), -- Corbata
(6, 2), -- Jardinera
(7, 2), -- Chaqueta sudadera
(8, 2), -- Pantalón sudadera
(9, 2), -- Camiseta polo
(10, 2), -- Pantaloneta
-- Colegio Emma Reyes
(1, 3), -- Blazer escolar
(2, 3), -- Chaleco negro
(3, 3), -- Camisa blanca
(4, 3), -- Pantalón gris
(5, 3), -- Corbata
(6, 3), -- Jardinera
(7, 3), -- Chaqueta sudadera
(8, 3), -- Pantalón sudadera
(9, 3), -- Camiseta polo
(10, 3), -- Pantaloneta
-- Colegio María Mercedes Carranza
(4, 4), -- Pantalón gris
-- Colegio Distrital Agudelo Restrepo IED
(3, 5), -- Camisa blanca
(4, 5); -- Pantalón gris

-- Creation of the Orders table
CREATE TABLE `orders` (
  `order_id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `user_id` INT NOT NULL,
  `order_date` DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Creation of the Payment Details table
CREATE TABLE `payments_details` (
  `payment_id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `order_id` INT NOT NULL,
  `payer_full_name` VARCHAR(70) NOT NULL,
  `payer_email` VARCHAR(70) NOT NULL,
  `payer_phone_number` DECIMAL(10, 0) NOT NULL,
  `payer_document_type` ENUM('CC', 'CE', 'TI') NOT NULL,
  `payer_document_number` DECIMAL(10, 0) NOT NULL,
  `payment_method` INT NOT NULL,
  `payment_status` INT NOT NULL,
  `payment_date` DATE NOT NULL,
  `payment_time` TIME NOT NULL,
	`payment_amount` DECIMAL(10, 2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Creation of the Sold Products table
CREATE TABLE `sold_products`(
	`order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `sold_product_quantity` INT NOT NULL,
  `sold_product_price` DECIMAL(10, 2)
);

-- ------------------------------- RELATIONSHIPS -------------------------------

ALTER TABLE `users`
ADD CONSTRAINT `fk_user_role_id`
FOREIGN KEY (`role_id`)
REFERENCES `roles`(`role_id`)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE `products_sizes` 
ADD CONSTRAINT `fk_product_size_product_id`
FOREIGN KEY (`product_id`)
REFERENCES `products`(`product_id`)
ON UPDATE CASCADE
ON DELETE CASCADE,
ADD CONSTRAINT `fk_product_size_size_id`
FOREIGN KEY (`size_id`)
REFERENCES `sizes`(`size_id`)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE `orders` 
ADD CONSTRAINT `fk_order_user_id`
FOREIGN KEY (`user_id`)
REFERENCES `users`(`user_id`)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE `payments_details` 
ADD CONSTRAINT `fk_payment_detail_order_id`
FOREIGN KEY (`order_id`)
REFERENCES `orders`(`order_id`)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE `sold_products` 
ADD CONSTRAINT `fk_sold_product_product_id`
FOREIGN KEY (`product_id`)
REFERENCES `products`(`product_id`)
ON UPDATE CASCADE
ON DELETE CASCADE,
ADD CONSTRAINT `fk_sold_product_order_id`
FOREIGN KEY (`order_id`)
REFERENCES `orders`(`order_id`)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE `school_products`
ADD CONSTRAINT `school_product_product_id`
FOREIGN KEY (`product_id`) 
REFERENCES `products`(`product_id`)
ON UPDATE CASCADE
ON DELETE CASCADE,
ADD CONSTRAINT `school_product_school_id`
FOREIGN KEY (`school_id`) 
REFERENCES `schools`(`school_id`)
ON UPDATE CASCADE
ON DELETE CASCADE;