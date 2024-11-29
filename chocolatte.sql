# ************************************************************
# Sequel Ace SQL dump
# Version 20077
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Hôte: 127.0.0.1 (MySQL 8.0.27)
# Base de données: sgc_chocolatte
# Temps de génération: 2024-11-22 10:58:16 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump de la table employees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `job` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump de la table menu_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_page`;

CREATE TABLE `menu_page` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `page_id` int unsigned NOT NULL,
  `section_id` int unsigned DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `target` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `menu_page_menu_id_menus_id` (`menu_id`),
  KEY `menu_page_page_id_pages_id` (`page_id`),
  KEY `menu_page_section_id_sections_id` (`section_id`),
  CONSTRAINT `menu_page_menu_id_menus_id` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_page_page_id_pages_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_page_section_id_sections_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump de la table menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_location_unique` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump de la table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump de la table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `template` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump de la table product_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int unsigned NOT NULL,
  `pre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_categories_parent_id_product_categories_id` (`parent_id`),
  CONSTRAINT `product_categories_parent_id_product_categories_id` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump de la table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` int NOT NULL,
  `discount` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_category_id_product_categories_id` (`product_category_id`),
  CONSTRAINT `products_product_category_id_product_categories_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump de la table reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cover_img` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar_img` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `rating` int NOT NULL,
  `certified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump de la table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `page_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` json DEFAULT NULL,
  `order` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `sections_page_id_pages_id` (`page_id`),
  CONSTRAINT `sections_page_id_pages_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



delete from employees;
delete from messages;
delete from product_categories;
delete from products;
delete from reviews;


insert into employees (  id,
                       name,
                       job,
                       description,
                       img,
                       created_at,
                       updated_at)
values (1,
        'Julie',
        'Barista',
        'Julie travaille depuis 2019 chez nous.',
        './images/team/smiley-business-woman-working-cashier.jpg',
        '2019-08-27',
        sysdate()),
        (2,
        'Anna',
        'Barista',
        'Anna est une personne très joyeuse et travaille depuis 2021 chez nous.',
        './images/team/cute-korean-barista-girl-pouring-coffee-prepare-filter-batch-brew-pour-working-cafe.jpg',
        '2021-11-20',
        sysdate()),
        (3,
        'Frederico',
        'Manager',
        'Frederico travaille depuis 2015 chez nous.',
        './images/team/small-business-owner-drinking-coffee.jpg',
        '2015-04-17',
        sysdate()),
        (4,
        'David',
        'Propriétaire',
        'David a ouvert Chocolatte en 2013.',
        './images/team/portrait-elegant-old-man-wearing-suit.jpg',
        '2013-08-27',
        sysdate());


insert into messages (id, name, email, content, created_at, updated_at)
values ('1',
        'Véronique',
        'véroniquedupont@gmail.be',
        'J’ai bien aimé le service de votre établissement.',
        '2017-04-26',
        sysdate()),
        ('2',
        'Jean',
        'jeanJaques@gmail.be',
        'Je veux commander un bon cadeau pour ma femme.',
        '2018-09-06',
        sysdate()),
        ('3',
        'Amélie',
        'Amelie123@gmail.be',
        'Je veux bien précommander un cadeau de chocolat et café pour ma copine qui aura 25 ans cette année.',
        '2021-07-01',
        sysdate()),
        ('4',
        'Brigitte',
        'brigittepaquet@gmail.be',
        'Je me plains de la qualité du café. Il n’y avait pas de lait quand j’étais là.',
        '2023-02-26',
        sysdate());


insert into product_categories( id,
                                parent_id,
                                `order`,
                                pre,
                                title,
                                created_at,
                                updated_at)
values ( '1',
         'Déjeuner',
         '1',
         'Déjeuner délicieux',
        'Déjeuner',
        '2015-09-03',
        sysdate()),
    ( '2',
         'Déjeuner',
         '2',
         'Coffee lovers',
        'Café',
        '2015-09-03',
        sysdate());

insert into products(id,
                     product_category_id,
                    name,
                    description,
                    tag,
                    price,
                    discount,
                    created_at,
                    updated_at,
                    deleted_at)
values ('1',
        'Déjeuner',
        'Pancake',
        'deux pancake avec de la confiture de fraises et un café.',
        '',
        '7.35€',
        '',
        '2015-01-05',
        sysdate(),
        ''),
        ('2',
        'Déjeuner',
        'Croissant-fraise',
        'Un croissant avec du beurre et de la confiture de fraises.',
        'recommend',
        '5.30€',
        '',
        '2015-01-05',
        sysdate(),
        ''),
         ('3',
        'Déjeuner',
        'Banana Cake',
        'Un morceau de tarte aux bananes avec un café.',
        '',
        '6.99€',
        '5.00€',
        '2015-01-05',
        sysdate(),
        ''),
        ('4',
        'Café',
        'Latte',
        'Un café avec du lait.',
        'recommend',
        '5.15€',
        '',
        '2015-01-05',
        sysdate(),
        ''),
         ('5',
        'Café',
        'Chocolat chaud',
        'Un chocolat chaud avec du des bisquits et du chantilly.',
        'recommend',
        '5.99€',
        '',
        '2015-01-05',
        sysdate(),
        ''),
          ('6',
        'Café',
        'Thée vert',
        'Un thé vert avec du lait et des bisquits.',
        '',
        '6.55€',
        '',
        '2015-01-05',
        sysdate(),
        ''),
           ('7',
        'Déjeuner',
        'Pain fromage et pain jambon',
        'Un Pain fromage et un pain jambon frais .',
        'recommend',
        '9.99€',
        '',
        '2015-01-05',
        sysdate(),
        ''),
            ('8',
        'Déjeuner',
        'Pain au chocolat et pain au jambon',
        'Un pain au chocolat avec un petit pain au jambon.',
        'recommend',
        '9.99€',
        '7.99€',
        '2015-01-05',
        sysdate(),
        '');



insert into reviews (id,
                    customer,
                    cover_img,
                    avatar_img,
                    content,
                    rating,
                    certified_at,
                    created_at,
                    updated_at)
values ('1',
        'Véronique',
        './images/slides/mid-section-waitress-wiping-espresso-machine-with-napkin-cafa-c.jpg',
        './images/reviews/young-woman-with-round-glasses-yellow-sweater.jpg',
        'J’ai bien aimé le service de votre établissement.',
        '4',
        '2023-07-09',
        '2023-07-08',
        sysdate()),
        ('2',
        'Amélie',
        './images/slides/mid-section-waitress-wiping-espresso-machine-with-napkin-cafa-c.jpg',
        './images/reviews/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair.jpg',
        'L‘ambiance est bonne et le patron est très sympa.',
        '5',
        '2021-04-05',
        '2023-04-04',
        sysdate()),
        ('3',
        'Jean',
        './images/slides/mid-section-waitress-wiping-espresso-machine-with-napkin-cafa-c.jpg',
        './images/reviews/senior-man-white-sweater-eyeglasses.jpg',
        'J’ai mangé très bien ici. Le personnel est sympa et très attentif. La décoration est bien faite et les produits sont frais.',
        '4.5',
        '2018-02-26',
        '2018-02-25',
        sysdate());


commit;


select `name`, `job`, `description`, `img`
FROM `employees`
order by `name` ASC
LIMIT 4;