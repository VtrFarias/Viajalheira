package br.com.ifpe.viajalheira.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="vagaBeneficio")
public class VagaBeneficio {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name="vaga_id")
	private VagaHospedagem vaga;
	@ManyToOne
	@JoinColumn(name="beneficio_id")
	private Beneficio beneficio;
	
	
	public int getId() {
		return id;
	}
	public VagaHospedagem getVaga() {
		return vaga;
	}
	public Beneficio getBeneficio() {
		return beneficio;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setVaga(VagaHospedagem vaga) {
		this.vaga = vaga;
	}
	public void setBeneficio(Beneficio beneficio) {
		this.beneficio = beneficio;
	}
}
