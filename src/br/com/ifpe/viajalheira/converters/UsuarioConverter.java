package br.com.ifpe.viajalheira.converters;

import br.com.ifpe.viajalheira.model.Usuario;
import br.com.ifpe.viajalheira.model.UsuarioDao;

public class UsuarioConverter {

	public Usuario convert(String id) {
		UsuarioDao dao = new UsuarioDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
