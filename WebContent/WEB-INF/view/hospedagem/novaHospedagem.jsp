<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Viajalheira</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/googleFonts.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/menu.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sweetalert.css">

	
	<!-- Importando Bootstrap-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" id="bootstrap-css"/>
	

	
</head>
<body>
	<c:import url="../comum/menu.jsp"></c:import>
	<form role="form" id="formulario" action="save" method="post"
		onsubmit="cadastroComSucesso()">
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Dados Hospedagem</h4>
						<hr />


						<!-- Primeira linha -->
						<div class="row">
							<div class=" col form-group">
								<label class="label-titulo" for="tipoVaga">Tipo da vaga</label>
							
	              					<select class="form-control" id="tipoVaga" name="tipoVaga" required>
										<option>Selecione..</option>
									<c:forEach var="tipoVaga" items="${listaTipoVaga}">
										<option value="${tipoVaga.id}">${tipoVaga.descricao}</option>
									</c:forEach>

									</select>

								
								
							</div>

							<div class="col form-group float-label-control">
								<label class="label-input" for="titulo">Titulo</label> <input
									type="text" id="titulo" name="titulo" maxlength="14"
									class="form-control" required>
							</div>
						</div>

						<!-- Segunda linha -->
						<div class="row">
							<div class="col form-group float-label-control">
	                        	<label class="label-input" for="inputDescricao">Descrição</label>
	                        	<textarea class="form-control" id="inputDescricao" name="descricaoPerfil" placeholder="Quanto mais legal for, mais legal será..." rows="3"></textarea>
	                    	</div>
						</div>
					


						<!-- Quarta linha -->
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="senha">Tempo Mínimo em
									Semanas</label> <input type="text" id="situacao"
									name="tempoMinimoSemanas" class="form-control" required>
							</div>
							<div class="col form-group float-label-control">
								<label class="label-input" for="senha">Tempo Máximo em
									Semanas</label> <input type="text" id="situacao"
									name="tempoMaximoSemanas" class="form-control" required>
							</div>

						</div>


					<!-- 	<p>Imagem:</p>
						<div class="row">
							<div class="col">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="customFile">
									<label class="custom-file-label" for="customFile">Imagem</label>
								</div>
							</div>
						</div>  -->
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
									type="text" id="rua" name="rua" class="form-control" required>
							</div>

							<div class="col form-group float-label-control">
								<label class="label-input" for="numero">Número*</label> <input
									type="text" id="numero" name="numerocasa" class="form-control"
									required>
							</div>
						</div>

						<!-- Segunda linha -->
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="complemento">Complemento</label>
								<input type="text" id="complemento" name="complemento"
									class="form-control">
							</div>

							<div class="col form-group float-label-control">
								<label class="label-input" for="bairro">Bairro*</label> <input
									type="text" id="bairro" name="bairro" class="form-control"
									required>
							</div>

						</div>
						<!-- Terceira linha -->
						<div class="row">
							<div class="col form-group float-label-control">
								<label class="label-input" for="cidade">Cidade*</label> <input
									type="text" id="cidade" name="cidade" class="form-control"
									required>
							</div>


							<div class="col form-group float-label-control">
								<label class="label-input" for="estado">Estado*</label> <input
									type="text" id="estado" name="estado" class="form-control"
									required>
							</div>

						</div>


						<!-- Quarta linha -->
						<div class="form-group">
							<label class="label-titulo" for="pais">País*</label> <select
								class="form-control" id="pais" name="pais" required>
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


	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/material.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/alerts.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/sweetalert.js"></script>

</body>
</html>