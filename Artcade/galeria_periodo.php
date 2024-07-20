<?php
session_start();
require_once 'conexaoprojeto.php';

if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}

if (isset($_SESSION['login'])) {}
else header('Location: tela_login.php');

$sel_per = 'select * from periodos where id_periodo != 3';
$sel_perq = mysqli_query($conn,$sel_per);
$per_array_nomes = [];
$per_array_imagems = [];
$per_array_id = [];

while ($periodos = mysqli_fetch_assoc($sel_perq)){
    $nome = $periodos['nome_periodo'];
    $imagem = $periodos['imagem_periodo'];
    $id = $periodos['id_periodo'];
    array_push($per_array_nomes, $nome);
    array_push($per_array_imagems, $imagem);
    array_push($per_array_id, $id);

};

?>

<DOCTYPE!>
<html>

<head>
    <title> Galeria </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css' 
    integrity='sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO' crossorigin='anonymous'>


</head>

<body>

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


    <h1 class='subtitulo' style='text-align:center;margin-top:30px'> GALERIA </h1>

    <div class='container-fluid' style='max-width:800px'>
        <div class='justify-content-center d-flex flex-wrap'>
    
    <?php
    for ($i=0; $i<count($per_array_id); $i++){
        echo'
    
            <div onclick="NextPageG'.$i.'()" class="card opcao" style="margin:16px">
                <img class="galeria" src='.$per_array_imagems[$i].'>
                <div class="card-body">
                    <h4 class="card-texto">'.$per_array_nomes[$i].'</h4>
                </div>
            </div>

    <script>
    function NextPageG'.$i.'(){
        document.cookie = "idper_galeria = '.$per_array_id[$i].'";
        window.location.href="galeria_artista.php";
    }

    </script>';

    };

?>

        </div>
    </div>
</body>
</html>


