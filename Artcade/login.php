<?php
require_once 'conexaoprojeto.php';
session_start();

$login = mysqli_escape_string($conn,$_POST['login']);
$senha = MD5($_POST['senha']);

$sql = "select * from usuarios where nome_usuario ='$login' and senha_usuario = '$senha'";
$verifica = mysqli_query($conn,$sql);
  if (mysqli_num_rows($verifica)<=0){
    echo"<script>
    alert('Login e/ou senha incorretos');window.location
    .href='tela_login.php';</script>";
  }
  else{
    $pegaid = mysqli_fetch_assoc($verifica);
    $_SESSION['id'] = $pegaid['id_usuario'];
    $_SESSION['email'] = $pegaid['email_usuario'];
    $_SESSION['login'] = htmlspecialchars($login);
    
    $_SESSION['tipo_usuario'] = $pegaid['tipo_usuario'];
    header('Location: index.php');

  }



?>