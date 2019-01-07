package br.com.ifpe.viajalheira.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.viajalheira.model.Usuario;
import br.com.ifpe.viajalheira.model.UsuarioDao;

/*@author Maria Beatriz Germano
 * 
 * Classe converter referente a usuário
 * */
public class UsuarioConverter implements Converter<String,Usuario> {

	public Usuario convert(String id) {
		UsuarioDao dao = new UsuarioDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
