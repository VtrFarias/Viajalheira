package br.com.ifpe.viajalheira.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.viajalheira.model.Beneficio;
import br.com.ifpe.viajalheira.model.BeneficioDao;
import br.com.ifpe.viajalheira.model.Endereco;
import br.com.ifpe.viajalheira.model.EnderecoDao;
import br.com.ifpe.viajalheira.model.TipoVaga;
import br.com.ifpe.viajalheira.model.TipoVagaDao;
import br.com.ifpe.viajalheira.model.Usuario;
import br.com.ifpe.viajalheira.model.VagaBeneficio;
import br.com.ifpe.viajalheira.model.VagaBeneficioDao;
import br.com.ifpe.viajalheira.model.VagaHospedagem;
import br.com.ifpe.viajalheira.model.VagaHospedagemDao;

@Controller
public class HospedagemController {

	@Autowired
	UsuarioController usuarioController;
	
	
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
	

	@RequestMapping("/hospedagem/save")
	public String cadastrarEndereco1(Model model, HttpServletRequest request, Endereco endereco, 
			@RequestParam("tipovaga") int tipoVaga, @RequestParam(value = "beneficio", required = false)int [] beneficio, 
			VagaHospedagem vaga) {
		
		EnderecoDao dao = new EnderecoDao();
		dao.salvar(endereco);
		vaga.setEndereco(endereco);
		return cadastrarVaga1(model, vaga, beneficio, tipoVaga, request);
	}
	public String cadastrarVaga1(Model model,VagaHospedagem vaga, int [] beneficio, int tipoVaga, HttpServletRequest request) {
		//UsuarioDao usuariodao = new UsuarioDao();

		Usuario usu = (Usuario) request.getSession().getAttribute("usuarioLogado");
		TipoVagaDao tipo = new TipoVagaDao();
		TipoVaga tipov = tipo.buscarPorId(tipoVaga);
		vaga.setUsuario(usu);
		vaga.setTipoVaga(tipov);
		vaga.setSituacao('1');
		VagaHospedagemDao dao = new VagaHospedagemDao();
		dao.salvar(vaga);
		
		return cadastrarVagaBeneficio1(model, vaga, beneficio);
	}
	public String cadastrarVagaBeneficio1(Model model, VagaHospedagem vaga,int [] beneficio) {
		BeneficioDao ben = new BeneficioDao();
		VagaBeneficioDao dao = new VagaBeneficioDao();
		for (int id : beneficio) {
			Beneficio Beneficio = ben.buscarPorId(id);
			VagaBeneficio vagaBeneficio = new VagaBeneficio();
			vagaBeneficio.setVaga(vaga);
			vagaBeneficio.setBeneficio(Beneficio);
			dao.salvar(vagaBeneficio);
		}
		return usuarioController.home(model);

	}
	
	@RequestMapping("hospedagem/visualizar")
	public String visualizar() {
		
		
		return "hospedagem/visualizar";
	}
}
