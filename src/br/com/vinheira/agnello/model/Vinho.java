package br.com.vinheira.agnello.model;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

public class Vinho {

    private int id;
    private String nome;
    private String tipo;       // tinto, branco, rosé, espumante
    private String regiao;
    private String descricao;
    private BigDecimal preco;
    private int anoColheita;
    private String vinícola;

    public Vinho() {}

    public Vinho(int id, String nome, String tipo, String regiao,
                 String descricao, BigDecimal preco, int anoColheita, String vinicola) {
        this.id = id;
        this.nome = nome;
        this.tipo = tipo;
        this.regiao = regiao;
        this.descricao = descricao;
        this.preco = preco;
        this.anoColheita = anoColheita;
        this.vinícola = vinicola;
    }

    /** Retorna preço formatado como "189,90" para uso no JSP */
    public String getPrecoFormatado() {
        if (preco == null) return "0,00";
        return NumberFormat.getInstance(new Locale("pt", "BR")).format(preco);
    }

    // --- Getters & Setters ---

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getRegiao() { return regiao; }
    public void setRegiao(String regiao) { this.regiao = regiao; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public BigDecimal getPreco() { return preco; }
    public void setPreco(BigDecimal preco) { this.preco = preco; }

    public int getAnoColheita() { return anoColheita; }
    public void setAnoColheita(int anoColheita) { this.anoColheita = anoColheita; }

    public String getVinícola() { return vinícola; }
    public void setVinícola(String vinicola) { this.vinícola = vinicola; }
}
