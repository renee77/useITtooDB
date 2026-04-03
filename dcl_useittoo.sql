-- =============
-- CREATE USERS - KLANT
-- ==============
DROP USER IF EXISTS 'jan.vermeer'@'localhost';
CREATE USER 'jan.vermeer'@'localhost' IDENTIFIED BY 'Klant2026!Jan';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'jan.vermeer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'jan.vermeer'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'jan.vermeer'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'jan.vermeer'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'jan.vermeer'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'jan.vermeer'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'jan.vermeer'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'jan.vermeer'@'localhost';

DROP USER IF EXISTS 'sara.jansen'@'localhost';
CREATE USER 'sara.jansen'@'localhost' IDENTIFIED BY 'Klant2026!Sara';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'sara.jansen'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'sara.jansen'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'sara.jansen'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'sara.jansen'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'sara.jansen'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'sara.jansen'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'sara.jansen'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'sara.jansen'@'localhost';

DROP USER IF EXISTS 'mark.devries'@'localhost';
CREATE USER 'mark.devries'@'localhost' IDENTIFIED BY 'Klant2026!Mark';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'mark.devries'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'mark.devries'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'mark.devries'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'mark.devries'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'mark.devries'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'mark.devries'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'mark.devries'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'mark.devries'@'localhost';

DROP USER IF EXISTS 'lisa.bakker'@'localhost';
CREATE USER 'lisa.bakker'@'localhost' IDENTIFIED BY 'Klant2026!Lisa';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'lisa.bakker'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'lisa.bakker'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'lisa.bakker'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'lisa.bakker'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'lisa.bakker'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'lisa.bakker'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'lisa.bakker'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'lisa.bakker'@'localhost';

DROP USER IF EXISTS 'tom.smit'@'localhost';
CREATE USER 'tom.smit'@'localhost' IDENTIFIED BY 'Klant2026!Tom';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'tom.smit'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'tom.smit'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'tom.smit'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'tom.smit'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'tom.smit'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'tom.smit'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'tom.smit'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'tom.smit'@'localhost';

DROP USER IF EXISTS 'emma.meijer'@'localhost';
CREATE USER 'emma.meijer'@'localhost' IDENTIFIED BY 'Klant2026!Emma';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'emma.meijer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'emma.meijer'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'emma.meijer'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'emma.meijer'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'emma.meijer'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'emma.meijer'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'emma.meijer'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'emma.meijer'@'localhost';

DROP USER IF EXISTS 'noah.mulder'@'localhost';
CREATE USER 'noah.mulder'@'localhost' IDENTIFIED BY 'Klant2026!Noah';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'noah.mulder'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'noah.mulder'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'noah.mulder'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'noah.mulder'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'noah.mulder'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'noah.mulder'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'noah.mulder'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'noah.mulder'@'localhost';

DROP USER IF EXISTS 'olivia.dejong'@'localhost';
CREATE USER 'olivia.dejong'@'localhost' IDENTIFIED BY 'Klant2026!Olivia';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'olivia.dejong'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'olivia.dejong'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'olivia.dejong'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'olivia.dejong'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'olivia.dejong'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'olivia.dejong'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'olivia.dejong'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'olivia.dejong'@'localhost';

DROP USER IF EXISTS 'lucas.vandenberg'@'localhost';
CREATE USER 'lucas.vandenberg'@'localhost' IDENTIFIED BY 'Klant2026!Lucas';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'lucas.vandenberg'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'lucas.vandenberg'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'lucas.vandenberg'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'lucas.vandenberg'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'lucas.vandenberg'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'lucas.vandenberg'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'lucas.vandenberg'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'lucas.vandenberg'@'localhost';

DROP USER IF EXISTS 'mia.prins'@'localhost';
CREATE USER 'mia.prins'@'localhost' IDENTIFIED BY 'Klant2026!Mia';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'mia.prins'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'mia.prins'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'mia.prins'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'mia.prins'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'mia.prins'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'mia.prins'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'mia.prins'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'mia.prins'@'localhost';

DROP USER IF EXISTS 'daan.kok'@'localhost';
CREATE USER 'daan.kok'@'localhost' IDENTIFIED BY 'Klant2026!Daan';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'daan.kok'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'daan.kok'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'daan.kok'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'daan.kok'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'daan.kok'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'daan.kok'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'daan.kok'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'daan.kok'@'localhost';

DROP USER IF EXISTS 'zoe.bos'@'localhost';
CREATE USER 'zoe.bos'@'localhost' IDENTIFIED BY 'Klant2026!Zoe';
-- KLANTGEGEVENS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'zoe.bos'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'zoe.bos'@'localhost';
-- BESTELLINGEN
GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'zoe.bos'@'localhost';
GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'zoe.bos'@'localhost';
-- WINKELWAGEN
GRANT SELECT, INSERT, UPDATE, DELETE ON useITtooDB.winkelwagen_regel TO 'zoe.bos'@'localhost';
-- PRODUCTEN
GRANT SELECT ON useITtooDB.v_actieve_producten TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'zoe.bos'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'zoe.bos'@'localhost';
-- REVIEWS
GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'zoe.bos'@'localhost';





