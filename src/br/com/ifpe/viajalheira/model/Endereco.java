package br.com.ifpe.viajalheira.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Endereco")
public class Endereco {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	private String pais;
	@Column
	private String estado;
	@Column
	private String cidade;
	@Column
	private String bairro;
	@Column
	private String rua;
	@Column(name="numero_casa")
	private String numerocasa;
	@Column
	private String complemento;
	@Column(name="data_alteracao")
	private Date dataalteracao;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getRua() {
		return rua;
	}
	public void setRua(String rua) {
		this.rua = rua;
	}
	public String getNumerocasa() {
		return numerocasa;
	}
	public void setNumerocasa(String numerocasa) {
		this.numerocasa = numerocasa;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public Date getDataalteracao() {
		return dataalteracao;
	}
	public void setDataalteracao(Date dataalteracao) {
		this.dataalteracao = dataalteracao;
	}

}
