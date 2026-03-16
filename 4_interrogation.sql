/* PARTIE 1 — REQUÊTES DE SÉLECTION                                   */

-- Requête 1 : Attaquants triés par équipe puis nom
SELECT
    nom_joueur,
    prenom_joueur,
    nationalite_joueur,
    numero_maillot_joueur,
    id_equipe
FROM Joueur
WHERE poste_joueur = 'Attaquant'
ORDER BY id_equipe ASC, nom_joueur ASC;


-- Requête 2 : Joueurs nés entre 1995 et 2000
SELECT
    nom_joueur,
    prenom_joueur,
    date_naissance_joueur,
    poste_joueur,
    id_equipe
FROM Joueur
WHERE date_naissance_joueur BETWEEN '1995-01-01' AND '2000-12-31'
ORDER BY date_naissance_joueur ASC;


-- Requête 3 : Clubs contenant "Real" ou "Inter"
SELECT
    id_equipe,
    nom_equipe,
    ville_equipe
FROM Equipe
WHERE nom_equipe LIKE '%Real%'
   OR nom_equipe LIKE '%Inter%'
ORDER BY nom_equipe;


-- Requête 4 : Nationalités distinctes
SELECT DISTINCT nationalite_joueur
FROM Joueur
ORDER BY nationalite_joueur ASC;


-- Requête 5 : Joueurs avec numéros entre 1 et 11
SELECT
    nom_joueur,
    prenom_joueur,
    numero_maillot_joueur,
    poste_joueur,
    id_equipe
FROM Joueur
WHERE numero_maillot_joueur BETWEEN 1 AND 11
ORDER BY numero_maillot_joueur ASC, id_equipe ASC;


-- Requête 6 : Championnats dans certains pays
SELECT
    id_championnat,
    nom_championnat,
    pays_championnat,
    saison_championnat
FROM championnat
WHERE pays_championnat IN ('France', 'Espagne', 'Italie')
ORDER BY pays_championnat;


/* PARTIE 2 — AGRÉGATIONS                                             */

-- Requête 7 : Nombre de joueurs par poste
SELECT
    poste_joueur,
    COUNT(*) AS nb_joueurs
FROM Joueur
GROUP BY poste_joueur
ORDER BY nb_joueurs DESC;


-- Requête 8 : Nombre de joueurs par équipe et poste
SELECT
    id_equipe,
    poste_joueur,
    COUNT(*) AS nb_joueurs
FROM Joueur
GROUP BY id_equipe, poste_joueur
ORDER BY id_equipe, poste_joueur;


-- Requête 9 : Statistiques domicile par équipe
SELECT
    id_equipe_domicile AS equipe,
    COUNT(*) AS matchs_a_domicile,
    COALESCE(SUM(score_domicile_match),0) AS buts_marques_domicile,
    COALESCE(SUM(score_exterieur_match),0) AS buts_encaisses_domicile,
    COALESCE(AVG(score_domicile_match),0) AS moyenne_buts_marques
FROM match_
GROUP BY id_equipe_domicile
ORDER BY buts_marques_domicile DESC;


-- Requête 10 : Équipes encaissant plus d'1 but en moyenne
SELECT
    id_equipe_domicile AS equipe,
    COUNT(*) AS nb_matchs,
    SUM(score_exterieur_match) AS total_buts_encaisses,
    AVG(score_exterieur_match) AS moyenne_buts_encaisses
FROM match_
GROUP BY id_equipe_domicile
HAVING AVG(score_exterieur_match) > 1
ORDER BY moyenne_buts_encaisses DESC;


-- Requête 11 : Nombre de matchs par championnat
SELECT
    id_championnat,
    COUNT(*) AS nb_matchs,
    SUM(score_domicile_match + score_exterieur_match) AS total_buts
FROM match_
GROUP BY id_championnat
ORDER BY nb_matchs DESC;


