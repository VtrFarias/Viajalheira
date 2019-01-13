package br.com.ifpe.viajalheira.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.viajalheira.model.TipoVaga;
import br.com.ifpe.viajalheira.model.TipoVagaDao;

public class TipoVagaConverter implements Converter<String,TipoVaga>  {

	public TipoVaga convert(String id) {
		TipoVagaDao dao = new TipoVagaDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
