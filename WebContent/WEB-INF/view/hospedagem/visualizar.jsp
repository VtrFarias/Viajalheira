<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/visualizarHospedagem.css" id="" />

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

	    <div class="modal fade show" id="myModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Aplicar Para a Vaga</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="material-icons">clear</i>
                    </button>
                    
                    
                </div>
                <div class="modal-body">
                    
				<form action="aplicar" method="post">
 						
		         <input type="hidden" value="${usuarioLogado.id}" name="usuario_id" class="form-control">
		         <input type="hidden" value="${vagaHospedagem.id}" name="vaga_id" class="form-control">
					
						<div class="row">
							<div class="col form-group float-label-control">
		                        <label class="label-input" >Data de Ida*</label>
		                        <input type="text" name="dataIda" class="form-control">
		                    </div>
		                 
		                    <div class="col form-group float-label-control">
		                        <label class="label-input" >Data de Volta*</label>
		                        <input type="text"  name="dataVolta" class="form-control">
		                    </div>
		                 </div>
	                    <div class="row">
	                    	<div class="col form-group float-label-control">
								<label class="label-input" for="inputDescricao">Descrição</label>
								<textarea class="form-control" id="inputDescricao" name="descricao" placeholder="Fale um pouco sobre suas pretensões..." rows="2"></textarea>
							</div>
	                    </div>
						
						<div class="modal-footer">
                    <div>
						<button class="mdl-button mdl-js-button mdl-button--raised mdl-color--blue-300" type="submit">Feito!</button>
					</div>
					
                </div>
					</form>
                </div>
                
            </div>
        </div>
    </div>


	<c:import url="../comum/menu.jsp"></c:import>
	
	<div class="row" id="lin">
		<div class="col">
		<div>${mensagemErro}</div>
			<div class="card">
				<div class="card-body">
					<h4>${vagaHospedagem.titulo}</h4>
					
					
					  <!-- Indicators -->
					  <c:choose>
					  		<c:when test="${tamanho > 0 }">
					  			<div id="demo" class="carousel slide" data-ride="carousel">
					  			 <ul class="carousel-indicators">
									  <li data-target="#demo" data-slide-to="0" class="active"></li>
									  <c:forEach var="foto1" varStatus="var" items="${fotos}">
								  		<c:if test="${var.index != 0 }">
								  			<li data-target="#demo" data-slide-to="${var.index}"></li>
								  		</c:if>
									  </c:forEach>
								  </ul>
								  <!-- The slideshow -->
								  <div class="carousel-inner">
									  <c:forEach var="foto" varStatus="gran" items="${fotos}">
									  	<c:choose>
									  		<c:when test="${gran.index == 0 }">
									  			<div class="carousel-item active">
									     			<img src="<%=request.getContextPath()%>/resources/img/${foto.descricao}" alt="..." width="1100" height="500">
									    		</div>
									  		</c:when>
									  		<c:otherwise>
									  			<div class="carousel-item">
									      			<img src="<%=request.getContextPath()%>/resources/img/${foto.descricao}" alt="..." width="1100" height="500">
									    		</div>
									  		</c:otherwise>
									  	</c:choose>
									  </c:forEach>
					   			</div>
					  			<!-- Left and right controls -->
								  <a class="carousel-control-prev" href="#demo" data-slide="prev">
								    <span class="carousel-control-prev-icon"></span>
								  </a>
								  <a class="carousel-control-next" href="#demo" data-slide="next">
								    <span class="carousel-control-next-icon"></span>
								  </a>
								  </div>
					  		</c:when>
					  		<c:otherwise>
					  			<div class="alert alert-warning">
								  <strong>Essa Hospedagem não possui fotos</strong>
								</div>
					  		</c:otherwise>
					  </c:choose>
					 
					  
					 
					  
					
			
		
					<div>
					<a class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" data-toggle="modal" data-target="#myModal"> Aplicar para a vaga</a>
					</div>
					<div class="row" >
						
						<div class="col-md-4 offset-md-4" style="border-bottom: solid 1px lightgrey; text-align:center">
							<h4>Detalhes da Hospedagem</h4>
						</div>
						
					</div>
				<div class="row" style="padding-left: 2%; padding-right: 2%; ">	
						<div class="col-7">
						
						
						<div class="row cadaLinha">
							<div class="col"><h5>Descrição da vaga:</h5></div>
							<div class="col"><h6>${vagaHospedagem.descricao}</h6></div>
						</div>
						<div class="row cadaLinha">
							<div class="col"><h5>Tipo da Vaga:</h5></div>
							<div class="col"><h6>${vagaHospedagem.tipoVaga.descricao}</h6></div>
						</div>
						<div class="row cadaLinha">
							<div class="col"><h5>Permanência:</h5></div>
							<div class="col"><h6> Entre ${vagaHospedagem.tempoMinimoSemanas} e ${vagaHospedagem.tempoMaximoSemanas} Semanas </h6></div>
						</div>
						<div class="row cadaLinha">
							<div class="col"><h5>Horas de Trabalho:</h5></div>
							<div class="col"><h6>${vagaHospedagem.horasTrabalhoSemanal} </h6></div>
						</div>
						<div class="row" style="">
							<div class="col"><h5>Hospedeiro:</h5></div>
							<div class="col"><h6>${vagaHospedagem.usuario.nome} <small><a href="/viajalheira/perfil?id=${vagaHospedagem.usuario.id}">(ver mais)</a></small></h6></div>
						</div>
						
						
						</div>
						<div class="col-5" style="text-align: left"><h4>Endereço da Hospedagem</h4>
						
							<div class="row">
						
								<div class="col"><h5>País:</h5> </div>   <div class="col"><h6>${vagaHospedagem.endereco.pais}</h6></div>
						
							</div>
							<div class="row">
						
								<div class="col"><h5>Estado:</h5></div><div class="col"><h6>${vagaHospedagem.endereco.estado}</h6></div>
						
							</div>
							<div class="row">
						
								<div class="col"><h5>Cidade:</h5> </div><div class="col"><h6>${vagaHospedagem.endereco.cidade}</h6></div>
						
							</div>
							<div class="row">
						
								<div class="col"><h5>Lugadouro:</h5></div> </div><div class=""><h6> ${vagaHospedagem.endereco.rua}, ${vagaHospedagem.endereco.numerocasa}</h6></div>
						
							</div>
						
						</div>
						
				 </div>
				</div>
			</div>
		</div>
	</div>

   <!-- Complemento do menu -->
        </div>
      </main>
    </div>
   <!-- Fim de complemento do menu -->

	
</body>
</html>