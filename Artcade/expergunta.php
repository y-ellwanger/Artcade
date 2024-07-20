<?php session_start(); 
require_once 'conexaoprojeto.php';

if (isset($_COOKIE['id_perg'])){
    $idpergunta = $_COOKIE['id_perg'];
    if (mysqli_query($conn,"delete from perguntas where id_pergunta=$idpergunta;")){
        header('Location: tela_selaltpergunta.php');
    }
    else{
        die("Erro em exclusão de pergunta");
    }
}
else{
    header('Location: tela_expergunta.php');
}
?>