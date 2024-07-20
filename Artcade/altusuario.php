<?php
require_once 'conexaoprojeto.php';

//campos do form a serem checados
$requisitos1 = ['nome','email','senha'];
$requisitos2 = 'tipo_usuario';

//checagem individual de cada campo pra ver se está vazio
foreach ($requisitos1 as $checagem){
	if (empty($_POST[$checagem])){
		$checagem1=false;
	}
    else $checagem1 = true;
}

$seltipo = mysqli_query($conn,"select * from usuarios where id_usuario=".$_COOKIE['id_usuario']);
$pegatipo = mysqli_fetch_assoc($seltipo);
if ($_POST[$requisitos2] == $pegatipo['tipo_usuario']){
    $checagem2=false;
}
else $checagem2 = true;

if ($checagem1==false and $checagem2==false){
    die("Nenhum dado foi alterado");
}

$login = mysqli_escape_string($conn,$_POST['nome']);
$senha = mysqli_escape_string($conn,$_POST['senha']);
$email = mysqli_escape_string($conn,$_POST['email']);
$tipo_usuario = $_POST['tipo_usuario'];

$sqluser = "select * from usuarios where nome_usuario ='$login';";

$verifica = mysqli_query($conn,$sqluser);

if ($checagem1==true and $checagem2==false){
    if (mysqli_num_rows($verifica)<=0 and strlen($login)>=8 and strlen($senha)>=8 and filter_var($email,FILTER_VALIDATE_EMAIL)) {
        $senha_cript = MD5($senha);
        $sql = "update usuarios set nome_usuario='$login',email_usuario='$email',senha_usuario='$senha' where id_usuario=".$_COOKIE['id_usuario'];
        if($update = mysqli_query($conn,$sql)){
            echo("Informações de usuário alteradas com sucesso");
        }
        else{
            die("Erro: As informações não foram alteradas no banco de dados");
        }
    }
    else{
        die("O nome de usário já está sendo utilizado ou o nome/senha não contém ao menos 8 caracteres");        
    } 
}

elseif($checagem1==true and $checagem2==true){
    if (mysqli_num_rows($verifica)<=0 and strlen($login)>=8 and strlen($senha)>=8 and filter_var($email,FILTER_VALIDATE_EMAIL)) {
        $senha_cript = MD5($senha);
        $sql = "update usuarios set nome_usuario='$login',email_usuario='$email',senha_usuario='$senha',tipo_usuario=$tipo_usuario where id_usuario=".$_COOKIE['id_usuario'];
        if($update = mysqli_query($conn,$sql)){
            echo("Informações e permissões de usuário alteradas com sucesso");
        }
        else{
            die("Erro: As informações e permissões não foram alteradas no banco de dados");
        }
    }
    else{
        die("O nome de usário já está sendo utilizado ou o nome/senha não contém ao menos 8 caracteres");
    }
}

elseif($checagem1==false and $checagem2==true){
    $sql = "update usuarios set tipo_usuario=$tipo_usuario where id_usuario=".$_COOKIE['id_usuario'];
    if($update = mysqli_query($conn,$sql)){
        echo("Permissões de usuário alteradas com sucesso");
    }
    else{
        die("Erro: As permissões não foram alteradas no banco de dados");
    }
}
?>