package br.com.ifpe.viajalheira.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.viajalheira.model.VagaHospedagem;
import br.com.ifpe.viajalheira.model.VagaHospedagemDao;

public class VagaHospedagemConverter implements Converter<String,VagaHospedagem> {

	
	public VagaHospedagem convert(String id) {
		VagaHospedagemDao dao = new VagaHospedagemDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
