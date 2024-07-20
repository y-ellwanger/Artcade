<?php session_start(); 
require_once 'conexaoprojeto.php';



if (isset($_COOKIE['id_obr'])){
    $idobra = $_COOKIE['id_obr'];
    $sx = 'select * from obras where id_obra = '.$idobra.'';
    $sxq = mysqli_query($conn, $sx);
    $sxf = mysqli_fetch_assoc($sxq);
    if (mysqli_query($conn,"delete from obras where id_obra=$idobra;")){
        unlink('C:/wamp64/www/Artcade/'.$sxf["imagem_obra"].'');
        header('Location: tela_selaltobra.php');
    }
    else{
        die("Erro em exclusão de obra");
    }
}
else{
    header('Location: tela_selaltobra.php');
}
?>