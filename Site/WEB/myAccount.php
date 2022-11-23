<?php
    include("../PHP/protect.php");
    
    if(!isset($_SESSION)) {
        session_start();
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel do Usuario</title>
</head>
<body>
    Bem vindo ao seu painel, <?php echo $_SESSION['name'];?>

</body>
</html>