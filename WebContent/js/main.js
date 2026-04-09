// Vinheria Agnello - Scripts

// Marca link ativo na navbar
(function markActiveNav() {
    const links = document.querySelectorAll('.nav-links a');
    const path  = window.location.pathname;
    links.forEach(link => {
        if (path.endsWith(link.getAttribute('href'))) {
            link.classList.add('active');
        }
    });
})();

// Filtro de categoria no catálogo (client-side)
function filtrarVinhos(categoria) {
    const cards = document.querySelectorAll('.vinho-card');
    const btns  = document.querySelectorAll('.filtro-btn');

    btns.forEach(b => b.classList.remove('ativo'));
    document.querySelector('[data-categoria="' + categoria + '"]').classList.add('ativo');

    cards.forEach(card => {
        if (categoria === 'todos' || card.dataset.tipo === categoria) {
            card.style.display = '';
        } else {
            card.style.display = 'none';
        }
    });
}

// Fecha alertas automaticamente após 4 segundos
document.querySelectorAll('.alert').forEach(el => {
    setTimeout(() => {
        el.style.transition = 'opacity .5s';
        el.style.opacity = '0';
        setTimeout(() => el.remove(), 500);
    }, 4000);
});
