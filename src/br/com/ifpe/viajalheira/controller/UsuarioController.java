package br.com.ifpe.viajalheira.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.viajalheira.model.Endereco;
import br.com.ifpe.viajalheira.model.EnderecoDao;
import br.com.ifpe.viajalheira.model.Idioma;
import br.com.ifpe.viajalheira.model.IdiomaDao;
import br.com.ifpe.viajalheira.model.IdiomaUsuario;
import br.com.ifpe.viajalheira.model.Usuario;
import br.com.ifpe.viajalheira.model.UsuarioDao;

/*@author Maria Beatriz Germano
 * 
 * Classe controladora referente as ações de usuário
 * */
@Controller
public class UsuarioController {

	@RequestMapping("/usuario/novoCadastro")
	public String novoCadastro(Model model) {
		
		IdiomaDao dao = new IdiomaDao();
		List<Idioma> listaIdiomas = dao.listar(null);
		model.addAttribute("listaIdiomas", listaIdiomas);
		
		return "usuario/novoCadastro";
	}
	@RequestMapping("/usuario/save")
	public String cadastroEndereco(Endereco endereco, Idioma idioma, Usuario usuario) {
		
		EnderecoDao dao = new EnderecoDao();
		dao.salvar(endereco);
		usuario.setEndereco(endereco);

		return cadastroUsuario(usuario, idioma);
	}
	
	public String cadastroUsuario(Usuario usuario, Idioma idioma) {
		
		UsuarioDao dao = new UsuarioDao();
		dao.salvar(usuario);
		this.cadastroIdioma(idioma);
		return "usuario/cadastro";
	}

	private void cadastroIdioma(Idioma idioma) {
		IdiomaUsuario idiomaUsuario = new IdiomaUsuario();
	}
}