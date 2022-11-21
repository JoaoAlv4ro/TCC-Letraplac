<?php 

    $Host = 'localhost';    
    $User = 'root';
    $Password = '';
    $dbName = 'Bd_Letraplac';

    $conn = new mysqli($Host, $User, $Password, $dbName);
    
    if($conn->error){
        die("Falha ao conectar ao banco dados: " . $conn->error);
    }
?>