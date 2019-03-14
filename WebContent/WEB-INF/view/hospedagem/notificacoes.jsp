<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>Viajalheira</title>
<meta name="mobile-web-app-capable" content="yes">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" id="bootstrap-css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/googleFonts.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/css/material.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/menu.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notificacao.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>



	<c:import url="../comum/menu.jsp"></c:import>
	
	<div class="row">
	<h5 class="title">Suas aplicações</h5>

	<c:choose>
 		<c:when test="${not empty aplicadas}">
 		
			 			
			<c:forEach var="vaga" items="${aplicadas}">
				<div class="notice notice-info">
					<div class="notice-header">
						<a href="/viajalheira/hospedagem/reverter?id=${vaga.id}">
							Excluir
						 <span class="glyphicon glyphicon-trash"></span>
						 </a>
					</div>
					<div class="notice-image">
						<div class="row">
						 
						  <div class="col-md-4 coluna-principal-1">
						  	<div>
						  		<c:if test="${not empty vaga.vagaHospedagem.imagem.descricao}">
						  			<img alt="" src="<%=request.getContextPath()%>/resources/img/${vaga.vagaHospedagem.imagem.descricao}">
						  		</c:if>
						  		<c:if test="${empty vaga.vagaHospedagem.imagem.descricao}">
						  			<img alt="" src="<%=request.getContextPath()%>/resources/img/hospedagemDefault.png">
						  		</c:if>
						  	</div>
							<div>
								<span><a href="/viajalheira/perfil?id=${vaga.vagaHospedagem.usuario.id}">Visitar perfil</a></span>
							</div>
						 
						  </div>
							  
						  <div class="col">
						 	
						  	<h4 class="title">${vaga.vagaHospedagem.titulo}</h4>
						  	
						  
							 <div class="row">
							 	<div class="col">
							 		<div>
							 			Data de ida: <fmt:formatDate value="${vaga.dataIda}" pattern="dd/MM/yyyy" />
							 		</div>
							 		<div>
							 			Data de volta: <fmt:formatDate value="${vaga.dataVolta}" pattern="dd/MM/yyyy" />
							 		</div>
							 	</div>
							 	
							 </div>
						</div>
								<div class="notice-footer">
								<fmt:parseNumber var="intValue" value="${vaga.situacao}"/>
								 	<c:choose>
								 		<c:when test="${intValue == 1}">
								 			<span>Status: Aguardando Confirmação</span>
								 			<a href="/viajalheira/hospedagem/reverter?id=${vaga.id}"><button class="mdl-button mdl-color-text--blue-500">Reverter</button></a>
								 		</c:when>
								 		<c:when test="${intValue == 2}">
								 			<a href="/viajalheira/hospedagem/reverter?id=${vaga.id}"><button class="mdl-button mdl-color-text--blue-500">Finalizar</button></a>
								 		</c:when>
								 		<c:when test="${intValue == 3}">
								 			<span>Recusado, provavelmente não disponivel na data solicitada!</span>
								 		</c:when>
								 		<c:when test="${intValue == 4}">
								 			<span>Esta vaga Foi finalizada</span>
								 		</c:when>
								 	</c:choose>
								 	
								 	

								 	
							 	
							 	</div>
						
						
					  </div>
						
					</div>
			    </div>
			    
			</c:forEach>
 		</c:when>
 		<c:otherwise>
 		<div class="notice">
 		
 			<h5>Voce ainda não aplicou para vagas</h5>
 		</div>
 		</c:otherwise>
 	</c:choose>
	
	</div>
	
	<div class="row">
	<h5>Aplicações para suas vagas</h5>

		
	<c:choose>
 		<c:when test="${not empty recebidas}">
 		
			 			
			<c:forEach var="vaga" items="${recebidas}">
				<div class="notice notice-success">
				<div class="notice-header">
					<a href="/viajalheira/hospedagem/reverter?id=${vaga.id}">
						Excluir
					 <span class="glyphicon glyphicon-trash"></span>
					 </a>
				</div>
					<div class="notice-image">
						<div class="row">
						 
						  <div class="col-md-4 coluna-principal-1">
						  	<div>
						  		<c:if test="${not empty vaga.vagaHospedagem.imagem.descricao}">
						  			<img alt="" src="<%=request.getContextPath()%>/resources/img/${vaga.vagaHospedagem.imagem.descricao}">
						  		</c:if>
						  		<c:if test="${empty vaga.vagaHospedagem.imagem.descricao}">
						  			<img alt="" src="<%=request.getContextPath()%>/resources/img/hospedagemDefault.png">
						  		</c:if>
						  		
						  	</div>
							<div>
								<span><a href="/viajalheira/perfil?id=${vaga.vagaHospedagem.usuario.id}"></a>Visitar perfil</span>
							</div>
						 
						  </div>
							  
						  <div class="col">
						 	
						  	<h4 class="title">${vaga.vagaHospedagem.titulo}</h4>
						  
							 <div class="row">
							 	<div class="col">
							 		<div>
							 			<span>Data de ida: <fmt:formatDate value="${vaga.dataIda}" pattern="dd/MM/yyyy" /></span>
							 		</div>
							 		<div>
							 			<span>Data de volta: <fmt:formatDate value="${vaga.dataVolta}" pattern="dd/MM/yyyy" /></span>
							 		</div>
							 	</div>
							 </div>
						</div>
						
						<div class="notice-footer">
						
								<fmt:parseNumber var="intValue" value="${vaga.situacao}"/>
								 	<c:choose>
								 		<c:when test="${intValue == 1}">
								 			<span>Aceitar ou recusar</span>
								 			<a href="/viajalheira/hospedagem/aceitar?id=${vaga.id}"><button class="mdl-button mdl-color-text--blue-500">Aceitar</button></a>
								 			<a href="/viajalheira/hospedagem/recusar?id=${vaga.id}"><button class="mdl-button mdl-color-text--blue-500">Recusar</button></a>
								 		</c:when>
								 		<c:when test="${intValue == 2}">
								 			<span>Em andamento: </span>
								 			<a href="/viajalheira/hospedagem/reverter?id=${vaga.id}"><button class="mdl-button mdl-color-text--blue-500">Finalizar</button></a>
								 		</c:when>
								 		<c:when test="${intValue == 3}">
								 			<span>Recusado</span>
								 		</c:when>
								 		<c:when test="${intValue == 4}">
								 			<span>Esta vaga Foi finalizada</span>
								 		</c:when>
								 	</c:choose>
							 	
							 	</div>
						
					  </div>
						
					</div>
			    </div>
			    
			</c:forEach>
 		</c:when>
 		<c:otherwise>
 		<div class="notice">
 		
 			<h5>Ninguém aplicou para a sua vaga ou Você não possui vagas</h5>
 		</div>
 		</c:otherwise>
 	</c:choose>
	
	
	</div>
		
   <!-- Complemento do menu -->
        </div>
      </main>
    </div>
   <!-- Fim de complemento do menu -->

	
</body>
</html>