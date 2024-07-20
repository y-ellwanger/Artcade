<?php session_start(); 
require_once 'conexaoprojeto.php';

if (isset($_COOKIE['id_usuario'])){
    $idusuario = $_COOKIE['id_usuario'];
    if (mysqli_query($conn,"delete from usuarios where id_usuario=$idusuario;")){
        header('Location: tela_selaltusuario.php');
    }
    else{
        die("Erro em exclusão de usuario");
    }
}
else{
    header('Location: tela_selaltusuario.php');
}
?>