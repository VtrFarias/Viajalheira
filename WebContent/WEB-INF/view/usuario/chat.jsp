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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" id="bootstrap-css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/googleFonts.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/css/material.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/menu.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/chat.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/material.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
  
  
</head>
<body>

	<c:import url="../comum/menu.jsp"></c:import>


<div class="container">
  <div class="row">
			<div class="messaging">
			  <div class="inbox_msg" style="width: 100%;">
				
				<div class="mesgs">
				  <div class="msg_history">
					<div class="incoming_msg">
					  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
					  <div class="received_msg">
						<div class="received_withd_msg">
						  <p>Test which is a new approach to have all
							solutions</p>
						  <span class="time_date"> 11:01 AM    |    June 9</span></div>
					  </div>
					</div>
					<div class="outgoing_msg">
					  <div class="sent_msg">
						<p>Test which is a new approach to have all
						  solutions</p>
						<span class="time_date"> 11:01 AM    |    June 9</span> </div>
					</div>
					<div class="incoming_msg">
					  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
					  <div class="received_msg">
						<div class="received_withd_msg">
						  <p>Test, which is a new approach to have</p>
						  <span class="time_date"> 11:01 AM    |    Yesterday</span></div>
					  </div>
					</div>
					<div class="outgoing_msg">
					  <div class="sent_msg">
						<p>Apollo University, Delhi, India Test</p>
						<span class="time_date"> 11:01 AM    |    Today</span> </div>
					</div>
					<div class="incoming_msg">
					  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
					  <div class="received_msg">
						<div class="received_withd_msg">
						  <p>We work directly with our designers and suppliers,
							and sell direct to you, which means quality, exclusive
							products, at a price anyone can afford.</p>
						  <span class="time_date"> 11:01 AM    |    Today</span></div>
					  </div>
					</div>
				  </div>
				  <div class="type_msg">
					<div class="input_msg_write">
					  <input type="text" class="write_msg" placeholder="Type a message" />
					  <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
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