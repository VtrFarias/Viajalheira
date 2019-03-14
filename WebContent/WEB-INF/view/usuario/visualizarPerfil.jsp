<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/paginaPerfil.css" id="" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function enable() {
		document.getElementById("FotoPerfil").style.display = "none";
		document.getElementById("FormFoto").style.display = "block";
	}
	function disable() {
		document.getElementById("FormFoto").style.display = "none";
		document.getElementById("FotoPerfil").style.display = "block";
	}
</script>
<style>

</style>
<title>Viajalheira-Perfil</title>
</head>
<body>
	<c:import url="../comum/menu.jsp"></c:import>
	<div class="row" id="lin">
		<div class="col">
			<div class="card">
				<div class="card-body">
					<div class="row">
						
						<div class="col-md-3" id="das">
						<div id="FotoPerfil">
							<c:choose>
								<c:when test="${not empty usuario.imagem}">
									<img src="<%=request.getContextPath()%>/resources/img/${usuario.imagem}" class="can" alt="...">
									<c:choose>
										<c:when test="${usuarioLogado.id eq usuario.id}">
											<button onclick="enable()" class="mdl-button mdl-button--colored">Alterar Foto</button>
										</c:when>
									</c:choose>
								</c:when>
								<c:otherwise>
									<img src="<%=request.getContextPath()%>/resources/img/avatar.jpg" class="can" alt="..." id="FotoPerfil">
									<c:choose>
										<c:when test="${usuarioLogado.id eq usuario.id}">
											<button onclick="enable()" class="mdl-button mdl-button--colored">Alterar Foto</button>
										</c:when>
									</c:choose>
									
								</c:otherwise>
							</c:choose>
							</div>
							<div style="display: none;" id="FormFoto" >
									<form action="/viajalheira/alterarFoto" method="post" enctype="multipart/form-data" >
									<div id="fotoalterar"><input type="hidden" value="${usuario.id}" name="idUsuario"></div>
										
										<h5>Adicionar Foto</h5>
											<div class="custom-file">
											<input type="file" class="custom-file-input" id="customFile" name="file">
											<label class="custom-file-label" for="customFile">Imagem</label>
											</div>
											<input type="submit" class="mdl-button mdl-button--colored mdl-button--raised mdl-js-button mdl-js-ripple-effect" value="Enviar">
									</form>
									<button onclick="disable()" class="mdl-button mdl-button--colored">Cancelar</button>
							
							</div>
							<p class="textos" id="textos1">
								<em>"${usuario.descricaoPerfil }"</em>
							</p>
						</div>
						

						<div class="col-md-6" id="center">
							<h3 class="card-title">${usuario.nome}</h3>
							<div class="row data">
								<div class="col-md-2">
									<p>
										<strong>Email:</strong>
									</p>
								</div>
								<div class="col">
									<p class="textos">${usuario.email }</p>
								</div>

							</div>
							<div class="row data">
								<div class="col-md-2">
									<p>
										<strong>Idade: </strong>
									</p>
								</div>
								<div class="col">
									<p class="textos" id="dataNascimento"></p>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<h5>Idiomas</h5>
									<ul>
									<c:forEach var="idiomaUsuario" items="${lis}">
										<li>${idiomaUsuario.idioma.descricao}</li>
									</c:forEach>
									</ul>
								</div>

							</div>
						</div>
						<div class="col" id="end">
							<h5 class="titr">Endereço</h5>
							<p>
								<strong>País: </strong>${usuario.endereco.pais }</p>
							<p>
								<strong>Estado: </strong>${usuario.endereco.estado }</p>
							<p>
								<strong>Cidade: </strong>${usuario.endereco.cidade }</p>
						</div>

					</div>
					<c:choose>
						<c:when test="${usuarioLogado.id eq usuario.id}"><a class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" href="alterar?id=${usuario.id}"> Alterar dados</a>
						</c:when>
					</c:choose>
				</div>
				
			</div>
			
		</div>
		
	</div>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/idade.js"></script>
	<script>
		var dataString = "${usuario.dataNascimento}";
		dataString = dataString.substring(0,10);
		dataString = dataString.split("-");
		
		var idade = idade(dataString[0],dataString[1],dataString[2]);

		$("#dataNascimento").html(idade+" anos");
	</script>	
</body>
</html>
