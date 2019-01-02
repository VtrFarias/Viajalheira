package br.com.ifpe.viajalheira.model;

import java.security.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "usuario")
public class Usuario {

	private int id;
	//verificar
	
	@Column(name = "id_endereco")
	private int endereco;
	@Column
	private String nome;
	@Column(name = "cpf_cnpj")
	private String cpfCnpj;
	@Column
	private String email;
	@Column
	private String senha;
	@Column
	private String sexo;
	@Column(name = "descricao_perfil")
	private String descricaoPerfil;
	
	//private adm;
	@Column(name = "data_alteracao")
	private Timestamp dataAlteracao;
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEndereco() {
		return endereco;
	}

	public void setEndereco(int endereco) {
		this.endereco = endereco;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpfCnpj() {
		return cpfCnpj;
	}

	public void setCpfCnpj(String cpfCnpj) {
		this.cpfCnpj = cpfCnpj;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getDescricaoPerfil() {
		return descricaoPerfil;
	}

	public void setDescricaoPerfil(String descricaoPerfil) {
		this.descricaoPerfil = descricaoPerfil;
	}

	public Timestamp getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Timestamp dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}
	
	 	
}
