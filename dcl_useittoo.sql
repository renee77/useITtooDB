-- =============================================================
-- DCL useITtooDB
-- Data Control Language: gebruikers, rollen en rechten
-- =============================================================
--
-- ARCHITECTUURKEUZE — drie soorten databasegebruikers:
--
--   1. KLANT-ACCOUNTS (individueel per klant, tijdelijk)
--      Uitsluitend leesrechten (SELECT). De backend-applicatie
--      authenticateert klanten zelf en filtert data op account_id
--      in de applicatielaag. Individuele DB-accounts per klant zijn
--      daarmee in productie overbodig. Ze staan hier uitsluitend voor
--      de volledigheid van de opdracht en worden bij ingebruikname
--      verwijderd.
--
--   2. APPLICATIEGEBRUIKER (één gedeelde gebruiker voor de backend)
--      De backend-applicatie communiceert uitsluitend via deze
--      gebruiker met de database. Zij heeft ruime schrijfrechten
--      (SELECT, INSERT, UPDATE), DELETE alleen op winkelwagen_regel
--      (leegmaken na afrekenen), en op log_regel uitsluitend
--      SELECT + INSERT (audit trail mag nooit worden gewijzigd).
--
--   3. MEDEWERKER-ACCOUNTS (individueel per medewerker, naar rol)
--      Medewerkers loggen direct in op de database, bijvoorbeeld
--      via een beheertool. Rechten zijn afgestemd op de rol:
--      voorraadbeheerder of klantenservice.
--
-- =============================================================


-- =============================================================
-- 1. KLANT-ACCOUNTS
-- Alleen leesrechten — schrijfacties lopen via de applicatiegebruiker.
-- Klanten krijgen SELECT op de views die hun eigen gegevens tonen,
-- plus SELECT op de productvermeldingen en het receptenaanbod
-- zodat zij de webshop kunnen doorbladeren.
-- =============================================================

DROP USER IF EXISTS 'jan.vermeer'@'localhost';
CREATE USER 'jan.vermeer'@'localhost' IDENTIFIED BY 'Klant2026!Jan';
-- Eigen account- en adresgegevens inzien
GRANT SELECT ON useITtooDB.v_klant_account TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'jan.vermeer'@'localhost';
-- Eigen bestellingen en bestelregels inzien
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'jan.vermeer'@'localhost';
-- Eigen winkelwagen inzien
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'jan.vermeer'@'localhost';
-- Productaanbod, voorraadstatus, recepten, categorieën en acties inzien
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'jan.vermeer'@'localhost';
-- Eigen reviews inzien
GRANT SELECT ON useITtooDB.review TO 'jan.vermeer'@'localhost';

DROP USER IF EXISTS 'sara.jansen'@'localhost';
CREATE USER 'sara.jansen'@'localhost' IDENTIFIED BY 'Klant2026!Sara';
GRANT SELECT ON useITtooDB.v_klant_account TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.review TO 'sara.jansen'@'localhost';

DROP USER IF EXISTS 'mark.devries'@'localhost';
CREATE USER 'mark.devries'@'localhost' IDENTIFIED BY 'Klant2026!Mark';
GRANT SELECT ON useITtooDB.v_klant_account TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.review TO 'mark.devries'@'localhost';

DROP USER IF EXISTS 'lisa.bakker'@'localhost';
CREATE USER 'lisa.bakker'@'localhost' IDENTIFIED BY 'Klant2026!Lisa';
GRANT SELECT ON useITtooDB.v_klant_account TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.review TO 'lisa.bakker'@'localhost';

DROP USER IF EXISTS 'tom.smit'@'localhost';
CREATE USER 'tom.smit'@'localhost' IDENTIFIED BY 'Klant2026!Tom';
GRANT SELECT ON useITtooDB.v_klant_account TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.review TO 'tom.smit'@'localhost';

