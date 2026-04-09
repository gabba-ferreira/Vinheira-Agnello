package br.com.vinheira.agnello.dao;

import br.com.vinheira.agnello.model.Vinho;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VinhoDAO {

    // -------------------------------------------------------
    // Script SQL para criar a tabela no RDS (execute uma vez):
    //
    // CREATE TABLE IF NOT EXISTS vinho (
    //     id            INT AUTO_INCREMENT PRIMARY KEY,
    //     nome          VARCHAR(150)   NOT NULL,
    //     tipo          VARCHAR(50)    NOT NULL,  -- tinto | branco | rosé | espumante
    //     regiao        VARCHAR(150),
    //     descricao     TEXT,
    //     preco         DECIMAL(10,2)  NOT NULL,
    //     ano_colheita  INT,
    //     vinicola      VARCHAR(150)
    // );
    // -------------------------------------------------------

    /** Lista todos os vinhos. */
    public List<Vinho> listarTodos() throws SQLException {
        String sql = "SELECT * FROM vinho ORDER BY tipo, nome";
        List<Vinho> lista = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(mapear(rs));
            }
        }
        return lista;
    }

    /** Lista vinhos filtrados por tipo. */
    public List<Vinho> listarPorTipo(String tipo) throws SQLException {
        String sql = "SELECT * FROM vinho WHERE tipo = ? ORDER BY nome";
        List<Vinho> lista = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, tipo);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) lista.add(mapear(rs));
            }
        }
        return lista;
    }

    /** Busca um vinho pelo ID. */
    public Vinho buscarPorId(int id) throws SQLException {
        String sql = "SELECT * FROM vinho WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapear(rs);
            }
        }
        return null;
    }

    /** Insere um novo vinho. */
    public void inserir(Vinho v) throws SQLException {
        String sql = "INSERT INTO vinho (nome, tipo, regiao, descricao, preco, ano_colheita, vinicola) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, v.getNome());
            ps.setString(2, v.getTipo());
            ps.setString(3, v.getRegiao());
            ps.setString(4, v.getDescricao());
            ps.setBigDecimal(5, v.getPreco());
            ps.setInt(6, v.getAnoColheita());
            ps.setString(7, v.getVinícola());
            ps.executeUpdate();
        }
    }

    // --- Mapeamento ResultSet -> Vinho ---
    private Vinho mapear(ResultSet rs) throws SQLException {
        return new Vinho(
            rs.getInt("id"),
            rs.getString("nome"),
            rs.getString("tipo"),
            rs.getString("regiao"),
            rs.getString("descricao"),
            rs.getBigDecimal("preco"),
            rs.getInt("ano_colheita"),
            rs.getString("vinicola")
        );
    }
}
