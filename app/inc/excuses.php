<?php

function getExcuses($conn, $thematique)
{
    // 1. Préparation de la requête
    $sql = 'SELECT * FROM excuses WHERE idThematique = :thematique';
    $stmt = $conn->prepare($sql);

    // 2. Exécution de la requête
    $stmt->execute(['thematique' => $thematique]);

    // 3. Récupération des résultats
    return $stmt->fetchAll();
}