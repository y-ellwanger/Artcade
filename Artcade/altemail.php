<?php
require_once 'conexaoprojeto.php';
session_start();

$login = $_SESSION['login'];
$novoemail = mysqli_escape_string($conn,$_POST['novoemail']);
$senha = MD5($_POST['senha']);

$sql = "select * from usuarios where nome_usuario ='$login' and senha_usuario = '$senha'";
$verifica = mysqli_query($conn,$sql);
if (mysqli_num_rows($verifica)<=0){
    echo"<script>
    alert('Senha incorreta');window.location
    .href='tela_altemail.php';</script>";
}
else{
    $qaltemail = "update usuarios set email_usuario='$novoemail' where nome_usuario='$login' and senha_usuario='$senha'";
    if ($update = mysqli_query($conn,$qaltemail)){
        echo"E-mail alterado com sucesso";
    }
    else{
        die("Ocorreu um problema na alteração dos dados");
    }
}    

?>