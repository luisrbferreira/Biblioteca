<%@page
	import="br.com.projeto.biblioteca.controller.BibliotecaController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.projeto.biblioteca.dao.BibliotecaDAO"%>
<%@page import="br.com.projeto.biblioteca.model.Biblioteca"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Lista de Bibliotecas</title>

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
			<a id="logo-container" href="/Biblioteca/index.jsp"
				class="brand-logo">Home</a>
		</div>
	</nav>
	
	<div id="index-banner">
		<div class="container">
			<h2 class="header center orange-text">Bibliotecas Cadastradas</h2>
			<h5 class="header center col s12 light">Você pode editar, excluir e
				adicionar novas bibliotecas.</h5>
		</div>
	</div>

	<table class="bordered">
		<thead>
			<tr>
				<th>Nome</th>
			</tr>
		</thead>
		<%
			ArrayList<Biblioteca> listaBibliotecas = new BibliotecaController().listarTodasBibliotecas();
			for (Biblioteca biblioteca : listaBibliotecas) {
		%>
		<tbody>
			<tr>
				<td><%=biblioteca.getNome()%></td>

				<%
					request.setAttribute("biblioteca", biblioteca);
				%>

				<td>
					<a href="http://localhost:8080/Biblioteca/EdicaoDeBiblioteca?id=${biblioteca.getId()}&nome=${biblioteca.getNome()}" ><i class="material-icons">edit</i></a>
				</td>
				
				<td>
					<a href="http://localhost:8080/Biblioteca/ExclusaoDeBiblioteca?id=${biblioteca.getId()}"><i class="material-icons">delete</i></a>
				</td>
				
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	
	<div style="margin-top:25px;" class="center">
		<a class="waves-effect waves-light btn-large orange" href="/Biblioteca/inserirBiblioteca.jsp"><i class="material-icons right">add</i>Adicionar</a>
	</div>

	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="resource/js/materialize.js"></script>
	<script src="resource/js/init.js"></script>
</body>
</html>