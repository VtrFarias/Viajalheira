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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/paginaPerfil.css" id="" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
<script type="text/javascript">
	function enable(div, div1) {
		document.getElementById(div).style.display = "none";
		document.getElementById(div1).style.display = "block";
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
							<img
								src="https://www.urbanarts.com.br/imagens/produtos/110915/0/Ampliada/mulher-maravilha-simbolo.jpg"
								class="can" alt="...">
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
									<p class="textos">X anos.</p>
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
					<c:choose><c:when test="${usuarioLogado.id eq usuario.id}"><a class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" href="alterar?id=${usuario.id}"> Alterar dados</a></c:when></c:choose>
				</div>
				
			</div>
			
		</div>
		
	</div>
</body>
</html>
