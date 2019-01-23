package br.com.ifpe.viajalheira.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.viajalheira.model.Imagens;
import br.com.ifpe.viajalheira.model.ImagensDao;

/*@author Maria Beatriz Germano
 * 
 * Classe converter referente a Imagens
 * */
public class ImagensConverter implements Converter<String,Imagens>{

	public Imagens convert(String id) {
		ImagensDao dao = new ImagensDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
