CREATE DATABASE IF NOT EXISTS brief_5_gestion_produits;

USE brief_5_gestion_produits;

--- create user 

--- grant rights to database (localhost == root has all rights)


CREATE TABLE IF NOT EXISTS categorie(
   id_categorie INT AUTO_INCREMENT,
   intitule_categorie VARCHAR(75)  NOT NULL,
   PRIMARY KEY(id_categorie)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS promotion(
   id_promotion INT AUTO_INCREMENT,
   pourcentage_promotion DECIMAL(5,2)  ,
   date_debut DATE,
   date_fin DATE,
   intitule_condition_promotion TEXT,
   condition_promotion_valeur TEXT,
   PRIMARY KEY(id_promotion)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS utilisateur(
   id_utilisateur INT AUTO_INCREMENT,
   email VARCHAR(80)  NOT NULL,
   mot_de_passe TEXT NOT NULL,
   profil_utilisateur VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_utilisateur)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS client(
   id_client INT AUTO_INCREMENT,
   nom VARCHAR(80)  NOT NULL,
   prenom VARCHAR(80)  NOT NULL,
   adresse TEXT NOT NULL,
   telephone VARCHAR(15) ,
   id_utilisateur INT NOT NULL,
   PRIMARY KEY(id_client),
   UNIQUE(id_utilisateur),
   FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS image_variant(
   id_image INT AUTO_INCREMENT,
   description TEXT,
   chemin_image TEXT,
   PRIMARY KEY(id_image)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS statut_commande(
   id_statut INT AUTO_INCREMENT,
   intitule_statut VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_statut)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS taille(
   id_taille INT AUTO_INCREMENT,
   valeur_taille CHAR(3) ,
   PRIMARY KEY(id_taille)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS couleur(
   id_couleur INT AUTO_INCREMENT,
   valeur_couleur VARCHAR(75) ,
   PRIMARY KEY(id_couleur)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS adresse(
   id_adresse INT AUTO_INCREMENT,
   titre_adresse VARCHAR(50) ,
   num_adresse VARCHAR(6) ,
   nom_adresse TEXT,
   code_postal VARCHAR(5) ,
   ville VARCHAR(80) ,
   complement_adresse TEXT,
   PRIMARY KEY(id_adresse)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS produit(
   id_produit INT AUTO_INCREMENT,
   nom_produit VARCHAR(75)  NOT NULL,
   description_produit TEXT,
   id_promotion INT  NULL,
   PRIMARY KEY(id_produit),
   FOREIGN KEY(id_promotion) REFERENCES promotion(id_promotion)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS variant_produit(
   id_variant INT AUTO_INCREMENT,
   prix_unitaire_variant DECIMAL(12,2)   NOT NULL,
   nb_stock INT NOT NULL,
   quantite_vendue INT,
   id_couleur INT,
   id_taille INT,
   id_produit INT NOT NULL,
   PRIMARY KEY(id_variant),
   FOREIGN KEY(id_couleur) REFERENCES couleur(id_couleur),
   FOREIGN KEY(id_taille) REFERENCES taille(id_taille),
   FOREIGN KEY(id_produit) REFERENCES produit(id_produit)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS avis(
   id_avis INT AUTO_INCREMENT,
   description_avis TEXT,
   date_avis DATE,
   est_signale BOOLEAN,
   id_client INT NOT NULL,
   id_variant INT NOT NULL,
   PRIMARY KEY(id_avis),
   FOREIGN KEY(id_client) REFERENCES client(id_client),
   FOREIGN KEY(id_variant) REFERENCES variant_produit(id_variant)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS commande(
   id_commande INT AUTO_INCREMENT,
   date_commande DATE,
   montant_total DECIMAL(15,2)  NULL,
   id_statut INT NOT NULL,
   id_client INT NOT NULL,
   PRIMARY KEY(id_commande),
   FOREIGN KEY(id_statut) REFERENCES statut_commande(id_statut),
   FOREIGN KEY(id_client) REFERENCES client(id_client)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS detail_commande(
   id_detail_commande INT AUTO_INCREMENT,
   quantite INT,
   pourcentage_remise DECIMAL(11,2)  ,
   prix_total_variant_produit DECIMAL(15,2)  ,
   id_variant INT NOT NULL,
   id_commande INT NOT NULL,
   PRIMARY KEY(id_detail_commande),
   FOREIGN KEY(id_variant) REFERENCES variant_produit(id_variant),
   FOREIGN KEY(id_commande) REFERENCES commande(id_commande)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS categories_produit(
   id_produit INT,
   id_categorie INT,
   PRIMARY KEY(id_produit, id_categorie),
   FOREIGN KEY(id_produit) REFERENCES produit(id_produit),
   FOREIGN KEY(id_categorie) REFERENCES categorie(id_categorie)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS images_variant_produit(
   id_variant INT,
   id_image INT,
   PRIMARY KEY(id_variant, id_image),
   FOREIGN KEY(id_variant) REFERENCES variant_produit(id_variant),
   FOREIGN KEY(id_image) REFERENCES image_variant(id_image)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS adresses_client(
   id_client INT,
   id_adresse INT,
   PRIMARY KEY(id_client, id_adresse),
   FOREIGN KEY(id_client) REFERENCES client(id_client),
   FOREIGN KEY(id_adresse) REFERENCES adresse(id_adresse)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
