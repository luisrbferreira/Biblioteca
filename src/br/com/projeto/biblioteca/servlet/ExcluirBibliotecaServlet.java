package br.com.projeto.biblioteca.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projeto.biblioteca.dao.BibliotecaDAO;

@WebServlet(urlPatterns = { "/ExclusaoDeBiblioteca" })
public class ExcluirBibliotecaServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("id");

			new BibliotecaDAO().excluirBiblioteca(new Integer(id));

			response.sendRedirect("/Biblioteca/listaDeBibliotecas.jsp");

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
