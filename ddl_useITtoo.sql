--  als een product verwijderd wordt moet voorraad ook verwijderd worden staat nu standaard op restrict 
-- ik heb al wat constraints toegevoegd, 

-- voorkomt een foutmelding als de database al bestaat, en zorgt ervoor dat de database wordt geselecteerd voor gebruik
CREATE DATABASE IF NOT EXISTS useITtooDB 
-- dit ondersteunt ook de juiste tekenset voor het opslaan van speciale tekens in de database, zoals emoji's, soms handig in de recepten of productomschrijvingen
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE useITtooDB;

-- ============================================================
-- SOFT DELETE: in plaats van rijen fysiek verwijderen, markeer je ze als verwijderd met een timestamp.
-- soft delete: NULL = actief, timestamp = verwijderd
    -- `deleted_at` TIMESTAMP NULL DEFAULT NULL
-- In je applicatie filter je dan altijd op WHERE deleted_at IS NULL om alleen actieve rijen op te halen.
-- ============================================================

-- ingredienten en voorraad hebben geen eigen ID's, want ze bestaan alleen in relatie tot een product en/of recept.
CREATE TABLE `recept` (
    `recept_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `naam` VARCHAR(100) NOT NULL, -- een recept zonder naam is niet te identificeren
    `instructie` TEXT,
    `omschrijving` TEXT,
    `foto_url` VARCHAR(500),
    -- soft delete: NULL = actief, timestamp = verwijderd
    `deleted_at` TIMESTAMP NULL DEFAULT NULL
);


CREATE TABLE `product` (
    `product_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `naam` VARCHAR(100) NOT NULL,
    `omschrijving` TEXT,
    `prijs` DECIMAL(10, 2) CHECK (`prijs` >= 0),
    `foto_url` VARCHAR(500),
    `leverancier` VARCHAR(255),
    `verkoop_gewicht` VARCHAR(100),
    -- soft delete: NULL = actief, timestamp = verwijderd
    `deleted_at` TIMESTAMP NULL DEFAULT NULL
);

-- crosstable voor de veel-op-veel relatie tussen producten en recepten vormen de ingrediënten van een recept.
CREATE TABLE `ingredienten` (
    `product_id` INT NOT NULL,
    `recept_id` INT NOT NULL,
    `hoeveelheid` VARCHAR(100),
    `deleted_at` TIMESTAMP NULL DEFAULT NULL, -- soft delete veld voor deze relatie
    PRIMARY KEY (`product_id`, `recept_id`),
    FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`),
    FOREIGN KEY (`recept_id`) REFERENCES `recept`(`recept_id`)
);

-- ============================================================
-- 1-op-1 RELATIE: product <-> voorraad
-- 
-- Best practice bij een 1-op-1 relatie:
-- Plaats de FK slechts in ÉÉN tabel, niet in beide.
-- Een circulaire FK (in beide tabellen) zorgt ervoor dat je
-- nooit een eerste rij kunt aanmaken zonder de ander al te
-- hebben — dit is een kip-en-ei probleem.
--
-- De FK komt in de "afhankelijke" tabel: voorraad.
-- Een voorraad bestaat omwille van een product,
-- niet andersom.
--
-- product_id wordt hier gebruikt als PRIMARY KEY in plaats van
-- een aparte voorraad_id. Dit dwingt de 1-op-1 relatie hard af:
-- MySQL staat per definitie maar één rij per PK-waarde toe,
-- dus elk product kan maximaal één voorraad-rij hebben.
-- ============================================================

CREATE TABLE `voorraad` (
    -- product_id is zowel PK als FK: koppelt aan product én dwingt 1-op-1 af
    `product_id` INT NOT NULL PRIMARY KEY,
    `aantal` INT NOT NULL CHECK (`aantal` >= 0),
    `status` ENUM('op voorraad', 'bijna op', 'uitverkocht'),
    -- soft delete: NULL = actief, timestamp = verwijderd
    `deleted_at` TIMESTAMP NULL DEFAULT NULL,

    FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`)
);

