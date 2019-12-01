<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"
	content="A front-end template that helps you build fast, modern mobile web apps.">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>Viajalheira</title>
<meta name="mobile-web-app-capable" content="yes">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"
	id="bootstrap-css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/googleFonts.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/material.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/menu.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/notificacao.css" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/material.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>



	<c:import url="../comum/menu.jsp"></c:import>

	<div class="row">
		<h5>Pacotes de Uso</h5>


			
			
			<div class="notice notice-sucess">
			<div class="notice-image">
				<div class="row">
					<div class="col">

						<h4 class="title">Assinatura Grátis</h4>
						<hr>
						<div class="row">

							<div class="col-md-6">
								<div>
									<p>
										<b>Viagem + criação de vagas ilimitadas</b>
									</p>
								</div>

							</div>
							<div class="col-md-6">
								<span class="mdl-color-text--amber-800"><b>Em uso</b></span>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
			
			
		<div class="notice notice-sucess">
			<div class="notice-image">
				<div class="row">
					<div class="col">

						<h4 class="title">Assinatura simples</h4>
						<hr>
						<div class="row">

							<div class="col-md-6">
								<div>
									<p>
										<b>Viagem + criação de vagas ilimitadas + suporte da equipe Viajalheira por 3 meses</b>
									</p>
								</div>

							</div>
							<div class="col-md-6">
								<button id="enviarForm"
									class="mdl-button mdl-button--colored mdl-color-text--white mdl-color--green-600 mdl-button--raised mdl-js-button mdl-js-ripple-effect"
									type="submit">R$ 49,99</button>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
		
		<div class="notice notice-sucess">
			<div class="notice-image">
				<div class="row">
					<div class="col">

						<h4 class="title">Assinatura Curricular</h4>
						<hr>
						<div class="row">

							<div class="col-md-6">
								<div>
									<p>
										<b>Viagem + criação de vagas ilimitadas + emissão de certificado + <br> suporte da equipe
											Viajalheira por 3 meses </b>
									</p>
								</div>

							</div>
							<div class="col-md-6">
								<button id="enviarForm"
									class="mdl-button mdl-button--colored mdl-color-text--white mdl-color--green-600 mdl-button--raised mdl-js-button mdl-js-ripple-effect"
									type="submit">R$ 59,99</button>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>

	<!-- Complemento do menu -->
	</div>
	</main>
	</div>
	<!-- Fim de complemento do menu -->


</body>
</html>
