$(document).ready(function() {
var agora = new Date();
	var anoLimite = new Date(agora.getTime());
	anoLimite.setFullYear(agora.getFullYear() - 16);
	
	var anoMax = anoLimite.getFullYear();
	var mesMax = anoLimite.getMonth()+1;
	var diaMax = anoLimite.getDate();
	
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