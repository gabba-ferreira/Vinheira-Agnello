package br.com.vinheira.agnello.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Utilitário de conexão com banco de dados.
 *
 * -------------------------------------------------------
 * CONFIGURAÇÃO PARA AWS RDS (MySQL)
 * -------------------------------------------------------
 * 1. No console da AWS, crie um RDS MySQL (ou Aurora MySQL).
 * 2. Em "Connectivity", libere o Security Group para a porta 3306
 *    a partir do IP da sua aplicação (ou 0.0.0.0/0 apenas para testes).
 * 3. Substitua as constantes abaixo:
 *
 *    DB_HOST  -> endpoint do RDS  (ex: minha-db.abc123.us-east-1.rds.amazonaws.com)
 *    DB_PORT  -> 3306 (padrão MySQL)
 *    DB_NAME  -> nome do schema criado no RDS
 *    DB_USER  -> usuário master (ou específico da aplicação)
 *    DB_PASS  -> senha correspondente
 *
 * 4. Adicione o mysql-connector-j-x.x.x.jar em WebContent/WEB-INF/lib/
 * -------------------------------------------------------
 */
public class DBConnection {

    // ---- Altere estas constantes com os dados do seu RDS ----
    private static final String DB_HOST = "SEU_ENDPOINT_RDS.rds.amazonaws.com";
    private static final String DB_PORT = "3306";
    private static final String DB_NAME = "vinheria_agnello";
    private static final String DB_USER = "admin";
    private static final String DB_PASS = "SUA_SENHA_AQUI";
    // ----------------------------------------------------------

    private static final String JDBC_URL =
            "jdbc:mysql://" + DB_HOST + ":" + DB_PORT + "/" + DB_NAME
            + "?useSSL=true"
            + "&requireSSL=true"
            + "&serverTimezone=America/Sao_Paulo"
            + "&characterEncoding=UTF-8";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("[DBConnection] Driver MySQL não encontrado. Adicione mysql-connector-j ao WEB-INF/lib.");
        }
    }

    /**
     * Retorna uma nova conexão com o banco de dados.
     * Use sempre em try-with-resources para garantir o fechamento.
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
    }
}
