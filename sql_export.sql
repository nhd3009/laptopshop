-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: laptopshop
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbql1m2v2po7hcawonqsgqex88` (`cart_id`),
  KEY `FKclb1c0wg3mofxnpgidib1t987` (`product_id`),
  CONSTRAINT `FKbql1m2v2po7hcawonqsgqex88` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `FKclb1c0wg3mofxnpgidib1t987` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sum` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK64t7ox312pqal3p7fg9o503c2` (`user_id`),
  CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_chk_1` CHECK ((`sum` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrws2q0si6oyd6il8gqe2aennc` (`order_id`),
  KEY `FKc7q42e9tu0hslx6w4wxgomhvn` (`product_id`),
  CONSTRAINT `FKc7q42e9tu0hslx6w4wxgomhvn` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKrws2q0si6oyd6il8gqe2aennc` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (3,999,1,2,1),(4,899,1,3,2);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_price` double NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `recipient_address` varchar(255) DEFAULT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `recipient_phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,999,5,'Test','Test','Test','PENDING'),(3,899,5,'user address','User','8234151912','PENDING');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `detail_desc` mediumtext NOT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `sold` bigint NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `products_chk_1` CHECK ((`quantity` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'MacBook Pro 14 inch M4 16GB 512GB brings impressive power with 10-core M4 chip, 10-core GPU Neural Engine 16 cores unlock amazing AI potential, upgrade outstanding performance. MacBook has powerful 16GB RAM with 120GB/s bandwidth for smooth and fast processing. 512GB memory with SSD hard drive provides large storage space with high-speed data retrieval while protecting data safely.','APPLE','fe593870-d461-44c4-9ef6-4d99f9faee04-1733585770317-0031844_den_550.jpeg','Macbook Pro M4 14 Inch',999,100,'M4 10 cores, GPU 10 cores Neural Engine 16 cores, 16GB RAM',0,'Business'),(2,'Lenovo IdeaPad Slim 5 14Q8X9 83HL000KVN laptop smoothly handles all work and entertainment tasks thanks to the combination of Qualcomm Snapdragon X Plus CPU and 16GB RAM. Along with that, the 512GB PCIe SSD hard drive also supports increased access speed and storage space. In addition, the 14-inch WUXGA screen also helps users enjoy detailed, clear content.','LENOVO','cfdffab4-5d80-445f-9f68-d5e3836c1d84-1733586714661-50242_laptop_lenovo_ideapad_slim_5_14q8x9_83hl000kvn__1_.jpg','Laptop Lenovo IdeaPad Slim 5',899,100,'Snapdragon X Plus, 16GB RAM, Adreno',0,'Thin-Slim'),(3,'The Asus Zenbook 14 OLED UX3405MA-PP151W laptop offers breakthrough processing performance thanks to being equipped with Intel\'s top chipset Intel Core Ultra 5 125H CPU. Accompanying this performance parameter of the Asus Zenbook laptop is the ability to multitask, impressive storage through 16GB LPDDR5X RAM and 512GB SSD hard drive. At the same time, this Asus Zenbook laptop model also comes with a 75WHrs battery capacity, allowing stable operation for many hours continuously without the need to recharge.','ASUS','d741ad12-fc1e-45de-a4db-218cf25bd5b1-1733586919211-asus_oled.jpeg','Laptop Asus Zenbook 14 OLED',1025,100,'Intel Core Ultra 5 125H, 16GB RAM, Intel Arc Graphics',0,'Thin-Slim'),(4,'Thinkbook 14 G6+ is one of the new super products launched in early 2024 from Lenovo. This series possesses many outstanding features in design, performance and features such as Ryzen 7 8845H, integrated IR Camera for face unlocking, weighing only 1.5kg with a large 85WHr battery, this Lenovo Thinkbook model is the perfect choice for businessmen, office workers or students,... to meet the needs of studying and working.','LENOVO','3149c961-ddf8-40f5-bfe9-bf7545ef3116-1739292365709-thinkbook 14 g6 amd r7 8845-thumbnail.png','Thinkbook 14 G6+ 2024',649,20,'Ryzen 7 8845H RAM 32GB SSD 1TB 14inch 3K 120Hz',0,'IT-Office'),(5,'Basically, the ThinkPad X1 Carbon Gen 9 looks quite similar to previous Thinkpad X1 Carbon generations, but Lenovo is always a design company that knows how to make a difference on somewhat familiar designs. Specifically, this Lenovo ThinkPad will have a frame made of 100% magnesium, along with a smooth carbon fiber coating. This is one of the key points to make the difference in the design of the Lenovo ThinkPad X1 Carbon Gen 9 compared to previous generations. This will also help the machine to be more durable and sturdy during long-term use by users.','LENOVO','6ceabea9-3a2a-470f-b894-11b14e5b1271-1739292496891-x1_carbon_gen_9_trungtran.vn_png_1678070815_1.png','Thinkpad X1 Carbon Gen 9',599,20,'i5-1145G7 32GB SSD 256GB FHD+ Touch',0,'Business'),(6,'Legion Slim 5 16AHP9 is a gaming laptop model from the Lenovo laptop brand that has been highly appreciated by gamers in recent times. Because this laptop - gaming laptop not only has a durable, extremely sturdy design but also has outstanding graphics performance, along with a cool cooling system. To learn more about this Lenovo Legion product line, please refer to the content below!','LENOVO','96a8509a-8875-4a16-b4f2-da92a0ce58ca-1739292672737-Lenovo_legion_slim_5_2024_thumbnail_1706264840_1.jpg','Lenovo Legion Slim 5 R7000P 2024',1099,10,'Ryzen 7 8845H RAM 16GB SSD 1TB RTX 4060 16\" 2.5K 165Hz',0,'Gaming'),(7,'CPU: Apple M1 Pro (8-core CPU including 6 p-core and 2 e-core)\r\nRAM: 16GB LPDDR5 6400MHz non-upgradable\r\nStorage: 512GB NVME SSD non-upgradable\r\nScreen: 14\" Liquid Retina XDR (3024x1964), True Tone, anti-glare non-touch glass, miniLED, 99.3% DCI-P3 color coverage, 16:10 aspect ratio, 254 PPI pixel density, 500nits screen brightness.\r\nGraphics card: Apple M1 Pro GPU 14 core\r\nCamera: 1080p FaceTime HD camera\r\nFingerprint reader: supports Touch ID fingerprint sensor\r\nKeyboard: compact keyboard, with Led backlit, large and sensitive Force Touch Trackpad, combined with Touch ID on the power button\r\nPhysical connection port: Card reader-writer slot SDXC, 3 Thunderbolt 4 ports, 3.5mm headphone jack, HDMI, MagSafe 3 charging port\r\nBattery: 70wh\r\nWireless connection: Wi-Fi + Bluetooth¬Æ 5.0\r\nDimensions: 31.26 x 22.12 x 1.55 cm\r\nWeight: 1.6kg\r\nColor: Space Gray\r\nMaterial: metal\r\nYear of manufacture: 2021\r\nCondition: Like New, used','APPLE','d9c8faa8-4b0f-4e6a-915d-07f8ce411bae-1739292828130-macbook pro 14 m1 2021 up down (2).png','Macbook Pro 14 M1 Pro',1059,15,'M1 Pro 8-Core CPU 14-Core GPU RAM 16GB SSD 512GB Retina 2021',0,'Graphic-Designer'),(8,'CPU: Intel Core Ultra 5-125H (14 cores 18 threads, maximum clock speed with Turbo Boost up to 4.5GHz, 18 MB Intel¬Æ Smart Cache)\r\nRAM: 32GB DDR5 5600MHz with a total of 2 RAM slots\r\nHard Drive: 1TB PCIe¬Æ PCIe NVMe¬Æ M.2 SSD\r\nScreen: 14‚Ä≥, 2.5K (1560x1600), IPS, matte non-touch screen, brightness up to 400nits, frequency 120Hz, aspect ratio 16:10, color coverage 100% DCI-P3\r\nGraphics: Intel Arc Graphics\r\nOperating System: Windows 11\r\nKeyboard: compact, no numberpad, white key led support\r\nBATTERY: 3 cell 56wh\r\nCamera: FHD camera with 2 long-range microphones\r\nPhysical connection ports: 2 USB-C ports 3.2 Gen 2 (data transfer, DisplayPort 1.4, HP Sleep and Charge), 2 USB-A 3.2 Gen 1 ports, HDMI, headphone jack, LAN port\r\nWireless connection: Wifi 6E + Bluetooth 5.3\r\nDimensions: 31.86 x 22.44 x 1.09-1.7 cm\r\nWeight: from 1.39 kg\r\nColor: Silver\r\nMaterial: Metal Coating\r\nYear of manufacture: 2024\r\nCondition: New 100%','HP','8493c1ed-2fc7-41bc-bc97-c301d29dc983-1739292988365-c08965274.png','HP ProBook 440 G11',899,20,'Intel Core Ultra 5 125H RAM 32GB SSD 1TB 14\" 2.5K',0,'IT-Office'),(9,'PRODUCT LINE: Asus Zenbook S14 OLED (UX5406)\r\nCPU: Intel Core Ultra 7 258V 32GB (8 cores (including 4 P cores and 4 E cores) 8 threads, base clock from 2.2GHz can reach max with turbo boost up to 4.8GHz, 12 MB Intel¬Æ Smart Cache)\r\nRAM: 32GB LPDDR5x 8533MHz (not support upgrade)\r\nHARD DRIVE: 1TB PCIe¬Æ NVMe‚Ñ¢ M.2 SSD (1 slot)\r\nSCREEN: 14\" 3K (2880 x 1800) Asus Lumina OLED, mirror screen, non-touch, 120Hz refresh rate, 400-500nits screen brightness, NanoEdge ultra-thin bezel, Pantone validate: 100% DCI-P3, HDR500, Dolby Vision, LOW BLUE LIGHT, certified for eye protection by TUV Rheinland (information according to the manufacturer)\r\nGRAPHICS: Intel¬Æ Arc‚Ñ¢ Graphics 140V\r\nCAMERA: supports face recognition, FHD camera with long-range microphone\r\nOPERATING SYSTEM: Windows 11\r\nSOUND: crafted by Harman Kardon, 4-speaker system (including woofer and tweeter) for realistic and vivid entertainment sound experience, Dolby Atmos\r\nKEYBOARD: compact, with LED keys\r\nTOUCHPAD: integrated Ergosense (can adjust volume up and down, screen brightness on touchpad, does not support numberpad, anti-fingerprint\r\nFINGERPRINT READER: Not supported\r\nPHYSICAL CONNECTIONS: 1 USB-A 3.2 Gen 2 port, HDMI 2.1, 2 Thunderbolt 4 type C ports, headphone jack\r\nWIRELESS CONNECTIONS: Wi-Fi 7 + Bluetooth 5.4\r\nBATTERY: 4 Cell 72Wh fast charging (up to 60% in 49 minutes - according to the manufacturer), 65W charger\r\nWEIGHT: 1.2kg\r\nSIZE: 31.03 x 21.47 x 1.19 ~ 1.29 cm\r\nMATERIAL: Ceraluminum (Ceramic Aluminum - a material combining the properties of ceramic and aluminum, often used in aircraft and watch manufacturing - increases strength and flexibility but is still sturdy)\r\nCOLOR: Artic White (White)\r\nYEAR OF MANUFACTURING: 2024 - 2025\r\nCONDITION: Brand New 100%','ASUS','9c37c3cf-ce56-4b8c-b56b-112cd32c099b-1739293198389-asus_zenbook_s14_white.jpg','Asus Zenbook S 14',1399,30,'Intel Core Ultra 7 258V RAM 32GB SSD 1TB 14\" 3K OLED (Artic White)',0,'IT-Office'),(10,'CPU: Intel¬Æ Core‚Ñ¢ i9-11950H (8 cores 16 threads, base clock frequency 2.6GHz - maximum Turbo boost can reach 5.0GHz, 24 MB Intel¬Æ Smart Cache, vPro)\r\nRAM: From 16GB LPDDR4 3200MHz, upgradeable, up to 64GB (2 slots in total)\r\nHard Drive: From 512GB NVME PCIe M.2 SSD, upgradeable with 1 additional slot\r\nScreen: 15.6-inch, Full High Definition (FHD+) 1920 x 1200px, 60Hz refresh rate, WVA panel, anti-glare matte screen, low blue light, non-touch, 500nits brightness, sRGB 100%, 145 PPI pixel density, 1650:1 contrast ratio, speed 35ms image response time, Premier Color, ultra-thin 4-sided bezel. Graphics: Nvidia RTX A2000 + Intel¬Æ UHD graphics\r\nKeyboard: compact, no numeric keypad, with LED lights, extra-large Touchpad with Window Precision\r\nBATTERY: 6 cell 86Wh, with 130W type C charger supporting ExpressCharge‚Ñ¢ fast charging\r\nCamera: IR/RGB camera with 2 long-range microphones\r\nPhysical connection ports: 1 USB 3.2 Gen 2 Type-C port, 1 SD card reader-writer slot, 1 headphone jack, 1 physical lock slot, 2 Thunderbolt 4 type C ports,\r\nWireless connection: Intel¬Æ Wi-Fi 6 AX201 2x2 (Gig+) + Bluetooth 5.1\r\nOperating system: Windows 10 Pro copyright\r\nDimensions: 34.4cm x 23.0cm x 0.77-1.16cm (slim beveled design towards the front edge, thicker hinge edge)\r\nWeight: 1.84 - 2.04kg (depending on the configuration of ram and drive)\r\nMaterial: full aluminum + magnesium\r\nColor: Aluminum - Titan Gray (Metallic gray)\r\nStatus: Dell Outlet Fullbox - Refurbished','DELL','4106384b-2b22-467f-9491-345ff4983bca-1739293771510-Screenshot 2022-04-21 122027.png','Dell Precision 5560',900,5,'Intel Core i9-11950H RAM 16GB SSD 512GB RTX A2000 15.6\" FHD+',0,'Graphic-Designer'),(11,'CPU: Intel Core i9 14900HX (24 cores 32 threads, up to 5.8GHz with turbo boost, 36MB Intel¬Æ Smart Cache)\r\nRAM: 16GB DDR5 5600MHz, total 2 ram slots\r\nOperating system: Windows 11\r\nHard drive: 1TB PCIe Gen 4 x 4 NVME M.2 2280 SSD (with two slots for upgrade, supports high-speed Gen 4 SSD, up to 2TB)\r\nScreen: 16‚Ä≥ 2.5K (2560x1600) IPS, LCD, LED, matte screen, anti-glare, non-touch, 180Hz screen refresh rate, 16:10 aspect ratio, 100% sRGB color coverage, 400-500nits brightness, response time up to 3ms, NVIDIA¬Æ G-SYNC¬Æ,...\r\nGraphics card: NVIDIA GeForce¬Æ RTX‚Ñ¢ 4060 8GB GDDR6\r\nCamera: 720p camera with two long-range microphones\r\nKeyboard: fullsize, with numeric keypad, with 4-zone RGB led\r\nWireless connection: Killer Wi-Fi 6 AX1650i + Bluetooth 5.2\r\nPhysical connection ports: 2 USB A 3.2 Gen 2 ports (including 1 port supporting Always On charging), 1 USB-A 3.2 Gen 1 port, physical lock slot, LAN, microSD card reader slot, headphone jack, 2 thunderbolt 4 type C ports, HDMI, round pin charging port\r\nBattery: 4cell 90wh\r\nCooling system: 2 fans using AeroBlade 3D Fan gen 5 technology, adjustable settings in PredatorSense, 4 hot air vents (2 slots next to the hinge, 1 left, 1 right) (system allows increased throughput air up 10% compared to normal and with the ultra-thin fan blade design, 0.08mm with 89 blades, making the fan lighter and quieter than usual), the cross-section of the heat-conducting copper bar is also increased thanks to the design change from oval to rectangular, helping to conduct heat more optimally\r\nWeight: about 2.6 kg\r\nColor: Abyss Black (black)\r\nYear of manufacture: 2024\r\nCondition: New 100%','ACER','630638bf-ce3f-4b55-b17a-60d60e0d198c-1739293947261-acer predator helios neo 16 2024 front thumbnail_1732119442_1.png','Acer Predator Helios Neo 16 2024',1200,12,'Intel Core i9 14900HX RAM 16GB SSD 1TB RTX 4060 16\" 2.5K 180Hz',0,'Gaming'),(12,'CPU: Intel Core i5 1334U (10 cores 12 threads, base clock frequency 3.4GHz - maximum Turbo boost can reach 4.6GHz, 12MB Smart Cache, Default TDP 15W - 55W with turbo boost); Operating system: Windows 11\r\nRAM: From 8GB DDR4 2666MHz (1 x 8GB), the company announced that it can be upgraded with a total of 2 slots to 32GB\r\nHard drive: 512GB PCIe NVME M.2 SSD, can be upgraded as a replacement because there is only 1 slot for the hard drive\r\nScreen: 15.6\" FHD (1920x1080), WVA, anti-glare matte screen, non-touch, screen brightness 250nits, 45% NTSC color coverage, 120Hz screen refresh rate, low blue light screen.\r\nCamera: 720p HD camera with 2 long-range microphones\r\nGraphics: Intel UHD Graphics\r\nKeyboard: Full-size keys, with numeric keypad, with LED keys\r\nFingerprint Reader: Not supported\r\nBattery: 3 cells, 41Wh, with 65W round-pin charger\r\nPhysical connection ports: 1 port USB-A 2.0, headphone jack, charging port, HDMI 1.4 (only supports FHD@60Hz display output, does not support 2K or 4K), 1 USB-A 3.2 Gen1 port (transmission speed 5 Gbps), 1 3.2 Gen 1 port (data transmission only, does NOT support charging or DisplayPort function)\r\nWireless connection: Bluetooth¬Æ 5 + Wi-Fi¬Æ 6\r\nSize: 35.85cm x 23.55cm x 1.69-1.89cm\r\nWeight: 1.65kg\r\nColor: silver\r\nMaterial: Impact-resistant hard plastic\r\nYear of manufacture: 2024\r\nCondition: New 100%','DELL','af8131c0-7416-4dfd-bd1e-f8978ce5b01f-1739294438234-notebook-inspiron-15-3530-nt-plastic-silver-gallery-2.png','Dell Inspiron 3530',459,5,'Intel Core i5 1334U RAM 8GB SSD 512GB 15.6\" FHD 120Hz',0,'IT-Office'),(13,'CPU: Intel¬Æ Core‚Ñ¢ i7 12850HX (16 cores 24 threads, base clock 3.4GHz can reach maximum Turbo Boost 4.8GHz, 25MB Intel¬Æ Smart Cache)\r\nRAM: from 32GB DDR5 4800MHz (2 pre-installed 16GB sticks), a total of 4 slots for upgrade, maximum 128GB.\r\nHard Drive: 512GB PCIe¬Æ NVMe‚Ñ¢ M.2 SSD; The machine has 2 M.2 2280 slots, currently installed in the machine is 1 M.2 2280 bar, maximum up to 4TB\r\nScreen: 16\" FHD+ (1920x1200) IPS, anti-glare matte screen, non-touch, 16:10 aspect ratio, minimum screen brightness 300nits, 60Hz refresh rate, 1200:1 contrast ratio, 100% sRGB color coverage, blue light reduction screen, X-Rite¬Æ Factory Color Calibration, DC dimming\r\nGraphics: Intel¬Æ UHD Graphics + NVIDIA Quadro RTX A3000 12GB, TGP 115W, Dynamic Boost 2.0, DirectX 12\r\nKeyboard: fullsize, with numberpad, with key led, 1.5mm deep key travel\r\nFingerprint reader: Supported, integrated on the power button (this is still optional from the manufacturer) so there may be some that are not supported)\r\nBattery: 94Wh Li-ion\r\nCamera: FHD camera, with Thinkshutter (camera protection shutter) with 2 microphones\r\nPhysical connection ports: see more in the detailed image below\r\nWireless connection: Wifi 6E + Bluetooth 5.1\r\nDimensions: 36.4 x 26.6 x 3.02 cm\r\nWeight: from 2.95kg\r\nMaterial: Lid (aluminum + chrome + magnesium alloy), hard plastic base\r\nColor: Storm Grey (dark gray lid) and Villi Black (black bottom)\r\nYear of manufacture: 2022\r\nCondition: Used','LENOVO','744a9bd5-ffa2-45e3-8240-41cdf32d5534-1739294584231-1659110442_IMG_1806789.jpg','Lenovo Thinkpad P16 Gen 1',1500,4,'Intel Core i7 12850HX RAM 32GB SSD 512GB RTX A3000 12GB FHD+',0,'Graphic-Designer');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'FULL OPTION','ADMIN'),(2,'NORMAL','USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('4d1d43c1-62ca-4a4b-8503-08376a97bbeb','5f4c89d5-0d67-41f7-b75f-5dddad89e46f',1739294842246,1739295088922,2592000,1741887088922,'user@gmail.com');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('4d1d43c1-62ca-4a4b-8503-08376a97bbeb','avatar',_binary '¨\Ì\0t\0fd9c8f3d6-8abd-4a2c-880b-a7f496c16c60-1737026558313-433090703_429271072942198_7131943522042142996_n.jpg'),('4d1d43c1-62ca-4a4b-8503-08376a97bbeb','email',_binary '¨\Ì\0t\0user@gmail.com'),('4d1d43c1-62ca-4a4b-8503-08376a97bbeb','fullName',_binary '¨\Ì\0t\0User'),('4d1d43c1-62ca-4a4b-8503-08376a97bbeb','id',_binary '¨\Ì\0sr\0java.lang.Long;ã\‰êÃè#\ﬂ\0J\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0\0\0\0\0'),('4d1d43c1-62ca-4a4b-8503-08376a97bbeb','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '¨\Ì\0t\0UTF-8'),('4d1d43c1-62ca-4a4b-8503-08376a97bbeb','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '¨\Ì\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\Ô∑\»/¢˚\’\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$ffe8814a-7c3e-494e-a4df-3436963b75f0'),('4d1d43c1-62ca-4a4b-8503-08376a97bbeb','SPRING_SECURITY_CONTEXT',_binary '¨\Ì\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$6eb67132-cd58-42ab-81a2-c6731373b1e0psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0\nsr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0user@gmail.com'),('4d1d43c1-62ca-4a4b-8503-08376a97bbeb','sum',_binary '¨\Ì\0sr\0java.lang.Integer‚†§˜Åá8\0I\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0\0');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(12) NOT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Japan','310f4343-b90f-4fc3-8362-9ba02ce32847-1733508535937-That\'s_Not_My_Name.jpg','kobayashi@example.jp','Kobayshi','kobayshi','0987654322',1),(4,NULL,NULL,'sanni@gmail.com','San Ni','$2a$10$rgjfo5y6NsMRnn2OFEURReod5Zqf3bQFdKo.ZWNsntMMUNx2Fv6hq','0384999777',2),(5,'Test','d9c8f3d6-8abd-4a2c-880b-a7f496c16c60-1737026558313-433090703_429271072942198_7131943522042142996_n.jpg','user@gmail.com','User','$2a$10$i/P0wNztGsm4V0BcjpcrfO8Z9lAdMGXk.4d/s1mpfY8xw/C1EC9IS','0987896543',2),(6,'Test','262c4a7a-4663-49b7-a96f-5cd1afd2206c-1737026567697-433054552_429270949608877_8670645208581704809_n.jpg','admin@gmail.com','Admin','$2a$10$E1FK65u0E4e45mXzuCBeXelz.N8X.Ho1Ng.sZgaSP/gh.XwZ7HziG','0987312567',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-12 13:14:40
