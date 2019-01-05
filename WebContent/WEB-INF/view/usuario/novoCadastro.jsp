<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


</head>
<body class="hm-gradient">

<c:import url="../comum/sidebar.jsp"></c:import>
	
<!-- Exemplos de cards -->	
	
<div id="wrapper" class="animate">
	<div class="container-fluid">
	 <div class="col-12 text-center ">
	    <h2>Cadastro de Usuário</h2>
	</div>

      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">Dados Pessoais</h4>
              <hr/>
     
     			  <form role="form">
	     			  <!-- Primeira linha -->
	     			  <div class="row">
		                    <div class=" col form-group float-label-control">
		                        <label for="nome">Nome</label>
		                        <input type="text" id="nome" name="nome" class="form-control" placeholder="Nome">
		                    </div>
		                    
		                    <div class="col form-group float-label-control">
		                        <label for="cpfCnpj">CPF/CNPJ</label>
		                        <input type="text" id="cpfCnpj" name="cpfCnpj" class="form-control" placeholder="CPF/CNPJ">
		                    </div>
	                    </div>
	                <!-- Segunda linha -->
                    <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label for="email">Email</label>
	                        <input type="email" id="email" name="email" class="form-control" placeholder="Email">
	                    </div>
	                    
	                     
	                    <div class="col form-group">
		                    	<label for="sexo">Sexo</label>
		                    	<select class="form-control" id="sexo" name="sexo">
		                    		<option></option>
		                    		<option>Feminino</option>
		                    		<option>Masculino</option>
		                    		<option>Outros</option>
		                    	</select>
		                  </div>
	                  </div>
                    
                    <!-- Terceira linha -->
	                  <div class="row">
	                    <div class="col form-group float-label-control">
	                        <label for="senha">Senha</label>
	                        <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha">
	                    </div>
		                    
	                     <div class="col form-group float-label-control">
	                        <label for="confirmarSenha">Confirmar Senha</label>
	                        <input type="password" id="confirmarSenha" name="confirmarSenha" class="form-control" placeholder="Confirmar Senha">
	                    </div>
                    </div>
                    

                    <!-- Quarta linha -->
				 <label>Idiomas</label>	
                  <div class="row">
	                  <div class="form-group col-sm">
                          Português
                          <label class="switch ">
				         	 <input type="checkbox" class="warning">
				         	 <span class="slider round"></span>
				          </label>
	                   </div>
	                 
                  </div>
                    
                    <div class="form-group float-label-control">
                        <label for="">Descrição</label>
                        <textarea class="form-control" placeholder="Fale um pouco sobre você..." rows="1"></textarea>
                    </div>      	
                </form>
               
          </div>
        </div>
     </div>
     
     	<div class="col">
     	  <div class="card">
            <div class="card-body">
              <h4 class="card-title">Endereço</h4>
              <hr/>
     		</div>
     	  </div>              
     	</div>
     
    </div>
    
   </div>

</body>
</html>