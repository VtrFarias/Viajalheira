package br.com.ifpe.viajalheira.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HospedagemController {
	@RequestMapping("CadastrarHospedagem")
	public String CadastrarHospedagem(){
		return "hospedagem/novaHospedagem";
	}

}
