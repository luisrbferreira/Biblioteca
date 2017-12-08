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
<title>Livros Por Editora</title>

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
			<h2 class="header center orange-text">Livros Cadastrados Por Editora</h2>
		</div>
	</div>

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
			Object listarLivroPorEditora = session.getAttribute("listarLivroPorEditora");
			ArrayList<Livro> listaLivros = new LivroController().listarLivroPorEditora(listarLivroPorEditora.toString());
			for (Livro listar : listaLivros) {
				System.out.println(listarLivroPorEditora);
		%>
		<tbody>
			<tr>
				<td><%=listar.getNome()%></td>
				<td><%=listar.getEditora()%></td>
				<td><%=listar.getEdicao()%></td>
				<td><%=listar.getArea()%></td>
				<%
					request.setAttribute("listar", listar);
				%>
				
				<td>
					<a href="/Biblioteca/EdicaoDeLivro?id=${listar.getId()}"><i class="material-icons">edit</i></a>
				</td>
				
				<td>
					<a href="/Biblioteca/DeletarLivro?id=${listar.getId()}"><i class="material-icons">delete</i></a>
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	
	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="resource/js/materialize.js"></script>
	<script src="resource/js/init.js"></script>
</body>
</html>

