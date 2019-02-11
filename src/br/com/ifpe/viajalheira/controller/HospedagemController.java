package br.com.ifpe.viajalheira.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.viajalheira.model.Beneficio;
import br.com.ifpe.viajalheira.model.BeneficioDao;
import br.com.ifpe.viajalheira.model.Endereco;
import br.com.ifpe.viajalheira.model.EnderecoDao;
import br.com.ifpe.viajalheira.model.TipoVaga;
import br.com.ifpe.viajalheira.model.TipoVagaDao;
import br.com.ifpe.viajalheira.model.VagaBeneficio;
import br.com.ifpe.viajalheira.model.VagaBeneficioDao;
import br.com.ifpe.viajalheira.model.VagaHospedagem;
import br.com.ifpe.viajalheira.model.VagaHospedagemDao;

@Controller
public class HospedagemController {

	@RequestMapping("/hospedagem/novoCadastro")
	public String novoCadastro(Model model) {
		TipoVagaDao dao = new TipoVagaDao();
		List<TipoVaga> listaTipoVaga = dao.listar(null);
		model.addAttribute("listaTipoVaga", listaTipoVaga);
		
		return "hospedagem/novaHospedagem";
	}
	
	@RequestMapping("/hospedagem/save")
	public String cadastrarEndereco(Endereco endereco, TipoVaga tipoVaga, Beneficio beneficio, VagaHospedagem vaga) {
		EnderecoDao dao = new EnderecoDao();
		dao.salvar(endereco);
		vaga.setEndereco(endereco);
		
		return cadastrarTipoVaga(tipoVaga, beneficio, vaga);
	}
	
	
	public String cadastrarTipoVaga(TipoVaga tipoVaga, Beneficio beneficio, VagaHospedagem vaga) {
		
		TipoVagaDao dao = new TipoVagaDao();
		dao.salvar(tipoVaga);
		vaga.setTipoVaga(tipoVaga);
		
		return cadastrarBeneficio(beneficio, vaga);
	}
	
	public String cadastrarBeneficio(Beneficio beneficio, VagaHospedagem vaga) {
		
		BeneficioDao dao = new BeneficioDao();
		dao.salvar(beneficio);
		
		return cadastrarVaga(vaga, beneficio);
	}
	
	
	
	public String cadastrarVaga(VagaHospedagem vaga, Beneficio beneficio) {
		
		VagaHospedagemDao dao = new VagaHospedagemDao();
		dao.salvar(vaga);
		
		return cadastrarVagaBeneficio(vaga, beneficio);
	}
	
	public String cadastrarVagaBeneficio(VagaHospedagem vaga, Beneficio beneficio) {
		VagaBeneficio vagaBeneficio = new VagaBeneficio();
		vagaBeneficio.setVaga(vaga);
		vagaBeneficio.setBeneficio(beneficio);
		VagaBeneficioDao dao = new VagaBeneficioDao();
		
		dao.salvar(vagaBeneficio);
		
		return "home";
	}
}