-- naam als PRIMARY KEY — dit betekent dat twee kortingsacties nooit dezelfde naam mogen hebben. 
-- Dat is op zich logisch, maar nadelen zijn:
-- Als je de naam wilt wijzigen, moet je alle FK-referenties in andere tabellen ook updaten
-- VARCHAR(500) als PK is trager dan een INT
-- Best practice is een aparte kortingsactie_id als PK:
CREATE TABLE `kortingsactie` (
    `kortingsactie_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `naam` VARCHAR(500) NOT NULL UNIQUE, -- unieke naam, maar niet als PK ivm performance en flexibiliteit bij typefouten of wijzigingen
    `omschrijving` TEXT,
    `kortingspercentage` TINYINT DEFAULT 0 CHECK (`kortingspercentage` >= 0 AND `kortingspercentage` <= 100) , -- percentage tussen 0 en 100, standaard 0
    `kortingsbedrag` DECIMAL(10, 2) DEFAULT 0.00 CHECK (`kortingsbedrag` >= 0.00), -- vast bedrag korting, standaard 0.00
    `startdatum` DATE,
    `einddatum` DATE CHECK (`einddatum` >= `startdatum`),
    `actief` BOOLEAN,
    -- soft delete: NULL = actief, timestamp = verwijderd
    `deleted_at` TIMESTAMP NULL DEFAULT NULL,

    -- afdwingen dat er altijd precies één kortingsvorm actief is
    CONSTRAINT chk_kortingsvorm CHECK (
        (`kortingspercentage` > 0 AND `kortingsbedrag` = 0.00) OR
        (`kortingsbedrag` > 0.00 AND `kortingspercentage` = 0)
    )
);

-- crosstable voor de veel-op-veel relatie tussen producten en kortingsacties
CREATE TABLE `product_kortingsactie` (
    `product_id` INT NOT NULL,
    `kortingsactie_id` INT NOT NULL,
    `deleted_at` TIMESTAMP NULL DEFAULT NULL, -- soft delete veld voor deze relatie
    PRIMARY KEY (`product_id`, `kortingsactie_id`),
    FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`),
    FOREIGN KEY (`kortingsactie_id`) REFERENCES `kortingsactie`(`kortingsactie_id`)
);


-- hier kiezen we niet voor een aparte categorie_id als PK, 
-- omdat de categorienaam zelf al uniek is en vaak als identifier wordt gebruikt. 
-- de categorie is minder fout gevoelig dan een kortingsactie naam, dus dat is minder problematisch.
CREATE TABLE `categorie` (
  `categorie` VARCHAR(100) NOT NULL PRIMARY KEY,
  `omschrijving` TEXT,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL -- soft delete veld
);

-- crosstable voor de veel-op-veel relatie tussen producten en categorieën
CREATE TABLE `product_categorie` (
  `categorie` VARCHAR(100) NOT NULL,
  `product_id` INT NOT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL, -- soft delete veld voor deze relatie

  PRIMARY KEY (`categorie`, `product_id`),
  FOREIGN KEY (`categorie`) REFERENCES `categorie`(`categorie`),
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`)
);
-- hier kiezen we niet voor een aparte categorie_id als PK, 
-- omdat de categorienaam zelf al uniek is en vaak als identifier wordt gebruikt.
-- de tag is minder fout gevoelig dan een kortingsactie naam, dus dat is minder problematisch.
CREATE TABLE `tag` (
  `tag` VARCHAR(100) NOT NULL PRIMARY KEY,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL -- soft delete veld
);

-- crosstable voor de veel-op-veel relatie tussen producten en tags
CREATE TABLE `product_tag` (
  `product_id` INT NOT NULL,
  `tag` VARCHAR(100) NOT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL, -- soft delete veld voor deze relatie

  PRIMARY KEY (`product_id`, `tag`),
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`),
  FOREIGN KEY (`tag`) REFERENCES `tag`(`tag`)
);

