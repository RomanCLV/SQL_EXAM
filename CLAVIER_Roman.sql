-- GA - AN1 - [CLAVIER Roman] - MYSQL 

-- Questions

-- 1) La principale différence entre les moteurs de stockage MyISAM et InnoDB, est qu'InnoDB est un moteur relationnel.
--     MyISAM est plus vieux et ne gère pas les clés étrangères comme le fait très bien InnoDB.

-- 2) Une requête corrélée / imbriquée est une requête qui contient plusieurs SELECT ainsi que des jointures. 
--     C'est une requête avec plusieurs requêtes à l'intérieur, permetant ainsi de faire des requêtes plus complexes.

-- 3) La clause UNION permet des regrouper au sein d'un même tableau, plusieurs requêtes, et supprime tous les doublons.
--     La clause UNION ALL regroupe aussi plusieurs requêtes dans un même tableau, mais ne supprime pas les doublons.

-- 4) Une clé étrangère permet de lier une colonne d'une table à  une colonne d'une autre table. Cela permet également de faire des modifications
--    à la chaîne dites en "cascade" si on a précisé la valeur "CASCADE" aux clauses ON DELETE  et / ou ON UPDATE lors de sa création.

-- 5) Un message peut êrte long ou court donc le meilleur type à utiliser est le type TEXT


-- Requêtes

-- 1) Importation via phpMyAdmin

-- 2) 
-- Marche pour récupérer uniquement le plus vieux
-- SELECT nom, prenom, TIMESTAMPDIFF(YEAR, `date_naissance`, NOW()) as age  from joueurs 
-- WHERE 1
-- ORDER BY age DESC
-- LIMIT 1

-- Marche pour récupérer uniquement le plus jeune
-- SELECT `nom`, `prenom`, TIMESTAMPDIFF(YEAR, `date_naissance`, NOW()) as age FROM `joueurs`
-- Where 1
-- ORDER BY age ASC
-- LIMIT 1

-- L'union des deux ne marche pas
SELECT nom, prenom, TIMESTAMPDIFF(YEAR, `date_naissance`, NOW()) as age  from joueurs 
WHERE 1
ORDER BY age ASC
LIMIT 1
UNION
SELECT nom, prenom, TIMESTAMPDIFF(YEAR, `date_naissance`, NOW()) as age  from joueurs 
WHERE 1
ORDER BY age DESC
LIMIT 1;

-- 3)
SELECT (age_vieux - age_jeune) as diff_age
FROM 
(	SELECT TIMESTAMPDIFF(YEAR, `date_naissance`, NOW()) as age_v
	FROM joueurs ORDER BY age_v DESC LIMIT 1
) as age_vieux,
(
    SELECT TIMESTAMPDIFF(YEAR, `date_naissance`, NOW()) as age_j
	FROM joueurs ORDER BY age_j ASC LIMIT 1
) as age_jeune;

-- 4) Pas réussi à selectionner uniquement >= 4
-- J'ai essayé WHERE NbJoueurs >= 4 mais NbJoueurs est inconnu
SELECT E.nom as nomEquipe, COUNT(E.id) as NbJoueurs FROM `assoc_j_e` as AJE
LEFT JOIN equipes as E
	ON AJE.id_equipe = E.id
WHERE 1
GROUP BY nomEquipe
ORDER BY NbJoueurs ASC;

-- 5)
INSERT INTO `joueurs` (`nom`, `prenom`, `date_naissance`, `taille`, `poste`) 
VALUES ("Spielberg", "Steven", '1999-03-05', 186, "Gardien");
INSERT INTO `assoc_j_e`(`id_joueur`, `id_equipe`, `date_entree`) VALUES (29, 1, CURRENT_DATE);

-- 6)
 SELECT J.nom, J.prenom, N.nom FROM `assoc_j_c` as AJC
LEFT JOIN rencontres as R
	ON AJC.`id_rencontre` = R.id
LEFT JOIN joueurs as J
	ON AJC.`id_joueur` = J.id
LEFT JOIN assoc_j_n as AJN
	ON J.id = AJN.id_joueur
LEFT JOIN nationalite as N
	ON AJN.id_nationalite = N.id
WHERE YEAR(R.date_match) = 2018;

-- 7)
SELECT * FROM assoc_j_n as AJN
WHERE NOT EXISTS (SELECT * FROM nationalite WHERE AJN.id_nationalite = id);

-- 8)
UPDATE `joueurs` SET `date_naissance`='1998-02-06' WHERE `nom`="Spielberg" AND `prenom`="Steven" ;

-- 9)
SELECT J.nom as nom, J.prenom as prenom, LENGTH(J.nom) as longueur_nom FROM `joueurs` as J

WHERE J.prenom LIKE '%p%'
ORDER BY J.nom ASC;

-- 10)
SELECT COUNT(*) as nb_nationalite, 
(SELECT COUNT(*) FROM joueurs) as nb_joueur,
(SELECT COUNT(*) FROM equipes) as nb_equipe,
(SELECT COUNT(*) FROM cartons) as nb_carton,
(SELECT SUM(budget) FROM equipes) as somme_budget
FROM nationalite
WHERE 1;

-- 11)

-- 12)

-- 13)
-- pas reussi à prendre uniquement les joueurs du AS Monaco car WHERE (N.`nom`="Argentine" OR N.`nom`="Allemagne") AND club = "AS Monaco" dit que club n'existe pas
SELECT J.nom, J.prenom, N.nom as nationalite, E.nom as club FROM `nationalite` as N
LEFT JOIN assoc_j_n as AJN
	ON AJN.id_nationalite = N.id
LEFT JOIN joueurs as J
	ON J.id = AJN.id_joueur
LEFT JOIN assoc_j_e as AJE
	ON AJE.id_joueur = J.id
LEFT JOIN equipes as E
	ON E.id = AJE.id_equipe

WHERE (N.`nom`="Argentine" OR N.`nom`="Allemagne");

-- 14)
SELECT CONCAT(J.nom, " ", J.prenom) as nom_prenom FROM `equipes` as E
LEFT JOIN assoc_j_e as AJE
	ON AJE.id_equipe = E.id
LEFT JOIN joueurs as J
   ON J.id = AJE.id_joueur
WHERE E.`nom` = "PSG";

-- 15)
SELECT J.nom, J.prenom FROM `nationalite` as N 
LEFT JOIN assoc_j_n as AJN
	ON AJN.id_nationalite = N.id
LEFT JOIN joueurs as J
	ON J.id = AJN.id_joueur
LEFT JOIN assoc_j_c as AJC
	ON AJC.id_joueur = J.id
WHERE N.`nom` = "Allemagne" AND AJC.id_carton = 1
GROUP BY J.nom ASC;
-- 16)

-- 17)
SELECT * FROM `joueurs` WHERE TIMESTAMPDIFF(YEAR, `date_naissance`, NOW()) >= 23;

-- 18)
SELECT * FROM `joueurs` WHERE id > 2 AND id < 11;
-- 19)
-- Récupérez le nom de qui ?  le total de but marqué par qui ? et la moyenne des buts marqués par quoi ?

-- 20)
ALTER TABLE `rencontres` ADD CONSTRAINT `rencontres_ibfk_2` FOREIGN KEY (`equipe_exterieur`) REFERENCES `equipes`(`id`) ON DELETE CASCADE ON UPDATE CASCADE; 

-- 21)
DELETE FROM `joueurs` WHERE id=29;