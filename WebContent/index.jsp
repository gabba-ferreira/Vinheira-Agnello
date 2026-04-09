<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vinheria Agnello – Vinhos com História</title>
    <link rel="stylesheet" href="css/style.css">
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
            <li><a href="index.jsp" class="active">Início</a></li>
            <li><a href="catalogo">Catálogo</a></li>
            <li><a href="sobre.jsp">Sobre</a></li>
            <li><a href="contato">Contato</a></li>
        </ul>
    </nav>

    <section class="hero">
        <div class="hero-content">
            <div class="hero-badge">Seleção Premium</div>
            <h1>Vinhos que contam <em>histórias</em></h1>
            <div class="hero-divider"></div>
            <p>
                Da vinha à sua mesa — curadoria especializada de vinhos
                nacionais e importados, com a experiência de quatro décadas
                da família Agnello.
            </p>
            <div class="hero-buttons">
                <a href="catalogo" class="btn btn-primary">Ver Catálogo</a>
                <a href="sobre.jsp" class="btn btn-outline">Nossa História</a>
            </div>
        </div>
    </section>

    <section class="destaques">
        <div class="section-header">
            <span class="subtitle">Seleção do Sommelier</span>
            <h2>Destaques da Semana</h2>
            <div class="section-divider"></div>
        </div>
        <div class="cards-grid">
            <div class="card">
                <div class="card-img-placeholder">🍷</div>
                <div class="card-body">
                    <h3>Cabernet Sauvignon Reserva</h3>
                    <p>Notas de frutas vermelhas maduras, taninos elegantes e final longo.</p>
                    <span class="preco">R$ 189,90</span>
                </div>
                <div class="card-footer"><span class="badge-regiao">Valle Central – Chile</span></div>
            </div>
            <div class="card">
                <div class="card-img-placeholder">🥂</div>
                <div class="card-body">
                    <h3>Prosecco DOC Brut</h3>
                    <p>Borbulhas finas, aroma floral e toque cítrico refrescante.</p>
                    <span class="preco">R$ 149,00</span>
                </div>
                <div class="card-footer"><span class="badge-regiao">Veneto – Itália</span></div>
            </div>
            <div class="card">
                <div class="card-img-placeholder">🍇</div>
                <div class="card-body">
                    <h3>Malbec Gran Reserva</h3>
                    <p>Encorpado com notas de ameixa, chocolate amargo e especiarias.</p>
                    <span class="preco">R$ 219,00</span>
                </div>
                <div class="card-footer"><span class="badge-regiao">Mendoza – Argentina</span></div>
            </div>
        </div>
    </section>

    <section class="sobre-home">
        <div class="sobre-grid">
            <div class="sobre-texto">
                <h2>Tradição que você pode provar</h2>
                <p>Fundada em 1987, a Vinheria Agnello nasceu da paixão da família pelo mundo dos vinhos.</p>
                <p>Cada garrafa é selecionada pessoalmente pela nossa equipe de sommeliers certificados.</p>
                <a href="sobre.jsp" class="btn btn-outline" style="margin-top:.5rem">Conheça nossa história</a>
            </div>
            <div class="sobre-icones">
                <div class="sobre-item">
                    <span class="icone">🏆</span>
                    <div>
                        <h4>Prêmios & Reconhecimentos</h4>
                        <p>Eleita melhor vinheria de SP por 5 anos consecutivos.</p>
                    </div>
                </div>
                <div class="sobre-item">
                    <span class="icone">🌍</span>
                    <div>
                        <h4>+200 Rótulos Importados</h4>
                        <p>Curadoria de vinhos de mais de 15 países.</p>
                    </div>
                </div>
                <div class="sobre-item">
                    <span class="icone">📚</span>
                    <div>
                        <h4>Consultoria Especializada</h4>
                        <p>Sommeliers disponíveis para cada ocasião.</p>
                    </div>
                </div>
            </div>
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
        <div class="footer-bottom">
            &copy; 2024 Vinheria Agnello. Todos os direitos reservados. |
            Beba com moderação. Proibida a venda para menores de 18 anos.
        </div>
    </footer>

    <script src="js/main.js"></script>
</body>
</html>
