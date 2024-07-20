<?php
session_start();
require_once 'conexaoprojeto.php';

if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}

$artista_id = $_COOKIE['id_art'];

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
$selec = "select * from obras inner join pontuacoes on (obras.dificuldade_obra=pontuacoes.fase_pontuacao and obras.fk_periodo=pontuacoes.fk_periodo) where 
obras.fk_periodo=".$_COOKIE['idper_galeria']." and obras.dificuldade_obra<$desbloqueio and obras.fk_artista=".$_COOKIE['id_art']." and pontuacoes.fk_usuario=".$_SESSION['id'].";";

$selec_artista = "select * from artistas where id_artista = '$artista_id';";

$selected = mysqli_query($conn,$selec);

$selected_artista = mysqli_query($conn,$selec_artista);

$array_nomes = [];
$array_imagens = [];
$array_descricoes = [];
$array_ano = [];

while ($obra = mysqli_fetch_assoc($selected)){
    $nome = $obra['nome_obra'];
    $imagem = $obra['imagem_obra'];
    $descricao = $obra['descricao_obra'];
    $ano = $obra['ano_obra'];
    array_push($array_nomes, $nome);
    array_push($array_imagens, $imagem);
    array_push($array_descricoes, $descricao);
    array_push($array_ano, $ano);
}

$artista = mysqli_fetch_assoc($selected_artista);

$nome_artista = $artista['nome_artista'];
$resumo_artista = $artista['resumo_artista'];
$descricao_artista = $artista['descricao_artista'];
$imagem_artista = $artista['imagem_artista'];



echo "

    <head>
        <title> ".$nome_artista." </title>
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

echo ("


        <div class='container-fluid'>
            <div>
                <div class='d-flex' style='padding:2vh;margin-top:3vh'>
                    <div>
                        <img class='galeria' src=".$imagem_artista.">
                        <h4 style='color:#B37549;margin-top:1vh;font-style:italic;font-size:2.6vh'>".$nome_artista."</h4>
                    </div>
                    <div class='descric' style='margin-left:2vh'>
                        <p id='desc'>".$resumo_artista."</p>
                        <button class='opcao botao-padrao' onclick='funpopup()' style='width:100%;font-size:2.2vh'> Texto Completo </button>
                    </div>
                    
                    
                </div>
            </div>
        </div>
        

        <div id='desc_popup' class='popup'>
            <div class='popup_conteudo'>
                <p style='font-size: 18px'>".$descricao_artista." </p>
            </div>
        </div>

        <script>
            
            var popup = document.getElementById('desc_popup');
            

            function funpopup() {
                popup.style.display = 'block';
            }
            
            window.addEventListener('click', function(event) {
                if (event.target == popup) 
                    popup.style.display = 'none';
                
            });

        </script>

        <div class='container-fluid' style='max-width:1350px'>
            <div class='justify-content-center d-flex flex-wrap'>


    ");


for ($i=0; $i<count($array_nomes); $i++){

    echo ("



                <div class='opcao card' style='margin:16px;margin-top:3%' onclick='Card".$i."()'>
                    <img class='galeria' src=".$array_imagens[$i].">
                    <div class='card-body'>
                        <h5 class='card-texto'>".$array_nomes[$i]." </h5>
                    </div>
                </div>
        


                <div id='art_popup".$i."' class='popup'>
                    <div class='popup_conteudo' style='text-align: center'>
                        <p class='subtitulo'>".$array_nomes[$i]."</p>
                        <p class='subtitulo'>".$array_ano[$i]."</p>
                        <img style='max-width:106vh;max-height:90vh' src=".$array_imagens[$i]."> 
                        <p style='font-size:3vh;color:#B37549;margin-top:5vh'> ".$array_descricoes[$i]." </p>                   
                    </div>
                </div>

                <script>

                    function Card".$i."(){
                    
                        var popup2 = document.getElementById('art_popup".$i."');

                        popup2.style.display = 'block';

                        window.addEventListener('click', function(event) {
                            if (event.target == popup2) {
                                popup2.style.display = 'none';
                            }
                        });
                    }

                </script>
        
    ");
}

echo'

        </div>
    </div>


';

if ($desbloqueio<4){
echo"
    <p class='texto-sutil' style='text-align:center;font-style:italic'> Você ainda possui obras para desbloquear nesse artista ! </p>
</body>
    ";
}


?>