<?php
session_start();
require_once 'conexaoprojeto.php';

if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}

if(!isset($_COOKIE['id_per'])){
    header('Location: fases.php');
}
if(!isset($_SESSION['ptat'])){
    $_SESSION['ptat']=0;
}


$id_periodo=$_COOKIE['id_per'];
$obra_dif=$_COOKIE['obra_dif'];

$rand = "select * from obras inner join artistas on obras.fk_artista=artistas.id_artista where obras.fk_periodo=$id_periodo and 
obras.dificuldade_obra=$obra_dif order by RAND() LIMIT 1;";// pega obra+artista baseado no periodo

$selecto = mysqli_query($conn,$rand);
$pintura = mysqli_fetch_assoc($selecto);
$imagem = $pintura['imagem_obra'];
$titulo = $pintura['nome_obra'];
$artista = $pintura['nome_artista'];
$id_obra = $pintura['id_obra'];

$selpergunta = "select * from perguntas where id_pergunta<3 or fk_obra=$id_obra order by RAND() LIMIT 1;"; //pega pergunta

$qpontuacao = "select * from pontuacoes where fk_usuario=".$_SESSION['id']." and fk_periodo=$id_periodo and fase_pontuacao=".$_COOKIE['obra_dif'].";";
$querypt = mysqli_query($conn,$qpontuacao);
$pegaponto = mysqli_fetch_assoc($querypt);
$pontuacao = $pegaponto['pontuacao']; //pega pontuacao recorde do usuario na database

$qpergunta = mysqli_query($conn,$selpergunta);
$fpergunta = mysqli_fetch_assoc($qpergunta);  //transforma em dicionario

$id_p = $fpergunta['id_pergunta'];
$pp = $fpergunta['pergunta'];
$rp = $fpergunta['resposta_pergunta'];


echo "
<html>
<head>
    <title> JOGO </title>
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

    <div class='container-fluid' style='margin-top:30px'>
        <div class='justify-content-center d-flex'>
            <div>
                <div class='d-flex'>
                    <h3 class='pontuacao' >Pontuação: ".$_SESSION['ptat']."</h3>
                    <h5 class='pontuacao' style='text-align:right;margin-top:10px'>Recorde: $pontuacao </h5>
                </div>

                <div class='card'>
                    <img class='painel' src=$imagem>
                    <h4 class='painel-texto'>$pp</h4>
                </div>

";

if ($id_p==1){
    $_SESSION['resposta'] = $titulo;
    $array = [];
    $fakequerys = "select nome_obra, fk_artista from obras where nome_obra!='$titulo' order by RAND() limit 3;";
    $resul = mysqli_query($conn,$fakequerys);
        
    while ($row = mysqli_fetch_assoc($resul)){
        $nome = ($row['nome_obra']);
        array_push($array, $nome);
    }
    array_push($array,$titulo);
    shuffle($array);
}

else if ($id_p==2){
    $_SESSION['resposta'] = $artista;
    $array = [];
    $fakequerys = "select * from artistas where nome_artista!='$artista' order by RAND() limit 3;";
    $resul = mysqli_query($conn,$fakequerys);
        
    while ($row = mysqli_fetch_assoc($resul)){
        $nome = $row['nome_artista'];
        array_push($array, $nome);
    }
    array_push($array,$artista);
    shuffle($array);
}
else{
    $_SESSION['resposta'] = $rp;
    $array = [];
    $fakequerys = "select * from perguntas where id_pergunta>3 and resposta_pergunta!='$rp' order by RAND() limit 3;";
    $resul = mysqli_query($conn,$fakequerys);

    while ($row = mysqli_fetch_assoc($resul)){
        $resposta = $row['resposta_pergunta'];
        array_push($array, $resposta);
    }
    array_push($array,$rp);
    shuffle($array);

}

echo ("         
                <div class='justify-content-center d-flex' style='margin-top:10px;' >
                    <button class='botao-padrao opcao' style='margin:5px;font-size:20px;padding:5px 10px' onclick='checaRes1()'>".$array[0]."</button>
                    <button class='botao-padrao opcao' style='margin:5px;font-size:20px;padding:5px 10px' onclick='checaRes2()'>".$array[1]."</button>
                    <button class='botao-padrao opcao' style='margin:5px;font-size:20px;padding:5px 10px' onclick='checaRes3()'>".$array[2]."</button>
                    <button class='botao-padrao opcao' style='margin:5px;font-size:20px;padding:5px 10px' onclick='checaRes4()'>".$array[3]."</button>
                </div>
            </div>
        </div>
    </div>

");

echo ("

    <script>            
        function checaRes1(){
            document.cookie = 'resp = $array[0]';
            window.location.href='resposta.php';
        }

        function checaRes2(){
            document.cookie = 'resp = $array[1]';
            window.location.href='resposta.php';
        }

        function checaRes3(){
            document.cookie = 'resp = $array[2]';
            window.location.href='resposta.php';
        }

        function checaRes4(){
            document.cookie = 'resp = $array[3]';
            window.location.href='resposta.php';
        }
    </script>
</body<
</html>");
?>
