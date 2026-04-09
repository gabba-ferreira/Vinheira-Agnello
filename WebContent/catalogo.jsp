<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, br.com.vinheira.agnello.model.Vinho, br.com.vinheira.agnello.model.Carrinho" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo – Vinheria Agnello</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <%
        Carrinho carrinhoNav = (Carrinho) session.getAttribute("carrinho");
        int qtdCarrinho = (carrinhoNav != null) ? carrinhoNav.getQuantidadeTotal() : 0;
    %>

    <nav class="navbar">
        <div class="navbar-brand">
            <span class="logo-icon">🍷</span>
            <div>
                <span class="brand-text">Vinheria Agnello</span>
                <span class="brand-sub">desde 1987</span>
            </div>
        </div>
        <ul class="nav-links">
            <li><a href="index.jsp">Início</a></li>
            <li><a href="catalogo" class="active">Catálogo</a></li>
            <li><a href="sobre.jsp">Sobre</a></li>
            <li><a href="contato">Contato</a></li>
            <li>
                <a href="carrinho" class="carrinho-link">
                    🛒 Carrinho
                    <% if (qtdCarrinho > 0) { %>
                        <span class="carrinho-badge"><%= qtdCarrinho %></span>
                    <% } %>
                </a>
            </li>
        </ul>
    </nav>

    <div class="catalogo-hero">
        <span class="hero-badge">Nossos Vinhos</span>
        <h1 style="font-size:2.5rem; margin:.8rem 0">Catálogo Completo</h1>
        <p style="color:var(--creme-escuro); max-width:500px; margin:0 auto">
            Selecione pelo tipo ou explore toda a nossa coleção.
        </p>
    </div>

    <section style="background:var(--madeira); padding:60px 2rem;">

        <% if (request.getParameter("adicionado") != null) { %>
            <div class="alert alert-success" style="max-width:1100px; margin:0 auto 2rem;">
                Vinho adicionado ao carrinho! <a href="carrinho" style="color:var(--dourado); font-weight:700">Ver carrinho →</a>
            </div>
        <% } %>

        <div class="filtros">
            <button class="filtro-btn ativo" data-categoria="todos"      onclick="filtrarVinhos('todos')">Todos</button>
            <button class="filtro-btn"        data-categoria="tinto"     onclick="filtrarVinhos('tinto')">Tintos</button>
            <button class="filtro-btn"        data-categoria="branco"    onclick="filtrarVinhos('branco')">Brancos</button>
            <button class="filtro-btn"        data-categoria="rosé"      onclick="filtrarVinhos('rosé')">Rosés</button>
            <button class="filtro-btn"        data-categoria="espumante" onclick="filtrarVinhos('espumante')">Espumantes</button>
        </div>

        <div class="cards-grid" style="max-width:1100px; margin:0 auto;">
            <%
                List<Vinho> vinhos = (List<Vinho>) request.getAttribute("vinhos");
                if (vinhos != null && !vinhos.isEmpty()) {
                    for (Vinho v : vinhos) {
                        String icone = "espumante".equals(v.getTipo()) ? "🥂"
                                     : "branco".equals(v.getTipo())    ? "🍾"
                                     : "rosé".equals(v.getTipo())      ? "🌹" : "🍷";
            %>
                <div class="card vinho-card" data-tipo="<%= v.getTipo() %>">
                    <div class="card-img-placeholder"><%= icone %></div>
                    <div class="card-body">
                        <h3><%= v.getNome() %></h3>
                        <p><%= v.getDescricao() %></p>
                        <span class="preco">R$ <%= v.getPrecoFormatado() %></span>
                    </div>
                    <div class="card-footer" style="display:flex; justify-content:space-between; align-items:center;">
                        <span class="badge-regiao"><%= v.getRegiao() %></span>
                        <form action="carrinho" method="post" style="margin:0">
                            <input type="hidden" name="acao"    value="adicionar">
                            <input type="hidden" name="vinhoId" value="<%= v.getId() %>">
                            <button type="submit" class="btn-adicionar">🛒 Adicionar</button>
                        </form>
                    </div>
                </div>
            <%
                    }
                }
            %>
        </div>
    </section>

    <footer>
        <div class="footer-brand">Vinheria Agnello</div>
        <p class="footer-tagline">Vinhos com história, sabor e tradição desde 1987.</p>
        <div class="footer-links">
            <a href="index.jsp">Início</a>
            <a href="catalogo">Catálogo</a>
            <a href="sobre.jsp">Sobre</a>
            <a href="contato">Contato</a>
        </div>
        <div class="footer-bottom">&copy; 2024 Vinheria Agnello. Todos os direitos reservados.</div>
    </footer>

    <script src="js/main.js"></script>
</body>
</html>