CREATE TABLE `account` (
    `account_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `gebruikersnaam` VARCHAR(255) NOT NULL UNIQUE CHECK (LENGTH(gebruikersnaam) >= 3), -- gebruikersnaam moet minimaal 3 tekens lang zijn
    -- bcrypt hashes zijn altijd minimaal 60 tekens lang ($2a$, $2b$, $2y$ varianten)
    -- deze check vangt fouten op als de applicatielaag een ongehashte waarde doorgeeft
    `wachtwoord_hash` VARCHAR(500) NOT NULL CHECK (LENGTH(wachtwoord_hash) >= 60),
    `voornaam` VARCHAR(100),
    `achternaam` VARCHAR(100),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `geboortedatum` DATE NOT NULL, 
    `telefoon` VARCHAR(20),
    `deleted_at` TIMESTAMP NULL DEFAULT NULL
);

-- triggers gemaakt omdat checks met curdate() niet werken in een CHECK constraint, want die worden alleen bij het aanmaken van de tabel geëvalueerd, niet bij elke rij. Dus we gebruiken triggers om dit dynamisch te controleren bij elke insert of update.
-- trigger op invoer geboortedatum om te controleren of de gebruiker minimaal 18 jaar oud is
DELIMITER //
CREATE TRIGGER account_check_geboortedatum_ins
BEFORE INSERT ON account
FOR EACH ROW
BEGIN
  IF NEW.geboortedatum > DATE_SUB(CURDATE(), INTERVAL 18 YEAR) THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Persoon moet minimaal 18 jaar zijn';
  END IF;
END//

-- trigger op update geboortedatum om te controleren of de gebruiker minimaal 18 jaar oud is
CREATE TRIGGER account_check_geboortedatum_update
BEFORE UPDATE ON account
FOR EACH ROW
BEGIN
  IF NEW.geboortedatum > DATE_SUB(CURDATE(), INTERVAL 18 YEAR) THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Persoon moet minimaal 18 jaar zijn';
  END IF;
END//
DELIMITER ;

CREATE TABLE `klant` (
    `account_id` INT NOT NULL PRIMARY KEY,
    `deleted_at` TIMESTAMP NULL DEFAULT NULL,
    `startdatum_lidmaatschap` DATE,

    FOREIGN KEY (`account_id`) REFERENCES `account`(`account_id`)
);

CREATE TABLE `beheer` (
    `account_id` INT NOT NULL PRIMARY KEY,
    `rol` ENUM('voorraadbeheerder', 'klantenservice') NOT NULL,
    `deleted_at` TIMESTAMP NULL DEFAULT NULL,

    FOREIGN KEY (`account_id`) REFERENCES `account`(`account_id`)
);

CREATE TABLE `adres` (
    `adres_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `straat` VARCHAR(255) NOT NULL,
    `huisnummer` VARCHAR(20) NOT NULL,
    `postcode` VARCHAR(6) NOT NULL,
    `plaats` VARCHAR(255) NOT NULL,
    `land` VARCHAR(255) NOT NULL,
    `deleted_at` TIMESTAMP NULL DEFAULT NULL
);

-- crosstabel tussen klant en adres, want een klant kan meerdere adressen hebben (bijvoorbeeld thuis en werk), en een adres kan ook aan meerdere klanten gekoppeld zijn (bijvoorbeeld gezinsleden die op hetzelfde adres wonen)
CREATE TABLE `klant_adres` (
    `account_id` INT NOT NULL,
    `adres_id` INT NOT NULL,
    `type` ENUM('thuis', 'werk', 'factuur', 'bezorg') NOT NULL, 
    `deleted_at` TIMESTAMP NULL DEFAULT NULL, -- soft delete veld voor deze relatie
    PRIMARY KEY (`account_id`, `adres_id`),
    FOREIGN KEY (`account_id`) REFERENCES `klant`(`account_id`),
    FOREIGN KEY (`adres_id`) REFERENCES `adres`(`adres_id`)
);

