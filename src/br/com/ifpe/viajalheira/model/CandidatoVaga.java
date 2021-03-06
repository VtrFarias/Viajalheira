package br.com.ifpe.viajalheira.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

//@author Maria Beatriz Germano
@Entity
@Table(name="candidatoVaga")
public class CandidatoVaga {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="usuario")
	private Usuario usuario;

	@OneToOne
	@JoinColumn(name="id_vaga")
	private VagaHospedagem vagaHospedagem;

	@Column (name="situacao")
	private char situacao;
	
	@Column
	private Date dataIda;
	
	@Column
	private Date dataVolta;

	@Column
	private String Descricao;

	public int getId() {
		return id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public VagaHospedagem getVagaHospedagem() {
		return vagaHospedagem;
	}

	public char getSituacao() {
		return situacao;
	}

	public Date getDataIda() {
		return dataIda;
	}

	public Date getDataVolta() {
		return dataVolta;
	}

	public String getDescricao() {
		return Descricao;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public void setVagaHospedagem(VagaHospedagem vagaHospedagem) {
		this.vagaHospedagem = vagaHospedagem;
	}

	public void setSituacao(char situacao) {
		this.situacao = situacao;
	}

	public void setDataIda(Date dataIda) {
		this.dataIda = dataIda;
	}

	public void setDataVolta(Date dataVolta) {
		this.dataVolta = dataVolta;
	}

	public void setDescricao(String descricao) {
		Descricao = descricao;
	}
	
}
