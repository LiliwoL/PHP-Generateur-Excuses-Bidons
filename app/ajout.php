<?php

// Inclusions des dépendances
global $conn;
require_once 'config/config.php';
require_once 'inc/excuses.php';

// 1. Récupération des paramètres
$thematique = $_POST['thematique'] ?? null;
$excuse = $_POST['excuse'] ?? null;

// 2. Validation des paramètres
if ($thematique === null || !in_array($thematique, [1, 2]) )
{
    echo 'Erreur : thématique manquante ou non valide';
    exit;
}

if ($excuse === null || strlen($excuse) < 10)
{
    echo 'Erreur : excuse manquante ou trop courte';
    exit;
}


// 3. Ajout de l'excuse
$idNewExcuse = addExcuses($conn, $thematique, $excuse);

// 4. Récupération des excuses
$excuses = getExcuse($conn, $thematique, false);

// 5. Affichage des excuses avec a nouvelles incluse
echo '<h1>Excuses pour la thématique</h1>';
echo '<h2>' . $thematique . '</h2>';
echo '<ul>';
    foreach ($excuses as $excuse)
    {
        // Mise en avant de la nouvelle excuse
        if ($excuse['idExcuse'] == $idNewExcuse)
            echo '<li><strong>' . $excuse['excuse'] . '</strong></li>';
        else
            echo '<li>' . $excuse['excuse'] . '</li>';
    }
echo '</ul>';



// Affichage du menu
echo '<br><br>';
echo '<ul><li>';
echo '<a href="index.html">Retour à l\'accueil</a>';
echo '</li><li>';
echo '<a href="ajout.html">Ajouter une excuse</a>';
echo '</li></ul>';