<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>Viajalheira</title>
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Material Design Lite">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" id="bootstrap-css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/googleFonts.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/css/material.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/menu.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
<script type="text/javascript">
	function enable(div, div1) {
		document.getElementById(div).style.display = "none";
		document.getElementById(div1).style.display = "block";
	}
</script>
<style>
</style>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../comum/menu.jsp"></c:import>


	<form role="form" id="form" action="alter" method="post">
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Dados Pessoais</h4>
						<hr />


						<!-- Primeira linha -->
						<input type="hidden" value="${usuarioLogado.id}" name="id">
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="nome">Nome*</label> <input
									type="text" id="nome" name="nome" class="form-control"
									value="${usuarioLogado.nome }" required>
							</div>

							<div class="col form-group float-label-control">
								<label class="label-input" for="cpfCnpj">CPF/CNPJ*</label> <input
									type="text" id="cpfCnpj" name="cpfCnpj" maxlength="14"
									class="form-control" value="${usuarioLogado.cpfCnpj}" required>
							</div>
						</div>

						<!-- Segunda linha -->
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="email">Email*</label> <input
									type="email" id="email" value="${usuarioLogado.email }"
									name="email" class="form-control" required>
							</div>
						</div>
						<!-- Terceira linha -->



						<!-- Quarta linha -->
						<div class="form-group">
							<label class="label-titulo" for="sexo">Sexo*</label> <select
								class="form-control" id="sexo" name="sexo" required>
								<option>Selecione...</option>
								<option value="Feminino" <c:if test="${usuarioLogado.sexo eq 'Feminino' }"> selected="selected" </c:if> >Feminino</option>
								<option value="Masculino" <c:if test="${usuarioLogado.sexo eq 'Masculino' }"> selected="selected" </c:if> >Masculino</option>
								<option value="outros">Outros</option>
							</select>
						</div>


						<label class="label-titulo">Idiomas</label>
						<!-- Quinta linha -->
						<div class="row">
							<div class="mdl-grid">
								<c:forEach var="idioma" items="${listaIdiomas}">

									<div class="mdl-cell mdl-cell--4-col graybox">
										<label class="mdl-checkbox  mdl-js-checkbox theme--light"
											for="${idioma.descricao}"> <input type="checkbox"
											name="idioma" id="${idioma.descricao}"
											class="mdl-checkbox__input"
											<c:forEach var="idiomaUsuario" items="${lis}">
												<c:if test="${idiomaUsuario.idioma.id eq idioma.id }">checked</c:if>
												</c:forEach>>
											<span class="mdl-checkbox__label">${idioma.descricao}</span>
										</label>
									</div>

								</c:forEach>


							</div>
						</div>
						<!-- Sexta linha -->
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="inputDescricao">Descrição</label>
								<textarea class="form-control" id="inputDescricao"
									name="descricaoPerfil"
									placeholder="Fale um pouco sobre você..." rows="1">${usuarioLogado.descricaoPerfil}</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Endereço</h4>
						<hr />

						<!-- Primeira linha -->
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="rua">Rua*</label> <input
									type="text" id="rua" name="rua"
									value="${usuarioLogado.endereco.rua }" class="form-control"
									required>
							</div>

							<div class="col form-group float-label-control">
								<label class="label-input" for="numero">Número*</label> <input
									type="text" id="numero" name="numerocasa"
									value="${usuarioLogado.endereco.numerocasa}"
									class="form-control" required>
							</div>
						</div>

						<!-- Segunda linha -->
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="complemento">Complemento</label>
								<input type="text" id="complemento"
									value="${usuarioLogado.endereco.complemento }"
									name="complemento" class="form-control">
							</div>

							<div class="col form-group float-label-control">
								<label class="label-input" for="bairro">Bairro*</label> <input
									type="text" id="bairro" name="bairro" class="form-control"
									value="${usuarioLogado.endereco.bairro }" required>
							</div>

						</div>
						<!-- Terceira linha -->
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="cidade">Cidade*</label> <input
									type="text" id="cidade" name="cidade" class="form-control"
									value="${usuarioLogado.endereco.cidade }" required>
							</div>


							<div class="col form-group float-label-control">
								<label class="label-input" for="estado">Estado*</label> <input
									type="text" id="estado" name="estado" class="form-control"
									value="${usuarioLogado.endereco.estado }" required>
							</div>

						</div>


						<!-- Quarta linha -->
						<div class="form-group">
							<label class="label-titulo" for="pais">País*</label> <select
								class="form-control" id="pais" name="pais" required>
								<option>Selecione...</option>

								<option value="Brasil"
									<c:if test="${usuarioLogado.endereco.pais eq 'Brasil'}"> selected="selected"
								</c:if> 
								>Brasil</option>
								<option value="Chile"
								<c:if test="${usuarioLogado.endereco.pais eq 'Chile'}"> selected="selected"
								</c:if>
								>Chile</option>
								<option value="Argentina" 
								<c:if test="${usuarioLogado.endereco.pais eq 'Argentina'}"> selected="selected"
								</c:if>
								>Argentina</option>
							</select>
						</div>

					</div>
				</div>

				<div class="text-right">
					<br>
					<button
						class="mdl-button mdl-button--colored mdl-button--raised mdl-js-button mdl-js-ripple-effect"
						type="submit">Enviar</button>

				</div>
			</div>
		</div>


	</form>


</body>
</html>