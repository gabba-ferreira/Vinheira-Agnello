package br.com.vinheira.agnello.servlet;

import br.com.vinheira.agnello.model.Carrinho;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class PagamentoServlet extends HttpServlet {

    /** GET: exibe o formulário de pagamento */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Carrinho carrinho = session != null ? (Carrinho) session.getAttribute("carrinho") : null;

        if (carrinho == null || carrinho.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/carrinho");
            return;
        }

        req.getRequestDispatcher("/pagamento.jsp").forward(req, resp);
    }

    /** POST: processa o pagamento (mock) */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession(false);
        Carrinho carrinho = session != null ? (Carrinho) session.getAttribute("carrinho") : null;

        if (carrinho == null || carrinho.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/carrinho");
            return;
        }

        // Validação básica dos campos
        String nome       = req.getParameter("nomeCartao");
        String numero     = req.getParameter("numeroCartao");
        String validade   = req.getParameter("validade");
        String cvv        = req.getParameter("cvv");

        if (nome == null || nome.isBlank() ||
            numero == null || numero.replaceAll("\\s", "").length() < 16 ||
            validade == null || validade.isBlank() ||
            cvv == null || cvv.length() < 3) {

            req.setAttribute("erro", "Preencha todos os dados do cartão corretamente.");
            req.getRequestDispatcher("/pagamento.jsp").forward(req, resp);
            return;
        }

        // Gera número de pedido mock
        String numeroPedido = "AG" + System.currentTimeMillis() % 100000;
        String totalPago    = carrinho.getTotalFormatado();

        // Limpa o carrinho após pagamento
        session.removeAttribute("carrinho");

        // Passa dados para a confirmação
        req.setAttribute("numeroPedido", numeroPedido);
        req.setAttribute("totalPago", totalPago);
        req.setAttribute("nomeCliente", nome);
        req.getRequestDispatcher("/confirmacao.jsp").forward(req, resp);
    }
}
