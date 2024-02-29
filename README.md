# Générateur d'excuses créatives - Corrigé

[toc]

v0.1

---

# Préparez la base de donées

Le script situé dans le dossier **DATA** contient un script qui va créer la base, créer un utilisateur et enfin, créer la table.

Que ce soit via le docker ou votre propre serveur, ces données (identifiant et mot de passe) sont utilisées dans le code proposé.
A vous de le modifier si besoin!

# Lancement via Docker

Allez dans le dossier Docker et tapez la commande:

```bash
cd Docker
bin/start
```

Plus d'informations sur le docker et sa configuration dans le dossier **Docker**

---
## Consignes

Voici un TP **noté** à réaliser durant les vacances.

**Pour les apprentis, vous êtes invités à revenir vers moi pour aménager ce devoir de vacances.**

Vous allez reproduire ce qui a été vu en cours sur vos machines personnelles afin de réaliser ce TP.

Je resterai joignable et disponible **jusqu'à vendredi après midi pour un soutien à l'installation de WSL et de la stack de développement** sur vos machines personnelles.
**Durant les vacances, je ne répondrai qu'aux questions liées au TP** lui même.


---
## Objectifs

- Utiliser PDO pour accéder aux données
- Récupérer les informations d'un formulaire HTML
- Utiliser Javascript pour vérifier les saisies de l'utilisateur et modifier l'apparence d'une page HTML et afficher les résultats

---
## Contexte

Générer ou afficher des excuses en fonction de critères sélectionnés.

---
## Pré-requis

- Serveur de base de données accessible
- Serveur Web avec PHP installé
---
## Attendu

Vous devrez remettre un rapport au format **Markdown** comprenant vos réponses ainsi que les impressions écrans éventuellement demandées.

Vous remettrez votre travail dans une archive **zip** qui contiendra le dossier de votre application ainsi que le rapport.

Le travail demandé sera demandé sous la forme suivante:

> ***
> 🚀 **Travail à faire:**
> * Instruction 1
> * Instruction 2
> ***
---
## A relire

- Cours sur la WSL
    - *SLAM1\COURSNC\B2\01 - WSL*
- Cours sur Javascript - Le contrôle du DOM
    - *SLAM1\COURSNC\B2\02 - Javascript*
- Cours sur PHP
    - Gestion des formulaires
    - Accès aux données

---
## Données fournies

Vous disposez du code SQL suivant à saisir dans **mariadb**.
```sql
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
```

> ***
> 🚀 **Travail à faire:**
> * Réaliser le schéma de la base de données correspondant aux tables fournies dans le code sql.
> * Comment sont liées ces deux tables?
> ***

Vous disposez à présent d'une **base de données complète** à laquelle l'utilisateur précédemment créé a accès.

---
## Dossier de travail

Dans le **dossier racine** de votre serveur web, vous allez créer le dossier **GenerateurExcusesCreatives**.

> ***
> 🚀 **Travail à faire:**
> * Quel est le chemin pour accéder à ce **dossier racine**?
> * Comment nomme-t- on ce dossier en **anglais** (et donc dans beaucoup de documentations ou manuels)?
> ***
---
### Formulaire HTML

Dans ce dossier, vous allez créer le fichier **index.html** dans lequel vous rédigerez un document HTML avec les recommandations suivantes:

- Langue de la page en **français**
- Utilisation des caractères en **UTF-8**
- Titre de la page: **Générateur d'excuses créatives**
- Titre de niveau 1: **Générateur**
- Texte au dessus du formulaire:
    - *Veuillez choisir votre thématique pour recevoir une excuse.*
- Formulaire
    - Id: *formulaireExcuse*
    - Action: *traitement.php*
    - Méthode: *POST*

    - Champs de saisie (INPUT):
        - Zone de sélection de la thématique (nom: *thematique*)
            - Choix
                - 	Affichage: *Retard*
                - 	Valeur: *1*
            - Choix
                - 	Affichage: *Devoir non fait*
                - 	Valeur: *2*
        - 	Bouton de soumission

> ***
> 🚀 **Travail à faire:**
> * Rédiger le fichier HTML en prenant soin de respecter TOUTES les consignes.
> ***
---
### Vérification en Javascript

Vous lierez au fichier HTML un script **Javascript** qui devra:

- Vérifier la saisie des input
- A l'événement **submit** du formulaire ayant l'id formulaireExcuse:
    - Affichage du texte "Excuse en génération" dans la zone de texte sur la page HTML

---
### Script de traitement PHP

Dans ce dossier, vous allez créer le fichier **traitement.php** dans lequel vous rédigerez un script qui:
- Va se connecter au serveur de base de données
- Créer une requête pour aller chercher une excuse **ayant la thématique reçue en paramètre**.
- Afficher le plus joliment possible la ou les excuses reçues.

> ***
> 🚀 **Travail à faire:**
> * Comment allez-vous récupérer le paramètre dans le script PHP?
> * Rédiger le script PHP
> * N'oubliez pas les indentations et les commentaires
> ***
---
## Compléments

A la fin de votre script ajoutez les lignes suivantes:
```php
echo '<br><br>';
echo '<ul><li>';
echo '<a href="index.html">Retour à l\'accueil</a>';
echo '</li><li>';
echo '<a href="ajout.html">Ajouter une excuse</a>';
echo '</li></ul>';
```

Elles permettront d'afficher des liens de retour vers la page HTML **index** et vers la pahe HTML que vous allez créer ensuite.

---
## Formulaire d'ajout HTML

Dans ce fichier HTML nommé **ajout.html** et qui sera placé dans le même dossier que **index.html** et **traitement.php**, vous rédigerez un formulaire qui concrétisera la maquette suivante:

![a1047a0a3a53c98fe33fbd0b17eb7886.png](:/f48c34ea2b7c484e9a8a79c8ae1c675c)

> Ne cherchez pas à reproduire l'apparence de cette maquette! Concentrez vous sur le fonctionnement!

Ce formulaire utilisera comme action **ajout.php**.

> ***
> 🚀 **Travail à faire:**
> * Rédiger le script HTML
> * Ajoutez lui un script Javascript qui va **vérifier que l'excuse saisie a une longueur comprise entre 20 et 100 caractères.**
> ***
---
## Script d'ajout

Créez un fichier **ajout.php** qui va gérer l'ajout dans la base d'une nouvelle excuse.
Rédigez le script en vous appuyant sur le cours.

En consultant la documentation de PHP, cherchez la méthode qui permettra de faire une **redirection** sur la page d'accueil.

> Indice: Il y a un lien avec des *en têtes*...

> ***
> 🚀 **Travail à faire:**
> * Quelle est la requête qui sera utilisée pour ajouter une excuse dans la base?
> * En consultant la documentation de PHP, cherchez la méthode de redirection et utilisez là.
> ***
---

# Bonus

Complétez cette application!
Par exemple:
- Chechez à afficher TOUTES les excuses
- Réalisez un menu de navigation
- Soyez créatifs!
