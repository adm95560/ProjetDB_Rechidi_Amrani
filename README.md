========================================
PROJET MERISE - GESTION CHAMPIONNAT FOOTBALL
========================================

CONTEXTE
--------
L'organisation gère un championnat de football. Elle organise les équipes,
les joueurs, les matchs, les entraîneurs, les performances et les résultats.
L'objectif est de concevoir un système d'information en utilisant MERISE.

========================================
1. REGLES DE GESTION
========================================

--- Gestion des championnats ---
- Un championnat possède un identifiant unique, un nom et une saison.
- Un championnat regroupe plusieurs équipes.
- Une équipe participe à un seul championnat par saison.
- Un championnat est composé de plusieurs journées.
- Chaque journée comprend plusieurs matchs.

--- Gestion des équipes ---
- Une équipe possède un identifiant unique, un nom et une ville.
- Une équipe est encadrée par un entraîneur principal.
- Une équipe dispose d’un effectif de joueurs.
- Une équipe joue des matchs à domicile et à l’extérieur.
- Une équipe possède des statistiques globales (points, buts marqués, buts encaissés, classement).

--- Gestion des joueurs ---
- Un joueur possède un identifiant unique, un nom, prénom, date de naissance et nationalité.
- Un joueur appartient à une seule équipe à un instant donné.
- Un joueur peut changer d’équipe au cours de sa carrière.
- Un joueur a un poste (attaquant, milieu, défenseur, gardien).
- Un joueur possède des statistiques individuelles (buts, passes décisives, cartons).

--- Gestion des entraîneurs ---
- Un entraîneur possède un identifiant unique, un nom et une nationalité.
- Un entraîneur est rattaché à une seule équipe à un instant donné.
- Un entraîneur peut entraîner plusieurs équipes au cours de sa carrière.

--- Gestion des matchs ---
- Un match possède un identifiant unique, une date, une heure et un lieu.
- Un match oppose exactement deux équipes : une équipe à domicile et une équipe à l’extérieur.
- Un match appartient à une journée et à un championnat.
- Un match a un score final (buts domicile, buts extérieur).
- Un match peut se terminer par une victoire, un match nul ou une défaite.

--- Gestion des performances ---
- Un joueur peut marquer zéro, un ou plusieurs buts lors d’un match.
- Un joueur peut recevoir des cartons jaunes ou rouges lors d’un match.
- Un joueur peut réaliser des passes décisives lors d’un match.
- Les performances d’un joueur sont enregistrées pour chaque match.

--- Gestion des résultats et classements ---
- Une victoire rapporte 3 points, un match nul 1 point, une défaite 0 point.
- Le classement des équipes est déterminé par les points.
- En cas d’égalité, d’autres critères peuvent être utilisés (différence de buts, buts marqués).
- Les statistiques des équipes sont mises à jour après chaque match.

========================================
2. DICTIONNAIRE DE DONNEES
========================================

| Donnée                  | Signification                                  | Type   | Taille |
|------------------------|-----------------------------------------------|--------|--------|
| id_championnat         | Identifiant unique du championnat             | Entier | 10     |
| nom_championnat        | Nom du championnat                            | Texte  | 50     |
| saison                 | Saison du championnat (ex : 2024-2025)        | Texte  | 9      |
| id_equipe              | Identifiant unique de l’équipe                | Entier | 10     |
| nom_equipe             | Nom de l’équipe                               | Texte  | 50     |
| ville_equipe           | Ville de l’équipe                             | Texte  | 50     |
| stade                  | Nom du stade                                  | Texte  | 50     |
| id_joueur              | Identifiant unique du joueur                  | Entier | 10     |
| nom_joueur             | Nom du joueur                                 | Texte  | 50     |
| prenom_joueur          | Prénom du joueur                              | Texte  | 50     |
| date_naissance         | Date de naissance du joueur                   | Date   | 10     |
| nationalite            | Nationalité du joueur                         | Texte  | 30     |
| poste                  | Poste du joueur                               | Texte  | 20     |
| numero_maillot         | Numéro du joueur                              | Entier | 2      |
| id_entraineur          | Identifiant unique de l’entraîneur            | Entier | 10     |
| nom_entraineur         | Nom de l’entraîneur                           | Texte  | 50     |
| prenom_entraineur      | Prénom de l’entraîneur                        | Texte  | 50     |
| nationalite_entraineur | Nationalité de l’entraîneur                   | Texte  | 30     |
| id_match               | Identifiant unique du match                   | Entier | 10     |
| date_match             | Date du match                                 | Date   | 10     |
| heure_match            | Heure du match                                | Heure  | 5      |
| lieu_match             | Lieu du match                                 | Texte  | 50     |
| id_equipe_domicile     | Identifiant de l’équipe à domicile            | Entier | 10     |
| id_equipe_exterieur    | Identifiant de l’équipe à l’extérieur         | Entier | 10     |
| buts_domicile          | Nombre de buts marqués à domicile             | Entier | 2      |
| buts_exterieur         | Nombre de buts marqués à l’extérieur          | Entier | 2      |
| cartons_jaunes         | Nombre de cartons jaunes d’un joueur          | Entier | 2      |
| cartons_rouges         | Nombre de cartons rouges d’un joueur          | Entier | 1      |
| nb_buts_joueur         | Nombre de buts marqués par un joueur          | Entier | 2      |
| nb_passes_decisives    | Nombre de passes décisives d’un joueur        | Entier | 2      |

========================================
FIN DU DOCUMENT
========================================