-- ============================================================
-- WINKELWAGEN
-- Een klant kan producten in de winkelwagen plaatsen vóór het afrekenen.
-- De winkelwagen bestaat los van een bestelling: pas wanneer de klant op
-- "Bestellen" klikt, wordt er een bestelling aangemaakt op basis van de
-- winkelwagen-regels. Daarna worden de winkelwagen-regels verwijderd.
--
-- Stroom in de applicatielaag:
--   1. Klant voegt product toe  → INSERT in winkelwagen_regel
--   2. Klant klikt "Bestellen"  →
--        a. INSERT in bestelling   (met bezorgkosten, totaalprijs, adres)
--        b. INSERT in bestel_regel (kopieer uit winkelwagen, sla huidige prijs op)
--        c. DELETE uit winkelwagen_regel (winkelwagen leegmaken)
-- ============================================================

CREATE TABLE `winkelwagen_regel` (
  `winkelwagen_regel_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  -- verwijst naar klant zodat beheeraccounts geen winkelwagen kunnen hebben
  `account_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `aantal` INT NOT NULL CHECK (`aantal` >= 1), -- minimaal 1, anders heeft de winkelwagen-regel geen zin
  -- bijhouden wanneer het product is toegevoegd, handig voor het laten verlopen van oude winkelwagens
  `toegevoegd_op` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  -- voorkomt dat hetzelfde product twee keer als aparte rij wordt toegevoegd
  -- de applicatie moet bij een dubbel product de bestaande rij updaten (aantal + 1)
  UNIQUE (`account_id`, `product_id`),
  FOREIGN KEY (`account_id`) REFERENCES `klant`(`account_id`),
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`)
);

-- ============================================================
-- BESTELLING
-- Een bestelling wordt pas aangemaakt op het moment dat de klant afrekent.
-- De bezorgkosten en totaalprijs worden op dat moment berekend en opgeslagen.
-- ============================================================

CREATE TABLE `bestelling` (
  `bestelling_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `account_id` INT NOT NULL,
  `bestel_datum` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `bezorg_kosten` DECIMAL(10, 2) NOT NULL CHECK (`bezorg_kosten` >= 0),
  `totaal_prijs_bestelling` DECIMAL(10, 2) NOT NULL CHECK (`totaal_prijs_bestelling` >= 0),
  `status` ENUM('betaald', 'in behandeling', 'verzonden', 'geleverd', 'geannuleerd', 'retour') NOT NULL,
  `adres_id` INT NOT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL, -- soft delete veld
  -- verwijst naar klant ipv account zodat beheeraccounts geen bestellingen kunnen plaatsen
  FOREIGN KEY (`account_id`) REFERENCES `klant`(`account_id`),
  FOREIGN KEY (`adres_id`) REFERENCES `adres`(`adres_id`)
);

-- ============================================================
-- BESTEL_REGEL
-- Een bestel_regel is één productregel binnen een bevestigde bestelling.
-- bestelling_id is NOT NULL: een bestel_regel hoort altijd bij een bestelling.
-- De winkelwagen heeft zijn eigen tabel (winkelwagen_regel) zodat de twee
-- concepten — "in de kar leggen" en "besteld hebben" — gescheiden blijven.
--
-- prijs_per_stuk wordt opgeslagen op het moment van bestellen, zodat een
-- latere prijswijziging van het product de historische bestelling niet beïnvloedt.
-- ============================================================

