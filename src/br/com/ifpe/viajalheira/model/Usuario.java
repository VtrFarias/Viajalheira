package br.com.ifpe.viajalheira.model;

import java.security.Timestamp;
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
@Table(name = "usuario")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
		
	@OneToOne
	@JoinColumn(name="id_endereco")
	private Endereco endereco;
	
	@Column
	private String nome;
	
	@Column(name="cpf_cnpj")
	private String cpfCnpj;
	
	@Column
	private String email;
	
	@Column
	private String senha;
	
	@Column
	private String sexo;
	
	@Column(name="descricao_perfil")
	private String descricaoPerfil;
	
	@Column(name="data_alteracao")
	private Timestamp dataAlteracao;
	
	@Column(name="data_nascimento")
	private Date dataNascimento;

	public int getId() {
		return id;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public String getNome() {
		return nome;
	}

	public String getCpfCnpj() {
		return cpfCnpj;
	}

	public String getEmail() {
		return email;
	}

	public String getSenha() {
		return senha;
	}

	public String getSexo() {
		return sexo;
	}

	public String getDescricaoPerfil() {
		return descricaoPerfil;
	}

	public Timestamp getDataAlteracao() {
		return dataAlteracao;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setCpfCnpj(String cpfCnpj) {
		this.cpfCnpj = cpfCnpj;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public void setDescricaoPerfil(String descricaoPerfil) {
		this.descricaoPerfil = descricaoPerfil;
	}

	public void setDataAlteracao(Timestamp dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	
	 	
}
