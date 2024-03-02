<?php

// Inclusions des dépendances
global $conn;
require_once 'config/config.php';
require_once 'inc/excuses.php';

// 1. Récupération du paramètre
$thematique = $_POST['thematique'] ?? null;

// 2. Validation du paramètre
if ($thematique === null || !in_array($thematique, [1, 2]) )
{
    echo 'Erreur : thématique manquante ou non valide';
    exit;
}

// 3. Récupération des excuses
$excuses = getExcuse($conn, $thematique);

// 4. Affichage des excuses
echo '<h1>Excuses pour la thématique</h1>';
echo '<h2>' . $thematique . '</h2>';
echo '<ul>';
    foreach ($excuses as $excuse)
    {
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