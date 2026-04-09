<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.vinheira.agnello.model.Carrinho, br.com.vinheira.agnello.model.ItemCarrinho" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagamento – Vinheria Agnello</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .pagamento-grid {
            display: grid;
            grid-template-columns: 1.4fr 1fr;
            gap: 3rem;
            max-width: 960px;
            margin: 0 auto;
        }
        .resumo-pedido {
            background: linear-gradient(135deg, var(--vinho-escuro), var(--madeira));
            border: 1px solid rgba(201,162,39,.25);
            border-radius: 6px;
            padding: 1.5rem;
        }
        .resumo-pedido h3 { color: var(--dourado); margin-bottom: 1.2rem; font-size: 1rem; letter-spacing: 2px; text-transform: uppercase; }
        .resumo-item { display: flex; justify-content: space-between; padding: .6rem 0; border-bottom: 1px solid rgba(255,255,255,.06); font-size: .9rem; }
        .resumo-item:last-child { border-bottom: none; }
        .resumo-total { display: flex; justify-content: space-between; padding: 1rem 0 0; font-size: 1.1rem; }
        .resumo-total strong { color: var(--dourado); font-size: 1.4rem; }
        .card-preview {
            background: linear-gradient(135deg, var(--vinho) 0%, var(--vinho-escuro) 100%);
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            position: relative;
            min-height: 140px;
            box-shadow: 0 8px 24px rgba(0,0,0,.4);
        }
        .card-preview .chip { font-size: 1.8rem; margin-bottom: .8rem; display: block; }
        .card-preview .numero-preview { font-size: 1.1rem; letter-spacing: 4px; color: rgba(255,255,255,.7); margin-bottom: .8rem; }
        .card-preview .nome-preview { font-size: .85rem; text-transform: uppercase; letter-spacing: 2px; color: rgba(255,255,255,.6); }
        .card-preview .logo-card { position: absolute; top: 1rem; right: 1rem; font-size: 1.5rem; }
        .seguro-badge {
            display: flex; align-items: center; gap: .5rem;
            background: rgba(40,120,60,.2); border: 1px solid rgba(76,175,80,.3);
            border-radius: 4px; padding: .5rem 1rem;
            font-size: .8rem; color: #a5d6a7; margin-bottom: 1.5rem;
        }
        @media (max-width: 768px) {
            .pagamento-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

    <%
        Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
        if (carrinho == null || carrinho.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/carrinho");
            return;
        }
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
            <li><a href="carrinho">🛒 Carrinho (<%= carrinho.getQuantidadeTotal() %>)</a></li>
        </ul>
    </nav>

    <div class="catalogo-hero">
        <span class="hero-badge">Finalizar Pedido</span>
        <h1 style="font-size:2.2rem; margin:.8rem 0">Pagamento</h1>
        <p style="color:var(--creme-escuro)">Seus dados estão protegidos com criptografia SSL.</p>
    </div>

    <section style="background:var(--madeira); padding:60px 2rem;">

        <% if (request.getAttribute("erro") != null) { %>
            <div class="alert alert-error" style="max-width:960px; margin:0 auto 2rem;">
                <%= request.getAttribute("erro") %>
            </div>
        <% } %>

        <div class="pagamento-grid">

            <!-- Formulário de pagamento -->
            <div>
                <div class="seguro-badge">🔒 Pagamento 100% seguro e criptografado</div>

                <!-- Preview do cartão -->
                <div class="card-preview">
                    <span class="chip">💳</span>
                    <div class="numero-preview" id="previewNumero">•••• •••• •••• ••••</div>
                    <div class="nome-preview"   id="previewNome">SEU NOME</div>
                    <div class="logo-card">💜</div>
                </div>

                <form action="pagamento" method="post">
                    <div class="form-group">
                        <label for="nomeCartao">Nome no Cartão</label>
                        <input type="text" id="nomeCartao" name="nomeCartao" required
                               placeholder="Como está impresso no cartão"
                               oninput="document.getElementById('previewNome').textContent = this.value.toUpperCase() || 'SEU NOME'">
                    </div>
                    <div class="form-group">
                        <label for="numeroCartao">Número do Cartão</label>
                        <input type="text" id="numeroCartao" name="numeroCartao" required
                               placeholder="0000 0000 0000 0000" maxlength="19"
                               oninput="formatarCartao(this)">
                    </div>
                    <div style="display:grid; grid-template-columns:1fr 1fr; gap:1rem;">
                        <div class="form-group">
                            <label for="validade">Validade</label>
                            <input type="text" id="validade" name="validade" required
                                   placeholder="MM/AA" maxlength="5"
                                   oninput="formatarValidade(this)">
                        </div>
                        <div class="form-group">
                            <label for="cvv">CVV</label>
                            <input type="text" id="cvv" name="cvv" required
                                   placeholder="•••" maxlength="4">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="parcelas">Parcelamento</label>
                        <select id="parcelas" name="parcelas">
                            <option value="1">1x de R$ <%= carrinho.getTotalFormatado() %> (sem juros)</option>
                            <option value="2">2x de R$ <%= String.format("%.2f", carrinho.getTotal().doubleValue() / 2).replace(".", ",") %> (sem juros)</option>
                            <option value="3">3x de R$ <%= String.format("%.2f", carrinho.getTotal().doubleValue() / 3).replace(".", ",") %> (sem juros)</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary" style="width:100%; font-size:1rem; padding:1rem;">
                        🔒 Confirmar Pagamento – R$ <%= carrinho.getTotalFormatado() %>
                    </button>
                </form>
            </div>

            <!-- Resumo do pedido -->
            <div>
                <div class="resumo-pedido">
                    <h3>Resumo do Pedido</h3>
                    <% for (ItemCarrinho item : carrinho.getItens()) { %>
                        <div class="resumo-item">
                            <span><%= item.getNome() %> <small style="color:var(--creme-escuro)">x<%= item.getQuantidade() %></small></span>
                            <span>R$ <%= item.getSubtotalFormatado() %></span>
                        </div>
                    <% } %>
                    <div class="resumo-item" style="color:var(--creme-escuro); font-size:.85rem;">
                        <span>Frete</span>
                        <span style="color:#4caf50">Grátis</span>
                    </div>
                    <div class="resumo-total">
                        <span>Total</span>
                        <strong>R$ <%= carrinho.getTotalFormatado() %></strong>
                    </div>
                </div>

                <div style="margin-top:1rem; font-size:.82rem; color:var(--creme-escuro); line-height:1.8;">
                    <p>🚚 Entrega em 3 a 5 dias úteis</p>
                    <p>📦 Embalagem especial para vinhos</p>
                    <p>↩️ Devolução gratuita em 7 dias</p>
                </div>
            </div>

        </div>
    </section>

    <footer>
        <div class="footer-brand">Vinheria Agnello</div>
        <div class="footer-bottom">&copy; 2024 Vinheria Agnello. Todos os direitos reservados.</div>
    </footer>

    <script src="js/main.js"></script>
    <script>
        function formatarCartao(input) {
            let v = input.value.replace(/\D/g, '').substring(0, 16);
            input.value = v.replace(/(.{4})/g, '$1 ').trim();
            let masked = v.length > 4
                ? '•••• •••• •••• ' + v.substring(12)
                : v || '•••• •••• •••• ••••';
            document.getElementById('previewNumero').textContent = masked;
        }
        function formatarValidade(input) {
            let v = input.value.replace(/\D/g, '').substring(0, 4);
            if (v.length >= 2) v = v.substring(0, 2) + '/' + v.substring(2);
            input.value = v;
        }
    </script>
</body>
</html>
