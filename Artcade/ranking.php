<?php
session_start();
require_once 'conexaoprojeto.php';

if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}

if (!isset($_SESSION['login'])){
    header('Location: tela_login.php');
}

$seltoprank = "select * from usuarios inner join pontuacoes on usuarios.id_usuario=pontuacoes.fk_usuario where pontuacoes.fk_periodo=3 order by pontuacoes.pontuacao DESC LIMIT 10;";
$qtoprank = mysqli_query($conn,$seltoprank);
$pos = 1;
echo "

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


        <h1 class='subtitulo' style='text-align:center;margin-top:3.4vh;margin-bottom:4.5vh;font-style:normal'> Ranking Top 10 </h1>
        


";
while($row = mysqli_fetch_assoc($qtoprank)){
    echo"

        <div class='container-fluid' style='max-width:133.4vh' >
            <div class='d-flex ranking'>
                <p  style='margin-left:25px;width:100%'>".$pos."º</p>
                <p  style='width:100%;text-align:center'> ".$row['nome_usuario']." </p>  
                <p  style='margin-right:25px;width:100%;text-align:right'> ".$row['pontuacao']." Pontos </p>           
            </div>
        </div>
    
    
    ";
    $pos++;
}
$selrank = "select * from usuarios inner join pontuacoes on usuarios.id_usuario=pontuacoes.fk_usuario where pontuacoes.fk_periodo=3 order by pontuacoes.pontuacao DESC";
$qrank = mysqli_query($conn,$selrank);
$posusuario = 1;
while ($row = mysqli_fetch_assoc($qrank)){
    if ($row['id_usuario']==$_SESSION['id']){
        echo" 
        <div >
            <p class='rank-text'> Sua posição atual é: ".$posusuario."º lugar com  ".$row['pontuacao']." pontos. </p>
        </div>
    </body>

        ";
    }
    $posusuario++;
}
?>