CREATE TABLE `bestel_regel` (
  `bestel_regel_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `bestelling_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `aantal` INT NOT NULL CHECK (`aantal` >= 1), -- minimaal 1, anders heeft de bestel_regel geen zin
  -- prijs vastgelegd op moment van bestellen, los van de huidige productprijs
  `prijs_per_stuk` DECIMAL(10, 2) NOT NULL,

  -- voorkomt dat hetzelfde product twee keer als aparte regel in dezelfde bestelling staat
  UNIQUE (`bestelling_id`, `product_id`),
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`),
  FOREIGN KEY (`bestelling_id`) REFERENCES `bestelling`(`bestelling_id`)
);


CREATE TABLE `review` (
  `review_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `account_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `beoordeling` TINYINT NOT NULL CHECK (beoordeling >= 1 AND beoordeling <= 10),
  `review_tekst` TEXT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL, -- soft delete veld
  `admin_reactie` TEXT,
  `admin_reactie_datum` TIMESTAMP NULL DEFAULT NULL,
  `admin_reactie_account_id` INT DEFAULT NULL,

  -- een klant kan per product maar één review schrijven
  UNIQUE (`account_id`, `product_id`),

  -- De drie admin_reactie velden horen bij elkaar: óf alle drie zijn gevuld, óf geen van alle.
  -- Zonder deze constraint kun je situaties krijgen zoals een reactiedatum zonder tekst,
  -- of een tekst zonder te weten welke beheerder hem heeft geplaatst.
  -- De constraint dwingt af dat een admin_reactie altijd volledig of helemaal niet aanwezig is.
  CONSTRAINT chk_admin_reactie CHECK (
    (admin_reactie IS NULL AND admin_reactie_account_id IS NULL AND admin_reactie_datum IS NULL)
    OR
    (admin_reactie IS NOT NULL AND admin_reactie_account_id IS NOT NULL AND admin_reactie_datum IS NOT NULL)
  ),

  FOREIGN KEY (`account_id`) REFERENCES `klant`(`account_id`),
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`),
  FOREIGN KEY (`admin_reactie_account_id`) REFERENCES `beheer`(`account_id`)
);

