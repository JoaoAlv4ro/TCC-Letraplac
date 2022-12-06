<?php 
    $Host = 'localhost';    
    $User = 'root';
    $Password = '';
    $dbName = 'DB_Letraplac';

    $conn = mysqli_connect($Host, $User, $Password, $dbName);
    
    if($conn->error){
        die("Falha ao conectar ao banco dados: " . $conn->error);
    }
?>