<?php 
session_start(); 
require_once 'conexaoprojeto.php';

if (isset($_SESSION['login'])){
$tipo_user = $_SESSION['tipo_usuario'];}

?>

<DOCTYPE!>
<html>
    
<head>
    <title> Artcade </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="estilo.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>



<body style="overflow: hidden">

    <nav class="navbar navbar-expand" style="background-color:#B37549">
        <span class="navbar-brand navbar-title" style='color:white;font-size:24px;'>ARTCADE</span>

        <div class="collapse navbar-collapse" id="navbarNavAltMarkup" style="font-size:18px">
            <div class="navbar-nav">
                <a class="nav-item nav-link" href="index.php" style="color:white">Início</a>
                <a class="nav-item nav-link" href="fases.php" style="color:white">Jogar</a>
                <a class="nav-item nav-link" href="galeria_periodo.php" style="color:white">Galeria</a>
                <a class="nav-item nav-link" href="ranking.php" style="color:white">Ranking</a>
                <?php  if (isset($_SESSION['login'])){ 
                    if ($tipo_user == 2){echo'
                <a class="nav-item nav-link" href="alterar_dados.php" style="color:white">Alterar Dados</a>';}}?>
            </div>
        </div>
        <?php if (isset($_SESSION['login'])){echo"
            <a class='botao-sair' href='usuario.php' style='color:white'>Usuário: ".$_SESSION['login']."</a>
            <a class='botao-sair' style='color:white' href='destruir.php'>Sair</a>
            ";}
            ?>
        
    </nav>

    <div class="row">
        <div class="col-md">
            <img class='index-img' src="https://i.imgur.com/9TggtCk.png">
        </div>

        <div class='index-painel'>
            <h1 class='index-titulo'> ARTCADE </h1>
            <br>
            <p class='index-texto'> Artcade é um jogo e plataforma relacionado ao estudo das artes visuais, <br>
            nele os jogadores poderão desafiar seus próprios conhecimentos em busca de pontuações ao <br> 
            mesmo tempo que desbloqueiam acesso a uma galeria rica em conteúdo de diversos artistas e períodos da arte. <br>
            Nesse momento o Artcade é focado em obras da 'Idade Moderna'. <br> 
            Cadastre-se e comece já sua jornada ! </p>
            <button onclick="NxtPg()" type="button" class="botao-padrao" style="margin-left:50vh;margin-top:80px;padding:0.7vh 5.3vh">Começar!</button>
        </div>
    </div>

    <?php
        if (isset($_SESSION['login'])){
            echo"
            <script>
                function NxtPg(){
                window.location.href='fases.php';
            }

            </script>";
        }
        else {
            echo"
            <script>
                function NxtPg(){
                window.location.href='tela_registro.php';
            }

            </script>";
        }
    ?>


</body>
</html>