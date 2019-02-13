package br.com.ifpe.viajalheira.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.viajalheira.model.Beneficio;
import br.com.ifpe.viajalheira.model.BeneficioDao;
import br.com.ifpe.viajalheira.model.Endereco;
import br.com.ifpe.viajalheira.model.EnderecoDao;
import br.com.ifpe.viajalheira.model.Idioma;
import br.com.ifpe.viajalheira.model.IdiomaDao;
import br.com.ifpe.viajalheira.model.IdiomaUsuario;
import br.com.ifpe.viajalheira.model.IdiomaUsuarioDao;
import br.com.ifpe.viajalheira.model.TipoVaga;
import br.com.ifpe.viajalheira.model.TipoVagaDao;
import br.com.ifpe.viajalheira.model.Usuario;
import br.com.ifpe.viajalheira.model.UsuarioDao;
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
		
		BeneficioDao beneficioDao = new BeneficioDao();
		List<Beneficio> listaBeneficio = beneficioDao.listar(null);
		
		model.addAttribute("listaTipoVaga", listaTipoVaga);
		model.addAttribute("listaBeneficio", listaBeneficio);
		
		return "hospedagem/novaHospedagem";
	}
	
	@RequestMapping("kj")
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
	@RequestMapping("/hospedagem/save")
	public String cadastrarEndereco1(HttpServletRequest request, Endereco endereco, @RequestParam("tipovaga") int tipoVaga, @RequestParam(value = "beneficio", required = false)int [] beneficio, VagaHospedagem vaga) {
		EnderecoDao dao = new EnderecoDao();
		dao.salvar(endereco);
		vaga.setEndereco(endereco);
		System.out.println(tipoVaga +" --- " + Arrays.toString(beneficio));
		return cadastrarVaga1(vaga, beneficio, tipoVaga, request);
	}
	public String cadastrarVaga1(VagaHospedagem vaga, int [] beneficio, int tipoVaga, HttpServletRequest request) {
		//UsuarioDao usuariodao = new UsuarioDao();

		Usuario usu = (Usuario) request.getSession().getAttribute("usuarioLogado");
		TipoVagaDao tipo = new TipoVagaDao();
		TipoVaga tipov = tipo.buscarPorId(tipoVaga);
		vaga.setUsuario(usu);
		vaga.setTipoVaga(tipov);
		VagaHospedagemDao dao = new VagaHospedagemDao();
		dao.salvar(vaga);
		
		return cadastrarVagaBeneficio1(vaga, beneficio);
	}
	public String cadastrarVagaBeneficio1(VagaHospedagem vaga,int [] beneficio) {
		BeneficioDao ben = new BeneficioDao();
		VagaBeneficioDao dao = new VagaBeneficioDao();
		for (int id : beneficio) {
			Beneficio Beneficio = ben.buscarPorId(id);
			VagaBeneficio vagaBeneficio = new VagaBeneficio();
			vagaBeneficio.setVaga(vaga);
			vagaBeneficio.setBeneficio(Beneficio);
			dao.salvar(vagaBeneficio);
		}
		return "home";

	}
}
