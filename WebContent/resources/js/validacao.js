$(document).ready(function(){
	$("#cadastrousuario").validate({
		debug: true,
		rules: {
			nome:{
				required: true,
				minlength: 7
	
			}
		},
		
		messages:{
			
			nome:{
				required:"Campo Nome é Obrigatorio."
			}
		}
	});
});