DROP USER IF EXISTS 'emma.meijer'@'localhost';
CREATE USER 'emma.meijer'@'localhost' IDENTIFIED BY 'Klant2026!Emma';
GRANT SELECT ON useITtooDB.v_klant_account TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.review TO 'emma.meijer'@'localhost';

DROP USER IF EXISTS 'noah.mulder'@'localhost';
CREATE USER 'noah.mulder'@'localhost' IDENTIFIED BY 'Klant2026!Noah';
GRANT SELECT ON useITtooDB.v_klant_account TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.review TO 'noah.mulder'@'localhost';

DROP USER IF EXISTS 'olivia.dejong'@'localhost';
CREATE USER 'olivia.dejong'@'localhost' IDENTIFIED BY 'Klant2026!Olivia';
GRANT SELECT ON useITtooDB.v_klant_account TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.review TO 'olivia.dejong'@'localhost';

DROP USER IF EXISTS 'lucas.vandenberg'@'localhost';
CREATE USER 'lucas.vandenberg'@'localhost' IDENTIFIED BY 'Klant2026!Lucas';
GRANT SELECT ON useITtooDB.v_klant_account TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.review TO 'lucas.vandenberg'@'localhost';

DROP USER IF EXISTS 'mia.prins'@'localhost';
CREATE USER 'mia.prins'@'localhost' IDENTIFIED BY 'Klant2026!Mia';
GRANT SELECT ON useITtooDB.v_klant_account TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.review TO 'mia.prins'@'localhost';

DROP USER IF EXISTS 'daan.kok'@'localhost';
CREATE USER 'daan.kok'@'localhost' IDENTIFIED BY 'Klant2026!Daan';
GRANT SELECT ON useITtooDB.v_klant_account TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.review TO 'daan.kok'@'localhost';

DROP USER IF EXISTS 'zoe.bos'@'localhost';
CREATE USER 'zoe.bos'@'localhost' IDENTIFIED BY 'Klant2026!Zoe';
GRANT SELECT ON useITtooDB.v_klant_account TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.winkelwagen_regel TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.review TO 'zoe.bos'@'localhost';


-- =============================================================
-- 2. APPLICATIEGEBRUIKER
-- De backend-applicatie gebruikt uitsluitend deze databasegebruiker.
-- De applicatielaag regelt authenticatie (wie is ingelogd) en
-- autorisatie (wat mag deze gebruiker zien/doen). De database zelf
-- vertrouwt erop dat de applicatie alleen correcte en geautoriseerde
-- bewerkingen doorgeeft.
--
-- Rechtenprincipes voor deze gebruiker:
--   - SELECT + INSERT + UPDATE op alle tabellen die de app leest
--     of schrijft (producten, accounts, bestellingen, reviews, etc.)
--   - DELETE uitsluitend op winkelwagen_regel: de winkelwagen wordt
--     na het afrekenen leeggemaakt; voor alle andere tabellen geldt
--     soft delete (deleted_at invullen via UPDATE).
--   - log_regel: INSERT om acties en fouten te loggen, geen UPDATE
--     of DELETE zodat de audittrail onwijzigbaar blijft.
-- =============================================================

DROP USER IF EXISTS 'useittoo_app'@'localhost';
CREATE USER 'useittoo_app'@'localhost' IDENTIFIED BY 'App2026!UseITtoo';

-- PRODUCTEN EN VOORRAAD
-- De app toont producten aan klanten en past voorraad aan na bestellingen.
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product TO 'useittoo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.voorraad TO 'useittoo_app'@'localhost';

-- RECEPTEN EN INGREDIËNTEN
-- De app toont recepten op de webshop en koppelt ingrediënten aan producten.
GRANT SELECT, INSERT, UPDATE ON useITtooDB.recept TO 'useittoo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.ingredienten TO 'useittoo_app'@'localhost';

-- CATEGORIEËN EN TAGS
-- De app gebruikt categorieën en tags voor filteren en zoeken in de webshop.
GRANT SELECT, INSERT, UPDATE ON useITtooDB.categorie TO 'useittoo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_categorie TO 'useittoo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.tag TO 'useittoo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_tag TO 'useittoo_app'@'localhost';

