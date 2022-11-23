<?php 
    include("../php/config.php");

    if(isset($_POST['email']) || isset($_POST['senha'])) {

        if(strlen($_POST['email']) == 0) { 
            echo "Preencha seu e-mail";
        } 
        else if(strlen($_POST['senha']) == 0) {
            echo "Preencha sua senha";
        } 
        else {
            $email =  $conn->real_escape_string($_POST['email']);
            $senha =  $conn->real_escape_string($_POST['senha']);

            $sql_code = "SELECT * FROM TB_user_login WHERE user_email = '$email' AND user_password = '$senha'";
            $sql_query = $conn->query($sql_code) or die("Falha na execução do código SQL: " . $conn->error);

            $quantidade = $sql_query->num_rows;

            if($quantidade == 1) {
                $User = $sql_query->fetch_assoc();

                if(!isset($_SESSION)) {
                    session_start();
                }

                $_SESSION['user'] = $User['user_id'];
                $_SESSION['name'] = $User['user_name'];
                $_SESSION['CPF'] = $User['user_CPF'];
                $_SESSION['type'] = $User['user_type'];

                header("Location: myAccount.php");  
            }
            else {
                echo "Falha ao logar! E-mail ou Senha incorretos.";
            } 

        }
    }
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Letraplac</title>
</head>
<body>
    <h1>Acesse sua conta</h1>
    <form action="" method="post">
        <p>
            <label for="">Email</label>
            <input type="text" name="email">
        </p>
        <p>
            <label for="">Senha</label>
            <input type="password" name="senha">
        </p>
        <p>
            <input type="submit" name="acao" value="Continuar">
        </p>
    </form>
</body>
</html>