<?php
    session_start();
    require_once "conexaoprojeto.php";

    if (isset($_SESSION['login'])){
        $tipo_user = $_SESSION['tipo_usuario'];}

    if (!isset($_SESSION['login'])){
        header('Location: tela_login.php');
    }
    $_SESSION['ptat']=0;

    $selec_per = 'select * from periodos where id_periodo != 3';

    $array_per_nome = [];
    $array_per_id = [];

    $selec_perq = mysqli_query($conn,$selec_per);

    while ($periodos = mysqli_fetch_assoc($selec_perq)){
        $nome = $periodos['nome_periodo'];
        $id = $periodos['id_periodo'];
        array_push($array_per_nome, $nome);
        array_push($array_per_id, $id);
    }


?>

<DOCTYPE!>
<html>

<head>

    <title> Artcade </title>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <link rel='stylesheet' type='text/css' href='estilo.css'>
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

    <h1  class='subtitulo' style='text-align:center;margin-top:30px'> Seleção de Fases </h1>


    <div class='container-fluid' style='max-width:106.7vh'>
        <div class='justify-content-center d-flex flex-wrap'>

            <div onclick='sel_geral()' class="opcao card" style='margin:16px;width:91%;height:37vh'>
                <img style='object-fit:cover;height:30vh' src='https://i.imgur.com/6aTuwTZ.jpg'>
                <div class='card-body'>
                    <h4 style='text-align:center;color:#B37549'> Geral </h4>
                </div>
            </div>

    <?php
    for ($i=0; $i<count($array_per_id); $i++){
        for ($y=1; $y<=3; $y++){

            $selec_obra = 'select * from obras where fk_periodo = '.$array_per_id[$i].' and dificuldade_obra = '.$y.' LIMIT 1';
            $selec_obraq = mysqli_query($conn, $selec_obra);
            if (mysqli_num_rows($selec_obraq)>0){
                $obra_fetch = mysqli_fetch_assoc($selec_obraq);
                $obra = $obra_fetch['imagem_obra'];

                echo"
                <div onclick='sel_".$i.$y."()' class='card opcao' style='margin:16px'>
                    <img class='galeria' src=".$obra.">
                    <div class='card-body'>
                        <h5 class='card-texto'>".$array_per_nome[$i]." ".$y."</h5>
                    </div>
                </div>
                
                <script>
                    function sel_".$i.$y."(){ ";
                        if ($y > 1) {
                            $qpontuacao = 'select * from pontuacoes where fk_usuario='.$_SESSION['id'].' and fk_periodo='.$array_per_id[$i].' and fase_pontuacao='.$y.'-1';
                            $querypt = mysqli_query($conn,$qpontuacao);
                            $pegaponto = mysqli_fetch_assoc($querypt);
                            $pontuacao = $pegaponto['pontuacao'];

                            if ($pontuacao>=10){
                                
                                echo"
                                    document.cookie = 'id_per = ".$array_per_id[$i]."';
                                    document.cookie = 'obra_dif = ".$y."';
                                    window.location.href='jogo.php';
                                ";
                            }
                            else{
                                echo"alert('Fase indisponível, você precisa alcançar ao menos 10 pontos na fase anterior!');";
                            }}
                        else {
                            echo"
                                document.cookie = 'id_per = ".$array_per_id[$i]."';
                                document.cookie = 'obra_dif = ".$y."';
                                window.location.href='jogo.php';
                            ";
                        }
                echo"
                }   
                </script>
                ";
            }
        };
    };
    ?>

        </div>
    </div>
</body>


    <script>
        function sel_geral(){
            document.cookie = 'id_per = 3';
            document.cookie = 'obra_dif = 1';
            window.location.href='jogo_geral.php';
        }
    </script>
</html>