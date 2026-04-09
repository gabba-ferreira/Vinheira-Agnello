package br.com.vinheira.agnello.dao;

import br.com.vinheira.agnello.model.Contato;

import java.sql.*;

public class ContatoDAO {

    // -------------------------------------------------------
    // Script SQL (execute uma vez no RDS):
    //
    // CREATE TABLE IF NOT EXISTS contato (
    //     id         INT AUTO_INCREMENT PRIMARY KEY,
    //     nome       VARCHAR(150) NOT NULL,
    //     email      VARCHAR(150) NOT NULL,
    //     assunto    VARCHAR(100),
    //     mensagem   TEXT         NOT NULL,
    //     data_envio TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
    // );
    // -------------------------------------------------------

    public void salvar(Contato c) throws SQLException {
        String sql = "INSERT INTO contato (nome, email, assunto, mensagem) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, c.getNome());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getAssunto());
            ps.setString(4, c.getMensagem());
            ps.executeUpdate();
        }
    }
}
