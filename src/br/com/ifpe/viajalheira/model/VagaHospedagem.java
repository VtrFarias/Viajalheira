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
	@JoinColumn(name="usuario_id")
	private Usuario usuario;
	@ManyToOne
	@JoinColumn(name="imagem_capa_id")
	private Imagens imagem;
	@OneToOne
	@JoinColumn(name="endereco_id")
	private Endereco endereco;
	@ManyToOne
	@JoinColumn(name="id_tipo_vaga")
	private TipoVaga tipoVaga;
	@Column
	private String titulo;
	@Column
	private String descricao;
	@Column (name="situacao")
	private char situacao;
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

	public Usuario getUsuario() {
		return usuario;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public TipoVaga getTipoVaga() {
		return tipoVaga;
	}

	public String getTitulo() {
		return titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public char getSituacao() {
		return situacao;
	}

	public String getTempoMinimoSemanas() {
		return tempoMinimoSemanas;
	}

	public String getTempoMaximoSemanas() {
		return tempoMaximoSemanas;
	}

	public String getHorasTrabalhoSemanal() {
		return horasTrabalhoSemanal;
	}

	public Timestamp getDataAlteracao() {
		return dataAlteracao;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public void setTipoVaga(TipoVaga tipoVaga) {
		this.tipoVaga = tipoVaga;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setSituacao(char situacao) {
		this.situacao = situacao;
	}

	public void setTempoMinimoSemanas(String tempoMinimoSemanas) {
		this.tempoMinimoSemanas = tempoMinimoSemanas;
	}

	public void setTempoMaximoSemanas(String tempoMaximoSemanas) {
		this.tempoMaximoSemanas = tempoMaximoSemanas;
	}

	public void setHorasTrabalhoSemanal(String horasTrabalhoSemanal) {
		this.horasTrabalhoSemanal = horasTrabalhoSemanal;
	}

	public void setDataAlteracao(Timestamp dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public Imagens getImagem() {
		return imagem;
	}

	public void setImagem(Imagens imagem) {
		this.imagem = imagem;
	}
	
	
	
	
	
}
