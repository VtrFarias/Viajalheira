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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/menu.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
  	
 
</head>
<body>

<!-- Importando o menu de navegação -->
<c:import url="comum/menu.jsp"></c:import>
 
 <div class="demo-cards mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--12-col-desktop">
             <!-- Card -->
			<c:forEach var="vagaHospedagem" items="${listaHospedagem}">
			
	            <div class="cardAjuste demo-updates mdl-card mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-cell--6-col-tablet mdl-cell--4-col-desktop ">
					<div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
						<h2 class="mdl-card__title-text cardTitulo">${vagaHospedagem.titulo}</h2>
					</div>
					<div class="mdl-card__supporting-text mdl-color-text--grey-600">
						<h4 class="cardFunção">${vagaHospedagem.Função}</h4>
						<div class="cardPais">${vagaHospedagem.pais}/${vagaHospedagem.estado}</div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
						<a href="#" class="mdl-button mdl-js-button mdl-js-ripple-effect">Ver mais</a>
					</div>
				</div>
				<div class="demo-separator mdl-cell--1-col"></div>
				
            </c:forEach>
            
            
          </div>

   <!-- Complemento do menu -->
        </div>
      </main>
    </div>
   <!-- Fim de complemento do menu -->

</body>
</html>