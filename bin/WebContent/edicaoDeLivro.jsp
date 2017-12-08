<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.com.projeto.biblioteca.controller.LivroController"%>
<%@page import="br.com.projeto.biblioteca.controller.BibliotecaController"%>
<%@page import="br.com.projeto.biblioteca.model.Livro"%>
<%@page import="br.com.projeto.biblioteca.model.Biblioteca"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Editar Livro</title>

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
			<h4 class="header center orange-text">Atualize as informações do seu livro.</h4>
		</div>
	</div>
	
	<form action="Update" method="post">
	
		<div class="center" class="row">
			<%
				Object idLivroEditar = session.getAttribute("idLivroEditar");
				Livro livro = new LivroController().consultar(new Integer(idLivroEditar.toString()));
			%>

			<%
				request.setAttribute("livro", livro);
			%>

			<c:if test="${livro != null}">
				<input type="hidden" name="livroId"
					value="<c:out value='${livro.getId()}' />" />
			</c:if>
			
			<div class="input-field col s12">
				<input type="text" name="nomeLivro"
				value="<c:out value='${livro.getNome()}' />" />
				
				<input type="text" name="editora"
				value="<c:out value='${livro.getEditora()}' />" />
				
				<input type="text" name="edicao"
				value="<c:out value='${livro.getEdicao()}' />" />
				
				<input type="text" name="area"
				value="<c:out value='${livro.getArea()}' />" />
				
				
			</div>
			<input class="waves-effect waves-light btn-large orange"
				type="submit" value="Salvar" />
				
				<a class="waves-effect waves-light btn-large" href="/Biblioteca/listaDeLivros.jsp">Cancelar</a>
		</div>
	</form>
	
	<!--  Scripts-->
	<script src="resource/js/materialize.js"></script>
	<script src="resource/js/init.js"></script>
</body>
</html>



