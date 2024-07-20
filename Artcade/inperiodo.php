<?php session_start(); 
require_once 'conexaoprojeto.php';

//campos do form a serem checados
$requisitos = ['nome_periodo'];

//checagem individual de cada campo pra ver se está vazio
foreach ($requisitos as $checagem){
	if (empty($_POST[$checagem])){
		die("Erro: Todos os campos devem ser preenchidos");
	}
}

//checa se houve upload de imagem
if(!isset($_FILES['imagem_periodo']) || $_FILES['imagem_periodo']['size'] == 0){
	die("Erro: Nenhuma imagem foi selecionada");
}

// Array com os tipos de erros de upload do PHP
$codigoErro['erros'][0] = 'Não houve erro';
$codigoErro['erros'][1] = 'O arquivo no upload é maior do que o limite do PHP';
$codigoErro['erros'][2] = 'O arquivo ultrapassa o limite de tamanho especifiado no HTML';
$codigoErro['erros'][3] = 'O upload do arquivo foi feito parcialmente';
$codigoErro['erros'][4] = 'Não foi feito o upload do arquivo';

// checa erro de upload
if ($_FILES['imagem_periodo']['error'] != 0) {
	die("ERRO: Não foi possível fazer o upload do arquivo. Motivo do erro: " . $codigoErro['erros'][$_FILES['arquivoEnviado']['error']]);
}

//extensões aceitas
$extensoes = ["jpeg", "jpg", "png"];

//pega nome do arquivo e separa extensão
$nome_arquivo = $_FILES['imagem_periodo']['name'];
$sep = explode('.',$nome_arquivo);
$extensao = strtolower(array_pop($sep));

//checa tipo de extensão
if (!in_array($extensao,$extensoes)){
	die("Formato de imagem incorreto, formatos aceitos: png/jpg/jpeg");
}

//definição das variaveis com base nos campos
$nomeper = mysqli_escape_string($conn,$_POST['nome_periodo']);

//diretorio onde será armazenada
$diretorio = 'C:/wamp64/www/Artcade/imagens/periodos';

//inserção das informações do periodo
if (mysqli_query($conn, "insert into periodos (nome_periodo) VALUES ('$nomeper')")) {
	$idper = mysqli_insert_id($conn); //retorna id da inserção pra nomear imagem
	
} 
else {
	die("Erro em inserção de informações do periodo");
}

//define nome pro arquivo e caminho
$novonome = $idper.".".$extensao;
$caminho = $diretorio."/".$novonome;

//move imagem pro caminho, se não der, apaga o que fez e mostra erros
if (move_uploaded_file($_FILES['imagem_periodo']['tmp_name'], $caminho)) {

	// Atualizar no tabela do banco de dados o nome do arquivo de imagem, se não der, apaga o que fez e mostra erro
	if(!mysqli_query($conn, "update periodos set imagem_periodo = 'imagens/periodos/$novonome' where id_periodo = $idper")){
		mysqli_query($conn,"delete from periodos where id_periodo=$idper");
		die("Erro: A imagem não foi cadastrada no banco de dados, inserção cancelada");
	} 
	else {
		$user_array = [];
		$s_user = "select * from usuarios";
		$sq_user = mysqli_query($conn, $s_user);
		while ($user = mysqli_fetch_assoc($sq_user)){
			$userid = $user['id_usuario'];
			array_push($user_array, $userid);
		}
		for ($i=0; $i<count($user_array); $i++){
			for ($y=1; $y<=3; $y++){
				$qpontosper = "insert into pontuacoes (fk_usuario, fk_periodo, pontuacao, fase_pontuacao) values (".$user_array[$i].",$idper,0,$y);";
				$qpontos = mysqli_query($conn,$qpontosper);
			}
		}
		
		header("Location:tela_selaltperiodo.php");
	}
}
else{
	mysqli_query($conn,"delete from períodos where id_periodo=$idper");
	die("Não foi possível mover o arquivo de imagem para o destino correto, inserção cancelada");
}

mysqli_close($conn); // Encerrar a conexão com o banco de dados
?>