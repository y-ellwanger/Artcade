<?php session_start(); 
require_once 'conexaoprojeto.php';

//campos do form a serem checados
$requisitos = ['nome','descricao_res','descricao','periodo'];

//checagem individual de cada campo pra ver se está vazio
foreach ($requisitos as $checagem){
	if (empty($_POST[$checagem])){
		die("Erro: Todos os campos devem ser preenchidos");
	}
}

//checa se houve upload de imagem
if(!isset($_FILES['imagem_artista']) || $_FILES['imagem_artista']['size'] == 0){
	die("Erro: Nenhuma imagem foi selecionada");
}

// Array com os tipos de erros de upload do PHP
$codigoErro['erros'][0] = 'Não houve erro';
$codigoErro['erros'][1] = 'O arquivo no upload é maior do que o limite do PHP';
$codigoErro['erros'][2] = 'O arquivo ultrapassa o limite de tamanho especifiado no HTML';
$codigoErro['erros'][3] = 'O upload do arquivo foi feito parcialmente';
$codigoErro['erros'][4] = 'Não foi feito o upload do arquivo';

// checa erro de upload
if ($_FILES['imagem_artista']['error'] != 0) {
	die("ERRO: Não foi possível fazer o upload do arquivo. Motivo do erro: " . $codigoErro['erros'][$_FILES['arquivoEnviado']['error']]);
}

//extensões aceitas
$extensoes = ["jpeg", "jpg", "png"];

//pega nome do arquivo e separa extensão
$nome_arquivo = $_FILES['imagem_artista']['name'];
$sep = explode('.',$nome_arquivo);
$extensao = strtolower(array_pop($sep));

//checa tipo de extensão
if (!in_array($extensao,$extensoes)){
	die("Formato de imagem incorreto, formatos aceitos: png/jpg/jpeg");
}

//definição das variaveis com base nos campos
$nomeart = mysqli_escape_string($conn,$_POST['nome']);
$periodo = $_POST['periodo'];
$descricao = mysqli_escape_string($conn,$_POST['descricao']);
$descricao_res = mysqli_escape_string($conn,$_POST['descricao_res']);

//diretorio onde será armazenada
$diretorio = 'C:/wamp64/www/Artcade/imagens/artistas';

//inserção das informações da obra
if (mysqli_query($conn, "insert into artistas (nome_artista,fk_periodo,descricao_artista,resumo_artista) VALUES ('$nomeart',$periodo,'$descricao','$descricao_res')")) {
	$idart = mysqli_insert_id($conn); //retorna id da inserção pra nomear imagem
} 
else {
	die("Erro em inserção de informações do artista");
}

//define nome pro arquivo e caminho
$novonome = $idart.".".$extensao;
$caminho = $diretorio."/".$novonome;

//move imagem pro caminho, se não der, apaga o que fez e mostra erros
if (move_uploaded_file($_FILES['imagem_artista']['tmp_name'], $caminho)) {

	// Atualizar no tabela do banco de dados o nome do arquivo de imagem, se não der, apaga o que fez e mostra erro
	if(!mysqli_query($conn, "update artistas set imagem_artista = 'imagens/artistas/$novonome' where id_artista = $idart")){
		mysqli_query($conn,"delete from artistas where id_obra=$idart");
		die("Erro: A imagem não foi cadastrada no banco de dados, inserção cancelada");
	} 
	else {
		header('Location: tela_inartista.php');
	}
}
else{
	mysqli_query($conn,"delete from artistas where id_artista=$idart");
	die("Não foi possível mover o arquivo de imagem para o destino correto, inserção cancelada");
}

mysqli_close($conn); // Encerrar a conexão com o banco de dados
?>