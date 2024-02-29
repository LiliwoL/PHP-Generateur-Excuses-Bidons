/* Création de la base de données */
CREATE DATABASE IF NOT EXISTS excuses;

/* Données */
/* ================================== */
-- Création de la table "Themes"
CREATE TABLE IF NOT EXISTS Themes (
    idThematique INT AUTO_INCREMENT PRIMARY KEY,
    nomThematique VARCHAR(50) NOT NULL
);

-- Insertion des thèmes
INSERT INTO Themes (nomThematique) VALUES
('Retard'),
('Devoir non fait'),
('Panne de réveil'),
('Flemme'),
('Oubli');



/* Création de la table "Excuses" */
CREATE TABLE IF NOT EXISTS Excuses (
    idExcuse INT AUTO_INCREMENT PRIMARY KEY,
    idThematique INT,
    excuse TEXT,
    FOREIGN KEY (idThematique) REFERENCES Themes(idThematique) -- Assurez-vous de remplacer "Themes" par le nom de votre table de thèmes
);

-- Insertion des excuses pour chaque thématique
INSERT INTO Excuses (idThematique, excuse) VALUES
-- Excuses pour le retard
(1, "En suivant le chemin labyrinthique de ma chambre, mes horloges biologiques ont été victimes d'une déconnexion spaciotemporelle, aboutissant à mon arrivée tardive ici, entraîné malgré moi par les circonvolutions du continuum espace-temps."),
(1, "Mes notes, submergées par l'impitoyable tourbillon d'obligations interdimensionnelles, ont fini par être englouties dans un vortex de distractions irrésistibles."),
(1, "Mon cactus a organisé une manifestation pour plus d'eau, retardant involontairement mon arrivée."),
(1, "Mon hamster a entrepris une escapade sauvage dans les dédales de ma chambre, entraînant un retard imprévu."),
(1, "En tentant de contourner l'effondrement cataclysmique de mon espace de travail, j'ai été pris au piège dans un tourbillon de paperasse, retardant mon départ."),
(1, "Un incident intergalactique a temporairement perturbé mes communications avec le monde extérieur, retardant ainsi mon arrivée."),
(1, "Mon horloge biologique, confuse par les cycles lunaires erratiques, a décidé d'instaurer son propre fuseau horaire, me laissant dans un état de confusion quant à l'heure réelle."),
(1, "Mon vaisseau spatial, victime d'une défaillance temporelle mineure, a été contraint de dériver dans les méandres du continuum espace-temps, entraînant un retard non intentionnel."),
(1, "Un trou de ver temporel, apparu mystérieusement dans mon trajet habituel, m'a catapulté quelques minutes dans le futur, retardant ainsi mon arrivée."),
(1, "Mon sens aigu de la procrastination, exacerbé par une série de distractions cosmiques, m'a retenu dans une spirale d'inaction, retardant malencontreusement mon arrivée."),
(1, "Un phénomène étrange de distorsion temporelle a éclipsé mon horloge, laissant mes perceptions du temps dans un état de confusion fluctuant."),
(1, "Une grève spontanée de fourmis, bloquant l'accès à ma porte, a retardé mon départ inévitable."),
(1, "Mes efforts pour créer une porte dérobée vers une dimension parallèle ont été infructueux, me laissant coincé dans une boucle temporelle inattendue."),
(1, "Un détour imprévu par le sentier de la contemplation philosophique m'a détourné de ma trajectoire temporelle, retardant ainsi mon arrivée inévitable."),
(1, "Mon agenda cosmique, soumis à une série de perturbations interstellaires, a été reprogrammé sans mon consentement, retardant ainsi mes plans terrestres.");

-- Excuses pour le devoir non fait
(2, "Alors que je m'apprêtais à revisiter mes connaissances, ma tortue domestique a manifesté un appétit soudain pour le savoir et dévoré, sans distinction, mon précieux ordinateur portable."),
(2, "Dans une série d'événements d'une ironie extrême, mes notes métamorphosées en combustible spontané ont involontairement servi à allumer les flammes d'un barbecue impromptu."),
(2, "Mon robot aspirateur, se prenant pour un critique gastronomique, a décidé que mes devoirs étaient le plat du jour, les engloutissant avec les miettes d'une critique culinaire robotique."),
(2, "Mes devoirs ont été pris en otage par des pages blanches révolutionnaires, exigeant un traitement littéraire équitable."),
(2, "Mon devoir, plongé dans les affres de la procrastination, a succombé à un sommeil prolongé, repoussant ainsi son inéluctable destin d'être rendu à temps."),
(2, "Mon stylo, dans un acte de rébellion inattendu, a refusé de coopérer avec ma main, laissant mes devoirs inachevés et mes pensées désordonnées."),
(2, "Mes efforts acharnés pour accomplir mes devoirs ont été interrompus par une pluie de météorites informatiques, effaçant toute trace de mon travail acharné."),
(2, "Une perturbation magnétique soudaine a effacé numériquement mes devoirs, les laissant à la merci du vaste néant du cyberespace."),
(2, "Mon esprit a été momentanément détourné par une émission de radio extraterrestre, me laissant dans un état de transe intellectuelle, incapable de me concentrer sur mes devoirs."),
(2, "Une plongée impromptue dans les abysses de la recherche sur Internet m'a emmené dans un voyage labyrinthique, me laissant avec des heures perdues et des devoirs non terminés."),
(2, "Mes tentatives désespérées pour sauver le monde virtuel d'une apocalypse imminente ont détourné mon attention de mes devoirs, les laissant abandonnés dans un coin sombre de mon bureau.");