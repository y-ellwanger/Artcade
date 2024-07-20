<?php
session_start();
require_once 'conexaoprojeto.php';

if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}

if ($tipo_user<2){
    header('Location: index.php');
}

if (!isset($_SESSION['login'])){
    header('Location: tela_login.php');
}

$selobr = "select * from obras inner join periodos on obras.fk_periodo = periodos.id_periodo inner join artistas on obras.fk_artista = artistas.id_artista;";
$qobr = mysqli_query($conn,$selobr);
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

        <div class = 'container-fluid'>
            <div class='justify-content-center d-flex flex-wrap'>
                <div>
                    <h1 style='text-align:center; margin-top:4vh;margin-bottom:2vh'> Obras </h1>
                
                    <div>
                        <button onclick='func()' class='botao-padrao'> Nova Obra </button>
                    </div>

                </div>
            </div>
        </div>

        <script>
            function func(){
                window.location.href='tela_inobra.php';
            }
        </script>
        


";

$alte = 1;
$ex = 1;
while($row = mysqli_fetch_assoc($qobr)){
    
    echo"
        <div class='container-fluid' style='margin-top:5vh;max-width:133.4vh' >
            <div class='d-flex ranking'>
                <img class='icone' src='".$row['imagem_obra']."'>
                <p  style='margin-left:25px;width:100%'>".$row['nome_obra']."</p>
                <p  style='width:100%;text-align:center'> ".$row['nome_artista']." </p>  
                <p  style='margin-right:25px;width:100%;text-align:right'> ".$row['nome_periodo']."</p>
                <div>
                    <button onclick='alterar$alte()' class='botao-tab' style='margin-left:4vh;padding:0.7vh 5.3vh'>Alterar</button>
                    <button onclick='excluir$ex()' class='botao-tab' style='margin-left:4vh;margin-top:1vh;padding:0.7vh 5.3vh;background-color:#C2604D'>Excluir</button>
                </div>            
            </div>
        </div>
    
    <script>
    function alterar$alte(){
        document.cookie = 'id_obr = ".$row['id_obra']."';
        window.location.href = 'tela_altobra.php';
        
    }
    function excluir$ex(){
        document.cookie = 'id_obr = ".$row['id_obra']."';
        window.location.href = 'exobra.php';
        
    }
    </script>
    ";
    $alte++;
    $ex++;
}
?>