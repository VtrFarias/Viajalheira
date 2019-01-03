<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Viajalheira</title>
	
	<!-- Importando Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<!-- Importando Nav -->
	<c:import url="../comum/menu.jsp"></c:import>

	<!--  Inicio do Formulário de cadastro -->
	<div class="container">
          
        <div class="row justify-content-center mb-5">
            <div class="col-sm-12 col-md-10 col-lg-8">
                <form action="save" method="post">
                
                	<div class="form-row">
				            <div class="col-12 text-center my-5">
				                <h5 class="display-4">Dados Pessoais</h5>
				            </div>
                	
                		<div class="form-group col-sm-6">
                            <label for="inputNome">Nome</label>
                            <input type="text" class="form-control" id="inputNome" name="nome" placeholder="Nome" required="required">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="inputCPF">CPF/CNPJ</label>
                            <input type="text" class="form-control" id="inputCPF" name="cpfCnpj" placeholder="CPF ou CNPJ" required="required">
                        </div>
                        
                        <div class="form-group col-sm-12">
                            <label for="inputEmail">Email</label>
                            <input type="text" class="form-control" id="inputEmail" name="email" placeholder="nome@exemplo.com" required="required">
                        </div>
                        
                        <div class="form-group col-sm-6">
                            <label for="inputSenha">Senha</label>
                            <input type="password" class="form-control" id="inputSenha" name="senha" placeholder="Senha" required="required">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="inputConfSenha">Confirmar senha</label>
                            <input type="password" class="form-control" id="inputConfSenha" placeholder="Confirmar Senha">
                        </div>
                        
                        <div class="form-group col-sm-12">
	                        <div class="form-check">
								<input class="form-check-input" type="radio" name="sexo" id="inputSexoMas" value="masculino" checked>
							  	<label class="form-check-label" for="inputSexoMas">Masculino</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="sexo" id="inputSexoFem" value="feminino" checked>
							  	<label class="form-check-label" for="inputSexoFem">Feminino</label>
							</div>
						</div>
						
						<div class="form-group col-sm-12">
						    <label for="textareaDescricao">Sobre você</label>
						    <textarea class="form-control" id="textareaDescricao" rows="4" name="descricao" maxlength="300"></textarea>
						 </div>
                	</div>
                
                	<hr>
                
                    <div class="form-row">
                    	<div class="col-12 text-center my-5">
				                <h5 class="display-4">Endereço</h5>
				        </div>
                    
                        <div class="form-group col-sm-6">
                            <label for="inputPais">País</label>
                            <input type="text" class="form-control" id="inputPais" name="pais" placeholder="País" required="required">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="inputEstado">Estado</label>
                            <input type="text" class="form-control" id="inputEstado" name="estado" placeholder="Estado" required="required">
                        </div>
                    
                        <div class="form-group col-sm-6">
                            <label for="inputCidade">Cidade</label>
                            <input type="text" class="form-control" id="inputCidade" name="cidade" placeholder="Cidade" required="required">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="inputBairro">Bairro</label>
                            <input type="text" class="form-control" id="inputBairro" name="bairro" placeholder="Bairro" required="required">
                        </div>
                    
                        <div class="form-group col-sm-10">
                            <label for="inputEndereco">Endereço</label>
                            <input type="text" class="form-control" id="inputEndereco" name="rua" placeholder="Endereço completo">
                        </div>
                        <div class="form-group col-sm-2">
                            <label for="inputNumero">Número</label>
                            <input type="text" class="form-control" id="inputNumero" name="numerocasa" placeholder="Nº">
                        </div>
                   	
                        <div class="form-group col-sm-3">
                            <label for="inputComplemento">Complemento</label>
                            <input type="text" class="form-control" id="inputComplemento" name="complemento" placeholder="Complemento">
                        </div>
                    </div>
                    
                    <hr>
                    
                    <div class="form-row">
                    	<div class="col-12 text-center my-5">
				                <h5 class="display-4">Habilidades</h5>
				        </div>
                    
                		<div class="form-group col-sm-6">
                            <label for="inputNome">Nome</label>
                            <input type="text" class="form-control" id="inputNome" name="nome" placeholder="Nome" required="required">
                        </div>
                	</div>
                    
                </form>
            </div>
          </div>
      </div>

	<!-- Importando Bootstrap | Jquery  JS-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>