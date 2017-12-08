package br.com.projeto.biblioteca.controller;

import java.util.ArrayList;

import br.com.projeto.biblioteca.dao.LivroDAO;
import br.com.projeto.biblioteca.model.Livro;

public class LivroController {
	private LivroDAO livroDAO = new LivroDAO();

	public void inserirLivro(Livro livro) {
		livroDAO.inserirLivro(livro);
	}

	public ArrayList<Livro> listarTodosLivros() {
		return livroDAO.consultarTodos();
	}

	public void editarLivro(Livro livro) {
		livroDAO.editarLivro(livro);

	}

	public void excluirLivro(Livro livro) {
		livroDAO.excluirLivro(livro.getId());
	}

	public Livro consultar(int id) {
		return livroDAO.consultar(id);
	}

	public ArrayList<Livro> listarLivroPorEditora(String editora) {
		return livroDAO.consultar(editora);
	}
}