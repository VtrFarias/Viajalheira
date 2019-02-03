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
		return "forward:/home";
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

		return "forward:/home";
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
	public String edit(@RequestParam("id") Integer id, Model model){
		
		UsuarioDao dao = new UsuarioDao();
		Usuario usuario = dao.buscarPorId1(id);
		model.addAttribute("usuario", usuario);
		return "usuario/alterarusuario";
	}
	@RequestMapping("/usuario/update")
	public String update(Usuario usuario, Model model) {
	
		UsuarioDao dao = new UsuarioDao();
		dao.alterar1(usuario);
		model.addAttribute("mensagem", "Cadastro Alterado com Sucesso !");
		return "forward:list";
	}
	

}