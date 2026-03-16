# Projet MERISE Gestion d'un Championnat de Football

## Table des matières

1. [Contexte du projet](#contexte-du-projet)
2. [Prompt final utilisé](#prompt-final-utilisé)
3. [Règles de gestion](#règles-de-gestion)
4. [Dictionnaire de données](#dictionnaire-de-données)
5. [MCD Modèle Conceptuel de Données](#mcd--modèle-conceptuel-de-données)
6. [MLD Modèle Logique de Données](#mld--modèle-logique-de-données)
7. [Respect du sujet et conformité 3FN](#respect-du-sujet-et-conformité-3fn)
8. [Scénarios d'usage](#scénarios-dusage)

---

## Contexte du projet

L'organisation gère un **championnat de football**. Elle organise les équipes, les joueurs, les matchs, les entraîneurs, les performances et les résultats.

L'objectif est de concevoir un **système d'information** complet en utilisant la méthode **MERISE**, comprenant :
- un Modèle Conceptuel de Données (MCD),
- un Modèle Logique de Données (MLD).

---

## Prompt final utilisé

> Génère un Modèle Conceptuel de Données (MCD) en MERISE pour un système de gestion d'un championnat de football.
>
> Le système doit gérer les entités suivantes :
> - **Championnat** : identifiant, nom, saison
> - **Équipe** : identifiant, nom, ville, stade, rattachée à un entraîneur principal
> - **Joueur** : identifiant, nom, prénom, date de naissance, nationalité, poste, numéro de maillot, appartenant à une équipe à un instant donné
> - **Entraîneur** : identifiant, nom, prénom, nationalité, rattaché à une équipe à un instant donné
> - **Match** : identifiant, date, heure, lieu, opposant deux équipes (domicile/extérieur), score final, appartenant à une journée de championnat
> - **Performance** : buts, passes décisives, cartons jaunes et rouges d'un joueur pour un match donné
>
> Règles de gestion importantes :
> - Un joueur appartient à une seule équipe à un instant donné, mais peut en changer au cours de sa carrière.
> - Un entraîneur est rattaché à une seule équipe à un instant donné.
> - Un match oppose exactement deux équipes.
> - Les performances sont enregistrées par joueur et par match.
> - Une équipe participe à un seul championnat par saison.
>
> Représente le MCD avec les entités, leurs attributs, les associations et les cardinalités.

---

## Règles de gestion

### Gestion des championnats

- Un championnat possède un identifiant unique, un nom et une saison.
- Un championnat regroupe plusieurs équipes.
- Une équipe participe à un seul championnat par saison.
- Un championnat est composé de plusieurs journées.
- Chaque journée comprend plusieurs matchs.

### Gestion des équipes

- Une équipe possède un identifiant unique, un nom et une ville.
- Une équipe est encadrée par un entraîneur principal.
- Une équipe dispose d'un effectif de joueurs.
- Une équipe joue des matchs à domicile et à l'extérieur.
- Une équipe possède des statistiques globales (points, buts marqués, buts encaissés, classement).

### Gestion des joueurs

- Un joueur possède un identifiant unique, un nom, prénom, date de naissance et nationalité.
- Un joueur appartient à une seule équipe à un instant donné.
- Un joueur peut changer d'équipe au cours de sa carrière.
- Un joueur a un poste (attaquant, milieu, défenseur, gardien).
- Un joueur possède des statistiques individuelles (buts, passes décisives, cartons).

### Gestion des entraîneurs

- Un entraîneur possède un identifiant unique, un nom et une nationalité.
- Un entraîneur est rattaché à une seule équipe à un instant donné.
- Un entraîneur peut entraîner plusieurs équipes au cours de sa carrière.

### Gestion des matchs

- Un match possède un identifiant unique, une date, une heure et un lieu.
- Un match oppose exactement deux équipes : une équipe à domicile et une équipe à l'extérieur.
- Un match appartient à une journée et à un championnat.
- Un match a un score final (buts domicile, buts extérieur).
- Un match peut se terminer par une victoire, un match nul ou une défaite.

### Gestion des performances

- Un joueur peut marquer zéro, un ou plusieurs buts lors d'un match.
- Un joueur peut recevoir des cartons jaunes ou rouges lors d'un match.
- Un joueur peut réaliser des passes décisives lors d'un match.
- Les performances d'un joueur sont enregistrées pour chaque match.

### Gestion des résultats et classements

- Une victoire rapporte **3 points**, un match nul **1 point**, une défaite **0 point**.
- Le classement des équipes est déterminé par les points.
- En cas d'égalité, d'autres critères peuvent être utilisés (différence de buts, buts marqués).
- Les statistiques des équipes sont mises à jour après chaque match.

---

## Dictionnaire de données

| Donnée | Signification | Type | Taille |
|--------|--------------|------|--------|
| `id_championnat` | Identifiant unique du championnat | Entier | 10 |
| `nom_championnat` | Nom du championnat | Texte | 50 |
| `saison` | Saison du championnat (ex : 2024-2025) | Texte | 9 |
| `id_equipe` | Identifiant unique de l'équipe | Entier | 10 |
| `nom_equipe` | Nom de l'équipe | Texte | 50 |
| `ville_equipe` | Ville de l'équipe | Texte | 50 |
| `stade` | Nom du stade | Texte | 50 |
| `id_joueur` | Identifiant unique du joueur | Entier | 10 |
| `nom_joueur` | Nom du joueur | Texte | 50 |
| `prenom_joueur` | Prénom du joueur | Texte | 50 |
| `date_naissance` | Date de naissance du joueur | Date | 10 |
| `nationalite` | Nationalité du joueur | Texte | 30 |
| `poste` | Poste du joueur | Texte | 20 |
| `numero_maillot` | Numéro du joueur | Entier | 2 |
| `id_entraineur` | Identifiant unique de l'entraîneur | Entier | 10 |
| `nom_entraineur` | Nom de l'entraîneur | Texte | 50 |
| `prenom_entraineur` | Prénom de l'entraîneur | Texte | 50 |
| `nationalite_entraineur` | Nationalité de l'entraîneur | Texte | 30 |
| `id_match` | Identifiant unique du match | Entier | 10 |
| `date_match` | Date du match | Date | 10 |
| `heure_match` | Heure du match | Heure | 5 |
| `lieu_match` | Lieu du match | Texte | 50 |
| `id_equipe_domicile` | Identifiant de l'équipe à domicile | Entier | 10 |
| `id_equipe_exterieur` | Identifiant de l'équipe à l'extérieur | Entier | 10 |
| `buts_domicile` | Nombre de buts marqués à domicile | Entier | 2 |
| `buts_exterieur` | Nombre de buts marqués à l'extérieur | Entier | 2 |
| `cartons_jaunes` | Nombre de cartons jaunes d'un joueur | Entier | 2 |
| `cartons_rouges` | Nombre de cartons rouges d'un joueur | Entier | 1 |
| `nb_buts_joueur` | Nombre de buts marqués par un joueur | Entier | 2 |
| `nb_passes_decisives` | Nombre de passes décisives d'un joueur | Entier | 2 |

---

## MCD Modèle Conceptuel de Données

> **Ajoutez ici l'image de votre MCD** exportée depuis votre logiciel de modélisation (Looping, JMerise, etc.), puis ajoutez le fichier source (`.loo`, `.jmr`, etc.) à la racine du dépôt.

![MCD - Modèle Conceptuel de Données](./mcd.png)

### Entités principales

| Entité | Identifiant | Attributs |
|--------|-------------|-----------|
| CHAMPIONNAT | id_championnat | nom_championnat, saison |
| EQUIPE | id_equipe | nom_equipe, ville_equipe, stade |
| JOUEUR | id_joueur | nom_joueur, prenom_joueur, date_naissance, nationalite, poste, numero_maillot |
| ENTRAINEUR | id_entraineur | nom_entraineur, prenom_entraineur, nationalite_entraineur |
| MATCH | id_match | date_match, heure_match, stade_match, score_domicile, score_exterieur |

### Associations et cardinalités

| Association | Entités liées | Cardinalités | Attributs portés |
|-------------|--------------|--------------|-----------------|
| PARTICIPE_CHAMPIONNAT | EQUIPE CHAMPIONNAT | (0,n) (1,n) | classement |
| ENCADRE | ENTRAINEUR EQUIPE | (1,1) (0,n) | |
| COMPOSE | EQUIPE JOUEUR | (1,1) (1,n) | |
| JOUE_DOMICILE | EQUIPE MATCH | (0,n) (1,1) | |
| JOUE_EXTERIEUR | EQUIPE MATCH | (0,n) (1,1) | |
| PARTICIPE | JOUEUR MATCH | (0,n) (0,n) | minutes_jouees, nb_buts, nb_cartons_jaunes, nb_cartons_rouges, nb_passes_decisives |

---

## MLD Modèle Logique de Données

Le MLD est obtenu par application des règles de passage MERISE depuis le MCD.

```sql
Entraineur = (
id_entraineur VARCHAR(50),
nom_entraineur VARCHAR(50),
prenom_entraineur VARCHAR(50),
nationalite_entraineur VARCHAR(50)
);

Championnat = (
id_championnat VARCHAR(50),
nom_championnat VARCHAR(50),
pays_championnat VARCHAR(50),
saison_championnat INT
);

Equipe = (
id_equipe VARCHAR(50),
nom_equipe VARCHAR(50),
ville_equipe VARCHAR(50),
#id_entraineur
);

Match_ = (
id_match VARCHAR(50),
date_match DATE,
heure_match TIME,
stade_match VARCHAR(50),
score_domicile_match VARCHAR(50),
score_exterieur_match VARCHAR(50),
#id_equipe, -- clé étrangère : équipe domicile
#id_equipe_1 -- clé étrangère : équipe extérieur
);

Joueur = (
id_joueur VARCHAR(50),
nom_joueur VARCHAR(50),
prenom_joueur VARCHAR(50),
date_naissance_joueur VARCHAR(50),
nationalite_joueur VARCHAR(50),
poste_joueur VARCHAR(50),
numero_maillot_joueur VARCHAR(50),
#id_equipe
);

PARTICIPE = (
#id_joueur,
#id_match,
minutes_jouees INT,
nb_buts INT,
nb_cartons_jaunes INT,
nb_cartons_rouges INT,
nb_passes_decisives INT
);

PARTICIPER_CHAMPIONNAT = (
#id_equipe,
#id_championnat,
classement_championnat VARCHAR(50)
);
```

> **Légende** : les attributs précédés de `#` sont des **clés étrangères** (foreign keys).

---

## Respect du sujet et conformité 3FN

### Respect du sujet

Le modèle couvre l'intégralité des exigences fonctionnelles formulées dans le cahier des charges :

| Exigence du sujet | Couverture dans le modèle |
|-------------------|--------------------------|
| Gérer les championnats (nom, saison) | Entité **CHAMPIONNAT** avec `id_championnat`, `nom_championnat`, `saison_championnat` |
| Regrouper plusieurs équipes par championnat | Association **PARTICIPER_CHAMPIONNAT** (EQUIPE CHAMPIONNAT) |
| Une équipe par championnat par saison | Cardinalité (0,n)(1,n) + clé composite dans PARTICIPER_CHAMPIONNAT |
| Gérer les équipes (nom, ville, stade) | Entité **EQUIPE** avec tous les attributs requis |
| Rattacher un entraîneur à une équipe | Clé étrangère `#id_entraineur` dans EQUIPE |
| Gérer les joueurs (identité, poste, numéro) | Entité **JOUEUR** avec `poste_joueur`, `numero_maillot_joueur`, etc. |
| Un joueur dans une seule équipe à la fois | Clé étrangère `#id_equipe` dans JOUEUR |
| Gérer les matchs (date, heure, lieu, score) | Entité **MATCH_** avec tous les attributs requis |
| Un match oppose deux équipes distinctes | Deux clés étrangères `#id_equipe` et `#id_equipe_1` dans MATCH_ |
| Enregistrer les performances par joueur/match | Table d'association **PARTICIPE** avec buts, cartons, passes décisives |
| Gérer le classement | Attribut `classement_championnat` dans PARTICIPER_CHAMPIONNAT |

---

### Conformité à la 3ème Forme Normale (3FN)

La **troisième forme normale** (3FN) impose trois conditions cumulatives :

> 1. **1FN** Chaque attribut est atomique (une seule valeur par cellule, pas de groupe répétitif).
> 2. **2FN** Tout attribut non-clé dépend de **la totalité** de la clé primaire (pas de dépendance partielle).
> 3. **3FN** Tout attribut non-clé dépend **directement** de la clé primaire, pas d'un autre attribut non-clé (pas de dépendance transitive).

#### Vérification table par table

**`Entraineur`** Clé : `id_entraineur`
- `nom_entraineur`, `prenom_entraineur`, `nationalite_entraineur` dépendent tous directement et uniquement de `id_entraineur`.
- **3FN respectée.**

**`Championnat`** Clé : `id_championnat`
- `nom_championnat`, `pays_championnat`, `saison_championnat` dépendent tous directement de `id_championnat`.
- **3FN respectée.**

**`Equipe`** Clé : `id_equipe`
- `nom_equipe`, `ville_equipe`, `#id_entraineur` dépendent directement de `id_equipe`.
- L'entraîneur est référencé par clé étrangère : ses propres attributs restent dans sa table. Aucune transitivité.
- **3FN respectée.**

**`Match_`** Clé : `id_match`
- `date_match`, `heure_match`, `stade_match`, `score_domicile_match`, `score_exterieur_match` dépendent tous de `id_match`.
- Les équipes sont référencées par clés étrangères, leurs attributs ne sont pas répétés ici.
- **3FN respectée.**

**`Joueur`** Clé : `id_joueur`
- Tous les attributs (`nom`, `prenom`, `date_naissance`, `nationalite`, `poste`, `numero_maillot`, `#id_equipe`) dépendent directement de `id_joueur`.
- **3FN respectée.**

**`PARTICIPE`** Clé composite : (`#id_joueur`, `#id_match`)
- `minutes_jouees`, `nb_buts`, `nb_cartons_jaunes`, `nb_cartons_rouges`, `nb_passes_decisives` dépendent de la combinaison (joueur + match), pas d'un seul des deux.
- 2FN : pas de dépendance partielle aucun de ces attributs ne dépend uniquement de `id_joueur` ou uniquement de `id_match`.
- 3FN : pas de dépendance transitive entre attributs non-clés.
- **3FN respectée.**

**`PARTICIPER_CHAMPIONNAT`** Clé composite : (`#id_equipe`, `#id_championnat`)
- `classement_championnat` dépend bien du couple (équipe + championnat), pas d'un seul des deux.
- **3FN respectée.**

#### Récapitulatif

| Table | 1FN | 2FN | 3FN |
|-------|-----|-----|-----|
| Entraineur | | | |
| Championnat | | | |
| Equipe | | | |
| Match_ | | | |
| Joueur | | | |
| PARTICIPE | | | |
| PARTICIPER_CHAMPIONNAT | | | |

> Toutes les tables du MLD sont en **3ème Forme Normale**. Aucune redondance de données, aucune dépendance transitive ou partielle n'a été identifiée.

---

## Scénarios d'usage

### Scénario 1 Enregistrement d'un match et mise à jour du classement

**Contexte :** La journée 12 du championnat 2024-2025 vient de se terminer. L'Olympique de Marseille a battu l'OGC Nice 3-1 à domicile.

**Étapes dans le système :**

1. Un nouvel enregistrement est créé dans la table `Match_` avec la date, l'heure, le stade, et les clés étrangères des deux équipes (domicile = OM, extérieur = Nice).
2. Le score final est renseigné : `score_domicile_match = 3`, `score_exterieur_match = 1`.
3. Pour chaque joueur ayant participé, une ligne est insérée dans `PARTICIPE` avec ses statistiques individuelles (buts marqués, passes décisives, cartons reçus, minutes jouées).
4. La table `PARTICIPER_CHAMPIONNAT` est mise à jour : OM gagne 3 points, Nice 0, et le `classement_championnat` est recalculé.

**Tables impliquées :** `Match_`, `PARTICIPE`, `PARTICIPER_CHAMPIONNAT`

---

### Scénario 2 Transfert d'un joueur entre deux équipes

**Contexte :** En janvier (mercato hivernal), le joueur Kylian Dupont quitte le FC Lyon pour rejoindre le Stade Rennais.

**Étapes dans le système :**

1. La clé étrangère `#id_equipe` dans la table `Joueur` est mise à jour : elle passe de l'identifiant de Lyon à celui de Rennes.
2. Les performances passées du joueur (table `PARTICIPE`) sont conservées intactes elles référencent l'`id_joueur`, indépendamment de l'équipe actuelle.
3. Les matchs futurs auxquels il participera seront désormais liés à Rennes via la table `PARTICIPE`.

> Ce scénario illustre pourquoi la règle « un joueur appartient à une seule équipe à un instant donné » est modélisée par une simple clé étrangère dans `Joueur` : un seul UPDATE suffit pour effectuer le transfert, sans créer de doublons.

**Tables impliquées :** `Joueur`, `PARTICIPE` (lecture historique uniquement)

---

### Scénario 3 Consultation du classement et des statistiques de fin de saison

**Contexte :** En fin de saison 2024-2025, le directeur sportif souhaite consulter le classement final du championnat et les meilleurs buteurs.

**Étapes dans le système :**

1. **Classement des équipes** : une requête sur `PARTICIPER_CHAMPIONNAT` filtrée sur `id_championnat` de la saison 2024-2025 retourne toutes les équipes avec leur `classement_championnat` et leurs points, triés par rang.
2. **Meilleurs buteurs** : une agrégation sur la table `PARTICIPE` (`SUM(nb_buts)`) jointe avec `Joueur` et `Equipe` permet de lister les joueurs avec le plus de buts sur la saison, en filtrant les `id_match` appartenant au championnat concerné.
3. **Statistiques d'équipe** : une jointure entre `PARTICIPER_CHAMPIONNAT`, `Match_` et `PARTICIPE` permet de calculer les buts marqués, buts encaissés et différence de buts pour chaque équipe.

**Tables impliquées :** `PARTICIPER_CHAMPIONNAT`, `PARTICIPE`, `Joueur`, `Equipe`, `Match_`, `Championnat`

---

*Projet réalisé dans le cadre d'un exercice de modélisation MERISE.*
