BEGIN TRANSACTION;
INSERT INTO "PSUs" ("ID","UID","Name","Power","Format","Location","Comments") VALUES (1,'PSU1','FSP450-60EMDN',450,'ATX','opslag','24 pin MB connector'),
 (2,'PSU2','GPS-350EB-101 A',350,'ATX','opslag','20 pin MB connector'),
 (3,'PSU3','HPC-460-P12S',460,'ATX','Thijs','24 pin MB connector'),
 (4,'PSU4','acbel pc6035',160,'ATX','opslag','24 pin MB connector'),
 (5,'PSU5','Delta dps-980CB A',980,'server','opslag','Oud standaard?'),
 (6,'PSU6','fsp250-60GTA',250,'ATX','opslag','20 pin MB connector'),
 (7,'PSU7','Delta DPS-475CB A',475,'ATX','opslag','24 pin MB connector'),
 (8,'PSU8','ATX-250-12Z',250,'ATX','opslag','24 pin MB connector'),
 (9,'PSU9','FSP350-60EMDN',350,'ATX','opslag','20 pin MB connector'),
 (10,'PSU10','FSP350-60EMDN',350,'ATX','opslag','20 pin MB connector'),
 (11,'PSU11','FSP270-50SNV',270,'ATX','opslag','20 pin MB connector'),
 (12,'PSU12','?',400,'ATX','opslag','20 pin MB connector'),
 (13,'PSU13','HSTNS-PL14',460,'server','opslag',''),
 (14,'PSU14','corsair cmpsu-450vx',450,'ATX','eric','24 pin MB connector'),
 (15,'PSU15','HSTNS-PL02',460,'ATX','opslag','24 pin MB connector'),
 (16,'PSU16','hp 469348-001',300,'ATX','opslag','24 pin MB connector'),
 (17,'PSU17','FSP400-60MDN',400,'ATX','opslag','20 pin MB connector'),
 (18,'PSU18','LC-230ATX',230,'ATX','opslag','20 pin MB connector'),
 (19,'PSU19','HKC 550W',550,'ATX','bryen','24 pin MB connector'),
 (20,'PSU20','MS-N550-GD',550,'ATX','opslag','24 pin MB connector'),
 (21,'PSU21','FSP450-60EMDN',450,'ATX','eric','24 pin MB connector'),
 (22,'PSU22','Coden 450W',450,'ATX','opslag','24 pin MB connector');
