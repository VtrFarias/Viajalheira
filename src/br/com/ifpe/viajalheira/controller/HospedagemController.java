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
import br.com.ifpe.viajalheira.model.CandidatoVaga;
import br.com.ifpe.viajalheira.model.CandidatoVagaDao;
import br.com.ifpe.viajalheira.model.Endereco;
import br.com.ifpe.viajalheira.model.EnderecoDao;
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

		try {

			Usuario usu = (Usuario) request.getSession().getAttribute("usuarioLogado");
			TipoVagaDao tipo = new TipoVagaDao();
			TipoVaga tipov = tipo.buscarPorId(tipoVaga);
			vaga.setUsuario(usu);
			vaga.setTipoVaga(tipov);
			vaga.setSituacao('1');
			VagaHospedagemDao dao = new VagaHospedagemDao();
			dao.salvar(vaga);
				
			
		}catch(Exception e){
			model.addAttribute("mensagemErro", "Ocorreu um erro, tente novamente mais tarde");
		}
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
	public String visualizar(@RequestParam("id") int id, Model model) {
		VagaHospedagemDao dao = new VagaHospedagemDao();
		VagaHospedagem vaga = dao.buscarPorId(id);
		model.addAttribute("vagaHospedagem", vaga);
		
		return "hospedagem/visualizar";
	}
	
	@RequestMapping("/hospedagem/aplicar")
	public String aplicar(Model model,@RequestParam("usuario_id") int usuario_id, @RequestParam("vaga_id") int vaga_id, CandidatoVaga candidatoVaga) {
		
		vaga_id = 55;
		String retorno = null;
		try {
		

			CandidatoVagaDao dao = new CandidatoVagaDao();
			
			UsuarioDao daoUser = new UsuarioDao();
			Usuario user = daoUser.buscarPorId(usuario_id);
			VagaHospedagemDao daoVaga = new VagaHospedagemDao();
			VagaHospedagem vaga = daoVaga.buscarPorId(vaga_id);
			
			candidatoVaga.setUsuario(user);
			candidatoVaga.setVagaHospedagem(vaga);
			candidatoVaga.setSituacao('1');
			
			dao.salvar(candidatoVaga);
			
			retorno = visualizar(candidatoVaga.getVagaHospedagem().getId(), model);
			
		}catch(Exception e){
			
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");

		
			retorno = "hospedagem/visualizar";
		}
		return retorno;
		
	}
	
	@RequestMapping("/hospedagem/notificacoes")
	public String notificacoes() {
		
		
		
		return "hospedagem/notificacoes";
		
	}
}
