-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: oscommerce_db
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `entry_gender` char(1) DEFAULT NULL,
  `entry_company` varchar(255) DEFAULT NULL,
  `entry_firstname` varchar(255) NOT NULL,
  `entry_lastname` varchar(255) NOT NULL,
  `entry_street_address` varchar(255) NOT NULL,
  `entry_suburb` varchar(255) DEFAULT NULL,
  `entry_postcode` varchar(255) NOT NULL,
  `entry_city` varchar(255) NOT NULL,
  `entry_state` varchar(255) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT 0,
  `entry_zone_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_format`
--

DROP TABLE IF EXISTS `address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL,
  `address_summary` varchar(48) NOT NULL,
  PRIMARY KEY (`address_format_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_format`
--

LOCK TABLES `address_format` WRITE;
/*!40000 ALTER TABLE `address_format` DISABLE KEYS */;
INSERT INTO `address_format` VALUES (1,'$name$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country'),(2,'$name$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country'),(3,'$name$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country'),(4,'$name$cr$streets$cr$city ($postcode)$cr$country','$postcode / $country'),(5,'$name$cr$streets$cr$postcode $city$cr$country','$city / $country');
/*!40000 ALTER TABLE `address_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advert`
--

DROP TABLE IF EXISTS `advert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advert` (
  `advert_id` int(11) NOT NULL AUTO_INCREMENT,
  `advert_title` varchar(64) NOT NULL,
  `advert_url` varchar(255) NOT NULL,
  `advert_fragment` varchar(255) NOT NULL,
  `advert_image` varchar(64) NOT NULL,
  `advert_group` varchar(64) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`advert_id`),
  KEY `idx_advert_group` (`advert_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advert`
--

LOCK TABLES `advert` WRITE;
/*!40000 ALTER TABLE `advert` DISABLE KEYS */;
/*!40000 ALTER TABLE `advert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advert_info`
--

DROP TABLE IF EXISTS `advert_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advert_info` (
  `advert_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `advert_html_text` text DEFAULT NULL,
  PRIMARY KEY (`advert_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advert_info`
--

LOCK TABLES `advert_info` WRITE;
/*!40000 ALTER TABLE `advert_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `advert_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`categories_id`),
  KEY `idx_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,0,1,'2026-10-16 20:48:29',NULL),(2,NULL,0,2,'2026-10-16 20:48:29',NULL),(3,NULL,0,3,'2026-10-16 20:48:29',NULL),(4,NULL,0,4,'2026-10-16 20:48:29',NULL),(5,NULL,0,5,'2026-10-16 20:48:29',NULL),(6,NULL,0,6,'2026-10-16 20:48:29',NULL),(7,NULL,0,7,'2026-10-16 20:48:29',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_description`
--

DROP TABLE IF EXISTS `categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `categories_name` varchar(255) NOT NULL,
  `categories_description` text DEFAULT NULL,
  `categories_seo_description` text DEFAULT NULL,
  `categories_seo_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name` (`categories_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_description`
--

LOCK TABLES `categories_description` WRITE;
/*!40000 ALTER TABLE `categories_description` DISABLE KEYS */;
INSERT INTO `categories_description` VALUES (1,1,'Peralatan Masak',NULL,NULL,NULL),(1,2,'Peralatan Masak',NULL,NULL,NULL),(2,1,'Penyimpanan',NULL,NULL,NULL),(2,2,'Penyimpanan',NULL,NULL,NULL),(3,1,'Peralatan Makan',NULL,NULL,NULL),(3,2,'Peralatan Makan',NULL,NULL,NULL),(4,1,'Dekorasi Rumah',NULL,NULL,NULL),(4,2,'Dekorasi Rumah',NULL,NULL,NULL),(5,1,'Tekstil',NULL,NULL,NULL),(5,2,'Tekstil',NULL,NULL,NULL),(6,1,'Kebersihan',NULL,NULL,NULL),(6,2,'Kebersihan',NULL,NULL,NULL),(7,1,'Skincare',NULL,NULL,NULL),(7,2,'Skincare',NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` varchar(255) NOT NULL,
  `configuration_key` varchar(255) NOT NULL,
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `use_function` varchar(255) DEFAULT NULL,
  `set_function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `uq_configuration_key` (`configuration_key`)
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'Store Name','STORE_NAME','Dwell&Co Fine Home & Living','The name of my store',1,1,NULL,'2026-10-16 20:46:41',NULL,NULL),(2,'Store Owner','STORE_OWNER','Dwell&Co','The name of my store owner',1,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(3,'E-Mail Address','STORE_OWNER_EMAIL_ADDRESS','rayzasix@gmail.com','The e-mail address of my store owner',1,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(4,'Template Selection','TEMPLATE_SELECTION','override','The template to use to display the shop.',1,5,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_template('),(5,'Country','STORE_COUNTRY','100','The country my store is located in <br><br><strong>Note: Please remember to update the store zone.</strong>',1,6,NULL,'2026-10-16 20:46:41','tep_get_country_name','tep_cfg_pull_down_country_list('),(6,'Zone','STORE_ZONE','0','The zone my store is located in',1,7,NULL,'2026-10-16 20:46:41','tep_cfg_get_zone_name','tep_cfg_pull_down_zone_list('),(7,'Switch To Default Language Currency','USE_DEFAULT_LANGUAGE_CURRENCY','false','Automatically switch to the language\'s currency when it is changed',1,10,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(8,'Send Extra Order Emails To','SEND_EXTRA_ORDER_EMAILS_TO','','Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',1,11,NULL,'2026-10-16 20:46:41',NULL,NULL),(9,'Display Cart After Adding Product','DISPLAY_CART','true','Display the shopping cart after adding a product (or return back to their origin)',1,14,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(10,'Default Search Operator','ADVANCED_SEARCH_DEFAULT_OPERATOR','and','Default search operators',1,17,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'and\', \'or\'], '),(11,'Store Address','STORE_ADDRESS','Dwell&Co Fine Home & Living\nBandung, Indonesia\nCP: 0857-6781-2257','This is the Address of my store used on printable documents and displayed online',1,18,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_textarea('),(12,'Store Phone','STORE_PHONE','085767812257','This is the phone number of my store used on printable documents and displayed online',1,19,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_textarea('),(13,'Tax Decimal Places','TAX_DECIMAL_PLACES','0','Pad the tax value this amount of decimal places',1,20,NULL,'2026-10-16 20:46:41',NULL,NULL),(14,'Display Prices with Tax','DISPLAY_PRICE_WITH_TAX','false','Display prices with tax included (true) or add the tax at the end (false)',1,21,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(15,'Allow all Reviews?','ALLOW_ALL_REVIEWS','false','Allow customers to leave reviews on all products (true) or only on products they have purchased (false)',1,22,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(16,'Address Book Entries','MAX_ADDRESS_BOOK_ENTRIES','5','Maximum address book entries a customer is allowed to have',3,1,NULL,'2026-10-16 20:46:41',NULL,NULL),(17,'Search Results','MAX_DISPLAY_SEARCH_RESULTS','20','Amount of products to list',3,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(18,'Page Links','MAX_DISPLAY_PAGE_LINKS','5','Number of \'number\' links use for page-sets',3,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(19,'Selection of Random Reviews','MAX_RANDOM_SELECT_REVIEWS','10','How many records to select from to choose one random product review',3,10,NULL,'2026-10-16 20:46:41',NULL,NULL),(20,'Selection of Random New Products','MAX_RANDOM_SELECT_NEW','10','How many records to select from to choose one random new product to display',3,11,NULL,'2026-10-16 20:46:41',NULL,NULL),(21,'Selection of Products on Special','MAX_RANDOM_SELECT_SPECIALS','10','How many records to select from to choose one random product special to display',3,12,NULL,'2026-10-16 20:46:41',NULL,NULL),(22,'Maximum to Display','MODULE_BOXES_BEST_SELLERS_MAX_DISPLAY','10','Maximum number of best sellers to display',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(23,'Customer Order History Box','MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX','6','Maximum number of products to display in the customer order history box',3,17,NULL,'2026-10-16 20:46:41',NULL,NULL),(24,'Order History','MAX_DISPLAY_ORDER_HISTORY','10','Maximum number of orders to display in the order history page',3,18,NULL,'2026-10-16 20:46:41',NULL,NULL),(25,'Product Quantities In Shopping Cart','MAX_QTY_IN_CART','99','Maximum number of product quantities that can be added to the shopping cart (0 for no limit)',3,19,NULL,'2026-10-16 20:46:41',NULL,NULL),(26,'Small Image Width','SMALL_IMAGE_WIDTH','100','The pixel width of small images',4,1,NULL,'2026-10-16 20:46:41',NULL,NULL),(27,'Small Image Height','SMALL_IMAGE_HEIGHT','80','The pixel height of small images',4,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(28,'Heading Image Width','HEADING_IMAGE_WIDTH','57','The pixel width of heading images',4,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(29,'Heading Image Height','HEADING_IMAGE_HEIGHT','40','The pixel height of heading images',4,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(30,'Calculate Image Size','CONFIG_CALCULATE_IMAGE_SIZE','true','Calculate the size of images?',4,7,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(31,'Image Required','IMAGE_REQUIRED','true','Enable to display broken images. Good for development.',4,8,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(32,'Default Image','DEFAULT_IMAGE','','The default image to show if the image is not a valid file.  Leave blank not to show a default.',4,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(33,'Installed Modules','MODULE_PAYMENT_INSTALLED','cod.php','List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cod.php;paypal_express.php)',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(34,'Installed Modules','MODULE_ORDER_TOTAL_INSTALLED','ot_subtotal.php;ot_dw_coupon.php;ot_shipping.php;ot_tax.php;ot_total.php','List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(35,'Installed Modules','MODULE_SHIPPING_INSTALLED','flat.php','List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(36,'Installed Modules','MODULE_ACTION_RECORDER_INSTALLED','ar_admin_login.php;ar_contact_us.php;ar_reset_password.php','List of action recorder module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(37,'Installed Modules','MODULE_CONTENT_NAVBAR_INSTALLED','nb_hamburger_button.php;nb_brand.php;nb_currencies.php;nb_account.php;nb_shopping_cart.php;nb_special_offers.php','List of navbar module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(38,'Enable Cash On Delivery Module','MODULE_PAYMENT_COD_STATUS','True','Do you want to accept Cash On Delevery payments?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(39,'Payment Zone','MODULE_PAYMENT_COD_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2026-10-16 20:46:41','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(40,'Sort order of display.','MODULE_PAYMENT_COD_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(41,'Set Order Status','MODULE_PAYMENT_COD_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2026-10-16 20:46:41','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(42,'Enable Flat Shipping','MODULE_SHIPPING_FLAT_STATUS','True','Do you want to offer flat rate shipping?',6,0,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(43,'Shipping Cost','MODULE_SHIPPING_FLAT_COST','20000.00','The shipping cost for all orders using this shipping method.',6,0,'2026-10-16 21:37:06','2026-10-16 20:46:41',NULL,NULL),(44,'Tax Class','MODULE_SHIPPING_FLAT_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2026-10-16 20:46:41','tep_get_tax_class_title','tep_cfg_pull_down_tax_classes('),(45,'Shipping Zone','MODULE_SHIPPING_FLAT_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2026-10-16 20:46:41','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(46,'Sort Order','MODULE_SHIPPING_FLAT_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(47,'Default Currency','DEFAULT_CURRENCY','IDR','Default Currency',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(48,'Default Language','DEFAULT_LANGUAGE','id','Default Language',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(49,'Default Order Status For New Orders','DEFAULT_ORDERS_STATUS_ID','1','When a new order is created, this order status will be assigned to it.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(50,'Display Shipping','MODULE_ORDER_TOTAL_SHIPPING_STATUS','True','Do you want to display the order shipping cost?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(51,'Sort Order','MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER','20','Sort order of display.',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(52,'Allow Free Shipping','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING','True','Do you want to allow free shipping?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(53,'Free Shipping For Orders Over','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER','250000','Provide free shipping for orders over the set amount.',6,4,NULL,'2026-10-16 20:46:41','currencies->format',NULL),(54,'Provide Free Shipping For Orders Made','MODULE_ORDER_TOTAL_SHIPPING_DESTINATION','national','Provide free shipping for orders sent to the set destination.',6,5,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'national\', \'international\', \'both\'], '),(55,'Display Sub-Total','MODULE_ORDER_TOTAL_SUBTOTAL_STATUS','true','Do you want to display the order sub-total cost?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(56,'Sort Order','MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER','10','Sort order of display.',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(57,'Display Tax','MODULE_ORDER_TOTAL_TAX_STATUS','true','Do you want to display the order tax value?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(58,'Sort Order','MODULE_ORDER_TOTAL_TAX_SORT_ORDER','30','Sort order of display.',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(59,'Display Total','MODULE_ORDER_TOTAL_TOTAL_STATUS','true','Do you want to display the total order value?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(60,'Sort Order','MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER','40','Sort order of display.',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(61,'Minimum Minutes Per E-Mail','MODULE_ACTION_RECORDER_CONTACT_US_EMAIL_MINUTES','15','Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(62,'Allowed Minutes','MODULE_ACTION_RECORDER_ADMIN_LOGIN_MINUTES','5','Number of minutes to allow login attempts to occur.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(63,'Allowed Attempts','MODULE_ACTION_RECORDER_ADMIN_LOGIN_ATTEMPTS','3','Number of login attempts to allow within the specified period.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(64,'Allowed Minutes','MODULE_ACTION_RECORDER_RESET_PASSWORD_MINUTES','5','Number of minutes to allow password resets to occur.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(65,'Allowed Attempts','MODULE_ACTION_RECORDER_RESET_PASSWORD_ATTEMPTS','1','Number of password reset attempts to allow within the specified period.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(66,'Enter the Maximum Package Weight you will ship','SHIPPING_MAX_WEIGHT','50','Carriers have a max weight limit for a single package. This is a common one for all.',7,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(67,'Package Tare weight.','SHIPPING_BOX_WEIGHT','0','What is the weight of typical packaging of small to medium packages?',7,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(68,'Larger packages - percentage increase.','SHIPPING_BOX_PADDING','0','For 10% enter 10',7,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(69,'Allow Orders Not Matching Defined Shipping Zones ','SHIPPING_ALLOW_UNDEFINED_ZONES','True','Should orders be allowed to shipping addresses not matching defined shipping module shipping zones?',7,5,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(70,'Products Per Row','IS_PRODUCT_PRODUCTS_DISPLAY_ROW','row row-cols-2 row-cols-sm-3 row-cols-md-4','How many products should display per Row per viewport?  Default:  XS 2, SM 3, MD and above 4',8,110,NULL,'2026-10-16 20:46:41',NULL,NULL),(71,'Sort Option: Manufacturer Name (0=disable; 1=enable)','PRODUCT_LIST_MANUFACTURER','0','Allow sorting by Manufacturer Name?',8,200,NULL,'2026-10-16 20:46:41',NULL,NULL),(72,'Sort Option: Model (0=disable; 1=enable)','PRODUCT_LIST_MODEL','0','Allow sorting by Product Model?',8,210,NULL,'2026-10-16 20:46:41',NULL,NULL),(73,'Sort Option: Name (0=disable; 1=enable)','PRODUCT_LIST_NAME','1','Allow sorting by Product Name?',8,220,NULL,'2026-10-16 20:46:41',NULL,NULL),(74,'Sort Option: Price (0=disable; 1=enable)','PRODUCT_LIST_PRICE','1','Allow sorting by Product Price',8,230,NULL,'2026-10-16 20:46:41',NULL,NULL),(75,'Sort Option: Stock (0=disable; 1=enable)','PRODUCT_LIST_QUANTITY','0','Allow sorting by Product Quantity (Stock)?',8,240,NULL,'2026-10-16 20:46:41',NULL,NULL),(76,'Sort Option: Weight (0=disable; 1=enable)','PRODUCT_LIST_WEIGHT','0','Allow sorting by Product Weight?',8,250,NULL,'2026-10-16 20:46:41',NULL,NULL),(77,'Sort Option: Latest Added (0=disable; 1=enable)','PRODUCT_LIST_ID','1','Allow sorting by Latest Added?',8,260,NULL,'2026-10-16 20:46:41',NULL,NULL),(78,'Sort Option: Sales (0=disable; 1=enable)','PRODUCT_LIST_ORDERED','1','Allow sorting by Number of Sales?',8,270,NULL,'2026-10-16 20:46:41',NULL,NULL),(79,'Product Image (defunct)','PRODUCT_LIST_IMAGE','0','This is a defunct setting.',8,280,NULL,'2026-10-16 20:46:41',NULL,NULL),(80,'Buy Now column (defunct)','PRODUCT_LIST_BUY_NOW','0','This is a defunct setting.',8,290,NULL,'2026-10-16 20:46:41',NULL,NULL),(81,'Display Category/Manufacturer Filter (0=disable; 1=enable)','PRODUCT_LIST_FILTER','1','Do you want to display the Category/Manufacturer Filter?',8,300,NULL,'2026-10-16 20:46:41',NULL,NULL),(82,'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)','PREV_NEXT_BAR_LOCATION','2','Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)',8,310,NULL,'2026-10-16 20:46:41',NULL,NULL),(83,'Check stock level','STOCK_CHECK','true','Check to see if sufficent stock is available',9,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(84,'Subtract stock','STOCK_LIMITED','true','Subtract product in stock by product orders',9,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(85,'Allow Checkout','STOCK_ALLOW_CHECKOUT','true','Allow customer to checkout even if there is insufficient stock',9,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(86,'Mark product out of stock','STOCK_MARK_PRODUCT_OUT_OF_STOCK','<i class=\"fas fa-times fa-2x text-danger\"></i>','Display something on screen so customer can see which product has insufficient stock',9,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(87,'Stock Re-order level','STOCK_REORDER_LEVEL','5','Define when stock needs to be re-ordered',9,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(88,'Store Page Parse Time','STORE_PAGE_PARSE_TIME','false','Store the time it takes to parse a page',10,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(89,'Log Destination','STORE_PAGE_PARSE_TIME_LOG','/var/log/www/tep/page_parse_time.log','Directory and filename of the page parse time log',10,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(90,'Log Date Format','STORE_PARSE_DATE_TIME_FORMAT','%d/%m/%Y %H:%M:%S','The date format',10,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(91,'Display The Page Parse Time','DISPLAY_PAGE_PARSE_TIME','true','Display the page parse time (store page parse time must be enabled)',10,4,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(92,'Store Database Queries','STORE_DB_TRANSACTIONS','false','Store the database queries in the page parse time log',10,5,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(93,'Cache Directory','DIR_FS_CACHE','/Applications/XAMPP/xamppfiles/htdocs/oscommerce/includes/work/','The directory where the cached files are saved',11,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(94,'E-Mail Transport Method','EMAIL_TRANSPORT','sendmail','Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.',12,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'sendmail\', \'smtp\'],'),(95,'E-Mail Linefeeds','EMAIL_LINEFEED','LF','Defines the character sequence used to separate mail headers.',12,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'LF\', \'CRLF\'],'),(96,'Use MIME HTML When Sending Emails','EMAIL_USE_HTML','false','Send e-mails in HTML format',12,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'],'),(97,'Verify E-Mail Addresses Through DNS','ENTRY_EMAIL_ADDRESS_CHECK','false','Verify e-mail address through a DNS server',12,4,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(98,'Send E-Mails','SEND_EMAILS','true','Send out e-mails',12,5,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(99,'Enable download','DOWNLOAD_ENABLED','false','Enable the products download functions.',13,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(100,'Download by redirect','DOWNLOAD_BY_REDIRECT','false','Use browser redirection for download. Disable on non-Unix systems.',13,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(101,'Expiry delay (days)','DOWNLOAD_MAX_DAYS','7','Set number of days before the download link expires. 0 means no limit.',13,3,NULL,'2026-10-16 20:46:41',NULL,''),(102,'Maximum number of downloads','DOWNLOAD_MAX_COUNT','5','Set the maximum number of downloads. 0 means no download authorized.',13,4,NULL,'2026-10-16 20:46:41',NULL,''),(103,'Enable GZip Compression','GZIP_COMPRESSION','false','Enable HTTP GZip compression.',14,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'true\', \'false\'], '),(104,'Compression Level','GZIP_LEVEL','5','Use this compression level 0-9 (0 = minimum, 9 = maximum).',14,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(105,'Force Cookie Use','SESSION_FORCE_COOKIE_USE','False','Force the use of sessions when cookies are only enabled.',15,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(106,'Check SSL Session ID','SESSION_CHECK_SSL_SESSION_ID','False','Validate the SSL_SESSION_ID on every secure HTTPS page request.',15,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(107,'Check User Agent','SESSION_CHECK_USER_AGENT','False','Validate the clients browser user agent on every page request.',15,4,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(108,'Check IP Address','SESSION_CHECK_IP_ADDRESS','False','Validate the clients IP address on every page request.',15,5,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(109,'Prevent Spider Sessions','SESSION_BLOCK_SPIDERS','True','Prevent known spiders from starting a session.',15,6,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(110,'Recreate Session','SESSION_RECREATE','True','Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).',15,7,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(111,'Last Update Check Time','LAST_UPDATE_CHECK_TIME','','Last time a check for new versions of CE Phoenix was run',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(112,'Store Logo','STORE_LOGO','store_logo.png','This is the filename of your Store Logo.  This should be updated at admin > configuration > Store Logo',6,1000,NULL,'2026-10-16 20:46:41',NULL,NULL),(113,'Bootstrap Container','BOOTSTRAP_CONTAINER','container-fluid','What type of container should the page content be shown in? See <a target=\"_blank\" rel=\"noreferrer\" href=\"https://getbootstrap.com/docs/4.6/layout/overview/#containers\"><u>overview/#containers</u></a>',16,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'container\', \'container-sm\', \'container-md\', \'container-lg\', \'container-xl\', \'container-fluid\'], '),(114,'Bootstrap Content','BOOTSTRAP_CONTENT','8','What width should the page content default to?  (8 = two thirds width, 6 = half width, 4 = one third width) Note that the Side Column(s) will adjust automatically.',16,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'10\', \'8\', \'6\', \'5\', \'3\', \'2\'], '),(115,'Installed Modules','MODULE_HEADER_TAGS_INSTALLED','ht_manufacturer_title.php;ht_category_title.php;ht_product_title.php;ht_robot_noindex.php;ht_datepicker_jquery.php;ht_table_click_jquery.php','List of header tag module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(116,'Enable Category Title Module','MODULE_HEADER_TAGS_CATEGORY_TITLE_STATUS','True','Do you want to allow category titles to be added to the page title?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(117,'Sort Order','MODULE_HEADER_TAGS_CATEGORY_TITLE_SORT_ORDER','200','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(118,'SEO Title Override?','MODULE_HEADER_TAGS_CATEGORY_TITLE_SEO_TITLE_OVERRIDE','True','Do you want to allow category titles to be over-ridden by your SEO Titles (if set)?',6,0,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(119,'Enable Manufacturer Title Module','MODULE_HEADER_TAGS_MANUFACTURER_TITLE_STATUS','True','Do you want to allow manufacturer titles to be added to the page title?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(120,'Sort Order','MODULE_HEADER_TAGS_MANUFACTURER_TITLE_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(121,'SEO Title Override?','MODULE_HEADER_TAGS_MANUFACTURER_TITLE_SEO_TITLE_OVERRIDE','True','Do you want to allow manufacturer names to be over-ridden by your SEO Titles (if set)?',6,0,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(122,'Enable Product Title Module','MODULE_HEADER_TAGS_PRODUCT_TITLE_STATUS','True','Do you want to allow product titles to be added to the page title?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(123,'Sort Order','MODULE_HEADER_TAGS_PRODUCT_TITLE_SORT_ORDER','300','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(124,'SEO Title Override?','MODULE_HEADER_TAGS_PRODUCT_TITLE_SEO_TITLE_OVERRIDE','True','Do you want to allow product titles to be over-ridden by your SEO Titles (if set)?',6,0,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(125,'Enable Robot NoIndex Module','MODULE_HEADER_TAGS_ROBOT_NOINDEX_STATUS','True','Do you want to enable the Robot NoIndex module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(126,'Pages','MODULE_HEADER_TAGS_ROBOT_NOINDEX_PAGES','account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_process.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;cookie_usage.php;create_account.php;create_account_success.php;login.php;logoff.php;password_forgotten.php;password_reset.php;shopping_cart.php;ssl_check.php','The pages to add the meta robot noindex tag to.',6,0,NULL,'2026-10-16 20:46:41','page_selection::_show_pages','page_selection::_edit_pages('),(127,'Sort Order','MODULE_HEADER_TAGS_ROBOT_NOINDEX_SORT_ORDER','500','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(128,'Enable Datepicker jQuery Module','MODULE_HEADER_TAGS_DATEPICKER_JQUERY_STATUS','True','Do you want to enable the Datepicker module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(129,'Pages','MODULE_HEADER_TAGS_DATEPICKER_JQUERY_PAGES','advanced_search.php;account_edit.php;create_account.php','The pages to add the Datepicker jQuery Scripts to.',6,0,NULL,'2026-10-16 20:46:41','page_selection::_show_pages','page_selection::_edit_pages('),(130,'Sort Order','MODULE_HEADER_TAGS_DATEPICKER_JQUERY_SORT_ORDER','600','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(131,'Enable Clickable Table Rows Module','MODULE_HEADER_TAGS_TABLE_CLICK_JQUERY_STATUS','True','Do you want to enable the Clickable Table Rows module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(132,'Pages','MODULE_HEADER_TAGS_TABLE_CLICK_JQUERY_PAGES','checkout_payment.php;checkout_shipping.php','The pages to add the jQuery Scripts to.',6,0,NULL,'2026-10-16 20:46:41','page_selection::_show_pages','page_selection::_edit_pages('),(133,'Sort Order','MODULE_HEADER_TAGS_TABLE_CLICK_JQUERY_SORT_ORDER','800','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(134,'Installed Modules','MODULE_ADMIN_DASHBOARD_INSTALLED','d_orders.php;d_customers.php;d_security_checks.php;d_admin_logins.php;d_reviews.php;d_paypal_app.php','List of Administration Tool Dashboard module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(135,'Enable Orders Module','MODULE_ADMIN_DASHBOARD_ORDERS_STATUS','True','Do you want to show the latest orders on the dashboard?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(136,'Orders to display','MODULE_ADMIN_DASHBOARD_ORDERS_DISPLAY','5','This number of Orders will display, ordered by most recent.',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(137,'Content Width','MODULE_ADMIN_DASHBOARD_ORDERS_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(138,'Sort Order','MODULE_ADMIN_DASHBOARD_ORDERS_SORT_ORDER','300','Sort order of display. Lowest is displayed first.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(139,'Enable Customers Module','MODULE_ADMIN_DASHBOARD_CUSTOMERS_STATUS','True','Do you want to show the newest customers on the dashboard?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(140,'Customers to display','MODULE_ADMIN_DASHBOARD_CUSTOMERS_DISPLAY','5','This number of Customers will display, ordered by most recent sign up.',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(141,'Content Width','MODULE_ADMIN_DASHBOARD_CUSTOMERS_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(142,'Sort Order','MODULE_ADMIN_DASHBOARD_CUSTOMERS_SORT_ORDER','400','Sort order of display. Lowest is displayed first.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(143,'Enable Latest Add-Ons Module','MODULE_ADMIN_DASHBOARD_PHOENIX_ADDONS_STATUS','True','Do you want to show the latest PRO Add-Ons on the dashboard?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(144,'Content Width','MODULE_ADMIN_DASHBOARD_PHOENIX_ADDONS_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(145,'Sort Order','MODULE_ADMIN_DASHBOARD_PHOENIX_ADDONS_SORT_ORDER','500','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(146,'Enable Security Checks Module','MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_STATUS','True','Do you want to run the security checks for this installation?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(147,'Content Width','MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(148,'Sort Order','MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_SORT_ORDER','600','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(149,'Enable Administrator Logins Module','MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_STATUS','True','Do you want to show the latest administrator logins on the dashboard?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(150,'Logins to display','MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_DISPLAY','5','This number of Logins will display, ordered by latest access.',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(151,'Content Width','MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(152,'Sort Order','MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_SORT_ORDER','1000','Sort order of display. Lowest is displayed first.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(153,'Enable Version Check Module','MODULE_ADMIN_DASHBOARD_VERSION_CHECK_STATUS','True','Do you want to show the version check results on the dashboard?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(154,'Content Width','MODULE_ADMIN_DASHBOARD_VERSION_CHECK_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(155,'Sort Order','MODULE_ADMIN_DASHBOARD_VERSION_CHECK_SORT_ORDER','900','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(156,'Enable Reviews Module','MODULE_ADMIN_DASHBOARD_REVIEWS_STATUS','True','Do you want to show the latest reviews on the dashboard?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(157,'Reviews to display','MODULE_ADMIN_DASHBOARD_REVIEWS_DISPLAY','5','This number of Reviews will display, ordered by latest added.',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(158,'Content Width','MODULE_ADMIN_DASHBOARD_REVIEWS_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(159,'Sort Order','MODULE_ADMIN_DASHBOARD_REVIEWS_SORT_ORDER','800','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(160,'Installed Modules','MODULE_BOXES_INSTALLED','bm_categories.php;bm_manufacturers.php;bm_whats_new.php;bm_order_history.php;bm_best_sellers.php;bm_reviews.php','List of box module filenames separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(161,'Enable Best Sellers Module','MODULE_BOXES_BEST_SELLERS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(162,'Minimum to Display','MODULE_BOXES_BEST_SELLERS_MIN_DISPLAY','1','Minimum number of best sellers to make the box display',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(163,'Content Placement','MODULE_BOXES_BEST_SELLERS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Left Column\', \'Right Column\'], '),(164,'Sort Order','MODULE_BOXES_BEST_SELLERS_SORT_ORDER','5030','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(165,'Enable Categories Module','MODULE_BOXES_CATEGORIES_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(166,'Content Placement','MODULE_BOXES_CATEGORIES_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Left Column\', \'Right Column\'], '),(167,'Maximum Level of Nesting','MODULE_BOXES_CATEGORIES_MAX_LEVEL','1','If you increase this number, subcategories will show in the module output.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(168,'Sort Order','MODULE_BOXES_CATEGORIES_SORT_ORDER','1000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(169,'Enable Manufacturers Module','MODULE_BOXES_MANUFACTURERS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(170,'Content Placement','MODULE_BOXES_MANUFACTURERS_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Left Column\', \'Right Column\'], '),(171,'Manufacturers List','MODULE_BOXES_MANUFACTURERS_MAX_LIST','9','When the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(172,'Sort Order','MODULE_BOXES_MANUFACTURERS_SORT_ORDER','1020','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(173,'Enable Order History Module','MODULE_BOXES_ORDER_HISTORY_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(174,'Maximum Products to show','MODULE_BOXES_ORDER_HISTORY_MAX_DISPLAY_PRODUCTS','6','Maximum number of products to display in the customer order history box',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(175,'Content Placement','MODULE_BOXES_ORDER_HISTORY_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Left Column\', \'Right Column\'], '),(176,'Sort Order','MODULE_BOXES_ORDER_HISTORY_SORT_ORDER','5020','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(177,'Enable What\'s New Module','MODULE_BOXES_WHATS_NEW_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(178,'Selection of Random New Products','MODULE_BOXES_WHATS_NEW_MAX_RANDOM_SELECT_NEW','10','How many records to select from to choose one random new product to display',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(179,'Content Placement','MODULE_BOXES_WHATS_NEW_CONTENT_PLACEMENT','Left Column','Should the module be loaded in the left or right column?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Left Column\', \'Right Column\'], '),(180,'Sort Order','MODULE_BOXES_WHATS_NEW_SORT_ORDER','1040','Sort order of display. Lowest is displayed first.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(181,'Enable Reviews Module','MODULE_BOXES_REVIEWS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(182,'Selection of Random Reviews','MODULE_BOXES_REVIEWS_MAX_RANDOM_SELECT_REVIEWS','10','How many records to select from to choose one random product review',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(183,'Content Placement','MODULE_BOXES_REVIEWS_CONTENT_PLACEMENT','Right Column','Should the module be loaded in the left or right column?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Left Column\', \'Right Column\'], '),(184,'Sort Order','MODULE_BOXES_REVIEWS_SORT_ORDER','5040','Sort order of display. Lowest is displayed first.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(185,'Installed Template Block Groups','TEMPLATE_BLOCK_GROUPS','boxes;header_tags','This is automatically updated. No need to edit.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(186,'Installed Modules','MODULE_CONTENT_INSTALLED','account/cm_account_gdpr;account/cm_account_title;account/cm_account_set_password;checkout_success/cm_cs_title;checkout_success/cm_cs_redirect_old_order;checkout_success/cm_cs_thank_you;checkout_success/cm_cs_product_notifications;checkout_success/cm_cs_downloads;checkout_success/cm_cs_continue_button;create_account_success/cm_cas_title;create_account_success/cm_cas_message;create_account_success/cm_cas_continue_button;footer/cm_footer_information_links;footer/cm_footer_account;footer/cm_footer_contact_us;footer/cm_footer_text;footer_suffix/cm_footer_extra_copyright;footer_suffix/cm_footer_extra_icons;gdpr/cm_gdpr_intro;gdpr/cm_gdpr_personal_details;header/cm_header_logo;header/cm_header_search;header/cm_header_messagestack;header/cm_header_breadcrumb;index/cm_i_title;index/cm_i_customer_greeting;index/cm_i_text_main;index/cm_i_card_products;index/cm_i_upcoming_products;index_nested/cm_in_title;index_nested/cm_in_category_description;index_nested/cm_in_category_listing;index_nested/cm_in_card_products;index_products/cm_ip_title;index_products/cm_ip_category_manufacturer_description;index_products/cm_ip_product_listing;info/cm_info_title;info/cm_info_text;login/cm_login_title;login/cm_login_form;login/cm_create_account_link;login/cm_forgot_password;navigation/cm_navbar;product_info/cm_pi_name;product_info/cm_pi_price;product_info/cm_pi_review_stars;product_info/cm_pi_modular;product_info/cm_pi_description;product_info/cm_pi_date_available;product_info/cm_pi_reviews;product_info_not_found/cm_pinf_message;shopping_cart/cm_sc_title;shopping_cart/cm_sc_no_products;shopping_cart/cm_sc_product_listing;shopping_cart/cm_sc_order_subtotal;shopping_cart/cm_sc_stock_notice;shopping_cart/cm_sc_checkout;testimonials/cm_t_title;testimonials/cm_t_list','This is automatically updated. No need to edit.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(187,'Enable Set Account Password','MODULE_CONTENT_ACCOUNT_SET_PASSWORD_STATUS','True','Do you want to enable the Set Account Password module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(188,'Allow Local Passwords','MODULE_CONTENT_ACCOUNT_SET_PASSWORD_ALLOW_PASSWORD','True','Allow local account passwords to be set.',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(189,'Sort Order','MODULE_CONTENT_ACCOUNT_SET_PASSWORD_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(190,'Enable Redirect Old Order Module','MODULE_CONTENT_CHECKOUT_SUCCESS_REDIRECT_OLD_ORDER_STATUS','True','Should customers be redirected when viewing old checkout success orders?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(191,'Redirect Minutes','MODULE_CONTENT_CHECKOUT_SUCCESS_REDIRECT_OLD_ORDER_MINUTES','60','Redirect customers to the My Account page after an order older than this amount is viewed.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(192,'Sort Order','MODULE_CONTENT_CHECKOUT_SUCCESS_REDIRECT_OLD_ORDER_SORT_ORDER','500','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(193,'Enable Thank You Module','MODULE_CONTENT_CHECKOUT_SUCCESS_THANK_YOU_STATUS','True','Should the thank you block be shown on the checkout success page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(194,'Content Width','MODULE_CONTENT_CHECKOUT_SUCCESS_THANK_YOU_CONTENT_WIDTH','7','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(195,'Sort Order','MODULE_CONTENT_CHECKOUT_SUCCESS_THANK_YOU_SORT_ORDER','1000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(196,'Enable Product Notifications Module','MODULE_CONTENT_CHECKOUT_SUCCESS_PRODUCT_NOTIFICATIONS_STATUS','True','Should the product notifications block be shown on the checkout success page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(197,'Content Width','MODULE_CONTENT_CHECKOUT_SUCCESS_PRODUCT_NOTIFICATIONS_CONTENT_WIDTH','5','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(198,'Sort Order','MODULE_CONTENT_CHECKOUT_SUCCESS_PRODUCT_NOTIFICATIONS_SORT_ORDER','2000','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(199,'Enable Product Downloads Module','MODULE_CONTENT_CHECKOUT_SUCCESS_DOWNLOADS_STATUS','True','Should ordered product download links be shown on the checkout success page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(200,'Sort Order','MODULE_CONTENT_CHECKOUT_SUCCESS_DOWNLOADS_SORT_ORDER','3000','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(201,'Enable Login Form Module','MODULE_CONTENT_LOGIN_FORM_STATUS','True','Do you want to enable the login form module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(202,'Content Width','MODULE_CONTENT_LOGIN_FORM_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(203,'Sort Order','MODULE_CONTENT_LOGIN_FORM_SORT_ORDER','1000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(204,'Enable New User Module','MODULE_CONTENT_CREATE_ACCOUNT_LINK_STATUS','True','Do you want to enable the new user module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(205,'Content Width','MODULE_CONTENT_CREATE_ACCOUNT_LINK_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(206,'Sort Order','MODULE_CONTENT_CREATE_ACCOUNT_LINK_SORT_ORDER','2000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(207,'Enable Forgot Password Module','MODULE_CONTENT_FORGOT_PASSWORD_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(208,'Content Width','MODULE_CONTENT_FORGOT_PASSWORD_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(209,'Sort Order','MODULE_CONTENT_FORGOT_PASSWORD_SORT_ORDER','3000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(210,'Enable Hamburger Button Module','MODULE_NAVBAR_HAMBURGER_BUTTON_STATUS','True','Do you want to add the module to your Navbar?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(211,'Content Placement','MODULE_NAVBAR_HAMBURGER_BUTTON_CONTENT_PLACEMENT','Home','This module must be placed in the Home area of the Navbar.',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Home\'], '),(212,'Sort Order','MODULE_NAVBAR_HAMBURGER_BUTTON_SORT_ORDER','500','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(213,'Enable Brand Module','MODULE_NAVBAR_BRAND_STATUS','True','Do you want to add the module to your Navbar?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(214,'Content Placement','MODULE_NAVBAR_BRAND_CONTENT_PLACEMENT','Home','This module must be placed in the Home area of the Navbar.',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Home\'], '),(215,'Sort Order','MODULE_NAVBAR_BRAND_SORT_ORDER','505','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(216,'Enable Shopping Cart Module','MODULE_NAVBAR_SHOPPING_CART_STATUS','True','Do you want to add the module to your Navbar?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(217,'Content Placement','MODULE_NAVBAR_SHOPPING_CART_CONTENT_PLACEMENT','Right','Should the module be loaded in the Left or Right or the Home area of the Navbar?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Home\', \'Left\', \'Center\', \'Right\'], '),(218,'Sort Order','MODULE_NAVBAR_SHOPPING_CART_SORT_ORDER','550','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(219,'Enable Currencies Module','MODULE_NAVBAR_CURRENCIES_STATUS','True','Do you want to add the module to your Navbar?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(220,'Content Placement','MODULE_NAVBAR_CURRENCIES_CONTENT_PLACEMENT','Right','Should the module be loaded in the Left or Right or the Home area of the Navbar?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Home\', \'Left\', \'Center\', \'Right\'], '),(221,'Sort Order','MODULE_NAVBAR_CURRENCIES_SORT_ORDER','530','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(222,'Enable Account Module','MODULE_NAVBAR_ACCOUNT_STATUS','True','Do you want to add the module to your Navbar?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(223,'Content Placement','MODULE_NAVBAR_ACCOUNT_CONTENT_PLACEMENT','Left','Should the module be loaded in the Left or Right or the Home area of the Navbar?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Home\', \'Left\', \'Center\', \'Right\'], '),(224,'Sort Order','MODULE_NAVBAR_ACCOUNT_SORT_ORDER','540','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(225,'Enable Special Offers Module','MODULE_NAVBAR_SPECIAL_OFFERS_STATUS','True','Do you want to add the module to your Navbar?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(226,'Content Placement Group','MODULE_NAVBAR_SPECIAL_OFFERS_CONTENT_PLACEMENT','Left','Where should the module be loaded?  Lowest is loaded first, per Group.',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Home\', \'Left\', \'Center\', \'Right\'], '),(227,'Sort Order','MODULE_NAVBAR_SPECIAL_OFFERS_SORT_ORDER','530','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(228,'Enable Navbar Module','MODULE_CONTENT_NAVBAR_STATUS','True','Should the Navbar be shown? ',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(229,'Background Colour Scheme','MODULE_CONTENT_NAVBAR_STYLE_BG','bg-light','What background colour should the Navbar have?  See <a target=\"_blank\" rel=\"noreferrer\" href=\"https://getbootstrap.com/docs/4.6/utilities/colors/#background-color\"><u>colors/#background-color</u></a>',6,0,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'bg-primary\', \'bg-secondary\', \'bg-success\', \'bg-danger\', \'bg-warning\', \'bg-info\', \'bg-light\', \'bg-dark\', \'bg-white\'], '),(230,'Link Colour Scheme','MODULE_CONTENT_NAVBAR_STYLE_FG','navbar-light','What foreground colour should the Navbar have?  See <a target=\"_blank\" rel=\"noreferrer\" href=\"https://getbootstrap.com/docs/4.6/components/navbar/#color-schemes\"><u>navbar/#color-schemes</u></a>',6,0,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'navbar-dark\', \'navbar-light\'], '),(231,'Placement','MODULE_CONTENT_NAVBAR_FIXED','floating','Should the Navbar be Placed or Floating? See <a target=\"_blank\" rel=\"noreferrer\" href=\"https://getbootstrap.com/docs/4.6/components/navbar/#placement\"><u>navbar/#placement</u></a>',6,0,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'fixed-top\', \'fixed-bottom\', \'sticky-top\', \'floating\'], '),(232,'Placement Offset','MODULE_CONTENT_NAVBAR_OFFSET','4rem','Offset if using fixed-* Placement.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(233,'Collapse','MODULE_CONTENT_NAVBAR_COLLAPSE','navbar-expand-sm','When should the Navbar Show? See <a target=\"_blank\" rel=\"noreferrer\" href=\"https://getbootstrap.com/docs/4.6/components/navbar/#how-it-works\"><u>navbar/#how-it-works</u></a>',6,0,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'navbar-expand\', \'navbar-expand-sm\', \'navbar-expand-md\', \'navbar-expand-lg\', \'navbar-expand-xl\'], '),(234,'Sort Order','MODULE_CONTENT_NAVBAR_SORT_ORDER','10','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(235,'Enable Header Logo Module','MODULE_CONTENT_HEADER_LOGO_STATUS','True','Do you want to enable the Logo content module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(236,'Content Width','MODULE_CONTENT_HEADER_LOGO_CONTENT_WIDTH','6','What width container should the content be shown in?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(237,'Sort Order','MODULE_CONTENT_HEADER_LOGO_SORT_ORDER','10','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(238,'Enable Search Box Module','MODULE_CONTENT_HEADER_SEARCH_STATUS','True','Do you want to enable the Search Box content module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(239,'Content Width','MODULE_CONTENT_HEADER_SEARCH_CONTENT_WIDTH','6','What width container should the content be shown in?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(240,'Sort Order','MODULE_CONTENT_HEADER_SEARCH_SORT_ORDER','20','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(241,'Enable Message Stack Notifications Module','MODULE_CONTENT_HEADER_MESSAGESTACK_STATUS','True','Should the Message Stack Notifications be shown in the header when needed? ',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(242,'Content Width','MODULE_CONTENT_HEADER_MESSAGESTACK_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(243,'Sort Order','MODULE_CONTENT_HEADER_MESSAGESTACK_SORT_ORDER','30','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(244,'Enable Header Breadcrumb Module','MODULE_CONTENT_HEADER_BREADCRUMB_STATUS','True','Do you want to enable the Breadcrumb content module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(245,'Content Width','MODULE_CONTENT_HEADER_BREADCRUMB_CONTENT_WIDTH','12','What width container should the content be shown in?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(246,'Sort Order','MODULE_CONTENT_HEADER_BREADCRUMB_SORT_ORDER','40','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(247,'Location?','MODULE_CONTENT_HEADER_BREADCRUMB_LOCATION','Both','Where you want the breadcrumb to be used.  Display in the Header, post as Schema entries, or Both.',6,4,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Header\', \'Schema\', \'Both\'], '),(248,'Category SEO Override?','MODULE_CONTENT_HEADER_BREADCRUMB_CATEGORY_SEO_OVERRIDE','True','Do you want to allow category titles to be over-ridden by your SEO Titles (if set)?',6,5,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(249,'Manufacturer SEO Override?','MODULE_CONTENT_HEADER_BREADCRUMB_MANUFACTURER_SEO_OVERRIDE','True','Do you want to allow manufacturer names in the breadcrumb to be over-ridden by your SEO Titles (if set)?',6,6,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(250,'Product SEO Override?','MODULE_CONTENT_HEADER_BREADCRUMB_PRODUCT_SEO_OVERRIDE','True','Do you want to allow product names in the breadcrumb to be over-ridden by your SEO Titles (if set)?',6,7,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(251,'Enable Information Links Footer Module','MODULE_CONTENT_FOOTER_INFORMATION_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(252,'Content Width','MODULE_CONTENT_FOOTER_INFORMATION_CONTENT_WIDTH','3','What width container should the content be shown in? (12 = full width, 6 = half width).',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(253,'Sort Order','MODULE_CONTENT_FOOTER_INFORMATION_SORT_ORDER','10','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(254,'Enable Account Footer Module','MODULE_CONTENT_FOOTER_ACCOUNT_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(255,'Content Width','MODULE_CONTENT_FOOTER_ACCOUNT_CONTENT_WIDTH','3','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(256,'Sort Order','MODULE_CONTENT_FOOTER_ACCOUNT_SORT_ORDER','20','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(257,'Enable Contact Us Footer Module','MODULE_CONTENT_FOOTER_CONTACT_US_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(258,'Content Width','MODULE_CONTENT_FOOTER_CONTACT_US_CONTENT_WIDTH','3','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(259,'Sort Order','MODULE_CONTENT_FOOTER_CONTACT_US_SORT_ORDER','30','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(260,'Enable Generic Text Footer Module','MODULE_CONTENT_FOOTER_TEXT_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(261,'Content Width','MODULE_CONTENT_FOOTER_TEXT_CONTENT_WIDTH','3','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(262,'Sort Order','MODULE_CONTENT_FOOTER_TEXT_SORT_ORDER','40','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(263,'Enable Copyright Details Footer Module','MODULE_CONTENT_FOOTER_EXTRA_COPYRIGHT_STATUS','True','Do you want to enable the Copyright content module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(264,'Content Width','MODULE_CONTENT_FOOTER_EXTRA_COPYRIGHT_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(265,'Sort Order','MODULE_CONTENT_FOOTER_EXTRA_COPYRIGHT_SORT_ORDER','10','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(266,'Enable Payment Icons Footer Module','MODULE_CONTENT_FOOTER_EXTRA_ICONS_STATUS','True','Do you want to enable the Payment Icons content module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(267,'Content Width','MODULE_CONTENT_FOOTER_EXTRA_ICONS_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(268,'Icons','MODULE_CONTENT_FOOTER_EXTRA_ICONS_DISPLAY','apple-pay,bitcoin,cc-paypal','Icons to display.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(269,'Sort Order','MODULE_CONTENT_FOOTER_EXTRA_ICONS_SORT_ORDER','20','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(270,'Enable Title Module','MODULE_CONTENT_ACCOUNT_TITLE_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(271,'Content Width','MODULE_CONTENT_ACCOUNT_TITLE_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(272,'Sort Order','MODULE_CONTENT_ACCOUNT_TITLE_SORT_ORDER','10','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(273,'Enable Title Module','MODULE_CONTENT_CHECKOUT_SUCCESS_TITLE_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(274,'Content Width','MODULE_CONTENT_CHECKOUT_SUCCESS_TITLE_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(275,'Sort Order','MODULE_CONTENT_CHECKOUT_SUCCESS_TITLE_SORT_ORDER','50','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(276,'Enable Continue Button','MODULE_CONTENT_CS_CONTINUE_BUTTON_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(277,'Content Width','MODULE_CONTENT_CS_CONTINUE_BUTTON_CONTENT_WIDTH','12','What width container should the content be shown in?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(278,'Sort Order','MODULE_CONTENT_CS_CONTINUE_BUTTON_SORT_ORDER','5000','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(279,'Enable Title Module','MODULE_CONTENT_I_TITLE_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(280,'Content Width','MODULE_CONTENT_I_TITLE_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(281,'Sort Order','MODULE_CONTENT_I_TITLE_SORT_ORDER','50','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(282,'Enable Customer Greeting Module','MODULE_CONTENT_CUSTOMER_GREETING_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(283,'Content Width','MODULE_CONTENT_CUSTOMER_GREETING_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(284,'Sort Order','MODULE_CONTENT_CUSTOMER_GREETING_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(285,'Enable Main Text Module','MODULE_CONTENT_TEXT_MAIN_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(286,'Content Width','MODULE_CONTENT_TEXT_MAIN_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(287,'Sort Order','MODULE_CONTENT_TEXT_MAIN_SORT_ORDER','200','Sort order of display. Lowest is displayed first.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(288,'Enable New Products Module','MODULE_CONTENT_CARD_PRODUCTS_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(289,'Content Width','MODULE_CONTENT_CARD_PRODUCTS_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(290,'Maximum Display','MODULE_CONTENT_CARD_PRODUCTS_MAX_DISPLAY','4','Maximum Number of products that should show in this module?',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(291,'Sort Order','MODULE_CONTENT_CARD_PRODUCTS_SORT_ORDER','300','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(292,'Enable Upcoming Products Module','MODULE_CONTENT_UPCOMING_PRODUCTS_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(293,'Content Width','MODULE_CONTENT_UPCOMING_PRODUCTS_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(294,'Maximum Display','MODULE_CONTENT_UPCOMING_PRODUCTS_MAX_DISPLAY','6','Maximum Number of products that should show in this module?',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(295,'Sort Order','MODULE_CONTENT_UPCOMING_PRODUCTS_EXPECTED_SORT','desc','This is the sort order used in the output.',6,4,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'asc\', \'desc\'], '),(296,'Sort Field','MODULE_CONTENT_UPCOMING_PRODUCTS_EXPECTED_FIELD','date_expected','The column to sort by in the output.',6,5,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'products_name\', \'date_expected\'], '),(297,'Sort Order','MODULE_CONTENT_UPCOMING_PRODUCTS_SORT_ORDER','400','Sort order of display. Lowest is displayed first.',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(298,'Enable Title Module','MODULE_CONTENT_IN_TITLE_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(299,'Content Width','MODULE_CONTENT_IN_TITLE_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(300,'Sort Order','MODULE_CONTENT_IN_TITLE_SORT_ORDER','50','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(301,'Enable Category Description Module','MODULE_CONTENT_IN_CATEGORY_DESCRIPTION_STATUS','True','Should this module be enabled?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(302,'Content Width','MODULE_CONTENT_IN_CATEGORY_DESCRIPTION_CONTENT_WIDTH','12','What width container should the content be shown in?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(303,'Sort Order','MODULE_CONTENT_IN_CATEGORY_DESCRIPTION_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(304,'Enable Category Listing Module','MODULE_CONTENT_IN_CATEGORY_LISTING_STATUS','True','Should this module be enabled?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(305,'Content Width','MODULE_CONTENT_IN_CATEGORY_LISTING_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(306,'Categories Per Row','MODULE_CONTENT_IN_CATEGORY_LISTING_DISPLAY_ROW','row row-cols-2 row-cols-sm-3 row-cols-md-4','How many categories should display per Row per viewport?  Default:  XS 2, SM 3, MD and above 4',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(307,'Sort Order','MODULE_CONTENT_IN_CATEGORY_LISTING_SORT_ORDER','200','Sort order of display. Lowest is displayed first.',6,8,NULL,'2026-10-16 20:46:41',NULL,NULL),(308,'Enable New Products Module','MODULE_CONTENT_IN_CARD_PRODUCTS_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(309,'Content Width','MODULE_CONTENT_IN_CARD_PRODUCTS_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(310,'Maximum Display','MODULE_CONTENT_IN_CARD_PRODUCTS_MAX_DISPLAY','6','Maximum Number of products that should show in this module?',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(311,'Sort Order','MODULE_CONTENT_IN_CARD_PRODUCTS_SORT_ORDER','300','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(312,'Enable Title Module','MODULE_CONTENT_IP_TITLE_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(313,'Content Width','MODULE_CONTENT_IP_TITLE_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(314,'Sort Order','MODULE_CONTENT_IP_TITLE_SORT_ORDER','50','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(315,'Enable Category/Manufacturer Description Module','MODULE_CONTENT_IP_CATEGORY_DESCRIPTION_STATUS','True','Should this module be enabled?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(316,'Content Width','MODULE_CONTENT_IP_CATEGORY_DESCRIPTION_CONTENT_WIDTH','12','What width container should the content be shown in?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(317,'Sort Order','MODULE_CONTENT_IP_CATEGORY_DESCRIPTION_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(318,'Enable Product Listing Module','MODULE_CONTENT_IP_PRODUCT_LISTING_STATUS','True','Should this module be enabled?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(319,'Content Width','MODULE_CONTENT_IP_PRODUCT_LISTING_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(320,'Sort Order','MODULE_CONTENT_IP_PRODUCT_LISTING_SORT_ORDER','200','Sort order of display. Lowest is displayed first.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(321,'Enable Title Module','MODULE_CONTENT_LOGIN_TITLE_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(322,'Content Width','MODULE_CONTENT_LOGIN_TITLE_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(323,'Sort Order','MODULE_CONTENT_LOGIN_TITLE_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(324,'Enable Message Module','MODULE_CONTENT_PINF_MESSAGE_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(325,'Content Width','MODULE_CONTENT_PINF_MESSAGE_CONTENT_WIDTH','12','What width container should the content be shown in?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(326,'Sort Order','MODULE_CONTENT_PINF_MESSAGE_SORT_ORDER','10','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(327,'Enable Name Module','MODULE_CONTENT_PI_NAME_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(328,'Content Width','MODULE_CONTENT_PI_NAME_CONTENT_WIDTH','9','What width container should the content be shown in?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(329,'Sort Order','MODULE_CONTENT_PI_NAME_SORT_ORDER','40','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(330,'Enable Price Module','MODULE_CONTENT_PI_PRICE_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(331,'Content Width','MODULE_CONTENT_PI_PRICE_CONTENT_WIDTH','3','What width container should the content be shown in?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(332,'Sort Order','MODULE_CONTENT_PI_PRICE_SORT_ORDER','50','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(333,'Enable Review Stars/Link Module','MODULE_CONTENT_PI_REVIEW_STARS_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(334,'Content Width','MODULE_CONTENT_PI_REVIEW_STARS_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(335,'Sort Order','MODULE_CONTENT_PI_REVIEW_STARS_SORT_ORDER','55','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(336,'Enable Description Module','MODULE_CONTENT_PI_DESCRIPTION_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(337,'Content Width','MODULE_CONTENT_PI_DESCRIPTION_CONTENT_WIDTH','12','What width container should the content be shown in?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(338,'Sort Order','MODULE_CONTENT_PI_DESCRIPTION_SORT_ORDER','60','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(339,'Enable Date Available Module','MODULE_CONTENT_PI_DATE_AVAILABLE_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(340,'Content Width','MODULE_CONTENT_PI_DATE_AVAILABLE_CONTENT_WIDTH','12','What width container should the content be shown in?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(341,'Date Style','MODULE_CONTENT_PI_DATE_AVAILABLE_STYLE','Long','How should the date look?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'Long\', \'Short\'], '),(342,'Sort Order','MODULE_CONTENT_PI_DATE_AVAILABLE_SORT_ORDER','70','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(343,'Enable Reviews Module','MODULE_CONTENT_PRODUCT_INFO_REVIEWS_STATUS','True','Should the reviews block be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(344,'Content Width','MODULE_CONTENT_PRODUCT_INFO_REVIEWS_CONTENT_WIDTH','12','What width container should the content be shown in?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(345,'Content Width','MODULE_CONTENT_PRODUCT_INFO_REVIEWS_CONTENT_WIDTH_EACH','6','What width container should each Review be shown in?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(346,'Number of Reviews','MODULE_CONTENT_PRODUCT_INFO_REVIEWS_CONTENT_LIMIT','99','How many reviews should be shown?',6,1,NULL,'2026-10-16 20:46:41',NULL,NULL),(347,'Sort Order','MODULE_CONTENT_PRODUCT_INFO_REVIEWS_ORDER','reviews_rating','Display Reviews by Rating (High to Low) or Date Added (New to Old)',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'reviews_rating\', \'date_added\'], '),(348,'Sort Order','MODULE_CONTENT_PRODUCT_INFO_REVIEWS_SORT_ORDER','120','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(349,'Enable Shopping Cart Title Module','MODULE_CONTENT_SC_TITLE_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(350,'Content Width','MODULE_CONTENT_SC_TITLE_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(351,'Sort Order','MODULE_CONTENT_SC_TITLE_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(352,'Enable Shopping Cart No Products Message','MODULE_CONTENT_SC_NO_PRODUCTS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(353,'Content Width','MODULE_CONTENT_SC_NO_PRODUCTS_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(354,'Sort Order','MODULE_CONTENT_SC_NO_PRODUCTS_SORT_ORDER','110','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(355,'Enable Shopping Cart Product Listing','MODULE_CONTENT_SC_PRODUCT_LISTING_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(356,'Content Width','MODULE_CONTENT_SC_PRODUCT_LISTING_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(357,'Sort Order','MODULE_CONTENT_SC_PRODUCT_LISTING_SORT_ORDER','120','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(358,'Enable Shopping Cart Order SubTotal','MODULE_CONTENT_SC_ORDER_SUBTOTAL_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(359,'Content Width','MODULE_CONTENT_SC_ORDER_SUBTOTAL_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(360,'Sort Order','MODULE_CONTENT_SC_ORDER_SUBTOTAL_SORT_ORDER','130','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(361,'Enable Shopping Cart Stock Notice','MODULE_CONTENT_SC_STOCK_NOTICE_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(362,'Content Width','MODULE_CONTENT_SC_STOCK_NOTICE_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(363,'Sort Order','MODULE_CONTENT_SC_STOCK_NOTICE_SORT_ORDER','140','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(364,'Enable Shopping Cart Checkout Button','MODULE_CONTENT_SC_CHECKOUT_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(365,'Content Width','MODULE_CONTENT_SC_CHECKOUT_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(366,'Sort Order','MODULE_CONTENT_SC_CHECKOUT_SORT_ORDER','150','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(367,'Enable Title Module','MODULE_CONTENT_TESTIMONIALS_TITLE_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(368,'Content Width','MODULE_CONTENT_TESTIMONIALS_TITLE_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(369,'Sort Order','MODULE_CONTENT_TESTIMONIALS_TITLE_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(370,'Enable List Module','MODULE_CONTENT_TESTIMONIALS_LIST_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(371,'Content Width','MODULE_CONTENT_TESTIMONIALS_LIST_CONTENT_WIDTH','12','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(372,'View Testimonials','MODULE_CONTENT_TESTIMONIALS_LIST_ALL','Language Specific','Do you want to show all Testimonials or language specific Testimonials?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'All\', \'Language Specific\'], '),(373,'Number of Testimonials','MODULE_CONTENT_TESTIMONIALS_LIST_PAGING','12','How many Testimonials to display per page.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(374,'Item Width','MODULE_CONTENT_TESTIMONIALS_LIST_CONTENT_WIDTH_EACH','6','What width container should the each Testimonial be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(375,'Sort Order','MODULE_CONTENT_TESTIMONIALS_LIST_SORT_ORDER','200','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(376,'Enable &pi; Modular product_info','MODULE_CONTENT_PI_MODULAR_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(377,'Content Width','MODULE_CONTENT_PI_MODULAR_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(378,'Slot Width: A','MODULE_CONTENT_PI_MODULAR_A_WIDTH','12','What width should Slot A be?  Note that Slots in a Row should totalise 12.',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(379,'Slot Width: B','MODULE_CONTENT_PI_MODULAR_B_WIDTH','7','What width should Slot B be?  Note that Slots in a Row should totalise 12.',6,4,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(380,'Slot Width: C','MODULE_CONTENT_PI_MODULAR_C_WIDTH','5','What width should Slot C be?  Note that Slots in a Row should totalise 12.',6,5,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(381,'Slot Width: D','MODULE_CONTENT_PI_MODULAR_D_WIDTH','6','What width should Slot D be?  Note that Slots in a Row should totalise 12.',6,6,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(382,'Slot Width: E','MODULE_CONTENT_PI_MODULAR_E_WIDTH','6','What width should Slot E be?  Note that Slots in a Row should totalise 12.',6,7,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(383,'Slot Width: F','MODULE_CONTENT_PI_MODULAR_F_WIDTH','12','What width should Slot F be?  Note that Slots in a Row should totalise 12.',6,8,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(384,'Slot Width: G','MODULE_CONTENT_PI_MODULAR_G_WIDTH','6','What width should Slot G be?  Note that Slots in a Row should totalise 12.',6,9,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(385,'Slot Width: H','MODULE_CONTENT_PI_MODULAR_H_WIDTH','6','What width should Slot H be?  Note that Slots in a Row should totalise 12.',6,10,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(386,'Slot Width: I','MODULE_CONTENT_PI_MODULAR_I_WIDTH','12','What width should Slot I be?  Note that Slots in a Row should totalise 12.',6,11,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(387,'Sort Order','MODULE_CONTENT_PI_MODULAR_SORT_ORDER','59','Sort order of display. Lowest is displayed first.',6,12,NULL,'2026-10-16 20:46:41',NULL,NULL),(388,'Installed Modules','MODULE_CUSTOMER_DATA_INSTALLED','cd_address_book_id.php;cd_firstname.php;cd_lastname.php;cd_email_address.php;cd_street_address.php;cd_city.php;cd_state.php;cd_postcode.php;cd_country.php;cd_date_account_created.php;cd_default_address_id.php;cd_email_username.php;cd_id.php;cd_name_2.php;cd_telephone.php;cd_newsletter.php;cd_password.php;cd_password_confirmation.php;cd_password_reset.php;cd_sortable_name_2.php;cd_traditional_address.php;cd_traditional_short_name.php','This is automatically updated. No need to edit.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(389,'Enable Address Book ID module','MODULE_CUSTOMER_DATA_ADDRESS_BOOK_ID_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,NULL),(390,'Enable First Name module','MODULE_CUSTOMER_DATA_FIRSTNAME_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(391,'Customer data group','MODULE_CUSTOMER_DATA_FIRSTNAME_GROUP','1','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(392,'Require First Name','MODULE_CUSTOMER_DATA_FIRSTNAME_REQUIRED','True','Do you want the first name to be required in customer registration?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(393,'Minimum Length','ENTRY_FIRST_NAME_MIN_LENGTH','2','Minimum length of first name',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(394,'Pages','MODULE_CUSTOMER_DATA_FIRSTNAME_PAGES','account_edit;address_book;checkout_new_address;create_account;customers','On what pages should this appear?',6,5,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(395,'Sort Order','MODULE_CUSTOMER_DATA_FIRSTNAME_SORT_ORDER','2030','Sort order of display. Lowest is displayed first.',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(396,'Template','MODULE_CUSTOMER_DATA_FIRSTNAME_TEMPLATE','includes/modules/customer_data/cd_whole_row_input.php','What template should be used to surround this input?',6,7,NULL,'2026-10-16 20:46:41',NULL,NULL),(397,'Enable Last Name module','MODULE_CUSTOMER_DATA_LASTNAME_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(398,'Customer data group','MODULE_CUSTOMER_DATA_LASTNAME_GROUP','1','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(399,'Require Last Name module (if enabled)','MODULE_CUSTOMER_DATA_LASTNAME_REQUIRED','True','Do you want the last name to be required in customer registration?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(400,'Minimum Length','ENTRY_LAST_NAME_MIN_LENGTH','2','Minimum length of last name',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(401,'Pages','MODULE_CUSTOMER_DATA_LASTNAME_PAGES','account_edit;address_book;checkout_new_address;create_account;customers','On what pages should this appear?',6,5,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(402,'Sort Order','MODULE_CUSTOMER_DATA_LASTNAME_SORT_ORDER','2070','Sort order of display. Lowest is displayed first.',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(403,'Template','MODULE_CUSTOMER_DATA_LASTNAME_TEMPLATE','includes/modules/customer_data/cd_whole_row_input.php','What template should be used to surround this input?',6,7,NULL,'2026-10-16 20:46:41',NULL,NULL),(404,'Enable Traditional Short Name module','MODULE_CUSTOMER_DATA_TRADITIONAL_SHORT_NAME_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,NULL),(405,'Enable Two Part Name module','MODULE_CUSTOMER_DATA_NAME_2_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,NULL),(406,'Enable Street Address module','MODULE_CUSTOMER_DATA_STREET_ADDRESS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(407,'Customer data group','MODULE_CUSTOMER_DATA_STREET_ADDRESS_GROUP','2','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(408,'Require Street Address module (if enabled)','MODULE_CUSTOMER_DATA_STREET_ADDRESS_REQUIRED','True','Do you want the street address to be required in customer registration?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(409,'Minimum Length','MODULE_CUSTOMER_DATA_STREET_ADDRESS_MIN_LENGTH','3','Minimum length of street address',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(410,'Pages','MODULE_CUSTOMER_DATA_STREET_ADDRESS_PAGES','address_book;checkout_new_address;create_account;customers','On what pages should this appear?',6,5,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(411,'Sort Order','MODULE_CUSTOMER_DATA_STREET_ADDRESS_SORT_ORDER','4200','Sort order of display. Lowest is displayed first.',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(412,'Template','MODULE_CUSTOMER_DATA_STREET_ADDRESS_TEMPLATE','includes/modules/customer_data/cd_whole_row_input.php','What template should be used to surround this input?',6,7,NULL,'2026-10-16 20:46:41',NULL,NULL),(413,'Enable City module','MODULE_CUSTOMER_DATA_CITY_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(414,'Customer data group','MODULE_CUSTOMER_DATA_CITY_GROUP','2','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(415,'Require City module (if enabled)','MODULE_CUSTOMER_DATA_CITY_REQUIRED','True','Do you want the city to be required in customer registration?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(416,'Minimum Length','MODULE_CUSTOMER_DATA_CITY_MIN_LENGTH','3','Minimum length of city',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(417,'Pages','MODULE_CUSTOMER_DATA_CITY_PAGES','address_book;checkout_new_address;create_account;customers','On what pages should this appear?',6,5,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(418,'Sort Order','MODULE_CUSTOMER_DATA_CITY_SORT_ORDER','4500','Sort order of display. Lowest is displayed first.',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(419,'Template','MODULE_CUSTOMER_DATA_CITY_TEMPLATE','includes/modules/customer_data/cd_whole_row_input.php','What template should be used to surround this input?',6,7,NULL,'2026-10-16 20:46:41',NULL,NULL),(420,'Enable Date Account Created module','MODULE_CUSTOMER_DATA_DATE_ACCOUNT_CREATED_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(421,'Enable Default Address ID module','MODULE_CUSTOMER_DATA_DEFAULT_ADDRESS_ID_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(422,'Enable Two Part Sortable Name module','MODULE_CUSTOMER_DATA_SORTABLE_NAME_2_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,NULL),(423,'Enable State module','MODULE_CUSTOMER_DATA_STATE_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(424,'Customer data group','MODULE_CUSTOMER_DATA_STATE_GROUP','2','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(425,'Require State module (if enabled)','MODULE_CUSTOMER_DATA_STATE_REQUIRED','True','Do you want the state to be required in customer registration?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(426,'Minimum Length','ENTRY_STATE_MIN_LENGTH','2','Minimum length of state',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(427,'Pages','MODULE_CUSTOMER_DATA_STATE_PAGES','address_book;checkout_new_address;create_account;customers','On what pages should this appear?',6,5,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(428,'Sort Order','MODULE_CUSTOMER_DATA_STATE_SORT_ORDER','4600','Sort order of display. Lowest is displayed first.',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(429,'Template','MODULE_CUSTOMER_DATA_STATE_TEMPLATE','includes/modules/customer_data/cd_whole_row_input.php','What template should be used to surround this input?',6,7,NULL,'2026-10-16 20:46:41',NULL,NULL),(430,'Enable Post Code module','MODULE_CUSTOMER_DATA_POST_CODE_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(431,'Customer data group','MODULE_CUSTOMER_DATA_POST_CODE_GROUP','2','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(432,'Require Post Code module (if enabled)','MODULE_CUSTOMER_DATA_POST_CODE_REQUIRED','True','Do you want the post code to be required in customer registration?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(433,'Minimum Length','MODULE_CUSTOMER_DATA_POST_CODE_MIN_LENGTH','3','Minimum length of post code',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(434,'Pages','MODULE_CUSTOMER_DATA_POST_CODE_PAGES','address_book;checkout_new_address;create_account;customers','On what pages should this appear?',6,5,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(435,'Sort Order','MODULE_CUSTOMER_DATA_POST_CODE_SORT_ORDER','4800','Sort order of display. Lowest is displayed first.',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(436,'Template','MODULE_CUSTOMER_DATA_POST_CODE_TEMPLATE','includes/modules/customer_data/cd_whole_row_input.php','What template should be used to surround this input?',6,7,NULL,'2026-10-16 20:46:41',NULL,NULL),(437,'Enable Country module','MODULE_CUSTOMER_DATA_COUNTRY_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(438,'Customer data group','MODULE_CUSTOMER_DATA_COUNTRY_GROUP','2','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(439,'Require Country module (if enabled)','MODULE_CUSTOMER_DATA_COUNTRY_REQUIRED','True','Do you want the country to be required in customer registration?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(440,'Pages','MODULE_CUSTOMER_DATA_COUNTRY_PAGES','address_book;checkout_new_address;create_account;customers','On what pages should this appear?',6,4,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(441,'Sort Order','MODULE_CUSTOMER_DATA_COUNTRY_SORT_ORDER','4900','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(442,'Template','MODULE_CUSTOMER_DATA_COUNTRY_TEMPLATE','includes/modules/customer_data/cd_whole_row_input.php','What template should be used to surround this input?',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(443,'Enable Email Address module','MODULE_CUSTOMER_DATA_EMAIL_ADDRESS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(444,'Customer data group','MODULE_CUSTOMER_DATA_EMAIL_ADDRESS_GROUP','1','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(445,'Require Email Address module (if enabled)','MODULE_CUSTOMER_DATA_EMAIL_ADDRESS_REQUIRED','True','Do you want the email address to be required in customer registration?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(446,'Minimum Length','ENTRY_EMAIL_ADDRESS_MIN_LENGTH','6','Minimum length of email address',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(447,'Pages','MODULE_CUSTOMER_DATA_EMAIL_ADDRESS_PAGES','account_edit;create_account;customers','On what pages should this appear?',6,5,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(448,'Sort Order','MODULE_CUSTOMER_DATA_EMAIL_ADDRESS_SORT_ORDER','2100','Sort order of display. Lowest is displayed first.',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(449,'Template','MODULE_CUSTOMER_DATA_EMAIL_ADDRESS_TEMPLATE','includes/modules/customer_data/cd_whole_row_input.php','What template should be used to surround this input?',6,7,NULL,'2026-10-16 20:46:41',NULL,NULL),(450,'Enable Email Username module','MODULE_CUSTOMER_DATA_EMAIL_USERNAME_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,NULL),(451,'Enable Password module','MODULE_CUSTOMER_DATA_PASSWORD_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(452,'Customer data group','MODULE_CUSTOMER_DATA_PASSWORD_GROUP','6','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(453,'Require Password module (if enabled)','MODULE_CUSTOMER_DATA_PASSWORD_REQUIRED','True','Do you want the password to be required in customer registration?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(454,'Minimum Length','MODULE_CUSTOMER_DATA_PASSWORD_MIN_LENGTH','5','Minimum length of password',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(455,'Pages','MODULE_CUSTOMER_DATA_PASSWORD_PAGES','account_password;create_account;customers','On what pages should this appear?',6,5,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(456,'Sort Order','MODULE_CUSTOMER_DATA_PASSWORD_SORT_ORDER','6200','Sort order of display. Lowest is displayed first.',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(457,'Template','MODULE_CUSTOMER_DATA_PASSWORD_TEMPLATE','includes/modules/customer_data/cd_whole_row_input.php','What template should be used to surround this input?',6,7,NULL,'2026-10-16 20:46:41',NULL,NULL),(458,'Enable Password Reset module','MODULE_CUSTOMER_DATA_PASSWORD_RESET_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(459,'Enable Identifier module','MODULE_CUSTOMER_DATA_ID_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,NULL),(460,'Enable Password Confirmation module','MODULE_CUSTOMER_DATA_PASSWORD_CONFIRMATION_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(461,'Customer data group','MODULE_CUSTOMER_DATA_PASSWORD_CONFIRMATION_GROUP','6','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(462,'Pages','MODULE_CUSTOMER_DATA_PASSWORD_CONFIRMATION_PAGES','account_password;create_account;customers','On what pages should this appear?',6,3,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(463,'Sort Order','MODULE_CUSTOMER_DATA_PASSWORD_CONFIRMATION_SORT_ORDER','6300','Sort order of display. Lowest is displayed first.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(464,'Template','MODULE_CUSTOMER_DATA_PASSWORD_CONFIRMATION_TEMPLATE','includes/modules/customer_data/cd_whole_row_input.php','What template should be used to surround this input?',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(465,'Enable Telephone module','MODULE_CUSTOMER_DATA_TELEPHONE_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(466,'Customer data group','MODULE_CUSTOMER_DATA_TELEPHONE_GROUP','3','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(467,'Require Telephone module (if enabled)','MODULE_CUSTOMER_DATA_TELEPHONE_REQUIRED','True','Do you want the telephone to be required in customer registration?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(468,'Minimum Length','MODULE_CUSTOMER_DATA_TELEPHONE_MIN_LENGTH','3','Minimum length of telephone',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(469,'Pages','MODULE_CUSTOMER_DATA_TELEPHONE_PAGES','account_edit;create_account;customers','On what pages should this appear?',6,5,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(470,'Sort Order','MODULE_CUSTOMER_DATA_TELEPHONE_SORT_ORDER','5500','Sort order of display. Lowest is displayed first.',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(471,'Template','MODULE_CUSTOMER_DATA_TELEPHONE_TEMPLATE','includes/modules/customer_data/cd_whole_row_input.php','What template should be used to surround this input?',6,7,NULL,'2026-10-16 20:46:41',NULL,NULL),(472,'Enable Traditional Address module','MODULE_CUSTOMER_DATA_TRADITIONAL_ADDRESS_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,NULL),(473,'Enable Newsletter Module','MODULE_CUSTOMER_DATA_NEWSLETTER_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(474,'Customer data group','MODULE_CUSTOMER_DATA_NEWSLETTER_GROUP','3','In what group should this appear?',6,2,NULL,'2026-10-16 20:46:41','tep_get_customer_data_group_title','tep_cfg_pull_down_customer_data_groups('),(475,'Pages','MODULE_CUSTOMER_DATA_NEWSLETTER_PAGES','account_newsletters;create_account;customers','On what pages should this appear?',6,3,NULL,'2026-10-16 20:46:41','abstract_module::list_exploded','tep_draw_account_edit_pages('),(476,'Require Newsletter (if enabled)','MODULE_CUSTOMER_DATA_NEWSLETTER_REQUIRED','False','Do you want the newsletter to be required in customer registration?',6,4,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(477,'Sort Order','MODULE_CUSTOMER_DATA_NEWSLETTER_SORT_ORDER','5800','Sort order of display. Lowest is displayed first.',6,5,NULL,'2026-10-16 20:46:41',NULL,NULL),(478,'Enable GDPR Link','MODULE_CONTENT_ACCOUNT_GDPR_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(479,'Countries','MODULE_CONTENT_ACCOUNT_GDPR_COUNTRIES','','Restrict the Link to Account Holders in these Countries.  Leave Blank to show link to all Countries!',6,2,NULL,'2026-10-16 20:46:41','gdpr_show_countries','gdpr_select_countries('),(480,'Sort Order','MODULE_CONTENT_ACCOUNT_GDPR_SORT_ORDER','10','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(481,'Enable Intro Module','MODULE_CONTENT_GDPR_INTRO_STATUS','True','Should this module be shown on the GDPR page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(482,'Content Width','MODULE_CONTENT_GDPR_INTRO_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(483,'Sort Order','MODULE_CONTENT_GDPR_INTRO_SORT_ORDER','50','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(484,'Enable Personal Details Module','MODULE_CONTENT_GDPR_PERSONAL_DETAILS_STATUS','True','Should this module be shown on the GDPR page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(485,'Content Width','MODULE_CONTENT_GDPR_PERSONAL_DETAILS_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(486,'Sort Order','MODULE_CONTENT_GDPR_PERSONAL_DETAILS_SORT_ORDER','100','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(487,'Enable Title Module','MODULE_CONTENT_CAS_TITLE_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(488,'Content Width','MODULE_CONTENT_CAS_TITLE_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(489,'Sort Order','MODULE_CONTENT_CAS_TITLE_SORT_ORDER','10','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(490,'Enable Message Module','MODULE_CONTENT_CAS_MESSAGE_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(491,'Content Width','MODULE_CONTENT_CAS_MESSAGE_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(492,'Sort Order','MODULE_CONTENT_CAS_MESSAGE_SORT_ORDER','20','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(493,'Enable Button Module','MODULE_CONTENT_CAS_CONTINUE_BUTTON_STATUS','True','Do you want to enable this module?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(494,'Content Width','MODULE_CONTENT_CAS_CONTINUE_BUTTON_CONTENT_WIDTH','12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(495,'Sort Order','MODULE_CONTENT_CAS_CONTINUE_BUTTON_SORT_ORDER','30','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(496,'Installed Modules','MODULE_NOTIFICATIONS_INSTALLED','n_checkout.php;n_create_account.php;n_update_order.php','This is automatically updated. No need to edit.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(497,'Enable Checkout Notification module','MODULE_NOTIFICATIONS_CHECKOUT_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(498,'Enable Account Creation Notification module','MODULE_NOTIFICATIONS_CREATE_ACCOUNT_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(499,'Enable Order Status Update Notification module','MODULE_NOTIFICATIONS_UPDATE_ORDER_STATUS','True','Do you want to add the module to your shop?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(500,'Installed Modules','MODULE_CONTENT_PI_INSTALLED','pi_gallery.php;pi_img_disclaimer.php;pi_options_attributes.php;pi_buy_button.php','List of &pi; Product Info child modules separated by a semi-colon. This is automatically updated. No need to edit.',6,0,NULL,'2026-10-16 20:46:41',NULL,NULL),(501,'Enable Buy Button','PI_BUY_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(502,'Module Display','PI_BUY_GROUP','C','Where should this module display on the product info page?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'A\', \'B\', \'C\', \'D\', \'E\', \'F\', \'G\', \'H\', \'I\'], '),(503,'Content Width','PI_BUY_CONTENT_WIDTH','12','What width container should the content be shown in?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(504,'Sort Order','PI_BUY_SORT_ORDER','320','Sort order of display. Lowest is displayed first.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(505,'Enable Gallery Module','PI_GALLERY_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(506,'Module Display','PI_GALLERY_GROUP','B','Where should this module display on the product info page?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'A\', \'B\', \'C\', \'D\', \'E\', \'F\', \'G\', \'H\', \'I\'], '),(507,'Content Width','PI_GALLERY_CONTENT_WIDTH','12','What width container should the content be shown in?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(508,'Thumbnail Width','PI_GALLERY_CONTENT_WIDTH_EACH','col-4 col-sm-6 col-lg-4','What width container should each thumbnail be shown in? Default:  XS 3 each row, SM/MD 2 each row, LG/XL 3 each row.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(509,'Modal Popup Size','PI_GALLERY_MODAL_SIZE','modal-md','Choose the size of the Popup.  sm = small, md = medium etc.',6,5,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'modal-sm\', \'modal-md\', \'modal-lg\', \'modal-xl\'], '),(510,'Show Swipe Arrows','PI_GALLERY_SWIPE_ARROWS','True','Swipe Arrows make for a better User Experience in some cases.',6,6,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(511,'Show Indicators','PI_GALLERY_INDICATORS','True','Indicators allow users to jump from image to image without having to swipe.',6,7,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(512,'Sort Order','PI_GALLERY_SORT_ORDER','200','Sort order of display. Lowest is displayed first.',6,8,NULL,'2026-10-16 20:46:41',NULL,NULL),(513,'Enable Image Disclaimer Module','PI_IMG_DISCLAIMER_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(514,'Module Display','PI_IMG_DISCLAIMER_GROUP','B','Where should this module display on the product info page?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'A\', \'B\', \'C\', \'D\', \'E\', \'F\', \'G\', \'H\', \'I\'], '),(515,'Content Width','PI_IMG_DISCLAIMER_CONTENT_WIDTH','12','What width container should the content be shown in?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(516,'Sort Order','PI_IMG_DISCLAIMER_SORT_ORDER','230','Sort order of display. Lowest is displayed first.',6,4,NULL,'2026-10-16 20:46:41',NULL,NULL),(517,'Enable Options & Attributes','PI_OA_STATUS','True','Should this module be shown on the product info page?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(518,'Module Display','PI_OA_GROUP','C','Where should this module display on the product info page?',6,2,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'A\', \'B\', \'C\', \'D\', \'E\', \'F\', \'G\', \'H\', \'I\'], '),(519,'Content Width','PI_OA_CONTENT_WIDTH','12','What width container should the content be shown in?',6,3,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'], '),(520,'Add Helper Text','PI_OA_HELPER','True','Should first option in dropdown be Helper Text?',6,4,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(521,'Enforce Selection','PI_OA_ENFORCE','True','Should customer be forced to select option(s)?',6,5,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(522,'Sort Order','PI_OA_SORT_ORDER','310','Sort order of display. Lowest is displayed first.',6,6,NULL,'2026-10-16 20:46:41',NULL,NULL),(523,'Enable Title Module','MODULE_CONTENT_INFO_TITLE_STATUS','True','Should this module be shown?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(524,'Content Width','MODULE_CONTENT_INFO_TITLE_CONTENT_WIDTH','col-12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(525,'Sort Order','MODULE_CONTENT_INFO_TITLE_SORT_ORDER','10','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(526,'Enable Text Module','MODULE_CONTENT_INFO_TEXT_STATUS','True','Should this module be shown?',6,1,NULL,'2026-10-16 20:46:41',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(527,'Content Width','MODULE_CONTENT_INFO_TEXT_CONTENT_WIDTH','col-12','What width container should the content be shown in?',6,2,NULL,'2026-10-16 20:46:41',NULL,NULL),(528,'Sort Order','MODULE_CONTENT_INFO_TEXT_SORT_ORDER','20','Sort order of display. Lowest is displayed first.',6,3,NULL,'2026-10-16 20:46:41',NULL,NULL),(529,'PayPal App Parameter','OSCOM_APP_PAYPAL_EC_STATUS','','A parameter for the PayPal Application.',6,0,NULL,'2026-10-16 23:15:48',NULL,NULL),(530,'PayPal App Parameter','OSCOM_APP_PAYPAL_DP_STATUS','','A parameter for the PayPal Application.',6,0,NULL,'2026-10-16 23:15:48',NULL,NULL),(531,'PayPal App Parameter','OSCOM_APP_PAYPAL_HS_STATUS','','A parameter for the PayPal Application.',6,0,NULL,'2026-10-16 23:15:48',NULL,NULL),(532,'PayPal App Parameter','OSCOM_APP_PAYPAL_PS_STATUS','','A parameter for the PayPal Application.',6,0,NULL,'2026-10-16 23:15:48',NULL,NULL),(533,'PayPal App Parameter','OSCOM_APP_PAYPAL_LOGIN_STATUS','','A parameter for the PayPal Application.',6,0,NULL,'2026-10-16 23:15:48',NULL,NULL),(534,'Content Width','MODULE_ADMIN_DASHBOARD_PAYPAL_APP_CONTENT_WIDTH','6','What width container should the content be shown in? (12 = full width, 6 = half width).',6,2,NULL,'2026-10-16 23:15:48',NULL,'tep_cfg_select_option(array(\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'), '),(535,'Sort Order','MODULE_ADMIN_DASHBOARD_PAYPAL_APP_SORT_ORDER','1300','Sort order of display. Lowest is displayed first.',6,0,NULL,'2026-10-16 23:15:48',NULL,NULL),(536,'PayPal App Parameter','OSCOM_APP_PAYPAL_VERSION_CHECK','29','A parameter for the PayPal Application.',6,0,NULL,'2026-10-16 23:15:51',NULL,NULL),(537,'Aktifkan Kupon','MODULE_ORDER_TOTAL_DW_COUPON_STATUS','True','Tampilkan potongan kupon di total pesanan?',6,1,NULL,'2026-10-17 22:05:58',NULL,'tep_cfg_select_option([\'True\', \'False\'], '),(538,'Urutan Tampil','MODULE_ORDER_TOTAL_DW_COUPON_SORT_ORDER','15','Urutan tampil (setelah Sub-Total, sebelum Ongkir).',6,2,NULL,'2026-10-17 22:05:58',NULL,NULL);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_group`
--

DROP TABLE IF EXISTS `configuration_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL,
  `configuration_group_description` varchar(255) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT 1,
  PRIMARY KEY (`configuration_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_group`
--

LOCK TABLES `configuration_group` WRITE;
/*!40000 ALTER TABLE `configuration_group` DISABLE KEYS */;
INSERT INTO `configuration_group` VALUES (1,'My Store','General information about my store',1,1),(3,'Maximum Values','The maximum values for functions / data',3,1),(4,'Images','Image parameters',4,1),(6,'Module Options','Hidden from configuration',6,0),(7,'Shipping/Packaging','Shipping options available at my store',7,1),(8,'Product Listing','Product Listing configuration options',8,1),(9,'Stock','Stock configuration options',9,1),(10,'Logging','Logging configuration options',10,1),(11,'Cache','Caching configuration options',11,1),(12,'E-Mail Options','General setting for E-Mail transport and HTML E-Mails',12,1),(13,'Download','Downloadable products options',13,1),(14,'GZip Compression','GZip compression options',14,1),(15,'Sessions','Session options',15,1),(16,'Bootstrap Setup','Basic Bootstrap Options',16,1);
/*!40000 ALTER TABLE `configuration_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(255) NOT NULL,
  `countries_iso_code_2` char(2) NOT NULL,
  `countries_iso_code_3` char(3) NOT NULL,
  `address_format_id` int(11) NOT NULL,
  PRIMARY KEY (`countries_id`),
  KEY `IDX_COUNTRIES_NAME` (`countries_name`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Afghanistan','AF','AFG',1),(2,'Albania','AL','ALB',1),(3,'Algeria','DZ','DZA',1),(4,'American Samoa','AS','ASM',1),(5,'Andorra','AD','AND',1),(6,'Angola','AO','AGO',1),(7,'Anguilla','AI','AIA',1),(8,'Antarctica','AQ','ATA',1),(9,'Antigua and Barbuda','AG','ATG',1),(10,'Argentina','AR','ARG',1),(11,'Armenia','AM','ARM',1),(12,'Aruba','AW','ABW',1),(13,'Australia','AU','AUS',1),(14,'Austria','AT','AUT',5),(15,'Azerbaijan','AZ','AZE',1),(16,'Bahamas','BS','BHS',1),(17,'Bahrain','BH','BHR',1),(18,'Bangladesh','BD','BGD',1),(19,'Barbados','BB','BRB',1),(20,'Belarus','BY','BLR',1),(21,'Belgium','BE','BEL',1),(22,'Belize','BZ','BLZ',1),(23,'Benin','BJ','BEN',1),(24,'Bermuda','BM','BMU',1),(25,'Bhutan','BT','BTN',1),(26,'Bolivia','BO','BOL',1),(27,'Bosnia and Herzegowina','BA','BIH',1),(28,'Botswana','BW','BWA',1),(29,'Bouvet Island','BV','BVT',1),(30,'Brazil','BR','BRA',1),(31,'British Indian Ocean Territory','IO','IOT',1),(32,'Brunei Darussalam','BN','BRN',1),(33,'Bulgaria','BG','BGR',1),(34,'Burkina Faso','BF','BFA',1),(35,'Burundi','BI','BDI',1),(36,'Cambodia','KH','KHM',1),(37,'Cameroon','CM','CMR',1),(38,'Canada','CA','CAN',1),(39,'Cape Verde','CV','CPV',1),(40,'Cayman Islands','KY','CYM',1),(41,'Central African Republic','CF','CAF',1),(42,'Chad','TD','TCD',1),(43,'Chile','CL','CHL',1),(44,'China','CN','CHN',1),(45,'Christmas Island','CX','CXR',1),(46,'Cocos (Keeling) Islands','CC','CCK',1),(47,'Colombia','CO','COL',1),(48,'Comoros','KM','COM',1),(49,'Congo','CG','COG',1),(50,'Cook Islands','CK','COK',1),(51,'Costa Rica','CR','CRI',1),(52,'Cote D\'Ivoire','CI','CIV',1),(53,'Croatia','HR','HRV',1),(54,'Cuba','CU','CUB',1),(55,'Cyprus','CY','CYP',1),(56,'Czech Republic','CZ','CZE',1),(57,'Denmark','DK','DNK',1),(58,'Djibouti','DJ','DJI',1),(59,'Dominica','DM','DMA',1),(60,'Dominican Republic','DO','DOM',1),(61,'East Timor','TP','TMP',1),(62,'Ecuador','EC','ECU',1),(63,'Egypt','EG','EGY',1),(64,'El Salvador','SV','SLV',1),(65,'Equatorial Guinea','GQ','GNQ',1),(66,'Eritrea','ER','ERI',1),(67,'Estonia','EE','EST',1),(68,'Ethiopia','ET','ETH',1),(69,'Falkland Islands (Malvinas)','FK','FLK',1),(70,'Faroe Islands','FO','FRO',1),(71,'Fiji','FJ','FJI',1),(72,'Finland','FI','FIN',1),(73,'France','FR','FRA',1),(75,'French Guiana','GF','GUF',1),(76,'French Polynesia','PF','PYF',1),(77,'French Southern Territories','TF','ATF',1),(78,'Gabon','GA','GAB',1),(79,'Gambia','GM','GMB',1),(80,'Georgia','GE','GEO',1),(81,'Germany','DE','DEU',5),(82,'Ghana','GH','GHA',1),(83,'Gibraltar','GI','GIB',1),(84,'Greece','GR','GRC',1),(85,'Greenland','GL','GRL',1),(86,'Grenada','GD','GRD',1),(87,'Guadeloupe','GP','GLP',1),(88,'Guam','GU','GUM',1),(89,'Guatemala','GT','GTM',1),(90,'Guinea','GN','GIN',1),(91,'Guinea-bissau','GW','GNB',1),(92,'Guyana','GY','GUY',1),(93,'Haiti','HT','HTI',1),(94,'Heard and Mc Donald Islands','HM','HMD',1),(95,'Honduras','HN','HND',1),(96,'Hong Kong','HK','HKG',1),(97,'Hungary','HU','HUN',1),(98,'Iceland','IS','ISL',1),(99,'India','IN','IND',1),(100,'Indonesia','ID','IDN',1),(101,'Iran (Islamic Republic of)','IR','IRN',1),(102,'Iraq','IQ','IRQ',1),(103,'Ireland','IE','IRL',1),(104,'Israel','IL','ISR',1),(105,'Italy','IT','ITA',1),(106,'Jamaica','JM','JAM',1),(107,'Japan','JP','JPN',1),(108,'Jordan','JO','JOR',1),(109,'Kazakhstan','KZ','KAZ',1),(110,'Kenya','KE','KEN',1),(111,'Kiribati','KI','KIR',1),(112,'Korea, Democratic People\'s Republic of','KP','PRK',1),(113,'Korea, Republic of','KR','KOR',1),(114,'Kuwait','KW','KWT',1),(115,'Kyrgyzstan','KG','KGZ',1),(116,'Lao People\'s Democratic Republic','LA','LAO',1),(117,'Latvia','LV','LVA',1),(118,'Lebanon','LB','LBN',1),(119,'Lesotho','LS','LSO',1),(120,'Liberia','LR','LBR',1),(121,'Libya','LY','LBY',1),(122,'Liechtenstein','LI','LIE',1),(123,'Lithuania','LT','LTU',1),(124,'Luxembourg','LU','LUX',1),(125,'Macau','MO','MAC',1),(126,'North Macedonia','MK','MKD',1),(127,'Madagascar','MG','MDG',1),(128,'Malawi','MW','MWI',1),(129,'Malaysia','MY','MYS',1),(130,'Maldives','MV','MDV',1),(131,'Mali','ML','MLI',1),(132,'Malta','MT','MLT',1),(133,'Marshall Islands','MH','MHL',1),(134,'Martinique','MQ','MTQ',1),(135,'Mauritania','MR','MRT',1),(136,'Mauritius','MU','MUS',1),(137,'Mayotte','YT','MYT',1),(138,'Mexico','MX','MEX',1),(139,'Micronesia, Federated States of','FM','FSM',1),(140,'Moldova, Republic of','MD','MDA',1),(141,'Monaco','MC','MCO',1),(142,'Mongolia','MN','MNG',1),(143,'Montserrat','MS','MSR',1),(144,'Morocco','MA','MAR',1),(145,'Mozambique','MZ','MOZ',1),(146,'Myanmar','MM','MMR',1),(147,'Namibia','NA','NAM',1),(148,'Nauru','NR','NRU',1),(149,'Nepal','NP','NPL',1),(150,'Netherlands','NL','NLD',1),(151,'Netherlands Antilles','AN','ANT',1),(152,'New Caledonia','NC','NCL',1),(153,'New Zealand','NZ','NZL',1),(154,'Nicaragua','NI','NIC',1),(155,'Niger','NE','NER',1),(156,'Nigeria','NG','NGA',1),(157,'Niue','NU','NIU',1),(158,'Norfolk Island','NF','NFK',1),(159,'Northern Mariana Islands','MP','MNP',1),(160,'Norway','NO','NOR',1),(161,'Oman','OM','OMN',1),(162,'Pakistan','PK','PAK',1),(163,'Palau','PW','PLW',1),(164,'Panama','PA','PAN',1),(165,'Papua New Guinea','PG','PNG',1),(166,'Paraguay','PY','PRY',1),(167,'Peru','PE','PER',1),(168,'Philippines','PH','PHL',1),(169,'Pitcairn','PN','PCN',1),(170,'Poland','PL','POL',1),(171,'Portugal','PT','PRT',1),(172,'Puerto Rico','PR','PRI',1),(173,'Qatar','QA','QAT',1),(174,'Reunion','RE','REU',1),(175,'Romania','RO','ROM',1),(176,'Russian Federation','RU','RUS',1),(177,'Rwanda','RW','RWA',1),(178,'Saint Kitts and Nevis','KN','KNA',1),(179,'Saint Lucia','LC','LCA',1),(180,'Saint Vincent and the Grenadines','VC','VCT',1),(181,'Samoa','WS','WSM',1),(182,'San Marino','SM','SMR',1),(183,'Sao Tome and Principe','ST','STP',1),(184,'Saudi Arabia','SA','SAU',1),(185,'Senegal','SN','SEN',1),(186,'Seychelles','SC','SYC',1),(187,'Sierra Leone','SL','SLE',1),(188,'Singapore','SG','SGP',4),(189,'Slovakia (Slovak Republic)','SK','SVK',1),(190,'Slovenia','SI','SVN',1),(191,'Solomon Islands','SB','SLB',1),(192,'Somalia','SO','SOM',1),(193,'South Africa','ZA','ZAF',1),(194,'South Georgia and the South Sandwich Islands','GS','SGS',1),(195,'Spain','ES','ESP',3),(196,'Sri Lanka','LK','LKA',1),(197,'St. Helena','SH','SHN',1),(198,'St. Pierre and Miquelon','PM','SPM',1),(199,'Sudan','SD','SDN',1),(200,'Suriname','SR','SUR',1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM',1),(202,'Eswatini','SZ','SWZ',1),(203,'Sweden','SE','SWE',1),(204,'Switzerland','CH','CHE',1),(205,'Syrian Arab Republic','SY','SYR',1),(206,'Taiwan','TW','TWN',1),(207,'Tajikistan','TJ','TJK',1),(208,'Tanzania, United Republic of','TZ','TZA',1),(209,'Thailand','TH','THA',1),(210,'Togo','TG','TGO',1),(211,'Tokelau','TK','TKL',1),(212,'Tonga','TO','TON',1),(213,'Trinidad and Tobago','TT','TTO',1),(214,'Tunisia','TN','TUN',1),(215,'Turkey','TR','TUR',1),(216,'Turkmenistan','TM','TKM',1),(217,'Turks and Caicos Islands','TC','TCA',1),(218,'Tuvalu','TV','TUV',1),(219,'Uganda','UG','UGA',1),(220,'Ukraine','UA','UKR',1),(221,'United Arab Emirates','AE','ARE',1),(222,'United Kingdom','GB','GBR',1),(223,'United States','US','USA',2),(224,'United States Minor Outlying Islands','UM','UMI',1),(225,'Uruguay','UY','URY',1),(226,'Uzbekistan','UZ','UZB',1),(227,'Vanuatu','VU','VUT',1),(228,'Vatican City State (Holy See)','VA','VAT',1),(229,'Venezuela','VE','VEN',1),(230,'Viet Nam','VN','VNM',1),(231,'Virgin Islands (British)','VG','VGB',1),(232,'Virgin Islands (U.S.)','VI','VIR',1),(233,'Wallis and Futuna Islands','WF','WLF',1),(234,'Western Sahara','EH','ESH',1),(235,'Yemen','YE','YEM',1),(236,'Yugoslavia','YU','YUG',1),(237,'Zaire','ZR','ZAR',1),(238,'Zambia','ZM','ZMB',1),(239,'Zimbabwe','ZW','ZWE',1),(240,'Åland Islands','AX','ALA',1),(241,'Bonaire, Sint Eustatius and Saba','BQ','BES',1),(242,'Curaçao','CW','CUW',1),(243,'Montenegro','ME','MNE',1),(244,'Palestine, State of','PS','PSE',1),(245,'Saint Barthélemy','BL','BLM',1),(246,'Saint Martin (French part)','MF','MAF',1),(247,'Sint Maarten (Dutch part)','SX','SXM',1),(248,'South Sudan','SS','SSD',1),(249,'Timor-Leste','TL','TLS',1);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` char(3) NOT NULL,
  `symbol_left` varchar(12) DEFAULT NULL,
  `symbol_right` varchar(12) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`),
  KEY `idx_currencies_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'U.S. Dollar','USD','$','','.',',','2',0.00006200,'2026-10-16 20:46:41'),(2,'Euro','EUR','','€','.',',','2',0.00005700,'2026-10-16 20:46:41'),(3,'Rupiah Indonesia','IDR','Rp ','',',','.','0',1.00000000,'2026-10-16 20:48:29');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_data_groups`
--

DROP TABLE IF EXISTS `customer_data_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_data_groups` (
  `customer_data_groups_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_data_groups_name` varchar(255) NOT NULL,
  `cdg_vertical_sort_order` int(11) NOT NULL,
  `cdg_horizontal_sort_order` int(11) NOT NULL,
  `customer_data_groups_width` int(11) NOT NULL,
  PRIMARY KEY (`language_id`,`customer_data_groups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_data_groups`
--

LOCK TABLES `customer_data_groups` WRITE;
/*!40000 ALTER TABLE `customer_data_groups` DISABLE KEYS */;
INSERT INTO `customer_data_groups` VALUES (1,1,'Your Personal Information',10,10,12),(2,1,'Your Address',20,10,12),(3,1,'Your Contact Information',30,10,12),(4,1,'Company Details',15,10,12),(5,1,'Options',50,10,12),(6,1,'Your Password',60,10,12),(1,2,'Data Pribadi Anda',10,10,12),(2,2,'Alamat Anda',20,10,12),(3,2,'Kontak Anda',30,10,12),(4,2,'Data Perusahaan',15,10,12),(5,2,'Pilihan',50,10,12),(6,2,'Kata Sandi Anda',60,10,12);
/*!40000 ALTER TABLE `customer_data_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_data_groups_sequence`
--

DROP TABLE IF EXISTS `customer_data_groups_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_data_groups_sequence` (
  `customer_data_groups_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`customer_data_groups_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_data_groups_sequence`
--

LOCK TABLES `customer_data_groups_sequence` WRITE;
/*!40000 ALTER TABLE `customer_data_groups_sequence` DISABLE KEYS */;
INSERT INTO `customer_data_groups_sequence` VALUES (1),(2),(3),(4),(5),(6);
/*!40000 ALTER TABLE `customer_data_groups_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) DEFAULT NULL,
  `customers_firstname` varchar(255) NOT NULL,
  `customers_lastname` varchar(255) NOT NULL,
  `customers_dob` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `customers_email_address` varchar(255) NOT NULL,
  `customers_default_address_id` int(11) DEFAULT NULL,
  `customers_telephone` varchar(255) NOT NULL,
  `customers_fax` varchar(255) DEFAULT NULL,
  `customers_password` varchar(60) NOT NULL,
  `customers_newsletter` char(1) DEFAULT NULL,
  PRIMARY KEY (`customers_id`),
  UNIQUE KEY `uq_customers_email_address` (`customers_email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket`
--

DROP TABLE IF EXISTS `customers_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` int(2) NOT NULL,
  `final_price` decimal(15,4) DEFAULT NULL,
  `customers_basket_date_added` char(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_basket_customers_id` (`customers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_basket`
--

LOCK TABLES `customers_basket` WRITE;
/*!40000 ALTER TABLE `customers_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket_attributes`
--

DROP TABLE IF EXISTS `customers_basket_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext NOT NULL,
  `products_options_id` int(11) NOT NULL,
  `products_options_value_id` int(11) NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_customers_basket_att_customers_id` (`customers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_basket_attributes`
--

LOCK TABLES `customers_basket_attributes` WRITE;
/*!40000 ALTER TABLE `customers_basket_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_basket_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_info`
--

DROP TABLE IF EXISTS `customers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_info` (
  `customers_info_id` int(11) NOT NULL,
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT 0,
  `password_reset_key` char(40) DEFAULT NULL,
  `password_reset_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customers_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_info`
--

LOCK TABLES `customers_info` WRITE;
/*!40000 ALTER TABLE `customers_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dw_coupon_redemptions`
--

DROP TABLE IF EXISTS `dw_coupon_redemptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dw_coupon_redemptions` (
  `redemption_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT 0,
  `customers_email_address` varchar(255) NOT NULL,
  `discount_value` decimal(15,4) NOT NULL,
  `date_redeemed` datetime NOT NULL,
  PRIMARY KEY (`redemption_id`),
  UNIQUE KEY `uq_order` (`orders_id`),
  KEY `idx_coupon` (`coupon_id`),
  KEY `idx_customer` (`customers_id`),
  KEY `idx_email` (`customers_email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dw_coupon_redemptions`
--

LOCK TABLES `dw_coupon_redemptions` WRITE;
/*!40000 ALTER TABLE `dw_coupon_redemptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `dw_coupon_redemptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dw_coupons`
--

DROP TABLE IF EXISTS `dw_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dw_coupons` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `type` enum('percent','fixed') NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `min_subtotal` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `max_discount` decimal(15,4) DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `per_customer_limit` int(11) NOT NULL DEFAULT 1,
  `first_order_only` tinyint(1) NOT NULL DEFAULT 0,
  `starts_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dw_coupons`
--

LOCK TABLES `dw_coupons` WRITE;
/*!40000 ALTER TABLE `dw_coupons` DISABLE KEYS */;
INSERT INTO `dw_coupons` VALUES (1,'SELAMATDATANG10','percent',10.0000,100000.0000,50000.0000,NULL,1,1,NULL,NULL,1,'2026-10-17 22:05:22');
/*!40000 ALTER TABLE `dw_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dwellco_sync_categories`
--

DROP TABLE IF EXISTS `dwellco_sync_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dwellco_sync_categories` (
  `medusa_id` varchar(64) NOT NULL,
  `osc_id` int(11) NOT NULL,
  `synced_at` datetime NOT NULL,
  PRIMARY KEY (`medusa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dwellco_sync_categories`
--

LOCK TABLES `dwellco_sync_categories` WRITE;
/*!40000 ALTER TABLE `dwellco_sync_categories` DISABLE KEYS */;
INSERT INTO `dwellco_sync_categories` VALUES ('pcat_01M4K9ZWEG9ZJXCGS0Q2BNKTS2',1,'2026-10-16 21:23:58'),('pcat_01M4K9ZWEK2YTB5A73HDB6E8Y0',2,'2026-10-16 21:23:58'),('pcat_01M4K9ZWEKR80B5CHGD77KE7AT',3,'2026-10-16 21:23:58'),('pcat_01M4K9ZWEMX5FKYV24088KTRWG',4,'2026-10-16 21:23:58'),('pcat_01M4K9ZWENT48PF8K91Q8Q4JWJ',5,'2026-10-16 21:23:58'),('pcat_01M4N06VRH2E477WZ606SGW3XW',6,'2026-10-16 21:23:58'),('pcat_01M4NHJWAJ9ZWZG4VERM5MPYFY',7,'2026-10-16 21:23:58');
/*!40000 ALTER TABLE `dwellco_sync_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dwellco_sync_orders`
--

DROP TABLE IF EXISTS `dwellco_sync_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dwellco_sync_orders` (
  `osc_order_id` int(11) NOT NULL,
  `medusa_order_id` varchar(64) DEFAULT NULL,
  `status` varchar(16) NOT NULL,
  `error` text DEFAULT NULL,
  `synced_at` datetime NOT NULL,
  PRIMARY KEY (`osc_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dwellco_sync_orders`
--

LOCK TABLES `dwellco_sync_orders` WRITE;
/*!40000 ALTER TABLE `dwellco_sync_orders` DISABLE KEYS */;
INSERT INTO `dwellco_sync_orders` VALUES (1,'order_01M52FMBBS44BM09CT283QWXZB','sent',NULL,'2026-10-16 20:50:08');
/*!40000 ALTER TABLE `dwellco_sync_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dwellco_sync_products`
--

DROP TABLE IF EXISTS `dwellco_sync_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dwellco_sync_products` (
  `medusa_id` varchar(64) NOT NULL,
  `osc_id` int(11) NOT NULL,
  `handle` varchar(191) NOT NULL,
  `synced_at` datetime NOT NULL,
  PRIMARY KEY (`medusa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dwellco_sync_products`
--

LOCK TABLES `dwellco_sync_products` WRITE;
/*!40000 ALTER TABLE `dwellco_sync_products` DISABLE KEYS */;
INSERT INTO `dwellco_sync_products` VALUES ('prod_01M4K9ZWFT0KQ0MHBHT88ZMWWC',1,'talenan-kayu-jati','2026-10-16 21:23:59'),('prod_01M4K9ZWFT0KSHXA3K0JGDPVTS',2,'gelas-kaca-bening','2026-10-16 21:23:59'),('prod_01M4K9ZWFT3BJ8K45MMRHX0Y2E',3,'mangkuk-sup-emas','2026-10-16 21:23:59'),('prod_01M4K9ZWFT3FTF6XW592J9Y9SG',4,'pisau-chef-baja','2026-10-16 21:23:59'),('prod_01M4K9ZWFT4EQT11F13RVMC1TG',5,'toples-kaca-tutup-bambu','2026-10-16 21:23:59'),('prod_01M4K9ZWFT8B2DTZC9M3MJD5K6',6,'wajan-anti-lengket','2026-10-16 21:23:59'),('prod_01M4K9ZWFT9T39ZWV88KB79MMP',7,'rak-bumbu-putar','2026-10-16 21:23:59'),('prod_01M4K9ZWFTAVXZAEH583BX7FA0',8,'panci-stainless-set','2026-10-16 21:23:59'),('prod_01M4K9ZWFTKQZDF6XMHSZBJ2AW',9,'piring-keramik-putih','2026-10-16 21:23:59'),('prod_01M4K9ZWFTNXBPX2E50CCTAAH1',10,'vas-keramik-minimalis','2026-10-16 21:23:59'),('prod_01M4K9ZWFV1R7X3QRVSYB4WNFR',11,'lilin-aromaterapi-linen','2026-10-16 21:23:59'),('prod_01M4K9ZWFVA24MKHM4P0QX31V5',12,'taplak-meja-linen','2026-10-16 21:23:59'),('prod_01M4N09JXN1CFJ01KQY1V442TY',13,'tong-sampah-injak-stainless','2026-10-16 21:23:59'),('prod_01M4N09JXN5H3TJ1QNW7F4MVZ1',14,'keset-bulu-lembut-berumbai','2026-10-16 21:23:59'),('prod_01M4N09JXN5H88ZDNBG7XG761T',15,'cairan-pembersih-lantai-premium','2026-10-16 21:23:59'),('prod_01M4N09JXN6ZT62EHZ2B97XZ7T',16,'set-pisau-dapur-blok-kayu-pinus','2026-10-16 21:23:59'),('prod_01M4N09JXNDHHAFVQH8ZY5MW25',17,'karpet-klasik-motif-biru','2026-10-16 21:23:59'),('prod_01M4N09JXNE3ANCHF8TADFYQW2',18,'sarung-bantal-premium-tencel','2026-10-16 21:23:59'),('prod_01M4N09JXNH7N5T5655MZCKZ73',19,'handuk-premium-anti-bakteri','2026-10-16 21:23:59'),('prod_01M4N09JXNRWBBQ87YW2ENYQ0C',20,'botol-minum-water-is-life','2026-10-16 21:23:59'),('prod_01M4N09JXNSKWYVJZJNNXWN71J',21,'kotak-penyimpanan-berpenutup','2026-10-16 21:23:59'),('prod_01M4N09JXP0CBQR3C1SMAFADQN',22,'set-sapu-dan-tong-sampah-stainless','2026-10-16 21:23:59'),('prod_01M4N09JXP61ZT7K5W343VQM0M',23,'set-sapu-dan-pengki','2026-10-16 21:23:59'),('prod_01M4N09JXP7JYQ632YAPJQN3WZ',24,'tempat-makan-premium-3-pcs','2026-10-16 21:23:59'),('prod_01M4N09JXPBYBW977Z4WSQHBPB',25,'spin-mop-dengan-ember','2026-10-16 21:23:59'),('prod_01M4NHJWBV4BMKDHFM8AVKP798',26,'earthia-botanical-lip-tint','2026-10-16 21:23:59'),('prod_01M4NHJWBV9SAC1BNWF3EA15J3',27,'earthia-botanical-brows-pencil','2026-10-16 21:23:59'),('prod_01M4NHJWBVC1DGFV9GQNBYEX70',28,'earthia-anti-hair-loss-conditioner','2026-10-16 21:23:59'),('prod_01M4NHJWBVHJFARG2ETZRWGNGR',29,'earthia-lash-brow-elixir','2026-10-16 21:23:59'),('prod_01M4NHJWBVK86N2R7BYK42HEE5',30,'earthia-velvet-liquid-lipstick-set','2026-10-16 21:23:59'),('prod_01M4NHJWBVM0EQ6YGV2VKK8TAV',31,'earthia-powerstay-foundation','2026-10-16 21:23:59'),('prod_01M4NHJWBVQF4NXD1W36CPDMQH',32,'earthia-botanical-eau-de-parfum','2026-10-16 21:23:59'),('prod_01M4NHJWBVR1ZC0WFW0E9NW219',33,'earthia-botanical-lash-primer','2026-10-16 21:23:59'),('prod_01M4NHJWBVS5WR3PZ52Y9NNG9X',34,'earthia-aloe-vera-shampoo','2026-10-16 21:23:59'),('prod_01M4NHJWBVSDCQ8HYHNPBQ2G2C',35,'earthia-hair-care-trio','2026-10-16 21:23:59'),('prod_01M4NHJWBVWSYX5XY9880DDAMK',36,'earthia-botanical-eyeshadow-quad','2026-10-16 21:23:59'),('prod_01M4NHJWBVXHK149R19P1ZPWNT',37,'earthia-creme-hair-colour','2026-10-16 21:23:59'),('prod_01M4NHJWBW5HB41W0D12AEKC5Y',38,'earthia-brightening-body-scrub','2026-10-16 21:23:59'),('prod_01M4NHJWBW8E9Y4NNFEABMAESF',39,'earthia-botanical-dew-roll-on','2026-10-16 21:23:59'),('prod_01M4NHJWBWAMSD5G3CRKEX3CHM',40,'earthia-botanical-white-body-wash','2026-10-16 21:23:59'),('prod_01M4NHJWBWPR73RAMM1KMFG1V6',41,'earthia-brightening-body-lotion','2026-10-16 21:23:59'),('prod_01M4NHJWBWZCPDJMZ44WNBGAB1',42,'earthia-hair-vitamins-premium','2026-10-16 21:23:59');
/*!40000 ALTER TABLE `dwellco_sync_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_zones`
--

DROP TABLE IF EXISTS `geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL,
  `geo_zone_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_zones`
--

LOCK TABLES `geo_zones` WRITE;
/*!40000 ALTER TABLE `geo_zones` DISABLE KEYS */;
INSERT INTO `geo_zones` VALUES (1,'Florida','Florida local sales tax zone',NULL,'2026-10-16 20:46:41');
/*!40000 ALTER TABLE `geo_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hooks`
--

DROP TABLE IF EXISTS `hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hooks` (
  `hooks_id` int(11) NOT NULL AUTO_INCREMENT,
  `hooks_site` varchar(63) NOT NULL,
  `hooks_group` varchar(63) NOT NULL,
  `hooks_action` varchar(255) NOT NULL,
  `hooks_code` varchar(127) NOT NULL,
  `hooks_class` varchar(255) NOT NULL,
  `hooks_method` varchar(255) NOT NULL,
  PRIMARY KEY (`hooks_id`),
  KEY `idx_hooks_site_group` (`hooks_site`,`hooks_group`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hooks`
--

LOCK TABLES `hooks` WRITE;
/*!40000 ALTER TABLE `hooks` DISABLE KEYS */;
INSERT INTO `hooks` VALUES (1,'shop','system','startApplication','_01_project_version','application_surface','project_version'),(2,'shop','system','startApplication','_02_request','application_surface','request'),(3,'shop','system','startApplication','_03_read_configuration','application_surface','read_configuration'),(4,'shop','system','startApplication','_04_general','function_surface','general'),(5,'shop','system','startApplication','_05_href_link','function_surface','href_link'),(6,'shop','system','startApplication','_06_image','function_surface','image'),(7,'shop','system','startApplication','_07_html_output','function_surface','html_output'),(8,'shop','system','startApplication','_08_sessions','function_surface','sessions'),(9,'shop','system','startApplication','_09_gzip','application_surface','gzip'),(10,'shop','system','startApplication','_10_start_session','application_surface','start_session'),(11,'shop','system','startApplication','_11_check_ssl_session_id','Application','check_ssl_session_id'),(12,'shop','system','startApplication','_12_check_user_agent','Application','check_user_agent'),(13,'shop','system','startApplication','_14_check_ip','Application','check_ip'),(14,'shop','system','startApplication','_15_cart','Application','ensure_session_cart'),(15,'shop','system','startApplication','_16_set_session_language','Application','set_session_language'),(16,'shop','system','startApplication','_17_fix_numeric_locale','Application','fix_numeric_locale'),(17,'shop','system','startApplication','_18_set_currency','currencies','set_currency'),(18,'shop','system','startApplication','_19_ensure_navigation_history','Application','ensure_navigation_history'),(19,'shop','system','startApplication','_20_messageStack','Loader','messageStack'),(20,'shop','system','startApplication','_21_customer_data','Loader','customer_data'),(21,'shop','system','startApplication','_22_customer','Application','set_customer_if_identified'),(22,'shop','system','startApplication','_23_parse_actions','application_surface','parse_actions'),(23,'shop','system','startApplication','_24_whos_online','','whos_online::update'),(24,'shop','system','startApplication','_25_password_funcs','function_surface','password_funcs'),(25,'shop','system','startApplication','_26_template_title','Application','set_template_title'),(26,'shop','system','startApplication','_27_expire_specials','','specials::expire'),(27,'shop','system','startApplication','_29_category_path','application_surface','category_path'),(28,'shop','system','startApplication','_30_register_page_hook','hooks','register_page'),(29,'shop','checkout','checkoutStart','_01_register_stages','Checkout','register_stages'),(30,'shop','checkout','startApplication','_01_require_login','','tep_require_login'),(31,'shop','checkout_confirmation_stage','startApplication','_01_require_login','Checkout','require_login'),(32,'shop','checkout','startApplication','_02_guarantee_cart','Checkout','guarantee_cart'),(33,'shop','checkout_shipping','startApplication','_03_guarantee_cart_id','Checkout','guarantee_cart_id'),(34,'shop','checkout_shipping','startApplication','_04_validate','Checkout','validate_sendto'),(35,'shop','checkout_payment_stage','startApplication','_04_validate','Checkout','validate'),(36,'shop','checkout_payment','startApplication','_05_validate_payment','Checkout','validate_billto'),(37,'shop','checkout_confirmation','startApplication','_05_validate_payment','Checkout','guarantee_payment'),(38,'shop','checkout_process','startApplication','_05_validate_payment','Checkout','validate_payment'),(39,'shop','checkout_confirmation_stage','startApplication','_06_initialize_payment_module','Checkout','initialize_payment_module'),(40,'shop','checkout_confirmation_stage','startApplication','_07_initialize_shipping_module','Checkout','initialize_shipping_module'),(41,'shop','checkout','startApplication','_08_order','Loader','order'),(42,'shop','checkout_payment_stage','startApplication','_09_check_stock','checkout_surface','check_stock'),(43,'shop','checkout_shipping','startApplication','_10_virtual_shipping','Checkout','skip_shipping'),(44,'shop','checkout_shipping_address','startApplication','_10_virtual_shipping','Checkout','skip_shipping'),(45,'shop','checkout_payment','startApplication','_10_initialize_payment_modules','Checkout','initialize_payment_modules'),(46,'shop','checkout_confirmation_stage','startApplication','_10_update_payment_modules','Checkout','update_payment_module'),(47,'shop','checkout_confirmation_stage','startApplication','_11_set_order_totals','Checkout','set_order_totals'),(48,'shop','checkout_confirmation','startApplication','_12_prepare_payment','Checkout','preconfirm_payment'),(49,'shop','checkout_process','startApplication','_12_prepare_payment','Checkout','prepare_payment'),(50,'shop','checkout_process','startApplication','_14_insert_order','checkout_surface','insert_order'),(51,'shop','checkout_process','startApplication','_20_after','pipeline_surface','after'),(52,'shop','after','afterStart','_21_update_stock','Checkout','update_stock'),(53,'shop','after','afterStart','_22_update_products_ordered','Checkout','update_products_ordered'),(54,'shop','after','afterStart','_23_notify','Checkout','notify'),(55,'shop','checkout_process','startApplication','_30_insert_history','checkout_surface','insert_history'),(56,'shop','checkout_process','startApplication','_31_conclude_payment','Checkout','conclude_payment'),(57,'shop','checkout_process','startApplication','_40_reset','pipeline_surface','reset'),(58,'shop','reset','resetStart','_41_reset_cart','Checkout','reset_cart'),(59,'shop','reset','resetStart','_42_unset_sendto','session_eraser','sendto'),(60,'shop','reset','resetStart','_43_unset_billto','session_eraser','billto'),(61,'shop','reset','resetStart','_44_unset_shipping','session_eraser','shipping'),(62,'shop','reset','resetStart','_45_unset_payment','session_eraser','payment'),(63,'shop','reset','resetStart','_46_unset_comments','session_eraser','comments'),(64,'shop','checkout_process','startApplication','zz_redirect_success','Checkout','redirect_success'),(65,'shop','siteWide','postRegistration','_01_post_login','Login','hook'),(66,'shop','siteWide','postLogin','_01_recreate_session','','tep_session_recreate'),(67,'shop','create_account','postLogin','_02_set_customer_id','Login','add_customer_id'),(68,'shop','login','postLogin','_02_set_customer_id','Login','set_customer_id'),(69,'shop','login','postLogin','_03_log','Login','log'),(70,'shop','siteWide','postLogin','_04_reset_token','','tep_reset_session_token'),(71,'shop','login','postLogin','_05_restore_cart','cart','restore_contents'),(72,'shop','login','postLogin','zz_redirect','navigation','redirect_to_snapshot'),(73,'shop','create_account','postRegistration','_02_restore_cart','cart','restore_contents'),(74,'shop','create_account','postRegistration','_03_notify','Login','notify'),(75,'shop','create_account','postRegistration','zz_redirect','Login','redirect_success'),(76,'shop','logoff','resetStart','_40_unset_customer_id','session_eraser','customer_id'),(77,'shop','checkout_success','siteWideStart','notify','cm_cs_product_notifications','process'),(78,'shop','index','siteWideStart','category_depth','','category_tree::set_global_depth'),(79,'shop','loginRequired','loginRequiredStart','zz_redirect','','tep_require_login');
/*!40000 ALTER TABLE `hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` char(2) NOT NULL,
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `IDX_LANGUAGES_NAME` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','icon.gif','english',1),(2,'Indonesia','id','icon.gif','indonesia',0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(255) NOT NULL,
  `manufacturers_image` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `IDX_MANUFACTURERS_NAME` (`manufacturers_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Earthia Care','dwellco/earthia-hair-care-trio.jpg','2026-10-16 23:22:40',NULL);
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers_info`
--

DROP TABLE IF EXISTS `manufacturers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `manufacturers_url` varchar(255) NOT NULL,
  `url_clicked` int(5) NOT NULL DEFAULT 0,
  `date_last_click` datetime DEFAULT NULL,
  `manufacturers_description` text DEFAULT NULL,
  `manufacturers_seo_description` text DEFAULT NULL,
  `manufacturers_seo_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers_info`
--

LOCK TABLES `manufacturers_info` WRITE;
/*!40000 ALTER TABLE `manufacturers_info` DISABLE KEYS */;
INSERT INTO `manufacturers_info` VALUES (1,1,'',0,NULL,'Botanical make-up, hair and body care made with natural extracts.',NULL,NULL),(1,2,'',0,NULL,'Rangkaian riasan, perawatan rambut, dan tubuh berbahan ekstrak alami.',NULL,NULL);
/*!40000 ALTER TABLE `manufacturers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `module` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT 0,
  PRIMARY KEY (`newsletters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `customers_name` varchar(255) NOT NULL,
  `customers_company` varchar(255) DEFAULT NULL,
  `customers_street_address` varchar(255) NOT NULL,
  `customers_suburb` varchar(255) DEFAULT NULL,
  `customers_city` varchar(255) NOT NULL,
  `customers_postcode` varchar(255) NOT NULL,
  `customers_state` varchar(255) DEFAULT NULL,
  `customers_country` varchar(255) NOT NULL,
  `customers_telephone` varchar(255) NOT NULL,
  `customers_email_address` varchar(255) NOT NULL,
  `customers_address_format_id` int(5) NOT NULL,
  `delivery_name` varchar(255) NOT NULL,
  `delivery_company` varchar(255) DEFAULT NULL,
  `delivery_street_address` varchar(255) NOT NULL,
  `delivery_suburb` varchar(255) DEFAULT NULL,
  `delivery_city` varchar(255) NOT NULL,
  `delivery_postcode` varchar(255) NOT NULL,
  `delivery_state` varchar(255) DEFAULT NULL,
  `delivery_country` varchar(255) NOT NULL,
  `delivery_address_format_id` int(5) NOT NULL,
  `billing_name` varchar(255) NOT NULL,
  `billing_company` varchar(255) DEFAULT NULL,
  `billing_street_address` varchar(255) NOT NULL,
  `billing_suburb` varchar(255) DEFAULT NULL,
  `billing_city` varchar(255) NOT NULL,
  `billing_postcode` varchar(255) NOT NULL,
  `billing_state` varchar(255) DEFAULT NULL,
  `billing_country` varchar(255) NOT NULL,
  `billing_address_format_id` int(5) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(255) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL,
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `idx_orders_customers_id` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `products_model` varchar(255) DEFAULT NULL,
  `products_name` varchar(255) NOT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `final_price` decimal(15,4) NOT NULL,
  `products_tax` decimal(7,4) NOT NULL,
  `products_quantity` int(2) NOT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_products_orders_id` (`orders_id`),
  KEY `idx_orders_products_products_id` (`products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_attributes`
--

DROP TABLE IF EXISTS `orders_products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_products_id` int(11) NOT NULL,
  `products_options` varchar(255) NOT NULL,
  `products_options_values` varchar(255) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_products_att_orders_id` (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products_attributes`
--

LOCK TABLES `orders_products_attributes` WRITE;
/*!40000 ALTER TABLE `orders_products_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_download`
--

DROP TABLE IF EXISTS `orders_products_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT 0,
  `orders_products_id` int(11) NOT NULL DEFAULT 0,
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT 0,
  `download_count` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_products_download_orders_id` (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products_download`
--

LOCK TABLES `orders_products_download` WRITE;
/*!40000 ALTER TABLE `orders_products_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status`
--

DROP TABLE IF EXISTS `orders_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `orders_status_name` varchar(32) NOT NULL,
  `public_flag` int(11) DEFAULT 1,
  `downloads_flag` int(11) DEFAULT 0,
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name` (`orders_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_status`
--

LOCK TABLES `orders_status` WRITE;
/*!40000 ALTER TABLE `orders_status` DISABLE KEYS */;
INSERT INTO `orders_status` VALUES (1,1,'Pending',1,0),(1,2,'Menunggu',1,0),(2,1,'Processing',1,1),(2,2,'Diproses',1,1),(3,1,'Delivered',1,1),(3,2,'Terkirim',1,1);
/*!40000 ALTER TABLE `orders_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status_history`
--

DROP TABLE IF EXISTS `orders_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_status_id` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  `customer_notified` int(1) DEFAULT 0,
  `comments` text DEFAULT NULL,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_status_history_orders_id` (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_status_history`
--

LOCK TABLES `orders_status_history` WRITE;
/*!40000 ALTER TABLE `orders_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_total`
--

DROP TABLE IF EXISTS `orders_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `class` varchar(32) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_orders_total_orders_id` (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_total`
--

LOCK TABLES `orders_total` WRITE;
/*!40000 ALTER TABLE `orders_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oscom_app_paypal_log`
--

DROP TABLE IF EXISTS `oscom_app_paypal_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oscom_app_paypal_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `module` varchar(8) NOT NULL,
  `action` varchar(255) NOT NULL,
  `result` tinyint(4) NOT NULL,
  `server` tinyint(4) NOT NULL,
  `request` text NOT NULL,
  `response` text NOT NULL,
  `ip_address` int(10) unsigned DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oapl_module` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oscom_app_paypal_log`
--

LOCK TABLES `oscom_app_paypal_log` WRITE;
/*!40000 ALTER TABLE `oscom_app_paypal_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `oscom_app_paypal_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `pages_status` tinyint(1) NOT NULL DEFAULT 1,
  `slug` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`pages_id`),
  UNIQUE KEY `uq_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'2026-10-16 20:46:41',NULL,1,'privacy',10),(2,'2026-10-16 20:46:41',NULL,1,'conditions',20),(3,'2026-10-16 20:46:41',NULL,1,'shipping',30);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_description`
--

DROP TABLE IF EXISTS `pages_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_description` (
  `pages_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `pages_title` varchar(255) NOT NULL,
  `pages_text` text NOT NULL,
  `navbar_title` varchar(255) NOT NULL,
  PRIMARY KEY (`pages_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_description`
--

LOCK TABLES `pages_description` WRITE;
/*!40000 ALTER TABLE `pages_description` DISABLE KEYS */;
INSERT INTO `pages_description` VALUES (1,1,'Privacy & Cookie Policy','<p>Dwell&amp;Co stores the details you give us when you create a profile and shop (name, email, phone, address) only to process your orders and contact you about them. Your data is never sold to third parties.</p><p>This site uses cookies to keep your session and shopping cart. You can disable cookies in your browser, but online shopping will not work.</p><p>To request a copy or deletion of your data, contact us through the Contact Us page.</p>','Privacy & Cookie Policy'),(1,2,'Kebijakan Privasi & Cookie','<p>Dwell&amp;Co menyimpan data yang Anda berikan saat membuat profil dan berbelanja (nama, email, telepon, alamat) hanya untuk memproses pesanan dan menghubungi Anda terkait pesanan. Data tidak dijual kepada pihak lain.</p><p>Situs ini memakai cookie untuk menyimpan sesi dan isi keranjang. Anda bisa menonaktifkan cookie di peramban, tetapi belanja online tidak akan berfungsi.</p><p>Untuk meminta salinan atau penghapusan data, hubungi kami lewat halaman Hubungi Kami.</p>','Kebijakan Privasi & Cookie'),(2,1,'Terms & Conditions','<p>By shopping at Dwell&amp;Co you agree to the following: prices and stock may change at any time; an order is valid once it has been confirmed; you are responsible for the accuracy of your delivery address; product photos may differ slightly from the actual item due to lighting and screens.</p>','Terms & Conditions'),(2,2,'Syarat & Ketentuan','<p>Dengan berbelanja di Dwell&amp;Co, Anda menyetujui syarat berikut: harga dan stok dapat berubah sewaktu-waktu; pesanan dianggap sah setelah dikonfirmasi; Anda bertanggung jawab atas kebenaran alamat pengiriman; foto produk dapat sedikit berbeda dari aslinya karena pencahayaan dan layar.</p>','Syarat & Ketentuan'),(3,1,'Shipping & Returns','<p>Orders are shipped through our courier partners across Indonesia. Shipping is a flat <strong>Rp 20,000</strong> per order, and <strong>free for orders of Rp 250,000 or more</strong>. The shipping cost is always shown before you pay. Delivery time depends on the destination city.</p><p>If an item arrives damaged or not as described, contact us within 2 x 24 hours of receiving it, with photos and your order number.</p>','Shipping & Returns'),(3,2,'Pengiriman & Pengembalian','<p>Pesanan dikirim melalui kurir mitra ke seluruh Indonesia. Ongkos kirim tarif tetap <strong>Rp 20.000</strong> per pesanan, dan <strong>gratis ongkir untuk belanja minimal Rp 250.000</strong>. Ongkos kirim selalu ditampilkan sebelum Anda membayar. Estimasi tiba bergantung pada kota tujuan.</p><p>Jika barang rusak atau tidak sesuai, hubungi kami maksimal 2 x 24 jam setelah barang diterima dengan menyertakan foto dan nomor pesanan.</p>','Pengiriman & Pengembalian');
/*!40000 ALTER TABLE `pages_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_quantity` int(4) NOT NULL,
  `products_model` varchar(255) DEFAULT NULL,
  `products_image` varchar(255) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `products_date_added` datetime NOT NULL,
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` decimal(5,2) NOT NULL,
  `products_status` tinyint(1) NOT NULL,
  `products_tax_class_id` int(11) NOT NULL,
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` int(11) NOT NULL DEFAULT 0,
  `products_gtin` char(14) DEFAULT NULL,
  PRIMARY KEY (`products_id`),
  KEY `idx_products_model` (`products_model`),
  KEY `idx_products_date_added` (`products_date_added`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,97,'TALENAN-KAYU-JATI-1','dwellco/talenan-kayu-jati.jpg',129000.0000,'2026-10-16 20:48:29','2026-10-16 21:23:59',NULL,1.10,1,0,0,0,NULL),(2,50,'GELAS-KACA-BENING-1','dwellco/gelas-kaca-bening.jpg',149000.0000,'2026-10-16 20:48:29','2026-10-16 21:23:59',NULL,1.20,1,0,0,0,NULL),(3,50,'MANGKUK-SUP-EMAS-1','dwellco/mangkuk-sup-emas.jpg',89000.0000,'2026-10-16 20:48:29','2026-10-16 21:23:59',NULL,0.40,1,0,0,0,NULL),(4,50,'PISAU-CHEF-BAJA-1','dwellco/pisau-chef-baja.jpg',175000.0000,'2026-10-16 20:48:29','2026-10-16 21:23:59',NULL,0.35,1,0,0,0,NULL),(5,100,'TOPLES-KACA-TUTUP-BAMBU-1','dwellco/toples-kaca-tutup-bambu.jpg',79000.0000,'2026-10-16 20:48:29','2026-10-16 21:23:59',NULL,0.60,1,0,0,0,NULL),(6,98,'WAJAN-ANTI-LENGKET-1','dwellco/wajan-anti-lengket.jpg',189000.0000,'2026-10-16 20:48:29','2026-10-16 21:23:59',NULL,0.90,1,0,0,0,NULL),(7,50,'RAK-BUMBU-PUTAR-1','dwellco/rak-bumbu-putar.jpg',199000.0000,'2026-10-16 20:48:29','2026-10-16 21:23:59',NULL,1.50,1,0,0,0,NULL),(8,50,'PANCI-STAINLESS-SET-1','dwellco/panci-stainless-set.jpg',459000.0000,'2026-10-16 20:48:29','2026-10-16 21:23:59',NULL,3.20,1,0,0,0,NULL),(9,99,'PIRING-KERAMIK-PUTIH-1','dwellco/piring-keramik-putih.jpg',219000.0000,'2026-10-16 20:48:29','2026-10-16 21:23:59',NULL,0.45,1,0,0,0,NULL),(10,100,'VAS-KERAMIK-MINIMALIS-1','dwellco/vas-keramik-minimalis.jpg',159000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.80,1,0,0,0,NULL),(11,50,'LILIN-AROMATERAPI-LINEN-1','dwellco/lilin-aromaterapi-linen.jpg',119000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.30,1,0,0,0,NULL),(12,100,'TAPLAK-MEJA-LINEN-1','dwellco/taplak-meja-linen.jpg',149000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.40,1,0,0,0,NULL),(13,41,'TONG-SAMPAH-INJAK-STAINLESS-1','dwellco/tong-sampah-injak-stainless.jpg',229000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,2.50,1,0,0,0,NULL),(14,78,'KESET-BULU-LEMBUT-BERUMBAI-1','dwellco/keset-bulu-lembut-berumbai.jpg',79000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.90,1,0,0,0,NULL),(15,50,'CAIRAN-PEMBERSIH-LANTAI-PREMIUM-1','dwellco/cairan-pembersih-lantai-premium.jpg',28000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,1.00,1,0,0,0,NULL),(16,22,'SET-PISAU-DAPUR-BLOK-KAYU-PINUS-1','dwellco/set-pisau-dapur-blok-kayu-pinus.jpg',249000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,1.80,1,0,0,0,NULL),(17,59,'KARPET-KLASIK-MOTIF-BIRU-1','dwellco/karpet-klasik-motif-biru.jpg',185000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,2.50,1,0,0,0,NULL),(18,31,'SARUNG-BANTAL-PREMIUM-TENCEL-1','dwellco/sarung-bantal-premium-tencel.jpg',65000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.20,1,0,0,0,NULL),(19,68,'HANDUK-PREMIUM-ANTI-BAKTERI-1','dwellco/handuk-premium-anti-bakteri.jpg',45000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.25,1,0,0,0,NULL),(20,40,'BOTOL-MINUM-WATER-IS-LIFE-1','dwellco/botol-minum-water-is-life.jpg',129000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.50,1,0,0,0,NULL),(21,77,'KOTAK-PENYIMPANAN-BERPENUTUP-1','dwellco/kotak-penyimpanan-berpenutup.jpg',16999.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.40,1,0,0,0,NULL),(22,49,'SET-SAPU-DAN-TONG-SAMPAH-STAINLESS-1','dwellco/set-sapu-dan-tong-sampah-stainless.jpg',289000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,3.00,1,0,0,0,NULL),(23,21,'SET-SAPU-DAN-PENGKI-1','dwellco/set-sapu-dan-pengki.jpg',119000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,1.20,1,0,0,0,NULL),(24,58,'TEMPAT-MAKAN-PREMIUM-3-PCS-1','dwellco/tempat-makan-premium-3-pcs.jpg',79000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.60,1,0,0,0,NULL),(25,30,'SPIN-MOP-DENGAN-EMBER-1','dwellco/spin-mop-dengan-ember.jpg',189000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,2.20,1,0,0,0,NULL),(26,67,'EARTHIA-BOTANICAL-LIP-TINT-1','dwellco/earthia-botanical-lip-tint.jpg',49000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.06,1,0,1,0,NULL),(27,39,'EARTHIA-BOTANICAL-BROWS-PENCIL-1','dwellco/earthia-botanical-brows-pencil.jpg',45000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.04,1,0,1,0,NULL),(28,76,'EARTHIA-ANTI-HAIR-LOSS-CONDITIONER-1','dwellco/earthia-anti-hair-loss-conditioner.jpg',69000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.25,1,0,1,0,NULL),(29,48,'EARTHIA-LASH-BROW-ELIXIR-1','dwellco/earthia-lash-brow-elixir.jpg',79000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.20,1,0,1,0,NULL),(30,20,'EARTHIA-VELVET-LIQUID-LIPSTICK-SET-1','dwellco/earthia-velvet-liquid-lipstick-set.jpg',189000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.25,1,0,1,0,NULL),(31,57,'EARTHIA-POWERSTAY-FOUNDATION-1','dwellco/earthia-powerstay-foundation.jpg',99000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.15,1,0,1,0,NULL),(32,29,'EARTHIA-BOTANICAL-EAU-DE-PARFUM-1','dwellco/earthia-botanical-eau-de-parfum.jpg',149000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.25,1,0,1,0,NULL),(33,66,'EARTHIA-BOTANICAL-LASH-PRIMER-1','dwellco/earthia-botanical-lash-primer.jpg',59000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.05,1,0,1,0,NULL),(34,38,'EARTHIA-ALOE-VERA-SHAMPOO-1','dwellco/earthia-aloe-vera-shampoo.jpg',39000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.20,1,0,1,0,NULL),(35,75,'EARTHIA-HAIR-CARE-TRIO-1','dwellco/earthia-hair-care-trio.jpg',89000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.20,1,0,1,0,NULL),(36,47,'EARTHIA-BOTANICAL-EYESHADOW-QUAD-1','dwellco/earthia-botanical-eyeshadow-quad.jpg',89000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.12,1,0,1,0,NULL),(37,19,'EARTHIA-CREME-HAIR-COLOUR-1','dwellco/earthia-creme-hair-colour.jpg',35000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.15,1,0,1,0,NULL),(38,56,'EARTHIA-BRIGHTENING-BODY-SCRUB-1','dwellco/earthia-brightening-body-scrub.jpg',79000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.30,1,0,1,0,NULL),(39,28,'EARTHIA-BOTANICAL-DEW-ROLL-ON-1','dwellco/earthia-botanical-dew-roll-on.jpg',29000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.10,1,0,1,0,NULL),(40,65,'EARTHIA-BOTANICAL-WHITE-BODY-WASH-1','dwellco/earthia-botanical-white-body-wash.jpg',55000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.50,1,0,1,0,NULL),(41,37,'EARTHIA-BRIGHTENING-BODY-LOTION-1','dwellco/earthia-brightening-body-lotion.jpg',69000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.25,1,0,1,0,NULL),(42,74,'EARTHIA-HAIR-VITAMINS-PREMIUM-1','dwellco/earthia-hair-vitamins-premium.jpg',25000.0000,'2026-10-16 20:48:30','2026-10-16 21:23:59',NULL,0.06,1,0,1,0,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes`
--

DROP TABLE IF EXISTS `products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `options_id` int(11) NOT NULL,
  `options_values_id` int(11) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) NOT NULL,
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_products_attributes_products_id` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes`
--

LOCK TABLES `products_attributes` WRITE;
/*!40000 ALTER TABLE `products_attributes` DISABLE KEYS */;
INSERT INTO `products_attributes` VALUES (298,1,1,1,0.0000,'+'),(299,1,1,2,40000.0000,'+'),(300,5,1,3,0.0000,'+'),(301,5,1,4,30000.0000,'+'),(302,6,1,5,0.0000,'+'),(303,6,1,6,50000.0000,'+'),(304,9,2,7,0.0000,'+'),(305,9,2,8,100000.0000,'+'),(306,10,3,9,0.0000,'+'),(307,10,3,10,0.0000,'+'),(308,12,1,11,0.0000,'+'),(309,12,1,12,50000.0000,'+'),(310,13,1,13,0.0000,'+'),(311,13,1,14,100000.0000,'+'),(312,13,1,15,220000.0000,'+'),(313,14,3,16,0.0000,'+'),(314,14,3,17,0.0000,'+'),(315,14,3,18,0.0000,'+'),(316,15,4,19,0.0000,'+'),(317,15,4,20,0.0000,'+'),(318,15,4,21,0.0000,'+'),(319,15,4,22,0.0000,'+'),(320,15,4,23,0.0000,'+'),(321,17,1,24,0.0000,'+'),(322,17,1,25,210000.0000,'+'),(323,17,1,26,465000.0000,'+'),(324,18,3,27,0.0000,'+'),(325,18,3,28,0.0000,'+'),(326,18,3,29,0.0000,'+'),(327,18,3,9,0.0000,'+'),(328,19,3,30,0.0000,'+'),(329,19,3,31,0.0000,'+'),(330,19,3,9,0.0000,'+'),(331,19,3,32,0.0000,'+'),(332,20,3,33,0.0000,'+'),(333,20,3,31,0.0000,'+'),(334,20,3,34,0.0000,'+'),(335,20,3,35,0.0000,'+'),(336,21,3,36,0.0000,'+'),(337,21,3,31,0.0000,'+'),(338,21,3,30,0.0000,'+'),(339,21,3,37,0.0000,'+'),(340,21,3,38,0.0000,'+'),(341,22,5,13,0.0000,'+'),(342,22,5,14,100000.0000,'+'),(343,22,5,15,220000.0000,'+'),(344,23,3,31,0.0000,'+'),(345,23,3,35,0.0000,'+'),(346,24,3,31,0.0000,'+'),(347,24,3,39,0.0000,'+'),(348,24,3,40,0.0000,'+'),(349,25,3,39,0.0000,'+'),(350,25,3,31,0.0000,'+'),(351,26,6,41,0.0000,'+'),(352,26,6,42,0.0000,'+'),(353,26,6,43,0.0000,'+'),(354,26,6,44,0.0000,'+'),(355,26,6,45,0.0000,'+'),(356,27,3,46,0.0000,'+'),(357,27,3,47,0.0000,'+'),(358,27,3,18,0.0000,'+'),(359,27,3,48,0.0000,'+'),(360,31,6,49,0.0000,'+'),(361,31,6,50,0.0000,'+'),(362,31,6,51,0.0000,'+'),(363,31,6,52,0.0000,'+'),(364,32,4,53,0.0000,'+'),(365,32,4,54,0.0000,'+'),(366,32,4,55,0.0000,'+'),(367,35,7,56,0.0000,'+'),(368,35,7,57,0.0000,'+'),(369,35,7,58,0.0000,'+'),(370,36,8,59,0.0000,'+'),(371,36,8,60,0.0000,'+'),(372,36,8,61,0.0000,'+'),(373,37,3,62,0.0000,'+'),(374,37,3,59,0.0000,'+'),(375,37,3,63,0.0000,'+'),(376,37,3,64,0.0000,'+'),(377,37,3,65,0.0000,'+'),(378,37,3,66,0.0000,'+'),(379,37,3,67,0.0000,'+'),(380,37,3,68,0.0000,'+'),(381,39,9,69,0.0000,'+'),(382,39,9,70,0.0000,'+'),(383,39,9,71,0.0000,'+'),(384,39,9,72,0.0000,'+'),(385,39,9,73,0.0000,'+'),(386,39,9,74,0.0000,'+'),(387,39,9,75,0.0000,'+'),(388,39,9,76,0.0000,'+'),(389,40,4,77,0.0000,'+'),(390,40,4,78,0.0000,'+'),(391,40,4,79,0.0000,'+'),(392,42,9,80,0.0000,'+'),(393,42,9,81,0.0000,'+'),(394,42,9,82,0.0000,'+'),(395,42,9,83,0.0000,'+'),(396,42,9,84,0.0000,'+');
/*!40000 ALTER TABLE `products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes_download`
--

DROP TABLE IF EXISTS `products_attributes_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL,
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT 0,
  `products_attributes_maxcount` int(2) DEFAULT 0,
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes_download`
--

LOCK TABLES `products_attributes_download` WRITE;
/*!40000 ALTER TABLE `products_attributes_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_attributes_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_description`
--

DROP TABLE IF EXISTS `products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `products_name` varchar(255) NOT NULL DEFAULT '',
  `products_description` text DEFAULT NULL,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT 0,
  `products_seo_description` text DEFAULT NULL,
  `products_seo_keywords` varchar(255) DEFAULT NULL,
  `products_seo_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `products_name` (`products_name`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_description`
--

LOCK TABLES `products_description` WRITE;
/*!40000 ALTER TABLE `products_description` DISABLE KEYS */;
INSERT INTO `products_description` VALUES (1,1,'Talenan Kayu Jati','Talenan jati solid dengan alur penampung cairan. Dipoles alami tanpa pewarna.',NULL,0,NULL,NULL,NULL),(1,2,'Talenan Kayu Jati','Talenan jati solid dengan alur penampung cairan. Dipoles alami tanpa pewarna.',NULL,60,NULL,NULL,NULL),(2,1,'Gelas Kaca Bening','Gelas kaca bening bebas timbal, set isi enam, ideal untuk minuman dingin maupun panas.',NULL,0,NULL,NULL,NULL),(2,2,'Gelas Kaca Bening','Gelas kaca bening bebas timbal, set isi enam, ideal untuk minuman dingin maupun panas.',NULL,27,NULL,NULL,NULL),(3,1,'Mangkuk Sup List Emas','Mangkuk keramik dengan list emas tipis untuk meja makan yang elegan.',NULL,0,NULL,NULL,NULL),(3,2,'Mangkuk Sup List Emas','Mangkuk keramik dengan list emas tipis untuk meja makan yang elegan.',NULL,1,NULL,NULL,NULL),(4,1,'Pisau Chef Baja Jerman','Pisau dapur 20 cm dari baja tahan karat dengan gagang kayu yang nyaman digenggam.',NULL,0,NULL,NULL,NULL),(4,2,'Pisau Chef Baja Jerman','Pisau dapur 20 cm dari baja tahan karat dengan gagang kayu yang nyaman digenggam.',NULL,4,NULL,NULL,NULL),(5,1,'Toples Kaca Tutup Bambu','Toples kedap udara dengan tutup bambu, pas untuk kopi, teh, gula, atau camilan.',NULL,0,NULL,NULL,NULL),(5,2,'Toples Kaca Tutup Bambu','Toples kedap udara dengan tutup bambu, pas untuk kopi, teh, gula, atau camilan.',NULL,1,NULL,NULL,NULL),(6,1,'Wajan Anti Lengket','Wajan granit anti lengket dengan gagang tahan panas. Cocok untuk semua jenis kompor.',NULL,0,NULL,NULL,NULL),(6,2,'Wajan Anti Lengket','Wajan granit anti lengket dengan gagang tahan panas. Cocok untuk semua jenis kompor.',NULL,16,NULL,NULL,NULL),(7,1,'Rak Bumbu Putar','Rak bumbu putar 360 derajat untuk meja dapur, hemat tempat dan mudah dijangkau.',NULL,0,NULL,NULL,NULL),(7,2,'Rak Bumbu Putar','Rak bumbu putar 360 derajat untuk meja dapur, hemat tempat dan mudah dijangkau.',NULL,0,NULL,NULL,NULL),(8,1,'Set Panci Stainless 3 Pcs','Set tiga panci stainless steel dengan tutup kaca. Tahan karat dan mudah dibersihkan.',NULL,0,NULL,NULL,NULL),(8,2,'Set Panci Stainless 3 Pcs','Set tiga panci stainless steel dengan tutup kaca. Tahan karat dan mudah dibersihkan.',NULL,4,NULL,NULL,NULL),(9,1,'Piring Keramik Putih','Piring makan keramik putih gading dengan glasir halus, aman untuk microwave dan dishwasher.',NULL,0,NULL,NULL,NULL),(9,2,'Piring Keramik Putih','Piring makan keramik putih gading dengan glasir halus, aman untuk microwave dan dishwasher.',NULL,0,NULL,NULL,NULL),(10,1,'Vas Keramik Minimalis','Vas keramik bergaya minimalis dengan finishing doff, melengkapi sudut ruang tamu Anda.',NULL,0,NULL,NULL,NULL),(10,2,'Vas Keramik Minimalis','Vas keramik bergaya minimalis dengan finishing doff, melengkapi sudut ruang tamu Anda.',NULL,0,NULL,NULL,NULL),(11,1,'Lilin Aromaterapi Linen','Lilin soya beraroma linen segar dalam wadah kaca, menyala hingga 40 jam.',NULL,0,NULL,NULL,NULL),(11,2,'Lilin Aromaterapi Linen','Lilin soya beraroma linen segar dalam wadah kaca, menyala hingga 40 jam.',NULL,1,NULL,NULL,NULL),(12,1,'Taplak Meja Linen','Taplak meja linen campuran katun dengan tekstur alami dan jahitan rapi.',NULL,0,NULL,NULL,NULL),(12,2,'Taplak Meja Linen','Taplak meja linen campuran katun dengan tekstur alami dan jahitan rapi.',NULL,0,NULL,NULL,NULL),(13,1,'Tong Sampah Injak Stainless','Tong sampah injak berbahan stainless berkualitas dengan tutup slow-close yang menutup pelan tanpa suara. Tersedia ukuran 8, 14, dan 22 liter untuk dapur, kamar mandi, maupun kantor. Buatan Indonesia. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(13,2,'Tong Sampah Injak Stainless','Tong sampah injak berbahan stainless berkualitas dengan tutup slow-close yang menutup pelan tanpa suara. Tersedia ukuran 8, 14, dan 22 liter untuk dapur, kamar mandi, maupun kantor. Buatan Indonesia. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(14,1,'Keset Bulu Lembut Berumbai','Keset berbulu tebal dan lembut dengan motif kotak bertingkat serta rumbai di kedua sisi. Nyaman diinjak dan pas diletakkan di depan kamar mandi, kamar tidur, atau area wastafel. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(14,2,'Keset Bulu Lembut Berumbai','Keset berbulu tebal dan lembut dengan motif kotak bertingkat serta rumbai di kedua sisi. Nyaman diinjak dan pas diletakkan di depan kamar mandi, kamar tidur, atau area wastafel. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(15,1,'Cairan Pembersih Lantai Premium','Cairan pembersih lantai premium dengan lima pilihan aroma: Aura Laut, Hutan Segar, Mentari Pagi, Lembayung Malam, dan Mawar Klasik. Membersihkan lantai secara menyeluruh dan meninggalkan wangi yang menyenangkan di seluruh ruangan.',NULL,0,NULL,NULL,NULL),(15,2,'Cairan Pembersih Lantai Premium','Cairan pembersih lantai premium dengan lima pilihan aroma: Aura Laut, Hutan Segar, Mentari Pagi, Lembayung Malam, dan Mawar Klasik. Membersihkan lantai secara menyeluruh dan meninggalkan wangi yang menyenangkan di seluruh ruangan.',NULL,0,NULL,NULL,NULL),(16,1,'Set Pisau Dapur dengan Blok Kayu Pinus','Set pisau dapur lengkap berisi pisau koki 20 cm, pisau serbaguna 18 cm, dan pisau pelengkap lainnya, dengan gagang kayu dan blok penyimpanan dari kayu pinus yang menjaga dapur tetap rapi.',NULL,0,NULL,NULL,NULL),(16,2,'Set Pisau Dapur dengan Blok Kayu Pinus','Set pisau dapur lengkap berisi pisau koki 20 cm, pisau serbaguna 18 cm, dan pisau pelengkap lainnya, dengan gagang kayu dan blok penyimpanan dari kayu pinus yang menjaga dapur tetap rapi.',NULL,0,NULL,NULL,NULL),(17,1,'Karpet Klasik Motif Biru Berumbai','Karpet bermotif klasik dengan dasar biru lembut berpadu krem dan emas, dilengkapi rumbai di kedua ujung. Memberi sentuhan hangat dan elegan untuk ruang tamu, ruang keluarga, maupun kamar. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(17,2,'Karpet Klasik Motif Biru Berumbai','Karpet bermotif klasik dengan dasar biru lembut berpadu krem dan emas, dilengkapi rumbai di kedua ujung. Memberi sentuhan hangat dan elegan untuk ruang tamu, ruang keluarga, maupun kamar. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(18,1,'Sarung Bantal Premium Mikro Tencel','Sarung bantal premium berbahan mikro tencel dengan motif garis dobby yang halus dan lembut seperti sutera. Hadir dalam warna-warna lembut yang mudah dipadukan dengan seprai dan dekorasi kamar. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(18,2,'Sarung Bantal Premium Mikro Tencel','Sarung bantal premium berbahan mikro tencel dengan motif garis dobby yang halus dan lembut seperti sutera. Hadir dalam warna-warna lembut yang mudah dipadukan dengan seprai dan dekorasi kamar. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(19,1,'Handuk Premium Anti-Bakteri 50x100 cm','Handuk berukuran 50 x 100 cm dengan bobot 200 gsm yang lembut dan nyaman di kulit. Menyerap air dengan baik, dilengkapi perlindungan anti-bakteri, dan tersedia dalam berbagai pilihan warna. Buatan Indonesia. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(19,2,'Handuk Premium Anti-Bakteri 50x100 cm','Handuk berukuran 50 x 100 cm dengan bobot 200 gsm yang lembut dan nyaman di kulit. Menyerap air dengan baik, dilengkapi perlindungan anti-bakteri, dan tersedia dalam berbagai pilihan warna. Buatan Indonesia. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(20,1,'Botol Minum Stainless \"Water is Life\"','Botol minum stainless dengan tutup flip dan sedotan, bodi berlapis warna pastel yang nyaman digenggam. Teman minum sehari-hari untuk kantor, sekolah, maupun olahraga. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(20,2,'Botol Minum Stainless \"Water is Life\"','Botol minum stainless dengan tutup flip dan sedotan, bodi berlapis warna pastel yang nyaman digenggam. Teman minum sehari-hari untuk kantor, sekolah, maupun olahraga. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,1,NULL,NULL,NULL),(21,1,'Kotak Penyimpanan Berpenutup','Kotak penyimpanan bertutup dengan gagang di kedua sisi. Dapat ditumpuk sehingga hemat tempat, cocok untuk merapikan dapur, lemari, dan rak. Harga per unit. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(21,2,'Kotak Penyimpanan Berpenutup','Kotak penyimpanan bertutup dengan gagang di kedua sisi. Dapat ditumpuk sehingga hemat tempat, cocok untuk merapikan dapur, lemari, dan rak. Harga per unit. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(22,1,'Set Sapu dan Tong Sampah Injak Stainless','Paket hemat berisi tong sampah injak stainless dengan tutup slow-close dan sapu pengki berbulu halus serta tebal. Pilih ukuran tong 8, 14, atau 22 liter. Buatan Indonesia. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(22,2,'Set Sapu dan Tong Sampah Injak Stainless','Paket hemat berisi tong sampah injak stainless dengan tutup slow-close dan sapu pengki berbulu halus serta tebal. Pilih ukuran tong 8, 14, atau 22 liter. Buatan Indonesia. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(23,1,'Set Sapu dan Pengki','Set sapu dan pengki dengan bulu halus dan tebal serta sisir penyaring untuk membersihkan bulu sapu. Mudah dirangkai, anti karat, dan hemat tempat saat disimpan. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(23,2,'Set Sapu dan Pengki','Set sapu dan pengki dengan bulu halus dan tebal serta sisir penyaring untuk membersihkan bulu sapu. Mudah dirangkai, anti karat, dan hemat tempat saat disimpan. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(24,1,'Tempat Makan Premium Set 3 Pcs','Set tiga tempat makan dalam tiga ukuran yang dapat disusun, dengan penutup berkunci rapat. Aman untuk microwave dan berbahan food grade, praktis untuk bekal maupun menyimpan sisa makanan. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(24,2,'Tempat Makan Premium Set 3 Pcs','Set tiga tempat makan dalam tiga ukuran yang dapat disusun, dengan penutup berkunci rapat. Aman untuk microwave dan berbahan food grade, praktis untuk bekal maupun menyimpan sisa makanan. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(25,1,'Spin Mop dengan Ember','Set pel putar lengkap dengan ember peras dan gagang stainless. Membantu membersihkan lantai lebih cepat dan efektif tanpa perlu memeras dengan tangan. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(25,2,'Spin Mop dengan Ember','Set pel putar lengkap dengan ember peras dan gagang stainless. Membantu membersihkan lantai lebih cepat dan efektif tanpa perlu memeras dengan tangan. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(26,1,'Earthia Care Botanical Lip Tint','Lip tint dengan ekstrak mawar dan pigmen gemstone untuk warna bibir yang segar dan nyaman dipakai.',NULL,0,NULL,NULL,NULL),(26,2,'Earthia Care Botanical Lip Tint','Lip tint dengan ekstrak mawar dan pigmen gemstone untuk warna bibir yang segar dan nyaman dipakai.',NULL,1,NULL,NULL,NULL),(27,1,'Earthia Care Botanical Brows Eyebrow Pencil','Pensil alis presisi dengan sikat spoolie. Garis menyerupai alis alami dengan pilihan warna botanical gemstone untuk pemakaian harian.',NULL,0,NULL,NULL,NULL),(27,2,'Earthia Care Botanical Brows Eyebrow Pencil','Pensil alis presisi dengan sikat spoolie. Garis menyerupai alis alami dengan pilihan warna botanical gemstone untuk pemakaian harian.',NULL,0,NULL,NULL,NULL),(28,1,'Earthia Care Anti-Chute Hair Follicle Fortifying Conditioner 200 ml','Kondisioner anti rontok dengan ekstrak mawar dan kuarsa untuk rambut yang lebih kuat dan mudah diatur. Isi 200 ml.',NULL,0,NULL,NULL,NULL),(28,2,'Earthia Care Anti-Chute Hair Follicle Fortifying Conditioner 200 ml','Kondisioner anti rontok dengan ekstrak mawar dan kuarsa untuk rambut yang lebih kuat dan mudah diatur. Isi 200 ml.',NULL,4,NULL,NULL,NULL),(29,1,'Earthia Care Botanical Lash & Brow Elixir 100 ml','Elixir spray dan roll-on untuk bulu mata dan alis dengan infusi segar, pigmen gemstone, dan ekstrak mawar. Isi 100 ml.',NULL,0,NULL,NULL,NULL),(29,2,'Earthia Care Botanical Lash & Brow Elixir 100 ml','Elixir spray dan roll-on untuk bulu mata dan alis dengan infusi segar, pigmen gemstone, dan ekstrak mawar. Isi 100 ml.',NULL,0,NULL,NULL,NULL),(30,1,'Earthia Care Botanical Velvet Liquid Lipstick Set','Set enam lipstik cair velvet dengan ekstrak mawar dan pigmen gemstone dalam kotak marmer hijau. Hasil matte lembut dengan warna yang kaya.',NULL,0,NULL,NULL,NULL),(30,2,'Earthia Care Botanical Velvet Liquid Lipstick Set','Set enam lipstik cair velvet dengan ekstrak mawar dan pigmen gemstone dalam kotak marmer hijau. Hasil matte lembut dengan warna yang kaya.',NULL,1,NULL,NULL,NULL),(31,1,'Earthia Care Powerstay Foundation 24H','Foundation ringan dengan formula botanical ink yang bertahan seharian, diperkaya pigmen gemstone dan perawatan botani.',NULL,0,NULL,NULL,NULL),(31,2,'Earthia Care Powerstay Foundation 24H','Foundation ringan dengan formula botanical ink yang bertahan seharian, diperkaya pigmen gemstone dan perawatan botani.',NULL,0,NULL,NULL,NULL),(32,1,'Earthia Care Botanical Eau de Parfum','Eau de parfum botani yang tahan sepanjang hari dalam tiga aroma: Morning Bloom (rose & quartz), Sunshine Fresh (sunstone & bergamot), dan Night Grace (amethyst & lavender).',NULL,0,NULL,NULL,NULL),(32,2,'Earthia Care Botanical Eau de Parfum','Eau de parfum botani yang tahan sepanjang hari dalam tiga aroma: Morning Bloom (rose & quartz), Sunshine Fresh (sunstone & bergamot), dan Night Grace (amethyst & lavender).',NULL,0,NULL,NULL,NULL),(33,1,'Earthia Care Botanical Lash Primer','Lash primer dengan ekstrak mawar dan gemstone untuk bulu mata yang tampak lebih lentik dan terawat.',NULL,0,NULL,NULL,NULL),(33,2,'Earthia Care Botanical Lash Primer','Lash primer dengan ekstrak mawar dan gemstone untuk bulu mata yang tampak lebih lentik dan terawat.',NULL,0,NULL,NULL,NULL),(34,1,'Earthia Care Aloe Vera Everyday Shampoo 140 ml','Sampo harian dengan ekstrak lidah buaya untuk perawatan rambut lebat, halus, dan lembut. Netto 140 ml.',NULL,0,NULL,NULL,NULL),(34,2,'Earthia Care Aloe Vera Everyday Shampoo 140 ml','Sampo harian dengan ekstrak lidah buaya untuk perawatan rambut lebat, halus, dan lembut. Netto 140 ml.',NULL,0,NULL,NULL,NULL),(35,1,'Earthia Care Hair Care Series','Seri perawatan rambut: Repair & Nourish Hair Mask untuk rambut rusak dan bercabang, Scalp & Strength Elixir untuk kesuburan dan kekuatan rambut, serta Anti-Breakage Balm untuk rambut rontok dan patah.',NULL,0,NULL,NULL,NULL),(35,2,'Earthia Care Hair Care Series','Seri perawatan rambut: Repair & Nourish Hair Mask untuk rambut rusak dan bercabang, Scalp & Strength Elixir untuk kesuburan dan kekuatan rambut, serta Anti-Breakage Balm untuk rambut rontok dan patah.',NULL,0,NULL,NULL,NULL),(36,1,'Earthia Care Botanical Eyeshadow Quad','Palet eyeshadow empat warna dengan pigmen gemstone dan perawatan botani. Kemasan bernuansa tembaga yang elegan, tersedia dalam beberapa palet warna.',NULL,0,NULL,NULL,NULL),(36,2,'Earthia Care Botanical Eyeshadow Quad','Palet eyeshadow empat warna dengan pigmen gemstone dan perawatan botani. Kemasan bernuansa tembaga yang elegan, tersedia dalam beberapa palet warna.',NULL,0,NULL,NULL,NULL),(37,1,'Earthia Care Creme Hair Colour','Pewarna rambut krim dengan ekstrak buah super dan vitamin rambut dalam delapan pilihan warna.',NULL,0,NULL,NULL,NULL),(37,2,'Earthia Care Creme Hair Colour','Pewarna rambut krim dengan ekstrak buah super dan vitamin rambut dalam delapan pilihan warna.',NULL,0,NULL,NULL,NULL),(38,1,'Earthia Care Brightening Body Scrub 200 g','Body scrub pencerah dengan infusi sunstone dan mawar serta pigmen gemstone alami dan ekstrak mawar botani. Isi 200 g.',NULL,0,NULL,NULL,NULL),(38,2,'Earthia Care Brightening Body Scrub 200 g','Body scrub pencerah dengan infusi sunstone dan mawar serta pigmen gemstone alami dan ekstrak mawar botani. Isi 200 g.',NULL,0,NULL,NULL,NULL),(39,1,'Earthia Care Botanical Dew Roll-On Deodorant','Deodoran roll-on dengan ekstrak super food dalam beberapa varian: Brightening Happy Shave, Silk Touch, Hijab Fresh, Pearl & Beauty, Black & White, Super Superfood, Extra Brightening, dan Dry Comfort.',NULL,0,NULL,NULL,NULL),(39,2,'Earthia Care Botanical Dew Roll-On Deodorant','Deodoran roll-on dengan ekstrak super food dalam beberapa varian: Brightening Happy Shave, Silk Touch, Hijab Fresh, Pearl & Beauty, Black & White, Super Superfood, Extra Brightening, dan Dry Comfort.',NULL,2,NULL,NULL,NULL),(40,1,'Earthia Care Botanical White Brightening Body Wash','Sabun mandi pencerah dengan rice milk dan telah diuji dermatologis, tersedia dalam tiga aroma: Organic Aloe Vera, Sparkling Magnolia, dan Pure Cotton Flower.',NULL,0,NULL,NULL,NULL),(40,2,'Earthia Care Botanical White Brightening Body Wash','Sabun mandi pencerah dengan rice milk dan telah diuji dermatologis, tersedia dalam tiga aroma: Organic Aloe Vera, Sparkling Magnolia, dan Pure Cotton Flower.',NULL,0,NULL,NULL,NULL),(41,1,'Earthia Care Botanical Brightening Body Lotion','Body lotion yang diformulasikan untuk mencerahkan dan melembapkan kulit dengan shea butter, vitamin C, minyak jojoba, lidah buaya, dan peptida nabati. Cruelty-free dan paraben-free.',NULL,0,NULL,NULL,NULL),(41,2,'Earthia Care Botanical Brightening Body Lotion','Body lotion yang diformulasikan untuk mencerahkan dan melembapkan kulit dengan shea butter, vitamin C, minyak jojoba, lidah buaya, dan peptida nabati. Cruelty-free dan paraben-free.',NULL,0,NULL,NULL,NULL),(42,1,'Earthia Care Hair Vitamins Premium Collection (isi 6)','Vitamin rambut dalam kapsul isi 6 untuk membuat rambut lebih lembut dan membantu mencegah kerusakan.',NULL,0,NULL,NULL,NULL),(42,2,'Earthia Care Hair Vitamins Premium Collection (isi 6)','Vitamin rambut dalam kapsul isi 6 untuk membuat rambut lebih lembut dan membantu mencegah kerusakan.',NULL,1,NULL,NULL,NULL),(43,2,'Talenan Kayu Jati','Talenan jati solid dengan alur penampung cairan. Dipoles alami tanpa pewarna.',NULL,0,NULL,NULL,NULL),(44,2,'Gelas Kaca Bening','Gelas kaca bening bebas timbal, set isi enam, ideal untuk minuman dingin maupun panas.',NULL,0,NULL,NULL,NULL),(45,2,'Mangkuk Sup List Emas','Mangkuk keramik dengan list emas tipis untuk meja makan yang elegan.',NULL,0,NULL,NULL,NULL),(46,2,'Pisau Chef Baja Jerman','Pisau dapur 20 cm dari baja tahan karat dengan gagang kayu yang nyaman digenggam.',NULL,0,NULL,NULL,NULL),(47,2,'Toples Kaca Tutup Bambu','Toples kedap udara dengan tutup bambu, pas untuk kopi, teh, gula, atau camilan.',NULL,0,NULL,NULL,NULL),(48,2,'Wajan Anti Lengket','Wajan granit anti lengket dengan gagang tahan panas. Cocok untuk semua jenis kompor.',NULL,0,NULL,NULL,NULL),(49,2,'Rak Bumbu Putar','Rak bumbu putar 360 derajat untuk meja dapur, hemat tempat dan mudah dijangkau.',NULL,0,NULL,NULL,NULL),(50,2,'Set Panci Stainless 3 Pcs','Set tiga panci stainless steel dengan tutup kaca. Tahan karat dan mudah dibersihkan.',NULL,0,NULL,NULL,NULL),(51,2,'Piring Keramik Putih','Piring makan keramik putih gading dengan glasir halus, aman untuk microwave dan dishwasher.',NULL,0,NULL,NULL,NULL),(52,2,'Vas Keramik Minimalis','Vas keramik bergaya minimalis dengan finishing doff, melengkapi sudut ruang tamu Anda.',NULL,0,NULL,NULL,NULL),(53,2,'Lilin Aromaterapi Linen','Lilin soya beraroma linen segar dalam wadah kaca, menyala hingga 40 jam.',NULL,0,NULL,NULL,NULL),(54,2,'Taplak Meja Linen','Taplak meja linen campuran katun dengan tekstur alami dan jahitan rapi.',NULL,0,NULL,NULL,NULL),(55,2,'Tong Sampah Injak Stainless','Tong sampah injak berbahan stainless berkualitas dengan tutup slow-close yang menutup pelan tanpa suara. Tersedia ukuran 8, 14, dan 22 liter untuk dapur, kamar mandi, maupun kantor. Buatan Indonesia. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(56,2,'Keset Bulu Lembut Berumbai','Keset berbulu tebal dan lembut dengan motif kotak bertingkat serta rumbai di kedua sisi. Nyaman diinjak dan pas diletakkan di depan kamar mandi, kamar tidur, atau area wastafel. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(57,2,'Cairan Pembersih Lantai Premium','Cairan pembersih lantai premium dengan lima pilihan aroma: Aura Laut, Hutan Segar, Mentari Pagi, Lembayung Malam, dan Mawar Klasik. Membersihkan lantai secara menyeluruh dan meninggalkan wangi yang menyenangkan di seluruh ruangan.',NULL,0,NULL,NULL,NULL),(58,2,'Set Pisau Dapur dengan Blok Kayu Pinus','Set pisau dapur lengkap berisi pisau koki 20 cm, pisau serbaguna 18 cm, dan pisau pelengkap lainnya, dengan gagang kayu dan blok penyimpanan dari kayu pinus yang menjaga dapur tetap rapi.',NULL,0,NULL,NULL,NULL),(59,2,'Karpet Klasik Motif Biru Berumbai','Karpet bermotif klasik dengan dasar biru lembut berpadu krem dan emas, dilengkapi rumbai di kedua ujung. Memberi sentuhan hangat dan elegan untuk ruang tamu, ruang keluarga, maupun kamar. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(60,2,'Sarung Bantal Premium Mikro Tencel','Sarung bantal premium berbahan mikro tencel dengan motif garis dobby yang halus dan lembut seperti sutera. Hadir dalam warna-warna lembut yang mudah dipadukan dengan seprai dan dekorasi kamar. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(61,2,'Handuk Premium Anti-Bakteri 50x100 cm','Handuk berukuran 50 x 100 cm dengan bobot 200 gsm yang lembut dan nyaman di kulit. Menyerap air dengan baik, dilengkapi perlindungan anti-bakteri, dan tersedia dalam berbagai pilihan warna. Buatan Indonesia. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(62,2,'Botol Minum Stainless \"Water is Life\"','Botol minum stainless dengan tutup flip dan sedotan, bodi berlapis warna pastel yang nyaman digenggam. Teman minum sehari-hari untuk kantor, sekolah, maupun olahraga. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(63,2,'Kotak Penyimpanan Berpenutup','Kotak penyimpanan bertutup dengan gagang di kedua sisi. Dapat ditumpuk sehingga hemat tempat, cocok untuk merapikan dapur, lemari, dan rak. Harga per unit. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(64,2,'Set Sapu dan Tong Sampah Injak Stainless','Paket hemat berisi tong sampah injak stainless dengan tutup slow-close dan sapu pengki berbulu halus serta tebal. Pilih ukuran tong 8, 14, atau 22 liter. Buatan Indonesia. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(65,2,'Set Sapu dan Pengki','Set sapu dan pengki dengan bulu halus dan tebal serta sisir penyaring untuk membersihkan bulu sapu. Mudah dirangkai, anti karat, dan hemat tempat saat disimpan. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(66,2,'Tempat Makan Premium Set 3 Pcs','Set tiga tempat makan dalam tiga ukuran yang dapat disusun, dengan penutup berkunci rapat. Aman untuk microwave dan berbahan food grade, praktis untuk bekal maupun menyimpan sisa makanan. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(67,2,'Spin Mop dengan Ember','Set pel putar lengkap dengan ember peras dan gagang stainless. Membantu membersihkan lantai lebih cepat dan efektif tanpa perlu memeras dengan tangan. Warna asli produk dapat sedikit berbeda dari foto karena pencahayaan dan pengaturan layar.',NULL,0,NULL,NULL,NULL),(68,2,'Earthia Care Botanical Lip Tint','Lip tint dengan ekstrak mawar dan pigmen gemstone untuk warna bibir yang segar dan nyaman dipakai.',NULL,0,NULL,NULL,NULL),(69,2,'Earthia Care Botanical Brows Eyebrow Pencil','Pensil alis presisi dengan sikat spoolie. Garis menyerupai alis alami dengan pilihan warna botanical gemstone untuk pemakaian harian.',NULL,0,NULL,NULL,NULL),(70,2,'Earthia Care Anti-Chute Hair Follicle Fortifying Conditioner 200 ml','Kondisioner anti rontok dengan ekstrak mawar dan kuarsa untuk rambut yang lebih kuat dan mudah diatur. Isi 200 ml.',NULL,0,NULL,NULL,NULL),(71,2,'Earthia Care Botanical Lash & Brow Elixir 100 ml','Elixir spray dan roll-on untuk bulu mata dan alis dengan infusi segar, pigmen gemstone, dan ekstrak mawar. Isi 100 ml.',NULL,0,NULL,NULL,NULL),(72,2,'Earthia Care Botanical Velvet Liquid Lipstick Set','Set enam lipstik cair velvet dengan ekstrak mawar dan pigmen gemstone dalam kotak marmer hijau. Hasil matte lembut dengan warna yang kaya.',NULL,0,NULL,NULL,NULL),(73,2,'Earthia Care Powerstay Foundation 24H','Foundation ringan dengan formula botanical ink yang bertahan seharian, diperkaya pigmen gemstone dan perawatan botani.',NULL,0,NULL,NULL,NULL),(74,2,'Earthia Care Botanical Eau de Parfum','Eau de parfum botani yang tahan sepanjang hari dalam tiga aroma: Morning Bloom (rose & quartz), Sunshine Fresh (sunstone & bergamot), dan Night Grace (amethyst & lavender).',NULL,0,NULL,NULL,NULL),(75,2,'Earthia Care Botanical Lash Primer','Lash primer dengan ekstrak mawar dan gemstone untuk bulu mata yang tampak lebih lentik dan terawat.',NULL,0,NULL,NULL,NULL),(76,2,'Earthia Care Aloe Vera Everyday Shampoo 140 ml','Sampo harian dengan ekstrak lidah buaya untuk perawatan rambut lebat, halus, dan lembut. Netto 140 ml.',NULL,0,NULL,NULL,NULL),(77,2,'Earthia Care Hair Care Series','Seri perawatan rambut: Repair & Nourish Hair Mask untuk rambut rusak dan bercabang, Scalp & Strength Elixir untuk kesuburan dan kekuatan rambut, serta Anti-Breakage Balm untuk rambut rontok dan patah.',NULL,0,NULL,NULL,NULL),(78,2,'Earthia Care Botanical Eyeshadow Quad','Palet eyeshadow empat warna dengan pigmen gemstone dan perawatan botani. Kemasan bernuansa tembaga yang elegan, tersedia dalam beberapa palet warna.',NULL,0,NULL,NULL,NULL),(79,2,'Earthia Care Creme Hair Colour','Pewarna rambut krim dengan ekstrak buah super dan vitamin rambut dalam delapan pilihan warna.',NULL,0,NULL,NULL,NULL),(80,2,'Earthia Care Brightening Body Scrub 200 g','Body scrub pencerah dengan infusi sunstone dan mawar serta pigmen gemstone alami dan ekstrak mawar botani. Isi 200 g.',NULL,0,NULL,NULL,NULL),(81,2,'Earthia Care Botanical Dew Roll-On Deodorant','Deodoran roll-on dengan ekstrak super food dalam beberapa varian: Brightening Happy Shave, Silk Touch, Hijab Fresh, Pearl & Beauty, Black & White, Super Superfood, Extra Brightening, dan Dry Comfort.',NULL,0,NULL,NULL,NULL),(82,2,'Earthia Care Botanical White Brightening Body Wash','Sabun mandi pencerah dengan rice milk dan telah diuji dermatologis, tersedia dalam tiga aroma: Organic Aloe Vera, Sparkling Magnolia, dan Pure Cotton Flower.',NULL,0,NULL,NULL,NULL),(83,2,'Earthia Care Botanical Brightening Body Lotion','Body lotion yang diformulasikan untuk mencerahkan dan melembapkan kulit dengan shea butter, vitamin C, minyak jojoba, lidah buaya, dan peptida nabati. Cruelty-free dan paraben-free.',NULL,0,NULL,NULL,NULL),(84,2,'Earthia Care Hair Vitamins Premium Collection (isi 6)','Vitamin rambut dalam kapsul isi 6 untuk membuat rambut lebih lembut dan membantu mencegah kerusakan.',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_images`
--

DROP TABLE IF EXISTS `products_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `htmlcontent` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_images_prodid` (`products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_images`
--

LOCK TABLES `products_images` WRITE;
/*!40000 ALTER TABLE `products_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_notifications`
--

DROP TABLE IF EXISTS `products_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_notifications` (
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_notifications`
--

LOCK TABLES `products_notifications` WRITE;
/*!40000 ALTER TABLE `products_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options`
--

DROP TABLE IF EXISTS `products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `products_options_name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`products_options_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options`
--

LOCK TABLES `products_options` WRITE;
/*!40000 ALTER TABLE `products_options` DISABLE KEYS */;
INSERT INTO `products_options` VALUES (1,1,'Ukuran',0),(1,2,'Ukuran',0),(2,1,'Isi',0),(2,2,'Isi',0),(3,1,'Warna',0),(3,2,'Warna',0),(4,1,'Aroma',0),(4,2,'Aroma',0),(5,1,'Ukuran Tong',0),(5,2,'Ukuran Tong',0),(6,1,'Shade',0),(6,2,'Shade',0),(7,1,'Produk',0),(7,2,'Produk',0),(8,1,'Palet',0),(8,2,'Palet',0),(9,1,'Varian',0),(9,2,'Varian',0);
/*!40000 ALTER TABLE `products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values`
--

DROP TABLE IF EXISTS `products_options_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `products_options_values_name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`products_options_values_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_values`
--

LOCK TABLES `products_options_values` WRITE;
/*!40000 ALTER TABLE `products_options_values` DISABLE KEYS */;
INSERT INTO `products_options_values` VALUES (1,1,'Sedang',0),(1,2,'Sedang',0),(2,1,'Besar',0),(2,2,'Besar',0),(3,1,'500 ml',0),(3,2,'500 ml',0),(4,1,'1000 ml',0),(4,2,'1000 ml',0),(5,1,'24 cm',0),(5,2,'24 cm',0),(6,1,'28 cm',0),(6,2,'28 cm',0),(7,1,'Set 4',0),(7,2,'Set 4',0),(8,1,'Set 6',0),(8,2,'Set 6',0),(9,1,'Krem',0),(9,2,'Krem',0),(10,1,'Terakota',0),(10,2,'Terakota',0),(11,1,'140 x 180 cm',0),(11,2,'140 x 180 cm',0),(12,1,'140 x 240 cm',0),(12,2,'140 x 240 cm',0),(13,1,'8 Liter',0),(13,2,'8 Liter',0),(14,1,'14 Liter',0),(14,2,'14 Liter',0),(15,1,'22 Liter',0),(15,2,'22 Liter',0),(16,1,'Abu Hijau Muda',0),(16,2,'Abu Hijau Muda',0),(17,1,'Biru Dusty',0),(17,2,'Biru Dusty',0),(18,1,'Charcoal',0),(18,2,'Charcoal',0),(19,1,'Aura Laut',0),(19,2,'Aura Laut',0),(20,1,'Hutan Segar',0),(20,2,'Hutan Segar',0),(21,1,'Mentari Pagi',0),(21,2,'Mentari Pagi',0),(22,1,'Lembayung Malam',0),(22,2,'Lembayung Malam',0),(23,1,'Mawar Klasik',0),(23,2,'Mawar Klasik',0),(24,1,'100 x 150 cm',0),(24,2,'100 x 150 cm',0),(25,1,'160 x 230 cm',0),(25,2,'160 x 230 cm',0),(26,1,'200 x 300 cm',0),(26,2,'200 x 300 cm',0),(27,1,'Biru Klasik',0),(27,2,'Biru Klasik',0),(28,1,'Mint Premium',0),(28,2,'Mint Premium',0),(29,1,'Mauve Dusty',0),(29,2,'Mauve Dusty',0),(30,1,'Biru Navy',0),(30,2,'Biru Navy',0),(31,1,'Putih',0),(31,2,'Putih',0),(32,1,'Abu-abu',0),(32,2,'Abu-abu',0),(33,1,'Pink Blush',0),(33,2,'Pink Blush',0),(34,1,'Sage Green',0),(34,2,'Sage Green',0),(35,1,'Hitam',0),(35,2,'Hitam',0),(36,1,'Kuning',0),(36,2,'Kuning',0),(37,1,'Oranye',0),(37,2,'Oranye',0),(38,1,'Hijau Teal',0),(38,2,'Hijau Teal',0),(39,1,'Abu Muda',0),(39,2,'Abu Muda',0),(40,1,'Hijau Mint',0),(40,2,'Hijau Mint',0),(41,1,'Rose Wine',0),(41,2,'Rose Wine',0),(42,1,'Coral Bloom',0),(42,2,'Coral Bloom',0),(43,1,'Berry Plum',0),(43,2,'Berry Plum',0),(44,1,'Nude Petal',0),(44,2,'Nude Petal',0),(45,1,'Cherry Red',0),(45,2,'Cherry Red',0),(46,1,'Dark Brown',0),(46,2,'Dark Brown',0),(47,1,'Soft Brown',0),(47,2,'Soft Brown',0),(48,1,'Plum Brown',0),(48,2,'Plum Brown',0),(49,1,'Light',0),(49,2,'Light',0),(50,1,'Natural',0),(50,2,'Natural',0),(51,1,'Sand',0),(51,2,'Sand',0),(52,1,'Tan',0),(52,2,'Tan',0),(53,1,'Morning Bloom',0),(53,2,'Morning Bloom',0),(54,1,'Sunshine Fresh',0),(54,2,'Sunshine Fresh',0),(55,1,'Night Grace',0),(55,2,'Night Grace',0),(56,1,'Repair & Nourish Hair Mask',0),(56,2,'Repair & Nourish Hair Mask',0),(57,1,'Scalp & Strength Elixir',0),(57,2,'Scalp & Strength Elixir',0),(58,1,'Anti-Breakage Balm',0),(58,2,'Anti-Breakage Balm',0),(59,1,'Earth Brown',0),(59,2,'Earth Brown',0),(60,1,'Rose Blush',0),(60,2,'Rose Blush',0),(61,1,'Mauve Dusk',0),(61,2,'Mauve Dusk',0),(62,1,'Oat Milk Blonde',0),(62,2,'Oat Milk Blonde',0),(63,1,'Moonlight Indigo',0),(63,2,'Moonlight Indigo',0),(64,1,'Forest Bark',0),(64,2,'Forest Bark',0),(65,1,'Terracotta Copper',0),(65,2,'Terracotta Copper',0),(66,1,'Walnut Haze',0),(66,2,'Walnut Haze',0),(67,1,'Wild Berries',0),(67,2,'Wild Berries',0),(68,1,'Harvest Crimson',0),(68,2,'Harvest Crimson',0),(69,1,'Happy Shave',0),(69,2,'Happy Shave',0),(70,1,'Silk Touch',0),(70,2,'Silk Touch',0),(71,1,'Hijab Fresh',0),(71,2,'Hijab Fresh',0),(72,1,'Pearl & Beauty',0),(72,2,'Pearl & Beauty',0),(73,1,'Black & White',0),(73,2,'Black & White',0),(74,1,'Super Superfood',0),(74,2,'Super Superfood',0),(75,1,'Extra Brightening',0),(75,2,'Extra Brightening',0),(76,1,'Dry Comfort',0),(76,2,'Dry Comfort',0),(77,1,'Organic Aloe Vera',0),(77,2,'Organic Aloe Vera',0),(78,1,'Sparkling Magnolia',0),(78,2,'Sparkling Magnolia',0),(79,1,'Pure Cotton Flower',0),(79,2,'Pure Cotton Flower',0),(80,1,'Shiny Black',0),(80,2,'Shiny Black',0),(81,1,'Hair Vitality',0),(81,2,'Hair Vitality',0),(82,1,'Hair Treatment',0),(82,2,'Hair Treatment',0),(83,1,'Nutri Color',0),(83,2,'Nutri Color',0),(84,1,'Smooth & Shiny',0),(84,2,'Smooth & Shiny',0);
/*!40000 ALTER TABLE `products_options_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values_to_products_options`
--

DROP TABLE IF EXISTS `products_options_values_to_products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL,
  `products_options_values_id` int(11) NOT NULL,
  PRIMARY KEY (`products_options_values_to_products_options_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_values_to_products_options`
--

LOCK TABLES `products_options_values_to_products_options` WRITE;
/*!40000 ALTER TABLE `products_options_values_to_products_options` DISABLE KEYS */;
INSERT INTO `products_options_values_to_products_options` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,2,7),(8,2,8),(9,3,9),(10,3,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,3,16),(17,3,17),(18,3,18),(19,4,19),(20,4,20),(21,4,21),(22,4,22),(23,4,23),(24,1,24),(25,1,25),(26,1,26),(27,3,27),(28,3,28),(29,3,29),(30,3,30),(31,3,31),(32,3,32),(33,3,33),(34,3,34),(35,3,35),(36,3,36),(37,3,37),(38,3,38),(39,5,13),(40,5,14),(41,5,15),(42,3,39),(43,3,40),(44,6,41),(45,6,42),(46,6,43),(47,6,44),(48,6,45),(49,3,46),(50,3,47),(51,3,48),(52,6,49),(53,6,50),(54,6,51),(55,6,52),(56,4,53),(57,4,54),(58,4,55),(59,7,56),(60,7,57),(61,7,58),(62,8,59),(63,8,60),(64,8,61),(65,3,62),(66,3,59),(67,3,63),(68,3,64),(69,3,65),(70,3,66),(71,3,67),(72,3,68),(73,9,69),(74,9,70),(75,9,71),(76,9,72),(77,9,73),(78,9,74),(79,9,75),(80,9,76),(81,4,77),(82,4,78),(83,4,79),(84,9,80),(85,9,81),(86,9,82),(87,9,83),(88,9,84);
/*!40000 ALTER TABLE `products_options_values_to_products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_to_categories`
--

DROP TABLE IF EXISTS `products_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_to_categories` (
  `products_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`products_id`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_to_categories`
--

LOCK TABLES `products_to_categories` WRITE;
/*!40000 ALTER TABLE `products_to_categories` DISABLE KEYS */;
INSERT INTO `products_to_categories` VALUES (1,1),(2,3),(3,3),(4,1),(5,2),(6,1),(7,2),(8,1),(9,3),(10,4),(11,4),(12,5),(13,6),(14,5),(15,6),(16,1),(17,5),(18,5),(19,5),(20,3),(21,2),(22,6),(23,6),(24,2),(25,6),(26,7),(27,7),(28,7),(29,7),(30,7),(31,7),(32,7),(33,7),(34,7),(35,7),(36,7),(37,7),(38,7),(39,7),(40,7),(41,7),(42,7);
/*!40000 ALTER TABLE `products_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(255) NOT NULL,
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_status` tinyint(1) NOT NULL DEFAULT 0,
  `reviews_read` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`reviews_id`),
  KEY `idx_reviews_products_id` (`products_id`),
  KEY `idx_reviews_customers_id` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_description`
--

DROP TABLE IF EXISTS `reviews_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_description`
--

LOCK TABLES `reviews_description` WRITE;
/*!40000 ALTER TABLE `reviews_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_directory_whitelist`
--

DROP TABLE IF EXISTS `sec_directory_whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_directory_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directory` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_directory_whitelist`
--

LOCK TABLES `sec_directory_whitelist` WRITE;
/*!40000 ALTER TABLE `sec_directory_whitelist` DISABLE KEYS */;
INSERT INTO `sec_directory_whitelist` VALUES (1,'images'),(2,'includes/work'),(3,'pub');
/*!40000 ALTER TABLE `sec_directory_whitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `specials_new_products_price` decimal(15,4) NOT NULL,
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` datetime DEFAULT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`specials_id`),
  KEY `idx_specials_products_id` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specials`
--

LOCK TABLES `specials` WRITE;
/*!40000 ALTER TABLE `specials` DISABLE KEYS */;
INSERT INTO `specials` VALUES (1,6,159000.0000,'2026-10-16 23:22:40',NULL,'2026-12-31 23:59:59',NULL,1),(2,8,399000.0000,'2026-10-16 23:22:40',NULL,'2026-12-31 23:59:59',NULL,1),(3,11,99000.0000,'2026-10-16 23:22:40',NULL,'2026-12-31 23:59:59',NULL,1),(4,16,219000.0000,'2026-10-16 23:22:40',NULL,'2026-12-31 23:59:59',NULL,1),(5,30,159000.0000,'2026-10-16 23:22:40',NULL,'2026-12-31 23:59:59',NULL,1),(6,35,75000.0000,'2026-10-16 23:22:40',NULL,'2026-12-31 23:59:59',NULL,1);
/*!40000 ALTER TABLE `specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL,
  `tax_class_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (1,'Taxable Goods','The following types of products are included non-food, services, etc','2026-10-16 20:46:41','2026-10-16 20:46:41');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_priority` int(5) DEFAULT 1,
  `tax_rate` decimal(7,4) NOT NULL,
  `tax_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_rates_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
INSERT INTO `tax_rates` VALUES (1,1,1,1,7.0000,'FL TAX 7.0%','2026-10-16 20:46:41','2026-10-16 20:46:41');
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
  `testimonials_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT 0,
  `customers_name` varchar(255) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `testimonials_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_description`
--

DROP TABLE IF EXISTS `testimonials_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials_description` (
  `testimonials_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `testimonials_text` text NOT NULL,
  PRIMARY KEY (`testimonials_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_description`
--

LOCK TABLES `testimonials_description` WRITE;
/*!40000 ALTER TABLE `testimonials_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_code` varchar(32) NOT NULL,
  `zone_name` varchar(255) NOT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `idx_zones_country_id` (`zone_country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,223,'AL','Alabama'),(2,223,'AK','Alaska'),(3,223,'AS','American Samoa'),(4,223,'AZ','Arizona'),(5,223,'AR','Arkansas'),(6,223,'AF','Armed Forces Africa'),(7,223,'AA','Armed Forces Americas'),(8,223,'AC','Armed Forces Canada'),(9,223,'AE','Armed Forces Europe'),(10,223,'AM','Armed Forces Middle East'),(11,223,'AP','Armed Forces Pacific'),(12,223,'CA','California'),(13,223,'CO','Colorado'),(14,223,'CT','Connecticut'),(15,223,'DE','Delaware'),(16,223,'DC','District of Columbia'),(17,223,'FM','Federated States Of Micronesia'),(18,223,'FL','Florida'),(19,223,'GA','Georgia'),(20,223,'GU','Guam'),(21,223,'HI','Hawaii'),(22,223,'ID','Idaho'),(23,223,'IL','Illinois'),(24,223,'IN','Indiana'),(25,223,'IA','Iowa'),(26,223,'KS','Kansas'),(27,223,'KY','Kentucky'),(28,223,'LA','Louisiana'),(29,223,'ME','Maine'),(30,223,'MH','Marshall Islands'),(31,223,'MD','Maryland'),(32,223,'MA','Massachusetts'),(33,223,'MI','Michigan'),(34,223,'MN','Minnesota'),(35,223,'MS','Mississippi'),(36,223,'MO','Missouri'),(37,223,'MT','Montana'),(38,223,'NE','Nebraska'),(39,223,'NV','Nevada'),(40,223,'NH','New Hampshire'),(41,223,'NJ','New Jersey'),(42,223,'NM','New Mexico'),(43,223,'NY','New York'),(44,223,'NC','North Carolina'),(45,223,'ND','North Dakota'),(46,223,'MP','Northern Mariana Islands'),(47,223,'OH','Ohio'),(48,223,'OK','Oklahoma'),(49,223,'OR','Oregon'),(50,223,'PW','Palau'),(51,223,'PA','Pennsylvania'),(52,223,'PR','Puerto Rico'),(53,223,'RI','Rhode Island'),(54,223,'SC','South Carolina'),(55,223,'SD','South Dakota'),(56,223,'TN','Tennessee'),(57,223,'TX','Texas'),(58,223,'UT','Utah'),(59,223,'VT','Vermont'),(60,223,'VI','Virgin Islands'),(61,223,'VA','Virginia'),(62,223,'WA','Washington'),(63,223,'WV','West Virginia'),(64,223,'WI','Wisconsin'),(65,223,'WY','Wyoming'),(66,38,'AB','Alberta'),(67,38,'BC','British Columbia'),(68,38,'MB','Manitoba'),(69,38,'NF','Newfoundland'),(70,38,'NB','New Brunswick'),(71,38,'NS','Nova Scotia'),(72,38,'NT','Northwest Territories'),(73,38,'NU','Nunavut'),(74,38,'ON','Ontario'),(75,38,'PE','Prince Edward Island'),(76,38,'QC','Quebec'),(77,38,'SK','Saskatchewan'),(78,38,'YT','Yukon Territory'),(79,81,'NDS','Niedersachsen'),(80,81,'BAW','Baden-Württemberg'),(81,81,'BAY','Bayern'),(82,81,'BER','Berlin'),(83,81,'BRG','Brandenburg'),(84,81,'BRE','Bremen'),(85,81,'HAM','Hamburg'),(86,81,'HES','Hessen'),(87,81,'MEC','Mecklenburg-Vorpommern'),(88,81,'NRW','Nordrhein-Westfalen'),(89,81,'RHE','Rheinland-Pfalz'),(90,81,'SAR','Saarland'),(91,81,'SAS','Sachsen'),(92,81,'SAC','Sachsen-Anhalt'),(93,81,'SCN','Schleswig-Holstein'),(94,81,'THE','Thüringen'),(95,14,'WI','Wien'),(96,14,'NO','Niederösterreich'),(97,14,'OO','Oberösterreich'),(98,14,'SB','Salzburg'),(99,14,'KN','Kärnten'),(100,14,'ST','Steiermark'),(101,14,'TI','Tirol'),(102,14,'BL','Burgenland'),(103,14,'VB','Voralberg'),(104,204,'AG','Aargau'),(105,204,'AI','Appenzell Innerrhoden'),(106,204,'AR','Appenzell Ausserrhoden'),(107,204,'BE','Bern'),(108,204,'BL','Basel-Landschaft'),(109,204,'BS','Basel-Stadt'),(110,204,'FR','Freiburg'),(111,204,'GE','Genf'),(112,204,'GL','Glarus'),(113,204,'JU','Graubünden'),(114,204,'JU','Jura'),(115,204,'LU','Luzern'),(116,204,'NE','Neuenburg'),(117,204,'NW','Nidwalden'),(118,204,'OW','Obwalden'),(119,204,'SG','St. Gallen'),(120,204,'SH','Schaffhausen'),(121,204,'SO','Solothurn'),(122,204,'SZ','Schwyz'),(123,204,'TG','Thurgau'),(124,204,'TI','Tessin'),(125,204,'UR','Uri'),(126,204,'VD','Waadt'),(127,204,'VS','Wallis'),(128,204,'ZG','Zug'),(129,204,'ZH','Zürich'),(130,195,'A Coruña','A Coruña'),(131,195,'Alava','Alava'),(132,195,'Albacete','Albacete'),(133,195,'Alicante','Alicante'),(134,195,'Almeria','Almeria'),(135,195,'Asturias','Asturias'),(136,195,'Avila','Avila'),(137,195,'Badajoz','Badajoz'),(138,195,'Baleares','Baleares'),(139,195,'Barcelona','Barcelona'),(140,195,'Burgos','Burgos'),(141,195,'Caceres','Caceres'),(142,195,'Cadiz','Cadiz'),(143,195,'Cantabria','Cantabria'),(144,195,'Castellon','Castellon'),(145,195,'Ceuta','Ceuta'),(146,195,'Ciudad Real','Ciudad Real'),(147,195,'Cordoba','Cordoba'),(148,195,'Cuenca','Cuenca'),(149,195,'Girona','Girona'),(150,195,'Granada','Granada'),(151,195,'Guadalajara','Guadalajara'),(152,195,'Guipuzcoa','Guipuzcoa'),(153,195,'Huelva','Huelva'),(154,195,'Huesca','Huesca'),(155,195,'Jaen','Jaen'),(156,195,'La Rioja','La Rioja'),(157,195,'Las Palmas','Las Palmas'),(158,195,'Leon','Leon'),(159,195,'Lleida','Lleida'),(160,195,'Lugo','Lugo'),(161,195,'Madrid','Madrid'),(162,195,'Malaga','Malaga'),(163,195,'Melilla','Melilla'),(164,195,'Murcia','Murcia'),(165,195,'Navarra','Navarra'),(166,195,'Ourense','Ourense'),(167,195,'Palencia','Palencia'),(168,195,'Pontevedra','Pontevedra'),(169,195,'Salamanca','Salamanca'),(170,195,'Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,195,'Segovia','Segovia'),(172,195,'Sevilla','Sevilla'),(173,195,'Soria','Soria'),(174,195,'Tarragona','Tarragona'),(175,195,'Teruel','Teruel'),(176,195,'Toledo','Toledo'),(177,195,'Valencia','Valencia'),(178,195,'Valladolid','Valladolid'),(179,195,'Vizcaya','Vizcaya'),(180,195,'Zamora','Zamora'),(181,195,'Zaragoza','Zaragoza');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones_to_geo_zones`
--

DROP TABLE IF EXISTS `zones_to_geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_to_geo_zones_country_id` (`zone_country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones_to_geo_zones`
--

LOCK TABLES `zones_to_geo_zones` WRITE;
/*!40000 ALTER TABLE `zones_to_geo_zones` DISABLE KEYS */;
INSERT INTO `zones_to_geo_zones` VALUES (1,223,18,1,NULL,'2026-10-16 20:46:41');
/*!40000 ALTER TABLE `zones_to_geo_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'oscommerce_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-29 21:40:36
-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: oscommerce_db
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sesskey` varchar(128) NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `whos_online`
--

DROP TABLE IF EXISTS `whos_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `session_id` varchar(128) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `time_entry` varchar(14) NOT NULL,
  `time_last_click` varchar(14) NOT NULL,
  `last_page_url` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `action_recorder`
--

DROP TABLE IF EXISTS `action_recorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_recorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) NOT NULL,
  `success` char(1) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_action_recorder_module` (`module`),
  KEY `idx_action_recorder_user_id` (`user_id`),
  KEY `idx_action_recorder_identifier` (`identifier`),
  KEY `idx_action_recorder_date_added` (`date_added`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_administrator_user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-29 21:40:36