-- Requête 12 : Championnats avec plus d'un match
SELECT
    id_championnat,
    COUNT(*) AS nb_matchs
FROM match_
GROUP BY id_championnat
HAVING COUNT(*) > 1
ORDER BY nb_matchs DESC;


-- Requête 13 : Statistiques participation joueur
SELECT
    id_joueur,
    COUNT(id_match) AS matchs_joues,
    COALESCE(SUM(nb_but),0) AS total_buts,
    COALESCE(SUM(nb_passe_decisives),0) AS total_passes,
    COALESCE(SUM(nb_cartons_jaunes),0) AS total_cartons_jaunes,
    COALESCE(SUM(nb_cartons_rouges),0) AS total_cartons_rouges,
    COALESCE(SUM(minutes_jouees),0) AS total_minutes
FROM PARTICIPE
GROUP BY id_joueur
ORDER BY total_buts DESC;


/* PARTIE 3 — JOINTURES                                               */

-- Requête 14 : Résultats des matchs
SELECT
    m.id_match,
    m.date_match,
    dom.nom_equipe AS equipe_domicile,
    m.score_domicile_match AS score_dom,
    m.score_exterieur_match AS score_ext,
    ext.nom_equipe AS equipe_exterieur,
    m.id_championnat
FROM match_ m
JOIN Equipe dom ON m.id_equipe_domicile = dom.id_equipe
JOIN Equipe ext ON m.id_equipe_exterieur = ext.id_equipe
ORDER BY m.date_match ASC;


-- Requête 15 : Joueurs + équipe + entraîneur
SELECT
    j.nom_joueur,
    j.prenom_joueur,
    j.poste_joueur,
    j.numero_maillot_joueur,
    e.nom_equipe,
    en.nom_entraineur,
    en.prenom_entraineur
FROM Joueur j
JOIN Equipe e ON j.id_equipe = e.id_equipe
JOIN Entraineur en ON e.id_entraineur = en.id_entraineur
ORDER BY e.nom_equipe, j.poste_joueur, j.nom_joueur;


-- Requête 16 : Performances des joueurs par match
SELECT
    j.nom_joueur,
    j.prenom_joueur,
    e.nom_equipe,
    p.id_match,
    m.date_match,
    p.minutes_jouees,
    p.nb_but,
    p.nb_passe_decisives,
    p.nb_cartons_jaunes,
    p.nb_cartons_rouges
FROM PARTICIPE p
JOIN Joueur j ON p.id_joueur = j.id_joueur
JOIN Equipe e ON j.id_equipe = e.id_equipe
JOIN match_ m ON p.id_match = m.id_match
ORDER BY m.date_match, j.nom_joueur;


-- Requête 17 : Équipes avec leur championnat
SELECT
    e.nom_equipe,
    e.ville_equipe,
    c.nom_championnat,
    c.pays_championnat,
    c.saison_championnat,
    pc.classement_championnat
FROM Equipe e
JOIN PARTICIPER_CHAMPIONNAT pc ON e.id_equipe = pc.id_equipe
JOIN championnat c ON pc.id_championnat = c.id_championnat
ORDER BY c.nom_championnat, pc.classement_championnat;


-- Requête 18 : Joueurs même sans match
SELECT
    j.nom_joueur,
    j.prenom_joueur,
    j.poste_joueur,
    j.id_equipe,
    p.id_match,
    p.nb_but,
    p.minutes_jouees
FROM Joueur j
LEFT JOIN PARTICIPE p ON j.id_joueur = p.id_joueur
ORDER BY j.id_equipe, j.nom_joueur;


-- Requête 19 : Entraîneurs même sans équipe
SELECT
    en.nom_entraineur,
    en.prenom_entraineur,
    en.nationalite_entraineur,
    e.nom_equipe,
    e.ville_equipe
FROM Entraineur en
LEFT JOIN Equipe e ON en.id_entraineur = e.id_entraineur
ORDER BY en.nom_entraineur;


