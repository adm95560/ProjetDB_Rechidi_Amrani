CREATE TABLE Entraineur(
   id_entraineur VARCHAR(50),
   nom_entraineur VARCHAR(50) NOT NULL,
   prenom_entraineur VARCHAR(50) NOT NULL,
   nationalite_entraineur VARCHAR(50),

   PRIMARY KEY(id_entraineur)
);

CREATE TABLE championnat(
   id_championnat VARCHAR(50),
   nom_championnat VARCHAR(50) NOT NULL,
   pays_championnat VARCHAR(50),
   saison_championnat INT,

   PRIMARY KEY(id_championnat)
);

CREATE TABLE Equipe(
   id_equipe VARCHAR(50),
   nom_equipe VARCHAR(50) NOT NULL,
   ville_equipe VARCHAR(50),

   id_entraineur VARCHAR(50) NOT NULL,

   PRIMARY KEY(id_equipe),

   UNIQUE(id_entraineur),

   FOREIGN KEY(id_entraineur)
   REFERENCES Entraineur(id_entraineur)
   ON DELETE CASCADE
   ON UPDATE CASCADE
);

CREATE TABLE match_(
   id_match VARCHAR(50),
   date_match DATE NOT NULL,
   heure_match TIME,
   stade_match VARCHAR(50),

   score_domicile_match INT,
   score_exterieur_match INT,

   id_equipe_domicile VARCHAR(50) NOT NULL,
   id_equipe_exterieur VARCHAR(50) NOT NULL,

   PRIMARY KEY(id_match),

   FOREIGN KEY(id_equipe_domicile)
   REFERENCES Equipe(id_equipe)
   ON DELETE CASCADE
   ON UPDATE CASCADE,

   FOREIGN KEY(id_equipe_exterieur)
   REFERENCES Equipe(id_equipe)
   ON DELETE CASCADE
   ON UPDATE CASCADE
);

CREATE TABLE Joueur(
   id_joueur VARCHAR(50),
   nom_joueur VARCHAR(50) NOT NULL,
   prenom_joueur VARCHAR(50) NOT NULL,

   date_naissance_joueur DATE,
   nationalite_joueur VARCHAR(50),

   poste_joueur VARCHAR(50),
   numero_maillot_joueur INT,

   id_equipe VARCHAR(50) NOT NULL,

   PRIMARY KEY(id_joueur),

   FOREIGN KEY(id_equipe)
   REFERENCES Equipe(id_equipe)
   ON DELETE CASCADE
   ON UPDATE CASCADE
);

CREATE TABLE PARTICIPE(
   id_joueur VARCHAR(50),
   id_match VARCHAR(50),

   minutes_jouees INT,
   nb_but INT,
   nb_cartons_jaunes INT,
   nb_cartons_rouges INT,
   nb_passe_decisives INT,

   PRIMARY KEY(id_joueur, id_match),

   FOREIGN KEY(id_joueur)
   REFERENCES Joueur(id_joueur)
   ON DELETE CASCADE
   ON UPDATE CASCADE,

   FOREIGN KEY(id_match)
   REFERENCES match_(id_match)
   ON DELETE CASCADE
   ON UPDATE CASCADE
);

CREATE TABLE PARTICIPER_CHAMPIONNAT(
   id_equipe VARCHAR(50),
   id_championnat VARCHAR(50),

   classement_championnat INT,

   PRIMARY KEY(id_equipe, id_championnat),

   FOREIGN KEY(id_equipe)
   REFERENCES Equipe(id_equipe)
   ON DELETE CASCADE
   ON UPDATE CASCADE,

   FOREIGN KEY(id_championnat)
   REFERENCES championnat(id_championnat)
   ON DELETE CASCADE
   ON UPDATE CASCADE
);