<?php session_start(); 
require_once 'conexaoprojeto.php';

if (!empty($_FILES['novaimagem_artista']['tmp_name'])){

    $idperiodo = $_COOKIE['id_peri'];
    // Array com os tipos de erros de upload do PHP
    $codigoErro['erros'][0] = 'Não houve erro';
    $codigoErro['erros'][1] = 'O arquivo no upload é maior do que o limite do PHP';
    $codigoErro['erros'][2] = 'O arquivo ultrapassa o limite de tamanho especifiado no HTML';
    $codigoErro['erros'][3] = 'O upload do arquivo foi feito parcialmente';
    $codigoErro['erros'][4] = 'Não foi feito o upload do arquivo';

    // checa erro de upload
    if ($_FILES['novaimagem_periodo']['error'] != 0) {
        die("ERRO: Não foi possível fazer o upload do arquivo. Motivo do erro: " . $codigoErro['erros'][$_FILES['arquivoEnviado']['error']]);
    }

    $extensoes = ["jpeg", "jpg", "png"];

    //pega nome do arquivo e separa extensão
    $nome_arquivo = $_FILES['novaimagem_periodo']['name'];
    $sep = explode('.',$nome_arquivo);
    $extensao = strtolower(array_pop($sep));

    //checa tipo de extensão
    if (!in_array($extensao,$extensoes)){
        die("Formato de imagem incorreto, formatos aceitos: png/jpg/jpeg");
    }

    $sx = 'select * from artistas where id_artista = '.$idperiodo.'';
    $sxq = mysqli_query($conn, $sx);
    $sxf = mysqli_fetch_assoc($sxq);
    unlink('C:/wamp64/www/Artcade/'.$sxf["imagem_periodo"].'');

    //diretorio onde será armazenada
    $diretorio = 'C:/wamp64/www/Artcade/imagens/periodos';

    //define nome pro arquivo e caminho
    $novonome = $idartista.".".$extensao;
    $caminho = $diretorio."/".$novonome;

    //move imagem pro caminho, se não der, apaga o que fez e mostra erros
    if (move_uploaded_file($_FILES['novaimagem_artista']['tmp_name'], $caminho)) {

        // Atualizar no tabela do banco de dados o nome do arquivo de imagem, se não der, apaga o que fez e mostra erro
        if(!mysqli_query($conn, "update periodos set imagem_periodo = 'imagens/periodos/$novonome' where id_periodo = $idperiodo")){
            mysqli_query($conn,"delete from periodos where id_periodo=$idperiodo");
            die("Erro: A imagem não foi cadastrada no banco de dados");
        } 
        else {
            echo "Periodo cadastrado com sucesso";
        }
    }
    else{
        mysqli_query($conn,"delete from periodos where id_periodo = $idperiodo");
        die("Não foi possível mover o arquivo de imagem para o destino correto");
    }

}




//definição das variaveis com base nos campos
$titulo = mysqli_escape_string($conn,$_POST['novotitulo']);


//atualizacao das informações da obra
if (mysqli_query($conn, "update periodos set nome_periodo='$titulo' where id_periodo = ".$_COOKIE['id_peri']."")){
    header('Location: tela_altperiodo.php');
}

else {
    echo"Por Favor, Preencha todas as informações corretamente.";
};

mysqli_close($conn);
 // Encerrar a conexão com o banco de dados
?>