CREATE TABLE `log_regel` (
  `log_regel_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `account_id` INT NOT NULL,
  `log_tekst` TEXT,
  `soort_log` ENUM('inlog', 'actie', 'fout') NOT NULL,
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (`account_id`) REFERENCES `account`(`account_id`)
);

/*--------------------------
--VIEWS
--------------------------*/
-- KLANTINFORMATIE
CREATE VIEW v_klant_account AS 
SELECT 
  acc.account_id, 
  acc.email, 
  acc.gebruikersnaam, 
  acc.voornaam, 
  acc.achternaam, 
  acc.created_at, 
  acc.geboortedatum, 
  acc.telefoon
FROM account acc
JOIN klant
  ON klant.account_id = acc.account_id
WHERE acc.deleted_at IS NULL
  AND klant.deleted_at IS NULL;

CREATE VIEW v_klant_adres AS
SELECT
  klant_adres.account_id, 
  klant_adres.adres_id, 
  klant_adres.type, 
  adres.straat, 
  adres.huisnummer, 
  adres.postcode, 
  adres.plaats, 
  adres.land
FROM klant_adres
JOIN adres
  ON adres.adres_id = klant_adres.adres_id
JOIN klant
  ON klant.account_id = klant_adres.account_id
WHERE klant_adres.deleted_at IS NULL
  AND adres.deleted_at IS NULL
  AND klant.deleted_at IS NULL;


-- account_id staat in de SELECT zodat de applicatie kan filteren op de ingelogde klant.
-- Zonder account_id zouden klanten via een directe query alle bestellingen van alle klanten kunnen zien,
-- want MySQL ondersteunt geen row-level security. De applicatie gebruikt account_id om alleen
-- de bestellingen van de ingelogde klant op te halen (WHERE account_id = [ingelogd account]).
CREATE OR REPLACE VIEW v_klant_bestellingen AS
SELECT
    bestelling.account_id,
    bestelling.bestelling_id,
    bestelling.bestel_datum,
    bestelling.bezorg_kosten,
    bestelling.totaal_prijs_bestelling,
    bestelling.status,
    bestelling.adres_id
FROM bestelling
JOIN klant
    ON klant.account_id = bestelling.account_id
WHERE bestelling.deleted_at IS NULL
  AND klant.deleted_at IS NULL;


-- BESTELLINGEN
CREATE VIEW v_product_voorraad_status AS
SELECT
    product.product_id,
    product.naam AS product_naam,
    product.prijs,
    voorraad.product_id AS voorraad_product_id,
    voorraad.aantal,
    voorraad.status
FROM product
LEFT JOIN voorraad
    ON voorraad.product_id = product.product_id
    AND voorraad.deleted_at IS NULL   -- ← hier, niet in WHERE
WHERE product.deleted_at IS NULL;

CREATE VIEW v_bestel_regel AS
SELECT
    bestel_regel.bestel_regel_id,
    bestel_regel.bestelling_id,
    bestel_regel.product_id,
    product.naam,
    bestel_regel.aantal,
    bestel_regel.prijs_per_stuk
FROM bestel_regel
JOIN product
  ON product.product_id = bestel_regel.product_id;

-- MEDEWERKER BESTELLING OVERZICHT
CREATE VIEW v_bestelling_overzicht AS
SELECT
    bestelling.bestelling_id,
    bestelling.bestel_datum,
    bestelling.status,
    bestelling.bezorg_kosten,
    bestelling.totaal_prijs_bestelling,
    bestelling.account_id,
    bestelling.adres_id,
    account.email,
    account.voornaam,
    account.achternaam,
    adres.straat,
    adres.huisnummer,
    adres.postcode,
    adres.plaats,
    adres.land
FROM bestelling
JOIN account
  ON account.account_id = bestelling.account_id
JOIN adres
  ON adres.adres_id = bestelling.adres_id
WHERE bestelling.deleted_at IS NULL
  AND account.deleted_at IS NULL
  AND adres.deleted_at IS NULL;

-- ACTIEVE PRODUCTEN
CREATE VIEW v_actieve_producten AS
SELECT
  product.product_id,
  product.naam,
  product.omschrijving,
  product.prijs,
  product.foto_url,
  product.leverancier,
  product.verkoop_gewicht
FROM product
WHERE product.deleted_at IS NULL;



-- Lopende acties
CREATE VIEW v_lopende_kortingsacties AS
SELECT
  kortingsactie.kortingsactie_id,
  kortingsactie.naam,
  kortingsactie.omschrijving,
  kortingsactie.kortingspercentage,
  kortingsactie.kortingsbedrag,
  kortingsactie.startdatum,
  kortingsactie.einddatum
FROM kortingsactie
WHERE kortingsactie.deleted_at IS NULL
  AND kortingsactie.actief = TRUE
  AND CURDATE() BETWEEN kortingsactie.startdatum AND kortingsactie.einddatum;

-- Product - kortingsactie link
CREATE VIEW v_product_kortingen AS
SELECT
  product.product_id,
  product.naam AS product_naam,
  kortingsactie.kortingsactie_id,
  kortingsactie.naam AS kortingsactie_naam,
  kortingsactie.kortingspercentage,
  kortingsactie.kortingsbedrag,
  kortingsactie.startdatum,
  kortingsactie.einddatum,
  kortingsactie.actief
FROM product_kortingsactie
JOIN product
  ON product.product_id = product_kortingsactie.product_id
JOIN kortingsactie
  ON kortingsactie.kortingsactie_id = product_kortingsactie.kortingsactie_id
WHERE product.deleted_at IS NULL
  AND kortingsactie.deleted_at IS NULL
  AND product_kortingsactie.deleted_at IS NULL;

-- Product with categories and tags
-- GROUP_CONCAT voorkomt een Cartesian product: zonder GROUP BY zou een product met
-- twee categorieën én twee tags vier rijen opleveren (2x2) in plaats van één.
-- Door categorieën en tags samen te voegen tot kommalijsten krijg je altijd één rij per product.
-- De deleted_at filters op de crosstabellen (product_categorie, product_tag) zorgen ervoor
-- dat soft-deleted koppelingen niet meer verschijnen, ook als het product zelf nog actief is.
CREATE VIEW v_product_categorie_tag AS
SELECT
  product.product_id,
  product.naam AS product_naam,
  GROUP_CONCAT(DISTINCT categorie.categorie ORDER BY categorie.categorie SEPARATOR ', ') AS categorieen,
  GROUP_CONCAT(DISTINCT tag.tag ORDER BY tag.tag SEPARATOR ', ') AS tags
FROM product
LEFT JOIN product_categorie
    ON product_categorie.product_id = product.product_id
    AND product_categorie.deleted_at IS NULL
LEFT JOIN categorie
    ON categorie.categorie = product_categorie.categorie
    AND categorie.deleted_at IS NULL
LEFT JOIN product_tag
    ON product_tag.product_id = product.product_id
    AND product_tag.deleted_at IS NULL
LEFT JOIN tag
    ON tag.tag = product_tag.tag
    AND tag.deleted_at IS NULL
WHERE product.deleted_at IS NULL
GROUP BY product.product_id, product.naam;

-- MEDEWERKER -- LOG OVERVIEW
CREATE VIEW v_logregel_overzicht AS
SELECT
    log_regel.log_regel_id,
    log_regel.account_id,
    account.gebruikersnaam,
    log_regel.log_tekst,
    log_regel.soort_log,
    log_regel.timestamp
FROM log_regel
JOIN account
    ON account.account_id = log_regel.account_id;

-- MEDEWERKER -- ACCOUNT OVERVIEW
CREATE VIEW v_actieve_accounts AS
SELECT
  account_id,
  email,
  gebruikersnaam,
  voornaam,
  achternaam,
  created_at,
  geboortedatum,
  telefoon
FROM account
WHERE deleted_at IS NULL;

-- ============================================================
-- deze notitie staat erin omdat het een leerdocument is en we graag willen
-- Voorstel tot loggen
-- Dan voeg je een aparte kortingsactie_log tabel toe die elke wijziging vastlegt:
-- sqlCREATE TABLE `kortingsactie_log` (
--     `log_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     -- welke kortingsactie werd gewijzigd
--     `kortingsactie_naam` VARCHAR(500) NOT NULL,
--     -- wat was de actie: UPDATE of SOFT_DELETE
--     `actie` ENUM('UPDATE', 'SOFT_DELETE') NOT NULL,
--     -- de oude waarden vóór de wijziging
--     `oude_kortingspercentage` DECIMAL(5, 2),
--     `oude_startdatum` DATE,
--     `oude_einddatum` DATE,
--     `oude_actief` BOOLEAN,
--     -- wanneer en door wie
--     `gewijzigd_op` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
--     `gewijzigd_door` VARCHAR(100)
-- );
-- Dit werkt als volgt: vóór elke UPDATE of soft delete op kortingsactie sla je de oude waarden op in log. Dat kan handmatig in je applicatiecode, of automatisch via een MySQL trigger:
-- sql-- trigger die automatisch een log-rij aanmaakt bij elke UPDATE