-- KORTINGSACTIES
-- De app toont lopende acties aan klanten en koppelt acties aan producten.
GRANT SELECT, INSERT, UPDATE ON useITtooDB.kortingsactie TO 'useittoo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_kortingsactie TO 'useittoo_app'@'localhost';

-- ACCOUNTS, KLANTEN EN BEHEERDERS
-- De app regelt registratie, inloggen, profielbeheer en sessiebeheer.
-- Soft delete van accounts gebeurt via UPDATE (deleted_at invullen), niet via DELETE.
GRANT SELECT, INSERT, UPDATE ON useITtooDB.account TO 'useittoo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant TO 'useittoo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.beheer TO 'useittoo_app'@'localhost';

-- ADRESSEN
-- De app slaat bezorg- en factuuraddressen op en koppelt deze aan klanten.
GRANT SELECT, INSERT, UPDATE ON useITtooDB.adres TO 'useittoo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant_adres TO 'useittoo_app'@'localhost';

-- WINKELWAGEN
-- DELETE is hier als enige tabel toegestaan: na het afrekenen worden de
-- winkelwagen-regels fysiek verwijderd. Alle andere verwijderingen in de
-- database verlopen via soft delete (UPDATE op deleted_at).
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'useittoo_app'@'localhost';

-- BESTELLINGEN EN BESTELREGELS
-- De app maakt bestellingen aan bij het afrekenen en werkt statussen bij.
GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestelling TO 'useittoo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestel_regel TO 'useittoo_app'@'localhost';

-- REVIEWS
-- De app laat klanten reviews schrijven en bijhouden, en beheerders reageren.
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'useittoo_app'@'localhost';

-- LOGGING
-- INSERT: de app schrijft een logregel bij elke relevante actie of fout.
-- Geen UPDATE of DELETE: een audittrail is alleen betrouwbaar als hij
-- achteraf niet aangepast of verwijderd kan worden.
GRANT SELECT, INSERT ON useITtooDB.log_regel TO 'useittoo_app'@'localhost';

-- VIEWS (leestoegang voor de applicatie)
-- De app kan de views gebruiken voor efficiënte, gecombineerde leesqueries.
-- Schrijfacties lopen altijd via de basistabellen hierboven.
GRANT SELECT ON useITtooDB.v_klant_account TO 'useittoo_app'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_adres TO 'useittoo_app'@'localhost';
GRANT SELECT ON useITtooDB.v_klant_bestellingen TO 'useittoo_app'@'localhost';
GRANT SELECT ON useITtooDB.v_bestel_regel TO 'useittoo_app'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'useittoo_app'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'useittoo_app'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'useittoo_app'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'useittoo_app'@'localhost';
GRANT SELECT ON useITtooDB.v_product_kortingen TO 'useittoo_app'@'localhost';
GRANT SELECT ON useITtooDB.v_bestelling_overzicht TO 'useittoo_app'@'localhost';
GRANT SELECT ON useITtooDB.v_actieve_accounts TO 'useittoo_app'@'localhost';
GRANT SELECT ON useITtooDB.v_logregel_overzicht TO 'useittoo_app'@'localhost';


-- =============================================================
-- 3. MEDEWERKER-ACCOUNTS
-- Medewerkers loggen direct in op de database (bijv. via een beheertool).
-- Rechten zijn strikt afgestemd op de rol zodat een voorraadbeheerder
-- geen klantgegevens kan inzien en een klantenservicemedewerker geen
-- prijzen kan aanpassen.
-- =============================================================

