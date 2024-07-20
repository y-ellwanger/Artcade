<?php
require_once 'conexaoprojeto.php';
session_start();

$login = $_SESSION['login'];
$novasenha = MD5(mysqli_escape_string($conn,$_POST['novasenha']));
$senha = MD5($_POST['senha']);

$sql = "select * from usuarios where nome_usuario ='$login' and senha_usuario = '$senha'";
$verifica = mysqli_query($conn,$sql);
if (mysqli_num_rows($verifica)<=0){
    echo"<script>
    alert('Senha atual incorreta');window.location
    .href='tela_altsenha.php';</script>";
}
else{
    $qaltemail = "update usuarios set senha_usuario='$novasenha' where nome_usuario='$login' and senha_usuario='$senha'";
    if ($update = mysqli_query($conn,$qaltemail)){
        echo"Senha alterada com sucesso";
    }
    else{
        die("Ocorreu um problema na alteração dos dados");
    }
}    
