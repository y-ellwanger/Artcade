<?php session_start(); 
require_once 'conexaoprojeto.php';

if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}

if ($tipo_user<2){
    header('Location: index.php');
}

if (isset($_COOKIE['id_art'])){
    $qart = mysqli_query($conn,"select * from artistas inner join periodos on artistas.fk_periodo=periodos.id_periodo
    where id_artista=".$_COOKIE['id_art'].";");
    $fart = mysqli_fetch_assoc($qart);
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
                <h1 class="d-flex justify-content-center subtitulo">Alterar Artista</h1>
                <p class='texto-sutil'>Nome Atual: <?php echo $fart['nome_artista'] ?></p>
                <p class='texto-sutil'>Periodo Atual: <?php echo $fart['nome_periodo'] ?></p>
                <div class='d-flex'>
                    <p class='texto-sutil'>Imagem Atual:</p>
                    <img class='icone-mini' style='margin-left:2vh' src='<?php echo $fart['imagem_artista'] ?>'>
                </div>
                <form style='margin-top:4vh' method="POST" action="altartista.php" style="width:500px" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control form-control-lg" id="titulo" name="novotitulo" placeholder="Novo Nome">
                    </div>
                    <div class="form-group">
                        <textarea row='3' class="form-control form-control-lg" id="descricao_res" name="novadescricao_res" 
                        placeholder="Nova Descrição resumida (Máx. 1200 caracteres)" maxlength="1200" ></textarea>
                    </div>
                    <div class="form-group">
                        <textarea row='7' class="form-control form-control-lg" id="descricao" name="novadescricao" 
                        placeholder="Nova Descrição completa" maxlength="6000"></textarea>
                    </div>

                    <div class="form-group">
                        <select class='botao-padrao' style='width:100%' id="periodo" name="novoperiodo" placeholder="Período">
                            <?php $qperiodos = mysqli_query($conn,"select * from periodos");
                            while($row = mysqli_fetch_assoc($qperiodos)){
                                $periodo = $row['nome_periodo'];
                                $id = $row['id_periodo'];
                                echo"<option value='$id'>$id - $periodo</option>";
                            } ?>
                        </select>
                    </div>
                    <div class="form-group">
                            <label >Insira o arquivo de imagem do período:</label>
                            <input name="novaimagem_artista" id="imagem" type="file">
                    </div>
                    <button type="submit" class="botao-padrao" style="width:100%">Enviar</button>
                </form>
            </div>
        </div>
    </div>
    


</body>

</html>