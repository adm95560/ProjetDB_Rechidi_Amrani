ALTER TABLE Joueur
ADD CONSTRAINT chk_poste_joueur
CHECK (poste_joueur IN ('Gardien','Defenseur','Milieu','Attaquant'));

ALTER TABLE Joueur
ADD CONSTRAINT chk_numero_maillot
CHECK (numero_maillot_joueur BETWEEN 1 AND 99);

ALTER TABLE Joueur
ADD CONSTRAINT unique_numero_equipe
UNIQUE (id_equipe, numero_maillot_joueur);


ALTER TABLE match_
ADD CONSTRAINT chk_score_domicile
CHECK (score_domicile_match >= 0);

ALTER TABLE match_
ADD CONSTRAINT chk_score_exterieur
CHECK (score_exterieur_match >= 0);



ALTER TABLE PARTICIPE
ADD CONSTRAINT chk_minutes_jouees
CHECK (minutes_jouees BETWEEN 0 AND 120);

ALTER TABLE PARTICIPE
ADD CONSTRAINT chk_buts
CHECK (nb_but >= 0);

ALTER TABLE PARTICIPE
ADD CONSTRAINT chk_passes
CHECK (nb_passe_decisives >= 0);

ALTER TABLE PARTICIPE
ADD CONSTRAINT chk_cartons_jaunes
CHECK (nb_cartons_jaunes BETWEEN 0 AND 2);

ALTER TABLE PARTICIPE
ADD CONSTRAINT chk_cartons_rouges
CHECK (nb_cartons_rouges BETWEEN 0 AND 1);



ALTER TABLE championnat
ADD CONSTRAINT chk_saison
CHECK (saison_championnat >= 1900);



ALTER TABLE PARTICIPER_CHAMPIONNAT
ADD CONSTRAINT chk_classement
CHECK (classement_championnat > 0);
