<?php

    if(!empty($_GET['user_id']))
    {
        include_once('config.php');

        $id = $_GET['user_id'];

        $sqlSelect = "SELECT *  FROM TB_user_login WHERE user_id=$id";

        $result = $conexao->query($sqlSelect);

        if($result->num_rows > 0)
        {
            $sqlDelete = "DELETE FROM TB_user_login WHERE user_id=$id";
            $resultDelete = $conexao->query($sqlDelete);
        }
    }
    header('Location: sistema.php');
       
      
?>
