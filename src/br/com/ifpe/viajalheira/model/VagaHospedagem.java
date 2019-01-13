package br.com.ifpe.viajalheira.model;

import java.security.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="vaga_hospedagem")
public class VagaHospedagem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;
	@OneToOne
	@JoinColumn(name="id_endereco")
	private Endereco endereco;
	@ManyToOne
	@JoinColumn(name="id_tipo_vaga")
	private TipoVaga tipoVaga;
	@Column
	private String titulo;
	@Column
	private String descricao;
	@Column
	private String situacao;
	@Column(name="tempo_minimo_semanas")
	private String tempoMinimoSemanas;
	@Column(name="tempo_maximo_semanas")
	private String tempoMaximoSemanas;
	@Column(name="horas_trabalho_semanal")
	private String horasTrabalhoSemanal;
	@Column(name="data_alteracao")
	private Timestamp dataAlteracao;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	public TipoVaga getTipoVaga() {
		return tipoVaga;
	}
	public void setTipoVaga(TipoVaga tipoVaga) {
		this.tipoVaga = tipoVaga;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getSituacao() {
		return situacao;
	}
	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}
	public String getTempoMinimoSemanas() {
		return tempoMinimoSemanas;
	}
	public void setTempoMinimoSemanas(String tempoMinimoSemanas) {
		this.tempoMinimoSemanas = tempoMinimoSemanas;
	}
	public String getTempoMaximoSemanas() {
		return tempoMaximoSemanas;
	}
	public void setTempoMaximoSemanas(String tempoMaximoSemanas) {
		this.tempoMaximoSemanas = tempoMaximoSemanas;
	}
	public String getHorasTrabalhoSemanal() {
		return horasTrabalhoSemanal;
	}
	public void setHorasTrabalhoSemanal(String horasTrabalhoSemanal) {
		this.horasTrabalhoSemanal = horasTrabalhoSemanal;
	}
	public Timestamp getDataAlteracao() {
		return dataAlteracao;
	}
	public void setDataAlteracao(Timestamp dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}
	
	
}
