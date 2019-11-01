package br.com.ifpe.viajalheira.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.ifpe.viajalheira.model.Beneficio;
import br.com.ifpe.viajalheira.model.BeneficioDao;
import br.com.ifpe.viajalheira.model.Endereco;
import br.com.ifpe.viajalheira.model.EnderecoDao;
import br.com.ifpe.viajalheira.model.Idioma;
import br.com.ifpe.viajalheira.model.IdiomaDao;
import br.com.ifpe.viajalheira.model.IdiomaUsuario;
import br.com.ifpe.viajalheira.model.IdiomaUsuarioDao;
import br.com.ifpe.viajalheira.model.Imagens;
import br.com.ifpe.viajalheira.model.ImagensDao;
import br.com.ifpe.viajalheira.model.TipoVaga;
import br.com.ifpe.viajalheira.model.TipoVagaDao;
import br.com.ifpe.viajalheira.model.Usuario;
import br.com.ifpe.viajalheira.model.UsuarioDao;
import br.com.ifpe.viajalheira.model.VagaBeneficio;
import br.com.ifpe.viajalheira.model.VagaBeneficioDao;
import br.com.ifpe.viajalheira.model.VagaHospedagem;
import br.com.ifpe.viajalheira.model.VagaHospedagemDao;
import br.com.ifpe.viajalheira.util.Util;

@Controller
public class HospedagemController {

	@Autowired
	UsuarioController usuarioController;

	@RequestMapping("/hospedagem/novoCadastro")
	public String novoCadastro(Model model) {
		try {
			TipoVagaDao dao = new TipoVagaDao();
			List<TipoVaga> listaTipoVaga = dao.listar(null);

			BeneficioDao beneficioDao = new BeneficioDao();
			List<Beneficio> listaBeneficio = beneficioDao.listar(null);

			model.addAttribute("listaTipoVaga", listaTipoVaga);
			model.addAttribute("listaBeneficio", listaBeneficio);

		} catch (Exception e) {
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
		}

		return "hospedagem/novaHospedagem";
	}

	@RequestMapping("/hospedagem/save")
	public String cadastrarEndereco1(Model model, HttpServletRequest request, Endereco endereco,
			@RequestParam("tipovaga") int tipoVaga,
			@RequestParam(value = "beneficio", required = false) int[] beneficio, VagaHospedagem vaga,
			@RequestParam("file") List<MultipartFile> fotos) {
		try {

			EnderecoDao dao = new EnderecoDao();
			dao.salvar(endereco);
			vaga.setEndereco(endereco);

		} catch (Exception e) {
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
		}
		return cadastrarVaga1(model, vaga, beneficio, tipoVaga, request, fotos);
	}

	public String cadastrarVaga1(Model model, VagaHospedagem vaga, int[] beneficio, int tipoVaga,
			HttpServletRequest request, List<MultipartFile> fotos) {

		Usuario usu = (Usuario) request.getSession().getAttribute("usuarioLogado");
		TipoVagaDao tipo = new TipoVagaDao();
		TipoVaga tipov = tipo.buscarPorId(tipoVaga);
		vaga.setUsuario(usu);
		vaga.setTipoVaga(tipov);
		vaga.setSituacao('1');
		VagaHospedagemDao dao = new VagaHospedagemDao();
		dao.salvar(vaga);
		// salvar imagens
	
		ImagensDao dao1 = new ImagensDao();
		String momentoAtual = null;
		for (MultipartFile foto : fotos) {
			Imagens imagem = new Imagens();
			momentoAtual = Util.fazerUploadImagem(foto);
			if (momentoAtual != null) {
				System.out.println(momentoAtual + "_" + foto.getOriginalFilename());
				imagem.setDescricao(momentoAtual + "_" + foto.getOriginalFilename());
				imagem.setVaga(vaga);
				dao1.salvar(imagem);
				if (fotos.indexOf(foto) == 0) {
					vaga.setImagem(imagem);
					dao.alterar(vaga);
				}
			}
		}
		return cadastrarVagaBeneficio1(model, vaga, beneficio);
	}

