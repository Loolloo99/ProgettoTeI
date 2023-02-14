-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: prova1
-- ------------------------------------------------------
-- Server version	10.6.11-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cartID` int(11) NOT NULL AUTO_INCREMENT,
  `Price` float DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (46,NULL,14);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_element`
--

DROP TABLE IF EXISTS `cart_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_element` (
  `userID` int(11) DEFAULT NULL,
  `productID` int(11) NOT NULL,
  `cartID` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_element`
--

LOCK TABLES `cart_element` WRITE;
/*!40000 ALTER TABLE `cart_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'smartphone','http://localhost:8080/613vBlfGyaL._AC_UL320_.jpg'),(2,'Animali','http://localhost:8080/Bayer-Seresto-Collare-Antiparassitario-per-cani-oltre-8-kg-By-scaled.jpg'),(3,'elettrodomestici','http://localhost:8080/lavatrice_beko.jpg'),(4,'cancelleria','http://localhost:8080/F4_ruvidi.jpg'),(5,'Fitness','http://localhost:8080/mass-gainer-900-g-seca_1576x1424_586314_664813.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_element`
--

DROP TABLE IF EXISTS `order_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_element`
--

LOCK TABLES `order_element` WRITE;
/*!40000 ALTER TABLE `order_element` DISABLE KEYS */;
INSERT INTO `order_element` VALUES (16,70,16,1,148.58),(17,71,2,3,159),(18,72,6,2,46.99),(19,73,16,1,148.58),(20,73,32,4,9.67),(21,74,14,1,50.66),(22,75,46,1,128.9),(23,75,10,3,2.3),(24,75,28,3,4.83);
/*!40000 ALTER TABLE `order_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `cartID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (70,14,'2023-01-24 12:59:23',40),(71,14,'2023-01-24 12:59:33',41),(72,14,'2023-01-24 13:06:57',42),(73,14,'2023-01-24 13:11:15',43),(74,14,'2023-01-24 13:39:23',44),(75,14,'2023-01-25 08:45:18',45);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `longDesc` longtext DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
-- Dump della struttura di tabella prova1.products
CREATE TABLE IF NOT EXISTS `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `longDesc` longtext DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella prova1.products: ~50 rows (circa)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`productID`, `categoryID`, `name`, `quantity`, `price`, `photo`, `description`, `longDesc`) VALUES
	(2, 2, 'Fluval 15034 Set Acquario Edge-L- Nero', 15, 159, 'http://localhost:8080/91BNLMIprSL._AC_UL320_.jpg', 'Sistema d\'illuminazione a 21 LED potente,Impostazione luce notturna blu,Efficiente filtro per acquario a 3 livelli', 'Il Fluval Edge 2.0 ha un\'illuminazione LED integrata da 6.500K e diverse funzioni utili, come il foro di alimentazione e '),
	(3, 2, 'Seresto Collare Antiparassitario Cani Grandi', 6, 54.2, 'http://localhost:8080/Bayer-Seresto-Collare-Antiparassitario-per-cani-oltre-8-kg-By-scaled.jpg', 'protezione prolungata, inodore, comodo', 'Il collare Seresto ha un\'azione antiparassitaria contro zecche e pulci specifico per cani di grande taglia, superiori agli 8 kg. Promuove un rilascio di principio attivo prolungato fino ad un massimo di 8 mesi, dopo i quali bisogna procedere con la sostituzione.'),
	(4, 2, 'Royal Canin Maxi Adult', 38, 30.99, 'http://localhost:8080/download.jpeg', 'Alta digeribilità,Sostegno a ossa e articolazioni,Omega 3: EPA - DHA', 'Crocchette per cani Royal Canin Size Maxi Adult. Alimento secco completo per cani adulti di grande taglia, con un peso compreso tra i 26 e i 44 kg, dai 15 mesi ai 5 anni di età.'),
	(5, 2, 'Acana Wild Coast', 23, 106.65, 'http://localhost:8080/acana.jpeg', 'Pelo sano e lucente, Privo di carboidrati ad alto indice glicemico per mantenere stabili i livelli di zucchero nel sangue.,Metabolismo rinforzato', 'Acana Wild Coast propone crocchette per cani di tutte le razze ed età di alta qualità. Ricco di nutrienti proteine e acidi grassi omega-3, Acana Wild Coast contiene pesce pescato in modo sostenibile nelle fredde acque del Pacifico attorno all’Isola di Vancouver Nord e viene consegnato fresco e intero alle nostre cucine, così da essere ricco di bontà e gusto. Il prodotto è disponibile nel formato da 2 KG, 11.4 KG, 17 KG. Acana si rinnova con un nuovo packaging. Potresti ricevere la nuova o la vecchia confezione a seconda della disponibilità a stock.'),
	(6, 2, 'Monge Maxi Adult Ricco di Pollo', 23, 46.99, 'http://localhost:8080/monge-maxi-adult-ricco-di-pollo.jpg', 'prodotto made in Italy, ricco di nutrienti, lo usp anche io per i miei', 'Monge Natural Superpremium Maxi Adult Ricco in Pollo è un alimento completo per cani adulti di taglia grande (32 – 80 kg). Specificamente sviluppato pensando al benessere del tuo cane, grazie alla presenza di sostanze nutritive di qualità frutto della ricerca Made in Italy.'),
	(7, 2, 'Felix Le Ghiottonerie Multipack 80X85G', 20, 34.5, 'http://localhost:8080/felix.jpeg', 'ottimo per gatti, ricco di nutrienti, premiato cibo dell\'anno', 'Felix Le Ghiottonerie è un alimento completo, ideale per soddisfare le esigenze nutrizionali dei gatti adulti. Il Multipack è composto da 80 bustine: 20 al gusto Manzo, 20 bustine al Pollo, 20 al gusto Tonno e 20 al gusto Merluzzo. Questi teneri bocconcini di carne vengono conservati in una gelatina per dare all’alimento un sapore inconfondibile. Alimento umido per gatti adulti 100% completo e bilanciato. Felix Le Ghiottonerie non contiene coloranti, aromi e conservanti artificiali. Prodotto disponibile nel formato multipack 80X85G. Il tuo gatto non saprà resistere al profumo e al gusto del suo nuovo pranzetto!'),
	(8, 2, 'Lettiera Silicio per Gatti Perfect', 11, 13.49, 'http://localhost:8080/perfect.jpeg', 'inodore, lunga durata, facile da pulire', 'Lettiera Silicio per Gatti Perfect è una lettiera igienica per gatti ultra assorbente, anti odore e antiallergica: per questo è tollerata da tutti i gatti. La particolare composizione di Perfect assicura ogni giorno l\'igiene nella toilette del tuo gatto. Quale lettiera non puzza? La lettiera in silicio per gatti Perfect! Infatti si tratta di una lettiera ad azione rapida, che assorbe l\'urina, disidrata le feci e blocca la proliferazione dei batteri, principale causa dei cattivi odori. Come un efficace filtro, cattura gli odori e lascia evaporare il liquido ormai depurato. La lettiera del tuo gatto sarà sempre asciutta! Grazie al suo potere antistatico, dopo l\'utilizzo i granuli non rimangono attaccati alle zampine, evitando così di spargersi fuori dalla vaschetta.'),
	(9, 2, 'Frontline Combo Gatti 6 Pipette', 7, 47.8, 'http://localhost:8080/FRONTLINE-COMBO-GATTI-6-pipette.jpg', 'efficace contro zecche, facile da applicare, lunga durata', 'Frontline Combo Spot On 6 Pipette è un efficace antiparassitario per gattini e gatti adulti che garantisce una protezione ottimale contro le infestazioni di pulci, zecche e pidocchi. Stai cercando l\'antipulci ideale per proteggere il tuo gatto? Frontline Combo gatto è la soluzione per te. A differenza del Frontline tradizionale, la sua azione blocca sviluppo delle uova, delle larve e delle pupe delle pulci, prevenendo così la contaminazione degli ambienti in cui vive il gatto. Infatti, risulta particolarmente indicato nei soggetti che trascorrono del tempo dentro casa. La sua composizione a base di Fipronil e S-Methoprene, già con un singolo trattamento, è la soluzione rapida e definitiva contro le infestazioni da pidocchi, in particolare quelle provocate da Felicola subrostratus, pidocchio masticatore del gatto. Non rinunciare a far vivere in uno stato di benessere il tuo gatto, scegli Frontline Combo Spot On 6 Pipette!'),
	(10, 2, 'Tetra Gold Fish Pro ML.100', 56, 2.3, 'http://localhost:8080/tetra-gold-fish-ml-100.jpg', 'ottimo per pesci, mangime premium, alta qualità', 'Tetra Gold Fish Pro ML.100 Mangime premium nutrizionalmente bilanciato per tutti i pesci rossi. Grazie al processo produttivo a bassa temperatura, Tetra Goldfish Pro è altamente nutriente. Il rapporto proteine/grassi ottimizzato consente un migliore utilizzo dei nutrienti e una conversione superiore del mangime stesso. Per un minore inquinamento dell’acqua e di conseguenza una minore crescita di alghe. Nuova formula Multi Crisp: le macchie gialle contengono krill per esaltare i colori naturali e migliorare il tono muscolare dei pesci. L\'anello rosso esterno contiene tutti i nutrienti essenziali Acidi grassi Omega 3 per una crescita sana. Contiene gamberetti per un\'elevata appetibilità. La formula BioActive garantisce un sistema immunitario sano e aumenta la longevità dei pesci Tutti i mangimi Tetra sono facilmente digeribili, riducono la produzione di escrementi e contribuiscono così a mantenere l\'acqua pulita e cristallina.'),
	(11, 2, 'Aquaart Explorer Line 30L Bianco', 2, 115.49, 'http://localhost:8080/aquaart.jpeg', 'potente luce LED,vetro anteriore ricurvo a 180°,Misure: L 41 x P 28 x H 51 cm', 'Tetra AquaArtLED Explorer acquario da 30L per Gamberi / Pesci rossi Tetra AquaArt Explorer Line è un set di acquario completo per gamberi di fiume con vasca dall’affascinante design a mezzaluna e vetro anteriore ricurvo a 180°. Potente illuminazione LED con modalità luce diurna/notturna Ideale per gamberi di fiume e piante Include il filtro Tetra EasyCrystal Coperchio trasparente in resina acrilica con sportello per alimentazione integrato Acquario con vetro di 5 mm di spessore di alta qualità Tetra AquaArtLED Explorer acquario da 30L Bianco è una perfetta combinazione tra efficenza e bellezza, permette al tuo pesce di vivere sereno e a te di avere uno splendido oggetto di design da mostrare nel tuo salotto.'),
	(12, 2, 'Amtra Filpro Ex 500', 1, 36.5, 'http://localhost:8080/amtra.jpeg', 'Ridotto ingombro e massima efficienza filtrante, silenzioso e affidabile, facile da montare', 'AMTRA FILPRO EX 500 è un filtro esterno professionale per acquari fino a 60 litri.'),
	(13, 2, 'Gabbia per Tartarughe Playpen', 3, 146.99, 'http://localhost:8080/playpen.jpeg', 'grandi dimensioni, ottima qualità, ottimi materiali', 'La Gabbia per Tartarughe Playpen è un recinto per tartarughe pratico e sicuro per ospitare i tuoi amici corazzati. Posiziona Play Pen sul prato e guarda la tua tartaruga nutrirsi di erba benefica. Permette alla tua tartaruga di assorbire i raggi UVB naturali dalla luce del sole, molto importante per la loro crescita e la loro salute. Misure del prodotto: 100,33X49,26X40,64 CM.'),
	(14, 2, 'Tartarughiera Panarea', 10, 50.66, 'http://localhost:8080/T2077694-8023222066946-TARTARUGHIERA-PANAREA-57X40X25-CM.jpg', 'tartarughiera chiusa, interamente in plastica, facile da pulire', 'Tartarughiera in plastica.Dimensioni (cm): 57x 40 x 25 PANAREA , tartarughiera in plastica chiusa. Il coperchio anti-fuga è dotato di apertura con grata nella parte superiore, per un ottimale ricircolo dell\'aria. Il coperchio è completamente rimovibile per facilitarne la pulizia. Tartarughiera completa di ripiano con palme.'),
	(15, 2, 'Pietro', 1, 1e17, 'http://localhost:8080/leone.jpeg', 'è il re della savana, e più bello del cane del vicino, ottima difesa contro i ladri', 'Il leone (Panthera leo Linnaeus, 1758) è un mammifero carnivoro della famiglia dei felidi. Dopo la tigre, è il più grande dei 7 grandi felidi del genere Panthera con alcuni maschi la cui massa corporea supera i 250 kg[4]. Il suo areale è, al 2011, ridotto quasi esclusivamente all\'Africa subsahariana; il continuo impoverimento del suo habitat naturale ed il protrarsi della caccia di frodo ai suoi danni ne fanno una specie vulnerabile secondo la IUCN. La definizione è giustificata da un declino stimato tra il 30 e il 50% nella zona africana nei vent\'anni precedenti[1].'),
	(16, 1, 'Samsung Galaxy A13', 9, 148.58, 'http://localhost:8080/812xwe5lXfL._AC_UL320_.jpg', 'Quattro fotocamere per catturare ancora di più, La batteria che non ti abbandona mai, Tutta la memoria e la velocità di cui hai bisogno', 'Galaxy A13 combina un design morbido al tocco e colori delicati. Le linee affusolate favoriscono una presa confortevole e facilitano l\'utilizzo del dispositivo.'),
	(17, 1, 'Xiaomi Redmi 9A', 2, 119.9, 'http://localhost:8080/81oPj2JzHDL._AC_UL320_.jpg', 'Batteria ad alta capacità da 5000 mAh , Display hd + dotdrop da 6.53 display hd, Processore mediatek helio g25', 'Redmi 9A è un smartphone Android di buon livello, fortemente votato all\'imaging, in grado di soddisfare anche l\'utente più esigente. Sorprende il display Touchscreen da 6.53 pollici che pone questo Redmi al vertice della categoria. Risoluzione di 1600x720 pixel. Sul versante delle funzionalità a questo Redmi 9A non manca davvero nulla. A cominciare dal modulo LTE 4G che permette un trasferimento dati e una navigazione in internet eccellente, passando per la connettività Wi-fi e il GPS.'),
	(18, 1, 'Samsung Galaxy A53 5G', 10, 354.9, 'http://localhost:8080/81FYt2eYf0L._AC_UL320_.jpg', 'Processore octa-core da 5 nm, Batteria da 5000 mAh, Fotocamera da 64 MP', 'Samsung Galaxy A53 è uno smartphone Android con caratteristiche all\'avanguardia che lo rendono una scelta eccellente per ogni tipo di utilizzo, rappresentando uno dei migliori dispositivi mobili mai realizzati. Dispone di un grande display da 6.5 pollici e di una risoluzione da 2400x1080 pixel, fra le più elevate attualmente in circolazione. Le funzionalità offerte da questo Samsung Galaxy A53 sono innumerevoli e tutte al top di gamma. A cominciare dal modulo 5G che permette un trasferimento dati e una navigazione in internet eccellente, passando per la connettività Wi-fi e il GPS.'),
	(19, 1, 'OnePlus Nord CE 5G', 5, 245.48, 'http://localhost:8080/71WvMWQQMZS._AC_UL320_.jpg', 'Processore Snapdragon 750, Disponibile fino a 12GB di Ram, Batteria da 4500 mAh', 'L\'eccellenza di questo OnePlus Nord CE è completata da una fotocamera con un sensore da ben 64 megapixel che permette di scattare foto di alta qualità con una risoluzione di 9238x6928 pixel e di registrare video in 4K alla risoluzione di 3840x2160 pixel. Lo spessore di 7.9mm è veramente contenuto e rende questo OnePlus Nord CE ancora più spettacolare.'),
	(20, 1, 'Blackview A55', 2, 99.99, 'http://localhost:8080/613vBlfGyaL._AC_UL320_.jpg', 'Processore Quadcore a 2GHz, Batteria da 4700 mAh, 3GB di Ram', 'Blackview A55 è uno smartphone con uno schermo da 6.5 pollici con risoluzione 720 x 1600 pixel, rapporto 20:9 e 269 PPI. La tecnologia utilizzata è LCD IPS, con un rapporto schermo/corpo del 81.54%. Grazie ai sensori di luce ambientale e di prossimità, è possibile ottimizzare la luminosità e l’utilizzo del telefono. In termini di design, Blackview A55 ha una dimensione di 164.5 x 76.7 x 9.1 mm e un peso di 196.0 g. È presente la biometria tramite impronta digitale.'),
	(21, 1, 'Apple iPhone 14 Pro', 4, 1339, 'http://localhost:8080/61HHS0HrjpL._AC_UL320_.jpg', 'Processore A16 Bionic, 6GB di Ram, Batteria da 3200 mAh', 'iPhone 14 Pro è uno smartphone con sistema operativo iOS 16, con caratteristiche all\'avanguardia che lo rendono una scelta eccellente per ogni tipo di utilizzo.La certificazione IP68 lo rende impermeabile e per questo è adatto a tutte le situazioni.Il design convince e lo spessore di 7.9 mm regala a questo iPhone 14 Pro un ottimo touch and feel. Dispone di un ottimo display da 6.1 pollici con una risoluzione di 1179 x 2556 pixel con tecnologia LTPO Super Retina XDR OLED, 120Hz, HDR10, Dolby Vision.'),
	(22, 1, 'Apple iPhone 14', 2, 1039, 'http://localhost:8080/61bK6PMOC3L._AC_UL320_.jpg', 'Processore A15 Bionic, Batteria da 3300 mAh, 6GB di Ram', 'iPhone 14 è uno smartphone con sistema operativo iOS 16. La certificazione IP68 lo rende impermeabile e per questo è adatto a tutte le situazioni. Il design è classico e lo spessore di 7.8 mm. Dispone di un display da 6.1 pollici con una risoluzione di 1170 x 2532 pixel con tecnologia Super Retina XDR OLED, HDR10, Dolby Vision'),
	(23, 3, 'BEKO Asciugatrice Slim DRXS712W Young- 7 Kg Classe A+ Pompa di calore', 4, 349.9, 'http://localhost:8080/lavatrice_beko.jpg', 'Classe energetica A+, Dimensioni 60x85x56, Produce 65 decibel di rumore', 'Asciugatrice a libero posizionamento e a carica frontale con una capactià di asciugatura di 7 kg. Con la Partenza ritardata puoi impostare la tua asciugatrice in modo che parta fino a 24 ore dopo, così da usarla quando l’energia costa meno. Dotata di 15 programmi tra cui: Mix, Refresh, Camicie 30, Xpress - Super Short. Classe di efficienza energetica A+. Dimensioni (HxL) : 85x60 cm, Profondità (cm) senza oblò: 46, Profondità (cm) con oblò: 50.8. Colore bianco e porta trasparente.'),
	(24, 3, 'Hisense RW30D4AJ0 - Cantina Vino 32 Bottiglie Capacità 110 L- 39 Decibel- Nero-49 x 48.9 x 84.4 cm', 2, 255.78, 'http://localhost:8080/frigo_vino.jpg', 'Classe energetica A, Dimensioni 490×489×844 mm, Garanzia di due anni', 'Ampio range di temperature da 5°C fino a 20°C per poter adattare l’uso della cantinetta alla conservazione ottimale di ogni tipo di vino. Rossi, bianchi e spumanti potranno essere serviti alla temperatura più appropriata per essere assaporati. Alta efficienza pur mantenendo bassa rumorosità (39dB) e basse vibrazioni, un dettaglio molto importante per garantire al vino un ambiente di conservazione adatto.'),
	(25, 3, 'Hisense RT267D4ABF Frigorifero Doppia Porta a Libera Installazione Modello 2021- 205 -L- Nero', 7, 244.99, 'http://localhost:8080/frigo.jpg', 'Frigorifero doppia porta,Capacità 205 L,Maniglia integrata,Porte reversibili,Illuminazione Led', 'Hisense RT267D4ABF. Frigorifero doppia porta a libera installazione, colore nero, maniglia integrata. Larghezza 55 cm e capacità netta totale 205 L.'),
	(26, 3, 'Hisense I6421C - Piano cottura a induzione Vetroceramica 4 zone di cottura- Nero- 595 × 58 × 520 mm ', 2, 254, 'http://localhost:8080/hisense.jpg', 'Autospegnimento in caso di fuoriuscita, Power management: possibilità di impostare assorbimento massimo del piano, Funzione power boost', 'Rileva istantaneamente la posizione di una padella posizionata sul piano cottura entro 10 secondi e attiva la giusta zona di cottura. Mantenendo una temperatura costante di 42 ° C, la Funzione Scioglimento rende facile padroneggiare la fusione di ingredienti difficili senza bruciarli. Basta premere questo pulsante per mettere in pausa il piano cottura per 10 minuti, Stop & Go quindi riattiva le impostazioni precedenti, facilitando il recupero da dove si era interrotto.'),
	(27, 3, 'Candy OCTA02I Forno Elettrico da Incasso 8 Programmi', 10, 216.25, 'http://localhost:8080/forno_incastro.jpg', '56.8x59.5x59.5 cm ,Acciaio Inox e vetro, Classe A+', 'Linee semplici e design essenziale caratterizzano il Forno da Incasso in Acciaio Inox Candy, progettato per adattarsi perfettamente allo stile della tua cucina. Dai un tocco in più alle tue ricette grazie alla funzione ventilata, studiata per distribuire in maniera omogenea il calore all\'interno del tuo Forno Elettrico Ventilato Candy. Crea dei piatti da vero chef grazie alle tante funzioni speciali di cui dispone il Forno Elettrico Da Incasso Candy'),
	(28, 4, 'BIC Penne Nere a Sfera Cristal Original Punta Media 1 mm Confezione 10 Penne', 23, 4.83, 'http://localhost:8080/bic.jpg', 'Penne a sfera, Colore nero, Diametro 1mm', 'Le penne più vendute del mondo garantiscono sempre una prestazione elevata senza macchiare i fogli. Provviste di tappo per mantenere l\'inchiostro umido sulla punta.'),
	(29, 4, 'BIC Penne Blu a Sfera Cristal Original Punta Media 1 mm Confezione 10 Penne', 18, 4.83, 'http://localhost:8080/bic_blu.jpg', 'Penne a sfera, Colore blu, Diametro 1mm', 'Le penne più vendute del mondo garantiscono sempre una prestazione elevata senza macchiare i fogli. Provviste di tappo per mantenere l\'inchiostro umido sulla punta.'),
	(30, 4, 'Staedtler Mars Plastic 526 53', 21, 2.78, 'http://localhost:8080/gomme_staedtler.jpg', 'Gomma Bianca, 11 x 6.6 x 1.5 cm, Confezione Da Tre', 'Un nome una garanzia queste gomme smacchiano le macchie più persistenti, da anni nell\'ambito scolastico e le preferite dagli studenti.'),
	(31, 4, 'Kores - KE-30: Gomme in PVC Bianche con Rivestimento in Carta', 14, 2.62, 'http://localhost:8080/gomme_kores.jpg', 'Gomma Bianca, 11 x 6.6 x 1.5 cm, Confezione Da Tre', 'Marca di gomme meno conosciute ma non di meno efficaci, sono abbastanza morbide da abbracciare il foglio con la loro superficie ma non abbastanza da lasciare scampo alle macchie'),
	(32, 4, 'Staedtler 120-2BK10D Matita HB2', 32, 9.67, 'http://localhost:8080/matite_staedtler.jpg', 'Grafite, Confezione da 10, Punta mediamente morbida', 'Matite perfette da utilizzare in quasi tutti i campi dal disegno artistico a quello tecnico, punta testata per durare innumerevoli ore di lavoro senza essere temperata.'),
	(33, 4, 'GIOTTO Stilnovo - Astuccio da 24 Matite a Pastello Colorate 3.3mm Colori Intensi', 12, 9.92, 'http://localhost:8080/giotto_matite_colorate.jpg', 'Matite a pastello, 24 colori diversi, compreso di contenitore', 'Le matite colorate Giotto offrono una brilantezza di colori che poco si vede in giro, il pastello consente una colorazione uniforme sul foglio con il minor sforzo.'),
	(34, 4, 'Pigna Monocromo 02298874M Quaderno 4 mm per 4° e 5° Elementare Medie e Superiori Carta 80G/Mq', 11, 14.39, 'http://localhost:8080/quaderni_quadretti.jpg', 'Formato A4, Rigatura 4M Quadretti, Pacco da 10 Pezzi', 'Quaderni a quadretti 4x4 mm perfetti per ogni materia umanistica o scientifica, ottima carta riciclabile.'),
	(35, 4, 'BM BeMore Color Basic 0110605 Quaderno Formato A4 Rigatura 1R Carta 80g/mq Colori Assortiti', 12, 11.1, 'http://localhost:8080/quaderni_righe.jpg', 'Formato A4, Rigatura 4M righe, Pacco da 10 Pezzi', 'Quaderni a righe senza margini disponibili in tante colorazioni per ogni gusto.'),
	(36, 4, 'Evidenziatore - STABILO BOSS ORIGINAL Pastel', 23, 15.54, 'http://localhost:8080/stabilo_evidenziatori.jpg', 'Astuccio da 6, Colori assortiti', 'Questi evidenziatori sono molto utili per sottolineare appunti importanti e grazie alla loro luminosità permettono una facile identificazione dei passi sottolineati più importanti.'),
	(37, 4, 'Fabriano F4 05000597 Album da Disegno Grammatura 200gr/m2', 9, 6.2, 'http://localhost:8080/F4_ruvidi.jpg', 'Formato 24 x 33 cm, Fogli Ruvidi, 20 Fogli', 'Selezione di fogli A4 per il disegno artistico, ruvidi per permettere di dare la giusta pressione alla matita utilizzata.'),
	(38, 4, 'Fabriano F4 05200597 Album da Disegno', 10, 6.2, 'http://localhost:8080/F4_lisci.jpg', 'Formato 24 x 33 cm, Fogli Lisci, 20 fogli', 'Fogli lisci per qualsiasi utilizzo, questo formato è il più usato da studenti e non per il disegno tecnico.'),
	(39, 3, 'Sogo SS-14565 Robot da cucina multifunzione - touch screen bilancia integrata robot da cucina vaporiera mixer - ', 3, 398.99, 'http://localhost:8080/robot_cucina.jpg', '8 modalità automatiche 12 velocità, Acciaio inossidabile, 3.5 litri', 'Goditi piatti elaborati senza complicare la vita: il robot da cucina EasyCOOKpro è estremamente intuitivo e facile da usare, con un touch screen che ti guiderà a passo nel tuo viaggio culinario. Robot da cucina: dimentica tritare, tritare, tritare, tritare e disordine in cucina - avete tutti gli accessori di cui avete bisogno per trasformare facilmente gli alimenti.'),
	(40, 3, 'LG F4WV312S0E Lavatrice a Carica Frontale 12 Kg 1400 Giri/min, Bianco', 4, 320.46, 'http://localhost:8080/lavatrice_lg.jpg', 'Intelligenza Artificiale AI, DD Vapore Igienizzante Motore Inverter Direct, 60x85x61.5 cm', 'Tecnologia AI DD: riconosce i tessuti con 20.000 combinazioni di lavaggio e si prende cura dei tuoi capi. Lavaggio a vapore Steam: l\'azione del vapore igienizza i capi, eliminando germi, batteri e allergeni Agitatori in acciaio inox: garantiscono la massima igiene nel cestello evitando la formazione di muffe e batteri'),
	(41, 3, 'Samsung MS23F300EEK Forno a Microonde Scongelamento rapido e uniforme 23L', 5, 107.99, 'http://localhost:8080/microonde_samsung.jpg', 'Dimensioni 27x48x37, Acciaio inossidabile, Classe A', 'Controlli semplici e intuitivi. La doppia manopola ti permette di selezionare tempo e peso (in grammi) oppure la potenza adatta (in Watt), così puoi scegliere la cottura adatta per i tuoi piatti. Design semplice pratico ed elegante. Il sistema di distribuzione a tre antenne permette alle microonde di raggiungere il cibo da direzioni diverse, per una cottura omogenea e cibi ottimi'),
	(42, 3, 'Lefant M213s Robot Aspirapolvere Lavapavimenti', 8, 159.89, 'http://localhost:8080/robot_aspirapolvere.jpg', 'Acciaio, 150min autonomia, 6D Sensore di Collisione', 'M213s adotta la tecnologia Freemove 3.0. Il corpo con una larghezza di soli 28 cm è ricoperto da 13 sensori, il che rende il robot aspirapolvere più sensibile. Muoviti liberamente nella tua stanza e riduci la possibilità di rimanere bloccato. Aspirazione da 3200 pa	con regolazione a tre stadi.'),
	(43, 1, 'Samsung A22 5G', 5, 235.76, 'http://localhost:8080/A22_samsung.jpg', 'Processore octa-core da 2.1GHz, Schermo 6.6 pollici, 4GB di Ram', 'Samsung Galaxy A22 5G è uno smartphone Android con caratteristiche all\'avanguardia che lo rendono una scelta eccellente per ogni tipo di utilizzo. Dispone di un grande display da 6.6 pollici e di una risoluzione da 2400x1080 pixel, fra le più elevate attualmente in circolazione. Le funzionalità offerte da questo Samsung Galaxy A22 5G sono innumerevoli e al top di gamma. A cominciare dal modulo 5G che permette un trasferimento dati e una navigazione in internet eccellente, passando per la connettività Wi-fi e il GPS. Questo Samsung Galaxy A22 5G è un prodotto con pochi competitor per ciò che riguarda la multimedialità grazie alla fotocamera da ben 48 megapixel che permette di scattare foto di alta qualità con una risoluzione di 8000x6000 pixel e di registrare video in full HD alla risoluzione di 1920x1080 pixel'),
	(44, 1, 'HUAWEI nova 9 SE', 4, 299, 'http://localhost:8080/huawei_nova.jpg', 'Processore octa-core, display 6.78 pollici, Fotocamera da 108 MPx', 'Huawei nova 9 SE è uno smartphone Android con caratteristiche all\'avanguardia che lo rendono una scelta eccellente per ogni tipo di utilizzo, rappresentando uno dei migliori dispositivi mobili mai realizzati. Dispone di un grande display da 6.78 pollici e di una risoluzione da 2388x1080 pixel, fra le più elevate attualmente in circolazione. Le funzionalità offerte da questo Huawei nova 9 SE sono innumerevoli e tutte al top di gamma. A cominciare dal modulo LTE 4G che permette un trasferimento dati e una navigazione in internet eccellente, passando per la connettività Wi-fi e il GPS.'),
	(45, 1, 'XIAOMI Poco M3 Pro 5G', 2, 245.99, 'http://localhost:8080/XIAOMI_poco.jpg', 'Octa-core 2.1GHz, Display da 6.5 pollici, 48 MPx', 'Poco M3 Pro è uno smartphone Android con caratteristiche all\'avanguardia che lo rendono una scelta eccellente per ogni tipo di utilizzo. Dispone di un grande display da 6.5 pollici e di una risoluzione da 2400x1080 pixel, fra le più elevate attualmente in circolazione. Le funzionalità offerte da questo Poco M3 Pro sono innumerevoli e al top di gamma. A cominciare dal modulo 5G che permette un trasferimento dati e una navigazione in internet eccellente, passando per la connettività Wi-fi e il GPS.'),
	(46, 1, 'Motorola moto g22', 3, 128.9, 'http://localhost:8080/motorola_g22.jpg', 'Octa-core 2.1GHz, Display da 6.5 pollici, 50MPx', 'Motorola Moto G22 è uno smartphone Android con caratteristiche all\'avanguardia che lo rendono una scelta eccellente per ogni tipo di utilizzo. Dispone di un grande display da 6.5 pollici con una risoluzione di 1600x720 pixel. Le funzionalità offerte da questo Motorola Moto G22 sono innumerevoli e al top di gamma. A cominciare dal modulo LTE 4G che permette un trasferimento dati e una navigazione in internet eccellente, passando per la connettività Wi-fi e il GPS.'),
	(47, 1, 'OUKITEL WP20 Rugged', 4, 149.99, 'http://localhost:8080/oukitel_op20.jpg', 'Processore quad-core, Dimensioni 166.2 x 81.2 x 15.5 mm, Batteria da 6300 mAh', 'Oggi è la volta dell’ Oukitel WP20. Uno smartphone rugged di fascia economica, sviluppato per assecondare ogni situazione e condizione. Infatti parliamo di un dispositivo costruito in accordo con gli standard internazionali di resistenza ed impermeabilità. Uno smartphone di ultima generazione, in grado di gestire qualsiasi ambito del multimediale. Aggiornato a tutte le tecnologie del momento. A cominciare da un ampio schermo e passando per componenti hardware di buon livello.'),
	(48, 4, 'Casio FX-220PLUS-2 Calcolatrice Scientifica', 5, 10.99, 'http://localhost:8080/casio_scientifica.jpg', 'Con Display A 65.000 Colori, Nero/Bianco, 20.6 x 89.5 x 188.5 mm', 'Calcolatrice scientifica adatta per calcoli dalle medie in avanti, il funzionamento è facile ed intuitivo disponibile in bianco o in nero ma presto usciranno nuovo colorazioni.'),
	(49, 4, 'Casio Fx-Cg50 Calcolatrice Grafica Senza Cas', 3, 117.61, 'http://localhost:8080/casio_grafica.jpg', 'Con Display A 65.000 Colori, Grafica, 20.6 x 89.5 x 188.5 mm', 'Calcolatrice grafica e programmabile per calcoli universitari.'),
	(50, 4, 'Compasso Math Bussolas', 1, 163.96, 'http://localhost:8080/compasso_bussolas.jpg', 'Acciaio inox, Analogico, Compreso di kit estensivo', 'Ottimo compasso il prezzo non rispecchia le vere capacità di questo oggetto incredibile la precisione e la semplicità di utilizzazione.'),
	(51, 5, 'Mutant Mass 2.27kg', 25, 40, 'http://localhost:8080/foto.jpg', '22g di proteine a porzione, 750 calorie, Più di 5g di amminoacidi necessari per la sintesi proteica', 'Mutan Mass integratore post-workout valutato come uno dei migliori gainer al mondo, grazie alla sua miscela di carboidrati e proteine promuove la crescita muscolare');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mario rossi','mariorossi@gmail.com','$2a$10$yAL/aDP4DaGqencgviPGLex2vqCWSOPP4sj25Qoq1iFCmRzkaTNXe','$2a$10$yAL/aDP4DaGqencgviPGLe'),(4,'Giovanni Bianchi','Gbianchi@libero.it','$2a$10$bCMYRbiHdfrhesut3NUW1.8yeb23p9hq0M3NXqapMS3JSAtBlVCcu','$2a$10$bCMYRbiHdfrhesut3NUW1.'),(5,'Giuseppe Verdi','Gverdi@htmail.com','$2a$10$ldc9.O65fwcwYNs6PGHN8uZCQIU1G.toVpPzyWZ1CTQ2vygzEXWL.','$2a$10$ldc9.O65fwcwYNs6PGHN8u'),(6,'Troy Williams','Twilliams@gmail.com','$2a$10$z9ekuXCyt8goIEOECoE7UeBWSWGkSLaUw2FJWrLzRql85bDyFtsiW','$2a$10$z9ekuXCyt8goIEOECoE7Ue'),(8,'lorenzo bolzoni','pppppppppppp@h','$2a$10$FYqDiuG/wmYWRD377sr48ele4eP1du5DpRI9WgvMvE/Vbp0zim5Sy','$2a$10$FYqDiuG/wmYWRD377sr48e'),(9,'pierino','pierino21@gmail.com','$2a$10$rjLrUQEsyJihz8DNv8cdweRco68erYxLgxofpAYRcEZVxncvEpx3K','$2a$10$rjLrUQEsyJihz8DNv8cdwe'),(10,'Giacomo ','jack1998@gmail.com','$2a$10$xBKbueOebwEv6hItw5dBUuiTSLwwsMS99eUqmKcd3ZE0IHFZZurVi','$2a$10$xBKbueOebwEv6hItw5dBUu'),(11,'lollo','lollo1999@gmail.com','$2a$10$OINpyJSzmvFk6.xkMIynXe05C5sJa8xV/a1Wdh6Gfbpg6yVp8qiPq','$2a$10$OINpyJSzmvFk6.xkMIynXe'),(12,'Paolo','paolo@paolo.it','$2a$10$WsXtTYWLxrUgSgA/Mw.m4eUWlsYgCgimThxYXBn2zUO69g0XdAkG.','$2a$10$WsXtTYWLxrUgSgA/Mw.m4e'),(13,'riccardo','richi@richi.it','$2a$10$mi6OIZouJW0/oQdJ2Hf77Ou0XaGtkfrVwBGPvLUhEy00ev8MJNNX.','$2a$10$mi6OIZouJW0/oQdJ2Hf77O'),(14,'giovanni bianchi','gbianchi@prova.it','$2a$10$Bz5ddVNX81HSL47wLDL30ujHPnOnVG.8/s5J5Hj5e6Riw2m/DAV8u','$2a$10$Bz5ddVNX81HSL47wLDL30u');
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

-- Dump completed on 2023-01-26  8:43:01
