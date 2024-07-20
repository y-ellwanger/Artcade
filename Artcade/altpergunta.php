<?php session_start(); 
require_once 'conexaoprojeto.php';

$pergunta = mysqli_escape_string($conn,$_POST['novapergunta']);
$resposta = mysqli_escape_string($conn,$_POST['novaresposta']);

if(isset($_COOKIE['id_perg'])){
    if (mysqli_query($conn,"update perguntas set pergunta='$pergunta', resposta_pergunta='$resposta' where id_pergunta=".$_COOKIE['id_perg'])){
        header('Location: tela_selaltpergunta.php');
    }
    else{
        die("Erro em alteração de pergunta");
    }    
}
else{
    header('Location: tela_selaltpergunta.php');
}
?>