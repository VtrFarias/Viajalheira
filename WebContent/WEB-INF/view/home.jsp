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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/cards.css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
 
</head>
<body>

<!-- Importando o menu de navegação -->
<c:import url="comum/menu.jsp"></c:import>
 
		<div class="container">
             <!-- Card -->
			<c:forEach var="vagaHospedagem" items="${listaHospedagem}">
			
	           
            <div class="row">
                <div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="box7">
                        <img src="http://bestjquery.com/tutorial/hover-effect/demo156/images/img-1.jpg" alt="">
                        <div class="box-content">
                            <h3 class="title">${vagaHospedagem.titulo}</h3>
                            <span class="post">${vagaHospedagem.endereco.cidade}, ${vagaHospedagem.endereco.pais}</span>
                            <ul class="icon">
                                <li><a href="#" class="fa fa-search"></a></li>
                                <li><a href="#" class="fa fa-link"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
				
            </c:forEach>
            
            
          </div>

   <!-- Complemento do menu -->
        </div>
      </main>
    </div>
   <!-- Fim de complemento do menu -->

</body>
</html>
