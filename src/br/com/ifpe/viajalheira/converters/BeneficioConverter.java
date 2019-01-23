package br.com.ifpe.viajalheira.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.viajalheira.model.Beneficio;
import br.com.ifpe.viajalheira.model.BeneficioDao;

public class BeneficioConverter implements Converter<String,Beneficio> {

	public Beneficio convert(String id) {
		BeneficioDao dao = new BeneficioDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
