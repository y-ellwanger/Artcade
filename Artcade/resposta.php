<?php
require_once 'conexaoprojeto.php';
session_start();

if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}

$qpontuacao = "select * from pontuacoes where fk_usuario=".$_SESSION['id']." and fk_periodo=".$_COOKIE['id_per']." and fase_pontuacao=".$_COOKIE['obra_dif'].";";
$querypt = mysqli_query($conn,$qpontuacao);
$pegaponto = mysqli_fetch_assoc($querypt);
$pontuacao = $pegaponto['pontuacao'];

echo"
    <html>
    <head>
        <title> Artcade </title>
        <meta charset='UTF-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <link rel='stylesheet' type='text/css' href='estilo.css'>
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css' 
        integrity='sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO' crossorigin='anonymous'>
    </head>

    <body>
    <nav class='navbar navbar-expand-lg' style='background-color:#B37549'>
            <span class='navbar-brand navbar-title' style='color:white;font-size:24px'>ARTCADE</span>

            <div class='collapse navbar-collapse' id='navbarNavAltMarkup' style='font-size:18px'>
                <div class='navbar-nav'>
                    <a class='nav-item nav-link' href='index.php' style='color:white'>Início</a>
                    <a class='nav-item nav-link' href='fases.php' style='color:white'>Jogar</a>
                    <a class='nav-item nav-link' href='galeria_periodo.php' style='color:white'>Galeria</a>
                    <a class='nav-item nav-link' href='ranking.php' style='color:white'>Ranking</a>";
                    if (isset($_SESSION['login'])){ 
                        if ($tipo_user == 2){echo'
                    <a class="nav-item nav-link" href="alterar_dados.php" style="color:white">Alterar Dados</a>';}}
                    echo"
                </div>
            </div>";
            if (isset($_SESSION['login'])){echo"
                <a class='botao-sair' href='usuario.php' style='color:white'>Usuário: ".$_SESSION['login']."</a>
                <a class='botao-sair' style='color:white' href='destruir.php'>Sair</a>";}
        echo "        
        </nav>
";

if (!isset($_COOKIE['resp'])){
    echo ("Tempo de resposta esgotado");
}

if($_SESSION['resposta']==$_COOKIE['resp']){
    $_SESSION['ptat']+=1;
    
    echo ("Acertou viva!!! sua pontuação agr é ".$_SESSION['ptat']);
    if ($_SESSION['ptat']>$pontuacao){
        $qnovorecorde = "update pontuacoes set pontuacao=".$_SESSION['ptat']." where fk_usuario=".$_SESSION['id']." and fk_periodo=".$_COOKIE['id_per']." and fase_pontuacao=".$_COOKIE['obra_dif'].";";
        $queryatp = mysqli_query($conn,$qnovorecorde);
    }
    if ($_COOKIE['id_per']==3){
        header('Location: jogo_geral.php');
    }
    else{
        header('Location: jogo.php');
    }
}
else{
    echo "
        <div class='d-flex'>
            <div style='padding:70px;margin-left:35px;z-index:1'>
                <h1 style='font-size:12.8vh'> Você errou... </h1>
                <br>
                <h1 class='pontuacao-derrota'> Sua pontuação foi ".$_SESSION['ptat']." !! </h1>
                <h1 class='pontuacao-derrota'> Seu recorde é $pontuacao. </h1>

                <div style='bottom:26.6vh;position:fixed'>
                    <h3 class='resposta-correta'> A resposta correta era: ".$_SESSION['resposta']." </h3>
                    <button onclick='Again()' class='botao-padrao' style='margin:5px;font-size:3.2vh;padding:5px 10px'> Voltar a seleção de fases </button>
                </div>
            </div>
            <div>
                <img class='imagem-derrota' src='https://santhatela.com.br/wp-content/uploads/2017/03/cabanel-anjo-d.jpg'>
            </div>
        </div>
    
    <script>
        function Again(){
            window.location.href='fases.php';
        }
    </script>

            ";
    $_SESSION['ptat']=0;
}
?>