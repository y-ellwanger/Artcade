<?php 
session_start(); 
require_once 'conexaoprojeto.php';


$tipo_user = $_SESSION['tipo_usuario'];
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
                <?php if ($tipo_user == 2){echo'
                <a class="nav-item nav-link" href="ranking.php" style="color:white">Alterar Dados</a>';}?>
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
                <h1 style='text-align:center; margin:3vh'> Alterar Dados </h1>
                
                <div>
                    <button onclick='fun1()' class='botao-padrao' style='width:100%; margin:1vh'> Periodos </button>
                    <button onclick='fun2()' class='botao-padrao' style='width:100%; margin:1vh'> Artistas </button>
                    <button onclick='fun3()' class='botao-padrao' style='width:100%; margin:1vh'> Obras </button>
                    <button onclick='fun4()' class='botao-padrao' style='width:100%; margin:1vh'> Perguntas </button>
                    <button onclick='fun5()' class='botao-padrao' style='width:100%; margin:1vh'> Usuários </button>
                </div>

            </div>
        </div>
    </div>

    <script>
        function fun1(){
            window.location.href= 'tela_selaltperiodo.php';
        }

        function fun2(){
            window.location.href = 'tela_selaltartista.php';
        }

        function fun3() {
            window.location.href = 'tela_selaltobra.php';
        }

        function fun4() {
            window.location.href = 'tela_selaltpergunta.php';
        }

        function fun5() {
            window.location.href = 'tela_selaltusuario.php';
        }
    </script>


</body>
</html>