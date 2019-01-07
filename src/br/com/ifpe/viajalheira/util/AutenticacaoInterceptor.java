package br.com.ifpe.viajalheira.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutenticacaoInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
			throws Exception {

		String uri = request.getRequestURI();
		if (uri.contains("bootstrap")|| uri.contains("css") || uri.contains("img") || uri.contains("js")
				|| uri.endsWith("viajalheira/") || uri.endsWith("login") || uri.endsWith("usuario/novoCadastro") || uri.endsWith("usuario/save") ) {
			return true;
		}
		if (request.getSession().getAttribute("usuarioLogado") != null) {
			return true;
		}

		response.sendRedirect("/viajalheira");
		return false;

	}
	
}
