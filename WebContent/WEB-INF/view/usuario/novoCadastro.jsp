<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Viajalheira</title>
	
<!-- Importando Bootstrap-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" id="bootstrap-css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>

<!-- sidebar arquivos -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/sidebar.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sidebar.css" />

<!-- Arquivos Formulário -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/form.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/form.js"></script>

<!-- Fontes -->
<link href="https://fonts.googleapis.com/css?family=Roboto|Titillium+Web" rel="stylesheet">




</head>
<body class="hm-gradient">

<c:import url="../comum/sidebar.jsp"></c:import>
	
<!-- Exemplos de cards -->	
	
<div id="wrapper" class="animate">
	<div class="container-fluid">
	 <div class="col-12 text-center ">
	    <h2>Cadastro de Usuário</h2>
	</div>
	  <form role="form" action="save" method="post">
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">Dados Pessoais</h4>
              <hr/>
     
     		
	     			  <!-- Primeira linha -->
	     			  <div class="row">
		                    <div class="col form-group float-label-control">
		                        <label class="label-input" for="nome">Nome</label>
		                        <input type="text" id="nome" name="nome" class="form-control" placeholder="Nome">
		                    </div>
		                    
		                    <div class="col form-group float-label-control">
		                        <label class="label-input" for="cpfCnpj">CPF/CNPJ</label>
		                        <input type="text" id="cpfCnpj" name="cpfCnpj" class="form-control" placeholder="CPF/CNPJ">
		                    </div>
	                    </div>
	                    
	                <!-- Segunda linha -->
	                <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="email">Email</label>
	                        <input type="email" id="email" name="email" class="form-control" placeholder="Email">
	                    </div>
                    </div>
                    <!-- Terceira linha -->
	                  <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="senha">Senha</label>
	                        <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha">
	                    </div>
		                    
	                     <div class="col form-group float-label-control">
	                        <label class="label-input" for="confirmarSenha">Confirmar Senha</label>
	                        <input type="password" id="confirmarSenha" name="confirmarSenha" class="form-control" placeholder="Confirmar Senha">
	                    </div>
                    </div>
                    

                    <!-- Quarta linha -->
	                    <div class="form-group">
		                    	<label class="label-titulo" for="sexo">Sexo</label>
		                    	<select class="form-control" id="sexo" name="sexo">
		                    		<option></option>
		                    		<option value="Feminino">Feminino</option>
		                    		<option value="Masculino">Masculino</option>
		                    		<option value="outros">Outros</option>
		                    	</select>
		                  </div>

				
				 <label class="label-titulo">Idiomas</label>
    			 <!-- Quinta linha -->
                  <div class="row">

	                <c:forEach var="idioma" items="${listaIdiomas}">
	                  <div class="form-group col-md-6">
						<label class="label-idioma">${idioma.descricao}</label>
                          <label class="switch ">
				         	 <input type="checkbox" name="idioma" value="${idioma.id}" class="warning">
				         	 <span class="slider round"></span>
				          </label>
	                   </div>
					</c:forEach>	                   
	                 
                  </div>
                    <!-- Sexta linha -->
                    <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="">Descrição</label>
	                        <textarea class="form-control" placeholder="Fale um pouco sobre você..." rows="1"></textarea>
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
		                        <label class="label-input" for="rua">Rua</label>
		                        <input type="text" id="rua" name="rua" class="form-control" placeholder="Rua">
		                    </div>
		                    
		                    <div class="col form-group float-label-control">
		                        <label class="label-input" for="numero">Número</label>
		                        <input type="text" id="numero" name="numero" class="form-control" placeholder="Número">
		                    </div>
	                    </div>
	                    
	                <!-- Segunda linha -->
	                <div class="row">
	                        <div class="col form-group float-label-control">
	                        <label class="label-input" for="complemento">Complemento</label>
	                        <input type="text" id="complemento" name="complemento" class="form-control" placeholder="Complemento">
	                    </div>
                    
                    	<div class="col form-group float-label-control">
	                        <label class="label-input" for="bairro">Bairro</label>
	                        <input type="text" id="bairro" name="bairro" class="form-control" placeholder="Bairro">
	                    </div>
	                    
                    </div>
                    <!-- Terceira linha -->
	                  <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label class="label-input" for="cidade">Cidade</label>
	                        <input type="text" id="cidade" name="cidade" class="form-control" placeholder="Cidade">
	                    </div>
		                   
		                   
		              	<div class="col form-group float-label-control">
	                        <label class="label-input" for="estado">Estado</label>
	                        <input type="text" id="estado" name="estado" class="form-control" placeholder="Estado">
	                    </div>
	                     
                    </div>
                    

                    <!-- Quarta linha -->
	                    <div class="form-group">
		                    	<label class="label-titulo" for="pais">País</label>
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
              <button class="btn-info btn btn-lg waves-effect" type="submit">Enviar</button>
             
            </div>              
     	</div>
    </div>
    
    
    </form>
   </div>
  

</body>
</html>