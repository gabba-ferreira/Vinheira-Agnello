package br.com.vinheira.agnello.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class Carrinho implements Serializable {

    private static final long serialVersionUID = 1L;

    private final List<ItemCarrinho> itens = new ArrayList<>();

    public void adicionar(ItemCarrinho novoItem) {
        for (ItemCarrinho item : itens) {
            if (item.getVinhoId() == novoItem.getVinhoId()) {
                item.setQuantidade(item.getQuantidade() + 1);
                return;
            }
        }
        itens.add(novoItem);
    }

    public void remover(int vinhoId) {
        itens.removeIf(item -> item.getVinhoId() == vinhoId);
    }

    public void atualizarQuantidade(int vinhoId, int quantidade) {
        if (quantidade <= 0) {
            remover(vinhoId);
            return;
        }
        for (ItemCarrinho item : itens) {
            if (item.getVinhoId() == vinhoId) {
                item.setQuantidade(quantidade);
                return;
            }
        }
    }

    public BigDecimal getTotal() {
        return itens.stream()
                .map(ItemCarrinho::getSubtotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    public String getTotalFormatado() {
        return NumberFormat.getInstance(new Locale("pt", "BR")).format(getTotal());
    }

    public int getQuantidadeTotal() {
        return itens.stream().mapToInt(ItemCarrinho::getQuantidade).sum();
    }

    public boolean isEmpty() { return itens.isEmpty(); }
    public List<ItemCarrinho> getItens() { return itens; }
}
