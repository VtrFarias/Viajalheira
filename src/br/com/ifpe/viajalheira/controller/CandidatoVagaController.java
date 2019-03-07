package br.com.ifpe.viajalheira.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.viajalheira.model.CandidatoVaga;
import br.com.ifpe.viajalheira.model.CandidatoVagaDao;
import br.com.ifpe.viajalheira.model.Usuario;
import br.com.ifpe.viajalheira.model.UsuarioDao;
import br.com.ifpe.viajalheira.model.VagaHospedagem;
import br.com.ifpe.viajalheira.model.VagaHospedagemDao;

@Controller
public class CandidatoVagaController {
	@Autowired HospedagemController hospedagemController;

	@RequestMapping("/hospedagem/aplicar")
	public String aplicar(Model model, @RequestParam("usuario_id") int usuario_id, @RequestParam("vaga_id") int vaga_id,
			CandidatoVaga candidatoVaga, @RequestParam("dataIdaa") String dataIda, @RequestParam("dataVolt") String dataVolta)
			throws ParseException {

		vaga_id = 55;
		String retorno = null;
		try {

			CandidatoVagaDao dao = new CandidatoVagaDao();

			UsuarioDao daoUser = new UsuarioDao();
			Usuario user = daoUser.buscarPorId(usuario_id);
			VagaHospedagemDao daoVaga = new VagaHospedagemDao();
			VagaHospedagem vaga = daoVaga.buscarPorId(vaga_id);

			SimpleDateFormat dataFormatadaIda = new SimpleDateFormat("yyyy-MM-dd");
			Date dataI = dataFormatadaIda.parse(dataIda);
			candidatoVaga.setDataIda(dataI);

			SimpleDateFormat dataFormatadaVolta = new SimpleDateFormat("yyyy-MM-dd");
			Date dataV = dataFormatadaVolta.parse(dataVolta);
			candidatoVaga.setDataVolta(dataV);

			candidatoVaga.setUsuario(user);
			candidatoVaga.setVagaHospedagem(vaga);
			candidatoVaga.setSituacao('1');

			dao.salvar(candidatoVaga);

			retorno = hospedagemController.visualizar(candidatoVaga.getVagaHospedagem().getId(), model);

		} catch (Exception e) {

			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");

			retorno = "hospedagem/visualizar";
		}
		return retorno;

	}

	@RequestMapping("/hospedagem/notificacoes")
	public String notificacoes(Model model, HttpSession session) {
		
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		CandidatoVagaDao dao = new CandidatoVagaDao();
		List<CandidatoVaga> listaAplicadas = dao.listarAplicadas(usuario.getId());
		List<CandidatoVaga>  listaRecebidas = dao.listaRecebidas(usuario.getId());
		
		model.addAttribute("recebidas", listaRecebidas);
		model.addAttribute("aplicadas", listaAplicadas);
		return "hospedagem/notificacoes";

	}
	
	@RequestMapping("/hospedagem/aceitar")
	public String aceitar( @RequestParam("id") int candidatoId) {
		CandidatoVagaDao dao = new CandidatoVagaDao();
		
		CandidatoVaga candidato = dao.buscarPorId(candidatoId);
		candidato.setSituacao('2');
		dao.alterar(candidato);
		
		return "foward:notificacoes";
	}
}
