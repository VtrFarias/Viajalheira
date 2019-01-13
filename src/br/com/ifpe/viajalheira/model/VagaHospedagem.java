package br.com.ifpe.viajalheira.model;

import java.security.Timestamp;

public class VagaHospedagem {

	private int id;
	private Usuario usuario;
	private Endereco endereco;
	private TipoVaga tipoVaga;
	private String titulo;
	private String descricao;
	private String situacao;
	private String tempoMinimoSemanas;
	private String tempoMaximoSemanas;
	private String horasTrabalhoSemanal;
	private Timestamp dataAlteraacao;
	
	
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
	public Timestamp getDataAlteraacao() {
		return dataAlteraacao;
	}
	public void setDataAlteraacao(Timestamp dataAlteraacao) {
		this.dataAlteraacao = dataAlteraacao;
	}
	
}
