
-- 1. INSERTION DES ENTRAINEURS
INSERT INTO Entraineur VALUES 
    ('ENR_H_ESP', 'Luis', 'Enrique', 'Espagne'),
    ('XAV_H_ESP', 'Xavi', 'Hernandez', 'Espagne'),
    ('ANC_C_ITA', 'Carlo', 'Ancelotti', 'Italie'),
    ('GUA_P_ESP', 'Pep', 'Guardiola', 'Espagne'),
    ('TUC_T_ALM', 'Thomas', 'Tuchel', 'Allemagne'),
    ('INZ_S_ITA', 'Simone', 'Inzaghi', 'Italie');

-- 2. INSERTION DES CHAMPIONNATS
INSERT INTO championnat VALUES 
    ('FRLI24', 'Ligue 1', 'France', 2024),
    ('ESLA24', 'La Liga', 'Espagne', 2024),
    ('ENPL24', 'Premier League', 'Angleterre', 2024),
    ('ITSA24', 'Serie A', 'Italie', 2024),
    ('DEBU24', 'Bundesliga', 'Allemagne', 2024);

-- 3. INSERTION DES ÉQUIPES
INSERT INTO Equipe VALUES 
    ('PSG', 'Paris Saint-Germain', 'Paris', 'ENR_H_ESP'),
    ('BAR', 'FC Barcelona', 'Barcelone', 'XAV_H_ESP'),
    ('RMA', 'Real Madrid', 'Madrid', 'ANC_C_ITA'),
    ('MCI', 'Manchester City', 'Manchester', 'GUA_P_ESP'),
    ('BAY', 'Bayern Munich', 'Munich', 'TUC_T_ALM'),
    ('INT', 'Inter Milan', 'Milan', 'INZ_S_ITA');

-- 4. INSERTION DES JOUEURS

-- 4.1 Paris Saint-Germain (PSG)
INSERT INTO Joueur VALUES 
    ('PSG1',  'Donnarumma',  'Gianluigi',  '1999-02-25', 'Italie',    'Gardien',    1,  'PSG'),
    ('PSG2',  'Hakimi',      'Achraf',     '1998-11-04', 'Maroc',     'Defenseur',  2,  'PSG'),
    ('PSG5',  'Marquinhos',  'Marcos',     '1994-05-14', 'Bresil',    'Defenseur',  5,  'PSG'),
    ('PSG37', 'Skriniar',    'Milan',      '1995-02-11', 'Slovaquie', 'Defenseur',  37, 'PSG'),
    ('PSG25', 'Nuno Mendes', 'Nuno',       '2002-06-19', 'Portugal',  'Defenseur',  25, 'PSG'),
    ('PSG17', 'Vitinha',     'Vitor',      '2000-02-13', 'Portugal',  'Milieu',     17, 'PSG'),
    ('PSG4',  'Ugarte',      'Manuel',     '2001-04-11', 'Uruguay',   'Milieu',     4,  'PSG'),
    ('PSG33', 'Zaïre-Emery', 'Warren',     '2006-03-08', 'France',    'Milieu',     33, 'PSG'),
    ('PSG10', 'Dembele',     'Ousmane',    '1997-05-15', 'France',    'Attaquant',  10, 'PSG'),
    ('PSG23', 'Kolo Muani',  'Randal',     '1998-12-05', 'France',    'Attaquant',  23, 'PSG'),
    ('PSG11', 'Asensio',     'Marco',      '1996-01-21', 'Espagne',   'Attaquant',  11, 'PSG');

-- 4.2 FC Barcelone (BAR)
INSERT INTO Joueur VALUES 
    ('BAR1',  'Ter Stegen',    'Marc',     '1992-04-30', 'Allemagne', 'Gardien',    1,  'BAR'),
    ('BAR23', 'Kounde',        'Jules',    '1998-11-12', 'France',    'Defenseur',  23, 'BAR'),
    ('BAR4',  'Araujo',        'Ronald',   '1999-03-07', 'Uruguay',   'Defenseur',  4,  'BAR'),
    ('BAR15', 'Christensen',   'Andreas',  '1996-04-10', 'Danemark',  'Defenseur',  15, 'BAR'),
    ('BAR3',  'Balde',         'Alejandro','2003-10-18', 'Espagne',   'Defenseur',  3,  'BAR'),
    ('BAR21', 'De Jong',       'Frenkie',  '1997-05-12', 'Pays-Bas',  'Milieu',     21, 'BAR'),
    ('BAR8',  'Pedri',         'Pedro',    '2002-11-25', 'Espagne',   'Milieu',     8,  'BAR'),
    ('BAR22', 'Gundogan',      'Ilkay',    '1990-10-24', 'Allemagne', 'Milieu',     22, 'BAR'),
    ('BAR9',  'Lewandowski',   'Robert',   '1988-08-21', 'Pologne',   'Attaquant',  9,  'BAR'),
    ('BAR11', 'Raphinha',      'Raphael',  '1996-12-14', 'Bresil',    'Attaquant',  11, 'BAR'),
    ('BAR27', 'Lamine Yamal',  'Lamine',   '2007-07-13', 'Espagne',   'Attaquant',  27, 'BAR');

