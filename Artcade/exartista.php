<?php session_start(); 
require_once 'conexaoprojeto.php';



if (isset($_COOKIE['id_art'])){
    $idartista = $_COOKIE['id_art'];
    $sx = 'select * from artistas where id_artista = '.$idartista.'';
    $sxq = mysqli_query($conn, $sx);
    $sxf = mysqli_fetch_assoc($sxq);
    if (mysqli_query($conn,"delete from artistas where id_artista=$idartista;")){
        unlink('C:/wamp64/www/Artcade/'.$sxf["imagem_artista"].'');
        header('Location: tela_selaltartista.php');
    }
    else{
        die("Erro em exclusão de artista");
    }
}
else{
    header('Location: tela_selaltartista.php');
}
?>