/* PARTIE 4 — SOUS-REQUÊTES                                           */
*
-- Requête 20 : Joueurs n'ayant participé à aucun match
SELECT
    j.nom_joueur,
    j.prenom_joueur,
    j.poste_joueur,
    j.id_equipe
FROM Joueur j
WHERE j.id_joueur NOT IN (
    SELECT DISTINCT id_joueur
    FROM PARTICIPE
)
ORDER BY j.id_equipe, j.nom_joueur;


-- Requête 21 : Équipes ayant joué à domicile
SELECT
    id_equipe,
    nom_equipe,
    ville_equipe
FROM Equipe
WHERE id_equipe IN (
    SELECT DISTINCT id_equipe_domicile
    FROM match_
)
ORDER BY nom_equipe;


-- Requête 22 : Équipes sans match à domicile
SELECT
    id_equipe,
    nom_equipe,
    ville_equipe
FROM Equipe
WHERE id_equipe NOT IN (
    SELECT DISTINCT id_equipe_domicile
    FROM match_
)
ORDER BY nom_equipe;


-- Requête 23 : Joueurs dans une équipe inscrite à un championnat
SELECT
    j.nom_joueur,
    j.prenom_joueur,
    j.poste_joueur,
    j.id_equipe
FROM Joueur j
WHERE EXISTS (
    SELECT 1
    FROM PARTICIPER_CHAMPIONNAT pc
    WHERE pc.id_equipe = j.id_equipe
)
ORDER BY j.id_equipe, j.poste_joueur;


-- Requête 24 : Joueurs dans une équipe non inscrite
SELECT
    j.nom_joueur,
    j.prenom_joueur,
    j.id_equipe
FROM Joueur j
WHERE NOT EXISTS (
    SELECT 1
    FROM PARTICIPER_CHAMPIONNAT pc
    WHERE pc.id_equipe = j.id_equipe
)
ORDER BY j.id_equipe;


-- Requête 25 : Gros scores domicile par rapport aux déplacements de l'Inter
SELECT
    m.id_match,
    m.date_match,
    dom.nom_equipe AS equipe_domicile,
    m.score_domicile_match,
    m.score_exterieur_match,
    ext.nom_equipe AS equipe_exterieur
FROM match_ m
JOIN Equipe dom ON m.id_equipe_domicile = dom.id_equipe
JOIN Equipe ext ON m.id_equipe_exterieur = ext.id_equipe
WHERE m.score_domicile_match > ALL (
    SELECT score_exterieur_match
    FROM match_
    WHERE id_equipe_exterieur = 'INT'
)
ORDER BY m.score_domicile_match DESC;


-- Requête 26 : Matchs offensifs par rapport aux scores du PSG à l'extérieur
SELECT
    m.id_match,
    m.date_match,
    dom.nom_equipe AS equipe_domicile,
    m.score_domicile_match,
    m.score_exterieur_match,
    ext.nom_equipe AS equipe_exterieur
FROM match_ m
JOIN Equipe dom ON m.id_equipe_domicile = dom.id_equipe
JOIN Equipe ext ON m.id_equipe_exterieur = ext.id_equipe
WHERE m.score_domicile_match > ANY (
    SELECT score_exterieur_match
    FROM match_
    WHERE id_equipe_exterieur = 'PSG'
)
ORDER BY m.date_match;


-- Requête 27 : Joueurs ayant le record de buts dans un match
SELECT
    j.nom_joueur,
    j.prenom_joueur,
    e.nom_equipe,
    p.id_match,
    p.nb_but
FROM PARTICIPE p
JOIN Joueur j ON p.id_joueur = j.id_joueur
JOIN Equipe e ON j.id_equipe = e.id_equipe
WHERE p.nb_but = (
    SELECT MAX(nb_but)
    FROM PARTICIPE
)
ORDER BY j.nom_joueur;
