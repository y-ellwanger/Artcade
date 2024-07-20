<?php
session_start();
require_once 'conexaoprojeto.php';

if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}

if(!isset($_COOKIE['idper_galeria'])){
    header('Location: galeria_periodo.php');
}
$desbloqueio = 2;

for ($i=1;$i<=3;$i++){
    $qpontuacao = "select * from pontuacoes where fk_usuario=".$_SESSION['id']." and fk_periodo=".$_COOKIE['idper_galeria']." and 
    fase_pontuacao=$i;";
    $querypt = mysqli_query($conn,$qpontuacao);
    $pegaponto = mysqli_fetch_assoc($querypt);
    $pontuacao = $pegaponto['pontuacao'];
    if ($pontuacao>=10){
        $desbloqueio++;
    }
}

$selec = 'select * from artistas where fk_periodo = '.$_COOKIE["idper_galeria"].';';
$selec_periodo = "select * from periodos where id_periodo = ".$_COOKIE['idper_galeria'].";";

$selected = mysqli_query($conn,$selec);
$selected_periodo = mysqli_query($conn,$selec_periodo);

$array_id = [];
$array_nomes = [];
$array_imagens = [];
    
while ($artista = mysqli_fetch_assoc($selected)){
$id = $artista['id_artista'];
$nome = $artista['nome_artista'];
$imagem = $artista['imagem_artista'];
array_push($array_id, $id);
array_push($array_nomes, $nome);
array_push($array_imagens, $imagem);
}

$periodo = mysqli_fetch_assoc($selected_periodo);
$periodo_nome = $periodo['nome_periodo'];




//echo '<pre>'; print_r($array_id); echo '</pre>';
    

echo "

    <head>
        <title> ".$periodo_nome." </title>
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

        <h1 class='subtitulo' style='text-align:center;margin-top:30px'>".$periodo_nome."</h1>
    
        <div class='container-fluid' style='max-width:1250px'>
            <div class='justify-content-center d-flex flex-wrap'>
    ";

    

for ($i=0; $i<count($array_nomes); $i++){
    
    echo"
            
                <div onclick='NextPg".$i."()' class='opcao card' style='margin:16px'>
                    <img class='galeria ' src=".$array_imagens[$i].">
                        <div class='card-body'>
                            <h4 class='card-texto'>".$array_nomes[$i]." </h4>
                        </div>
                </div>
                

                <script>            
                    function NextPg".$i."(){
                        window.location.href='artista.php';
                        document.cookie = 'id_art = $array_id[$i]';
                    }
                </script>


        ";}
    
echo"

            
            </div>
        </div>
    </body>";
        
    

//echo '<pre>'; print_r($%i); echo '</pre>';

?>



    