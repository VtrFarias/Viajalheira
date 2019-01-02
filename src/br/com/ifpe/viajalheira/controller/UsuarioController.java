package br.com.ifpe.viajalheira.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.viajalheira.model.Endereco;
import br.com.ifpe.viajalheira.model.EnderecoDao;
import br.com.ifpe.viajalheira.model.Usuario;
import br.com.ifpe.viajalheira.model.UsuarioDao;

/*@author Maria Beatriz Germano
 * 
 * Classe controladora referente as ações de usuário
 * */
@Controller
public class UsuarioController {

	@RequestMapping("/usuario/novoCadastro")
	public String novoCadastro() {
		
		return "usuario/novoCadastro";
	}
	@RequestMapping("/usuario/save")
	public String cadastroEndereco(Endereco endereco, Usuario usuario) {
		
		EnderecoDao dao = new EnderecoDao();
		dao.salvar(endereco);
		usuario.setEndereco(endereco);

		return cadastroUsuario(usuario);
	}
	
	public String cadastroUsuario(Usuario usuario) {
		
		UsuarioDao dao = new UsuarioDao();
		dao.salvar(usuario);
		return "usuario/novoCadastro";
	}
}