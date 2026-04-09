package br.com.vinheira.agnello.servlet;

import br.com.vinheira.agnello.model.Carrinho;
import br.com.vinheira.agnello.model.ItemCarrinho;
import br.com.vinheira.agnello.model.Vinho;
import br.com.vinheira.agnello.util.CatalogoUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class CarrinhoServlet extends HttpServlet {

    /** GET: exibe o carrinho */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/carrinho.jsp").forward(req, resp);
    }

    /** POST: adicionar / remover / atualizar quantidade */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
        if (carrinho == null) {
            carrinho = new Carrinho();
            session.setAttribute("carrinho", carrinho);
        }

        String acao = req.getParameter("acao");

        if ("adicionar".equals(acao)) {
            int id = Integer.parseInt(req.getParameter("vinhoId"));
            Vinho vinho = CatalogoUtil.getPorId(id);
            if (vinho != null) {
                carrinho.adicionar(new ItemCarrinho(
                        vinho.getId(), vinho.getNome(),
                        vinho.getRegiao(), vinho.getPreco()));
            }
            // Volta para o catálogo após adicionar
            resp.sendRedirect(req.getContextPath() + "/catalogo?adicionado=" + id);
            return;

        } else if ("remover".equals(acao)) {
            int id = Integer.parseInt(req.getParameter("vinhoId"));
            carrinho.remover(id);

        } else if ("atualizar".equals(acao)) {
            int id  = Integer.parseInt(req.getParameter("vinhoId"));
            int qty = Integer.parseInt(req.getParameter("quantidade"));
            carrinho.atualizarQuantidade(id, qty);
        }

        resp.sendRedirect(req.getContextPath() + "/carrinho");
    }
}
