package br.com.ifpe.viajalheira.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.ifpe.viajalheira.model.Beneficio;
import br.com.ifpe.viajalheira.model.BeneficioDao;
import br.com.ifpe.viajalheira.model.CandidatoVaga;
import br.com.ifpe.viajalheira.model.CandidatoVagaDao;
import br.com.ifpe.viajalheira.model.Endereco;
import br.com.ifpe.viajalheira.model.EnderecoDao;
import br.com.ifpe.viajalheira.model.Imagens;
import br.com.ifpe.viajalheira.model.ImagensDao;
import br.com.ifpe.viajalheira.model.TipoVaga;
import br.com.ifpe.viajalheira.model.TipoVagaDao;
import br.com.ifpe.viajalheira.model.Usuario;
import br.com.ifpe.viajalheira.model.UsuarioDao;
import br.com.ifpe.viajalheira.model.VagaBeneficio;
import br.com.ifpe.viajalheira.model.VagaBeneficioDao;
import br.com.ifpe.viajalheira.model.VagaHospedagem;
import br.com.ifpe.viajalheira.model.VagaHospedagemDao;
import br.com.ifpe.viajalheira.util.Util;

@Controller
public class HospedagemController {

	@Autowired
	UsuarioController usuarioController;
	
	
	@RequestMapping("/hospedagem/novoCadastro")
	public String novoCadastro(Model model) {
		try {
		TipoVagaDao dao = new TipoVagaDao();
		List<TipoVaga> listaTipoVaga = dao.listar(null);
		
		BeneficioDao beneficioDao = new BeneficioDao();
		List<Beneficio> listaBeneficio = beneficioDao.listar(null);
		
		model.addAttribute("listaTipoVaga", listaTipoVaga);
		model.addAttribute("listaBeneficio", listaBeneficio);
		
		}catch(Exception e){
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
}
		
		return "hospedagem/novaHospedagem";
	}
	

	@RequestMapping("/hospedagem/save")
	public String cadastrarEndereco1(Model model, HttpServletRequest request, Endereco endereco, 
			@RequestParam("tipovaga") int tipoVaga, @RequestParam(value = "beneficio", required = false)int [] beneficio, 
			VagaHospedagem vaga, @RequestParam("file")List <MultipartFile>  fotos) {
		try {
		
		EnderecoDao dao = new EnderecoDao();
		dao.salvar(endereco);
		vaga.setEndereco(endereco);
		
		}catch(Exception e){
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
}
		return cadastrarVaga1(model, vaga, beneficio, tipoVaga, request, fotos);
	}
	public String cadastrarVaga1(Model model,VagaHospedagem vaga, int [] beneficio, int tipoVaga, HttpServletRequest request, List<MultipartFile> fotos) {

		Usuario usu = (Usuario) request.getSession().getAttribute("usuarioLogado");
		TipoVagaDao tipo = new TipoVagaDao();
		TipoVaga tipov = tipo.buscarPorId(tipoVaga);
		vaga.setUsuario(usu);
		vaga.setTipoVaga(tipov);
		vaga.setSituacao('1');
		VagaHospedagemDao dao = new VagaHospedagemDao();
		dao.salvar(vaga);
		//salvar imagens
		
		ImagensDao dao1 = new ImagensDao();
		for(MultipartFile foto: fotos) {
			Imagens imagem = new Imagens();
			if (Util.fazerUploadImagem(foto)) {
				System.out.println(Util.obterMomentoAtual()+" - "+foto.getOriginalFilename());
				imagem.setDescricao(Util.obterMomentoAtual()+" - "+foto.getOriginalFilename());
				imagem.setVaga(vaga);
				dao1.salvar(imagem);
				if(fotos.indexOf(foto)==0) {
					vaga.setImagem(imagem);
					dao.alterar(vaga);
				}
			}
		}
		return cadastrarVagaBeneficio1(model, vaga, beneficio);
	}
	public String cadastrarVagaBeneficio1(Model model, VagaHospedagem vaga,int [] beneficio) {
		BeneficioDao ben = new BeneficioDao();
		VagaBeneficioDao dao = new VagaBeneficioDao();
		for (int id : beneficio) {
			Beneficio Beneficio = ben.buscarPorId(id);
			VagaBeneficio vagaBeneficio = new VagaBeneficio();
			vagaBeneficio.setVaga(vaga);
			vagaBeneficio.setBeneficio(Beneficio);
			dao.salvar(vagaBeneficio);
		}
		return usuarioController.home(model);

	}
	
	@RequestMapping("/hospedagem/filter")
	public String filtrarHospedagem(VagaHospedagem hospedagem,@RequestParam("tipovaga") int tipoVaga, Model model) {

		if(tipoVaga > 0) {
			TipoVagaDao tipo = new TipoVagaDao();
			TipoVaga tipov = tipo.buscarPorId(tipoVaga);
			hospedagem.setTipoVaga(tipov);
		}else if(tipoVaga == 0) {
			TipoVaga tipov = new TipoVaga();
			tipov.setDescricao("");
			hospedagem.setTipoVaga(tipov);
		}
		
		TipoVagaDao daoTipoVaga = new TipoVagaDao();
		List<TipoVaga> listaTipoVaga = daoTipoVaga.listar(null);
		model.addAttribute("listaTipoVaga", listaTipoVaga);
		
		VagaHospedagemDao dao = new VagaHospedagemDao();
		List<VagaHospedagem> listaHospedagem = dao.listar(hospedagem);
		model.addAttribute("listaHospedagem", listaHospedagem);
		return "home";
	}
	
	@RequestMapping("hospedagem/visualizar")
	public String visualizar(@RequestParam("id") int id, Model model) {
		try {
		VagaHospedagemDao dao = new VagaHospedagemDao();
		VagaHospedagem vaga = dao.buscarPorId(id);
		model.addAttribute("vagaHospedagem", vaga);
		ImagensDao img = new ImagensDao();
		List<Imagens> lista = img.buscarPorIdd(id);
		VagaBeneficioDao ben = new VagaBeneficioDao();
		VagaBeneficio vag = new VagaBeneficio();
		vag.setVaga(vaga);
		List<VagaBeneficio> listaben = ben.listar(vag);
		model.addAttribute("listaBeneficios", listaben);
		for(VagaBeneficio vagab :listaben) {
			System.out.println(vagab.getBeneficio().getDescricao());
		}
		model.addAttribute("fotos", lista);
		model.addAttribute("tamanho", lista.size());
		
		
}catch(Exception e){
			model.addAttribute("mensagemErro", "Ocorreu um erro tente novamente mais tarde");
}	
		return "hospedagem/visualizar";
	}
	
	
}
