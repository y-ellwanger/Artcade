<?php session_start(); 
require_once 'conexaoprojeto.php';

if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}

if ($tipo_user<2){
    header('Location: index.php');
}

if (isset($_COOKIE['id_peri'])){
    $qperi = mysqli_query($conn,"select * from periodos where id_periodo=".$_COOKIE['id_peri'].";");
    $fperi = mysqli_fetch_assoc($qperi);
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


<body >

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
                <h1 class="d-flex justify-content-center subtitulo">Alterar Período</h1>
                <p class='texto-sutil'>Nome Atual: <?php echo $fperi['nome_periodo'] ?></p>
                <div class='d-flex'>
                    <p class='texto-sutil'>Imagem Atual:</p>
                    <img class='icone-mini' style='margin-left:2vh' src='<?php echo $fperi['imagem_periodo'] ?>'>
                </div>
                <form style='margin-top:4vh' method="POST" action="altperiodo.php" style="width:500px" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control form-control-lg" id="titulo" name="novotitulo" placeholder="Novo Nome">
                    </div>

                    <div class="form-group">
                            <label >Insira o arquivo de imagem do período:</label>
                            <input name="novaimagem_periodo" id="imagem" type="file">
                    </div>
                    <button type="submit" class="botao-padrao" style="width:100%">Enviar</button>
                </form>
            </div>
        </div>
    </div>
    


</body>

</html>