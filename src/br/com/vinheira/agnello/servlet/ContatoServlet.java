package br.com.vinheira.agnello.servlet;

import br.com.vinheira.agnello.dao.ContatoDAO;
import br.com.vinheira.agnello.model.Contato;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public class ContatoServlet extends HttpServlet {

    private final ContatoDAO contatoDAO = new ContatoDAO();

    /** GET: exibe o formulário */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/contato.jsp").forward(req, resp);
    }

    /** POST: processa o formulário */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String nome     = req.getParameter("nome");
        String email    = req.getParameter("email");
        String assunto  = req.getParameter("assunto");
        String mensagem = req.getParameter("mensagem");

        // Validação básica
        if (nome == null || nome.isBlank() ||
            email == null || email.isBlank() ||
            mensagem == null || mensagem.isBlank()) {

            req.setAttribute("erro", "Por favor, preencha todos os campos obrigatórios.");
            req.getRequestDispatcher("/contato.jsp").forward(req, resp);
            return;
        }

        Contato contato = new Contato(nome.trim(), email.trim(), assunto, mensagem.trim());

        try {
            contatoDAO.salvar(contato);
            req.setAttribute("sucesso", true);
        } catch (SQLException e) {
            getServletContext().log("Erro ao salvar contato: " + e.getMessage());
            req.setAttribute("erro", "Ocorreu um erro ao enviar sua mensagem. Tente novamente.");
        }

        req.getRequestDispatcher("/contato.jsp").forward(req, resp);
    }
}
