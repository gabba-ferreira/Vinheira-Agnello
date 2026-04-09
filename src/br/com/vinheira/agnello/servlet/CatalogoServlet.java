package br.com.vinheira.agnello.servlet;

import br.com.vinheira.agnello.dao.VinhoDAO;
import br.com.vinheira.agnello.model.Vinho;
import br.com.vinheira.agnello.util.CatalogoUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CatalogoServlet extends HttpServlet {

    private final VinhoDAO vinhoDAO = new VinhoDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String tipo = req.getParameter("tipo");
        List<Vinho> vinhos = new ArrayList<>();

        try {
            if (tipo != null && !tipo.isBlank()) {
                vinhos = vinhoDAO.listarPorTipo(tipo);
            } else {
                vinhos = vinhoDAO.listarTodos();
            }
        } catch (Exception e) {
            // DB indisponível — usa catálogo fixo
            getServletContext().log("DB indisponível, usando catálogo fixo: " + e.getMessage());
            vinhos = new ArrayList<>(CatalogoUtil.getCatalogo().values());
            if (tipo != null && !tipo.isBlank()) {
                String tipoFinal = tipo;
                vinhos.removeIf(v -> !tipoFinal.equals(v.getTipo()));
            }
        }

        req.setAttribute("vinhos", vinhos);
        req.getRequestDispatcher("/catalogo.jsp").forward(req, resp);
    }
}
