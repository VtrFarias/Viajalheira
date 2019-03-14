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
    <script>
	    $(document).ready(function(){
	 		$("#searchButton").click(function(){
	 			$("#formFilter").toggle(500);
	 		});
	    });
 	</script>
 	<style>
 		.mdl-textfield__expandable {
 			display: inline-block;
 			margin: 0px 15px 0px 0px;
 			font-size: 1.6em
 		}  
 		.buttonFilter {
		    padding: 7px 20px 7px 20px;
		    background-color: white;
		    border: 1px solid rgb(255,171,64);
		    border-radius: 0px 15px 15px 0px;
		    color: rgb(255,171,64);
		    -webkit-transition: background-color 1s; /* Safari */
		    transition: background-color 1s;
		    -webkit-transition: color 1s; /* Safari */
		    transition: color 1s;
		}
		.buttonFilter:hover {
		    background-color: rgb(255,171,64);
		    color: white;
		    -webkit-transition: background-color 1s; /* Safari */
		    transition: background-color 1s;
		    -webkit-transition: color 1s; /* Safari */
		    transition: color 1s;
		}
		.form-control {
			padding:6px;
			margin: 0px -15px 0px 0px;
		    background-color: #fff;
		    border: none;
		    font-family: "Helvetica","Arial",sans-serif;
		    font-size: 16px;
    		border-bottom: 1px solid rgba(0,0,0,.12);
    		color: inherit;
		}
		#searchHospedagem {
			padding: 6.5px;
			background-color: #fff;
			border-radius: 15px 0px 0px 15px;
		}
		#searchButton {
			padding: 5px;
			cursor: pointer;
			margin-left: 5px;
		}
		#searchButton:hover {
			background-color: #ddd;
			border-radius: 20px;
			padding: 5px;
		}
		#formFilter{
			display: none;
		}
 	</style>
 	
</head>
<body>

<!-- O menu de navegação -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
      <header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
        <div class="mdl-layout__header-row">
          <a class="color-text--brown-500" href="/viajalheira/home"><span class="mdl-layout-title">Home</span></a>
          <div class="mdl-layout-spacer"></div>
          
		  <i class="material-icons" id="searchButton">search</i>
		  
          <form action="/viajalheira/hospedagem/filter" id="formFilter">
            <div class="mdl-textfield__expandable">
              <input class="mdl-textfield__input" type="text" id="searchHospedagem" name="titulo" placeholder="Buscar por hospedagem" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Buscar por hospedagem'">
              <label class="mdl-textfield__label" for="titulo"></label>
            </div> 
            <div class="mdl-textfield__expandable">
            	<select class="form-control" id="tipovaga" name="tipovaga">
					<option value=0>Buscar por tipo da Vaga</option>
					<c:forEach var="tipoVaga" items="${listaTipoVaga}">
						<option value="${tipoVaga.id}">${tipoVaga.descricao}</option>
					</c:forEach>
				</select>
            </div>
            <div class="mdl-textfield__expandable">
              <input class="buttonFilter" type="submit" value="Pesquisar">
            </div>
          </form>
          
          <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
           
            <li class="mdl-menu__item"><a href="/viajalheira/logout">Sair</a></li>
          </ul>
        </div>
      </header>
      <div class=" mdl-layout__drawer mdl-color--amber-400 mdl-color-text--grey-900">
        <header class=" ">
         
	         <div class="header-avatar">
	       <c:choose>
				<c:when test="${not empty usuarioLogado.imagem}">
					<img src="<%=request.getContextPath()%>/resources/img/${usuarioLogado.imagem}" class="avatarPerfil">
				</c:when>
				<c:otherwise>
					<img src="<%=request.getContextPath()%>/resources/img/avatar.jpg" class="avatarPerfil" alt="..." id="FotoPerfil">
				</c:otherwise>
			</c:choose>
	          
	        </div>
	       
	     
          <div class="infoUsuarioPerfil">
            <strong>${usuarioLogado.nome}</strong>
            <div class="mdl-layout-spacer">${usuarioLogado.email}</div>
          </div>
      
        
        </header>
        <nav class="demo-navigation mdl-navigation mdl-color--amber-600">
          <a class="mdl-navigation__link mdl-color-text--brown-500" href="/viajalheira/perfil?id=${usuarioLogado.id}"><i class="mdl-color-text--brown-800 material-icons" role="presentation">account_circle</i>Minha Conta</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href="/viajalheira/hospedagem/novoCadastro"><i class="mdl-color-text--brown-500 material-icons" role="presentation">home</i>Nova Hospedagem</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href="/viajalheira/hospedagem/notificacoes"><i class="mdl-color-text--brown-500 material-icons" role="presentation">announcement</i>Notificações</a>

          <!-- 
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">report</i>Spam</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">forum</i>Forums</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">flag</i>Updates</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">local_offer</i>Promos</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">shopping_cart</i>Purchases</a>
          <a class="mdl-navigation__link mdl-color-text--brown-500" href=""><i class="mdl-color-text--brown-500 material-icons" role="presentation">people</i>Social</a>
          <div class="mdl-layout-spacer"></div>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--amber-900 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
           -->
         
        </nav>
      </div>
      <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid demo-content">
        <!-- END - O menu de navegação -->
       

 
		<div class="container">
             <div class="row">
                <!-- Card -->
			   <c:forEach var="vagaHospedagem" items="${listaHospedagem}">
			
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
