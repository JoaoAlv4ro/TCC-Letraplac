<?php

session_start(); // Iniciar a sessao

// Incluir a conexao com Banco de Dados
include_once "conexao.php";

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8" />
    <title>Lista de usuários</title>
</head>

<body>
<center>
    <a href="index.php">Listar</a><br>

    <h2>Lista de usuários</h2>

    <?php

    if (isset($_SESSION['msg'])) {
        echo $_SESSION['msg'];
        unset($_SESSION['msg']);
    }

    $query_usuarios = "SELECT user_id, user_name, user_email FROM TB_user_login ORDER BY user_id DESC";
    $result_usuarios = $conn->prepare($query_usuarios);
    $result_usuarios->execute();

    while ($row_usuario = $result_usuarios->fetch(PDO::FETCH_ASSOC)) {
        //var_dump($row_usuario);
        extract($row_usuario);
        //echo "ID: " . $row_usuario['id'] . "<br>";
        echo "ID: $user_id <br>";
        echo "Nome: $user_name <br>";
        echo "E-mail: $user_email <br>";
		echo "<a href='proc_apagar_usuario.php?id=" . $row_usuario['user_id'] . "'>Apagar</a><br><hr>";

    }
    ?>

</body>
</center>
</html>
