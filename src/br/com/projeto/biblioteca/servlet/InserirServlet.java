package br.com.projeto.biblioteca.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projeto.biblioteca.dao.BibliotecaDAO;
import br.com.projeto.biblioteca.dao.LivroDAO;
import br.com.projeto.biblioteca.model.Biblioteca;
import br.com.projeto.biblioteca.model.Livro;

@WebServlet(urlPatterns = { "/Inserir" })
public class InserirServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String nomeBiblioteca = request.getParameter("nomeBiblioteca");
			String nomeLivro = request.getParameter("nomeLivro");
			String editora = request.getParameter("editora");
			String edicao = request.getParameter("edicao");
			String area = request.getParameter("area");

			if (nomeBiblioteca != null) {
				Biblioteca biblioteca = new Biblioteca();
				biblioteca.setNome(nomeBiblioteca);

				new BibliotecaDAO().inserir(biblioteca);
			} else {
				Livro livro = new Livro();
				livro.setArea(area);
				livro.setEdicao(edicao);
				livro.setEditora(editora);
				livro.setNome(nomeLivro);

				new LivroDAO().inserirLivro(livro);
			}

			if (nomeBiblioteca != null) {
				response.sendRedirect("/Biblioteca/listaDeBibliotecas.jsp");
			} else {
				response.sendRedirect("/Biblioteca/listaDeLivros.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/Biblioteca/mensagemDeErro.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}
}
