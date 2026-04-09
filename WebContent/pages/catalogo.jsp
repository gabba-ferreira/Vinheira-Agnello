<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo – Vinheria Agnello</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

    <nav class="navbar">
        <div class="navbar-brand">
            <span class="logo-icon">🍷</span>
            <div>
                <span class="brand-text">Vinheira Agnello</span>
                <span class="brand-sub">desde 1987</span>
            </div>
        </div>
        <ul class="nav-links">
            <li><a href="../index.jsp">Início</a></li>
            <li><a href="../catalogo" class="active">Catálogo</a></li>
            <li><a href="../sobre.jsp">Sobre</a></li>
            <li><a href="../contato">Contato</a></li>
        </ul>
    </nav>

    <!-- Hero interno -->
    <div class="catalogo-hero">
        <span class="hero-badge">Nossos Vinhos</span>
        <h1 style="font-size:2.5rem; margin:.8rem 0">Catálogo Completo</h1>
        <p style="color:var(--creme-escuro); max-width:500px; margin:0 auto">
            Selecione pelo tipo ou explore toda a nossa coleção.
        </p>
    </div>

    <section style="background:var(--madeira); padding:60px 2rem;">

        <!-- Filtros -->
        <div class="filtros">
            <button class="filtro-btn ativo" data-categoria="todos" onclick="filtrarVinhos('todos')">Todos</button>
            <button class="filtro-btn" data-categoria="tinto"    onclick="filtrarVinhos('tinto')">Tintos</button>
            <button class="filtro-btn" data-categoria="branco"   onclick="filtrarVinhos('branco')">Brancos</button>
            <button class="filtro-btn" data-categoria="rosé"     onclick="filtrarVinhos('rosé')">Rosés</button>
            <button class="filtro-btn" data-categoria="espumante" onclick="filtrarVinhos('espumante')">Espumantes</button>
        </div>

        <!-- Mensagem de feedback do servlet -->
        <c:if test="${not empty mensagem}">
            <div class="alert alert-success" style="max-width:900px; margin:0 auto 2rem;">
                ${mensagem}
            </div>
        </c:if>

        <!-- Grid de vinhos (populado pelo CatalogoServlet) -->
        <div class="cards-grid" style="max-width:1100px; margin:0 auto;">

            <c:choose>
                <c:when test="${not empty vinhos}">
                    <c:forEach var="vinho" items="${vinhos}">
                        <div class="card vinho-card" data-tipo="${vinho.tipo}">
                            <div class="card-img-placeholder">
                                <c:choose>
                                    <c:when test="${vinho.tipo == 'espumante'}">🥂</c:when>
                                    <c:when test="${vinho.tipo == 'branco'}">🍾</c:when>
                                    <c:otherwise>🍷</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="card-body">
                                <h3>${vinho.nome}</h3>
                                <p>${vinho.descricao}</p>
                                <span class="preco">R$ ${vinho.precoFormatado}</span>
                            </div>
                            <div class="card-footer">
                                <span class="badge-regiao">${vinho.regiao}</span>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <!-- Dados de exemplo quando DB não está disponível -->
                    <div class="card vinho-card" data-tipo="tinto">
                        <div class="card-img-placeholder">🍷</div>
                        <div class="card-body">
                            <h3>Cabernet Sauvignon Reserva</h3>
                            <p>Frutas vermelhas maduras, taninos elegantes e final longo.</p>
                            <span class="preco">R$ 189,90</span>
                        </div>
                        <div class="card-footer"><span class="badge-regiao">Valle Central – Chile</span></div>
                    </div>
                    <div class="card vinho-card" data-tipo="espumante">
                        <div class="card-img-placeholder">🥂</div>
                        <div class="card-body">
                            <h3>Prosecco DOC Brut</h3>
                            <p>Borbulhas finas, aroma floral e toque cítrico refrescante.</p>
                            <span class="preco">R$ 149,00</span>
                        </div>
                        <div class="card-footer"><span class="badge-regiao">Veneto – Itália</span></div>
                    </div>
                    <div class="card vinho-card" data-tipo="tinto">
                        <div class="card-img-placeholder">🍇</div>
                        <div class="card-body">
                            <h3>Malbec Gran Reserva</h3>
                            <p>Encorpado com notas de ameixa, chocolate amargo e especiarias.</p>
                            <span class="preco">R$ 219,00</span>
                        </div>
                        <div class="card-footer"><span class="badge-regiao">Mendoza – Argentina</span></div>
                    </div>
                    <div class="card vinho-card" data-tipo="branco">
                        <div class="card-img-placeholder">🍾</div>
                        <div class="card-body">
                            <h3>Sauvignon Blanc Valle</h3>
                            <p>Frescor mineral, notas cítricas e herbáceas. Perfeito com frutos do mar.</p>
                            <span class="preco">R$ 135,00</span>
                        </div>
                        <div class="card-footer"><span class="badge-regiao">Casablanca – Chile</span></div>
                    </div>
                    <div class="card vinho-card" data-tipo="rosé">
                        <div class="card-img-placeholder">🌹</div>
                        <div class="card-body">
                            <h3>Rosé de Provence</h3>
                            <p>Delicado, com notas de morango, pétalas de rosa e final fresco e sutil.</p>
                            <span class="preco">R$ 178,00</span>
                        </div>
                        <div class="card-footer"><span class="badge-regiao">Provence – França</span></div>
                    </div>
                    <div class="card vinho-card" data-tipo="tinto">
                        <div class="card-img-placeholder">🍷</div>
                        <div class="card-body">
                            <h3>Tannat Reserva Nacional</h3>
                            <p>Tânico e estruturado, com notas de frutas negras e toque defumado.</p>
                            <span class="preco">R$ 98,00</span>
                        </div>
                        <div class="card-footer"><span class="badge-regiao">Serra Gaúcha – Brasil</span></div>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </section>

    <footer>
        <div class="footer-brand">Vinheria Agnello</div>
        <p class="footer-tagline">Vinhos com história, sabor e tradição desde 1987.</p>
        <div class="footer-links">
            <a href="../index.jsp">Início</a>
            <a href="../catalogo">Catálogo</a>
            <a href="../sobre.jsp">Sobre</a>
            <a href="../contato">Contato</a>
        </div>
        <div class="footer-bottom">
            &copy; 2024 Vinheria Agnello. Todos os direitos reservados.
        </div>
    </footer>

    <script src="../js/main.js"></script>
</body>
</html>
