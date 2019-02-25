package br.com.ifpe.viajalheira.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.viajalheira.model.CandidatoVaga;
import br.com.ifpe.viajalheira.model.CandidatoVagaDao;

public class CandidatoVagaConverter  implements Converter<String, CandidatoVaga>{

	public CandidatoVaga convert(String id) {
		CandidatoVagaDao dao = new CandidatoVagaDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
