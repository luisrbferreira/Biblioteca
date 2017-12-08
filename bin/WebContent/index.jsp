<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Sistema MML</title>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="resource/css/materialize.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="resource/css/style.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
</head>
<body>
	<nav class="light-blue lighten-1" role="navigation">
		<div class="nav-wrapper container">
			<a id="logo-container" href="#" class="brand-logo">Trabalho LTP2</a>
		</div>
	</nav>

	<div class="section no-pad-bot" id="index-banner">
		<div class="container">
			<h1 class="header center orange-text">Sistema MML</h1>
			<div class="row center">
				<h5 class="header col s12 light">O que você deseja conferir?</h5>
			</div>
			<div class="row center">
				<a class="waves-effect waves-light btn-large orange" href="/Biblioteca/listaDeBibliotecas.jsp"><i class="material-icons right">local_library</i>Bibliotecas</a>
			</div>
			
			<div class="row center">
				<a class="waves-effect waves-light btn-large orange" href="/Biblioteca/listaDeLivros.jsp"><i class="material-icons right">book</i>Livros</a>
			</div>
		</div>
	</div>

	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="resource/js/materialize.js"></script>
	<script src="resource/js/init.js"></script>
</body>
</html>