-- 4.3 Real Madrid (RMA)
INSERT INTO Joueur VALUES 
    ('RMA1',  'Courtois',    'Thibaut',    '1992-05-11', 'Belgique',  'Gardien',    1,  'RMA'),
    ('RMA2',  'Carvajal',    'Daniel',     '1992-01-11', 'Espagne',   'Defenseur',  2,  'RMA'),
    ('RMA22', 'Rudiger',     'Antonio',    '1993-03-03', 'Allemagne', 'Defenseur',  22, 'RMA'),
    ('RMA4',  'Alaba',       'David',      '1992-06-24', 'Autriche',  'Defenseur',  4,  'RMA'),
    ('RMA23', 'Mendy',       'Ferland',    '1995-06-08', 'France',    'Defenseur',  23, 'RMA'),
    ('RMA18', 'Tchouameni',  'Aurelien',   '2000-01-27', 'France',    'Milieu',     18, 'RMA'),
    ('RMA12', 'Camavinga',   'Eduardo',    '2002-11-10', 'France',    'Milieu',     12, 'RMA'),
    ('RMA15', 'Valverde',    'Federico',   '1998-07-22', 'Uruguay',   'Milieu',     15, 'RMA'),
    ('RMA5',  'Bellingham',  'Jude',       '2003-06-29', 'Angleterre','Milieu',     5,  'RMA'),
    ('RMA7',  'Vinicius',    'Junior',     '2000-07-12', 'Bresil',    'Attaquant',  7,  'RMA'),
    ('RMA11', 'Rodrygo',     'Goes',       '2001-01-09', 'Bresil',    'Attaquant',  11, 'RMA');

-- 4.4 Manchester City (MCI)
INSERT INTO Joueur VALUES 
    ('MCI31', 'Ederson',      'Moraes',     '1993-08-17', 'Bresil',    'Gardien',    31, 'MCI'),
    ('MCI2',  'Walker',       'Kyle',       '1990-05-28', 'Angleterre','Defenseur',  2,  'MCI'),
    ('MCI3',  'Dias',         'Ruben',      '1997-05-14', 'Portugal',  'Defenseur',  3,  'MCI'),
    ('MCI5',  'Stones',       'John',       '1994-05-28', 'Angleterre','Defenseur',  5,  'MCI'),
    ('MCI24', 'Gvardiol',     'Josko',      '2002-01-23', 'Croatie',   'Defenseur',  24, 'MCI'),
    ('MCI16', 'Rodri',        'Rodrigo',    '1996-06-22', 'Espagne',   'Milieu',     16, 'MCI'),
    ('MCI17', 'De Bruyne',    'Kevin',      '1991-06-28', 'Belgique',  'Milieu',     17, 'MCI'),
    ('MCI20', 'Bernardo Silva','Bernardo',  '1994-08-10', 'Portugal',  'Milieu',     20, 'MCI'),
    ('MCI47', 'Foden',        'Phil',       '2000-05-28', 'Angleterre','Milieu',     47, 'MCI'),
    ('MCI9',  'Haaland',      'Erling',     '2000-07-21', 'Norvege',   'Attaquant',  9,  'MCI'),
    ('MCI11', 'Doku',         'Jeremy',     '2002-05-27', 'Belgique',  'Attaquant',  11, 'MCI');

