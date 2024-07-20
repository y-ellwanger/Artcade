<?php
require_once 'conexaoprojeto.php';
session_start();

$login = $_SESSION['login'];
$novologin = mysqli_escape_string($conn,$_POST['novologin']);
$senha = MD5($_POST['senha']);

$sqluser = "select * from usuarios where nome_usuario ='$novologin';";
$verifica = mysqli_query($conn,$sqluser);
  if (mysqli_num_rows($verifica)<=0 and strlen($novologin)>=8){
    $sql = "select * from usuarios where nome_usuario ='$login' and senha_usuario = '$senha'";
    $verifica = mysqli_query($conn,$sql);
    if (mysqli_num_rows($verifica)<=0){
      echo"<script>
      alert('Senha incorreta');window.location
      .href='tela_altnome.php';</script>";
    }
    else{
      $qaltnome = "update usuarios set nome_usuario='$novologin' where nome_usuario='$login' and senha_usuario='$senha'";
      if ($update = mysqli_query($conn,$qaltnome)){
          $_SESSION['login']=htmlspecialchars($novologin);
          echo"Nome alterado com sucesso";
      }
      else{
          die("Ocorreu um problema na alteração dos dados");
      }
    }    
  }
  else{
    echo"<script>
      alert('Erro: Este nome já está em uso ou não possui ao menos 8 caracteres');window.location
      .href='tela_altnome.php';</script>";
  }

?>