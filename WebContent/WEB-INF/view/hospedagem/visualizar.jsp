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
			<div class="card">
				<div class="card-body">
					<h4>${vagaHospedagem.titulo}</h4>
					<div id="demo" class="carousel slide" data-ride="carousel">
					
					  <!-- Indicators -->
					  <ul class="carousel-indicators">
					    <li data-target="#demo" data-slide-to="0" class="active"></li>
					    <li data-target="#demo" data-slide-to="1"></li>
					    <li data-target="#demo" data-slide-to="2"></li>
					  </ul>
					  
					  <!-- The slideshow -->
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="https://abrilveja.files.wordpress.com/2016/11/sanfran.jpg" alt="Los Angeles" width="1100" height="500">
					    </div>
					    <div class="carousel-item">
					      <img src="https://blog.100mentors.com/wp-content/uploads/2017/06/o-CHICAGO-facebook-1.jpg" alt="Chicago" width="1100" height="500">
					    </div>
					    <div class="carousel-item">
					      <img src="https://www.popsci.com/sites/popsci.com/files/styles/1000_1x_/public/images/2017/03/la-skyline.jpg?itok=7dDE4YyW&fc=50,50" alt="New York" width="1100" height="500">
					    </div>
					  </div>
					  
					  <!-- Left and right controls -->
					  <a class="carousel-control-prev" href="#demo" data-slide="prev">
					    <span class="carousel-control-prev-icon"></span>
					  </a>
					  <a class="carousel-control-next" href="#demo" data-slide="next">
					    <span class="carousel-control-next-icon"></span>
					  </a>
					</div>
			
		
					<div>
					<a class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" data-toggle="modal" data-target="#myModal"> Aplicar para a vaga</a>
					</div>
					
					<div class="row">
					<div class="col"><h5>${vagaHospedagem.tipoVaga.descricao }</h5></div>
						<div class="col">
							<p> ${vagaHospedagem.descricao }</p>
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