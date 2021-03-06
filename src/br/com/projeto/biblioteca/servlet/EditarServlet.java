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

@WebServlet(urlPatterns = { "/Update" })
public class EditarServlet extends HttpServlet {

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
			String bibliotecaId = request.getParameter("bibliotecaId");
			String livroId = request.getParameter("livroId");

			if (nomeBiblioteca != null) {
				Biblioteca biblioteca = new Biblioteca();
				biblioteca.setNome(nomeBiblioteca);
				biblioteca.setId(new Integer(bibliotecaId));

				new BibliotecaDAO().editarBiblioteca(biblioteca);

			} else {
				Livro livro = new Livro();
				livro.setArea(area);
				livro.setEdicao(edicao);
				livro.setEditora(editora);
				livro.setNome(nomeLivro);
				livro.setId(new Integer(livroId));

				new LivroDAO().editarLivro(livro);
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
