<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html">
<html lang="pt-br">
<head>

<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Viajalheira</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/googleFonts.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sweetalert.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/menu.css" />
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.amber-yellow.min.css" />
	
	<!-- Importando Bootstrap-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" id="bootstrap-css"/>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery.validate.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/alerts.js"></script>	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/sweetalert.js"></script>	
	<script>
	
	//VALIDAÇÃO COM JQUERY VALIDATE -----------------------------------------------------------------------
	
	 $(document).ready(function(){
	    $("#cadastrousuario").validate({
	        rules: {
	            nome: {
	                required: true
	            },
	            senha: {
	                required: true
	            }
	        },
	        messages: {
	            nome: {
	                required: "Digite seu email"
	            },
	            senha: {
	                required: "Digite sua senha"
	            }
	        }
	    });
	}); 
	 </script>

	
</head>
<body>

    <header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
        <div class="mdl-layout__header-row">
          	<span class="mdl-layout-title">Home</span>
          	<div class="mdl-layout-spacer"></div>
          <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
            <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
              <i class="material-icons">search</i>
            </label>
            <div class="mdl-textfield__expandable-holder">
              <input class="mdl-textfield__input" type="text" id="search">
              <label class="mdl-textfield__label" for="search">Enter your query...</label>
            </div>
          </div>
          <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
            <li class="mdl-menu__item">About</li>
            <li class="mdl-menu__item">Contact</li>
            <li class="mdl-menu__item">Legal information</li>
          </ul>
        </div>
      </header>

<div class="mdl-grid demo-content">
          
	
<!-- Exemplos de cards -->	
	

	<div class="container-fluid">
	 <div class="col-12 text-center ">
	    <h2>Cadastro de Usuário</h2>

	</div>
	  <form id="cadastrousuario" role="form" id="formulario" action="save" method="post" onsubmit="cadastroComSucesso()">
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">Dados Pessoais</h4>
              <hr/>
     
     		
	     			  <!-- Primeira linha -->
	     			  <div class="row">
		                    <div class="col form-group float-label-control">
		                        <label class="label-input" for="nome">Nome*</label>
		                        <input type="text" id="nome" name="nome" class="form-control">
		                    </div>
		                    
		                    <div class="col form-group float-label-control">
		                        <label class="label-input" for="cpfCnpj">CPF/CNPJ*</label>
		                        <input type="text" id="cpfCnpj" name="cpfCnpj" maxlength="14" class="form-control"  >
		                    </div>
	                    </div>
	                    
	                <!-- Segunda linha -->
	                <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="email">Email*</label>
	                        <input type="email" id="email" name="email" class="form-control" >
	                    </div>
                    </div>
                    <!-- Terceira linha -->
	                  <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="senha">Senha*</label>
	                        <input type="password" id="senha" name="senha" class="form-control" >
	                    </div>
		                    
	                     <div class="col form-group float-label-control">
	                        <label class="label-input" for="confirmarSenha">Confirmar Senha*</label>
	                        <input type="password" id="confirmarSenha" name="confirmarSenha" class="form-control" onblur="senhas()">
	                    </div>
                    </div>


                    <!-- Quarta linha -->
	                    <div class="form-group">
		                    	<label class="label-titulo" for="sexo">Sexo*</label>
		                    	<select class="form-control" id="sexo" name="sexo" >
		                    		<option></option>
		                    		<option value="Feminino">Feminino</option>
		                    		<option value="Masculino">Masculino</option>
		                    		<option value="outros">Outros</option>
		                    	</select>
		                  </div>

				
				 <label class="label-titulo">Idiomas</label>
    			 <!-- Quinta linha -->
                  <div class="row">
					<div class = "mdl-grid">
	                <c:forEach var="idioma" items="${listaIdiomas}">
	              	
		             <div class = "mdl-cell mdl-cell--4-col graybox">
	              	  <label class="mdl-checkbox  mdl-js-checkbox theme--light" for="${idioma.descricao}">
  					  	<input type="checkbox" name="idioma" id="${idioma.descricao}"  value="${idioma.id}" class="mdl-checkbox__input">
  						<span class="mdl-checkbox__label">${idioma.descricao}</span>
					  </label>	
	                </div>
					</c:forEach>	                   
	                 </div>
                  </div>
                    <!-- Sexta linha -->
                    <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="inputDescricao">Descrição</label>
	                        <textarea class="form-control" id="inputDescricao" name="descricaoPerfil" placeholder="Fale um pouco sobre você..." rows="1"></textarea>
	                    </div>
                    </div>      	
               
          </div>
        </div>
     </div>
     
     	<div class="col">
     	  <div class="card">
            <div class="card-body">
              <h4 class="card-title">Endereço</h4>
              <hr/>
              
                <!-- Primeira linha -->
	     			  <div class="row">
		                    <div class="col form-group float-label-control">
		                        <label class="label-input" for="rua">Rua*</label>
		                        <input type="text" id="rua" name="rua" class="form-control">
		                    </div>
		                    
		                    <div class="col form-group float-label-control">
		                        <label class="label-input" for="numero">Número*</label>
		                        <input type="text" id="numero" name="numerocasa" class="form-control" >
		                    </div>
	                    </div>
	                    
	                <!-- Segunda linha -->
	                <div class="row">
	                        <div class="col form-group float-label-control">
	                        <label class="label-input" for="complemento">Complemento</label>
	                        <input type="text" id="complemento" name="complemento" class="form-control">
	                    </div>
                    
                    	<div class="col form-group float-label-control">
	                        <label class="label-input" for="bairro">Bairro*</label>
	                        <input type="text" id="bairro" name="bairro" class="form-control" >
	                    </div>
	                    
                    </div>
                    <!-- Terceira linha -->
	                  <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="cidade">Cidade*</label>
	                        <input type="text" id="cidade" name="cidade" class="form-control" >
	                    </div>
		                   
		                   
		              	<div class="col form-group float-label-control">
	                        <label class="label-input" for="estado">Estado*</label>
	                        <input type="text" id="estado" name="estado" class="form-control" >
	                    </div>
	                     
                    </div>
                    

                    <!-- Quarta linha -->
	                    <div class="form-group">
		                    	<label class="label-titulo" for="pais">País*</label>
		                    	<select class="form-control" id="pais" name="pais" >
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
              <button id="enviarForm" class="mdl-button mdl-button--colored mdl-button--raised mdl-js-button mdl-js-ripple-effect" type="submit">Enviar</button>
             
            			</div>              
     				</div>
    			</div>

    		</form>
  	 	</div>
  	</div>

	

	
</body>
</html>