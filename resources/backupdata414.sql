INSERT INTO `author` VALUES (1,'Aiesec Newton'),(2,'Albert Einstein'),(3,'Martin Wickramasinghe'),(4,'Cupid Longheart'),(5,'Jacklynn Wilson'),(6,'Meg Cabot'),(7,'Amy Cohen'),(8,'Sylvia Ruskin'),(9,'Noah Calby');
INSERT INTO `branch` VALUES (1,'Nugegoda','7, Flower road, Nugegoda','0112 234 345',1),(2,'Rathnapura','23A, Main street, Rathnapura','0322 233 424',1);
INSERT INTO `language` VALUES (1,'Sinhala'),(2,'English'),(3,'Tamil');
INSERT INTO `publisher` VALUES (1,'Camlot publishers'),(2,'Happy publishers'),(3,'New year publishers'),(4,'China town publications'),(5,'Wimaladharma publications');
INSERT INTO `report` VALUES (1,'MB','Monthly report - Nugegoda - January',2016,'January','Nugegoda','https://google.com'),(2,'MB','Monthly report - Nugegoda - February',2016,'February','Nugegoda','https://google.com'),(3,'AB','Annual report - Nugegoda ',2015,NULL,'Nugegoda','https://google.com'),(4,'MB','Monthly report - Rathnapura - February',2016,'February','Rathnapura','https://google.com'),(5,'MG','Monthly report - general - January',2016,'January',NULL,'https://google.com'),(6,'AG','Annual report - general ',2015,NULL,NULL,'https://google.com'),(7,'MG','Monthly report - general - February',2016,'February',NULL,'https://google.com');
INSERT INTO `type` VALUES (1,'Fiction'),(2,'Non-Fiction'),(3,'Academic'),(4,'Children\'s');
INSERT INTO `subject` VALUES (1,'Modern',1),(2,'Contemporary',1),(3,'Crime and Mystery',1),(4,'Fantasy',1),(5,'Romance',1),(6,'Adult',1),(7,'Young adult',1),(8,'Classic',1),(9,'Historical',1),(10,'Science',1),(11,'Biographies',2),(12,'Cooking and Food',2),(13,'Psychology',2),(14,'Fitness and Diet',2),(15,'Crafts and Handwork',2),(16,'Travel and Holiday',2),(17,'Careers and Success',2),(18,'History',2),(19,'Sports and Recreation',2),(20,'Accounting, Business and Finance',3),(21,'Biology and Medical science',3),(22,'Computer and Programming',3),(23,'Engineering',3),(24,'Mathematics',3),(25,'Physics',3),(26,'English Literature',3),(27,'Sinhala Literature',3),(28,'Environment and Planning',3),(29,'Healthcare',3),(30,'History',3),(31,'Law',3),(32,'Media and Communication',3),(33,'Arts',3),(34,'Agriculture',3),(35,'Architecture',3),(36,'Fashion Design',3),(37,'Geography',3),(38,'Music',3),(39,'Politics',3),(40,'Religions',3),(41,'Zoology',3),(42,'Story books',4),(43,'Coloring',4),(44,'Picture books',4);
INSERT INTO `user` VALUES (1,'admin','19223a7bbd7325516f069df18b50','0','Sachithra','Dangalla','937741170V',1,1),(2,'malsha','999a59389cfced55d7dfc617e7d75765','1','Malsha','Ranawaka','935928328V',2,1),(14,'yas','28badde8929fc4f9e5243ae28975475c','1','Yasara','Peiris','909009090',1,1),(15,'cheese','46b12857327f19ecd9844df7136d74','2','Happy','Cow','8989898',1,1);
INSERT INTO `log` VALUES (1,'2016-04-13 09:58:52','10.113.28.250',1,'backed up the database'),(2,'2016-04-13 09:58:52','10.113.28.250',1,'user logged in'),(3,'2016-04-13 09:58:58','10.113.28.250',1,'user logged out'),(4,'2016-04-13 10:09:28','10.113.28.250',1,'backed up the database'),(5,'2016-04-13 10:09:28','10.113.28.250',1,'user logged in'),(6,'2016-04-13 10:40:43','10.113.33.161',1,'backed up the database'),(7,'2016-04-13 10:40:43','10.113.33.161',1,'user logged in'),(8,'2016-04-13 10:40:57','10.113.33.161',1,'user logged out'),(9,'2016-04-13 10:41:03','10.113.33.161',2,'backed up the database'),(10,'2016-04-13 10:41:04','10.113.33.161',2,'user logged in'),(11,'2016-04-13 10:41:13','10.113.33.161',2,'user logged out'),(12,'2016-04-13 10:41:20','10.113.33.161',1,'backed up the database'),(13,'2016-04-13 10:41:20','10.113.33.161',1,'user logged in'),(14,'2016-04-13 11:25:13','127.0.0.1',1,'user logged out'),(15,'2016-04-13 11:27:26','127.0.0.1',15,'backed up the database'),(16,'2016-04-13 11:27:26','127.0.0.1',15,'user logged in'),(17,'2016-04-13 13:50:10','127.0.0.1',1,'backed up the database'),(18,'2016-04-13 13:50:10','127.0.0.1',1,'user logged in'),(19,'2016-04-13 16:08:32','127.0.0.1',1,'backed up the database'),(20,'2016-04-13 16:08:32','127.0.0.1',1,'user logged in'),(21,'2016-04-13 16:31:13','127.0.0.1',1,'backed up the database'),(22,'2016-04-13 16:31:13','127.0.0.1',1,'user logged in'),(23,'2016-04-13 16:31:14','127.0.0.1',1,'Datalist refreshed'),(24,'2016-04-13 16:44:04','127.0.0.1',1,'user logged out'),(25,'2016-04-13 16:44:58','127.0.0.1',1,'backed up the database'),(26,'2016-04-13 16:44:58','127.0.0.1',1,'user logged in'),(27,'2016-04-13 16:44:58','127.0.0.1',1,'Datalist refreshed'),(28,'2016-04-13 16:46:59','127.0.0.1',1,'Datalist refreshed'),(29,'2016-04-13 16:47:00','127.0.0.1',1,'backed up the database'),(30,'2016-04-13 16:47:00','127.0.0.1',1,'user logged in'),(31,'2016-04-14 04:07:22','127.0.0.1',1,'Datalist refreshed'),(32,'2016-04-14 04:07:23','127.0.0.1',1,'backed up the database'),(33,'2016-04-14 04:07:23','127.0.0.1',1,'user logged in'),(34,'2016-04-14 09:12:03','127.0.0.1',1,'backed up the database'),(35,'2016-04-14 09:12:03','127.0.0.1',1,'user logged in');
INSERT INTO `book` VALUES (1,'Bandara maru un','123-345-2','2004-02-12 00:00:00',1,'2004-05-12 00:00:00',230,'Sample description nbksdjbc eduifbgiue fbidgvbfcy giyg fchuighu','site/images/book_images/bandara maru un.jpg',1,0,2,1,2,1),(2,'One pot favorites','4252-4535','2012-05-24 00:00:00',3,'2013-01-12 00:00:00',500,'Food dsnajkb bi hiausbgf bhifabub ','site/images/book_images/one pot favs.jpg',1,0,1,2,12,1),(3,'Crazy weirdo','5837-2534','2016-01-23 00:00:00',1,'2016-03-12 00:00:00',400,'bkjhfb hfiuh fweufh wefihe ','site/images/book_images/weirdo.jpg',1,0,2,2,42,1),(4,'Harry Potter','24242-24242','2003-09-29 00:00:00',5,'2004-04-23 00:00:00',700,'nhjifnh hufisdf werfwieu bifbweuif ','site/images/book_images/harrypotter.jpg',0,1,3,2,7,1),(5,'Clinical medicine','4343-3252','2003-04-23 00:00:00',6,'2004-02-13 00:00:00',1800,'jihfd hfuishfu ewfhie fwehif e','site/images/book_images/clinical medicine.jpg',0,0,1,2,21,1),(6,'Cometh the hour','23232-242421','2009-08-09 00:00:00',2,'2009-09-08 00:00:00',1200,'hidfhs hufidshfui ehiufhew huifhwe','site/images/book_images/cometh the hour.jpg',0,0,1,2,3,1),(7,'Big brother boris','23232-43656','2008-09-09 00:00:00',1,'2016-03-29 00:00:00',850,'hjifdsh fhdsifh fwejihf fdwfhi ','site/images/book_images/big bro boris.jpg',1,1,2,2,42,1),(8,'Me before you','85858-39393','2015-09-09 00:00:00',1,'2016-01-01 00:00:00',1300,'hiaswfdo fwifh ewfhwe fwefh ewfehj fwefh wefoih ef','site/images/book_images/me before you.jpg',0,1,2,2,5,1),(9,'Maestra','65656-35353','2013-09-09 00:00:00',1,'2014-09-09 00:00:00',1500,'iwdwhdj fwehuif efhuiwe f huiefw hufiwe fhiwuehf dffsw','site/images/book_images/maestra.jpg',0,0,2,2,10,1),(10,'Lady midnight','2345-4635','2015-12-12 00:00:00',1,'2016-03-18 00:00:00',1350,'njdji fndsji fsdhui fsdhuf dsfiud f','site/images/book_images/lady midnight.jpg',0,0,3,2,8,1),(11,'Brooklynn','1230-5463','2014-12-12 00:00:00',1,'2016-04-01 00:00:00',1250,'njf bhufi wqweiufh wefhiw efweauh fwaufh ewfuh i','site/images/book_images/brooklyn.jpg',0,0,4,2,9,1);
INSERT INTO `bill` VALUES (1,'2014-02-12 00:00:00',560,'Cash',15),(2,'2004-12-12 00:00:00',700,'Cash',15),(3,'2004-02-12 00:00:00',1200,'Online',15);
INSERT INTO `book_has_author` VALUES (6,1),(1,2),(5,2),(4,3),(7,3),(3,4),(10,4),(8,5),(11,5),(2,6),(3,6),(9,6),(8,7),(7,9);
INSERT INTO `book_has_bill` VALUES (1,1,1),(4,1,1),(5,1,2),(5,3,2),(6,2,1),(7,3,3);
INSERT INTO `branch_stock` VALUES (1,1,45),(1,2,45),(1,3,25),(1,4,12),(1,5,23),(1,6,25),(1,7,25),(1,8,25),(1,9,25),(1,10,25),(1,11,25),(2,1,45),(2,2,45),(2,3,60),(2,4,24),(2,5,45),(2,6,25),(2,7,25),(2,8,25),(2,9,25),(2,10,25),(2,11,25);