<?php
// Identifiants de connexion
$serverName     = 'excuses-db';     // Cf. docker-compose pour avoir le nom du container mysql
$database       = 'excuses';          // Cf. fichier d'environnement pour les variables
$username       = 'sio';
$password       = 'azertysio-01';

try {
    $conn = new PDO("mysql:host=$serverName;dbname=$database", $username, $password);

    // Configuration des Rapports d'erreur
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Connexion réussie au serveur de base de données !";
} catch (PDOException $e) {
    echo "Erreur de connexion au serveur de base de données : " . $e->getMessage();
}