-- =============
-- CREATE USERS MEDEWERKERS
-- ==============
-- GENERAL ADMIN
DROP USER IF EXISTS 'pieterwillems'@'localhost';
CREATE USER 'pieterwillems'@'localhost' IDENTIFIED BY 'Medewerker2026!Piet';
-- Voorraadbeheer
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.voorraad TO 'pieterwillems'@'localhost';
-- Recepten, categorieeën en tags
GRANT SELECT, INSERT, UPDATE ON useITtooDB.ingredienten TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_categorie TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_tag TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.recept TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.categorie TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.tag TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.kortingsactie TO 'pieterwillems'@'localhost';
GRANT SELECT ON useITtooDB.product_kortingsactie TO 'pieterwillems'@'localhost';
-- Lopende acties
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'pieterwillems'@'localhost';
-- Klant en adres
GRANT SELECT ON useITtooDB.v_actieve_accounts TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.account TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.adres TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant_adres TO 'pieterwillems'@'localhost';
-- Bestellingen inzien
GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestelling TO 'pieterwillems'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestel_regel TO 'pieterwillems'@'localhost';
GRANT SELECT ON useITtooDB.v_bestelling_overzicht TO 'pieterwillems'@'localhost';
-- Logs
GRANT SELECT ON useITtooDB.log_regel TO 'pieterwillems'@'localhost';
GRANT SELECT ON useITtooDB.v_logregel_overzicht TO 'pieterwillems'@'localhost';

-- VOORRAADBEHEERDER
DROP USER IF EXISTS 'mariekehendriks'@'localhost';
CREATE USER 'mariekehendriks'@'localhost' IDENTIFIED BY 'Medewerker2026!Mari';
-- Voorraadbeheer
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.voorraad TO 'mariekehendriks'@'localhost';
-- Recepten, categorieeën en tags
GRANT SELECT, INSERT, UPDATE ON useITtooDB.ingredienten TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_categorie TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_tag TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.recept TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.categorie TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.tag TO 'mariekehendriks'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.kortingsactie TO 'mariekehendriks'@'localhost';
GRANT SELECT ON useITtooDB.product_kortingsactie TO 'mariekehendriks'@'localhost';
-- Lopende acties
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'mariekehendriks'@'localhost';




-- KLANTENSERVICE MEDEWERKER
DROP USER IF EXISTS 'jeroendijkstra'@'localhost';
CREATE USER 'jeroendijkstra'@'localhost' IDENTIFIED BY 'Medewerker2026!Jero';
-- Voorraadbeheer
GRANT SELECT ON useITtooDB.product TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.voorraad TO 'jeroendijkstra'@'localhost';
-- Recepten, categorieeën en tags
GRANT SELECT ON useITtooDB.ingredienten TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.product_categorie TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.product_tag TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.recept TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.categorie TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.tag TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.kortingsactie TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.product_kortingsactie TO 'jeroendijkstra'@'localhost';
-- Lopende acties
GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'jeroendijkstra'@'localhost';
-- Klant en adres
GRANT SELECT ON useITtooDB.v_actieve_accounts TO 'jeroendijkstra'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant TO 'jeroendijkstra'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.adres TO 'jeroendijkstra'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant_adres TO 'jeroendijkstra'@'localhost';
-- Bestellingen inzien
GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestelling TO 'jeroendijkstra'@'localhost';
GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestel_regel TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.v_bestelling_overzicht TO 'jeroendijkstra'@'localhost';
-- Logs
GRANT SELECT ON useITtooDB.log_regel TO 'jeroendijkstra'@'localhost';
GRANT SELECT ON useITtooDB.v_logregel_overzicht TO 'jeroendijkstra'@'localhost';


/* =============
-- Klanttoestemmingen
-- ==============
-- KLANTGEGEVENS
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_account TO 'klant';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.v_klant_adres TO 'klant';
-- BESTELLINGEN
-- GRANT SELECT, INSERT ON useITtooDB.v_klant_bestellingen TO 'klant';
-- GRANT SELECT, INSERT ON useITtooDB.v_bestel_regel TO 'klant';
-- PRODUCTEN
-- GRANT SELECT ON useITtooDB.v_actieve_producten TO 'klant';
-- GRANT SELECT ON useITtooDB.v_product_voorraad_status TO 'klant';
-- GRANT SELECT ON useITtooDB.recept TO 'klant';
-- GRANT SELECT ON useITtooDB.v_product_categorie_tag TO 'klant';
-- GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'klant';
-- GRANT SELECT ON useITtooDB.categorie TO 'klant';
-- GRANT SELECT ON useITtooDB.tag TO 'klant';
-- REVIEWS
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.review TO 'klant';


--=============
-- MEDEWERKER
--==============
-- Voorraadbeheer
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.product TO 'medewerker';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.voorraad TO 'medewerker';
-- -- Recepten, categorieeën en tags
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.ingredienten TO 'medewerker';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_categorie TO 'medewerker';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.product_tag TO 'medewerker';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.recept TO 'medewerker';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.categorie TO 'medewerker';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.tag TO 'medewerker';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.kortingsactie TO 'medewerker';
-- -- Lopende acties
-- GRANT SELECT ON useITtooDB.v_lopende_kortingsacties TO 'medewerker';
-- -- Klant en adres
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.account TO 'medewerker';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant TO 'medewerker';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.adres TO 'medewerker';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.klant_adres TO 'medewerker';
-- -- Bestellingen inzien
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestelling TO 'medewerker';
-- GRANT SELECT, INSERT, UPDATE ON useITtooDB.bestel_regel TO 'medewerker';
-- GRANT SELECT ON useITtooDB.v_bestelling_overzicht TO 'medewerker';
-- -- Logs
-- GRANT SELECT ON useITtooDB.logregel TO 'medewerker';
-- GRANT SELECT ON useITtooDB.v_logregel_overzicht TO 'medewerker';*/