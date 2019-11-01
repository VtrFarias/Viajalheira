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
		<h5>Seus Certificados</h5>


		<div class="notice notice-sucess">
			<div class="notice-header">
				<a href="#">Emitir Certificado</a>
			</div>
			<div class="notice-image">
				<div class="row">

					<div class="col-md-4 coluna-principal-1">
						<div>

							<img alt=""
								src="http://s2.glbimg.com/xtvCOG7tFWfeLmbZsHMqjHhxJzY=/0x584/g.glbimg.com/og/gs/gsat5/f/original/2014/05/03/inspiracoes-quarto-620-04_1436104370743685191.jpg">
						</div>

					</div>

					<div class="col">

						<h4 class="title">Quarto para dois - frente ao mar</h4>
						<hr>
						<div class="row">

							<div class="col-md-6">
								<div>
									<span><b>Desenvolvimento de sistemas</b></span> <br> <span>6h
										por dia</span>
								</div>

							</div>
							<div class="col-md-6">
								<div>
									<span>Data de ida: 05/05/2017</span>
								</div>
								<div>
									<span>Data de volta: 12/07/2017</span>
								</div>
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
