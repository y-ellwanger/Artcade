<?php
require_once 'conexaoprojeto.php';

//campos do form a serem checados
$requisitos = ['nome','email','senha','tipo_usuario'];

//checagem individual de cada campo pra ver se está vazio
foreach ($requisitos as $checagem){
	if (empty($_POST[$checagem])){
		die("Erro: Todos os campos devem ser preenchidos");
	}
}

$login = mysqli_escape_string($conn,$_POST['nome']);
$senha = mysqli_escape_string($conn,$_POST['senha']);
$email = mysqli_escape_string($conn,$_POST['email']);
$tipo_usuario = $_POST['tipo_usuario'];

$sqluser = "select * from usuarios where nome_usuario ='$login';";

$verifica = mysqli_query($conn,$sqluser);

if (mysqli_num_rows($verifica)<=0 and strlen($login)>=8 and strlen($senha)>=8 and filter_var($email,FILTER_VALIDATE_EMAIL)) {
    $senha_cript = MD5($senha);
    $sql = "INSERT INTO usuarios (nome_usuario,email_usuario,senha_usuario,tipo_usuario) values('$login','$email','$senha_cript',$tipo_usuario)";
    if($insert = mysqli_query($conn,$sql)){
        $querypegaid = "select id_usuario from usuarios where nome_usuario='$login' and senha_usuario='$senha_cript'";
        $queryidusuario = mysqli_query($conn,$querypegaid);
        $fidusuario = mysqli_fetch_assoc($queryidusuario);
        $idusuario = $fidusuario['id_usuario'];

        $querypegaperiodo = "select id_periodo from periodos where id_periodo!=3;";
        $queryidperiodo = mysqli_query($conn,$querypegaperiodo);

        while ($row = mysqli_fetch_assoc($queryidperiodo)){
        $idperiodo = $row['id_periodo'];
            for ($i=1;$i<=3;$i++){
                $qpontosreg = "insert into pontuacoes (fk_usuario, fk_periodo, pontuacao, fase_pontuacao) values ($idusuario,$idperiodo,0,$i);";
                $qpontos = mysqli_query($conn,$qpontosreg);
            }
        }
        $qpontosgeral =  "insert into pontuacoes (fk_usuario, fk_periodo, pontuacao, fase_pontuacao) values ($idusuario,3,0,1);";
        $qgeral = mysqli_query($conn,$qpontosgeral);

        echo("Usuário cadastrado com sucesso");
    }
    else{
        die("Erro: As informações não foram cadastradas no banco de dados");
    }
}

else{
    echo"<script>
    alert('Este usuário já existe ou informações de cadastro inadequadas, usuario e senha devem ter ao menos 8 digitos e email deve ser válido, por favor tente novamente');window.location
    .href='tela_registro.php';</script>";
}



?>