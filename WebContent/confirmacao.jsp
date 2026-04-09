<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedido Confirmado – Vinheria Agnello</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .confirmacao-box {
            max-width: 600px;
            margin: 80px auto;
            text-align: center;
            background: linear-gradient(135deg, var(--vinho-escuro), var(--madeira));
            border: 1px solid rgba(201,162,39,.3);
            border-radius: 8px;
            padding: 3rem 2rem;
        }
        .confirmacao-icone { font-size: 5rem; margin-bottom: 1rem; }
        .confirmacao-box h1 { color: var(--dourado); margin-bottom: .5rem; }
        .confirmacao-box p  { color: var(--creme-escuro); margin-bottom: 1rem; }
        .pedido-numero {
            display: inline-block;
            background: rgba(201,162,39,.15);
            border: 1px solid var(--dourado);
            color: var(--dourado);
            font-family: monospace;
            font-size: 1.2rem;
            letter-spacing: 3px;
            padding: .5rem 1.5rem;
            border-radius: 4px;
            margin: 1rem 0 1.5rem;
        }
        .info-entrega {
            background: rgba(0,0,0,.2);
            border-radius: 6px;
            padding: 1rem 1.5rem;
            margin: 1.5rem 0;
            text-align: left;
            font-size: .9rem;
            line-height: 2;
        }
    </style>
</head>
<body>

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
        </ul>
    </nav>

    <section style="background:var(--madeira); min-height:80vh; padding:2rem;">
        <div class="confirmacao-box">
            <div class="confirmacao-icone">🎉</div>
            <h1>Pedido Confirmado!</h1>
            <p>Obrigado pela sua compra, <strong><%= request.getAttribute("nomeCliente") %></strong>!</p>

            <div class="pedido-numero">
                #<%= request.getAttribute("numeroPedido") %>
            </div>

            <p style="font-size:1.1rem;">
                Valor pago: <strong style="color:var(--dourado)">R$ <%= request.getAttribute("totalPago") %></strong>
            </p>

            <div class="info-entrega">
                <p>📧 Confirmação enviada para o seu e-mail</p>
                <p>🚚 Previsão de entrega: 3 a 5 dias úteis</p>
                <p>📦 Embalagem especial para transporte de vinhos</p>
                <p>📞 Dúvidas? Ligue (11) 3456-7890</p>
            </div>

            <div style="display:flex; gap:1rem; justify-content:center; flex-wrap:wrap;">
                <a href="catalogo" class="btn btn-outline">Continuar Comprando</a>
                <a href="index.jsp" class="btn btn-primary">Voltar ao Início</a>
            </div>
        </div>
    </section>

    <footer>
        <div class="footer-brand">Vinheria Agnello</div>
        <div class="footer-bottom">&copy; 2024 Vinheira Agnello. Todos os direitos reservados.</div>
    </footer>

</body>
</html>
