INSERT INTO categorie
VALUES
(null, "Manches courtes"),
(null, "Manches longues"),
(null, "Laine"),
(null, "Coton"),
(null, "Polyester");

INSERT INTO couleur
VALUES
(null, "rouge"),
(null, "vert"),
(null, "bleue"),
(null, "noir"),
(null, "orange");

INSERT INTO taille
VALUES
(null, "L"),
(null, "S"),
(null, "M"),
(null, "XL"),
(null, "XXL");

INSERT INTO Promotion
VALUES 
(null, 15.5,"2023-06-01","2023-06-30", "promotion début d'été", "('Manches courtes', Coton')"),
(null, 50,"2023-01-01","2023-04-30", "promotion fin de série", "('Laine', Coton')"),
(null, 30.5,"2023-05-01","2023-05-30", "promotion printemps", "('Manches courtes', Coton', 'Polyester', 'orange')"),
(null, 10,"2023-07-01","2023-07-31", "promotion d'été", "('Manches courtes', Coton')"),
(null, 15.5,"2023-12-01","2023-12-31", "promotion hiver", "('Manches longues', Laine', 'noir')");

INSERT INTO produit
VALUES
(null, "T-shirt", "t-shirt casual. Confortable et Respirant", null),
(null, "Short", "Short de sport", null),
(null, "Pantalon", "Pantalon de ville", null),
(null, "Pull", "Pull de saison.Idéal pour le printemps", 3);

INSERT INTO variant_produit
VALUES 
(null, 12.80,36,0,1,1,1),
(null, 12.80,28,0,1,2,1),
(null, 12.80,50,0,1,4,1),
(null, 48.99,60,0,2,1,2),
(null, 48.99,50,0,3,2,2);

INSERT INTO utilisateur
VALUES 
(null, "john.doe@gmail.com", sha1("mdpJohn!"), "client"),
(null, "jane.doe@gmail.com", sha1("mdpJane!"), "client"),
(null, "ryan@gmail.com", sha1("mdpRyan!"), "client"),
(null, "lucie@gmail.com", sha1("mdpLucie!"), "client"),
(null, "tom@gmail.com", sha1("mdpTom!"), "client");

INSERT INTO client
VALUES 
(null, "John", "Doe", "01 XX XX XX XX",1),
(null, "Jane", "Doe", "02 XX XX XX XX",2),
(null, "Ryan", "Soldat", "03 XX XX XX XX",3),
(null, "Lucie", "Soldat", "04 XX XX XX XX",4),
(null, "Tom", "Sawyer", "05 XX XX XX XX",5);

INSERT INTO adresse 
VALUES
(null,  "adresse Maison", "03", "Rue de l'inconnu", "72000", "Le Mans", "apt XX. Sonner au digicode XXX"),
(null,  "adresse Travail", "56", "Rue de l'emploi", "72000", "Le Mans", "Bât X"),
(null,  "Chez moi!", "14", "rue du jardin", "97438", "Sainte-Marie", "Tapez à la porte. J'arrive..."),
(null,  "Chez Lucie!", "24", "Rue de la joie", "97440", "Saint Denis", "Appeler au numéro XX XX XX XX XX."),
(null,  "Ma Maison", "", "rue de l'impasse", "97450", "Saint Louis", "petite Maison sur la gauche");

INSERT INTO adresses_client
VALUES
(1,1),
(1,2),
(3,3),
(3,4),
(5,5);

INSERT INTO statut_commande
VALUES
(null, "en préparation"),
(null, "annulé"),
(null, "expédier"),
(null, "en cours de livraison"),
(null, "livré");

INSERT INTO commande 
VALUES 
(null, "2023-05-28",null, 1,1),
(null, "2023-06-01",null, 1,3),
(null, "2023-05-01",null, 4,3),
(null, "2023-03-14",null, 5,1),
(null, "2023-02-27",null, 5,5),
(null, "2023-30-01",null, 2,5);

INSERT INTO detail_commande
VALUES
(null, 3,10,null,1,2),
(null, 1,null,null,3,2),
(null, 5,15,null,1,3),
(null, 2,10,null,2,3),
(null, 1,null,null,1,4),
(null, 1,null,null,4,4),
(null, 1,null,null,5,5);

INSERT INTO avis
VALUES
(null, "Très bon t-shirt. Conforme aux attentes. Je recommande.", "2023-03-20",0,1,1),
(null, "Short Un peu petit", "2023-03-20",0,1,4),
(null, "Prix élevé pour cette qualité. Ne recommande pas!", "2023-03-01",0,5,5);