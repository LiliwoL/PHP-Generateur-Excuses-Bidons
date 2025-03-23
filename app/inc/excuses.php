<?php

/**
 * Récupère les excuses pour une thématique donnée
 *
 * @param PDO $conn Connexion à la base de données
 * @param int $thematique   Identifiant de la thématique
 * @return array   Tableau associatif des excuses
 */
function getExcuse( PDO $conn, int $thematique, bool $random = true): array
{
    // 1. Préparation de la requête
    if ($random)
        $sql = 'SELECT * FROM Excuses WHERE idThematique = :thematique ORDER BY RAND() LIMIT 1';
    else
        $sql = 'SELECT * FROM Excuses WHERE idThematique = :thematique';

    $stmt = $conn->prepare($sql);

    // 2. Exécution de la requête
    $stmt->execute(['thematique' => $thematique]);

    // 3. Récupération des résultats
    return $stmt->fetchAll();
}

/**
 * Ajoute une excuse pour une thématique donnée
 *
 * @param PDO $conn Connexion à la base de données
 * @param int $thematique   Identifiant de la thématique
 * @param string $excuse    Texte de l'excuse
 *
 * @return int  Identifiant de l'excuse ajoutée
 */
function addExcuses(PDO $conn, int $thematique, string $excuse): int
{
    // 1. Préparation de la requête
    $sql = 'INSERT INTO Excuses (idThematique, excuse) VALUES (:thematique, :excuse)';
    $stmt = $conn->prepare($sql);

    // 2. Exécution de la requête
    $stmt->execute(['thematique' => $thematique, 'excuse' => $excuse]);

    // 3. Récupération de l'identifiant généré par la base de données
    return $conn->lastInsertId();
}