<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"
	content="A front-end template that helps you build fast, modern mobile web apps.">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>Viajalheira</title>
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Material Design Lite">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" id="bootstrap-css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/googleFonts.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/validacao.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/alerts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/sweetalert.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/validinclusaonovahospe.js"></script>
</head>
<body>
	<c:import url="../comum/menu.jsp"></c:import>
	<form id="formulariohos" action="update" method="post" onsubmit="cadastroComSucesso()" enctype="multipart/form-data">
		<div class="row">

			<div class="col">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Dados Hospedagem</h4>
						<hr />
						
						<!-- Primeira linha -->
						<div class="row">

							<div class="col form-group float-label-control">
								<label class="label-input" for="titulo">
									Titulo*
								</label> 
								<input type="text" id="titulo" value="${vagaHospedagem.titulo}" name="titulo" class="form-control">
							</div>
						</div>
						

						<!-- Segunda linha -->
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="descricao">
									Descrição Da vaga*
								</label> 
								<input type="text" id="descricao" value="${vagaHospedagem.descricao}"name="descricao" class="form-control" >
							</div>
						</div>
						
						
						<div class="row">
						
							<div class=" col form-group">
								<label class="label-titulo" for="tipovaga">Tipo da vaga*</label>
								
								<select class="form-control" id="tipovaga" name="tipovaga">
									<option></option>
									<option>Selecione..</option>
								<c:forEach var="tipoVaga" items="${listaTipoVaga}">
									<option value="${tipoVaga.id}">${tipoVaga.descricao}</option>
								</c:forEach>
								</select>
							</div>
						
						</div>
						
						<fieldset>
		                 	<label class="label-titulo">Beneficios*</label>
		                 	<label for="beneficio" class="error"></label>
			    			 <!-- Quinta linha -->
			                  <div class="row">
								<div class = "mdl-grid">
				                <c:forEach var="beneficio" items="${listaBeneficio}">
									<div class = "mdl-cell mdl-cell--4-col graybox">
										<label for="${beneficio.descricao}">
											<input type="checkbox" class="checkbox" id="${beneficio.descricao}" value="${beneficio.id}" name="beneficio" minlength="1">
											<span class="mdl-checkbox__input"> ${beneficio.descricao}</span>
										</label>
									</div>
								</c:forEach>
									                   
			                 </div>
		                  </div>
						</fieldset>

						<!-- Quarta linha -->
						<div class="row">
							<p class="col-lg-12" id="msgerror"></p>
							<div class="col form-group float-label-control">
								<label class="label-input" for="tempoMinimoSemanas">Tempo mínimo em
									Semanas*</label> 
								<select class="form-control" id="tempoMinimoSemanas" name="tempoMinimoSemanas" >
									<option></option>
									<option value="2">2 Semanas</option>
									<option value="3">3 Semanas</option>
									<option value="4">4 Semanas</option>
									<option value="5">5 Semanas</option>
									<option value="6">6 Semanas</option>
									<option value="7">7 Semanas</option>
									<option value="8">8 Semanas</option>
									<option value="9">9 Semanas</option>
									<option value="10">10 Semanas</option>
									<option value="11">11 Semanas</option>
									<option value="12">12 Semanas</option>
								</select>
							</div>
							<div class="col form-group float-label-control">
								<label class="label-input" for="tempoMaximoSemanas">Tempo maximo em
									Semanas*</label>
								<select class="form-control" id="tempoMaximoSemanas" name="tempoMaximoSemanas" >
									<option></option>
									<option value="2">2 Semanas</option>
									<option value="3">3 Semanas</option>
									<option value="4">4 Semanas</option>
									<option value="5">5 Semanas</option>
									<option value="6">6 Semanas</option>
									<option value="7">7 Semanas</option>
									<option value="8">8 Semanas</option>
									<option value="9">9 Semanas</option>
									<option value="10">10 Semanas</option>
									<option value="11">11 Semanas</option>
									<option value="12">12 Semanas</option>
								</select>
							</div>
							<div class="col form-group float-label-control">
								<label class="label-input" for="horasTrabalhoSemanal">Horas de Trabalho Semanal*</label> <input type="text" id="horasTrabalhoSemanal"
									name="horasTrabalhoSemanal" class="form-control" >
							</div>

						</div>


						<p>Imagem:</p>
						<!-- Quinta linha -->
						<div class="row">
							<div class="col">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="customFile" name="file" multiple>
									<label class="custom-file-label" for="customFile">Imagem</label>
								</div>
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
								<label class="label-input" for="rua">Rua*</label> 
								<input type="text" id="rua" value="${vagaHospedagem.endereco.rua}" name="rua" class="form-control" >
							</div>

							<div class="col form-group float-label-control">
								<label class="label-input" for="numeroho">Número*</label> 
								<input type="text" id="numero" value="${vagaHospedagem.endereco.numero}" name="numerocasa" class="form-control">
							</div>
						</div>

						<!-- Segunda linha -->
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="complemento">Complemento*</label>
								<input type="text" id="complemento" name="complemento"
									value="${vagaHospedagem.endereco.complemento}" class="form-control">
							</div>

							<div class="col form-group float-label-control">
								<label class="label-input" for="bairro">Bairro*</label> 
								<input type="text" id="bairro" value="${vagaHospedagem.endereco.bairro}" name="bairro" class="form-control">
							</div>

						</div>
						<!-- Terceira linha -->
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="cidade">Cidade*</label> 
								<input type="text" id="cidade" value="${vagaHospedagem.endereco.cidade}" name="cidade" class="form-control">
							</div>


							<div class="col form-group float-label-control">
								<label class="label-input" for="estado">Estado*</label> 
								<input type="text" id="estado" value="${vagaHospedagem.endereco.estado}" name="estado" class="form-control">
							</div>

						</div>


						<!-- Quarta linha -->
						<div class="form-group">
							<label class="label-titulo" for="pais">País*</label> 
							<select class="form-control" id="pais" name="pais" >
								<option></option>
								<option>Brasil</option>
								<option>Chile</option>
								<option>Argentina</option>
							</select>
						</div>

					</div>
				</div>

				<div class="text-right">
					<br>
					<button id="enviarForm"
						class="mdl-button mdl-button--colored mdl-button--raised mdl-js-button mdl-js-ripple-effect"
						type="submit">Enviar</button>

				</div>
			</div>
		</div>

	</form>

</body>
</html>
