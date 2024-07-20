<?php session_start(); 
require_once 'conexaoprojeto.php';
if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}
    
if ($tipo_user<2){
    header('Location: index.php');
}
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


    <div style="margin-top:70px">
        <div class="d-flex justify-content-center">
            <div>
                <h1 class="d-flex justify-content-center subtitulo">Inserir Usuário</h1>
                <form method="POST" action="inusuario.php" style="width:500px" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control form-control-lg" id="nome" name="nome" placeholder="Nome">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control form-control-lg" id="email" name="email" placeholder="E-mail">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control form-control-lg" id="senha" name="senha" placeholder="Senha">
                    </div>
                    <div class="form-group">
                    <select class='botao-padrao' style='width:100%;margin-bottom:2vh' id="tipo" name="tipo_usuario" placeholder="Tipo de Usuário">
                            <option value='1'>Comum</option>
                            <option value='2'>ADM</option>
                    </select>
                    <button type="submit" class="botao-padrao" style="width:100%">Enviar</button>
                </form>
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