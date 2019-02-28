package br.com.ifpe.viajalheira.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="imagens")
public class Imagens {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	private String descricao;
	@ManyToOne
	@JoinColumn(name="id_hospedagem")
	private VagaHospedagem vaga;
	
	public VagaHospedagem getVaga() {
		return vaga;
	}
	public void setVaga(VagaHospedagem vaga) {
		this.vaga = vaga;
	}
	public int getId() {
		return id;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	

}
