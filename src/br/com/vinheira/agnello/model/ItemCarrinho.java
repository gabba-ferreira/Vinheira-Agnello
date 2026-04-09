package br.com.vinheira.agnello.model;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

public class ItemCarrinho {

    private int vinhoId;
    private String nome;
    private String regiao;
    private BigDecimal precoUnitario;
    private int quantidade;

    public ItemCarrinho(int vinhoId, String nome, String regiao, BigDecimal precoUnitario) {
        this.vinhoId = vinhoId;
        this.nome = nome;
        this.regiao = regiao;
        this.precoUnitario = precoUnitario;
        this.quantidade = 1;
    }

    public BigDecimal getSubtotal() {
        return precoUnitario.multiply(BigDecimal.valueOf(quantidade));
    }

    public String getPrecoFormatado() {
        return NumberFormat.getInstance(new Locale("pt", "BR")).format(precoUnitario);
    }

    public String getSubtotalFormatado() {
        return NumberFormat.getInstance(new Locale("pt", "BR")).format(getSubtotal());
    }

    public int getVinhoId() { return vinhoId; }
    public String getNome() { return nome; }
    public String getRegiao() { return regiao; }
    public BigDecimal getPrecoUnitario() { return precoUnitario; }
    public int getQuantidade() { return quantidade; }
    public void setQuantidade(int quantidade) { this.quantidade = quantidade; }
}
