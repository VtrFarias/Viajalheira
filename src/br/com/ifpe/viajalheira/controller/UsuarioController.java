package br.com.ifpe.viajalheira.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.viajalheira.model.Endereco;
import br.com.ifpe.viajalheira.model.EnderecoDao;
import br.com.ifpe.viajalheira.model.Idioma;
import br.com.ifpe.viajalheira.model.IdiomaDao;
import br.com.ifpe.viajalheira.model.IdiomaUsuario;
import br.com.ifpe.viajalheira.model.IdiomaUsuarioDao;
import br.com.ifpe.viajalheira.model.Usuario;
import br.com.ifpe.viajalheira.model.UsuarioDao;
import br.com.ifpe.viajalheira.util.Criptografia;

/*@author Maria Beatriz Germano
 * 
 * Classe controladora referente as ações de usuário
 * */
@Controller
public class UsuarioController {

	@RequestMapping("home")
	public String home() {

		return "home";
	}

	@RequestMapping("login")
	public String login(Usuario usuario, BindingResult result, HttpSession session, Model model) {

		String retorno = "";
		UsuarioDao dao = new UsuarioDao();
		usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
		Usuario usuarioLogado = dao.buscarUsuario(usuario);

		if (usuarioLogado != null) {
			session.setAttribute("usuarioLogado", usuarioLogado);
			retorno = "home";

		} else {
			model.addAttribute("msg", "Email ou Senha incorretos. <br/>Tente novamente.");
			retorno = "index";
		}
		return retorno;
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	@RequestMapping("visu")
	public String visu(Model model, Model model1,  HttpSession session) {
		Usuario usu = new Usuario();
		usu = (Usuario) session.getAttribute("usuarioLogado");
		System.out.println(usu.getCpfCnpj());
		IdiomaUsuario idi = new IdiomaUsuario();
		idi.setUsuario(usu);
		IdiomaUsuarioDao a = new IdiomaUsuarioDao();
		List<IdiomaUsuario> lis = a.listar(idi); 
		model.addAttribute("lis", lis);
		IdiomaDao dao = new IdiomaDao();
		List<Idioma> listaIdiomas = dao.listar(null);
		model1.addAttribute("listaIdiomas", listaIdiomas);
		return "usuario/visualizarPerfil";
	}

	@RequestMapping("/usuario/novoCadastro")
	public String novoCadastro(Model model) {

		IdiomaDao dao = new IdiomaDao();
		List<Idioma> listaIdiomas = dao.listar(null);
		model.addAttribute("listaIdiomas", listaIdiomas);
		
		return "usuario/novoCadastro";
	}

	@RequestMapping("/usuario/save")
	public String cadastroEndereco(Model model, Endereco endereco,
			@RequestParam(value = "idioma", required = false) int[] idioma, Usuario usuario) {

		EnderecoDao dao = new EnderecoDao();
		dao.salvar(endereco);
		usuario.setEndereco(endereco);
		
		return cadastroUsuario(model, usuario, idioma);
	}

	public String cadastroUsuario(Model model, Usuario usuario, int[] idioma) {

		usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
		UsuarioDao dao = new UsuarioDao();
		dao.salvar(usuario);

		this.cadastroIdiomaUsuario(idioma, usuario);

		return "index";
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

}