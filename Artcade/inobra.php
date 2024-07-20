<?php session_start(); 
require_once 'conexaoprojeto.php';

//campos do form a serem checados
$requisitos = ['titulo','artista','ano','periodo','dificuldade','descricao'];

//checagem individual de cada campo pra ver se está vazio
foreach ($requisitos as $checagem){
	if (empty($_POST[$checagem])){
		die("Erro: Todos os campos devem ser preenchidos");
	}
}

//checa se houve upload de imagem
if(!isset($_FILES['imagem_obra']) || $_FILES['imagem_obra']['size'] == 0){
	die("Erro: Nenhuma imagem foi selecionada");
}

// Array com os tipos de erros de upload do PHP
$codigoErro['erros'][0] = 'Não houve erro';
$codigoErro['erros'][1] = 'O arquivo no upload é maior do que o limite do PHP';
$codigoErro['erros'][2] = 'O arquivo ultrapassa o limite de tamanho especifiado no HTML';
$codigoErro['erros'][3] = 'O upload do arquivo foi feito parcialmente';
$codigoErro['erros'][4] = 'Não foi feito o upload do arquivo';

// checa erro de upload
if ($_FILES['imagem_obra']['error'] != 0) {
	die("ERRO: Não foi possível fazer o upload do arquivo. Motivo do erro: " . $codigoErro['erros'][$_FILES['arquivoEnviado']['error']]);
}

//extensões aceitas
$extensoes = ["jpeg", "jpg", "png"];

//pega nome do arquivo e separa extensão
$nome_arquivo = $_FILES['imagem_obra']['name'];
$sep = explode('.',$nome_arquivo);
$extensao = strtolower(array_pop($sep));

//checa tipo de extensão
if (!in_array($extensao,$extensoes)){
	die("Formato de imagem incorreto, formatos aceitos: png/jpg/jpeg");
}

//definição das variaveis com base nos campos
$titulo = mysqli_escape_string($conn,$_POST['titulo']);
$artista = $_POST['artista'];
$periodo = $_POST['periodo'];
$descricao = mysqli_escape_string($conn,$_POST['descricao']);
$ano = $_POST['ano'];
$dificuldade = $_POST['dificuldade'];

//diretorio onde será armazenada
$diretorio = 'C:/wamp64/www/Artcade/imagens';

//inserção das informações da obra
if (mysqli_query($conn, "insert into obras (nome_obra,ano_obra,dificuldade_obra,fk_periodo,fk_artista,descricao_obra) VALUES ('$titulo',$ano,$dificuldade,$periodo,$artista,'$descricao')")) {
	$idobra = mysqli_insert_id($conn); //retorna id da inserção pra nomear imagem
} 
else {
	die("Erro em inserção de informações da obra");
}

//define nome pro arquivo e caminho
$novonome = $idobra.".".$extensao;
$caminho = $diretorio."/".$novonome;

//move imagem pro caminho, se não der, apaga o que fez e mostra erros
if (move_uploaded_file($_FILES['imagem_obra']['tmp_name'], $caminho)) {

	// Atualizar no tabela do banco de dados o nome do arquivo de imagem, se não der, apaga o que fez e mostra erro
	if(!mysqli_query($conn, "update obras set imagem_obra = 'imagens/$novonome' where id_obra = $idobra")){
		mysqli_query($conn,"delete from obras where id_obra=$idobra");
		die("Erro: A imagem não foi cadastrada no banco de dados");
	} 
	else {
		echo "Obra cadastrada com sucesso";
		header('Location: tela_selaltobra.php');
	}
}
else{
	mysqli_query($conn,"delete from obras where id_obra=$idobra");
	die("Não foi possível mover o arquivo de imagem para o destino correto");
}

mysqli_close($conn); // Encerrar a conexão com o banco de dados
?>