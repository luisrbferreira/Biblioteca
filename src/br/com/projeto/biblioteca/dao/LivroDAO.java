package br.com.projeto.biblioteca.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import br.com.projeto.biblioteca.model.Livro;
import br.com.projeto.biblioteca.util.ConnectionFactory;

public class LivroDAO {

	private Connection con;
	private Statement comando;

	private static final String INSERIR_LIVRO = " INSERT INTO livro (nome, editora, edicao, area) VALUES (?, ?, ?, ?);";

	private static final String CONSULTAR_TODOS = "SELECT * FROM LIVRO";

	private static final String CONSULTAR_POR_ID = "SELECT * FROM LIVRO where id = ?";

	private static final String EXCLUIR_LIVRO = "DELETE FROM LIVRO where id = ?";

	private static final String EDITAR_LIVRO = "UPDATE LIVRO SET nome = ?, editora = ?, edicao = ?, area = ? WHERE livro.id = ?";

	private static final String CONSULTAR_LIVRO_POR_EDITORA = "SELECT * FROM LIVRO where editora like ? ";

	public Livro consultar(int id) {

		con = ConnectionFactory.getConnection();

		ArrayList<Livro> livros = new ArrayList<Livro>();

		try {

			con.prepareStatement(CONSULTAR_POR_ID);
			java.sql.PreparedStatement preparedStmt = con.prepareStatement(CONSULTAR_POR_ID);

			preparedStmt.setInt(1, id);

			ResultSet resultado = preparedStmt.executeQuery();
			while (resultado.next()) {
				livros.add(new Livro(resultado.getInt("id"), resultado.getString("nome"),
						resultado.getString("editora"), resultado.getString("edicao"), resultado.getString("area")));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return livros.get(0);
	}

	public ArrayList<Livro> consultar(String editora) {

		con = ConnectionFactory.getConnection();

		ArrayList<Livro> livros = new ArrayList<Livro>();

		try {

			con.prepareStatement(CONSULTAR_LIVRO_POR_EDITORA);
			java.sql.PreparedStatement preparedStmt = con.prepareStatement(CONSULTAR_LIVRO_POR_EDITORA);

			preparedStmt.setString(1, editora + "%");

			ResultSet resultado = preparedStmt.executeQuery();
			while (resultado.next()) {
				livros.add(new Livro(resultado.getInt("id"), resultado.getString("nome"),
						resultado.getString("editora"), resultado.getString("edicao"), resultado.getString("area")));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return livros;
	}

	public void inserirLivro(Livro livro) {

		con = ConnectionFactory.getConnection();

		try {

			con.prepareStatement(INSERIR_LIVRO);
			java.sql.PreparedStatement preparedStmt = con.prepareStatement(INSERIR_LIVRO);

			preparedStmt.setString(1, livro.getNome());
			preparedStmt.setString(2, livro.getEditora());
			preparedStmt.setString(3, livro.getEdicao());
			preparedStmt.setString(4, livro.getArea());

			preparedStmt.execute();

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Livro> consultarTodos() {

		con = ConnectionFactory.getConnection();

		ArrayList<Livro> livros = new ArrayList<Livro>();

		try {

			comando = con.createStatement();

			ResultSet resultado = comando.executeQuery(CONSULTAR_TODOS);

			while (resultado.next()) {
				livros.add(new Livro(resultado.getInt("id"), resultado.getString("nome"),
						resultado.getString("editora"), resultado.getString("edicao"), resultado.getString("area")));
			}
			comando.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return livros;
	}

	public void excluirLivro(int id) {

		con = ConnectionFactory.getConnection();

		try {

			con.prepareStatement(EXCLUIR_LIVRO);
			java.sql.PreparedStatement preparedStmt = con.prepareStatement(EXCLUIR_LIVRO);

			preparedStmt.setInt(1, id);

			preparedStmt.execute();

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editarLivro(Livro livro) {

		con = ConnectionFactory.getConnection();

		try {

			con.prepareStatement(EDITAR_LIVRO);
			java.sql.PreparedStatement preparedStmt = con.prepareStatement(EDITAR_LIVRO);
			preparedStmt.setString(1, livro.getNome());
			preparedStmt.setString(2, livro.getEditora());
			preparedStmt.setString(3, livro.getEdicao());
			preparedStmt.setString(4, livro.getArea());
			preparedStmt.setInt(5, livro.getId());
			preparedStmt.executeUpdate();

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}