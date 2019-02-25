package br.com.ifpe.viajalheira.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

//@author Maria Beatriz Germano
@Entity
@Table(name="candidatoVaga")
public class CandidatoVaga {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@JoinColumn(name="id_usuario_aplicante")
	private Usuario usuario;
	

	@OneToOne
	@JoinColumn(name="id_vaga")
	private VagaHospedagem vaga;

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

	public VagaHospedagem getVaga() {
		return vaga;
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

	public void setId(int id) {
		this.id = id;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public void setVaga(VagaHospedagem vaga) {
		this.vaga = vaga;
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

	public String getDescricao() {
		return Descricao;
	}

	public void setDescricao(String descricao) {
		Descricao = descricao;
	}
	

}
