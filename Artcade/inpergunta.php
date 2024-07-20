<?php session_start(); 
require_once 'conexaoprojeto.php';

$pergunta = mysqli_escape_string($conn,$_POST['pergunta']);
$resposta = mysqli_escape_string($conn,$_POST['resposta']);
$obra = mysqli_escape_string($conn,$_POST['obra']);

$qid = mysqli_query($conn,"select * from obras where nome_obra='$obra'");
$fid = mysqli_fetch_assoc($qid);
$id = $fid['id_obra'];
if (mysqli_query($conn,"insert into perguntas (pergunta,fk_obra,resposta_pergunta) values ('$pergunta',$id,'$resposta')")){
    header('Location: tela_selaltpergunta.php');
}
else{
    die("Erro em inserção de pergunta");
}
?>