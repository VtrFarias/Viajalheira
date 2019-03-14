<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>

	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Viajalheira</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/googleFonts.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/menu.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/validacao.css" />
	
	<!-- Importando Bootstrap-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" id="bootstrap-css"/>
	
</head>
<body>

    <header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
        <div class="mdl-layout__header-row">
          	<a class="color-text--brown-500" href="../home"><span class="mdl-layout-title">Home</span></a>
          	<div class="mdl-layout-spacer"></div>
          
        </div>
      </header>

<div class="mdl-grid demo-content">
          
	
<!-- Exemplos de cards -->	
	

	<div class="container-fluid">
	 <div class="col-12 text-center ">
	    <h2>Cadastro de Usuário</h2>

	</div>
	
	  <form id="cadastrousuario" role="form" id="formulario" action="save" method="post">
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

		                        <input type="text" id="nome" name="nome" class="form-control" maxlength="254" >

		                    </div>
		                    
		                    <div class="col form-group float-label-control">
		                        <label class="label-input" for="cpfCnpj">CPF/CNPJ*</label>
		                        <input type="text" id="cpfCnpj" name="cpfCnpj" class="form-control" maxlength="14" >
		                    </div>
	                    </div>
	                    
	                    
	                <!-- Segunda linha -->
	                <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="email">Email*</label>
	                        <input type="email" id="email" name="email" class="form-control" maxlength="254">
	                    </div>
                    </div>
                    <!-- Terceira linha -->
	                  <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="senha">Senha*</label>
	                        <input type="password" id="senha" name="senha" class="form-control" maxlength="254">
	                    </div>
		                    
	                     <div class="col form-group float-label-control">
	                        <label class="label-input" for="confirmarSenha">Confirmar Senha*</label>
	                        <input type="password" id="confirmarSenha" name="confirmarSenha" class="form-control" maxlength="254">
	                    </div>
                    </div>


                    <!-- Quarta linha -->
                    <div class="row">
                     <div class="col form-group">
		                    	<label class="label-titulo" for="sexo">Sexo*</label>
		                    	<select class="form-control" id="sexo" name="sexo">
		                    		<option></option>
		                    		<option value="Feminino">Feminino</option>
		                    		<option value="Masculino">Masculino</option>
		                    		<option value="outros">Outros</option>
		                    	</select>
		                  </div>
		                 <div class="col form-group float-label-control">
	                        <label class="label-input" for="dataNascimento">Data Nascimento</label>
	                        <input type="date" id="dataNascimento" name="nascimento" class="form-control">
	                    </div>
                    
                    </div>
	                   

				
	              	
				
					
                  
                 <fieldset>
                 	<label class="label-titulo">Idiomas*</label>
                 	<label for="idioma" class="error"></label>
	    			 <!-- Quinta linha -->
	                  <div class="row">
						<div class = "mdl-grid">
		                <c:forEach var="idioma" items="${listaIdiomas}">
							<div class = "mdl-cell mdl-cell--4-col graybox">
								<label for="${idioma.descricao}">
									<input type="checkbox" class="checkbox" id="${idioma.descricao}" value="${idioma.id}" name="idioma" required minlength="1"><span class="mdl-checkbox__input">${idioma.descricao}</span>
								</label>
							</div>
						</c:forEach>
							                   
	                 </div>
                  </div>
				</fieldset>
                  
                  
                    <!-- Sexta linha -->
                    <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="inputDescricao">Descrição</label>
	                        <textarea class="form-control" id="inputDescricao" name="descricaoPerfil" placeholder="Fale um pouco sobre você..." rows="1" maxlength="500"></textarea>
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
		                        <input type="text" id="rua" name="rua" class="form-control" maxlength="254">
		                    </div>
		                    
		                    <div class="col form-group float-label-control">
		                        <label class="label-input" for="numerocasa">Número*</label>
		                        <input type="text" id="numero" name="numerocasa" class="form-control" maxlength="254">
		                    </div>
	                    </div>
	                    
	                <!-- Segunda linha -->
	                <div class="row">
	                        <div class="col form-group float-label-control">
	                        <label class="label-input" for="complemento">Complemento</label>
	                        <input type="text" id="complemento" name="complemento" class="form-control" maxlength="254">
	                    </div>
                    
                    	<div class="col form-group float-label-control">
	                        <label class="label-input" for="bairro">Bairro*</label>
	                        <input type="text" id="bairro" name="bairro" class="form-control" maxlength="254">
	                    </div>
	                    
                    </div>
                    <!-- Terceira linha -->
	                  <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="cidade">Cidade*</label>
	                        <input type="text" id="cidade" name="cidade" class="form-control" maxlength="254">
	                    </div>
		                   
		                   
		              	<div class="col form-group float-label-control">
	                        <label class="label-input" for="estado">Estado*</label>
	                        <input type="text" id="estado" name="estado" class="form-control" maxlength="254" >
	                    </div>
	                     
                    </div>
                    

                    <!-- Quarta linha -->
	                    <div class="form-group">
		                    	<label class="label-titulo" for="pais">País*</label>
		                    	<select class="form-control" id="pais" name="pais">
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


	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/validacao.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/validMaxIdadeCadastro.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/alerts.js"></script>	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/sweetalert.js"></script>	
	
	<c:if test= "${not empty sucessoCadastro}">
		<script>
			cadastroComSucesso();
		</script>
	</c:if>
</body>
</html>
