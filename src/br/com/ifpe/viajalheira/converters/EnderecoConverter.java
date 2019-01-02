package br.com.ifpe.viajalheira.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.viajalheira.model.Endereco;
import br.com.ifpe.viajalheira.model.EnderecoDao;

public class EnderecoConverter implements Converter<String, Endereco> {

	public Endereco convert(String id) {
		EnderecoDao dao = new EnderecoDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
