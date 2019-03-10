$(document).ready(function() {
	var agora = new Date();
	
	var anoMax = agora.getFullYear();
	var mesMax = agora.getMonth()+1;
	var diaMax = agora.getDate();
	
	if(mesMax < 10) {
		mesMax = "0"+mesMax;
	}
	if(diaMax < 10) {
		diaMax = "0"+diaMax;
	}
	
	var idadeMaxima = anoMax+"-"+mesMax+"-"+diaMax;
	
	$("#dataNascimento").attr("max",idadeMaxima);
	$("#dataNascimento").attr("min","1900-01-01");
});