<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="br.com.projeto.biblioteca.dao.BibliotecaDAO"%>
<%@page import="br.com.projeto.biblioteca.model.Biblioteca"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Editar Biblioteca</title>

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
			<h4 class="header center orange-text">Dê um novo nome para sua
				biblioteca.</h4>
		</div>
	</div>

	<form action="Update" method="post">
	
		<div class="center" class="row">
			<%
				Object idBibliotecaEditar = session.getAttribute("idBibliotecaEditar");
				Biblioteca biblioteca = new BibliotecaDAO().consultar(new Integer(idBibliotecaEditar.toString()));
			%>

			<%
				request.setAttribute("biblioteca", biblioteca);
			%>

			<c:if test="${biblioteca != null}">
				<input type="hidden" name="bibliotecaId"
					value="<c:out value='${biblioteca.getId()}' />" />
			</c:if>
			
			<div class="input-field col s12">
				<input type="text" name="nomeBiblioteca"
				value="<c:out value='${biblioteca.getNome()}' />" /> 
				
				<input class="waves-effect waves-light btn-large orange"
				type="submit" value="Salvar" />
				
				<a class="waves-effect waves-light btn-large" href="/Biblioteca/listaDeBibliotecas.jsp">Cancelar</a>
			</div>
		</div>
	</form>
	
	<!--  Scripts-->
	<script src="resource/js/materialize.js"></script>
	<script src="resource/js/init.js"></script>
</body>
</html>

