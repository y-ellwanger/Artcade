<?php
require_once 'conexaoprojeto.php';
session_start();

$login = $_SESSION['login'];
$senha = MD5($_POST['senha']);

$sql = "select * from usuarios where nome_usuario ='$login' and senha_usuario = '$senha'";
$verifica = mysqli_query($conn,$sql);
if (mysqli_num_rows($verifica)<=0){
    echo"<script>
    alert('Senha incorreta');window.location
    .href='tela_altsenha.php';</script>";
}
else{
    $qaltemail = "delete from usuarios where nome_usuario='$login' and senha_usuario='$senha'";
    if ($update = mysqli_query($conn,$qaltemail)){
        echo"Conta excluída com sucesso";
        session_destroy();
        header('Location: index.php');
    }
    else{
        die("Ocorreu um problema na exclusão dos dados");
    }
}