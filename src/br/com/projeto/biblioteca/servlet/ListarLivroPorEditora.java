package br.com.projeto.biblioteca.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/ListarLivroPorEditora" })
public class ListarLivroPorEditora extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {						
			String listarLivroPorEditora = request.getParameter("listarLivroPorEditora");
						
			request.getSession().setAttribute("listarLivroPorEditora", listarLivroPorEditora);
			response.sendRedirect("/Biblioteca/listarLivroPorEditora.jsp");
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