-- -- tijdelijk ander scheidingsteken zodat MySQL de ; in de trigger body niet als einde ziet
-- DELIMITER $$
-- CREATE TRIGGER `kortingsactie_before_update`
-- BEFORE UPDATE ON `kortingsactie`
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO `kortingsactie_log` (
--         `kortingsactie_naam`,
--         `actie`,
--         `oude_kortingspercentage`,
--         `oude_startdatum`,
--         `oude_einddatum`,
--         `oude_actief`
--     ) VALUES (
--         OLD.naam,
--         CASE WHEN NEW.deleted_at IS NOT NULL AND OLD.deleted_at IS NULL 
--              THEN 'SOFT_DELETE' ELSE 'UPDATE' END,
--         OLD.kortingspercentage,
--         OLD.startdatum,
--         OLD.einddatum,
--         OLD.actief
--     );
-- END$$

-- -- zet het scheidingsteken terug naar ;
-- DELIMITER ;
-- Zo heb je altijd een volledige geschiedenis van alle wijzigingen. 

-- DELIMITER $$ → vertel MySQL dat $$ nu het afsluitteken is
-- BEGIN ... END$$ → de volledige trigger body
-- DELIMITER ; → zet het terug naar normaal
-- ============================================================



-- Alle checks en constraints zijn geïmplementeerd in de tabeldefinities hierboven.