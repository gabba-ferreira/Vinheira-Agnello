<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contato – Vinheria Agnello</title>
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
            <li><a href="../catalogo">Catálogo</a></li>
            <li><a href="../sobre.jsp">Sobre</a></li>
            <li><a href="../contato" class="active">Contato</a></li>
        </ul>
    </nav>

    <div class="catalogo-hero">
        <span class="hero-badge">Fale Conosco</span>
        <h1 style="font-size:2.5rem; margin:.8rem 0">Entre em Contato</h1>
        <p style="color:var(--creme-escuro); max-width:500px; margin:0 auto">
            Dúvidas, sugestões ou consultoria de vinhos — estamos aqui para ajudar.
        </p>
    </div>

    <section style="background:var(--madeira); padding:70px 2rem;">

        <c:if test="${not empty sucesso}">
            <div class="alert alert-success" style="max-width:960px; margin:0 auto 2rem;">
                Mensagem enviada com sucesso! Retornaremos em até 24 horas.
            </div>
        </c:if>
        <c:if test="${not empty erro}">
            <div class="alert alert-error" style="max-width:960px; margin:0 auto 2rem;">
                ${erro}
            </div>
        </c:if>

        <div class="contato-grid">

            <!-- Informações -->
            <div class="contato-info">
                <h3>Informações</h3>
                <div class="info-item">
                    <span class="icone">📍</span>
                    <p>
                        <strong>Endereço</strong>
                        Rua dos Vinhos, 42 – Pinheiros<br>
                        São Paulo – SP, CEP 05422-010
                    </p>
                </div>
                <div class="info-item">
                    <span class="icone">📞</span>
                    <p>
                        <strong>Telefone</strong>
                        (11) 3456-7890
                    </p>
                </div>
                <div class="info-item">
                    <span class="icone">✉️</span>
                    <p>
                        <strong>E-mail</strong>
                        contato@vinheria-agnello.com.br
                    </p>
                </div>
                <div class="info-item">
                    <span class="icone">🕐</span>
                    <p>
                        <strong>Horário de Funcionamento</strong>
                        Seg–Sex: 10h às 20h<br>
                        Sáb: 10h às 18h | Dom: fechado
                    </p>
                </div>
            </div>

            <!-- Formulário -->
            <form action="../contato" method="post">
                <div class="form-group">
                    <label for="nome">Nome completo</label>
                    <input type="text" id="nome" name="nome" required
                           placeholder="Seu nome" value="${param.nome}">
                </div>
                <div class="form-group">
                    <label for="email">E-mail</label>
                    <input type="email" id="email" name="email" required
                           placeholder="seu@email.com" value="${param.email}">
                </div>
                <div class="form-group">
                    <label for="assunto">Assunto</label>
                    <select id="assunto" name="assunto">
                        <option value="consulta">Consulta sobre vinho</option>
                        <option value="encomenda">Encomenda especial</option>
                        <option value="evento">Evento corporativo</option>
                        <option value="curso">Cursos de degustação</option>
                        <option value="outro">Outro</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="mensagem">Mensagem</label>
                    <textarea id="mensagem" name="mensagem" required
                              placeholder="Escreva sua mensagem...">${param.mensagem}</textarea>
                </div>
                <button type="submit" class="btn btn-primary" style="width:100%">
                    Enviar Mensagem
                </button>
            </form>

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
