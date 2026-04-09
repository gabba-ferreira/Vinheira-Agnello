<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.vinheira.agnello.model.Carrinho, br.com.vinheira.agnello.model.ItemCarrinho, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrinho – Vinheria Agnello</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .carrinho-table { width: 100%; border-collapse: collapse; max-width: 860px; margin: 0 auto; }
        .carrinho-table th {
            text-align: left; padding: .8rem 1rem;
            border-bottom: 2px solid var(--dourado);
            color: var(--dourado); font-size: .8rem;
            letter-spacing: 2px; text-transform: uppercase;
        }
        .carrinho-table td { padding: 1rem; border-bottom: 1px solid rgba(201,162,39,.15); vertical-align: middle; }
        .carrinho-table tr:hover td { background: rgba(255,255,255,.03); }
        .qty-input {
            width: 60px; background: rgba(255,255,255,.08);
            border: 1px solid rgba(201,162,39,.4); border-radius: 4px;
            color: var(--creme); text-align: center;
            padding: .3rem; font-size: 1rem;
        }
        .btn-remover {
            background: transparent; border: 1px solid var(--vinho-claro);
            color: var(--vinho-claro); padding: .3rem .8rem;
            border-radius: 4px; cursor: pointer; font-size: .8rem;
            transition: all .3s;
        }
        .btn-remover:hover { background: var(--vinho); color: #fff; }
        .resumo-box {
            max-width: 860px; margin: 2rem auto 0;
            background: linear-gradient(135deg, var(--vinho-escuro), var(--madeira));
            border: 1px solid rgba(201,162,39,.3);
            border-radius: 6px; padding: 1.5rem 2rem;
            display: flex; justify-content: space-between; align-items: center;
            flex-wrap: wrap; gap: 1rem;
        }
        .total-label { font-size: .85rem; color: var(--creme-escuro); letter-spacing: 1px; text-transform: uppercase; }
        .total-valor { font-family: 'Playfair Display', serif; font-size: 2rem; color: var(--dourado); }
        .carrinho-vazio { text-align: center; padding: 4rem 2rem; }
        .carrinho-vazio .icone { font-size: 5rem; margin-bottom: 1rem; }
        .carrinho-vazio h2 { color: var(--creme-escuro); margin-bottom: 1rem; }
    </style>
</head>
<body>

    <%
        Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
        int qtdNav = (carrinho != null) ? carrinho.getQuantidadeTotal() : 0;
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
            <li><a href="catalogo">Catálogo</a></li>
            <li><a href="sobre.jsp">Sobre</a></li>
            <li><a href="contato">Contato</a></li>
            <li>
                <a href="carrinho" class="carrinho-link active">
                    🛒 Carrinho
                    <% if (qtdNav > 0) { %>
                        <span class="carrinho-badge"><%= qtdNav %></span>
                    <% } %>
                </a>
            </li>
        </ul>
    </nav>

    <div class="catalogo-hero">
        <span class="hero-badge">Meu Carrinho</span>
        <h1 style="font-size:2.2rem; margin:.8rem 0">Seu Pedido</h1>
    </div>

    <section style="background:var(--madeira); padding:60px 2rem; min-height:60vh;">

        <% if (carrinho == null || carrinho.isEmpty()) { %>
            <div class="carrinho-vazio">
                <div class="icone">🛒</div>
                <h2>Seu carrinho está vazio</h2>
                <a href="catalogo" class="btn btn-primary">Explorar Catálogo</a>
            </div>
        <% } else { %>

            <table class="carrinho-table">
                <thead>
                    <tr>
                        <th>Vinho</th>
                        <th>Região</th>
                        <th>Preço Unit.</th>
                        <th>Qtd.</th>
                        <th>Subtotal</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <% for (ItemCarrinho item : carrinho.getItens()) { %>
                    <tr>
                        <td><strong><%= item.getNome() %></strong></td>
                        <td><span class="badge-regiao"><%= item.getRegiao() %></span></td>
                        <td>R$ <%= item.getPrecoFormatado() %></td>
                        <td>
                            <form action="carrinho" method="post" style="display:inline">
                                <input type="hidden" name="acao"    value="atualizar">
                                <input type="hidden" name="vinhoId" value="<%= item.getVinhoId() %>">
                                <input type="number" name="quantidade" value="<%= item.getQuantidade() %>"
                                       min="1" max="99" class="qty-input"
                                       onchange="this.form.submit()">
                            </form>
                        </td>
                        <td style="color:var(--dourado); font-weight:700">R$ <%= item.getSubtotalFormatado() %></td>
                        <td>
                            <form action="carrinho" method="post" style="display:inline">
                                <input type="hidden" name="acao"    value="remover">
                                <input type="hidden" name="vinhoId" value="<%= item.getVinhoId() %>">
                                <button type="submit" class="btn-remover">✕ Remover</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <div class="resumo-box">
                <div>
                    <div class="total-label">Total do Pedido</div>
                    <div class="total-valor">R$ <%= carrinho.getTotalFormatado() %></div>
                    <div style="font-size:.8rem; color:var(--creme-escuro); margin-top:.3rem">
                        <%= carrinho.getQuantidadeTotal() %> <%= carrinho.getQuantidadeTotal() == 1 ? "item" : "itens" %>
                    </div>
                </div>
                <div style="display:flex; gap:1rem; flex-wrap:wrap;">
                    <a href="catalogo" class="btn btn-outline">← Continuar Comprando</a>
                    <a href="pagamento" class="btn btn-primary">Finalizar Pedido →</a>
                </div>
            </div>

        <% } %>
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
