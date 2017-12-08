<%@page import="br.com.projeto.biblioteca.controller.LivroController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.projeto.biblioteca.dao.LivroDAO"%>
<%@page import="br.com.projeto.biblioteca.model.Livro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Lista de Livros</title>

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
			<h2 class="header center orange-text">Livros Cadastrados</h2>
			<h5 class="header center col s12 light">Você pode editar, excluir e
				adicionar novos livros.</h5>
		</div>
	</div>
	
	<form style="margin-top: 25px;" action="ListarLivroPorEditora" class="col s12">
		<div class="row">
			<div class="input-field col s6">
				<i class="material-icons prefix">search</i> 
				<input type="text" name="listarLivroPorEditora"
				placeholder="Buscar livros por editora" class="validate"> 
				<label>Editora</label>
			</div>
		</div>
	</form>
	
	<table class="bordered">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Editora</th>
				<th>Edição</th>
				<th>Área</th>
			</tr>
		</thead>
		<%
			ArrayList<Livro> listaLivros = new LivroController().listarTodosLivros();
			for (Livro livro : listaLivros) {
		%>
		<tbody>
			<tr>
				<td><%=livro.getNome()%></td>
				<td><%=livro.getEditora()%></td>
				<td><%=livro.getEdicao()%></td>
				<td><%=livro.getArea()%></td>
				
				<%
					request.setAttribute("livro", livro);
				%>
				
				<td>
					<a href="/Biblioteca/EdicaoDeLivro?id=${livro.getId()}"><i class="material-icons">edit</i></a>
				</td>
				
				<td>
					<a href="/Biblioteca/ExclusaoDeLivro?id=${livro.getId()}"><i class="material-icons">delete</i></a>
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	
	<div style="margin-top:25px;" class="center">
		<a class="waves-effect waves-light btn-large orange" href="/Biblioteca/inserirLivro.jsp"><i class="material-icons right">add</i>Adicionar</a>
	</div>

	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="resource/js/materialize.js"></script>
	<script src="resource/js/init.js"></script>
</body>
</html>

