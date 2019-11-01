package br.com.ifpe.viajalheira.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
import br.com.ifpe.viajalheira.model.VagaHospedagem;
import br.com.ifpe.viajalheira.model.VagaHospedagemDao;
import br.com.ifpe.viajalheira.util.Criptografia;
import br.com.ifpe.viajalheira.util.Util;

/*@author Maria Beatriz Germano
 * 
 * Classe controladora referente as ações de usuário
 * */
@Controller
public class UsuarioController {

	@RequestMapping("home")
	public String home(Model model) {
		TipoVagaDao daoTipoVaga = new TipoVagaDao();
		List<TipoVaga> listaTipoVaga = daoTipoVaga.listar(null);
		model.addAttribute("listaTipoVaga", listaTipoVaga);

		VagaHospedagemDao dao = new VagaHospedagemDao();
		List<VagaHospedagem> listaHospedagem = dao.listar();
		model.addAttribute("listaHospedagem", listaHospedagem);
		return "home";
	}

	@RequestMapping("login")
	public String login(Usuario usuario, BindingResult result, HttpSession session, Model model) {
		try {

			String retorno = "";
			UsuarioDao dao = new UsuarioDao();
			usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
			Usuario usuarioLogado = dao.buscarUsuario(usuario);

			if (usuarioLogado != null) {
				session.setAttribute("usuarioLogado", usuarioLogado);
				retorno = home(model);

			} else {
				model.addAttribute("msg", "Email ou Senha incorretos. <br/>Tente novamente.");
				retorno = "index";
			}

		} catch (Exception e) {
			model.addAttribute("mensagemErrologin", "Sistema Indisponivel no momento, tente novamente mais tarde.");
		}

		return "forward:/home";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "forward:/home";
	}

	@RequestMapping("perfil")
	public String visu(Model model, HttpSession session, @RequestParam("id") int id) {
		try {
			Usuario usu = new Usuario();
			UsuarioDao dao = new UsuarioDao();
			usu = dao.buscarPorId(id);
			IdiomaUsuario idi = new IdiomaUsuario();
			idi.setUsuario(usu);
			IdiomaUsuarioDao a = new IdiomaUsuarioDao();
			List<IdiomaUsuario> lis = a.listar(idi);
			model.addAttribute("lis", lis);
			model.addAttribute("usuario", usu);

		} catch (Exception e) {
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
		}
		return "usuario/visualizarPerfil";
	}

	@RequestMapping("alterar")
	public String alter(Model model, Model model1, HttpSession session, @RequestParam("id") int id) {
		try {
			Usuario usu = new Usuario();
			UsuarioDao dao = new UsuarioDao();
			usu = dao.buscarPorId1(id);
			model1.addAttribute("usuario", usu);
			IdiomaUsuario idi = new IdiomaUsuario();
			idi.setUsuario(usu);
			IdiomaUsuarioDao a = new IdiomaUsuarioDao();
			List<IdiomaUsuario> lis = a.listar(idi);
			model.addAttribute("lis", lis);
			IdiomaDao dao1 = new IdiomaDao();
			List<Idioma> listaIdiomas = dao1.listar(null);
			model1.addAttribute("listaIdiomas", listaIdiomas);

		} catch (Exception e) {
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
		}
		return "usuario/alterarPerfil";
	}

	@RequestMapping("/usuario/novoCadastro")
	public String novoCadastro(Model model) {

		try {

			IdiomaDao dao = new IdiomaDao();
			List<Idioma> listaIdiomas = dao.listar(null);
			model.addAttribute("listaIdiomas", listaIdiomas);

		} catch (Exception e) {
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
		}

		return "usuario/novoCadastro";
	}

	@RequestMapping("/usuario/save")
	public String cadastroEndereco(Model model, Endereco endereco,
			@RequestParam(value = "idioma", required = false) int[] idioma, Usuario usuario,
			@RequestParam("nascimento") String nasc) throws ParseException {
		SimpleDateFormat dataFormatada = new SimpleDateFormat("yyyy-MM-dd");
		try {

			Date data = dataFormatada.parse(nasc);
			usuario.setDataNascimento(data);
			EnderecoDao dao = new EnderecoDao();
			dao.salvar(endereco);
			usuario.setEndereco(endereco);

		} catch (Exception e) {
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
		}
		return cadastroUsuario(model, usuario, idioma);

	}

	public String cadastroUsuario(Model model, Usuario usuario, int[] idioma) {

		usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
		UsuarioDao dao = new UsuarioDao();
		dao.salvar(usuario);

		this.cadastroIdiomaUsuario(idioma, usuario);

		model.addAttribute("sucessoCadastro", "true");
		return "forward:novoCadastro";
	}

	private void cadastroIdiomaUsuario(int[] idIdioma, Usuario usuario) {

		IdiomaDao idiomaDao = new IdiomaDao();
		for (int id : idIdioma) {
			Idioma idioma = idiomaDao.buscarPorId(id);
			IdiomaUsuario idiomaUsuario = new IdiomaUsuario();
			IdiomaUsuarioDao dao = new IdiomaUsuarioDao();

			idiomaUsuario.setIdioma(idioma);
			idiomaUsuario.setUsuario(usuario);
			dao.salvar(idiomaUsuario);
		}
	}

	@RequestMapping("/usuario/edit")
	public String edit(@RequestParam("id") Integer id, Model model) {
		try {
			UsuarioDao dao = new UsuarioDao();
			Usuario usuarioed = dao.buscarPorId1(id);
			model.addAttribute("usuarioed", usuarioed);

		} catch (Exception e) {
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
		}
		return "usuario/alterarPerfil";
	}

	@RequestMapping("/usuario/update")
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

	@RequestMapping("alterarFoto")
	public String alterarFoto(@RequestParam("file") MultipartFile imagem, @RequestParam("idUsuario") int id,
			HttpSession session) {

		UsuarioDao dao = new UsuarioDao();
		Usuario usuario = dao.buscarPorId(id);
		String momento = Util.fazerUploadImagem(imagem);
		if (momento != null) {
			usuario.setImagem(momento + "_" + imagem.getOriginalFilename());
		}
		dao.alterar(usuario);
		session.setAttribute("usuarioLogado", usuario);

		return "forward:/home";
	}
	@RequestMapping("usuario/certificados")
	public String certificados() {

		return "usuario/certificados";
	}

	@RequestMapping("usuario/pacotes")
	public String pacotes() {

		return "usuario/pacotes";
	}
}
