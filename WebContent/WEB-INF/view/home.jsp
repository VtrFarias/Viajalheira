<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Viajalheira</title>
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/googleFonts.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/card.css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/filtro.js"></script>
   
    <script>
	
	    $(document).ready(function(){
	  	  $("#searchButton").click(function(){
	  			$("#formFilter").toggle(500);
	  		});
	    });

 	</script>

</head>
<body>

<!-- Importando o menu de navegação -->
<c:import url="comum/menu.jsp"></c:import>
 
		<div class="container">
             <div class="row">
                <!-- Card -->
			   <c:forEach var="vagaHospedagem" items="${listaHospedagem}">
			     <div class="cardAjuste col">
			   <div class="demo-card-square mdl-card mdl-shadow--2dp" style="width: 320px;
  height: 320px;">
  					 <c:choose>
                    	<c:when test="${empty vagaHospedagem.imagem}">
                    		<div class="mdl-card__title mdl-card--expand" style="background:url('<%=request.getContextPath()%>/resources/img/hospedagemDefault.png');-webkit-background-size: cover;">
                    	</c:when>
                    	<c:otherwise>
                    		<div class="mdl-card__title mdl-card--expand" style="background:url('<%=request.getContextPath()%>/resources/img/${vagaHospedagem.imagem.descricao}');-webkit-background-size: cover;">
                    	</c:otherwise>
                    </c:choose>
				  
				  </div>
				  <div class="mdl-card__supporting-text">
				    <h5 style="margin:1px;">${vagaHospedagem.titulo}</h5>
				    <span>${vagaHospedagem.endereco.cidade} - ${vagaHospedagem.endereco.estado}, ${vagaHospedagem.endereco.pais}</span>
				    <br>
				    <em>Categoria: ${vagaHospedagem.tipoVaga.descricao}</em>
				  </div>
				  <div class="mdl-card__actions mdl-card--border">
				    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="/viajalheira/hospedagem/visualizar?id=${vagaHospedagem.id}" >
				    	Ver Mais
				    </a>
				  </div>
				</div>
			   </div>
			   
			   
				<!-- 
                <div class="cardAjuste col">
                    <div class="box3">
                    
                    <h3 class="title-type">${vagaHospedagem.tipoVaga.descricao}</h3>
                    <c:choose>
                    	<c:when test="${empty vagaHospedagem.imagem}">
                    		<img src="<%=request.getContextPath()%>/resources/img/hospedagemDefault.png" class="imgCard">
                    	</c:when>
                    	<c:otherwise>
                    		<img src="<%=request.getContextPath()%>/resources/img/${vagaHospedagem.imagem.descricao}" class="imgCard">
                    	</c:otherwise>
                    </c:choose>
                        
                        
                        <div class="box-content">
                          <h3 class="title" id="titulo">${vagaHospedagem.titulo}</h3>
                            <span class="post">${vagaHospedagem.endereco.cidade} - ${vagaHospedagem.endereco.estado}, ${vagaHospedagem.endereco.pais} </span>
                            <p class="description" id="descricao">
                                ${vagaHospedagem.descricao}
                            </p>
                            <ul class="icon">
                                <li><a href="/viajalheira/hospedagem/visualizar?id=${vagaHospedagem.id}" class=""><i class="material-icons" role="presentation">add</i></a></li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
                -->
        
				
            </c:forEach>
            
           </div>
          </div>

   <!-- Complemento do menu -->
        </div>
      </main>
    </div>
   <!-- Fim de complemento do menu -->

</body>
</html>
