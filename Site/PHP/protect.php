<?php
    if(!isset($_SESSION)) {
        session_start();
    }

    if(!isset($_SESSION['user'])) {
        die("Você não pode acessar esta página pois não está logado!");
        echo "<p> <a href='loginLetraplac.php'> Logar </a> </p>";
    }
?>