INSERT INTO "CPUs" ("ID","UID","Name","Socket","Base_Speed","Boost_Speed","Cores","Threads","Location","Comments") VALUES (1,'CPU1','Pentium 4 sl7pw','LGA775','3,2','',1,'2','opslag',''),
 (2,'CPU2','pentium dual core slb9u','LGA775','2,6','',2,'2','opslag',''),
 (3,'CPU3','Core 2 Duo E8400','LGA775','3,0','',2,'2','opslag',''),
 (4,'CPU4','core 2 DUO E6300','LGA775','1,86','',2,'2','opslag',''),
 (5,'CPU5','core 2 DUO E6600','LGA775','2,4','',2,'2','opslag',''),
 (6,'CPU6','I3-530','LGA1156','2,93','',2,'4','eric',''),
 (7,'CPU7','i3-4150','LGA1150','3,5','',2,'4','opslag',''),
 (8,'CPU8','i3-4150','LGA1150','3,5','',2,'4','opslag',''),
 (9,'CPU9','i3-3240T','LGA1155','2,9','',2,'4','opslag',''),
 (10,'CPU10','Xeon E5606','LGA1366','2,13','',4,'4','opslag',''),
 (11,'CPU11','Xeon E5530','LGA1366','2,4','2,66',4,'8','opslag',''),
 (12,'CPU12','pentium 4 SL6EV','PGA478B','2,53','',1,'1','opslag',''),
 (13,'CPU13','Celeron ?','PGA478B',1,'',1,'1','opslag','oud'),
 (14,'CPU14','pentium 4 SL5VH','PGA478B','1,6','',1,'1','opslag','oud'),
 (15,'CPU15','i5-2320','LGA1155','3,0','3,3',4,'4','eric',''),
 (16,'CPU16','Pentium 4 SL7PM','PGA478B','3,0','',1,'1','opslag','oud'),
 (17,'CPU17','intel core 2 duo E8400','LGA775','3,0','',2,'2','opslag',''),
 (18,'CPU18','Intel celeron e1500','LGA775','2,2','',2,'2','opslag',''),
 (19,'CPU19','AMD A4-4000','FM2','3,0','3,2',2,'2','opslag','AMD'),
 (20,'CPU20','Pentium 4 SL7E4','PGA478B','3,0','',1,'1','opslag','oud'),
 (21,'CPU21','intel i7 4790','LGA 1150','3,6','',4,'8','opslag',''),
 (22,'CPU22','intel q6600','LGA 775','2,4','',4,'4','opslag',''),
 (23,'CPU23','Intel celeron D 352','LGA 775','3,2','',1,'1','opslag',''),
 (24,'CPU24','intel pentium G3220','LGA 1150','3,0','',2,'2','opslag',''),
 (25,'CPU25','intel i3-3240','LGA 1155','3,4','',2,'4','?',''),
 (26,'CPU26','AMD FX 6100','AM3+','3,3','3,9',6,'6','opslag','AMD'),
 (27,'CPU27','AMD Ryzen R5 2600','AM4','3,4','',6,'12','Bryen','AMD'),
 (28,'CPU28','intel core 2 quad q9505','LGA 775','2,83','',4,'4','opslag',''),
 (29,'CPU29','intel core 2 quad q6600','LGA 775','2,4','',4,'4','eric',''),
 (30,'CPU30','intel celeron G540','LGA1155','2,5','',2,'2','opslag',''),
 (31,'CPU31','intel celeron G1840','LGA1150','2,8','',2,'2','opslag',''),
 (32,'CPU32','Intel core 2 duo E8400','LGA 775','3,0','',2,'2','opslag',''),
 (33,'CPU33','I5-3350P','LGA1155','3,1','3,3',4,'4','thijs',''),
 (34,'CPU34','pentium D 820','LGA775','2,8','',2,'2','opslag',''),
 (35,'CPU35','AMD A4-5300','FM2+','3,4','3,7',2,'2','opslag','AMD'),
 (36,'CPU36','AMD Athlon II X4 640','AM3','3,0','',4,'4','opslag','AMD'),
 (37,'CPU37','Core 2 DUO E6550','LGA775','2,33','',2,'2','opslag',''),
 (38,'CPU38','I3-4130','LGA1150','3,4','',2,'4','opslag',''),
 (39,'CPU39','I3 2120','LGA1155','3,3','',2,'4','opslag','');
INSERT INTO "Coolers" ("ID","UID","Name","Sockets","Location") VALUES (1,'CO1','?','LGA1155','opslag'),
 (2,'CO2','?','PGA478B','opslag'),
 (3,'CO3','?','?','opslag'),
 (4,'CO4','?','LGA775','opslag'),
 (5,'CO5','?','FM2','opslag'),
 (6,'CO6','?','PGA478B','opslag'),
 (7,'CO7','?','AM4','Bryen'),
 (8,'CO8','?','LGA1150','opslag'),
 (9,'CO9','?','LGA 775','opslag'),
 (10,'CO10','?','LGA 775','opslag'),
 (11,'CO11','AMD warith prisma RGB','AM3+','opslag'),
 (12,'CO12','xilence a404t','1150, 1151, 1155, 1156, 1200','opslag'),
 (13,'CO13','xilence a404t','1150, 1151, 1155, 1156, 1200','opslag'),
 (14,'CO14','xilence a404t','1150, 1151, 1155, 1156, 1200','opslag'),
 (15,'CO15','xilence a404t','1150, 1151, 1155, 1156, 1200','opslag'),
 (16,'CO16','Hyper TX 3 EVO','775, 1150, 1151, 1155, 1156, 1200, 1366, AM2, AM2+, AM3, AM3+, AM4, FM1, FM2, FM2+','opslag'),
 (17,'CO17','Hyper 212','775, 1150, 1151, 1155, 1156, 1200, 1366, AM2, AM2+, AM3, AM3+, AM4, FM1, FM2, FM2+','thijs'),
 (18,'CO18','Hyper 212','775, 1150, 1151, 1155, 1156, 1200, 1366, AM2, AM2+, AM3, AM3+, AM4, FM1, FM2, FM2+','eric');
