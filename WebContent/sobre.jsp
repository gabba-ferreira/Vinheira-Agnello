<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sobre – Vinheria Agnello</title>
    <link rel="stylesheet" href="css/style.css">
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
            <li><a href="index.jsp">Início</a></li>
            <li><a href="catalogo">Catálogo</a></li>
            <li><a href="sobre.jsp" class="active">Sobre</a></li>
            <li><a href="contato">Contato</a></li>
        </ul>
    </nav>

    <!-- Hero -->
    <div class="catalogo-hero">
        <span class="hero-badge">Quem Somos</span>
        <h1 style="font-size:2.5rem; margin:.8rem 0">Nossa História</h1>
        <p style="color:var(--creme-escuro); max-width:520px; margin:0 auto">
            Quatro décadas de paixão pelo vinho, da família Agnello para a sua mesa.
        </p>
    </div>

    <!-- Missão / Valores -->
    <section style="background:var(--madeira-media); padding:70px 2rem;">
        <div class="section-header">
            <span class="subtitle">Nossos Valores</span>
            <h2>O que nos move</h2>
            <div class="section-divider"></div>
        </div>
        <div class="cards-grid" style="max-width:900px; margin:0 auto;">
            <div class="card">
                <div class="card-img-placeholder" style="height:120px; font-size:3rem;">🌱</div>
                <div class="card-body">
                    <h3>Origem Responsável</h3>
                    <p>Priorizamos vinícolas que respeitam o meio ambiente e praticam viticultura sustentável.</p>
                </div>
            </div>
            <div class="card">
                <div class="card-img-placeholder" style="height:120px; font-size:3rem;">🎓</div>
                <div class="card-body">
                    <h3>Expertise Certificada</h3>
                    <p>Nossa equipe conta com sommeliers certificados pela WSET e pela ABS.</p>
                </div>
            </div>
            <div class="card">
                <div class="card-img-placeholder" style="height:120px; font-size:3rem;">❤️</div>
                <div class="card-body">
                    <h3>Paixão Genuína</h3>
                    <p>Cada rótulo é escolhido porque acreditamos nele — não por volume ou margem.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Timeline -->
    <section style="background:var(--madeira); padding:70px 2rem;">
        <div class="section-header">
            <span class="subtitle">Linha do Tempo</span>
            <h2>Momentos que nos definem</h2>
            <div class="section-divider"></div>
        </div>

        <div class="timeline">
            <div class="timeline-item">
                <span class="ano">1987</span>
                <h4>A Fundação</h4>
                <p>Giuseppe Agnello abre a primeira loja no bairro de Pinheiros, São Paulo, com 80 rótulos selecionados em viagens pela Europa.</p>
            </div>
            <div class="timeline-item">
                <span class="ano">1995</span>
                <h4>Primeira Importação Direta</h4>
                <p>Firmamos parceria com vinícolas italianas e francesas, trazendo rótulos exclusivos ao mercado brasileiro.</p>
            </div>
            <div class="timeline-item">
                <span class="ano">2003</span>
                <h4>Escola de Vinhos Agnello</h4>
                <p>Inauguramos cursos de degustação e harmonização para apreciadores, formando mais de 5.000 alunos em 20 anos.</p>
            </div>
            <div class="timeline-item">
                <span class="ano">2012</span>
                <h4>Segunda Geração</h4>
                <p>Maria e Luca Agnello assumem a gestão e expandem o portfólio com vinhos do Novo Mundo e produtores naturais.</p>
            </div>
            <div class="timeline-item">
                <span class="ano">2024</span>
                <h4>Presença Digital</h4>
                <p>Lançamos nossa plataforma online para levar a experiência Agnello a todo o Brasil, mantendo a curadoria e o atendimento personalizado.</p>
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
            &copy; 2024 Vinheria Agnello. Todos os direitos reservados.
        </div>
    </footer>

    <script src="js/main.js"></script>
</body>
</html>
