package br.com.ifpe.viajalheira.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.viajalheira.model.VagaBeneficio;
import br.com.ifpe.viajalheira.model.VagaBeneficioDao;

/*@author Maria Beatriz Germano
 * 
 * Classe converter referente a VagaBeneficio
 * */
public class VagaBeneficioConverter implements Converter<String,VagaBeneficio>{

	public VagaBeneficio convert(String id) {
		VagaBeneficioDao dao = new VagaBeneficioDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
