package br.com.ifpe.viajalheira.converters;

import br.com.ifpe.viajalheira.model.Idioma;
import br.com.ifpe.viajalheira.model.IdiomaDao;

/*@author Maria Beatriz Germano
 * 
 * Classe converter referente a idioma
 * */
public class IdiomaConverter {

	public Idioma convert(String id) {
		IdiomaDao dao = new IdiomaDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
