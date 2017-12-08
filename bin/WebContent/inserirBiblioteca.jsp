<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Adicionar Biblioteca</title>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="resource/css/materialize.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<link href="resource/css/style.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
</head>
<body>
	<nav class="light-blue lighten-1" role="navigation">
		<div class="nav-wrapper container">
			<a id="logo-container" href="/Biblioteca/index.jsp"
				class="brand-logo">Home</a>
		</div>
	</nav>
	
	<div id="index-banner">
		<div class="container">
			<h2 class="header center orange-text">Cadastro de Biblioteca</h2>
		</div>
	</div>
	
	<form action="Inserir" method="post">
		<div class="center" class="row">
			<div class="input-field col s12">
				<input type="text"
						name="nomeBiblioteca"
						placeholder="Dê um nome a sua nova biblioteca."
						value="<c:out value='${book.title}' />" />
				
				<input class="waves-effect waves-light btn-large orange" 
				type="submit"
						value="Salvar" />
				
				<a class="waves-effect waves-light btn-large" href="/Biblioteca/listaDeBibliotecas.jsp">Cancelar</a>
			</div>
		</div>
	</form>
	
	<!--  Scripts-->
	<script src="resource/js/materialize.js"></script>
	<script src="resource/js/init.js"></script>
</body>
</html>