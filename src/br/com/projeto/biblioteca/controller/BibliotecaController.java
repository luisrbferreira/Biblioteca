package br.com.projeto.biblioteca.controller;

import java.util.ArrayList;

import br.com.projeto.biblioteca.dao.BibliotecaDAO;
import br.com.projeto.biblioteca.model.Biblioteca;

public class BibliotecaController {

	private BibliotecaDAO bibliotecaDAO = new BibliotecaDAO();

	public void inserirBiblioteca(Biblioteca biblioteca) {
		bibliotecaDAO.inserir(biblioteca);
	}

	public void editarBiblioteca(Biblioteca biblioteca) {
		bibliotecaDAO.editarBiblioteca(biblioteca);

	}

	public void excluirBiblioteca(Biblioteca biblioteca) {
		bibliotecaDAO.excluirBiblioteca(biblioteca.getId());
	}

	public ArrayList<Biblioteca> listarTodasBibliotecas() {
		return bibliotecaDAO.consultar();
	}

	public Biblioteca listarBibliotecaPorId(Biblioteca biblioteca) {
		return bibliotecaDAO.consultar(biblioteca.getId());
	}
}
