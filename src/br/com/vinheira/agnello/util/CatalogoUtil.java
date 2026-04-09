package br.com.vinheira.agnello.util;

import br.com.vinheira.agnello.model.Vinho;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Catálogo fixo usado quando o banco de dados não está disponível.
 * Também serve como fonte de dados para o carrinho buscar informações do vinho pelo ID.
 */
public class CatalogoUtil {

    private static final Map<Integer, Vinho> CATALOGO = new LinkedHashMap<>();

    static {
        CATALOGO.put(1, new Vinho(1, "Cabernet Sauvignon Reserva", "tinto",
                "Valle Central – Chile",
                "Frutas vermelhas maduras, taninos elegantes e final longo. Ideal para carnes vermelhas.",
                new BigDecimal("189.90"), 2021, "Santa Helena"));

        CATALOGO.put(2, new Vinho(2, "Prosecco DOC Brut", "espumante",
                "Veneto – Itália",
                "Borbulhas finas, aroma floral e toque cítrico refrescante. Perfeito para celebrações.",
                new BigDecimal("149.00"), 2023, "Bisol"));

        CATALOGO.put(3, new Vinho(3, "Malbec Gran Reserva", "tinto",
                "Mendoza – Argentina",
                "Encorpado com notas de ameixa, chocolate amargo e especiarias. Grande elegância.",
                new BigDecimal("219.00"), 2020, "Achaval Ferrer"));

        CATALOGO.put(4, new Vinho(4, "Sauvignon Blanc Valle", "branco",
                "Casablanca – Chile",
                "Frescor mineral, notas cítricas e herbáceas. Perfeito com frutos do mar.",
                new BigDecimal("135.00"), 2023, "Casas del Bosque"));

        CATALOGO.put(5, new Vinho(5, "Rosé de Provence", "rosé",
                "Provence – França",
                "Delicado, com notas de morango, pétalas de rosa e final fresco e sutil.",
                new BigDecimal("178.00"), 2023, "Château Miraval"));

        CATALOGO.put(6, new Vinho(6, "Tannat Reserva Nacional", "tinto",
                "Serra Gaúcha – Brasil",
                "Tânico e estruturado, com notas de frutas negras e toque defumado.",
                new BigDecimal("98.00"), 2021, "Miolo"));
    }

    public static Map<Integer, Vinho> getCatalogo() { return CATALOGO; }

    public static Vinho getPorId(int id) { return CATALOGO.get(id); }
}
