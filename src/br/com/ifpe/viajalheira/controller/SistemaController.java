package br.com.ifpe.viajalheira.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SistemaController {
	@RequestMapping("ola")
	public String olaMundo() {
		return "Home";
	}

}
