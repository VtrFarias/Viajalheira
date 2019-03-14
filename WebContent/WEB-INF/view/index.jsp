<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Viajalheira</title>

<!-- Importando Bootstrap-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" id="bootstrap-css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>

<!-- Arquivos da index -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/index.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/form.css"/>


<!-- Arquivos alert -->
</head>
<body>

<section class="login-block">
    <div class="container">
	<div class="row">
		<div class="col-md-4 login-sec">
		    <h2 class="text-center text-info">Login</h2>
		<form class="login-form" action="login" method="post">
	 		 <div class="col form-group float-label-control">
	            <label class="label-input" for="email">Email</label>
	            <input type="email" id="email" name="email" class="form-control" placeholder="Email">
	      	  </div>
			   <div class="col form-group float-label-control">
	              <label class="label-input" for="senha">Senha</label>
	              <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha">
	          </div>
    <div class="form-check">
    
    	
	   	<a class="text-info" href="/viajalheira/usuario/novoCadastro">Cadastre-se</a> 
	    
	    <button type="submit" class="btn btn-info float-right">Entrar</button>
  	</div>	
  
</form>
	<div class="msg-erro">
		<div>${mensagemErrologin}</div>
		<span class="text-center text-danger">${msg}</span>
	</div>
		</div>
		<div class="col-md-8 banner-sec">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                 <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
            <div class="carousel-inner" role="listbox">
    <div class="carousel-item active">
      <img class="d-block img-fluid" src="http://longitudes.com.br/wp-content/uploads/2013/11/backpacker.jpg" alt="First slide">
      <div class="carousel-caption d-none d-md-block">
        <div class="banner-text">
	        <h2>Viajalheira</h2>
	        <p>Conhecimento abre portas e dá asas... Embarque nessa Viajalheira.</p>
        </div>	
  </div>
    </div>
    <div class="carousel-item">
      <img class="d-block img-fluid" src="https://abrilviagemeturismo.files.wordpress.com/2017/05/jdevnani-guatape-high.jpg" alt="First slide">
      <div class="carousel-caption d-none d-md-block">
        <div class="banner-text">
          
         	<h2>Viajalheira</h2>
	     	<p>Conhecimento abre portas e dá asas... Embarque nessa Viajalheira.</p>
        </div>	
    </div>
    </div>
    <div class="carousel-item">
      <img class="d-block img-fluid" src="https://i1.wp.com/www.vortexmag.net/wp-content/uploads/2018/04/8203081981_cf69fcfd51_o-e1524230060171.jpg?fit=1200%2C841&ssl=1" alt="First slide">
      <div class="carousel-caption d-none d-md-block">
        <div class="banner-text">
           <h2>Viajalheira</h2>
	       <p>Conhecimento abre portas e dá asas... Embarque nessa Viajalheira.</p>
         </div>	
    </div>
  </div>
            </div>	   
		</div>
	</div>
</div>
</div>
</section>
</body>
</html>