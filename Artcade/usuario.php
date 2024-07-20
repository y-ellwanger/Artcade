<?php session_start();

require_once 'conexaoprojeto.php';
if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}

if (!isset($_SESSION['login'])){
    header("Location: index.php");
} ?>
<!DOCTYPE html>
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

    <div class = 'container-fluid'>
        <div class='justify-content-center d-flex flex-wrap'>
            <div>
                <h1 style='margin:3vh'> <?php echo $_SESSION['login']; ?> </h1>
                
                <div>
                    <ul style='list-style-type: none;margin: 0;'>
                        <li><a style='font-size:3vh' href='tela_altnome.php'>Alteração de nome</a></li>
                        <li><a style='font-size:3vh' href='tela_altemail.php'>Alteração de email</a></li>
                        <li><a style='font-size:3vh' href='tela_altsenha.php'>Alteração de senha</a></li>
                        <li> <a style='font-size:3vh;color:#C2604D' href='tela_exclusao.php'>Exclusão de conta</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>

    <div>
        <img class="banner-login" style="height:49vh" src="https://i.imgur.com/8sbowYg.png">
    </div>
    <div>
        <img class="banner-login" style="height:74.7vh;right:0px" src="https://i.imgur.com/rXRGzsQ.png">
    </div>


</body>
</html>