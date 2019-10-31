package br.com.ifpe.viajalheira.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Calendar;

import org.springframework.web.multipart.MultipartFile;

public class Util {
	public static String obterMomentoAtual() {
		Calendar c = Calendar.getInstance();
		int ano = c.get(Calendar.YEAR);
		int mes = c.get(Calendar.MONTH);
		int dia = c.get(Calendar.DAY_OF_MONTH);
		int hora = c.get(Calendar.HOUR_OF_DAY);
		int minuto = c.get(Calendar.MINUTE);
		int segundo = c.get(Calendar.SECOND);
		String momentoUpload = ano +"-"+ (mes+1) +"-"+ dia + "-" + hora +"-"+ minuto +"-"+ segundo;
		return momentoUpload;
		}
	public static String fazerUploadImagem(MultipartFile imagem) {
		String momentoAtual = null;
		if (!imagem.isEmpty()) {
		String nomeArquivo = imagem.getOriginalFilename();
		try {
		// Criando o diretório para armazenar o arquivo
			
		String workspaceProjeto = "/home/mabi/git/Viajalheira";
		File dir = new File(workspaceProjeto + "/WebContent/resources/img");
		if (!dir.exists()) {
		dir.mkdirs();
		}
		// Criando o arquivo no diretório
		momentoAtual = obterMomentoAtual(); 
		File serverFile = new File(dir.getAbsolutePath() + File. separator + momentoAtual + "_" + nomeArquivo);
		BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
		stream.write(imagem.getBytes());
		stream.close();
		System.out.println("Arquivo armazenado em:" + serverFile.getAbsolutePath());
		System.out.println("Você fez o upload do arquivo " + nomeArquivo + " com sucesso");
		} catch (Exception e) {
		System.out.println("Você falhou em carregar o arquivo " + nomeArquivo + " => " + e.getMessage());
		}
		} else {
		System.out.println("Você falhou em carregar o arquivo porque ele está vazio ");
		}
		return momentoAtual;
		}
}