	public String cadastrarVagaBeneficio1(Model model, VagaHospedagem vaga, int[] beneficio) {
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

	@RequestMapping("/hospedagem/filter")
	public String filtrarHospedagem(VagaHospedagem hospedagem, @RequestParam("tipovaga") int tipoVaga, Model model) {

		if (tipoVaga > 0) {
			TipoVagaDao tipo = new TipoVagaDao();
			TipoVaga tipov = tipo.buscarPorId(tipoVaga);
			hospedagem.setTipoVaga(tipov);
		} else if (tipoVaga == 0) {
			TipoVaga tipov = new TipoVaga();
			tipov.setDescricao("");
			hospedagem.setTipoVaga(tipov);
		}

		TipoVagaDao daoTipoVaga = new TipoVagaDao();
		List<TipoVaga> listaTipoVaga = daoTipoVaga.listar(null);
		model.addAttribute("listaTipoVaga", listaTipoVaga);

		VagaHospedagemDao dao = new VagaHospedagemDao();
		List<VagaHospedagem> listaHospedagem = dao.listar(hospedagem);
		model.addAttribute("listaHospedagem", listaHospedagem);
		return "home";
	}

	@RequestMapping("hospedagem/visualizar")
	public String visualizar(@RequestParam("id") int id, Model model) {
		try {
			VagaHospedagemDao dao = new VagaHospedagemDao();
			VagaHospedagem vaga = dao.buscarPorId(id);
			model.addAttribute("vagaHospedagem", vaga);
			ImagensDao img = new ImagensDao();
			List<Imagens> lista = img.buscarPorIdd(id);
			VagaBeneficioDao ben = new VagaBeneficioDao();
			VagaBeneficio vag = new VagaBeneficio();
			vag.setVaga(vaga);
			List<VagaBeneficio> listaben = ben.listar(vag);
			model.addAttribute("listaBeneficios", listaben);
			for (VagaBeneficio vagab : listaben) {
				System.out.println(vagab.getBeneficio().getDescricao());
			}
			model.addAttribute("fotos", lista);
			model.addAttribute("tamanho", lista.size());

		} catch (Exception e) {
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
		}
		return "hospedagem/visualizar";
	}

	@RequestMapping("hospedagem/alterar")
	public String visualizarAlterar(Model model, HttpSession session, @RequestParam("id") int id) {
		try {
			VagaHospedagem hospedagem = new VagaHospedagem();
			VagaHospedagemDao dao = new VagaHospedagemDao();
			hospedagem= dao.buscarPorId(id);
			
			TipoVagaDao tipoVagaDao = new TipoVagaDao();
			List<TipoVaga> listaTipoVaga = tipoVagaDao.listar(null);

			BeneficioDao beneficioDao = new BeneficioDao();
			List<Beneficio> listaBeneficio = beneficioDao.listar(null);

			model.addAttribute("listaTipoVaga", listaTipoVaga);
			model.addAttribute("listaBeneficio", listaBeneficio);
			model.addAttribute("vagaHospedagem", hospedagem);
			
		} catch (Exception e) {
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
		}
		return "hospedagem/alterarHospedagem";
	}
	
	@RequestMapping("/hospedagem/update")
	public String update(HttpSession session, HttpServletRequest request, Model model,
			@RequestParam("idendereco") int idEnd, Endereco endereco, Usuario usuario,
			@RequestParam(value = "idioma", required = false) int[] idioma, @RequestParam("nascimento") String nasc)
			throws ParseException {

		try {

			SimpleDateFormat dataFormatada = new SimpleDateFormat("yyyy-MM-dd");
			Date data = dataFormatada.parse(nasc);
			usuario.setDataNascimento(data);

			EnderecoDao dao = new EnderecoDao();
			endereco.setId(idEnd);
			dao.alterar(endereco);
			usuario.setEndereco(endereco);

			Usuario usu = (Usuario) request.getSession().getAttribute("usuarioLogado");
			IdiomaUsuarioDao daoIdioUsu = new IdiomaUsuarioDao();
			IdiomaUsuario idioUsu = new IdiomaUsuario();
			idioUsu.setUsuario(usu);
			List<IdiomaUsuario> listIdiomasUsuaforrio = daoIdioUsu.listar(idioUsu);
			for (IdiomaUsuario idiomaUsuario : listIdiomasUsuaforrio) {
				daoIdioUsu.remover(idiomaUsuario.getId());
			}
			IdiomaDao idiomaDao = new IdiomaDao();
			for (int id : idioma) {
				Idioma idio = idiomaDao.buscarPorId(id);
				IdiomaUsuario idiomaUsuario = new IdiomaUsuario();
				IdiomaUsuarioDao daoIdiomaUsuario = new IdiomaUsuarioDao();

				idiomaUsuario.setIdioma(idio);
				idiomaUsuario.setUsuario(usuario);
				daoIdiomaUsuario.salvar(idiomaUsuario);
			}

			UsuarioDao dao1 = new UsuarioDao();
			dao1.alterar1(usuario);
			session.setAttribute("usuarioLogado", usuario);
			model.addAttribute("mensagem", "Cadastro Alterado com Sucesso !");
			// this.alterarIdiomaUsuario(idioma, usuario);

		} catch (Exception e) {
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
		}

		return "forward:/home";
	}

}