-- 4.5 Bayern Munich (BAY)
INSERT INTO Joueur VALUES 
    ('BAY1',  'Neuer',       'Manuel',     '1986-03-27', 'Allemagne', 'Gardien',    1,  'BAY'),
    ('BAY6',  'Kimmich',     'Joshua',     '1995-02-08', 'Allemagne', 'Defenseur',  6,  'BAY'),
    ('BAY4',  'De Ligt',     'Matthijs',   '1999-08-12', 'Pays-Bas',  'Defenseur',  4,  'BAY'),
    ('BAY2',  'Upamecano',   'Dayot',      '1998-10-27', 'France',    'Defenseur',  2,  'BAY'),
    ('BAY19', 'Davies',      'Alphonso',   '2000-11-02', 'Canada',    'Defenseur',  19, 'BAY'),
    ('BAY8',  'Goretzka',    'Leon',       '1995-02-06', 'Allemagne', 'Milieu',     8,  'BAY'),
    ('BAY42', 'Musiala',     'Jamal',      '2003-02-26', 'Allemagne', 'Milieu',     42, 'BAY'),
    ('BAY10', 'Sane',        'Leroy',      '1996-01-11', 'Allemagne', 'Milieu',     10, 'BAY'),
    ('BAY11', 'Coman',       'Kingsley',   '1996-06-13', 'France',    'Attaquant',  11, 'BAY'),
    ('BAY9',  'Kane',        'Harry',      '1993-07-28', 'Angleterre','Attaquant',  9,  'BAY'),
    ('BAY7',  'Gnabry',      'Serge',      '1995-07-14', 'Allemagne', 'Attaquant',  7,  'BAY');

-- 4.6 Inter Milan (INT)
INSERT INTO Joueur VALUES 
    ('INT1',  'Sommer',      'Yann',       '1988-12-17', 'Suisse',    'Gardien',    1,  'INT'),
    ('INT36', 'Darmian',     'Matteo',     '1989-12-02', 'Italie',    'Defenseur',  36, 'INT'),
    ('INT15', 'Acerbi',      'Francesco',  '1988-02-10', 'Italie',    'Defenseur',  15, 'INT'),
    ('INT95', 'Bastoni',     'Alessandro', '1999-04-13', 'Italie',    'Defenseur',  95, 'INT'),
    ('INT32', 'Dimarco',     'Federico',   '1997-11-10', 'Italie',    'Defenseur',  32, 'INT'),
    ('INT23', 'Barella',     'Nicolo',     '1997-02-07', 'Italie',    'Milieu',     23, 'INT'),
    ('INT20', 'Calhanoglu',  'Hakan',      '1994-02-08', 'Turquie',   'Milieu',     20, 'INT'),
    ('INT22', 'Mkhitaryan',  'Henrikh',    '1989-01-21', 'Armenie',   'Milieu',     22, 'INT'),
    ('INT9',  'Thuram',      'Marcus',     '1997-08-06', 'France',    'Attaquant',  9,  'INT'),
    ('INT10', 'Lautaro',     'Martinez',   '1997-08-22', 'Argentine', 'Attaquant',  10, 'INT'),
    ('INT8',  'Arnautovic',  'Marko',      '1989-04-19', 'Autriche',  'Attaquant',  8,  'INT');

-- 5. PARTICIPATION AUX CHAMPIONNATS
INSERT INTO PARTICIPER_CHAMPIONNAT VALUES 
    ('PSG', 'FRLI24', 1),  -- Paris SG en Ligue 1
    ('BAR', 'ESLA24', 1),  -- Barcelone en Liga
    ('RMA', 'ESLA24', 2),  -- Real Madrid en Liga
    ('MCI', 'ENPL24', 1),  -- Manchester City en Premier League
    ('INT', 'ITSA24', 1),  -- Inter Milan en Serie A
    ('BAY', 'DEBU24', 1),  -- Bayern Munich en Bundesliga
    

-- 6. INSERTION DES MATCHS

INSERT INTO match_ VALUES
('MAT001','2024-09-01','21:00:00','Parc des Princes',2,1,'PSG','BAR'),
('MAT002','2024-09-02','20:45:00','Santiago Bernabeu',3,2,'RMA','PSG'),
('MAT003','2024-09-03','21:00:00','Etihad Stadium',1,1,'MCI','PSG'),
('MAT004','2024-09-04','20:30:00','Allianz Arena',2,0,'BAY','PSG'),

('MAT005','2024-09-05','21:00:00','Camp Nou',2,2,'BAR','RMA'),
('MAT006','2024-09-06','21:00:00','Santiago Bernabeu',3,1,'RMA','BAR'),

('MAT007','2024-09-07','20:45:00','Etihad Stadium',3,2,'MCI','BAY'),
('MAT008','2024-09-08','20:45:00','Etihad Stadium',2,0,'MCI','INT'),

('MAT009','2024-09-09','20:45:00','San Siro',1,1,'INT','PSG'),
('MAT010','2024-09-10','20:45:00','San Siro',0,2,'INT','RMA'),

('MAT011','2024-09-11','20:30:00','Allianz Arena',2,1,'BAY','INT'),
('MAT012','2024-09-12','20:30:00','Allianz Arena',3,2,'BAY','BAR');