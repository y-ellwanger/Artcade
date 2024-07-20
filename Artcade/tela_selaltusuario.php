<?php
session_start();
require_once 'conexaoprojeto.php';

if (isset($_SESSION['login'])){
    $tipo_user = $_SESSION['tipo_usuario'];}

if ($tipo_user<2){
    header('Location: index.php');
}

if (!isset($_SESSION['login'])){
   header('Location: tela_login.php');
}

$selusu = "select * from usuarios;";
$qusu = mysqli_query($conn,$selusu);
echo "

    <head>
        <title> Artcade </title>
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

        <div class = 'container-fluid'>
            <div class='justify-content-center d-flex flex-wrap'>
                <div>
                    <h1 style='text-align:center; margin-top:4vh;margin-bottom:2vh'> Usuários </h1>
                
                    <div>
                        <button onclick='func()' class='botao-padrao'> Criar Usuário </button>
                    </div>

                </div>
            </div>
        </div>

        <script>
            function func(){
                window.location.href='tela_inusuario.php';
            }
        </script>
        


";

$alte = 1;
$ex = 1;
while($row = mysqli_fetch_assoc($qusu)){
    
    echo"
        <div class='container-fluid' style='margin-top:5vh;max-width:133.4vh' >
            <div class='d-flex ranking'>
                <p  style='margin-left:25px;width:100%'>".$row['nome_usuario']."</p>
                <p  style='width:100%;text-align:center'> ".$row['email_usuario']." </p>
                <p  style='margin-right:25px;width:100%;text-align:right'> "; if ($row['tipo_usuario']==1){echo "Comum";} else {echo "ADM";} echo"</p>  
                <div>
                    <button onclick='alterar$alte()' class='botao-tab' style='margin-left:4vh;padding:0.7vh 5.3vh'>Alterar</button>
                    <button onclick='excluir$ex()' class='botao-tab' style='margin-left:4vh;margin-top:1vh;padding:0.7vh 5.3vh;background-color:#C2604D'>Excluir</button>
                </div>            
            </div>
        </div>
    
    <script>
    function alterar$alte(){
        window.location.href='tela_altusuario.php';
        document.cookie = 'id_usuario = ".$row['id_usuario']."';
    }
    function excluir$ex(){
        window.location.href='exusuario.php';
        document.cookie = 'id_usuario = ".$row['id_usuario']."';
    }
    </script>
    ";
    $alte++;
    $ex++;
}
?>