INSERT INTO "Motherbord" ("ID","UID","Name","Socket","Chipset","Format","Location","Comments") VALUES (1,'MB1','HP531965-001 PRO','LGA775','Q43','WTX?','opslag',''),
 (2,'MB2','Dell pj478','LGA775','?','?','opslag','speciale cooler nodig'),
 (3,'MB3','Hp compaq dc7800 sff','LGA775','?','Micro-ATX','opslag',''),
 (4,'MB4','Foxconn 115xdbp','LGA1155','Q77','?','opslag','Reparatie nodig'),
 (5,'MB5','Dell 7010 cn 0wr7py','LGA1155','Q77','Micro-ATX','opslag','Reparatie nodig'),
 (6,'MB6','intel dh55tc','LGA1156','H55','Micro-ATX','eric',''),
 (7,'MB7','escitorio c79876','PGA478B','?','?','opslag','oud'),
 (8,'MB8','msi ms6301','PGA478B','?','?','opslag','oud'),
 (9,'MB9','msi-6507','PGA478B','?','?','opslag','oud'),
 (10,'MB10','MS-7728','LGA1155','H61','Micro-ATX','Defect, oud ijzer',''),
 (11,'MB11','Asus p4p800','PGA478B','865PE','ATX','opslag','oud'),
 (12,'MB12','Asus commando LGA 775','LGA775','P965','ATX','opslag',''),
 (13,'MB13','Foxconn g33m02','LGA775','G33 + ICH9R','Micro-ATX','opslag',''),
 (14,'MB14','MSI X470','AM4','X470','ATX','opslag','AMD'),
 (15,'MB15','asrock B450M','AM4','b450','Micro-ATX','opslag','AMD'),
 (16,'MB16','MSI A78M-E35','FM2','A78','Micro-ATX','opslag','AMD'),
 (17,'MB17','intel D845GEBV2 E210882','PGA478B','?','Micro-ATX','opslag','oud'),
 (18,'MB18','ms-7860','lga1150','q85','Micro-ATX','kwijt',''),
 (19,'MB19','ms-7502','lga775','g33','Micro-ATX','opslag',''),
 (20,'MB20','hp compaq dc 5800','lga775','Q33','ATX','opslag',''),
 (21,'MB21','Gygabyte GA-78LMT-USB3','AM3+','760G','Micro-ATX','opslag','AMD'),
 (22,'MB22','MSI x470 gaming plus max','AM4','X470','ATX','Bryen','AMD'),
 (23,'MB23','MSI H61M-P25 (B3)','LGA1155','H61M','Micro-ATX','opslag',''),
 (24,'MB24','asrock B450M','AM4','B450','Micro-ATX','opslag','AMD'),
 (25,'MB25','MS-7797','LGA1155','BB75','Micro-ATX','eric',''),
 (26,'MB26','p5lp-le','LGA775','945G + ICH7','Micro-ATX','eric',''),
 (27,'MB27','GA-H61M-DS2','LGA1155','H61M','Micro-ATX','thijs',''),
 (28,'MB28','G33M02','LGA775','G33 + ICH9','Micro-ATX','opslag',''),
 (29,'MB29','A68HM-E33','FM2+','A68H','Micro-ATX','opslag',''),
 (30,'MB30','Asus M4A77T','AM3','AMD 770','ATX','opslag','AMD'),
 (31,'MB31','HP XW4600 FMB-0702','LGA775','X38','ATX','opslag',''),
 (32,'MB32','Asus H81M-A','LGA1150','H81M','Micro-ATX','opslag','');
INSERT INTO "PC_Cases" ("ID","UID","Format","Location") VALUES (1,'PCC1','Micro-ATX','opslag'),
 (2,'PCC2','Micro-ATX','opslag'),
 (3,'PCC3','Micro-ATX','opslag'),
 (4,'PCC4','Micro-ATX','opslag'),
 (5,'PCC5','Micro-ATX','opslag'),
 (6,'PCC6','Micro-ATX','thijs'),
 (7,'PCC7','ATX','opslag'),
 (8,'PCC8','ATX','eric'),
 (9,'PCC9','ATX','opslag'),
 (10,'PCC10','E-ATX','opslag'),
 (11,'PCC11','EE-ATX','Bryen'),
 (12,'PCC12','Micro-ATX','opslag'),
 (13,'PCC13','Micro-ATX','opslag'),
 (14,'PCC14','ATX','opslag');
COMMIT;
