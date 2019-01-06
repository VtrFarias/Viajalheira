package br.com.ifpe.viajalheira.converters;

import br.com.ifpe.viajalheira.model.Idioma;
import br.com.ifpe.viajalheira.model.IdiomaDao;

public class IdiomaConverter {

	public Idioma convert(String id) {
		IdiomaDao dao = new IdiomaDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
