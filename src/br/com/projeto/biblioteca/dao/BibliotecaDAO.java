package br.com.projeto.biblioteca.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import br.com.projeto.biblioteca.model.Biblioteca;
import br.com.projeto.biblioteca.util.ConnectionFactory;

public class BibliotecaDAO {

	private Connection con;
	private Statement comando;

	private static final String INSERIR = "INSERT INTO BIBLIOTECA (nome) values (?)";

	private static final String CONSULTAR_TODAS = "SELECT * FROM BIBLIOTECA";

	private static final String CONSULTAR_POR_ID = "SELECT * FROM BIBLIOTECA where biblioteca.id = ?";

	private static final String EXCLUIR_BIBLIOTECA = "DELETE FROM BIBLIOTECA where biblioteca.id = ?";

	private static final String EDITAR_BIBLIOTECA = "UPDATE BIBLIOTECA SET nome = ? where biblioteca.id = ?";

	public void inserir(Biblioteca biblioteca) {

		con = ConnectionFactory.getConnection();

		try {
			con.prepareStatement(INSERIR);
			java.sql.PreparedStatement preparedStmt = con.prepareStatement(INSERIR);

			preparedStmt.setString(1, biblioteca.getNome());

			preparedStmt.execute();

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Biblioteca> consultar() {

		con = ConnectionFactory.getConnection();

		ArrayList<Biblioteca> bibliotecas = new ArrayList<Biblioteca>();

		try {
			comando = con.createStatement();

			ResultSet resultado = comando.executeQuery(CONSULTAR_TODAS);

			while (resultado.next()) {
				Biblioteca biblioteca = new Biblioteca();
				biblioteca.setId(resultado.getInt("id"));
				biblioteca.setNome(resultado.getString("nome"));
				bibliotecas.add(biblioteca);
			}

			comando.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bibliotecas;
	}

	public Biblioteca consultar(int id) {

		con = ConnectionFactory.getConnection();

		Biblioteca biblioteca = new Biblioteca();

		try {
			con.prepareStatement(CONSULTAR_POR_ID);
			java.sql.PreparedStatement preparedStmt = con.prepareStatement(CONSULTAR_POR_ID);

			preparedStmt.setInt(1, id);

			ResultSet resultado = preparedStmt.executeQuery();
			resultado.next();
			biblioteca.setId(resultado.getInt("id"));
			biblioteca.setNome(resultado.getString("nome"));

			preparedStmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return biblioteca;
	}

	public void excluirBiblioteca(int bibliotecaId) {

		con = ConnectionFactory.getConnection();

		try {
			con.prepareStatement(EXCLUIR_BIBLIOTECA);
			java.sql.PreparedStatement preparedStmt = con.prepareStatement(EXCLUIR_BIBLIOTECA);

			preparedStmt.setInt(1, bibliotecaId);

			preparedStmt.execute();

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editarBiblioteca(Biblioteca biblioteca) {

		con = ConnectionFactory.getConnection();

		try {
			con.prepareStatement(EDITAR_BIBLIOTECA);
			java.sql.PreparedStatement preparedStmt = con.prepareStatement(EDITAR_BIBLIOTECA);
			preparedStmt.setString(1, biblioteca.getNome());
			preparedStmt.setInt(2, biblioteca.getId());
			preparedStmt.executeUpdate();

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