-- ALGEMEEN ADMIN (Pieter Willems)
-- Heeft de breedste rechten: voorraadbeheer, klantbeheer, bestellingen en logs.
-- Bedoeld als beheerder die alle dagelijkse beheertaken kan uitvoeren.
DROP USER IF EXISTS 'pieterwillems'@'localhost';
CREATE USER 'pieterwillems'@'localhost' IDENTIFIED BY 'Medewerker2026!Piet';
-- Voorraadbeheer
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.voorraad TO 'pieterwillems'@'localhost';
-- Recepten, categorieën en tags
GRANT SELECT, INSERT, UPDATE ON useITtooDB.ingredienten TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_categorie TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_tag TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.recept TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.categorie TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.tag TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.kortingsactie TO 'pieterwillems'@'localhost';
GRANT SELECT ON useITtooDB.product_kortingsactie TO 'pieterwillems'@'localhost';
-- Lopende acties inzien via view
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'pieterwillems'@'localhost';
-- Klant- en adresgegevens beheren
GRANT SELECT ON useITtooDB.v_actieve_accounts TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.account TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.adres TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant_adres TO 'pieterwillems'@'localhost';
-- Bestellingen beheren
GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestelling TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestel_regel TO 'pieterwillems'@'localhost';
GRANT SELECT ON useITtooDB.v_bestelling_overzicht TO 'pieterwillems'@'localhost';
-- Logs inzien (alleen lezen, geen schrijfrechten voor medewerkers)
GRANT SELECT ON useITtooDB.log_regel TO 'pieterwillems'@'localhost';
GRANT SELECT ON useITtooDB.v_logregel_overzicht TO 'pieterwillems'@'localhost';

-- VOORRAADBEHEERDER (Marieke Hendriks)
-- Beheert het productaanbod, de voorraad, recepten en kortingsacties.
-- Heeft geen toegang tot klant- of bestelgegevens.
DROP USER IF EXISTS 'mariekehendriks'@'localhost';
CREATE USER 'mariekehendriks'@'localhost' IDENTIFIED BY 'Medewerker2026!Mari';
-- Voorraadbeheer
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.voorraad TO 'mariekehendriks'@'localhost';
-- Recepten, categorieën en tags
GRANT SELECT, INSERT, UPDATE ON useITtooDB.ingredienten TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_categorie TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_tag TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.recept TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.categorie TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.tag TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.kortingsactie TO 'mariekehendriks'@'localhost';
GRANT SELECT ON useITtooDB.product_kortingsactie TO 'mariekehendriks'@'localhost';
-- Lopende acties inzien via view
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'mariekehendriks'@'localhost';

-- KLANTENSERVICE MEDEWERKER (Jeroen Dijkstra)
-- Kan klantgegevens en bestellingen inzien en aanpassen, maar mag het
-- productaanbod, de voorraad en kortingsacties alleen bekijken.
DROP USER IF EXISTS 'jeroendijkstra'@'localhost';
CREATE USER 'jeroendijkstra'@'localhost' IDENTIFIED BY 'Medewerker2026!Jero';
-- Productaanbod alleen inzien (geen wijzigingen)
GRANT SELECT ON useITtooDB.product TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.voorraad TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.ingredienten TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.product_categorie TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.product_tag TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.kortingsactie TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.product_kortingsactie TO 'jeroendijkstra'@'localhost';
-- Lopende acties inzien via view
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'jeroendijkstra'@'localhost';
-- Klant- en adresgegevens beheren (klantenservice mag gegevens corrigeren)
GRANT SELECT ON useITtooDB.v_actieve_accounts TO 'jeroendijkstra'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant TO 'jeroendijkstra'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.adres TO 'jeroendijkstra'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant_adres TO 'jeroendijkstra'@'localhost';
-- Bestellingen beheren (status bijwerken, retourzendingen verwerken)
GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestelling TO 'jeroendijkstra'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestel_regel TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.v_bestelling_overzicht TO 'jeroendijkstra'@'localhost';
-- Logs inzien (alleen lezen, geen schrijfrechten voor medewerkers)
GRANT SELECT ON useITtooDB.log_regel TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.v_logregel_overzicht TO 'jeroendijkstra'@'localhost';
