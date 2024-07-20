<?php session_start(); 
require_once 'conexaoprojeto.php';



if (isset($_COOKIE['id_peri'])){
    $idperiodo = $_COOKIE['id_peri'];
    $sx = 'select * from periodos where id_periodo = '.$idperiodo.'';
    $sxq = mysqli_query($conn, $sx);
    $sxf = mysqli_fetch_assoc($sxq);
    if (mysqli_query($conn,"delete from periodos where id_periodo=$idperiodo;")){
        unlink('C:/wamp64/www/Artcade/'.$sxf["imagem_periodo"].'');
        header('Location: tela_selaltperiodo.php');
    }
    else{
        die("Erro em exclusão de periodo");
    }
}
else{
    header('Location: tela_selaltperiodo.php');
}
?>