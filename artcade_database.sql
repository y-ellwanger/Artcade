-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 20-Mar-2023 às 01:25
-- Versão do servidor: 5.7.36
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `artcade_database`
--
CREATE DATABASE IF NOT EXISTS `artcade_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `artcade_database`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `artistas`
--

DROP TABLE IF EXISTS `artistas`;
CREATE TABLE IF NOT EXISTS `artistas` (
  `id_artista` int(11) NOT NULL AUTO_INCREMENT,
  `nome_artista` varchar(40) NOT NULL,
  `resumo_artista` varchar(1500) NOT NULL,
  `descricao_artista` varchar(6000) NOT NULL,
  `imagem_artista` varchar(600) DEFAULT NULL,
  `fk_periodo` int(11) NOT NULL,
  PRIMARY KEY (`id_artista`),
  KEY `periodo_id` (`fk_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `artistas`
--

INSERT INTO `artistas` (`id_artista`, `nome_artista`, `resumo_artista`, `descricao_artista`, `imagem_artista`, `fk_periodo`) VALUES
(1, 'Leonardo da Vinci', '&nbsp; Leonardo Da Vinci (1452-1519) foi um pintor, engenheiro, cientista e poeta, pertencente ao maior e mais famoso período da arte italiana, o renascimento, sendo ele provavelmente o pintor mais famoso de todos os tempos. Nascido na cidade de Florença, na Itália, não recebeu sobrenome, ‘Da Vinci’ apenas significa que ele era de Vinci, uma província de Florença. Ainda jovem, Da Vinci foi estudar e trabalhar na oficina de Andrea del Verrocchio, outro importante artista do mesmo período, lá ele aprendeu técnicas de perspectiva, teoria de cores, o ato de preparar quadros e estátuas, e outras habilidades artísticas.\r\n<br>\r\n<br>\r\n&nbsp; Da Vinci era um grande observador, sua obra mais conhecida ‘Mona Lisa’ mostra como ele sabia trazer vida às pinturas, a obra que é provavelmente a mais famosa de todos os tempos e já foi posta em anúncios e parodiadas milhares de vezes, é o retrato de Lisa Del Giocondo, esposa de um comerciante na época, e possui um modelo que ressalta sua existência quase que como uma figura real, tudo isso se deve graças às técnicas de observação e perspectiva desenvolvidas por Da Vinci assim como o seu rico estudo em anatomia humana na qual é bastante documentado em suas notas e diários, mais especificamente no seu famoso desenho ‘Homem Vitruviano’.', '&nbsp; Leonardo Da Vinci (1452-1519) foi um pintor, engenheiro, cientista e poeta, pertencente ao maior e mais famoso período da arte italiana, Da Vinci é provavelmente o pintor mais famoso de todos os tempos.\r\n<br>\r\n<br>\r\n&nbsp; Nascido na cidade de Florença, na Itália, não recebeu sobrenome, ‘Da Vinci’ apenas significa que ele era de Vinci, uma província de Florença. Ainda jovem, Da Vinci foi estudar e trabalhar na oficina de Andrea del Verrocchio, outro importante artista do mesmo período, lá ele aprendeu técnicas de perspectiva, teoria de cores, o ato de preparar quadros e estátuas, e outras habilidades artísticas.\r\n<br>\r\n<br>\r\n&nbsp; Da Vinci era um grande observador, sua obra mais conhecida ‘Mona Lisa’ mostra como ele sabia trazer vida às pinturas, a obra que é provavelmente a mais famosa de todos os tempos e já foi posta em anúncios e parodiadas milhares de vezes, é o retrato de Lisa Del Giocondo, esposa de um comerciante na época, e possui um modelo que ressalta sua existência quase que como uma figura real, tudo isso se deve graças às técnicas de observação e perspectiva desenvolvidas por Da Vinci assim como o seu rico estudo em anatomia humana na qual é bastante documentado em suas notas e diários, mais especificamente no seu famoso desenho ‘Homem Vitruviano’.\r\n<br>\r\n<br>\r\n&nbsp; Porém Leonardo não foi um importante somente na área da pintura, ele desde jovem já mostrava-se um gênio como matemático e inventor, escreveu diversos livros teóricos apesar de nunca tê-los publicados, acredita-se que ele simplesmente utilizava de seus dons apenas para si mesmo, sendo esse um traço importante para entender a figura de Da Vinci, este era famoso por não terminar obras comissionadas pelo simples fato de não estar satisfeito com elas, resultado disso é a pequena quantidade de pinturas dele que restaram até os dias de hoje.\r\n<br>\r\n<br>\r\n&nbsp; Da Vinci viveu seus últimos anos em função de executar serviços para o rei Francisco I da França, até eventualmente falecer de causas naturais em  1519, aos 67 anos.\r\n<br>\r\n<br>\r\n&nbsp; Outras obras famosas de Leonardo Da Vinci incluem: A Última Ceia, Dama com Arminho, Salvator Mundi, entre outras.\r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b> A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 291-303', 'https://i.imgur.com/3DRuZc9.png', 1),
(2, 'Sandro Botticelli', '&nbsp; Sandro Botticelli (1446-1510) foi um dos pintores florentinos mais importantes do Renascimento, atuou principalmente criando obras para a importante família dos Médici.\r\nDiferente de boa parte dos outros pintores de seu período, Botticelli não se focou apenas em artes de contexto cristão, sua principal criação: \'Nascimento de Vênus’, é de origem mitológica romana, a obra mostra a deusa do amor Vênus emergindo do oceano dentro de uma concha que é levada até a beira da praia por Zéfiro, o deus do vento, enquanto uma ninfa a recebe com um manto, a obra foi mais uma das encomendadas pela família Médici.\r\n<br>\r\n<br>\r\n&nbsp; As obras de Botticelli assim como a de outros artistas da segunda metade do século XV, foram muito importantes para o desenvolvimento da arte italiana, principalmente no que se diz perspectiva e como trabalhar os planos de fundo, também desenvolveu suas obras para um lado naturalista e até mesmo pagão, ainda dentro do tema da mitologia possui diversas outras criações do gênero como ‘Vênus e Marte’, ‘A Primavera’ e ‘Minerva e o Centauro’.', '&nbsp; Sandro Botticelli (1446-1510) foi um dos pintores florentinos mais importantes do Renascimento, atuou principalmente criando obras para a importante família dos Médici.\r\n<br>\r\n<br>\r\n&nbsp; Diferente de boa parte dos outros pintores de seu período, Botticelli não se focou apenas em artes de contexto cristão, sua principal criação: \'Nascimento de Vênus’, é de origem mitológica romana, a obra mostra a deusa do amor Vênus emergindo do oceano dentro de uma concha que é levada até a beira da praia por Zéfiro, o deus do vento, enquanto uma ninfa a recebe com um manto, a obra foi mais uma das encomendadas pela família Médici.\r\n<br>\r\n<br>\r\n&nbsp; As obras de Botticelli assim como a de outros artistas da segunda metade do século XV, foram muito importantes para o desenvolvimento da arte italiana, principalmente no que se diz perspectiva e como trabalhar os planos de fundo, também desenvolveu suas obras para um lado naturalista e até mesmo pagão, ainda dentro do tema da mitologia possui diversas outras criações do gênero como ‘Vênus e Marte’, ‘A Primavera’ e ‘Minerva e o Centauro’.\r\n<br>\r\n<br>\r\n&nbsp; Após os Médicis serem expulsos de Florença, Botticelli ficou aos cuidados de um monge e com ele passou a entrar uma ‘fase cristã’ de sua obra, onde passou a rejeitar os temas mitológicos e pagãos e começou a criar pinturas de tema cristão, sendo a principal obra desse período “A Natividade Mística”.\r\n<br>\r\n<br>\r\n&nbsp; Ele continuou voltado ao cristianismo até eventualmente falecer em 1510 com cerca de 65 anos. Outras obras famosas de Botticelli incluem: “A Adoração dos Magos” onde acredita-se que tenha feito um auto-retrato seu em uma das figuras do lado direito, “A Coragem”, e as obras relacionadas às “Madonas” (Madona Magnifica, Madona e a Criança e Madona do Livro).\r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b>A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 263-265\r\n<br>\r\n<br>\r\n&nbsp; MENDONÇA, Débora Barbam. <br>Botticelli: pintura e teoria.</b> São Paulo: Cultura Acadêmica, 2012. (Coleção PROPG Digital - UNESP). ', 'https://i.imgur.com/A3G3eAa.png', 1),
(9, 'Caravaggio', '&nbsp; Michelangelo da Caravaggio ou Caravaggio (1573-1610) foi um dos mais revolucionários artistas de sua época e maior expoente do período Barroco.\r\n<br>\r\n<br>\r\n&nbsp; Nasceu em Milão na Itália, tinha um temperamento forte e impiedoso graças à sua infância difícil onde a peste levou a vida de seu pai, avô e tio, Caravaggio por ter crescido sem presença de nenhum outro homem na família sempre esteve perto da marginalidade, adorava brigar e cometer pequenos delitos, parecia gostar de causar desordem.\r\n<br>\r\n<br>\r\n&nbsp; Essa vida complicada muito provavelmente foi um dos grandes fatores para seu estilo artístico, Caravaggio não era interessado na “beleza ideal” que outros artistas buscavam, ele preferia retratar a vida como ela era nua e crua, chegando a ser considerado naturalista demais para o seu tempo.', '&nbsp; Michelangelo da Caravaggio ou Caravaggio (1573-1610) foi um dos mais revolucionários artistas de sua época e maior expoente do período Barroco.\r\n<br>\r\n<br>\r\n&nbsp; Nasceu em Milão na Itália, tinha um temperamento forte e impiedoso graças à sua infância difícil onde a peste levou a vida de seu pai, avô e tio, Caravaggio por ter crescido sem presença de nenhum outro homem na família sempre esteve perto da marginalidade, adorava brigar e cometer pequenos delitos, parecia gostar de causar desordem.\r\n<br>\r\n<br>\r\n&nbsp; Essa vida complicada muito provavelmente foi um dos grandes fatores para seu estilo artístico, Caravaggio não era interessado na “beleza ideal” que outros artistas buscavam, ele preferia retratar a vida como ela era nua e crua, chegando a ser considerado naturalista demais para o seu tempo.\r\n<br>\r\n<br>\r\n&nbsp; Era notado pela maneira que retratava cenas bíblicas sem romantização em suas obras, trazendo figuras muitas vezes desprovidas de santidade e com sombras em alto contraste, criando um efeito oposto ao brilho que os demais artistas buscavam para suas pinturas, essas inclusive o renderam algumas rixas com a igreja.\r\n<br>\r\n<br>\r\n&nbsp; Caravaggio por diversos momentos de sua vida estava fugindo da lei, esse chegou a assassinar e roubar diversas vezes, também foi acusado de pederastia, certa vez após matar um nobre foi condenado a morte e teve de fugir de Roma, eventualmente chegou a Malta onde se envolveu em mais um conflito e voltou a fugir. Ele morreu de uma doença desconhecida em 1610 aos 38 anos de idade enquanto estava a caminho de Roma para pedir perdão ao Papa.\r\n<br>\r\n<br>\r\n&nbsp; Algumas de suas obras mais conhecidas são “Judite e Holofernes”, “Medusa” e \"Narciso\".\r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b>A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 390-393\r\n<br>\r\n<br>\r\n&nbsp; PEREZ, Valmir. <br>Caravaggio.</b> 38. ed. São Paulo: Lume Arquitetura, 2009. p. 74-79', 'https://i.imgur.com/pDFFFFV.jpg', 2),
(10, 'Jan Van Eyck', '&nbsp; Jan Van Eyck (1390-1441) foi um pintor flamengo da primeira metade do século XV, atuou principalmente na região de Flandres na Europa, local que corresponde com a atual Bélgica. &nbsp; A maior e mais famosa obra de Eyck é o Retábulo de Gante, um enorme políptico complexo com um total de 12 painéis, incluindo a grandiosa pintura “A Adoração do Cordeiro” que se encontra centralizada no meio do retábulo. Acredita-se que a obra tenha sido iniciada primeiramente pelo irmão de Eyck: “Hubert Van Eyck”, e que após a morte do mesmo.\r\n<br>\r\n<br>\r\n&nbsp; Diferente de outros artistas do seu tempo que não tinham uma percepção de perspectiva e a delicadeza necessária para transportá-las para a obra, Jan Van Eyck ficou muito conhecido por suas habilidades de observação e como transportava imagens reais da natureza e de monumentos para a tela, pode-se dizer a mesma coisa na arte de pintar figuras reais, Eyck tinha o dom para trazer os detalhes e volumes para tornar os personagens em sua obra o mais complexos possível, é possível ver isso em outra de suas mais aclamadas obras: “O Casal Arnolfini”.', '&nbsp; Jan Van Eyck (1390-1441) foi um pintor flamengo da primeira metade do século XV, atuou principalmente na região de Flandres na Europa, local que corresponde com a atual Bélgica.\r\n<br>\r\n<br>\r\n&nbsp; A maior e mais famosa obra de Eyck é o Retábulo de Gante, um enorme políptico complexo com um total de 12 painéis, incluindo a grandiosa pintura “A Adoração do Cordeiro” que se encontra centralizada no meio do retábulo. Acredita-se que a obra tenha sido iniciada primeiramente pelo irmão de Eyck: “Hubert Van Eyck”, e que após a morte do mesmo.\r\n<br>\r\n<br>\r\n&nbsp; Diferente de outros artistas do seu tempo que não tinham uma percepção de perspectiva e a delicadeza necessária para transportá-las para a obra, Jan Van Eyck ficou muito conhecido por suas habilidades de observação e como transportava imagens reais da natureza e de monumentos para a tela, pode-se dizer a mesma coisa na arte de pintar figuras reais, Eyck tinha o dom para trazer os detalhes e volumes para tornar os personagens em sua obra o mais complexos possível, é possível ver isso em outra de suas mais aclamadas obras: “O Casal Arnolfini”.\r\n<br>\r\n<br>\r\n&nbsp; Acredita-se que Jan van Eyck foi também o inventor a pintura à óleo, em sua época a maioria dos artistas utilizavam ovo em sua fórmula para criar os pigmentos e pastas para a tinta, mas por secar rápido demais Eyck estava insatisfeito já que não podia pintar devagar e criar os detalhes que queria, com isso ao invés de ovo adicionou óleo em sua fórmula e criou assim um tipo de tinta que seca bem mais lentamente.\r\n\r\n<br>\r\n<br>\r\n&nbsp; Continuou pintando até eventualmente falecer em 1441, outras obras conhecidas suas são: “A Virgem do Chanceler Rolin\", \"São Jerônimo em seu Gabinete” e “Retrato de Homem”, sendo essa um possível auto-retrato seu.\r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b>A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 235-240', 'https://i.imgur.com/aDR6ToP.png', 1),
(11, 'Michelangelo', '&nbsp; Michelangelo Buonarroti (1475-1564) foi um pintor, escultor e arquiteto italiano, sendo essa uma das figuras mais importantes da arte ocidental.\r\n<br>\r\n<br>\r\n&nbsp; Ainda cedo tinha interesse na área das artes e com isso foi estudar na oficina do famoso pintor Domenico Ghirlandaio, lá Michelangelo aprendeu técnicas de desenho e pintura, porém ele tinha um certo atrito com os estudos de Ghirlandaio, ele não tinha interesse em simplesmente aprender anatomia e criar obras de padrão regular, ele preferia as complexas esculturas gregas anatomicamente impressionantes e isso resultou em um perfeccionismo extremo de sua parte, em determinado ponto não havia posição, ângulo e perspectiva que Michelangelo não pudesse aplicar em suas obras, quanto mais difícil fosse mais interessado ele ficava.\r\n<br>\r\n<br>\r\n&nbsp; Antes dos 40 anos Michelangelo já havia se tornando o maior e mais renomado artista de sua época, chegou a receber comissões do próprio Papa Júlio II para criar uma tumba colossal para si, porém por conflitos com outros projetos este acabou sendo cancelado no meio do processo.', '&nbsp; Michelangelo Buonarroti (1475-1564) foi um pintor, escultor e arquiteto italiano, sendo essa uma das figuras mais importantes da arte ocidental.\r\n<br>\r\n<br>\r\n&nbsp; Ainda cedo tinha interesse na área das artes e com isso foi estudar na oficina do famoso pintor Domenico Ghirlandaio, lá Michelangelo aprendeu técnicas de desenho e pintura, porém ele tinha um certo atrito com os estudos de Ghirlandaio, ele não tinha interesse em simplesmente aprender anatomia e criar obras de padrão regular, ele preferia as complexas esculturas gregas anatomicamente impressionantes e isso resultou em um perfeccionismo extremo de sua parte, em determinado ponto não havia posição, ângulo e perspectiva que Michelangelo não pudesse aplicar em suas obras, quanto mais difícil fosse mais interessado ele ficava.\r\n<br>\r\n<br>\r\n&nbsp; Antes dos 40 anos Michelangelo já havia se tornando o maior e mais renomado artista de sua época, chegou a receber comissões do próprio Papa Júlio II para criar uma tumba colossal para si, porém por conflitos com outros projetos este acabou sendo cancelado no meio do processo.\r\n<br>\r\n<br>\r\n&nbsp; Esse evento abalou bastante Michelangelo que voltou para sua cidade natal, porém pouco tempo depois o Papa volta a procurá-lo para realizar outro trabalho, pintar o teto da Capela Sistina, apesar de certo desinteresse Michelangelo aceitou após grande insistência do Papa, lá ele se trancou não permitindo que ninguém entrasse e então criou o\'que seria uma das mais consagradas obras da humanidade, um afresco com centenas de figuras relatadas da bíblia, incluindo em seu centro “A Criação de Adão”.\r\n<br>\r\n<br>\r\n&nbsp; Michelangelo tinha um temperamento difícil que só piorou quando chegou a velhice, ele trabalhou em diversos projetos e era requerido por várias figuras importantes, faleceu em 1564 aos 88 anos. \r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b>A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 303-312', 'https://i.imgur.com/8yq1xpF.png', 1),
(12, 'Pieter Bruegel', '&nbsp; Pieter Bruegel (1527-1569) nascido nos países baixos e também conhecido pela alcunha de “O Velho” foi um dos pintores mais importantes da arte flamenga no século XVI.\r\n<br>\r\n<br>\r\n&nbsp; Bruegel diferente de outros de seu tempo que focavam em arte cristã, ficou famoso por um tipo de gênero específico que dominou, a das pinturas de cenas da vida e do dia-a-dia de camponeses, esse elemento está presente na maioria de suas obras, alguns exemplos são “Os Ceifeiros” que apresentam um grupo de trabalhadores no campo, e “Caçadores na Neve” que como o nome indica mostra um grupo de caçadores retornando à sua vila após uma caçada, na neve.\r\n<br>\r\n<br>\r\n&nbsp; Porém acredita-se que Bruegel apesar de gostar do tema “camponês” em suas obras, não era em si alguém do campo mas sim da cidade, o seu interesse nas figuras do campo vem através da vontade de expressar a vida com certa caricatura, e para ele a figura do camponês era perfeita para tal.', '&nbsp; Pieter Bruegel (1527-1569) nascido nos países baixos e também conhecido pela alcunha de “O Velho” foi um dos pintores mais importantes da arte flamenga no século XVI.\r\n<br>\r\n<br>\r\n&nbsp; Bruegel diferente de outros de seu tempo que focavam em arte cristã, ficou famoso por um tipo de gênero específico que dominou, a das pinturas de cenas da vida e do dia-a-dia de camponeses, esse elemento está presente na maioria de suas obras, alguns exemplos são “Os Ceifeiros” que apresentam um grupo de trabalhadores no campo, e “Caçadores na Neve” que como o nome indica mostra um grupo de caçadores retornando à sua vila após uma caçada, na neve.\r\n<br>\r\n<br>\r\n&nbsp; Porém acredita-se que Bruegel apesar de gostar do tema “camponês” em suas obras, não era em si alguém do campo mas sim da cidade, o seu interesse nas figuras do campo vem através da vontade de expressar a vida com certa caricatura, e para ele a figura do camponês era perfeita para tal.\r\n<br>\r\n<br>\r\n&nbsp; Outra parte interessante da obra de Bruegel são suas obras em estilo de “catálogo”, para mostrar em uma só pintura diversas variantes de uma mesma situação, como “Provérbios Neerlandeses” que apresenta diversas cenas de insanidade apresentadas por várias figuras diferentes, ou “Jogos Infantis” que cataloga uma enorme diversidade de brincadeiras de criança.\r\n<br>\r\n<br>\r\n&nbsp; Pieter Bruegel morreu por volta de 1569, em torno dos 44 anos. Algumas outras de suas obras incluem “O Triunfo da Morte”, “Boda Camponesa”, e “A Torre de Babel” pintura extremamente influente que foi divida em três versões, infelizmente uma delas foi perdida.\r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b>A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 381-383', 'https://i.imgur.com/kb5MmN0.png', 1),
(13, 'Johannes Vermeer', '&nbsp; Johannes Vermeer (1632-1675) foi um artista holandês conhecido pelo seu estilo naturalista, foi um dos mais importantes de seu tempo.\r\n<br>\r\n<br>\r\n&nbsp; Pouco se sabe sobre a vida de Vermeer fora que seguiu a tocha das pinturas de gênero naturalistas impostas nesse período inicialmente por artistas como Pieter Bruegel, porém diferente dele onde o dia-a-dia aparentava um sentido quase-cômico, com Vermeer era uma natureza “morta”, séria, normalmente representando o dia a dia de forma crua sem exageros e de maneira despretensiosa.\r\n<br>\r\n<br>\r\n&nbsp; Ainda assim Vermeer era reconhecido por suas técnicas de pintura, com cores, brilho, contraste e contornos suaves que traziam para sutileza e fazia dos seus quadros mundanos os mais belos que haviam, um exemplo seria “A Leiteira”, obra de caráter simples que mostra uma mulher derramando leite em um jarro.', '&nbsp; Johannes Vermeer (1632-1675) foi um artista holandês conhecido pelo seu estilo naturalista, foi um dos mais importantes de seu tempo.\r\n<br>\r\n<br>\r\n&nbsp; Pouco se sabe sobre a vida de Vermeer fora que seguiu a tocha das pinturas de gênero naturalistas impostas nesse período inicialmente por artistas como Pieter Bruegel, porém diferente dele onde o dia-a-dia aparentava um sentido quase-cômico, com Vermeer era uma natureza “morta”, séria, normalmente representando o dia a dia de forma crua sem exageros e de maneira despretensiosa.\r\n<br>\r\n<br>\r\n&nbsp; Ainda assim Vermeer era reconhecido por suas técnicas de pintura, com cores, brilho, contraste e contornos suaves que traziam para sutileza e fazia dos seus quadros mundanos os mais belos que haviam, um exemplo seria “A Leiteira”, obra de caráter simples que mostra uma mulher derramando leite em um jarro.\r\n<br>\r\n<br>\r\n&nbsp; Apesar de ter nascido em uma família de protestantes se casou e converteu-se ao cristianismo, teve 15 filhos dos quais 4 morreram antes dele. Acredita-se que nos seus últimos anos de vida, Vermeer estava extremamente endividado, e ao morrer a esposa teve que assegurar de que suas obras não fossem entregues como pagamento, ele morreu em 1675 aos 43 anos de idade.\r\n<br>\r\n<br>\r\n&nbsp; Outras de suas obras são: “Moça com Brinco de Pérolas” sua obra mais famosa que mostra uma moça delicada vestindo um véu e um par de brincos de pérolas, “A Arte da Pintura”, e “Moça Lendo uma Carta à Janela”.\r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b>A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 430-433\r\n<br>\r\n<br>\r\n&nbsp; ARAUJO, Leonardo. <b>Pintura de Gênero Holandesa do Século XVII e Johannes Vermeer.</b> 2017. p. 5-6', 'https://i.imgur.com/2Ag1hRx.png', 2),
(14, 'Rembrandt', '&nbsp; Rembrandt Van Rijn (1606-1669) ou simplesmente Rembrandt foi um pintor holandês considerado o melhor de seu tempo e um dos mais importantes da história.\r\n<br>\r\n<br>\r\n&nbsp; Logo cedo Rembrandt abandonou os estudos da universidade para estudar pintura e com isso se mudou para Amsterdã, lá ele construiu sua vida rapidamente, se casou, teve um filho e viveu prosperamente por certo tempo, infelizmente em determinado tempo da história ele passou a acumular dívidas e entrou em declínio, para piorar sua esposa morreu e ele teve de obter ajuda de seu filho e outras pessoas próximas para sobreviver.\r\n<br>\r\n<br>\r\n&nbsp; Todas as etapas da vida de Rembrandt são facilmente analisáveis graças aos vários auto-retratos que fez durante diferentes épocas, alguns ainda jovem, e outros já velho e relativamente abatido, uma característica interessante é como ele nunca tentou se fazer bonito em seus retratos, ele não escondia suas imperfeições e mesmo em seus piores estados ele o representou com a maior fidelidade possível.', '&nbsp; Rembrandt Van Rijn (1606-1669) ou simplesmente Rembrandt foi um pintor holandês considerado o melhor de seu tempo e um dos mais importantes da história.\r\n<br>\r\n<br>\r\n&nbsp; Logo cedo Rembrandt abandonou os estudos da universidade para estudar pintura e com isso se mudou para Amsterdã, lá ele construiu sua vida rapidamente, se casou, teve um filho e viveu prosperamente por certo tempo, infelizmente em determinado tempo da história ele passou a acumular dívidas e entrou em declínio, para piorar sua esposa morreu e ele teve de obter ajuda de seu filho e outras pessoas próximas para sobreviver.\r\n<br>\r\n<br>\r\n&nbsp; Todas as etapas da vida de Rembrandt são facilmente analisáveis graças aos vários auto-retratos que fez durante diferentes épocas, alguns ainda jovem, e outros já velho e relativamente abatido, uma característica interessante é como ele nunca tentou se fazer bonito em seus retratos, ele não escondia suas imperfeições e mesmo em seus piores estados ele o representou com a maior fidelidade possível.\r\n<br>\r\n<br>\r\n&nbsp; As mesmas características apresentadas em seus auto-retratos podem ser observadas em suas outras obras, de fato esse é um dos motivos para a genialidade de Rembrandt, o seu tratamento com as obras e a maneira que aplicava os tons de escuro para criar figuras sombrias e etéreas, inclusive em trabalhos bíblicos, como por exemplo em “O Retorno do Filho Pródigo” que apresenta o evento da bíblia em que um filho após gastar todo dinheiro de seu pai retorna para ele, a obra apresenta um caráter sombrio e ofuscante, silhuetas marcadas e as figuras da obra com rostos abatidos.\r\n<br>\r\n<br>\r\n&nbsp; Rembrandt foi juntamente com Caravaggio uma das figuras que mais definiram o Barroco, ele faleceu em 1669 aos 63 anos. Outras obras famosas são “A Ronda Noturna”, “A Lição de Anatomia do Dr Tulp” e “Tempestade no Mar da Galileia”.\r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b>A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 420-427', 'https://i.imgur.com/4x51X9k.png', 2),
(15, 'Peter Paul Rubens', '&nbsp; Peter Paul Rubens (1577-1640) foi um pintor flamengo da arte barroca, era conhecido pelas suas belas técnicas de pintura e alta diplomacia.\r\n<br>\r\n<br>\r\n&nbsp; Logo cedo foi para Roma um dos maiores centros artísticos da época, lá ele aprendeu diversas técnicas e conceitos, porém nunca aderiu a nenhum dos movimentos de lá. Rubens não tinha tanto interesse nas novas reformas artísticas da época, ele continuava tento gosto para pintar apenas aquilo que era belo para si, mas isso não significa que não apreciava pintores com viés diferentes do seu, como exemplo tem seu apreço pela arte de Caravaggio que se diferencia da sua pela crueza e sombridão.\r\n<br>\r\n<br>\r\n&nbsp; Após Roma, as obras de Rubens ganharam a beleza e sutileza que jamais havia sonhado, nessas é possível notar a intensidade com que ele trabalhava o brilho e como esse ofuscava as cores, trazia uma sensibilidade muito grande quanto as figuras que pintava, alguns exemplos são “O Julgamento de Páris”, “As Três Graças” e “O Desembarque em Marselha”.', '&nbsp; Peter Paul Rubens (1577-1640) foi um pintor flamengo da arte barroca, era conhecido pelas suas belas técnicas de pintura e alta diplomacia.\r\n<br>\r\n<br>\r\n&nbsp; Logo cedo foi para Roma um dos maiores centros artísticos da época, lá ele aprendeu diversas técnicas e conceitos, porém nunca aderiu a nenhum dos movimentos de lá. Rubens não tinha tanto interesse nas novas reformas artísticas da época, ele continuava tento gosto para pintar apenas aquilo que era belo para si, mas isso não significa que não apreciava pintores com viés diferentes do seu, como exemplo tem seu apreço pela arte de Caravaggio que se diferencia da sua pela crueza e sombridão.\r\n<br>\r\n<br>\r\n&nbsp; Após Roma, as obras de Rubens ganharam a beleza e sutileza que jamais havia sonhado, nessas é possível notar a intensidade com que ele trabalhava o brilho e como esse ofuscava as cores, trazia uma sensibilidade muito grande quanto as figuras que pintava, alguns exemplos são “O Julgamento de Páris”, “As Três Graças” e “O Desembarque em Marselha”.\r\n<br>\r\n<br>\r\n&nbsp; Em certo ponto de sua vida, após já ter uma carreira reconhecida como artista, Rubens receberia inúmeras comissões de obras para igrejas, príncipes e outros nobres, porém o mesmo não se deixava ser pressionado por isso, ele tinha à seu comando diversos aprendizes que o ajudavam nessas tarefas, boa parte das vezes tudo que ele de fato fazia era um esboço complexo e deixava para que os alunos finalizassem, somente alterava algo caso achasse necessário, isso mostrava a tamanha confiança que ele tinha em seus discentes.\r\n<br>\r\n<br>\r\n&nbsp; Durante a guerra dos trinta anos, Rubens aceitava pedidos tanto de jesuítas quanto de católicos, e graças a essa figura ímpar que ele foi denominado para sair em diversas missões diplomáticas, sendo inclusive um dos responsáveis pela trégua entre Espanha e Inglaterra.\r\n<br>\r\n<br>\r\n&nbsp; Ele morreu em 1640 aos 62 anos de idade.\r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b>A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 397-401', 'https://i.imgur.com/aSjqRbL.png', 2),
(16, 'William Turner', '&nbsp; Joseph Mallord William Turner (1775-1851) ficou conhecido por sua forma de representar a luz em suas pinturas, utilizando uma de suas técnicas que misturava aguarela e pintura a óleo, permitindo a representação de todas as gamas de luz, o que rendeu a ele o título de \"The Painter of Light\". Nasceu em Londres, filho de um barbeiro e uma comerciante, pouco sabe sobre a infância de Turner, que nunca falou publicamente sobre o assunto e possuía uma obsessão pela sua privacidade. Em 1785 foi morar com os tios em Brentwood, na periferia de Londres, e um ano depois em Margate, onde estudou e começou a pintar suas aguarelas, com incentivo do pai, que vendia suas produções.\r\n<br>\r\n<br>\r\n&nbsp; O talento de Turner foi reconhecido cedo em sua vida, sendo aceito na Academia Real de Artes aos 14 anos. Em 1799, Turner era visto como um prodígio pela academia e em 1808 foi nomeado para ser professor de perspectiva, cargo que ocupou até 1837, embora preferisse ter sido professor de paisagem, cargo que lhe fora negado. A academia foi de grande importância para Turner, chegando a assinar a sigla da escola nos quadros em que pintava.', '&nbsp; Joseph Mallord William Turner (1775-1851) ficou conhecido por sua forma de representar a luz em suas pinturas, utilizando uma de suas técnicas que misturava aguarela e pintura a óleo, permitindo a representação de todas as gamas de luz, o que rendeu a ele o título de \"The Painter of Light\". Nasceu em Londres, filho de um barbeiro e uma comerciante, pouco sabe sobre a infância de Turner, que nunca falou publicamente sobre o assunto e possuía uma obsessão pela sua privacidade. Em 1785 foi morar com os tios em Brentwood, na periferia de Londres, e um ano depois em Margate, onde estudou e começou a pintar suas aguarelas, com incentivo do pai, que vendia suas produções.\r\n<br>\r\n<br>\r\n&nbsp; O talento de Turner foi reconhecido cedo em sua vida, sendo aceito na Academia Real de Artes aos 14 anos. Em 1799, Turner era visto como um prodígio pela academia e em 1808 foi nomeado para ser professor de perspectiva, cargo que ocupou até 1837, embora preferisse ter sido professor de paisagem, cargo que lhe fora negado. A academia foi de grande importância para Turner, chegando a assinar a sigla da escola nos quadros em que pintava.\r\n<br>\r\n<br>\r\n&nbsp; Em 1818 Turner viajou para Veneza, Nápoles e Roma, visando adquirir maior reconhecimento, pintando e expondo suas obras o máximo possível. Esta ação foi frutífera, visto que em 1823 recebeu uma comissão da família real inglesa. Um pouco mais tarde, na década 1830, Turner mudou um pouco seus temas de pintura, ainda realizando paisagens, mas também trazendo temas sociais contemporâneos, como a escravatura. Este tipo de atitude rendeu críticas negativas a Turner, que era chamado de modernista por diversos de seus críticos.\r\n<br>\r\n<br>\r\n&nbsp; Deixando seu cargo na academia em 1837, Turner cessou suas viagens por motivos de saúde e em 1845 parou de vender suas pinturas por um acesso de raiva causado pela má preservação e interpretação de uma de suas pinturas vendidas. Turner parou de expor suas pinturas em 1849, devido a complicações de saúde, sendo oficialmente pela última vez em 1851, ano de sua morte.\r\n<br>\r\n<br>\r\n&nbsp; SEABRA, L. <b> Do Conflito Estético de Meltzer à luz de William Turner.</b> 2016. Tese (Mestrado em Psicologia) - Instituto Universitário Ciências Psicológicas, Sociais e da Vida, 2016. p. 3-11', 'https://i.imgur.com/6EwDOz9.jpg', 4),
(17, 'Caspar David Friedrich', '&nbsp; Caspar David Friedrich (1774-1840), nasceu na cidade de Greifswald. Artista conhecido por suas paisagens que refletem o estado de espírito da poesia lírica romântica de seu tempo. Caspar teve uma vida melancólica, perdendo membros familiares cedo em sua vida. \r\n<br>\r\n<br>\r\n&nbsp; Iniciou seus estudos no desenho, literatura e estética em 1790, na universidade de Greifswald. Em 1794 seu pai inscreveu-o na Academia de Artes de Copenhagen, onde se mostrou de grande talento, e onde descobriu seu interesse por paisagismo. Quatro anos depois, mudous para Dresden, ganhava a vida desenhando folhetos, foi nesta época que Caspar teve contato com algumas obras de artistas e autores românticos, chegando até mesmo a conhecer pessoalmente o escritor Goethe, que lhe ajudou a expor alguns de seus trabalhos. Inicialmente trabalhava apenas com aquarelas e desenhos, mas passou a utilizar a técnica de pintura a óleo.', '&nbsp; Caspar David Friedrich (1774-1840), nasceu na cidade de Greifswald. Artista conhecido por suas paisagens que refletem o estado de espírito da poesia lírica romântica de seu tempo. Caspar teve uma vida melancólica, perdendo membros familiares cedo em sua vida. \r\n<br>\r\n<br>\r\n&nbsp; Iniciou seus estudos no desenho, literatura e estética em 1790, na universidade de Greifswald. Em 1794 seu pai inscreveu-o na Academia de Artes de Copenhagen, onde se mostrou de grande talento, e onde descobriu seu interesse por paisagismo. Quatro anos depois, mudous para Dresden, ganhava a vida desenhando folhetos, foi nesta época que Caspar teve contato com algumas obras de artistas e autores românticos, chegando até mesmo a conhecer pessoalmente o escritor Goethe, que lhe ajudou a expor alguns de seus trabalhos. Inicialmente trabalhava apenas com aquarelas e desenhos, mas passou a utilizar a técnica de pintura a óleo.\r\n<br>\r\n<br>\r\n&nbsp; Obteve sucesso crítico considerável, sendo eleito para a Academia de Berlim e mais tarde para a Academia de Dresden em 1816. O estilo de Caspar era intrigante para a época, mesclando uma experiência natural em um estilo romântico, criando uma paisagem solitária, demonstrando a insignificância da vida humana perante ao silêncio do cenário. Infelizmente, seu sucesso perdurou por pouco tempo, visto que seu estilo seria considerado obsoleto não muito tempo depois.\r\n<br>\r\n<br>\r\n&nbsp; Caspar sofreu grandes dificuldades para se manter pintando após 1835, sofrendo sequelas de um derrame que o havia deixado semi-paralítico. Quando, em 1838, sua condição piorou ainda mais e acabou completamente incapacitado, suas obras passaram a ser consideradas ultrapassadas e já não geravam retorno financeiro suficiente, tendo de viver com o apoio de amigos até sua morte em 1840.\r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b>A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 496-497\r\n<br>\r\n<br>\r\n&nbsp; BEENKEN, H. <br>Caspar David Friedrich.</b> 1. ed. Nova York: Burlington Magazine Publications Ltd, apr. 1938. vol. 72. 421. p. 171', 'https://i.imgur.com/JdQMRvP.jpg', 4),
(18, 'Francisco de Goya', '&nbsp; Francisco de Paula José de Goya y Lucientes (1746-1828) nasceu na pequena vila de Fuendetodos. Após formar-se na escola local, foi a Madri para competir por uma vaga na Academia de San Fernando em 1763, infelizmente, acabou sendo rejeitado, mas isso não o impediu de estudar pintura em Madri. Ele foi aceito como aprendiz no estúdio do pintor da corte, Francisco Bayeu.\r\n<br>\r\n<br>\r\n&nbsp; Em 1770, Goya decidiu se mudar para a Itália, onde pôde estudar os trabalhos de grandes artistas do renascentismo. Obtendo considerável sucesso como pintor na Itália, ao vencer uma competição na Academia Real de Belas Artes da cidade de Parma em 1771, o que lhe deu crédito para retornar a Espanha, agora com uma carreira mais consolidada. Em 1780 Goya já era reconhecido por diversos de seus trabalhos e, dois anos depois, passou a ser patrocinado pelo Conde de Floridablanca, o que lhe permitiu uma grande alavancada para o sucesso, sendo, eventualmente, apontado para o cargo de pintor da corte.\r\n<br>\r\n<br>', '&nbsp; Francisco de Paula José de Goya y Lucientes (1746-1828) nasceu na pequena vila de Fuendetodos. Após formar-se na escola local, foi a Madri para competir por uma vaga na Academia de San Fernando em 1763, infelizmente, acabou sendo rejeitado, mas isso não o impediu de estudar pintura em Madri. Ele foi aceito como aprendiz no estúdio do pintor da corte, Francisco Bayeu.\r\n<br>\r\n<br>\r\n&nbsp; Em 1770, Goya decidiu se mudar para a Itália, onde pôde estudar os trabalhos de grandes artistas do renascentismo. Obtendo considerável sucesso como pintor na Itália, ao vencer uma competição na Academia Real de Belas Artes da cidade de Parma em 1771, o que lhe deu crédito para retornar a Espanha, agora com uma carreira mais consolidada. Em 1780 Goya já era reconhecido por diversos de seus trabalhos e, dois anos depois, passou a ser patrocinado pelo Conde de Floridablanca, o que lhe permitiu uma grande alavancada para o sucesso, sendo, eventualmente, apontado para o cargo de pintor da corte.\r\n<br>\r\n<br>\r\n&nbsp; Em 1792 Goya sofreu de uma grave doença, que afetou severamente sua vida e arte. Por meses, Goya permaneceu paralizado e quase cego, e embora tenha se recuperado, acabou completamente surdo. Assim que possível, retornou ao seu trabalho, produzindo notáveis obras, como o conjunto de onze pinturas para a Academia de San Fernando, na qual, neste período, Goya era o diretor de pintura.\r\n<br>\r\n<br>\r\n&nbsp; Os anos seguintes foram de grande atividade para Goya, que produziu diversos retratos e desenhos. Quando, em 1808, Charles IV abdicou seu cargo e a Espanha foi invadida pela França, gerando grandes horrores advindos da guerra, o que mobilizou Goya a publicar uma série de gravuras chamada \"Os Desastres da Guerra\". Este período foi especialmente turbulento para Goya, agravando-se com a morte de sua esposa em 1812.\r\n<br>\r\n<br>\r\n&nbsp; Após ficar enformado por uma grave doença novamente em 1819, Goya devotou-se à sua coleção de pinturas negras, que apresentavam bruxas, demônios, pessoas em formas estranhas e cenas grotescas, além de dedicar-se também à sua outra coleção chamada “Disparates”. Goya estava completamente desencantado com a vida na Espanha e, em 1824, solicitou permissão para mudar-se para a França, onde ficou em Paris por um tempo e então mudou-se para Bordeaux, onde produziu alguns retratos e eventualmente faleceu em 16 de abril de 1828.\r\n<br>\r\n<br>\r\n&nbsp; ANDERSON, J. <b>The Life and Work of Goya.</b> 1. ed. Bristol: Parragon Book Service Ltd, 1996. p. 5-7', 'https://i.imgur.com/AG1xuxl.jpg', 4),
(19, 'William Blake', '&nbsp; William Blake (1757-1827) nasceu em Londres, recebendo uma educação escassa, limitada a ler, escrever e calcular. Teve grande influência da bíblia, que tornou-se uma de suas fontes de inspiração. Blake adquiriu gosto pelo desenho desde o momento em que pegou um lápis na mão, criando cópias de qualquer imagem que visse, principalmente as obras de Rafael, as quais tinha grande admiração. Foi matriculado na escola de desenho de Pars com 10 anos de idade e, com o tempo, também passou a criar suas próprias poesias.\r\n<br>\r\n<br>\r\n&nbsp; Devido ao alto custo de aprendizado de Blake, seus pais optaram por transferir seus ensinamentos para James Basire, um famoso gravurista, que aceitou Blake como seu aprendiz. Blake principalmente desenhava monumentos e estátuas de catedrais para que fossem gravadas por Basire, o que fez com que adquirisse afinidade pela arte gótica e pelo conceito de espírito na arte. O aprendizado durou até 1779, quando Blake iniciou seus estudos na Academia Real Inglesa, onde aprendeu muito sobre a técnica da pintura e também adquiriu certo desgosto pela arte acadêmica.', '&nbsp; William Blake (1757-1827) nasceu em Londres, recebendo uma educação escassa, limitada a ler, escrever e calcular. Teve grande influência da bíblia, que tornou-se uma de suas fontes de inspiração. Blake adquiriu gosto pelo desenho desde o momento em que pegou um lápis na mão, criando cópias de qualquer imagem que visse, principalmente as obras de Rafael, as quais tinha grande admiração. Foi matriculado na escola de desenho de Pars com 10 anos de idade e, com o tempo, também passou a criar suas próprias poesias.\r\n<br>\r\n<br>\r\n&nbsp; Devido ao alto custo de aprendizado de Blake, seus pais optaram por transferir seus ensinamentos para James Basire, um famoso gravurista, que aceitou Blake como seu aprendiz. Blake principalmente desenhava monumentos e estátuas de catedrais para que fossem gravadas por Basire, o que fez com que adquirisse afinidade pela arte gótica e pelo conceito de espírito na arte. O aprendizado durou até 1779, quando Blake iniciou seus estudos na Academia Real Inglesa, onde aprendeu muito sobre a técnica da pintura e também adquiriu certo desgosto pela arte acadêmica.\r\n<br>\r\n<br>\r\n&nbsp; Após sair da academia, Blake seguiu no negócio de gravuras, ganhando reconhecimento modesto e utilizando seu tempo livre para o estudo e escrita da poesia. Após a morte de seu pai, em 1784, e ao notar o baixo retorno financeiro das gravuras, Blake se muda para Broad Street, ao lado de seu irmão, e abre sua própria loja de gravuras e estampas, onde escreveu, ilustrou e imprimiu alguns de seus trabalhos. Fechou a loja após dois anos após discussões com seu parceiro de negócios.\r\n<br>\r\n<br>\r\n&nbsp; Os trabalhos de Blake eram fortemente influenciados por sua visão religiosa, que juntamente a sua imaginação, gerou diversas obras fantasiosas e complexas, envoltas de seu próprio mundo.\r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b>A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 488-492\r\n<br>\r\n<br>\r\n&nbsp; GILCHRIST, A. <b>Life of William Blake.</b> Revised. ed. Mineola: Dover Publications, 2017. ', 'https://i.imgur.com/4Y1S9Az.jpg', 4),
(20, 'Jacques-Louis David', '&nbsp; Jacques Louis David (1748-1825) foi o principal artista neoclássico e o \"artista oficial\" do Governo Revolucionário, David desenhou os trajes e cenários para tais eventos de propaganda como o \"Festival do Ser Supremo\" em que Robespierre oficiava como Sumo Sacerdote autonomeado.\r\n<br>\r\n<br>\r\n&nbsp; Os revolucionários franceses gostavam de se considerar gregos e romanos renascidos, e sua pintura, não menos que a arquitetura, refletia seu gosto pelo que era designado como grandeza romana. Essas pessoas achavam estar vivendo tempos heróicos e que os acontecimentos de seus próprios dias eram tão dignos da atenção do pintor quanto os episódios da história grega e romana. Quando um dos líderes da Revolução Francesa, Marat, foi assassinado em seu banho por uma jovem fanática, David pintou-o como um mártir que morrera por sua causa. Marat, segundo parece, tinha o hábito de escrever durante o banho e sua banheira tinha uma pequena escrivaninha adaptada. Sua agressora entregara-lhe uma petição, que ele estava prestes a assinar quando ela o apunhalou. A situação não parece prestar-se facilmente a um quadro de dignidade e grandeza, mas David conseguiu torná-lo heróico, sem deixar de respeitar os detalhes concretos de um registro policial. ', '&nbsp; Jacques Louis David (1748-1825) foi o principal artista neoclássico e o \"artista oficial\" do Governo Revolucionário, David desenhou os trajes e cenários para tais eventos de propaganda como o \"Festival do Ser Supremo\" em que Robespierre oficiava como Sumo Sacerdote autonomeado.\r\n<br>\r\n<br>\r\n&nbsp; Os revolucionários franceses gostavam de se considerar gregos e romanos renascidos, e sua pintura, não menos que a arquitetura, refletia seu gosto pelo que era designado como grandeza romana. Essas pessoas achavam estar vivendo tempos heróicos e que os acontecimentos de seus próprios dias eram tão dignos da atenção do pintor quanto os episódios da história grega e romana. Quando um dos líderes da Revolução Francesa, Marat, foi assassinado em seu banho por uma jovem fanática, David pintou-o como um mártir que morrera por sua causa. Marat, segundo parece, tinha o hábito de escrever durante o banho e sua banheira tinha uma pequena escrivaninha adaptada. Sua agressora entregara-lhe uma petição, que ele estava prestes a assinar quando ela o apunhalou. A situação não parece prestar-se facilmente a um quadro de dignidade e grandeza, mas David conseguiu torná-lo heróico, sem deixar de respeitar os detalhes concretos de um registro policial. \r\n<br>\r\n<br>\r\n&nbsp; Ele aprendera através do estudo da escultura grega e romana como modelar os músculos e tendões do corpo, e a dar-lhe a aparência de nobre beleza; também aprendera com a arte clássica a deixar de fora todos os detalhes que não são essenciais ao efeito principal e a almejar a simplicidade. Não há cores variegadas nem escorços complicados\r\nno quadro. É uma comemoração impressionante de um humilde \"amigo do povo\" — como o próprio Marat se intitulava — que sofrerá o destino de um mártir enquanto trabalhava pelo bem comum.\r\n\r\n<br>\r\n<br>\r\n&nbsp; GOMBRICH, E. H. <b>A História da Arte.</b> 16. ed. Rio de Janeiro: LTC, 2012. p. 485', 'https://i.imgur.com/6ffLJQn.jpg', 5),
(21, 'William Adolphe Bouguereau', '&nbsp; William-Adolphe Bouguereau (1825-1905) nasceu na cidade de La Rochelle, na França. Ele foi enviado, ainda muito jovem, para o colégio católico de Pons, onde aprendeu e adquiriu gosto pelo desenho. Foi treinado nas artes da pintura por Lois Sage, que o auxiliou no seu desenvolvimento de ideias e em suas atitudes, principalmente em relação ao seu estilo de pintura, fortemente influenciado por Ingres.\r\n<br>\r\n<br>\r\n&nbsp; Na época, os pintores franceses se dividiam em dois grupos: Aqueles que seguiam Ingres, considerando o delineado como o elemento mais importante, por ser a Forma aquilo que define a arte; e os seguidores de Eugene Delacroix, que pregavam o desuso das técnicas clássicas e a imponência da improvisação e da cor, estes, se denominavam como \"Românticos\". O professor de Bouguereau era um ávido seguidor de Ingres, e como tal, repassou suas convicções para seu aprendiz, que acatou os ensinamentos clássicos da academia como absolutos.', '&nbsp; William-Adolphe Bouguereau (1825-1905) nasceu na cidade de La Rochelle, na França. Ele foi enviado, ainda muito jovem, para o colégio católico de Pons, onde aprendeu e adquiriu gosto pelo desenho. Foi treinado nas artes da pintura por Lois Sage, que o auxiliou no seu desenvolvimento de ideias e em suas atitudes, principalmente em relação ao seu estilo de pintura, fortemente influenciado por Ingres.\r\n<br>\r\n<br>\r\n&nbsp; Na época, os pintores franceses se dividiam em dois grupos: Aqueles que seguiam Ingres, considerando o delineado como o elemento mais importante, por ser a Forma aquilo que define a arte; e os seguidores de Eugene Delacroix, que pregavam o desuso das técnicas clássicas e a imponência da improvisação e da cor, estes, se denominavam como \"Românticos\". O professor de Bouguereau era um ávido seguidor de Ingres, e como tal, repassou suas convicções para seu aprendiz, que acatou os ensinamentos clássicos da academia como absolutos.\r\n<br>\r\n<br>\r\n&nbsp; Uma vez concluído seus estudos preparatórios, Bouguereau se reuniu com sua família em sua nova moradia em Bordeaux, onde foi admitido na escola municipal de arte, se tornando um aluno de destaque. Com isso, optou por prosseguir seus estudos na área artística na École des Beaux-Arts em Paris, onde novamente se tornou um aluno de destaque. Após concluir seu curso, William ganhou notável fama, sendo frequentemente premiado por suas pinturas, no entanto, isto perdurou somente até, aproximadamente, o fim do século XIX, visto que, na época, o movimento modernista vinha ganhando força no meio artístico e as obras de estilo classicista de Bouguereau recebiam duras críticas, por serem consideradas já ultrapassadas. As críticas ao estilo de Bouguereau perduraram por muito tempo após sua morte em 1905.\r\n<br>\r\n<br>\r\n&nbsp; MENARD, R.  <b>The Portfolio: an artistic periodical.</b> 6. ed. Londres:  Open Court Publishing Co, 1875. p. 42-44\r\n<br>\r\n<br>\r\n&nbsp; GRACE, G. <b>Art View: To Bouguereau art was strictly \'THE BEAUTIFUL\'.</b> National edition. Nova York: The New York Times, 6 jan. 1985. Section 2. p. 27 ', 'https://i.imgur.com/a4RNq76.jpg', 5);
INSERT INTO `artistas` (`id_artista`, `nome_artista`, `resumo_artista`, `descricao_artista`, `imagem_artista`, `fk_periodo`) VALUES
(22, 'Jean-Auguste Dominique Ingres', '&nbsp; Jean-Auguste Dominique Ingres (1780-1867) nasceu na cidade de Montauban, na França. O pai de Ingres, Jean-Joseph, era também um artista, que produzia diversas confecções, principalmente para decorações domiciliares, no entanto, desejava que seu filho seguisse a área da música. Ingres chegou a performar uma peça de orquestra no teatro de Toulouse aos treze anos, foi em torno desta época que Ingres teve contato com alguns trabalhos de Rafael e fragmentos de antigas esculturas. Ingres ficou fascinado pela pintura e passou a praticá-la em segredo, eventualmente sendo permitido por seu pai a ter aulas de pintura.\r\n<br>\r\n<br>\r\n&nbsp; Ingres estudou sob tutoria de Joseph Roques, um artista pouco impressionante para a época, mas Ingres obteve grande progresso em sua habilidade de pintura. Após dois anos de estudos, a tutoria de Ingres ficou por conta de Vigan, o professor de pintura da Academia de Artes Finas, mas somente decidiu se tornar um pintor de forma definitiva quando passou a ser ensinado por Briant, um artista brilhante, que ganhou rapidamente o respeito de Ingres. Após seu período de lições, Ingres iniciou sua jornada para Paris, em 1796, sendo admitido na escola de Jacques Louis David, que na época era o mais aclamado artista da França.', '&nbsp; Jean-Auguste Dominique Ingres (1780-1867) nasceu na cidade de Montauban, na França. O pai de Ingres, Jean-Joseph, era também um artista, que produzia diversas confecções, principalmente para decorações domiciliares, no entanto, desejava que seu filho seguisse a área da música. Ingres chegou a performar uma peça de orquestra no teatro de Toulouse aos treze anos, foi em torno desta época que Ingres teve contato com alguns trabalhos de Rafael e fragmentos de antigas esculturas. Ingres ficou fascinado pela pintura e passou a praticá-la em segredo, eventualmente sendo permitido por seu pai a ter aulas de pintura.\r\n<br>\r\n<br>\r\n&nbsp; Ingres estudou sob tutoria de Joseph Roques, um artista pouco impressionante para a época, mas Ingres obteve grande progresso em sua habilidade de pintura. Após dois anos de estudos, a tutoria de Ingres ficou por conta de Vigan, o professor de pintura da Academia de Artes Finas, mas somente decidiu se tornar um pintor de forma definitiva quando passou a ser ensinado por Briant, um artista brilhante, que ganhou rapidamente o respeito de Ingres. Após seu período de lições, Ingres iniciou sua jornada para Paris, em 1796, sendo admitido na escola de Jacques Louis David, que na época era o mais aclamado artista da França.\r\n<br>\r\n<br>\r\n&nbsp; Ingres foi considerado um dos prodígios da escola de David, após um árduo período de aprendizado, Ingres sentiu-se confiante o bastante para seguir seu próprio caminho, não mais seguindo obedientemente os passos de David. Neste período, Ingres ganhou diversos prêmios por seus trabalhos artísticos, mostrando grande originalidade e vigor. Foi em torno deste período que a admiração de Ingres pelos artistas do século XVI começou a aflorar, a ponto de desejar estudar na academia de Roma, mas os custos eram inviáveis. Ele acabou recebendo uma comissão do governo francês pouco tempo depois, para a execução de um retrato de Napoleão, no entanto, o retrato teria de ser completamente imaginado pelo artista, que somente poderia ver o rosto do consulado por alguns minutos. Com o dinheiro da comissão, Ingres se dirigiu para Roma, visando aprofundar seus estudos.\r\n<br>\r\n<br>\r\n&nbsp; Sendo admitido na academia de Roma, o estilo de Ingres ganhou força e vida, recebendo grande inspiração dos trabalhos de Rafael e Michelangelo. O progresso em sua técnica era visto facilmente após cinco anos de estudos na academia. E, após a produção de diversas obras, Ingres deixa Roma em 1820, e se muda para Veneza, onde realizou alguns de seus mais aclamados trabalhos, ganhando fama considerável, o que fez com que Ingres decidisse regressar a Paris e iniciar sua própria escola de arte, mas descartou essa ideia após receber a oferta pelo cargo de diretor na Escola de Arte Francesa em Roma, cargo este que ocupou por sete anos.\r\n<br>\r\n<br>\r\n&nbsp; Retornou a Paris em 1841, já idoso, Ingres produziu poucas obras após seu retorno, mas houveram inúmeras exposições de seus trabalhos, que receberam diversos elogios. Assim permaneceu até sua morte em 14 de janeiro de 1867.\r\n<br>\r\n<br>\r\n&nbsp; WEDMORE, T. <b>The Contemporary Review.</b> 5. ed. Londres:  Alexander Strahan & Co, 1867. p. 458-470', 'https://i.imgur.com/jAlSri4.jpg', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `obras`
--

DROP TABLE IF EXISTS `obras`;
CREATE TABLE IF NOT EXISTS `obras` (
  `id_obra` int(11) NOT NULL AUTO_INCREMENT,
  `fk_artista` int(11) NOT NULL,
  `fk_periodo` int(11) NOT NULL,
  `dificuldade_obra` int(11) NOT NULL,
  `nome_obra` varchar(70) NOT NULL,
  `ano_obra` int(11) NOT NULL,
  `descricao_obra` varchar(500) NOT NULL,
  `imagem_obra` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id_obra`),
  KEY `fk_artista` (`fk_artista`),
  KEY `fk_periodo` (`fk_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `obras`
--

INSERT INTO `obras` (`id_obra`, `fk_artista`, `fk_periodo`, `dificuldade_obra`, `nome_obra`, `ano_obra`, `descricao_obra`, `imagem_obra`) VALUES
(6, 1, 1, 1, 'Mona Lisa', 1503, '&nbsp; Pintada por volta de 1503-1506, é a obra mais famosa de Leonardo Da Vinci e do mundo. A obra é o retrato de Lisa Del Giocondo, esposa de um comerciante da época.', 'https://i.imgur.com/9TggtCk.png'),
(7, 2, 1, 1, 'O Nascimento de Vênus', 1486, '&nbsp; A pintura criada por volta de 1483-1386 é a obra mais famosa de Sandro Botticelli, ela mostra a deusa Vênus saindo de uma concha enquanto recebe ventos do deus Zéfiro. ', 'https://i.imgur.com/Qg8OP33.png'),
(10, 9, 2, 1, 'Judite e Holofernes', 1599, '&nbsp; Obra pintada em 1599, na época foi controversa gerando fortes reações nas pessoas, ela mostra a viúva Judite decapitando o general Holofernes.', 'https://i.imgur.com/715VqOo.png'),
(11, 1, 1, 1, 'Dama com Arminho', 1490, '&nbsp; Concebida entre 1485-1490, é uma pintura de Cecília Gallenari segurando um arminho em seus braços, foi encomendada por seu companheiro Ludovico Sforza.  ', 'https://i.imgur.com/w1bhajg.png'),
(16, 1, 1, 1, 'A Última Ceia', 1498, '&nbsp; Datada de 1495-1498, a obra foi um afresco para a igreja italiana \'Santa Maria delle Grazie\'. A obra é uma representação do evento bíblico em que Jesus teve sua última refeição com seus apóstolos.', 'https://i.imgur.com/jrG1Nkr.png'),
(17, 1, 1, 1, 'La Belle Ferroniere', 1495, '&nbsp; Concebida entre 1490-1495 logo após \'Dama com Arminho\', foi encomendada por Ludovico Sforza porém é desconhecido a real pessoa que a obra representa.', 'https://i.imgur.com/wwynqOR.png'),
(18, 1, 1, 1, 'Salvator Mundi', 1500, '&nbsp; Obra pintada por cerca do ano 1500, representa a figura de Jesus Cristo segurando um globo de cristal. É a obra mais cara vendida até hoje por cerca de 450 milhões de dólares. ', 'https://i.imgur.com/eK3sNO4.png'),
(19, 1, 1, 2, 'São João Batista', 1509, '&nbsp; Pintada por volta de 1508-1509 mostra o pregador João Batista erguendo seu dedo de forma enigmática, acredita-se que tenha sido o último trabalho de Da Vinci.', 'https://i.imgur.com/T7REmLA.png'),
(20, 1, 1, 3, 'Ginevra de Benci', 1478, '&nbsp; Datada de 1475-1478, é o retrato de Ginevra de Benci, uma aristocrata florentina.', 'https://i.imgur.com/bpl1DjQ.png'),
(21, 1, 1, 2, 'A Anunciação', 1475, '&nbsp; Pintada por volta de 1472 quando Leonardo Da Vinci estava na oficina de Andrea del Verrocchio, mostra o arcanjo Gabriel anunciando à Maria que seria a mãe de Jesus.\r\n', 'https://i.imgur.com/gx6VbNE.png'),
(22, 2, 1, 1, 'Vênus e Marte', 1485, '&nbsp; Obra pintada por cerca de 1485, representa os deuses romanos do Amor e da Guerra, Vênus e Marte. ', 'https://i.imgur.com/13tZFFC.png'),
(23, 2, 1, 1, 'A Primavera', 1482, '&nbsp; Obra pintada em 1482, mostra diversos personagens mitológicos em uma floresta.', 'https://i.imgur.com/hiJk6QI.jpg'),
(24, 2, 1, 2, 'A Natividade Mística', 1501, '&nbsp; Pintada por volta de 1500-1501, mostra o nascimento de Jesus.', 'https://i.imgur.com/WDuOYTs.png'),
(25, 2, 1, 2, 'A Adoração dos Magos', 1486, '&nbsp; Pintada por volta de 1485-1486, como o nome indica a obra mostra a adoração dos magos, acontecimento cristão onde três reis magos se apresentam diante de Jesus. ', 'https://i.imgur.com/rtqn34B.png'),
(26, 10, 1, 1, 'O Casal Arnolfini', 1434, '&nbsp; Pintada em 1434 a obra mostra Giovanni Arnolfini e sua esposa Giovanna Cenami. É a obra mais famosa de Jan Van Eyck e considerada extremamente a frente de seu tempo pelas técnicas de perspectivas utilizadas.', 'https://i.imgur.com/EalVYd5.png'),
(27, 10, 1, 2, 'A Virgem do Chanceler Rolin', 1435, '&nbsp; Concebida em 1435, a obra mostra o chanceler Nicolas Rolin ao lado de Virgem Maria segurando Jesus em seu colo.', 'https://i.imgur.com/Km2lEHv.png'),
(28, 10, 1, 3, 'Adoração do Cordeiro', 1432, '&nbsp; Pintada em 1432 como parte do \'Retábulo de Gante\', mostra um grupo de indivíduos ao redor de um cordeiro sangrando, sendo esse uma alusão à morte e ressureição de cristo.', 'https://i.imgur.com/TAkZp5L.png'),
(29, 10, 1, 3, 'São Jerônimo em seu Gabinete', 1442, '&nbsp; Concebida em 1442, um ano após a morte de Jan Van Eyck, por esse motivo acredita-se que a obra tenha sido finalizada por outra pessoa. Ela mostra o sacerdote Jerônimo estudando em seu gabinete.', 'https://i.imgur.com/t7o2dOk.png'),
(30, 11, 1, 1, 'A Criação de Adão', 1512, '&nbsp; Pintada por volta de 1508-1512 no teto da Capela Sistina, a obra mostra Deus estendendo a mão para conceder a vida à Adão.', 'https://i.imgur.com/PQL4ACl.png'),
(31, 11, 1, 1, 'O Juízo Final', 1541, '&nbsp; Concebida em 1541 após 6 anos de seu início, a obra que mede cerca de 13 metros de altura e 12 metros de largura mostra o evento cristão do Juízo Final, quando Deus realiza o julgamento de todas as pessoas.', 'https://i.imgur.com/vf6LaR6.png'),
(32, 11, 1, 2, 'O Tormento de Santo Antônio', 1488, '&nbsp; Conhecida como a primeira pintura de Michelangelo foi concebida entre 1487-1488 como uma adaptação da obra original \'A Tentação de Santo Antônio\' por Martin Schongauer. A obra mostra Santo Antônio coberto por demônios.\r\n', 'https://i.imgur.com/oSb9lK5.png'),
(33, 11, 1, 3, 'Sibila Délfica', 1509, '&nbsp; Pintada por volta de 1509 na Capela Sistina, mostra a figura da Sibila, uma profeta associada a religiões gregas.', 'https://i.imgur.com/s4ILXrT.png'),
(34, 11, 1, 3, 'Tondo Doni', 1506, '&nbsp; Concebida entre 1503-1506, trata-se de uma pintura encomendada pela família Doni mostrando a Sagrada Família, Jesus, Maria e José.', 'https://i.imgur.com/XsB949U.png'),
(39, 12, 1, 1, 'A Torre de Babel', 1563, '&nbsp; Pintada por volta de 1563 é uma de três obras que compartilhavam o mesmo tema, a \'Torre de Babel\', sendo essa uma torre de origem Bíblica na qual a humanidade construiu para chegar até Deus.', 'https://i.imgur.com/BOS1W1c.png'),
(40, 12, 1, 2, 'O Triunfo da Morte', 1562, '&nbsp; Criada em 1562 a obra mostra um exército de figuras esqueléticas causando destruição em um campo. É uma representação da famosa alegoria medieval \"Dança da Morte\", onde é dito que independentemente de quem a pessoa foi ou fez, todos são iguais perante a morte. ', 'https://i.imgur.com/BZOrkoq.png'),
(41, 12, 1, 3, 'Caçadores na Neve', 1565, '&nbsp; Concebida em 1565, é uma obra que retrata o cotidiano de uma vila de caçadores, é também parte de uma serie 6 obras em que Pieter Bruegel pintou o ciclo de um ano.', 'https://i.imgur.com/nJ0vmUB.png'),
(42, 12, 1, 3, 'Ceifeiros', 1565, '&nbsp; Pintada em 1565, a obra mostra um grupo de ceifeiros trabalhando no campo, enquanto outros descansam ao pé de uma árvore, a pintura é parte de uma serie 6 obras em que Pieter Bruegel pintou o ciclo de um ano.', 'https://i.imgur.com/XS2LBq0.png'),
(43, 12, 1, 2, 'Provérbios Neerlandeses', 1559, '&nbsp; Pintada por volta de 1559, a obra mostra diversas situações absurdas e caóticas entre pessoas, como uma forma de explorar a loucura do ser humano.', 'https://i.imgur.com/EH9AgVr.png '),
(44, 12, 1, 2, 'Jogos Infantis', 1560, '&nbsp; Concebida em 1560, a pintura mostra diversas brincadeiras infantis sendo exercida por várias crianças diferentes, assim como \'Provérbios Neerlandeses\' a obra tem o objetivo de catalogar algo, nesse caso brincadeiras.', 'https://i.imgur.com/W4fXhaV.png'),
(45, 9, 2, 1, 'Medusa', 1597, '&nbsp; Concebida em 1597, a obra que foi pintada em um escudo mostra a cabeça decapitada de Medusa, personagem da mitologia grega.', 'https://i.imgur.com/Y3weNlF.png'),
(46, 9, 2, 1, 'Narciso', 1599, '&nbsp; Pintada por volta de 1597-1599, a obra mostra Narciso, personagem de um dos poemas de Ovídio que se apaixonou pelo próprio reflexo e morreu de paixão.', 'https://i.imgur.com/TYZ61Of.png'),
(47, 9, 2, 2, 'Davi com a Cabeça de Golias', 1610, '&nbsp; Criada entre 1609-1610, mostra o personagem bíblico Davi com uma expressão de melancolia enquanto leva consigo a cabeça de Golias.', 'https://i.imgur.com/cUR5UoD.png'),
(48, 9, 2, 2, 'Baco', 1595, '&nbsp; Obra pintada em 1595, mostra a figura de Baco o deus grego do vinho e da festa, enquanto segura um cálice ao lado de uma cesta de frutas.', 'https://i.imgur.com/PPKdwBd.png'),
(49, 9, 2, 2, 'A Captura de Cristo', 1602, '&nbsp; Obra datada de 1602, mostra o evento da traição de Judas, quando o mesmo conduziu soldados para executar a prisão de Jesus.', 'https://i.imgur.com/10Ju0DV.png'),
(50, 9, 2, 3, 'A Conversão de São Paulo', 1601, '&nbsp; Pintada em cerca de 1600-1601, faz parte de uma comissão de duas obras sobre o mesmo assunto, sendo a outra \'Crucificação de São Pedro\'. A obra é a representação do momento em que São Paulo teve uma visão de Cristo quando estava a caminho de eliminar um grupo de cristãos.', 'https://i.imgur.com/89wMaqw.png'),
(51, 9, 1, 3, 'Crucificação de São Pedro', 1601, '&nbsp; Datada de 1601, foi criada juntamente com \'A Conversão de São Paulo\' como parte de uma comissão de obras com o mesmo tema. Esta mostra São Pedro sendo crucificado de ponta cabeça pelos romanos.', 'https://i.imgur.com/eJYZ5JE.png'),
(58, 13, 2, 1, 'Moça com Brinco de Pérola', 1655, '&nbsp; Datada de 1655, a obra mostra uma mulher de traços delicados utilizando um véu e brincos de pérola. É a obra mais famosa de Johannes Vermeer, em 2022 sofreu um atentado por ativistas porém não foi danificada.', 'https://i.imgur.com/pt8jfg3.png'),
(59, 13, 2, 1, 'A Arte da Pintura', 1666, '&nbsp; Pintada por volta de 1666, a obra mostra um artista pintando o retrato de uma mulher. É uma das obras mais complexas de Vermeer, acredita-se que a figura do pintor na obra é um autorretrato seu.  ', 'https://i.imgur.com/7LOnZuc.png'),
(60, 13, 2, 2, 'A Leiteira', 1658, '&nbsp; Concebida por volta de 1657-1658, a obra mostra uma dona de casa derramando leite em um jarro.', 'https://i.imgur.com/AXz07LB.png'),
(61, 13, 2, 2, 'Moça Lendo uma Carta à Janela', 1659, '&nbsp; Pintada por volta de 1657-1659, mostra uma moça melancólica lendo uma carta de frente para a janela, existe a figura de um cupido na parede de trás, porém foi escondido por uma camada de tinta.', 'https://i.imgur.com/3x1soRW.png'),
(62, 13, 2, 3, 'Vista de Delft', 1661, '&nbsp; Pintada entre 1660-1661, a obra apresenta a paisagem do porto de Delft, cidade holandesa em que Johannes Vermeer nasceu, ao fundo é possível ver pessoas conversando e barcos ancorados.', 'https://i.imgur.com/9tO9RXl.png'),
(63, 13, 2, 3, 'A Guitarrista ', 1672, '&nbsp; Concebida em 1672, a obra mostra uma mulher jovem com ar alegre tocando um violão.', 'https://i.imgur.com/STH9TDD.png'),
(64, 14, 2, 1, 'A Ronda Noturna', 1642, '&nbsp; Criada entre 1639-1642, é a obra mais conhecida de Rembrandt, ela mostra os guardas cívicos que atuaram na guerra da independência holandesa.', 'https://i.imgur.com/8qfOgi6.png'),
(65, 14, 2, 1, 'Tempestade no Mar da Galileia', 1633, '&nbsp; Criada por volta de 1633, a pintura representa o evento bíblico onde Jesus e seus discípulos atravessaram o mar da Galileia em um barco. A obra foi roubada em 1990 do museu \'Isabella Stewart Gardner\' onde ficava, até os dias de hoje ela permanece desaparecida.', 'https://i.imgur.com/gQFLWST.png'),
(66, 14, 2, 2, 'A Lição de Anatomia do Dr Tulp', 1632, '&nbsp; Pintada em 1632, a obra apresenta o médico neerlandês Nicolaes Tulp realizando uma aula de anatomia humana enquanto seus alunos observam boquiabertos. ', 'https://i.imgur.com/ywSGUDq.png'),
(67, 14, 2, 3, 'O Retorno do Filho Pródigo', 1669, '&nbsp; Concebida em 1669, acredita-se ser uma das últimas obras de Rembrandt, ela retrata o evento bíblico em que o filho volta para a casa de seu pai desesperado após ter gastado todo seu dinheiro.  ', 'https://i.imgur.com/MxWm5HV.png'),
(68, 14, 2, 3, 'Danae', 1636, '&nbsp; Pintada por volta de 1636, a obra apresenta a personagem da mitologica Danae deitada em seus aposentos, na mitologia grega Danae é mãe de Perseus com Zeus.', 'https://i.imgur.com/6HVOxfa.png'),
(69, 15, 2, 1, 'Sansão e Dalila', 1610, '&nbsp; Concebida em 1610, a obra mostra o evento Bíblico de quando Sansão adormeceu no colo de Dalila e teve seu cabelo cortado.', 'https://i.imgur.com/T6tod7D.png'),
(70, 15, 2, 2, 'Elevação da Cruz', 1611, '&nbsp; Pintada por volta de 1611, a obra mostra Jesus já preso a cruz enquanto diversos homens a puxam para cima. Originalmente haviam duas versões da obra.', 'https://i.imgur.com/LTU0F4Y.png'),
(71, 15, 2, 2, 'O Julgamento de Páris', 1636, '&nbsp; Datada de 1636, a obra mostra o personagem Páris da mitologia grega ao lado das deusas Afrodite, Hera e Atena. Assim como outras obras de Peter Paul Rubens, foram feitas mais de uma versão da obra.', 'https://i.imgur.com/Ncl2GeH.png'),
(72, 15, 2, 3, 'As Três Graças', 1635, '&nbsp; Criada em torno de 1635, a pintura apresenta três das Graças da mitologia grega, essas eram deusas da beleza, natureza e fertilidade.', 'https://i.imgur.com/8aOca4K.png'),
(73, 15, 2, 3, 'O Desembarque em Marselha', 1625, '&nbsp; Datada de 1625, a pintura mostra a rainha Maria de Médici chegando à cidade de Marselha, ela é recepcionada por diversas pessoas ao mesmo tempo que Netuno e outros personagens da mitologia romana à saúdam. A obra foi comissionada por ela junto com outras 23 pinturas para decorar o palácio de Luxemburgo.', 'https://i.imgur.com/4WuhdOM.png'),
(77, 16, 4, 1, 'Os Pescadores no Mar', 1796, '&nbsp; A pintura retrata um cenário marítimo ao luar, com pescadores em mares agitados perto da Ilha de Wight.', 'https://i.imgur.com/AlAnlcu.jpg'),
(78, 16, 4, 1, 'A Quinta Praga do Egito', 1800, '&nbsp; Apesar do título, a obra retrata Moisés amaldiçoando os egípcios com uma praga de granizo e fogo, conhecida como a sétima praga.', 'https://i.imgur.com/3VAMgNX.jpg'),
(79, 16, 4, 2, 'Aníbal e seu Exército Atravessando os Alpes', 1812, '&nbsp; A pintura representa o esforço dos soldados de Aníbal ao cruzar os Alpes Marítimos em 218 a.C. contrariados pelas forças da natureza e pelas tribos locais.', 'https://i.imgur.com/MsctTdX.jpg'),
(80, 17, 4, 1, 'Caminhante Sobre o Mar de Névoa', 1818, '&nbsp; Datado de 1818, a pintura encarna a essência dos princípios da estética romântica de paisagem, mostrando uma figura solitária contemplando uma imponente paisagem alpina de cima de um pico rochoso.', 'https://i.imgur.com/M3bazlk.jpg'),
(81, 17, 4, 1, 'Nascer da Lua Sobre o Mar\r\n', 1822, '&nbsp; Concebido em torno de 1822, o quadro apresenta três jovens, duas mulheres lado a lado e um homem mais atrás, que estão sentados em uma grande pedra à beira-mar, observando a lua nascer a leste sobre um grupo de nuvens.', 'https://i.imgur.com/0bSmPod.jpg'),
(82, 17, 4, 1, 'Penhascos de Giz em Rügen', 1818, '&nbsp; Pintada por volta de 1818, a pintura retrata a vista dos penhascos de giz do Stubben Kammer, na época um dos mirantes mais famosos da ilha.', 'https://i.imgur.com/mjikrHV.jpg'),
(83, 17, 4, 1, 'O Mar de Gelo', 1824, '&nbsp; Datada de 1824, Mar de Gelo é uma pintura a óleo que retrata um naufrágio no Ártico.', 'https://i.imgur.com/4XFrPll.jpg'),
(84, 17, 4, 1, 'O Caçador na Floresta', 1814, '&nbsp; Criada em 1814, o quadro apresenta um caçador andando em uma floresta sombria, visivelmente maior que o homem, que parece minúsculo quando comparado ao cenário natural.', 'https://i.imgur.com/CIxHo6r.jpg'),
(85, 18, 4, 1, 'Saturno Devorando seu Filho', 1823, '&nbsp; Concebida em 1823, apresenta o deus Saturno da mitologia romana, também conhecido como Cronos na mitologia grega, no ato de devorar um dos seus filhos.', 'https://i.imgur.com/hSQ78Ui.jpg'),
(86, 18, 4, 1, 'Dois Velhos Comendo Sopa', 1823, '&nbsp; Datada de 1823, no quadro aparecem dois personagens anciãos. O da esquerda, com lenço branco, desenha uma careta com a sua boca. O outro personagem contrasta vivamente com ele: com um rosto de cadáver, os seus olhos são vazios escuros e a sua cabeça tem em geral o aspecto de uma caveira.', 'https://i.imgur.com/uqaMU8a.jpg'),
(87, 18, 4, 1, 'O Cão', 1823, '&nbsp; Pintada por volta de 1823, a obra mostra a cabeça de um cachorro olhando para cima. O cachorro em si quase se perde na vastidão do resto da imagem, que está vazia exceto por uma área escura e inclinada perto da parte inferior da imagem.', 'https://i.imgur.com/AvFxBR1.jpg'),
(88, 18, 4, 2, 'Judite e Holofernes', 1823, '&nbsp; Criada por volta de 1823, o quadro recria de modo pessoal o conhecido tema de Judite de Betúlia que, para salvar o seu povo do ataque do rei Holofernes, o seduz e o mata.', 'https://i.imgur.com/gGsh2rh.jpg'),
(89, 18, 4, 2, 'Sabá das Bruxas', 1798, '&nbsp; Datada de 1798, a tela mostra um ritual de aquelarre, presidido pelo Grande Bode, uma das formas que toma o demônio, no centro da composição.', 'https://i.imgur.com/HBvxr14.jpg'),
(90, 18, 4, 3, 'A Romaria de Santo Isidro', 1823, '&nbsp; Concebida em 1823, esta obra mostra uma visão da romaria à Ermida de Santo Isidro de Madrid.', 'https://i.imgur.com/HAufYwF.jpg'),
(91, 19, 4, 3, 'Newton', 1795, '&nbsp; Realizada em 1795, na obra vemos Isaac Newton sentado nu em um afloramento rochoso coberto de algas, aparentemente no fundo do mar. Sua atenção está focada em diagramas que ele desenha com um compasso sobre um pergaminho.', 'https://i.imgur.com/7q0aVcD.jpg'),
(92, 19, 4, 3, 'O Ancião dos Dias', 1794, '&nbsp; Datada de 1794, a obra mostra Urizen, um personagem criado por Blake, agachado em um desenho circular com um fundo semelhante a uma nuvem. Sua mão estendida segura uma bússola sobre o vazio mais escuro abaixo.', 'https://i.imgur.com/wvwVxJH.jpg'),
(97, 20, 5, 1, 'A Morte de Marat', 1793, '&nbsp; Realizada em 1793, a pintura mostra Jean-Paul Marat, revolucionário francês, assassinado em casa em 13 de julho por Charlotte Corday. Tratando-se de uma homenagem de David à Marat.', 'https://i.imgur.com/svGoFDB.png'),
(98, 20, 5, 1, 'Napoleão cruzando os Alpes', 1805, '&nbsp; Criada em 1805, é um retrato pintado a óleo de Napoleão Bonaparte. Inicialmente encomendado pelo embaixador espanhol na França, junto a composição mostra uma versão fortemente idealizada da verdadeira passagem de Napoleão e de seu exército pelos Alpes em 1800.', 'https://i.imgur.com/vPjbeIN.jpg'),
(99, 20, 5, 1, 'A Morte de Sócrates', 1787, '&nbsp; Datada de 1787, a pintura foca-se na história da execução de Sócrates conforme contada por Platão no Fédon.', 'https://i.imgur.com/13AfIGV.png'),
(100, 20, 5, 3, 'O Juramento dos Horácios', 1784, '&nbsp; Pintada por volta de 1784, mostra três irmãos fazendo a saudação romana, com a qual juram que lutarão pela Monarquia Romana, embora sua decisão traga sofrimento a suas famílias. A pintura simboliza o princípio segundo o qual o dever público, o sacrifício pessoal, o patriotismo e a defesa das convicções tomadas em consciência são valores superiores à própria segurança, ou seja, aos seus interesses.', 'https://i.imgur.com/CL3LPpI.jpg'),
(101, 21, 5, 1, 'Dante e Virgílio no Inferno', 1850, '&nbsp; Datada de 1850, a pintura demonstra um episódio da Divina Comédia, de Dante, que descreve a entrada de Virgílio e de Dante no oitavo círculo do inferno, onde encontram-se os falsificadores. Lá eles assistem a uma luta entre duas almas condenadas.', 'https://i.imgur.com/N84qldM.jpg'),
(102, 21, 5, 1, 'Ninfas e Sátiro', 1873, '&nbsp; Concebida em 1873, a obra apresenta um grupo de ninfas capturando um sátiro.', 'https://i.imgur.com/drvEwpi.jpg'),
(103, 21, 5, 2, 'A Aurora', 1881, '&nbsp; Realizada em 1881, a obra representa a divindade celeste grega Eos, personificação da alba ou \"aurora do mundo\", nome dado ao quadro.', 'https://i.imgur.com/toskDdn.jpg'),
(104, 21, 5, 2, 'As Oréades', 1902, '&nbsp; Datada de 1902, a pintura mostra as Oréades ascendendo ao céu enquanto três Sátiros as observam, aparentemente perplexos com a visão.', 'https://i.imgur.com/A3yjbtn.jpg'),
(105, 21, 5, 3, 'O Remorso de Orestes', 1862, '&nbsp; Pintada em 1862, trata-se de uma representação do personagem Orestes, após ter atentado contra sua mãe, Clitemnestra, sendo persuadido pelas Erínias.', 'https://i.imgur.com/Pf8XG7x.jpg'),
(106, 22, 5, 3, 'O Sonho de Ossian', 1813, '&nbsp; Concebida em 1813, a obra retrata o lendário poeta Ossian, personagem dos poemas do escoces James Macpherson, dormindo enquanto sonha com parentes, guerreiros e donzelas, que aparecem acima dele na tela.', 'https://i.imgur.com/R6gVyqn.jpg'),
(107, 22, 5, 2, 'A Fonte', 1855, '&nbsp; Pintada por volta de 1855, a obra trata-se de uma revisitação da Afrodite de Cnido ou \"Vênus pudica\".', 'https://i.imgur.com/FXkxsCM.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perguntas`
--

DROP TABLE IF EXISTS `perguntas`;
CREATE TABLE IF NOT EXISTS `perguntas` (
  `id_pergunta` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(150) NOT NULL,
  `fk_obra` int(11) DEFAULT NULL,
  `resposta_pergunta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pergunta`),
  KEY `fk_obra` (`fk_obra`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perguntas`
--

INSERT INTO `perguntas` (`id_pergunta`, `pergunta`, `fk_obra`, `resposta_pergunta`) VALUES
(1, 'Qual o nome da obra?', NULL, NULL),
(2, 'Qual o nome do artista?', NULL, NULL),
(3, 'A qual periodo essa obra pertence?', NULL, NULL),
(4, '', 6, ''),
(5, 'Na parede de qual igreja esta obra foi pintada?', 16, 'Santa Maria delle Grazie'),
(7, 'A cena presente nesta obra é descrita em uma escritura, qual seria essa?', 10, 'O Antigo Testamento'),
(8, 'Em qual mitologia a figura dessa obra é baseada?', 7, 'Romana'),
(9, 'Em quem esta obra foi baseada?', 11, 'Cecília Gallerani'),
(10, 'Quem é a figura representada nesta obra?', 18, 'Jesus Cristo'),
(12, 'Em que lugar esta obra foi pintada?', 20, 'Florença'),
(13, 'Acredita-se que esta foi a ... do seu autor ', 19, 'Obra final'),
(14, 'Em quem a figura da obra é baseada?', 17, 'É desconhecido'),
(15, 'Esta obra é conhecida por ter sido pintada enquanto o autor estava na oficina de outro artista, quem era esse?', 21, 'Andrea del Verrocchio'),
(16, 'A figura a esquerda é bastante comum nas obras do autor, qual o nome dela?', 22, 'Vênus'),
(17, 'O evento apresentado na obra é pertencente a qual religião?', 25, 'Cristianismo'),
(18, 'Quem é a figura do lado direito da obra?', 27, 'Virgem Maria'),
(19, 'Essa obra é parte de um políptico, qual seria esse?', 28, 'Retábulo de Gante'),
(20, 'Acredita-se que a obra tenha sido finalizada após a ... do autor', 29, 'Morte'),
(21, 'Em qual local a obra foi pintada?', 30, 'Capela Sistina'),
(22, 'Quem é a figura principal na obra?', 32, 'Santo Antônio'),
(23, 'As figuras que aparecem na obra são parte da ... Família', 34, 'Sagrada'),
(24, 'A torre que aparece na pintura foi construída para que a humanidade alcançasse...', 39, 'Deus'),
(25, 'A obra é a representação da famosa alegoria medieval: ', 40, 'Dança da Morte'),
(26, 'Esta obra explora a ... do ser humano', 43, 'Loucura'),
(27, 'Na época, esta obra foi...', 10, 'Controversa'),
(28, 'Esta obra foi pintada em um...', 45, 'Escudo'),
(29, 'O personagem presente na obra é conhecido por ter morrido de ...', 46, 'Paixão'),
(30, 'A figura na obra é o deus do ...', 48, 'Vinho'),
(31, 'Em 2022 essa obra sofreu um...', 58, 'Ataque'),
(32, 'Acredita-se que a figura da obra é um ... do autor', 59, 'Autorretrato'),
(33, 'Existe uma figura escondida na obra, quem seria?', 61, 'Cupido'),
(34, 'Qual é a cidade presente na obra?', 62, 'Delft'),
(35, 'De que lugar os guardas presentes na obra são?', 64, 'Holanda'),
(36, 'Atualmente essa obra se encontra ...', 65, 'Perdida'),
(37, 'A figura principal da obra está realizando uma aula de ...', 66, 'Anatomia'),
(38, 'A obra retrata o evento onde o filho voltou arrasado para o pai após perder seu...', 67, 'Dinheiro'),
(39, 'Na mitologia grega, a personagem da obra é mãe de quem?', 68, 'Perseus'),
(40, 'O cabelo do personagem da obra é a fonte de que?', 69, 'Força'),
(41, 'Quem são as figuras da obra?', 72, 'Graças'),
(42, 'A figura principal da obra é uma famosa rainha, quem é ela?', 73, 'Maria de Médici'),
(43, 'Quem foi o assassino que originou a cena desta pintura?', 97, 'Charlotte Corday'),
(44, 'Um dos temas principais que esta pintura aborda é… ', 100, 'Sacrifício Pessoal'),
(45, 'Diferente da realidade, esta pintura traz uma cena…', 98, 'Idealizada'),
(46, 'Com base no registro de quem esta cena foi representada?', 99, 'Platão'),
(47, 'Quem escreveu o poema, do qual uma das cenas é apresentada na pintura?', 106, 'James Macpherson'),
(48, 'Esta pintura se trata de uma revisitação de qual obra?', 107, 'Afrodite de Cnido'),
(49, 'Esta pintura representa uma cena de qual obra?', 101, 'A Divina Comédia'),
(50, 'Qual divindade grega é representada na obra?', 103, 'Eos'),
(51, 'Nesta cena, Orestes foi persuadido pelas…', 105, 'Erínias'),
(52, 'A figura histórica representada nesta obra trata-se de…', 91, 'Isaac Newton'),
(53, 'Qual personagem do artista é representado na obra?', 92, 'Urizen'),
(54, 'A cena apresentada passa-se nos mares da…', 77, 'Ilha de Wight'),
(55, 'O personagem bíblico que faz parte da história representada na obra é…', 78, 'Moisés'),
(56, 'A divindade romana apresentada na obra é semelhante na mitologia grega à…', 85, 'Cronos'),
(57, 'Nesta pintura, o Grande Bode representa o…', 89, 'Demônio'),
(58, 'A cena representada na obra, trata-se de um…', 83, 'Naufrágio'),
(59, 'O tema principal desta pintura é…', 84, 'Insignificância do homem');

-- --------------------------------------------------------

--
-- Estrutura da tabela `periodos`
--

DROP TABLE IF EXISTS `periodos`;
CREATE TABLE IF NOT EXISTS `periodos` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `nome_periodo` varchar(50) NOT NULL,
  `imagem_periodo` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `periodos`
--

INSERT INTO `periodos` (`id_periodo`, `nome_periodo`, `imagem_periodo`) VALUES
(1, 'Renascimento', 'https://i.imgur.com/dg690wJ.png'),
(2, 'Barroco', 'https://i.imgur.com/UoX7wHY.png'),
(3, 'Geral', ''),
(4, 'Romantismo', 'https://i.imgur.com/V87eQTF.png'),
(5, 'Neoclassicismo', 'https://i.imgur.com/mt82qTz.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pontuacoes`
--

DROP TABLE IF EXISTS `pontuacoes`;
CREATE TABLE IF NOT EXISTS `pontuacoes` (
  `id_pontuacao` int(11) NOT NULL AUTO_INCREMENT,
  `fk_usuario` int(11) NOT NULL,
  `fk_periodo` int(11) NOT NULL,
  `pontuacao` int(11) NOT NULL,
  `fase_pontuacao` int(11) NOT NULL,
  PRIMARY KEY (`id_pontuacao`),
  KEY `fk_periodo` (`fk_periodo`),
  KEY `fk_usuario` (`fk_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pontuacoes`
--

INSERT INTO `pontuacoes` (`id_pontuacao`, `fk_usuario`, `fk_periodo`, `pontuacao`, `fase_pontuacao`) VALUES
(154, 38, 1, 11, 1),
(155, 38, 1, 0, 2),
(156, 38, 1, 0, 3),
(157, 38, 2, 0, 1),
(158, 38, 2, 0, 2),
(159, 38, 2, 0, 3),
(160, 38, 4, 0, 1),
(161, 38, 4, 0, 2),
(162, 38, 4, 0, 3),
(163, 38, 5, 0, 1),
(164, 38, 5, 0, 2),
(165, 38, 5, 0, 3),
(166, 38, 3, 5, 1),
(167, 39, 1, 0, 1),
(168, 39, 1, 0, 2),
(169, 39, 1, 0, 3),
(170, 39, 2, 0, 1),
(171, 39, 2, 0, 2),
(172, 39, 2, 0, 3),
(173, 39, 4, 0, 1),
(174, 39, 4, 0, 2),
(175, 39, 4, 0, 3),
(176, 39, 5, 0, 1),
(177, 39, 5, 0, 2),
(178, 39, 5, 0, 3),
(179, 39, 3, 4, 1),
(180, 40, 1, 0, 1),
(181, 40, 1, 0, 2),
(182, 40, 1, 0, 3),
(183, 40, 2, 0, 1),
(184, 40, 2, 0, 2),
(185, 40, 2, 0, 3),
(186, 40, 4, 0, 1),
(187, 40, 4, 0, 2),
(188, 40, 4, 0, 3),
(189, 40, 5, 0, 1),
(190, 40, 5, 0, 2),
(191, 40, 5, 0, 3),
(192, 40, 3, 2, 1),
(193, 41, 1, 0, 1),
(194, 41, 1, 0, 2),
(195, 41, 1, 0, 3),
(196, 41, 2, 0, 1),
(197, 41, 2, 0, 2),
(198, 41, 2, 0, 3),
(199, 41, 4, 0, 1),
(200, 41, 4, 0, 2),
(201, 41, 4, 0, 3),
(202, 41, 5, 0, 1),
(203, 41, 5, 0, 2),
(204, 41, 5, 0, 3),
(205, 41, 3, 3, 1),
(206, 42, 1, 0, 1),
(207, 42, 1, 0, 2),
(208, 42, 1, 0, 3),
(209, 42, 2, 0, 1),
(210, 42, 2, 0, 2),
(211, 42, 2, 0, 3),
(212, 42, 4, 0, 1),
(213, 42, 4, 0, 2),
(214, 42, 4, 0, 3),
(215, 42, 5, 0, 1),
(216, 42, 5, 0, 2),
(217, 42, 5, 0, 3),
(218, 42, 3, 1, 1),
(219, 43, 1, 0, 1),
(220, 43, 1, 0, 2),
(221, 43, 1, 0, 3),
(222, 43, 2, 0, 1),
(223, 43, 2, 0, 2),
(224, 43, 2, 0, 3),
(225, 43, 4, 0, 1),
(226, 43, 4, 0, 2),
(227, 43, 4, 0, 3),
(228, 43, 5, 0, 1),
(229, 43, 5, 0, 2),
(230, 43, 5, 0, 3),
(231, 43, 3, 3, 1),
(232, 44, 1, 0, 1),
(233, 44, 1, 0, 2),
(234, 44, 1, 0, 3),
(235, 44, 2, 0, 1),
(236, 44, 2, 0, 2),
(237, 44, 2, 0, 3),
(238, 44, 4, 0, 1),
(239, 44, 4, 0, 2),
(240, 44, 4, 0, 3),
(241, 44, 5, 0, 1),
(242, 44, 5, 0, 2),
(243, 44, 5, 0, 3),
(244, 44, 3, 4, 1),
(245, 45, 1, 0, 1),
(246, 45, 1, 0, 2),
(247, 45, 1, 0, 3),
(248, 45, 2, 0, 1),
(249, 45, 2, 0, 2),
(250, 45, 2, 0, 3),
(251, 45, 4, 0, 1),
(252, 45, 4, 0, 2),
(253, 45, 4, 0, 3),
(254, 45, 5, 0, 1),
(255, 45, 5, 0, 2),
(256, 45, 5, 0, 3),
(257, 45, 3, 1, 1),
(258, 46, 1, 0, 1),
(259, 46, 1, 0, 2),
(260, 46, 1, 0, 3),
(261, 46, 2, 0, 1),
(262, 46, 2, 0, 2),
(263, 46, 2, 0, 3),
(264, 46, 4, 0, 1),
(265, 46, 4, 0, 2),
(266, 46, 4, 0, 3),
(267, 46, 5, 0, 1),
(268, 46, 5, 0, 2),
(269, 46, 5, 0, 3),
(270, 46, 3, 2, 1),
(271, 47, 1, 0, 1),
(272, 47, 1, 0, 2),
(273, 47, 1, 0, 3),
(274, 47, 2, 0, 1),
(275, 47, 2, 0, 2),
(276, 47, 2, 0, 3),
(277, 47, 4, 0, 1),
(278, 47, 4, 0, 2),
(279, 47, 4, 0, 3),
(280, 47, 5, 0, 1),
(281, 47, 5, 0, 2),
(282, 47, 5, 0, 3),
(283, 47, 3, 0, 1),
(284, 48, 1, 20, 1),
(285, 48, 1, 16, 2),
(286, 48, 1, 0, 3),
(287, 48, 2, 0, 1),
(288, 48, 2, 0, 2),
(289, 48, 2, 0, 3),
(290, 48, 4, 14, 1),
(291, 48, 4, 10, 2),
(292, 48, 4, 0, 3),
(293, 48, 5, 24, 1),
(294, 48, 5, 12, 2),
(295, 48, 5, 23, 3),
(296, 48, 3, 0, 1),
(310, 50, 1, 0, 1),
(311, 50, 1, 0, 2),
(312, 50, 1, 0, 3),
(313, 50, 2, 0, 1),
(314, 50, 2, 0, 2),
(315, 50, 2, 0, 3),
(316, 50, 4, 0, 1),
(317, 50, 4, 0, 2),
(318, 50, 4, 0, 3),
(319, 50, 5, 0, 1),
(320, 50, 5, 0, 2),
(321, 50, 5, 0, 3),
(322, 50, 3, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(15) NOT NULL,
  `senha_usuario` varchar(100) NOT NULL,
  `email_usuario` varchar(30) DEFAULT NULL,
  `tipo_usuario` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome_usuario`, `senha_usuario`, `email_usuario`, `tipo_usuario`) VALUES
(38, 'viniciusr123', '4e1c9f50d80fd50cf2256286325e39cd', 'viniciusrosario@memo.com', 1),
(39, 'yuriellwanger', 'e602a3f35f680b48b5d3c0e84deeddc6', 'teste@outlook.com', 1),
(40, 'eduardo2002', 'e602a3f35f680b48b5d3c0e84deeddc6', 'teste2@outlook.com', 1),
(41, 'ana_maria12', 'e602a3f35f680b48b5d3c0e84deeddc6', 'teste3@outlook.com', 1),
(42, 'augusto7', 'e602a3f35f680b48b5d3c0e84deeddc6', 'teste4@outlook.com', 1),
(43, 'gabriel_k', 'e602a3f35f680b48b5d3c0e84deeddc6', 'teste5@outlook.com', 1),
(44, 'jose_felipe', 'e602a3f35f680b48b5d3c0e84deeddc6', 'teste6@outlook.com', 1),
(45, 'gustavo_souza', 'e602a3f35f680b48b5d3c0e84deeddc6', 'teste7@outlook.com', 1),
(46, 'michelly_2003', 'e602a3f35f680b48b5d3c0e84deeddc6', 'teste8@outlook.com', 1),
(47, 'david_23', 'e602a3f35f680b48b5d3c0e84deeddc6', 'teste9@outlook.com', 1),
(48, 'yuri_ellw', '75f6dc5f8df97fe0412fddde2c779d8c', 'yuriellwanger03@gmail.com', 1),
(50, 'artcade_adm', 'b6ced43e9ac8e1f811ca002ea894f499', NULL, 2);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `artistas`
--
ALTER TABLE `artistas`
  ADD CONSTRAINT `artistas_ibfk_1` FOREIGN KEY (`fk_periodo`) REFERENCES `periodos` (`id_periodo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `obras`
--
ALTER TABLE `obras`
  ADD CONSTRAINT `obras_ibfk_1` FOREIGN KEY (`fk_artista`) REFERENCES `artistas` (`id_artista`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `obras_ibfk_2` FOREIGN KEY (`fk_periodo`) REFERENCES `periodos` (`id_periodo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `perguntas`
--
ALTER TABLE `perguntas`
  ADD CONSTRAINT `perguntas_ibfk_1` FOREIGN KEY (`fk_obra`) REFERENCES `obras` (`id_obra`);

--
-- Limitadores para a tabela `pontuacoes`
--
ALTER TABLE `pontuacoes`
  ADD CONSTRAINT `pontuacoes_ibfk_1` FOREIGN KEY (`fk_periodo`) REFERENCES `periodos` (`id_periodo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pontuacoes_ibfk_2` FOREIGN KEY (`fk_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
